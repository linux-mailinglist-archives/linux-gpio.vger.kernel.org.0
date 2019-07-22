Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F6F6F915
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfGVF4C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:02 -0400
Received: from mout.gmx.net ([212.227.17.20]:59807 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727336AbfGVF4C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774935;
        bh=QSYvua6cFBBgHcG13EjnKxqnh2n/IRF+zYxZbCTi1YM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OFZ7iXgOrXm+fm0HqfkHaTwKPyQmfRGaas2f7x5QNYuF8Ezqo+zlZFgNnTEeAuZ5m
         DkatNLGVUO/TWiymdyiXwEmEMALRubzvELTvKHarx0DMNJUCubn0D5DqxbA2Odr83l
         +EgjLO0pzvsx0HOEBaCRpjmir8ZWZa5G8Zd7EYGw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mb31L-1i9Qr608PT-00Kklu; Mon, 22
 Jul 2019 07:55:35 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 01/18] ARM: bcm283x: Reduce register ranges for UART, SPI and I2C
Date:   Mon, 22 Jul 2019 07:54:32 +0200
Message-Id: <1563774880-8061-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:tBeg4e+PRnl9rhRHHJIkca6IIEKDr2SDF7z8y6MNYTuSjVA/knb
 usgo3t6iV7x8lOIxnZ7j6rH9vvkQBBcpfLffwvUxYVycAJiML//sV6K0/6P7gh2mXfXS06c
 qfbDA2NiInjIkpm4z6XPnOSq7rTYOVmyFmZA8nxY/aB1xlS/MKDzA1HMRNw3UD4+lB3h8oq
 NBYi4DmOejYZhNJVjgHvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ATciYaqYyA=:EVrpHXvoNnbFWY+imnXVTk
 J4iXTc9ih4iKjlhbix48xG0/Ld61JMJnTO3aIOyLuwlTr+Q4ZAPck5xtaivuPDDMdG8Fx83af
 I7F6hwQavYO5o1Vs0/gaMtJ/R0Pox35t/OGq7TTFEQZTQC4iEyj/m/zwGJW+4UCQULC44wdkc
 U2hxIdtAinz0nwS3fdoEPRTS74v5NrJsHHzS5HNxuiIPQfwKVBwQvYlE49DA9E7PjgbunniSj
 gvdMZj63FPH+2gVjDfQL4FrjyMm/A9Bv5jJrmV2y1sfwb3haJYNlALN0hwu16EOr4r2FG9M2W
 ce2r4KcN370Q3+FO2mZluQwa9V/p0JAN4SXCkH5sf/d4EpEbXeSBETmvdpiwR7DKGRdlgVVl7
 HkJkW4VsAEZIL/SeX+noy5u412a7ZGizJsokxc4wdq6cNW2c6GBjHY/h/POwHbWvBuR4ibN5d
 XX9eGLEj8C35oimb2/wgbEcN231iyyb888R4FxQiY44B3mIzS6fnA+NWe58AdKeY/d96itpIx
 H6TjGcuMYn/ijhThLsZDvCU/J7hrWgw+Bw9IZLBhTBNZuTeLSFL4QqqnQ9L0YpWsIpZuFVwwe
 fHiDMqlSqWHvyaK3F5DbONfZis5Z1UNK8MUrOV6YSOI86CcbMkSZ5bmQ1L5Wf/1rjvT9jtC0N
 7GAnyEkFqOuixRWhYa0QrlqgCSeKB0QGZG7Ru5fAO6YAgOkXFF7wJUFZEzL6qbtclcXQBBAec
 nXd3SKSjFqysGLrmzSXLre8BQIROtIEXinSwdg/RL9tN2Gy0LdH0cwQ+xfkHfoCFWquwIF89w
 GoM3l2MVzF5cNkR+YDrbHV0TkcJC9AO7bbWbPT5iCwvJ/myOUSZppFr+HgoVsXIhI86oqaIDl
 IgukA7nkwH2FH7xTrSrSe69aaLLN+BcjN3CHGjrnW0K73SQCBlk0otssjZZcaJCOGYqE06vbh
 3+5xzMmkqi+Hhg7qQNP087J0u119KNtiEXxT7Z24jBr6sivX6QUcExmvHMP14KfVMBR4n/2/b
 sjBRAbmpPv4lIEuK2TDQGaR57wzOkuX5c2CJDGSst5kGXF/gAU5tKIptAxE7Ip9CCTVQs61S2
 y+2kdLlBAbfcjg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The assigned register ranges for UART, SPI and I2C were too wasteful.
In order to avoid overlapping with the new functions on BCM2711
reduce the ranges.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/bcm283x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dt=
si
index 4b21ddb..2d191fc 100644
=2D-- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -397,7 +397,7 @@

 		uart0: serial@7e201000 {
 			compatible =3D "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
-			reg =3D <0x7e201000 0x1000>;
+			reg =3D <0x7e201000 0x200>;
 			interrupts =3D <2 25>;
 			clocks =3D <&clocks BCM2835_CLOCK_UART>,
 				 <&clocks BCM2835_CLOCK_VPU>;
@@ -428,7 +428,7 @@

 		spi: spi@7e204000 {
 			compatible =3D "brcm,bcm2835-spi";
-			reg =3D <0x7e204000 0x1000>;
+			reg =3D <0x7e204000 0x200>;
 			interrupts =3D <2 22>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
 			dmas =3D <&dma 6>, <&dma 7>;
@@ -440,7 +440,7 @@

 		i2c0: i2c@7e205000 {
 			compatible =3D "brcm,bcm2835-i2c";
-			reg =3D <0x7e205000 0x1000>;
+			reg =3D <0x7e205000 0x200>;
 			interrupts =3D <2 21>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
 			#address-cells =3D <1>;
=2D-
2.7.4

