Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F3415645B
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 14:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgBHNDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 08:03:34 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36035 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBHNDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 08:03:33 -0500
Received: from localhost.localdomain ([37.4.249.150]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MZk1p-1j3Sio3D9j-00WpfZ; Sat, 08 Feb 2020 14:03:17 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/4] pinctrl: bcm2835: Add support for all BCM2711 GPIOs
Date:   Sat,  8 Feb 2020 14:02:51 +0100
Message-Id: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:icI8YXP26Zm+jBjOn2iPvYMPgU0dU1i3GPi3xK6L9n7Yvhg1ZFl
 2ZXJjVg90vdegqoIZVCbPcf+ByYk0vLlEF8GeQl2Agc8+wOd1AgKlUtzLgFzmsS0odZe677
 OGXXBRKaldCx8rstZO4BRwxB6xoXpOxgQv5tPOPSenhIhwh5SFXnq6EMC4jYIYWQZCBC3CW
 yYqrjHKPVENorBY1SlBXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9x5HXLGv2j8=:QGeYjIQhpdk9eJVt857SY1
 lvvRiYKmpxh7u+Zy5EW8Fq04xcZhkaLQEB+Mkmw3SRc1L4qMTGIzf6/DzNieXG3pjIZImbOJj
 DPK55L3eAGE9R5iPpqR7SBOpkgDigDpEv8BRePytI2ex9CmrciCcyD+R/uTEjNHs3QF1820E1
 lnPNfK2XzruBVTHfPTiXG/ji9i3ZqUJyd/sdE9SrXvA6BOQpp5xdOeNUi39i3vtXuBu1GJZv4
 O3GOGJj5FllwnRmYsBjMP/RCF9I6z6ey0TvWh86Tr/Xi+ApwSGI08fc3kFR/m12WQfGQyqUSa
 A9Guj4iMDzlt/B3ynBuL4Vw38KMlKSzttEAmm8kvwbWR+zlw4su0lg8XU96ZuEupA18CKIS3w
 LbjSllhtjDE9u736WYEo2haGVAOoY2cTa4CKBYKiz+DPaOMGu1HHd8aapMLypFZHYgr+2Y6ju
 TDMNV4qE4PH5WgJCgOogP50NXfJIDirKCDhq1RZi3j5l7KZN+uwO50GBnlfgZsCU4hKprin6z
 uY0oOol0j7fFu6Ezk+1ZTMyCCxmaski+vcLUaeaHyBBk6Ac4em/OpnzuQOxhFl3b7X3eMCPcR
 TkiDjE46juSuJtMn1ebMjS3OG54CRImI8iBE7FUVe15MwtwNk1QNozunxuj564a/aOmdAbYzo
 NkK7ViN1FgIaWR1yXjjl70EzqixlbBOfAyipDjq/Ip1ZPCOvEqfi3RFhBQVG1H+yJ3HHts0do
 Pef5uy0sXFzIzkJUHWSmCv3ex5zPSEPlMum3As1YPrD0aFyDOjQoa7TLn3lAWtXxasaMKYCM6
 EFwLIndM/0GQic3NXe631UiV+4anz45dHcjRVBbx2m84DwyYh7b9/LW6w9vNDIu9/TEhUxY
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM2711 supports 58 GPIOs [1] by using the existing BCM2835 GPIO registers
completely. So there is no need to change the binding.

Patch 1 and 2 prepare the pinctrl driver to be extended to 58 GPIOs in Patch 3.
I didn't want to squash them in order to make review as easy as possible.
The final patch 4 assigns all SoC GPIOs a label as we already did for
the older Raspberry Pi boards.

Changes since RFC:
- avoid using memcpy as suggested by Nicolas
- drop unused entry from GPIO label legend

[1] - https://github.com/raspberrypi/linux/issues/3101#issuecomment-573092294

Stefan Wahren (4):
  pinctrl: bcm2835: Drop unused define
  pinctrl: bcm2835: Refactor platform data
  pinctrl: bcm2835: Add support for all GPIOs on BCM2711
  ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  73 +++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 106 ++++++++++++++++++++++++++--------
 2 files changed, 155 insertions(+), 24 deletions(-)

-- 
2.7.4

