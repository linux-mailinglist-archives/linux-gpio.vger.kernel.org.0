Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD32B3D5A72
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 15:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhGZM5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:57:13 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58873 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbhGZM5M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 08:57:12 -0400
Received: from orion.localdomain ([77.7.36.220]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M738r-1m00yO14Cl-008bjS; Mon, 26 Jul 2021 15:37:35 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     virtio-comment@lists.oasis-open.org,
        virtio-dev@lists.oasis-open.org, linux-gpio@vger.kernel.org,
        geert@linux-m68k.org, arnd@linaro.org, mst@redhat.com
Subject: [PATCH] virtio-gpio: add formal specification
Date:   Mon, 26 Jul 2021 15:37:34 +0200
Message-Id: <20210726133734.21678-1-info@metux.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jN95UFz9PJq6g+F/LrTzAceEX8awD9bR+HSmdtPmw6JnpAfNyEQ
 7Dgs8VOirMA9DYZnGdLxAJr/n0PML2iVOLHynyBGgvY71GgW/ilzWIhixGydAbeiF/2yQ1B
 9geuInpL/r+rqbK3GmUwzHR/qayxknA+IjqGSnxoKYfCsNLVVgQtwT5DgY/N/dZmlpTD1E5
 YO4KdPNGSg0SMxHciIwxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4VOkEhlLzZY=:OmyZ6FaozHIrQ1w0l9mOcA
 trOn1aqY7U3j+r8Zk6cUQj7uEC3QHYt10k90LHe3BC+bFWg1aiGoTLyb50iBuMKMNCYJhL7Qo
 gPeAfcR/dbka6rjEMRh+/kTKquVoNfLvWnarY/ZsPqZaP1ntovUa9koWF8ANvHMV5pSW4K8kt
 4D71msB8jEYW3jbh9A1b00ZoDKmnctFAKBKS/5AjbhGwI3vs9gai9RPDkr2nlMPWKgXewSZAD
 O5z7iVyWs1/V1y6hB2te8fH3NZYymYUkT6u6b/Yy8Py2C/hmsC2cXTd+4WiIPRmYHBs+Obn7D
 C3lmJfO3WELT+lC+FMH/DqYtPCYKiuYtwdO+LrIKUuipj+cnXjYwiTzFNcrtPOan7dEwIPfTl
 adRTmnTXkUBO1T+bDqUihzIj3fPSXQC4MIGtcYDLw3lGxqvPjd8Uvk7nqx3Su1gM3vp4K5Ule
 NOOS+9rQQZ5v178RwFxc9UcMW07cePGaquagwGgmoZIaKt4qd0n8xkDPJaAC/tZ2F5HmXISjS
 g/M/s4DCkI9CwLf8HpNuI5UQcTvxjp68/fr6yMOIlVTNBn9eHQYj/13LmONWHbSDE4fpZ5yck
 NQ+J+dxlkI0yNRPQG5erudFmEAAC192Y39wr1+87XDk8cnaurJoHokO+4lyS/Tmqa4qzon7pn
 tumKhNa871Hg0jJHXEJClCLe4d0ZNeIA0jD8YuMqgqX0VtvH7SqJooXzPeIqPknDqd+xmYPcz
 pOazCCf8RkAV+X/z7noYXSVUQXYR10/hclYh4qVsv38LrQlfpCCQam3AWcah1bs0uZQw3hwUj
 tYJYlcyrlJIrvgqVb6c4tUKIuYbRgwix8cPKpZRAJuiNk0BBg3p6CEe49WJN6wBKJ+BSj1X
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds specification for attaching general purpose IO (gpio) devices
via virtio. The protocol is specifically designed to be easily implemented in
software (e.g. hypervisors) as well as low end hardware (eg. silicon, FPGA,
tiny MCUs) both both device and driver end, and allows future extensions while
retaining full backwards compatibility.

Implementations for driver (Linux kernel) and device (Qemu) are publically
available and field tested since late 2020. Hardware implementations also
exist (but proprietary, cannot be published yet).

Device type ID 41 has been allocated by TC vote #3632.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

---

changes v3: * moved arbitration into an optional feature
            * clarification on feature bits vs versions
            * clarification on max concurrent requests (queue size)
            * explicit definition of error codes
            * optional IRQ masking
            * moved spec text into subdir 'devices'
            * added explaination of important design considerations

changes v2: * fixed htlatex build error with underscores in labels
            * using code listings for structs and define's
            * fixed mixed-up device/driver wording
---
 conformance.tex         |  28 ++-
 content.tex             |   3 +-
 devices/virtio-gpio.tex | 381 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 407 insertions(+), 5 deletions(-)
 create mode 100644 devices/virtio-gpio.tex

diff --git a/conformance.tex b/conformance.tex
index 94d7a06..4bdaac4 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -30,8 +30,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Sound Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / General Purpose IO Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -54,8 +55,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / IOMMU Device Conformance},
 \ref{sec:Conformance / Device Conformance / Sound Device Conformance},
 \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
