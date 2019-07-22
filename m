Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A33A86F912
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbfGVF4B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:01 -0400
Received: from mout.gmx.net ([212.227.17.22]:53843 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfGVF4B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774942;
        bh=GU89YlLcWxJcFvez/UaJULPPU3ocAYeano9D1Dz28OM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TbHarNWIFz79a6JKSq3R1jg/7c1cEZ0b7xukUCC1wpbwKjy3S9QQPkvzURGssnadQ
         78zwIj+ocU0hGXdHyaTDe/Mb8c9wMkGLgb4MThEGFbXsYsLe83rfTq0Y2W9UibWJKk
         1hPzwb0RFxBG+mKkm/FqBJSYNv2QRv04nHyXbZnA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lb90f-1iHvMa3EZF-00kdbk; Mon, 22
 Jul 2019 07:55:41 +0200
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
Subject: [PATCH 09/18] dt-bindings: sdhci-iproc: Add brcm,bcm2711-emmc2
Date:   Mon, 22 Jul 2019 07:54:40 +0200
Message-Id: <1563774880-8061-10-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:TaoYEtFo6S+DLQN5O+CGyxUkFR5mMK1xgBJd6RyXw3VKX/UrVSh
 BG+9tH/fcHsmYsgHTXW1kxK1UWwy4RSWfKcANA/BKooQJWwqa51a862tyPQockoHN8upkx/
 b5eZZAVZu90yqoJ7fgmbyudw4msCoCmGax4l34Q3BCSCQ1YuwzC4SIh+BccMCYMRGgd0DJN
 H8D1PpxKGa14YMA3X+dOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oc5cSNfgdP4=:b7SJHzW5K+AQaEndZymsXb
 k2CvHTZ7mHMnyIznsMUMbPPmlfjYI4tLfmZS4H3je1gdctzpIEc+V933v63sO4yOpI9l2aflj
 1a2v35bXMvDUAZAQaMEGMdzU0D5zqQcVTkNvdiuSEwX0YjGBExySyMa/W5DwF4e+kg8DRPHGW
 /auZZUCB0CwWW8IbrHSZXZYrKqjqcHOZkhhmLYZGLX2Xwduz70Ocf+9wA9vMkcidU66aI/vdN
 z1MG5kSh2hO49lZj5Wzvf3giDOQZiPtYPr/nfSacN1T/L4o8AvdBKDju+eCKvVDaMTW9yB6ZY
 b8Jkgj921ulQywo3jF+owYaullhNg1KmDQldjAAWYJ9kJpt8oSGn+I81UperGwyMKG0r/9IGi
 qOFBLW25gCkT53fatFooLF+/9Qg3Pd9EJjXV8pGqxJje91sk0nYOr9/JbTaXNspkQNLicWBtr
 r0OQ3jXAfGjyNidsQ8Jk8vv6dP6F6gdCDQoO8stENVrejLRER0KBHAMKAMI7H+BoYj5HNJif2
 c5BsLQ4ol0jZB7ZGaiHPgPEOAdPmqdMySwXik/e1uLfJn6ryl0Ix2qyrhOCVR/jta0xUH8t+7
 Sy0bWxmU1NWnRAa3ZlwRMiNbrYK1FG9jLgz5doEzUgjJIf0u5p3cbZZaMvwiFAfhbFkNCPLL5
 vzhuBvGhgwLkMarx5siygViWD/K0QmWhJPmkf7md8zZHu6HIeZVN320T/LpnU38mtcQq6Ajc/
 /8zYIPjDlUWKPOquM02btWMEGLwxZoAegAGyS/Bd9G2n/fKuZkCw5sJl2dzdiW2evN9n+1HXz
 tU2t7eWPPsjT5I/wbjyjdovMiLSrfWq9U3INcRG/ADEAqmkkDbMJlSzXclC/yuCCt06eQh0+z
 5d+Md25CSStUtIZVFD7UhkyxCjAgaSgS1uqChVFhNljjAnwrSMU/q8Tcx3z6RH4rMTtUl5vDE
 B2tVX9+LspqfRiJu5Fi55c53SAW86XV5mcOH3EP96AuEhIDr1Y0AeO9um+aIK0FSGSDb+8VYC
 ce8YGQY5dojEtkGWSvGDUMV/wzj3AtnCDEYDjSX2qFSWGqHnsF4h5k/qMfc2QDqTKDP4jGAf9
 LzLPSXWnXkIlyY=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new compatible for the additional emmc2 controller
on BCM2711 and clearify usage.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt b/=
Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
index fa90d25..09d87cc 100644
=2D-- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt
@@ -6,10 +6,12 @@ by mmc.txt and the properties that represent the IPROC S=
DHCI controller.
 Required properties:
 - compatible : Should be one of the following
 	       "brcm,bcm2835-sdhci"
+	       "brcm,bcm2711-emmc2"
 	       "brcm,sdhci-iproc-cygnus"
 	       "brcm,sdhci-iproc"

-Use brcm2835-sdhci for Rasperry PI.
+Use brcm2835-sdhci for the eMMC controller on the BCM2835 (Raspberry Pi) =
and
+bcm2711-emmc2 for the additional eMMC2 controller on BCM2711.

 Use sdhci-iproc-cygnus for Broadcom SDHCI Controllers
 restricted to 32bit host accesses to SDHCI registers.
=2D-
2.7.4

