---
pdf_options:
  margin: 20mm
---

# ATS 用户手册

**Echo ATS 声学测试系统安装、配置和操作完整指南**

---

![ATS 前面板](/images/ats/ats-front.jpg)

![ATS 后面板](/images/ats/ats-back.jpg)

---

> **版权所有 © 2026 Echo Digital Audio Corporation。保留所有权利。**
>
> 未经出版商书面许可，不得以任何形式或任何方式（包括影印、录制或任何信息存储和检索系统）复制或传播本手册的任何部分。
>
> Echo Test + Measurement 和 Echo ATS 是 Echo Digital Audio Corporation 的商标。Windows 是 Microsoft Corporation 的商标。macOS、Mac 和 Macintosh 是 Apple, Inc. 的商标。

---

<div style="page-break-before: always;"></div>

### 三年有限保修

Echo 保证其产品自购买之日起三年内无制造缺陷。任何在有效 Echo 新产品保修范围内的产品——如果损坏不是由所有者误用或滥用造成的（请参阅下面的保修除外条款）——将由 Echo 免费修理或更换。**请参阅完整的 Echo 保修政策以获取更多信息。**

### 法规合规信息

Echo Digital Audio 已遵守并且本产品符合（如适用）欧盟关于限制有害物质的指令 2002/95/EC (RoHS)，以及加利福尼亚州法律中涉及 RoHS 的以下部分，即《健康与安全法典》第 25214.10、25214.10.2 和 58012 条；《公共资源法典》第 42475.2 条。

与所有旧电气和电子设备的处置一样，本产品不得作为普通家庭垃圾处理。相反，应将其交给适用的电气和电子设备回收收集点。

<p align="center">
  <img src="/images/ats/CE-logo-small.png" alt="CE 标志"> <strong>CE 合规</strong> &nbsp;&nbsp;
  <img src="/images/ats/RoHS-logo-small.png" alt="RoHS 标志"> <strong>RoHS</strong> &nbsp;&nbsp;
  <img src="/images/ats/not-trash-logo-small.png" alt="WEEE 标志"> <strong>WEEE</strong>
</p>

---

## 重要安全说明

> **警告**

1. **阅读说明** — 在操作本产品之前，请阅读所有安全和操作说明
2. **遵守警告** — 遵守 Echo ATS 和本手册中的所有警告
3. **防潮保护** — 请勿在水源附近安装或操作（水槽、潮湿的地下室等）
4. **防热保护** — 远离加热器或散热器等热源
5. **电源要求** — 仅使用规定的稳定交流电源运行。在容易发生雷电或嘈杂的工厂环境中使用电涌保护器
6. **正确接地** — 仅使用提供的接地插头。请勿改装插头。确保插座正确接地
7. **电源线安全** — 布置电源线以避免损坏插头、插座和电线出口点
8. **禁止用户自行维修** — 内部没有用户可维修的部件。打开机箱会使保修失效，并使您暴露于危险电压

**如需维修服务，请联系您的授权维修中心。**

---

<div style="page-break-before: always;"></div>

# 1. 简介

Echo ATS 测试系统是符合 USB 2.0 标准的音频测试平台，兼容 Windows 计算机上的 ASIO 和 WASAPI 驱动程序、Macintosh (Mac) 计算机上的 Core Audio 以及 Linux 计算机上的 ALSA。当与运行测试软件的计算机配合使用时，ATS 可形成一个完整的系统，用于测试消费类和专业产品中的数字和模拟音频电子设备及声学。Echo ATS 产品非常适合需要持续测试的大批量生产环境。

Echo ATS 将多种测试设备的功能集成到单一的集成设备中，以提高可靠性并降低成本。除音频测试外，它还能够通过其 GPIO 接口控制测量夹具。

![Echo ATS 测试系统](/images/ats/ats-front.jpg)

<p align="center">
    <em>图 1：Echo ATS 测试系统</em>
</p>

---

<div style="page-break-before: always;"></div>

# 2. 安装

## 硬件设置

### 步骤 1：连接电源

将电源线连接到 IEC C14 电源插座。可以使用锁定和非锁定电缆。当电源接通且 ATS 正常运行时，前面板上的 LED 灯为绿色。

