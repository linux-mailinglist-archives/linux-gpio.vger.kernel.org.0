Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A56D17D678
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2020 22:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCHVmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Mar 2020 17:42:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:39283 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgCHVmu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 8 Mar 2020 17:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583703755;
        bh=QhIwll7TLH2Jreh1ADKlC/MVozajL5VA7trTAIMDJTY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=LpbH/bwl7AT5TCEiuJ0PCG4rj6Y7/aiCe964zWNDaCL8Z9RzUloJpxT55O9oHi8T9
         n1M1ylgMwtWFGF7Bo3f/0ZMsCzgP2PskpgVJqyU5pGAmgX5SuxUTgK6yI/g2pdxkUh
         +d2O5dovMoDTDstPiM2/JZAHe7frsoMWS052kq5s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.212]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1jZcn33e5T-00yMza; Sun, 08
 Mar 2020 22:42:34 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: at91: Fix a typo ("descibe")
Date:   Sun,  8 Mar 2020 22:42:30 +0100
Message-Id: <20200308214230.15193-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dc3j1YLbf/2HoLi7BPlskXwPB9N0VyEc0ekYYBJEurrvN//f1T9
 lJvedlkrjf1u735amuVjLky9ZkeqHLDHCsORuzaTG7N84iPrIvUBx7jY0rsNcHVLQtSmq88
 w9KzLIlQLKBM5/9lyR0CcMtEuEO3+iLyF0mP4VxMu2f6AYFYjErCE1BZTB7eOltLnTdb7PT
 vABU67GshUVIOGnCKfQ1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FTtg1mIMvkg=:/p2vluF2sfmKFocK6e5e1q
 Ih1hIAQhIJKqqZTYQzIxJ70JgO+5D0z2Gzjl7qgn9it8bbaI7pxSna1Rzz7GL7eE06X5KKC/6
 rF53tH7K1cS3lmcXoU2z1Tvq70kuseK2g9VEzYq5xHZo4oumGrybMAXUg4VluZNH8kBlMNPmp
 x1aDCogXkxbDxpaltnQXlWxQMX6ozzhp7EACadjbk1ZLtR91Wd8JZV1s0eSGWhK2QU2Jjfkwg
 MqBs+7kCTrSF472zrXu8uLVqNDsCV9S23czq8Es4fgz0QFKet1EaQkWmY5/dWS2ytpaX9Io3y
 wwV8fR87f1laD/Nc/I1zzB9JQpOCq9W6Kd/5bfPEd0zT+6iEuEa48raeadDBJJ8lops8f9cHn
 5MHhQFPTRMcq8cd2HU1tbwdnCGXaqfuU8ts3a9umUzjpDTyit9UndMZGD66+zWxDOuC6u7HLE
 rk+gG9L+qB/I+QH0GWi8bHPBoJbABYqZ+PJKw0LK1mXYvmDvjnMqtLpR77wEd4Cu2H7u/e5zf
 E79ozeweIaWAz2oawmiVhpb85uwq+9teOzW+v1Pzh2k2n2jv+MCUVIMCTMsiPJw9199gJA3c9
 OWEaRI61wZ3gu/HeDakj4cNlo6B4jPrQFCE284cxDLxCX/myCjY0cTuf+/d4257naDGoyrOnk
 l/deWxOolusgIUn/Ge4eePpWCPD0s2MrJK/d7KHckvUFfoYUeDq24skyd0OqPtK8uypFV4wb9
 wcOrs1bOeioJqsussWY9Srgi1rrhaTq7v+cCaCgYERCrSEslLH7cVX5KOJ1vC7hQR1B/PlkZz
 i3xcrvRmbdwwKh6WfDSbtqt6DdCvEsxLvB5504mhGTqyQlgicoXgcFo9vYkzwwnSDqjQAeVgo
 2HyDtl88vk6qKzZXijoxpb+syL36rlEwnfueUJnHZg2F3/x8FHEsiJogzWHl6wPhfIqD6k+Gt
 141xK1V+WbLpFzl2fmjJ0ALP2ilr+yfYQ3RbMaYXrKIro/zJpL+e1CEmVzU3LZDGcgnofWG+Z
 YmI7mdKbJItJ6gNiChdQuH6m0YCnZlVdt64zSK/xSjKL2ka6I5IC0DbcWNBT8RVecKA3rzaTf
 sTq+/sh4TWiR0YMCo9ZX2PCsf+tg8xc/TqWFE/ZzxqX/Twvkwrn+F6WlDDCmUA4q/8dHgveRW
 ymOEhH87NNPHL8IJ9jQ4mfqFwJNIizoykNDQyEfEL7mJWYBFVnkmha+nnSuQAXD45lKArZMT3
 Yz372AYkA9UuPe8ka
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.=
txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index eb39f5051159..e8abbdad7b5d 100644
=2D-- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -38,7 +38,7 @@ Bank: 3 (A, B and C)
   0xffffffff 0x7fff3ccf  /* pioB */
   0xffffffff 0x007fffff  /* pioC */

-For each peripheral/bank we will descibe in a u32 if a pin can be
+For each peripheral/bank we will describe in a u32 if a pin can be
 configured in it by putting 1 to the pin bit (1 << pin)

 Let's take the pioA on peripheral B
=2D-
2.20.1

