Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382817066D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfGVRIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:08:40 -0400
Received: from mout.gmx.net ([212.227.17.21]:48797 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729813AbfGVRIk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563815286;
        bh=4VYJOdem6Xvc5GKoj1MdJCoWa0bgBVw0372KSDnlJ88=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dT5CNo+XipWN1OV+kWC/xTbmr171UUPd4rLxqIlHPRHOeZ9VXfTHywbuB1/iAQ9qX
         9gWc0zg9HsA2Ja5eJ50itsGVP4ArATzz7IkW1QcQdpgbEqIWJsIfvnyNjQPGB89rFG
         8SgJ3sNBmsPXGw4XskSmBgSu1Q26eLuRbIRgQVxs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.131]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LjZn2-1iQrQE1P8y-00bf57; Mon, 22 Jul 2019 19:08:06 +0200
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
Subject: [PATCH 18/18] MAINTAINERS: Add BCM2711 to BCM2835 ARCH
Date:   Mon, 22 Jul 2019 19:07:37 +0200
Message-Id: <1563815257-2648-6-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
References: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:fbWcM/cwfxzKEcCXiGWjElKaqnnMSGp6SBPLjHXtY6V0WTR4A57
 Yy5eUXpIK+3iJ9vTCeUK1ByJG90AOX+sHjh2tLSNbaBXJQ3fmWVetFgcx2moLcsZacRrU+R
 42bEaYNipWRmmNbvfu2HKjqzeoLD5id2nGJ2zUpu3qNGi6FNPdSivtbmmdvhmffBXSTUCY3
 gTkhUHipdSygxEPTeOUYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D/ohtluw/Ec=:4Ocp42Dy8WgDSuv8+nxqrY
 cMaOdkkrsSp7k4iYVGxoZLgvdMfFsoPupdiPCfJMSnuooEN7b5V3AN9Y69oauLJNdSRCuwHiz
 uQ5xt/ZhYybLSverOoxLk4/2NvtTZ3Fm1dd+Q+0u5J2ys/c+lZP249co127e/Atw7u9j0xQ6z
 qYcVnSIOBjmiTipP+qz8H5xxGTygxsgtbXm2ZWh02VSawaJSe0K1+Z1l4ICFpuBsJnrg2tNMu
 q+TV88gBr2X37mIfcxKA+BYEg+7eYahu2KftSG2I/Bj6vmVJxJS3t/8xcVLEIU/fPF8YKssyZ
 15Cd2n+QnJj+eZeJN6wzX7PH3llr/ER725gGRSnrIv1j6BXiuLeuFo/S0c/A+WgfCQCd/TZba
 PfQT7CtlJOf3AFk6fdBOLHVG1UQD4AQGCJtchz4lGPAztJSFgrJriD+H1hEM2+ELUal+NLk+4
 XkKXe4NdCVE2MTAa39G/qyUyTwVP4ePtgKlClSultFtaJmz6Bee4LdAbIXcrx4/+bCh0znqfe
 zsCExpbogOAP4PnKQTqj2D5t9MZWjOyiDc8c/nbYZqN/cjgb22fulQyTfdvx8g0Mm+MXhNO/k
 6JArpHNiJcje/Z9Z/604Ca9f29CZ2h6CplnTGbNDYneOyx8JxWyXcXesRJK3q+Bk1B8LagyRZ
 +bTQMBSjxq41Ci6/wssSjCKSgOBJWmP3YegZCaBJ9AvKXFXkP5qr4D8Hu33BS9T25CmLkgu7/
 IG4ocusXeusw4WVxjOvivKEhnS1zZIe1N2+8HfZvAjlWUSKWT1XZdzd285RqQH6yd9OZ02j8R
 F7EdsHoxfdM3jA1wO7n20c9nz5fr3b9i63GkfVhOGmAIBqU2X8CuxVGFqLvRFjFQhbiB26DJN
 f6pRAxVPmPRoWuHh4pr4dAdpOxDPhjGw2bnv2lO9Qk+H2ef4SB+uH8T/9oHyhyMPyfn//1Tfx
 t4P2TXEQn0+EO8zaQSFY+Kzb9fdLe8qOhzPnAp9Ip8lOGKvjtVNNXdoAf4/qmiDKCMPffJOPj
 cfjpTcgFAAb50PcWVE8U6oylj6t/pXYTJG/Fxk1nvwYxUIO12nQgHsk6REbY1ZkP8S55EycIQ
 AJKEemX9d3gTn8=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clarify that BCM2711 belongs to the BCM2835 ARCH.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6fa7e8..ef75b7b 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3137,7 +3137,7 @@ N:	bcm216*
 N:	kona
 F:	arch/arm/mach-bcm/

-BROADCOM BCM2835 ARM ARCHITECTURE
+BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE
 M:	Eric Anholt <eric@anholt.net>
 M:	Stefan Wahren <wahrenst@gmx.net>
 L:	bcm-kernel-feedback-list@broadcom.com
@@ -3145,6 +3145,7 @@ L:	linux-rpi-kernel@lists.infradead.org (moderated f=
or non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 T:	git git://github.com/anholt/linux
 S:	Maintained
+N:	bcm2711
 N:	bcm2835
 F:	drivers/staging/vc04_services

=2D-
2.7.4

