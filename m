Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5694A2E79
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jan 2022 12:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241710AbiA2L5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 06:57:35 -0500
Received: from mout.gmx.net ([212.227.15.15]:42461 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241314AbiA2L5e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 29 Jan 2022 06:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643457444;
        bh=LQ/D/czaqWi5t/2mji1EXwKk67vZOE9T5soDAh7nwmA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=SO1nnQnA8zBwlraHeZbETYGKO/KujBtjPsWAxdD90eZ80L9vJ/LkoE/kcNPe4u7fw
         3uMbJFDlpZWEBJLukDMeZr3eUjWVog2a2A3fMhZ28QuPI0EdaQpvPR9gSu56nWKz4W
         vGHrKrq1al+R4C+Mx85odoxQW+nRwGY5wuqkbSYg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1OXZ-1mGok32OAl-012psc; Sat, 29
 Jan 2022 12:57:24 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Date:   Sat, 29 Jan 2022 12:52:19 +0100
Message-Id: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2IjlardMyLFrtr1FjGEBDyjH8nrE1nBJ6Ibpk0PAWi2YuMn5zMr
 JwFMIl83ycDgQgzkSra47Gyd7Lr4e+YhaxsE/yATZdDJGxwzDcyPVbOr712A4jx5NUfOoOn
 VwnKHMOYn2xmiCV6xhpHiEgPkxeMF1y4lW/9Ne8WGyoTB1x0r78STkTOhnXnjh54aQ/rXaD
 E99XVcYLpfLV64QoGDUrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Qbvq6uQgQI=:PPBL8jJ0sH0pa73bp4hEs1
 3qiJPWjyIU4f4si9otbCG4AVXN9P2MMoG3RyIOMBedNUJbBINjMLWPeWq/U38Ym8IqdH4mLFR
 MUoX/Rk2USPppNWz/SNL8GoQ9cRPlDxadeSxXn0bLuTYS525fmwe7mIN/gW9MDD0Gs/su0Nv7
 swvXGxRPuXCtJlsVjwRMBjoZIT3SBwnehk5O/l7UhcliBfOL54WjP9DVUqejrK+MdVNdnro4k
 QLfZ1hzS1ETWoRsZ0Xu6dTvzrY0x5GJKf5nRfWaEIrXU0W+mAVk4bmKVz+Gd+x/p5rgZxWzOa
 RYhzXA22tUqpro1SQr1nU+gAhCA55r5Byck08gg0I5VbrYfy9XUPrSbCyvUfYimVow75Gprhv
 /JZz9xzWZsM92tEM8x4/m1PPBIpuGBeAAf2ZtDEaii5DVUNcDNudpOjsBzKAx806BECi4A36E
 VO/Rehii6gHE7ul5i6U48TKSq+Ci8eKbTSrplaBvoJcgQRk/q3hN+JvBZootTodzLweKKlBER
 v3cA+HijpaPXbtY84ro7hWOE+Al/FjktJ9syv0ms9BAdUqjXxC+LjT3XJ9OL/sbj4fFoSTnXo
 kzEyoH8ICQ8GfN7Rb0O/IvAuX4JzKouzBfua7HazBGbKvcJcGl+fzHYofIypOfPIhcWbiTuVh
 0tki4KKk/PMFDw2PCNt3kc5SGa5A6DxK/xsKM23lmwRCPX9CQApnZkwBFlcyK+OHnLQ59UKV5
 neREFgbk4dkPJqoeFJUVWy394DZD4j5JW7CxfPkdEf2jY184yHUFnOouCXDnkT4EMlChzqAwu
 U1MdBZiVHeBU8i4UXEyG1v6AszPdPC+wsPxsPnNBA5WiAbJXBktD3N9j+yLqJYnZ3UlP4iMzv
 E9Qwdw3S6a5NiNtT8f6QmIFDpCwFD32FFz2WkcNztFFDNqXo5fJCOc04M872MEw0FnQ58ih5H
 O2z2g1eurLPtm/iMVuLqjUDuqELoSEw6uYXEjTKb8psg9JMVcmZAAtdtKgzISsSe/FFQs5mPR
 Yr1eSagTK0vGCi56mQ4zdnK17gSrE4jM14nUZempjGBOXWBqE8T6IqmaZmNFlHvVBOh0nYnoR
 dmt+1gtDNpbmac=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is version 5 of the WPCM450 pinctrl/GPIO driver patchset.

I was originally just going to rebase the patchset on top of v5.17-rc1,
but while testing, I found that the IRQ handling code violated locking
rules, specifically that it used spin locks (which can sleep on RT kernels=
)
in IRQ contexts. So I made a few changes to fix that, mainly switching
to raw spin locks.

Best regards,
Jonathan Neusch=C3=A4fer

v4: https://lore.kernel.org/lkml/20220109173000.1242703-1-j.neuschaefer@gm=
x.net/
v3: https://lore.kernel.org/lkml/20211224200935.93817-1-j.neuschaefer@gmx.=
net/
v2: https://lore.kernel.org/lkml/20211207210823.1975632-1-j.neuschaefer@gm=
x.net/

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-1-j.neuschaefer@gmx.=
net/

> This series adds support for pinctrl and GPIO in the Nuvoton WPCM450 SoC=
.
> Both my DT bindings and my driver are based on the work done by others f=
or
> the newer Nuvoton NPCM7xx SoC, and I've tried to keep both similar.
>
> Instead of extending the pinctrl-npcm7xx driver to add WPCM450 support,
> I copied/forked it. The pinmux mechanism is very similar (using MFSEL1 a=
nd
> MFSEL2 registers), but the GPIO register interface has been redesigned f=
or
> NPCM7xx; adding support for the older GPIO controller would make the dri=
ver
> harder to understand, while only enabling a small amount of code sharing=
.
>
> The DT binding in YAML format might make a good template for also conver=
ting
> the nuvoton,npcm7xx-pinctrl binding to YAML.
>
> Both in the DT binding and in the driver I kept the name "pinctrl". For =
the
> driver, I find it accurate enough because it handles pinctrl and GPIO. F=
or
> the DT node, it's a bit less accurate because the register block at 0xb8=
003000
> is about GPIOs, and pin control happens in the global control registers =
(GCR)
> block, except for input debouncing. So, "GPIO" might be the more appropr=
iate
> name component there.

Jonathan Neusch=C3=A4fer (9):
  dt-bindings: arm/npcm: Add binding for global control registers (GCR)
  MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM
    architecture
  ARM: dts: wpcm450: Add global control registers (GCR) node
  dt-bindings: pinctrl: Add Nuvoton WPCM450
  pinctrl: nuvoton: Add driver for WPCM450
  ARM: dts: wpcm450: Add pinctrl and GPIO nodes
  ARM: dts: wpcm450: Add pin functions
  ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
  ARM: dts: wpcm450: Add pinmux information to UART0

 .../bindings/arm/npcm/nuvoton,gcr.yaml        |   48 +
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |  160 +++
 MAINTAINERS                                   |    2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |   43 +
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  384 ++++++
 drivers/pinctrl/Makefile                      |    2 +-
 drivers/pinctrl/nuvoton/Kconfig               |   18 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     | 1150 +++++++++++++++++
 9 files changed, 1807 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

=2D-
2.34.1