-\ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance} or
-\ref{sec:Conformance / Device Conformance / SCMI Device Conformance}.
+\ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance},
+\ref{sec:Conformance / Device Conformance / SCMI Device Conformance} or
+\ref{sec:Conformance / Device Conformance / General Purpose IO Device Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -301,6 +303,15 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Device Types / SCMI Device / Device Operation / Setting Up eventq Buffers}
 \end{itemize}
 
+\conformance{\subsection}{General Purpose IO Driver Conformance}\label{sec:Conformance / Driver Conformance / General Purpose IO Driver Conformance}
+
+An General Purpose IO driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / General Purpose IO / Virtqueues}
+\item \ref{devicenormative:Device Types / General Purpose IO / Data flow}
+\end{itemize}
+
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
 A device MUST conform to the following normative statements:
@@ -550,6 +561,15 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Device Types / SCMI Device / Device Operation / Shared Memory Operation}
 \end{itemize}
 
+\conformance{\subsection}{General Purpose IO Device Conformance}\label{sec:Conformance / Device Conformance / General Purpose IO Device Conformance}
+
+An General Purpose IO device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / General Purpose IO / Virtqueues}
+\item \ref{devicenormative:Device Types / General Purpose IO / Data flow}
+\end{itemize}
+
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
 non-transitional, see \ref{intro:Legacy
diff --git a/content.tex b/content.tex
index ceb2562..a5e1ec4 100644
--- a/content.tex
+++ b/content.tex
@@ -2876,7 +2876,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 40         &   Bluetooth device \\
 \hline
-41         &   GPIO device \\
+41         &   General Purpose IO device \\
 \hline
 \end{tabular}
 
@@ -6583,6 +6583,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 \input{virtio-mem.tex}
 \input{virtio-i2c.tex}
 \input{virtio-scmi.tex}
+\input{devices/virtio-gpio.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/devices/virtio-gpio.tex b/devices/virtio-gpio.tex
new file mode 100644
index 0000000..8417acb
--- /dev/null
+++ b/devices/virtio-gpio.tex
@@ -0,0 +1,381 @@
+\section{General Purpose IO Device}\label{sec:Device Types / General Purpose IO}
+
+The virtio gpio device is a general purpose IO device that supports a variable
+number of named IO lines that may be switched either as input or output and
+in logical level 0 or 1.
+
+\subsection{Device ID}\label{sec:Device Types / General Purpose IO / Device ID}
+  41
+
+\subsection{Version}\label{sec:Device Types / General Purpose IO / Version}
+  1
+
+\subsection{Device configuration layout}\label{sec:Device Types / General Purpose IO / Device configuration layout}
+
+General purpose IO configuration uses the following layout structure:
+
+\begin{lstlisting}
+struct virtio_gpio_config {
+    __u8    version;
+    __u8    reserved0;
+    __u16   num_gpios;
+    __u32   names_size;
+    __u8    reserved1[24];
+    __u8    name[32];
+    __u8    line_names[];
+};
+\end{lstlisting}
+
+\begin{itemize}
+    \item for \field{version} field currently only value 1 supported.
+    \item the \field{line names block} holds a stream of zero-terminated strings,
+        containing the individual line names in ASCII. line names must unique.
+    \item the \field{name} field may contain a zero terminated device name
+          or serial number in ASCII.
+    \item unspecified fields are reserved for future use and should be zero.
+    \item future versions may extend this configuration space by additional fields.
+\end{itemize}
+
+\subsection{Feature bits}\label{sec:Device Types / General Purpose IO / Feature bits}
+
+\begin{description}
+\item[VIRTIO_GPIO_F_ARBITRATION (0)] line arbitration -- REQUEST and RELEASE operations.
+\item[VIRTIO_GPIO_F_IRQ (1)] IRQ control
+\end{description}
+
+\subsection{Virtqueues}\label{sec:Device Types / General Purpose IO / Virtqueues}
+\begin{description}
+\item[0] rx (device to CPU)
+\item[1] tx (CPU to device)
+\end{description}
+
+The virtqueues transport messages of the type struct virtio_gpio_msg from device to CPU or CPU to device.
+
+\subsubsection{Virtqueues}\label{sec:Device Types / General Purpose IO / Virtqueues / Message format}
+
+The queues transport messages of the struct virtio_gpio_msg:
+
+\begin{lstlisting}
+struct virtio_gpio_msg {
+    __le16  type;
+    __le16  pin;
+    __le32  value;
+};
+\end{lstlisting}
+
+\subsubsection{Message types}\label{sec:Device Types / General Purpose IO / Virtqueues / Message types}
+
+\begin{lstlisting}
+/* messages types: driver -> device */
+#define VIRTIO_GPIO_MSG_CPU_REQUEST             0x0001
+#define VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT     0x0002
+#define VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT    0x0003
+#define VIRTIO_GPIO_MSG_CPU_GET_DIRECTION       0x0004
+#define VIRTIO_GPIO_MSG_CPU_GET_LEVEL           0x0005
+#define VIRTIO_GPIO_MSG_CPU_SET_LEVEL           0x0006
+#define VIRTIO_GPIO_MSG_CPU_RELEASE             0x0007
+#define VIRTIO_GPIO_MSG_CPU_SET_IRQ             0x0008
+
+/* message types: device -> driver */
+#define VIRTIO_GPIO_MSG_DEVICE_LEVEL            0x0011
+
+/* reply mask: device sets this bit on replies (along with request's message type)
+#define VIRTIO_GPIO_MSG_REPLY                   0x8000
+\end{lstlisting}
+
+\subsubsection{Error codes}\label{sec:Device Types / General Purpose IO / Virtqueues / Error codes}
+
+If requests result in an error, the device shall respond with an appropriate
+error code, which is encoded as \textbf{negative} value in the reply message's
+\textit{value} field.
+
+\begin{lstlisting}
+/* success, no error */
+#define VIRTIO_GPIO_ERR_OK      0x0000
+/* internal fault */
+#define VIRTIO_GPIO_ERR_FAULT   0x0001
+/* requested pin does not exist */
+#define VIRTIO_GPIO_ERR_NO_PIN  0x0002
+/* communications error */
+#define VIRTIO_GPIO_ERR_COMM    0x0003
+/* configuration not supported */
+#define VIRTIO_GPIO_ERR_INVAL   0x0004
+\end{lstlisting}
+
+\devicenormative{\subsubsection}{Virtqueues}{Device Types / General Purpose IO / Virtqueues}
+
+The device MUST read from the tx queue and write to rx queue.
+
+The device MUST NOT write to the tx queue.
+
+\drivernormative{\subsubsection}{Virtqueues}{Device Types / General Purpose IO / Virtqueues}
+
+The device MUST read from the rx queue and write to tx queue.
+
+The device MUST NOT write to the rx queue.
+
+\subsection{Data flow}\label{sec:Device Types / General Purpose IO / Data flow}
+
+\begin{itemize}
+    \item all operations, except \field{VIRTIO_GPIO_MSG_DEVICE_LEVEL}, are initiated by CPU (tx queue)
+    \item device replies with the orinal \field{type} value OR'ed with \field{VIRTIO_GPIO_MSG_REPLY} (rx queue)
+    \item requests are processed and replied in the they had been sent
+    \item the number of concurrent requests is limited by the device's queue size
+    \item async notifications by the device may be interleaved with request responses
+    \item VIRTIO_GPIO_MSG_DEVICE_LEVEL is only sent asynchronously from device to CPU
+    \item in replies, a negative \field{value} field denotes an error code
+    \item in level or direction values, only bit 0 shall be used
+    \item valid direction values are: bit 0: 0 = output, 1 = input
+    \item valid line level values are: bit 0: 0 = inactive, 1 = active
+    \item CPU should not send messages with unspecified \field{type} value
+    \item CPU should ignore ignore messages with unspecified \field{type} value
+\end{itemize}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_REQUEST}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-REQUEST}
+
+Notify the device that given line number is going to be used.
+
+Only available if feature bit VIRTIO_GPIO_F_ARBITRATION is set.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & error code (0 = success) \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_RELEASE}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-RELEASE}
+
+Notify the device that given line number is not used anymore.
+
+Only available if feature bit VIRTIO_GPIO_F_ARBITRATION is set.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & error code (0 = success) \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-DIRECTION-INPUT}
+
+Set line line direction to input.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & error code (0 = success) \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-DIRECTION-OUTPUT}
+
+Set line direction to output and given line level.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & bit 0: output level (0=inactive, 1=active) \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & error code (0 = success) \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_GET_DIRECTION}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-GET-DIRECTION}
+
+Retrieve line direction.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & bit 0: direction (0=output, 1=input) or errno code \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_GET_LEVEL}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-GET-LEVEL}
+
+Retrieve line level.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & bit 0: line level (0=inactive, 1=active) or errno code \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_SET_LEVEL}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-SET-LEVEL}
+
+Set line level (output only)
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & bit 0: line level (0=inactive, 1=active) \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & bit 0: new line level or (negative) errno code \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_CPU_SET_IRQ}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-CPU-SET-IRQ}
+
+Set the IRQ mask. See \ref{sec:Device Types / General Purpose IO / IRQ handling}.
+
+Only available if feature bit VIRTIO_GPIO_F_IRQ has been negotiated.
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & IRQ mask \\
+    \hline
+    \textbf{reply:} & \\
+    \hline
+    \field{value} field: & (negative) errno code \\
+    \hline
+\end{tabular}
+
+\subsubsection{VIRTIO_GPIO_MSG_DEVICE_LEVEL}\label{sec:Device Types / General Purpose IO / Data flow / VIRTIO-GPIO-MSG-DEVICE-LEVEL}
+
+Async notification from device to CPU: line level changed
+
+\begin{tabular}{ll}
+    \hline
+    \textbf{request:} & \\
+    \hline
+    \field{line}  field: & logical line number \\
+    \field{value} field: & unused (should be zero) \\
+    \hline
+    \textbf{reply:} & \\
+    \field{value} field: & bit 0: line level (0=inactive, 1=active) \\
+    \hline
+\end{tabular}
+
+\devicenormative{\subsubsection}{Data flow}{Device Types / General Purpose IO / Data flow}
+
+The device MUST reply to all driver requests in they had been sent.
+
+The device MUST copy the \field{line} field from the request to its reply.
+
+Except for async notification, the device MUST reply the orignal message type, but with the highest bit set
+(or'ed with VIRTIO_GPIO_MSG_REPLY)
+
+In case of error the device MUST fill an \textbf{negative} value into the \field{value} field.
+
+On switching to output, the device SHOULD set internal output level before switching the line to output.
+
+The device SHOULD send VIRTIO_GPIO_MSG_DEVICE_LEVEL message for a particular line when it is in input
+direction and line level changes.
+
+\drivernormative{\subsubsection}{Data flow}{Device Types / General Purpose IO / Data flow}
+
+The driver MUST NOT send VIRTIO_GPIO_MSG_DEVICE_LEVEL and MUST NOT set the highest bit in the message type.
+
+The driver MUST NOT send messages with types not defined in this specification.
+
+The driver MUST treat all negative values of the \field{value} field as errors, regardless whether
+the actual codes are explicitly defined in this specification.
+
+\subsection{IRQ handling}\label{sec:Device Types / General Purpose IO / IRQ handling}
+
+IRQ handling is only enabled if feature VIRTIO_GPIO_F_IRQ had been negotiated -- in
+this case only explicitly configured events are sent via VIRTIO_GPIO_MSG_DEVICE_LEVEL
+message. Otherwise level state changes are sent unconditionally.
+
+IRQ masking is configured via VIRTIO_GPIO_MSG_CPU_IRQ message, using the following
+(or'ed) mask bits:
+
+\begin{lstlisting}
+/* fire on levels */
+#define VIRTIO_GPIO_IRQ_HI      0x0001
+#define VIRTIO_GPIO_IRQ_LOW     0x0002
+
+/* fire on edge */
+#define VIRTIO_GPIO_IRQ_RAISING 0x0004
+#define VIRTIO_GPIO_IRQ_FALLING 0x0008
+
+/* enabled */
+#define VIRTIO_GPIO_IRQ_ARMED   0x0016
+#define VIRTIO_GPIO_IRQ_ALWAYS  0x0032
+\end{lstlisting}
+
+The actual kind of IRQ fired is determined on whether / how the line state changed
+from the previous message.
+
+IRQs are fired only, if either \textbf{ARMED} or \textbf{ALWAYS} are set. The
+\textbf{ARMED} flag is automatically cleared on IRQ signal, thus needs explicit
+rearming / unmasking.
+
+\devicenormative{\subsubsection}{IRQ handling}{sec:Device Types / General Purpose IO / IRQ handling}
+
+The device MUST maintain the IRQ masking state independently from other states like
+line direction or line states.
+
+When VIRTIO_GPIO_F_IRQ is negotiated, all irq mask registers need to be cleared,
+so no IRQs can occour, until explicitly enabled.
+
+\subsection{Future versions}\label{sec:Device Types / General Purpose IO / Future versions}
+
+\begin{itemize}
+    \item adding new functionality should be done by adding optional feature bits, if possible --
+          new versions shall only be introduces when feature bits are not sufficient
+    \item future versions must increment the \field{version} value
+    \item the basic data structures (config space, message format) should remain
+          backwards compatible, but may increased in size or use reserved fields
+    \item device needs to support commands in older versions
+    \item CPU should not send commands of newer versions that the device doesn't support
+\end{itemize}
+
+\subsection{Design considerations}\label{sec:Device Types / General Purpose IO / Design considerations}
+
+This specification has been layed out for being easy to implement in \textbf{hardware},
+silicon or FPGA, with a minimum number of required gates, in order to save chip space,
+power consumption and heat emissions, but also being easy to emulate in software, on both
+device and driver side.
+
+For that reason, data structures and signaling protocols have been designed to be very
+simple (e.g. fixed buffer layouts), and features that may not be always present or needed
+(e.g. IRQs) are explicitly negotiated by optional feature bits.
+
+Signal flow has been designed to use a simple (in-order) request-response scheme with
+separated tx/rx queues for all driver initiated transactions, that the device replies
+by just flipping a few bits and sending the packet back.
+
+The subset of virtio used here can also be easily implemented by very low level means
+like serial lines.
-- 
2.20.1