> **注意：** 通用交流输入接受 100 – 240 VAC，50 或 60 Hz。***ATS、连接到 ATS 的设备以及测试计算机必须全部连接到同一个带电涌保护的电源插座。***

### 步骤 2：连接 USB

将随附的 USB-C 电缆连接到 ATS 背面的 USB-C 连接器，另一端连接到主机计算机。

> **提示 - 安装：** ATS 底部包含用于安全安装的安装孔。请参阅[安装孔图纸](https://github.com/parkermbrandon/mintlify-docs/releases/download/ats-v5.0.2/ATS.Mounting.Holes.pdf)了解尺寸和孔位。

---

## 驱动程序安装

### Windows 驱动程序安装

下载 ATS Windows 驱动程序并运行安装程序。

**安装程序包括：**
- ATS 控制面板应用程序
- 最新固件更新
- ASIO 驱动程序（显示为"ASIO Echo ATS"）
- 命令行实用程序

> **注意：** 虽然 Windows 10/11 将使用内置的 WASAPI 驱动程序自动识别 ATS，但我们强烈建议安装 Echo 软件以获得：
> - 控制面板功能
> - 固件更新功能
> - ASIO 驱动程序支持（大多数专业音频应用程序需要）

### macOS 设置

macOS 通过 Core Audio 内置了对 USB 音频的支持。每当 ATS 通电并连接到 Mac USB 端口时，都会自动检测到它。

**无需安装驱动程序** — ATS 将立即出现在您的音频应用程序中。

> **注意：** 虽然不需要驱动程序，但您可能需要从 Echo 下载 macOS 命令行实用程序以进行程序控制：[ATS 下载](https://support.echotm.com/ats/downloads)

---

<div style="page-break-before: always;"></div>

## 第三方测试和测量软件

Echo ATS 测试系统可通过 Echo ATS ASIO 驱动程序与各种第三方测试和测量软件配合使用。由于 ASIO 是数字接口，硬件和软件之间的所有电平都以数字值进行通信，使用模拟接口时不会固有地转换为实际的模拟 I/O 值。为了正确进行转换，软件需要知道正确的缩放因子，该因子定义了模拟电压和数字满量程电平 (0 dBFS) 之间的关系。不同类型的输入和输出的缩放因子通常不同。例如，线路电平输出的缩放因子将不同于扬声器输出，因为扬声器输出的最大电压更大。

虽然可以通过使用校准电压表进行实验来确定缩放因子，但我们为您提供了适用于我们硬件的正确缩放因子。您只需将这些值输入到您所使用的测量软件的相应设置中即可。

<br></br>

<table>
<tr>
<td valign="top">

**输出缩放因子**

| I/O 类型 | 缩放因子 |
| :--- | :--- |
| 线路（非平衡） | 4.0 V/FS |
| 线路（平衡） | 8.0 V/FS |
| 耳机 | 3.0 V/FS |
| 功放/扬声器 | 9.545 V/FS |

</td>
<td valign="top">

**输入缩放因子**

| I/O 类型 | 缩放因子 |
| :--- | :--- |
| 麦克风-线路 | 161.6 mFS/V |
| 耳机阻抗 VMON | 333.3 mFS/V |
| 耳机阻抗 IMON * | 8.0 FS/V |
| 扬声器阻抗 VMON | 80.80 mFS/V |
| 扬声器阻抗 IMON * | 161.6 mFS/V |

\* IMON 测量通过 0.1Ω 检测电阻的电流

</td>
</tr>
</table>

---

<div style="page-break-before: always;"></div>

# 3. ATS 控制面板

## 概述

控制面板控制和监视以下 ATS 硬件功能：

* 模拟输入和输出增益
* 麦克风恒流供电
* TEDS 数据
* 电平表
* 固件更新
* WASAPI 和 ASIO 驱动程序设置
* 时钟源和状态
* 诊断日志记录和目录

以下文本描述了选项卡和下拉菜单。如果尚未安装控制面板，请参阅 *Echo* 驱动程序软件部分。**控制面板仅用于 ATS 硬件控制和计量。它不执行任何音频分析。**

## 通道选项卡

Echo 声学测试系统的输入和输出可配置用于测试不同类型的设备（即声学、线路电平、耳机或扬声器）。当您配置 ATS I/O 以测试不同类型的设备时，它会根据所需的设置调整相对电压和相位。

![ATS 控制面板通道选项卡](/images/ats/control-panel.png)

<center>
    <em>图 2：通道选项卡</em>
</center>

---

<div style="page-break-before: always;"></div>

# 4. 模拟输出

## 概述

ATS 提供四个可配置的模拟输出通道，具有三种针对不同测试场景优化的不同操作模式。通道 1 和 2 可在所有三种模式之间完全配置，而通道 3 和 4 是专用功放输出。

![ATS 控制面板模拟输出概述](/images/ats/cc-analog-out-overview.png)

<center>
    <em>图 3：通道选项卡 - 模拟输出</em>
</center>

## 输出配置

每个通道的输出电平以水平条形图和数字两种方式显示。使用下拉控件选择所需的单位（dBFS、百分比或电压）。

> **危险 - 模式选择：** 在通道 1 和 2 上，单击 **LINE**、**AMP** 或 **HP** 以更改输出模式。更改输出模式会调整输出端口的相对电压和相位。

### 输出模式规格

| 模式 | 配置 | 直流偏移 | 最大输出 | 接地连接 |
| :--- | :--- | :--- | :--- | :--- |
| **AMP** | 浮动差分 | 7.5V | 12.4Vpp | 请勿连接 |
| **HP** | 单端 | 0V | 8.5Vpp | 必需（共享） |
| **LINE** | 平衡 | 0V | 22.6Vpp | 可选 |

<br></br>

---

<div style="page-break-before: always;"></div>

## 功放/扬声器输出（AMP 模式）

AMP 模式专为扬声器、驱动器和其他声学换能器的声学测量而设计。此模式提供浮动差分输出，功率足以直接驱动扬声器。

<table>
<tr>
<td valign="top">

**技术规格：**
- 配置：浮动差分
- 直流偏置：(+) 和 (-) 端子均为 7.5V
- 最大输出：27.0 Vpp
- 可用通道：通道 1-4（通道 3-4 仅限 AMP）

</td>
<td valign="top">

**应用：**
- 扬声器和驱动器测试
- 测量麦克风
- 耳模拟器和人工头
- 执行器和嘴模拟器

</td>
</tr>
</table>

> **警告：** 功放输出是浮动的，不参考接地。请勿连接接地端子或创建从输出到接地的任何低阻抗路径 - 这将导致功放关闭。故障消除后，功放将自动复位。

![AMP 输出连接](/images/ats/amp-output.png)

<center>
  <em>图 4：仅跨接 + 和 - 端子连接扬声器。请勿连接接地端子。</em>
</center>

![AMP 模式控制面板](/images/ats/cc-analog-out-amp.png)

<center>
    <em>图 5：显示输出 1-4 配置为 AMP 的控制面板</em>
</center>

---

<div style="page-break-before: always;"></div>

## 耳机输出（HP 模式）

HP 模式针对测试有线耳机、头戴式耳机、耳塞和听力保护设备进行了优化。此模式提供具有共享接地的单端输出，非常适合立体声耳机测试。

<table>
<tr>
<td valign="top">

**技术规格：**
- 配置：单端
- 直流偏移：0V
- 最大输出：8.5Vpp
- 接地：必需（通道之间共享）
- 可用通道：仅通道 1-2

</td>
<td valign="top">

**应用：**
- 耳机和耳塞测试
- 头戴式耳机声学测量
- 听力保护设备测试
- 阻抗测量

</td>
</tr>
</table>

> **注意：** HP 模式自动配置输出以实现具有公共接地的正确左/右声道分离，符合标准耳机接线惯例。

![耳机输出连接](/images/ats/headphone-output.png)

<center>
  <em>图 6：在 HP 模式下连接的耳机（共享接地）</em>
</center>

![HP 模式控制面板](/images/ats/cc-analog-out-hp.png)

<center>
  <em>图 7：显示输出 1-2 配置为 HP 的控制面板</em>
</center>

---

## 线路电平输出（LINE 模式）

LINE 模式提供平衡输出，用于与专业音频设备接口和进行电气测量。此模式提供最高电压输出，并通过平衡连接实现出色的噪声抑制。

<table>
<tr>
<td valign="top">

**应用：**
- 专业音频设备测试
- 平衡线路连接
- 单端连接（仅使用 + 和接地）
- 接地隔离测量

</td>
<td valign="top">

**技术规格：**
- 配置：平衡差分
- 直流偏移：0V
- 最大输出：22.6Vpp（平衡），11.3Vpp（非平衡）
- 接地：可选
- 可用通道：仅通道 1-2

</td>
</tr>
</table>

> **注意：** 对于单端（非平衡）连接，连接到 + 和接地端子，- 端子保持未连接状态。

![线路输出连接](/images/ats/line-outputs.png)

<center>
  <em>图 8：LINE 模式连接到 XLR（显示平衡连接）</em>
</center>

![LINE 模式控制面板](/images/ats/cc-analog-out-line.png)

<center>
  <em>图 9：显示输出 1-2 配置为 LINE 的控制面板</em>
</center>

---

<div style="page-break-before: always;"></div>

# 5. 模拟输入

## 麦克风/线路输入

带有 BNC 连接器的输入可用于连接外部极化或预极化恒流 (CCP/IEPE/ICP, 4 mA) 麦克风，或非平衡线路电平输入。输入增益控制、恒流供电、直流耦合和 TEDS 读取可在每个输入端获得，并通过 ATS 控制面板进行软件控制。

麦克风/线路输入设计用于适应非常宽范围的输入电压，从极低电平的动圈麦克风一直到线路电平输入。为了覆盖如此宽的电压范围，提供了五个输入增益级别（+0 dB、+10 dB、+20 dB、+30 dB、+40 dB）。增益设置可针对每个通道单独调整。请记住，将输入增益设置得更高也会放大本底噪声，因此最佳做法是使用特定应用所需的最低增益设置。这将为测量提供最佳动态范围。

![数字输入电路](/images/ats/digital-in-circuit.png)

<center>
  <em>图 10：单个输入通道的简化电路图</em>
</center>

### 输入通道选项卡

输入通道同样显示在通道选项卡的右侧。每个通道的输入电平以水平条形图和数字两种方式显示。使用下拉控件选择所需的单位。

麦克风/线路输入包含以下附加控件：

**增益：** 设置增益为 +0 dB、+10 dB、+20 dB、+30 dB 或 +40 dB，以适应各种信号电平。

**TEDS：** 显示连接的麦克风报告的 TEDS（传感器电子数据表）信息（如果麦克风支持）。有关更多详细信息，请参阅下面的 TEDS 部分。

**CC：** 切换恒流供电 (CCP/IEPE/ICP) 以为预极化测量麦克风供电。

**DC：** 切换直流耦合

单击脱字号以展开或折叠每种模块类型的通道显示。在折叠视图中，仅显示条形图。

![模拟输入选项卡](/images/ats/cc-analog-inputs.png)

<center>
  <em>图 11：通道选项卡 - 模拟输入通道 1 - 8</em>
</center>

---

<div style="page-break-before: always;"></div>

# 6. 数字 I/O

ATS 在后面板的 BNC 连接器上包含 SPDIF 数字音频输入和输出。系统提供两个输入通道和两个输出通道，可与模拟 I/O 同时运行。

### 规格

数字接口使用消费级 SPDIF 格式 (IEC60958)，具有 24 位分辨率，支持从 44.1 kHz 到 192 kHz 的标准采样率。SPDIF 信号是自时钟的，从数字流本身提取时序。

数字通道映射到 ASIO 驱动程序为：

* 输入：通道 9 和 10
* 输出：通道 5 和 6

### 数字 I/O 电平表

在通道选项卡中，数字输入和数字输出部分显示 Dig 1 和 Dig 2 通道的实时电平。电平以 dBFS 或百分比显示。

<p align="center">
  <img src="/images/ats/cc-digital-in.png">
</p>
<center>
  <em>图 12：通道选项卡 - 数字输入通道</em>
</center>

<p align="center">
  <img src="/images/ats/cc-digital-out.png">
</p>
<center>
  <em>图 13：通道选项卡 - 数字输出通道</em>
</center>

<br></br>

选项选项卡包含数字 I/O 下拉菜单，可选择：

* SPDIF 模式：标准数字音频操作
* 字时钟模式：同步输入/输出

---

<div style="page-break-before: always;"></div>

## 选项选项卡

选项选项卡包含有关已连接 ATS 测试系统的信息，并允许设置各种配置选项。其控件和指示器如下所述。

![ATS 控制面板选项选项卡](/images/ats/cc-options-tab.png)

<center>
  <em>图 14：选项选项卡</em>
</center>

### 字时钟模式

从数字 I/O 下拉菜单中选择时，ATS 将数字 I/O BNC 连接器配置为字时钟操作。时钟可以从外部源（字时钟）接收，也可以由 ATS（内部）生成，用于同步多个音频设备。在字时钟模式下，SPDIF 输入和输出通道被禁用。

![数字 I/O 下拉菜单](/images/ats/option-tab-digital-io.png)

<center>
  <em>图 15：选项选项卡 - 数字模式和时钟源</em>
</center>
<br></br>


选择内部时，ATS 在数字输出 BNC 连接器上以 ASIO 驱动程序中选择的采样率生成字时钟信号。此输出可用于将其他音频设备同步到 ATS。

选择字时钟时，ATS 锁定到应用于数字输入 BNC 连接器的外部字时钟信号。ATS 将此信号用作其时钟参考，采样率由传入字时钟的频率决定。

当存在字时钟信号时，选项选项卡显示检测到的输入频率。75Ω 终端选项确保正确的阻抗匹配。

![字时钟选项](/images/ats/option-tab-digital-io-word-clock.png)
<center>
  <em>图 16：选项选项卡 - 数字模式和时钟源 - 已选择字时钟</em>
</center>

### 设备

* **序列号：** 设备的唯一序列号。这也可以在设备底部找到。

* **固件：** 显示当前固件版本，并允许您手动更新或恢复到出厂版本。

* **自动更新固件：** 选中后，如果控制面板包含比已安装版本更新的版本，将提示您更新固件。

* **日志记录：** 启用诊断日志记录。除非 Echo 支持人员要求，否则通常不需要启用日志记录。

* **日志目录：** 存储日志文件的目录。

### 时钟

* **源：** 选择时钟源为内部（ATS 的内置晶体振荡器）。

* **采样率：** 显示在测量软件中选择的 ASIO 时钟速率。

### 控制面板

* **ATS 连接时显示窗口：** 当 ATS 测试系统连接时显示控制面板窗口。

* **显示系统托盘图标：** 运行时在系统托盘中显示控制面板图标。

* **GPU 加速渲染：** 选中后，允许 GPU（显卡）从 CPU 卸载重绘控制面板电平表的任务。

### 驱动程序

* **版本：** 当前安装的驱动程序版本。

* **ASIO 名称：** 显示 Echo ASIO 驱动程序的名称，如测量软件中所示。

* **Windows 系统音频 (WASAPI)：** 启用 Windows WASAPI 音频驱动程序。除非您运行的软件仅支持 WASAPI 而不支持 ASIO，否则请取消选中此项。

---

## 文件菜单

<p align=center>
  <img src="/images/ats/file-help.png">
</p>

<center>
  <em>图 17：文件菜单</em>
</center>
<br></br>

文件菜单允许您打开和保存会话。ATS 会话将所有当前硬件设置存储在文本文件中，可用于将硬件重置为以前的状态。

此外，ATS 命令行应用程序可以读取会话文件，因此您可以完全配置 ATS，将配置保存为会话，然后使用单个命令行调用加载所有这些设置。

通常不需要直接编辑会话文件，因为构建它的最简单方法是根据需要设置控制面板，然后保存会话。但是，它可以在文本编辑器中轻松编辑。

---

<div style="page-break-before: always;"></div>

### TEDS

单击 TEDS 按钮时，将显示 TEDS 数据窗口。如果连接的麦克风不支持 TEDS，则将显示"未找到 TEDS 设备"消息而不是数据。

<p align="center">
  <img src="/images/ats/teds-small.png" alt="TEDS 信息">
</p>

<center>图 18：TEDS 数据窗口</center>
<br></br>

TEDS 数据不会自动传输到音频分析软件——必须将其复制粘贴或手动输入到相应的字段中。通过单击每行右侧的图标可以轻松复制数据。

灵敏度默认以伏特/帕斯卡为单位显示。某些音频测试软件，例如 Audio Precision 的 APx500 Flex，要求以帕斯卡/伏特（也称为"缩放因子"）为单位输入灵敏度数据。选中底部的"显示倒数单位"复选框将把"参考条件下的灵敏度"单位切换为帕斯卡/伏特。

---

<div style="page-break-before: always;"></div>

## 阻抗测量

ATS 提供阻抗测量功能，用于在不同频率下表征扬声器、耳机、驱动器和其他负载。此功能在使用输出 1 的 LINE 和 AMP 输出模式下均可工作。阻抗测量仅在输出 1 上可用。

### 工作原理

阻抗测量系统使用四线（开尔文）测量技术：

**步骤 1：电压监测 (VMON)**
输入 3 直接在输出端子处测量电压

**步骤 2：电流监测 (IMON)**
输入 4 通过内置 0.1Ω 精密检测电阻测量电流

**步骤 3：阻抗计算**
可以使用欧姆定律计算阻抗：Z = V/I

> **注意：** 电流检测电阻永久连接在输出 1 的正 (+) 端子串联中，外部不可访问。

### 配置

**步骤 1：连接被测设备**
使用三针连接器（+、- 和接地，根据需要）将被测设备连接到输出 1

**步骤 2：打开控制面板**
导航到 ATS 控制面板中的选项选项卡

**步骤 3：启用阻抗模式**
在设备部分，单击 **阻抗启用** 复选框以激活阻抗测量

<p align=center>
  <img src="/images/ats/impedance-enable.png">
</p>

<center>
  <em>图 19：选项选项卡 - S/PDIF 数字模式下的设备</em>
</center>
<br></br>

**步骤 4：验证配置**
阻抗模式激活时：
- 输入 3 切换到 VMON（电压监测）
- 输入 4 切换到 IMON（电流监测）
- 在此模式下，两个 ADC 通道都专用于阻抗测量

<p align=center>
  <img src="/images/ats/vmon-imon.png">
</p>

<center>
  <em>图 20：显示阻抗模式下输入 1 和 2 的通道选项卡
</center>
<br></br>

> **注意 - 限制：** 阻抗测量仅在输出 1 上可用。不在阻抗模式下时，输入 3 和 4 作为标准麦克风/线路输入运行。

<p align=center>
  <img src="/images/ats/impedance-circuit.png">
</p>

<center>
  <em>图 21：显示 VMON 和 IMON 配置的简化电路图</em>
</center>
<br></br>

---

<div style="page-break-before: always;"></div>

## Aux (GPIO)

ATS 具有 4 个 TTL 电平输入和 4 个开漏 TTL 电平输出，能够在母头 9 针锁定 D-sub 连接器上吸收高达 250mA 的电流。它们允许在程序控制下发送和接收开关闭合信息，用于与其他测试或显示设备接口。此功能的一个简单应用是根据测试结果点亮通过/失败指示灯条。导航到控制面板中的 Aux 选项卡以监视和控制辅助输入和输出。

<p align=center>
  <img src="/images/ats/aux-control.png">
</p>

<center>
  <em>图 22：AUX 选项卡</em>
</center>
<br>

<center>
<table>
<tr>
<td valign="middle" align="center">

  **DB9 连接器引脚排列**

  | **功能** | **引脚** |
  | :---: | :---: |
  | Aux Out 1 | 7 |
  | Aux Out 2 | 2 |
  | Aux Out 3 | 6 |
  | Aux Out 4 | 1 |
  | Aux In 1 | 5 |
  | Aux In 2 | 9 |
  | Aux In 3 | 4 |
  | Aux In 4 | 8 |
  | 接地 | 3 |
</td>
<td valign="top">

  <img src="/images/ats/db9-female-pinout.png" alt="DB9 引脚排列"><br>
  <center><em>图 23：母头 DB9 引脚排列</em></center>

</td>
</tr>
</table>
</center>

---

## 联系我们

如需信息或支持，请联系 Echo：https://echotm.com/contact/
