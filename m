Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B14516F918
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfGVF4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:03 -0400
Received: from mout.gmx.net ([212.227.17.20]:57615 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfGVF4C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774939;
        bh=iBgoZEjqz1uvIdXtw/jNq8gNBaVuMlaRN35UMIiLDco=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WAcQDrsb3w3p7Xi5DZHYcCaC8VjjmomOSaVi+vLjBkIYXlq6n9LRDoViTrLPhcCG/
         8T/zHwRhLBnzyLl/MLyrI6JIaeGTiHe78FclVr1enuxev52WVK2G59tBTd7FZjx7fY
         g9hrhNnFY/Fubf8RaDy41kdPd2LLRp1Hg/vF5Tq4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Me5Q2-1i4Dmn1gRq-00Pxpf; Mon, 22
 Jul 2019 07:55:39 +0200
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
Subject: [PATCH 06/18] dt-bindings: bcm2835-cprman: Add bcm2711 support
Date:   Mon, 22 Jul 2019 07:54:37 +0200
Message-Id: <1563774880-8061-7-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:l/MjxzPQLu7Ob/0EM/lxZew7fom9VFEYdrdZU8LU4EKKAr/D1J1
 fM+Z1x/rK7ksOIO8DrAVlJc3ZqRmcvBsFeqPeoCmpJz2NyrmAK8YpDddDSSvkW09NBiwXmd
 BpM+mZZ4FBTEC3zvWYcLzm0EeCpSb3RkLJgGkrP9k6NmoMmR9oSHmH8shJPcO/Ap47WMKZr
 /Z9D2x0Cq20ptvVHpQaOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P+/kdd+TwHM=:8FUBPHf0/8+qFt6wQVsCh3
 Rg1HiKrxOrblkjCvfD7+fXMt/S8iiYvYCbBThrvZrJjiBJP0DAqvj95O6avO6mMBAbZ5Q3ko1
 r0iBI4bxhqyWkFF6Tc2EU55IKVCUI69gYbxGqaMBhZQjuyBbkjpY/wpjrtSvuRD3Qg8hN45z0
 rFLtRN2V0llLayek1PZVVxMkYQL1DtGGR4CkYcssjT/eGPdHVoNafi7Xk1IDhRTegw/QPSlrb
 g5EfkQ872NmBQE/Z9qHjlOSz0OqQ/OykCT3B929avxPY+Y4+ug1ZccE5ODQVzmX1UpOs4Iywl
 DAz+0uYLupEvO6qWm4vhMRePBQglLldxj/yzj4vVFNvHTXyJe8rsKFiis4cB1GpnXot5KRwUU
 fGroCSjypfS3fOn9qE49h3hthWb80aOQ5zlpf/xt+Zo8LP5J/+h2GdPyO/iXLpTShAslxVl+P
 JO8aAVMAMhSUxxBilGLyZbuJVSg1QWCD3cn1caJUlDr6VXBuQhvuCmT58rbwvuvx58wre0Iav
 CroiRlV9JYvrIc+FvRxe93on4SlK/v8bzLPBtNzfqjMvUaugghhq3PNUilMDcxfuxw1QUZCsA
 T9CKcDvaY5aQsONWvX2eIjDRqzOPfAu3XwW7HC/E6EPm2aq19ukECpDpegeK0jMOKX93OWBTA
 P8RS6lg2P+s8OyscACluqEXHGaxUnrZ9S2ClwqKYl28cdHOmEwcgWn9MVFgppoc3sFcHEhjrt
 7Fu1V7YkOZnNCMU4hOvqC3zNc8ns448kKaAuES4E71JG2p84VjZ7ezWUSWtcbHlID8ZwD8Uby
 jubELe3i5iwk6UZ4paNdkFkUn+MUB7q3T+BnhKkbiEZkf9Q9KI7cyxccl3laQVzXfp65VQRpK
 8m/+K89Art4FReadbrmZo0AFMDDFT/bbch1L4aflo9lqo1bFa21iYC93zv3P7BlTD6sVy44Hf
 drFuGnJHBWvcC6UjksrxVFVSsfbwc3OWH0zx1K510fCB0ITijK5E/acu+DHO3379y2oNSZGGc
 o5Ujd3nQanzr2LiRIKjdfIOdWqJwcjYxrZykpXzlFsT2og0XTpQzxXuL6To3AyoQLcp/CZy5j
 eMJua1ikFqcBbA=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So we need an additional compatible.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt | 4 +++-
 include/dt-bindings/clock/bcm2835.h                             | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.t=
xt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
index dd906db..9e0b03a 100644
=2D-- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
@@ -12,7 +12,9 @@ clock generators, but a few (like the ARM or HDMI) will =
source from
 the PLL dividers directly.

 Required properties:
=2D- compatible:	Should be "brcm,bcm2835-cprman"
+- compatible:	should be one of the following,
+	"brcm,bcm2711-cprman"
+	"brcm,bcm2835-cprman"
 - #clock-cells:	Should be <1>. The permitted clock-specifier values can b=
e
 		  found in include/dt-bindings/clock/bcm2835.h
 - reg:		Specifies base physical address and size of the registers
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clo=
ck/bcm2835.h
index 2cec01f..b60c0343 100644
=2D-- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -58,3 +58,5 @@
 #define BCM2835_CLOCK_DSI1E		48
 #define BCM2835_CLOCK_DSI0P		49
 #define BCM2835_CLOCK_DSI1P		50
+
+#define BCM2711_CLOCK_EMMC2		51
=2D-
2.7.4

