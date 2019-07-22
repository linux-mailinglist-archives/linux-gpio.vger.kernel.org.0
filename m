Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2D47066B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbfGVRIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:08:35 -0400
Received: from mout.gmx.net ([212.227.17.22]:38515 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729199AbfGVRIf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 13:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563815284;
        bh=6nS7Lf6FNdVUYXGMd00gzIso1Z3I8h5vATfhDbo1HWw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CwL8GCHtNFhZegQ5GJpGixfEKuZAW3OvKeo6E8p1XLU49IO/VtcHztedrkMhfhcG/
         wSWePnRucp/is/KGyfMub4XAW7F93RWzU+CwSLAMi4UPHcihzYKxdwP6YwzIzGO0pd
         hIZHZvczmZ8AwMOvkP9ZMBlh9P4C8l3myls8HC0A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.131]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MSdRI-1hxCTY1BPo-00RWdx; Mon, 22 Jul 2019 19:08:04 +0200
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
Subject: [PATCH 15/18] ARM: bcm2835: Add bcm2711 compatible string
Date:   Mon, 22 Jul 2019 19:07:34 +0200
Message-Id: <1563815257-2648-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
References: <1563815257-2648-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Ozi+ow31HYFixm+4tvpLjYLuEY8a4Oa9cmfUylPS1EPl7hgn+hu
 b/GDHJJiJIvw67knfV5u6EemfRwXcCus7QkJ/+doBkq1EH0ErKqEItVtvRu0wSP5wE6MyJN
 RtnKax7+8pku7MuqFTOU3FH4yQwcnYUzscDM5w2yyFFcka2Yr2sVvVD0WYmvx6sMCpcsRCX
 miPEpEqAyUCkLZ8K8Dz1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8gfPkhoX25A=:wSjmZWPeWuCf/BgF5Ueu/h
 gwIst7D0FoUnVfKeiJgl4xzL+WE5aLGhk0armELJB1K1NMR9tla/hP8MCu7Yuz4QmpygAw/ud
 B8ZnAEf/pDv8peBME+XreO6t4IWQ7PkJkWnnJMrOfSPfDqykk1tv7/7VjfagqvzmfUxlCjotU
 kVJbDhkvRUDSF4OM8LE81vsdv5Rybzx+Wu2+ubAP0l2FjBvIWkWoRv9IAMPGgMy0qhIkGHCAg
 oEPyaT7C19sW0PPstUnqRJvLinZbY2o/bbZEjR5LFDnRefyYajSD5Z7yedBrqr19qSyKEgYZJ
 lF5edJmbMRDIEAhtSewjwhi0RCRtYGVYNj+TBNB8zzmcXnCOYes+aI6IJtAuacupM4iRE+2cD
 +D91aSEZ7vTUUM6dRE5OHfj+rKDMm57IwTRkNySWzko+pBy2vYFvTZ5cT2g+kYkYTFrfwropc
 egaal02UXqU9xrH31HXixDwtsSO5SQ8OyN+Kgu5VxRqmMmpXOLNRC9t6/h3Saa6Dxl5vzBWFV
 sJJCKcDKLzZDR9e1nGH0IOFK0ABtESI1TzKutKHL0KWTGBlIxBI3X0tP/QzoOoJ00zdoJ3AHo
 dGACzjLnfhNQ0bqMv/pDJRpFy1OgyLJtcly/xT0yrw+SKGCqarw/SIAMlUsdO79v/ktDBlE5B
 AgWKeJEP02QbhzPZ8IsONhMkWw2vwbGCYXAtw7B3g8g2gT2JTbLuDosgEf//dmf/ZeXH0WLKl
 GFdYVyB9EjSLRyaMtiVd0IDsEDpJD2V1ZGDat6x6gI8gErcmhXjEo1yz+Ut0tKFN7VlsNFQ6B
 kaA+K2whJYcv1H2MiX7zNtA4AdwDRTBx0QvJOfnf12/ucS2yX+GR0XVLXc0c5RJiAiWVsKkGY
 E08e3Tr6rlI/T4iDafFsd7ey1sLd9JwIq+mpL6OdmSzEqfgq5GhBNYzVBhbMpJGinovfdZZFK
 4/j9umBEY243or8RCOY9iiGb4P+VWbxppV1mrMwzekVPA3mlk8Zv9ilcyWJdHqqNSpRqc7twM
 Rco/Jz3vCE3c/yoGNf0PMwzgJpGLB8Z8P1Xj/5qXzi5c/T8T1mTzRjTPFjgA1P8fgdTT94GDs
 jJFBthqHiXNC+U=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for the new BCM2711 SoC found on the Raspberry Pi 4.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/mach-bcm/board_bcm2835.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-bcm/board_b=
cm2835.c
index d2b31a9..c09cf25 100644
=2D-- a/arch/arm/mach-bcm/board_bcm2835.c
+++ b/arch/arm/mach-bcm/board_bcm2835.c
@@ -17,6 +17,7 @@ static const char * const bcm2835_compat[] =3D {
 	"brcm,bcm2835",
 #endif
 #ifdef CONFIG_ARCH_MULTI_V7
+	"brcm,bcm2711",
 	"brcm,bcm2836",
 	"brcm,bcm2837",
 #endif
=2D-
2.7.4

