Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE706F97F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfGVGYA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:24:00 -0400
Received: from mout.gmx.net ([212.227.17.22]:40479 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfGVGX7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 02:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563776616;
        bh=C/BKlEwyumlArmwD/E6wgYAWdwQ1Y8+GdUItO4AwDB8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=OF7ORH1kF6/Jm6qRQVl13FGHOStoa4RCDp0c8+GTv9hJDPuD8BCHtSoWiB18kGngM
         gRvPEOfcQOuwo7lRhSSLb0qsOV6ylGZtc1PJ1jeMBjudXmLmkB61zhXboD6sOVJEkF
         vr9Zg/OVlPCx1pPMG4yMBMtulAET3WX3VdCAStlA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LlGoc-1iOE3F3Eco-00b2gg; Mon, 22
 Jul 2019 08:23:35 +0200
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
Subject: [PATCH 10/18] mmc: sdhci-iproc: Add support for emmc2 of the BCM2711
Date:   Mon, 22 Jul 2019 08:23:23 +0200
Message-Id: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:GxIuRAwNwjQ8P41WK7RQ/jyBcX+5REqGD0yM69ZZYhZQaHNsw7q
 EaToozX93r4CKrb3WTg2CUJz3UBqmlifhGylbY5Im3SzMrQn5BTJhL01pFO5RAfv0gmFJKm
 9rX7TpJnETIl1e6XJv2U11q4XdPjsOG18MPswiTv8InzARGumCVTtFlWubXLSlRv+NZr26M
 6Vv17Byc488qhwM0Qk5lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+GtNzptVxGY=:YCCTEBW68gIi4LhAv/5Nwm
 cvvvKUl6h7apzwQMmuZPq2cNyteRgKStyl4yDNYwViCjPdrLYJvBtx3x6BybQiLXec8FAjaAb
 hwkzHG7UM8WnmGlmSxl0WM+qEcr4KJjwbaaJrNqP0L4lp/oPot3JwwJamZnnAVVoUUWEdySpf
 WAi1XgrtigWzI/XfOC3QABckJ9XBU2vqXRvNWJ1IB+sEM1sSq7tvJ9r+WdQVCCuADSQPbBzVL
 uuJf0spiug++kcSKm4fm6lJpdzVAZloCAqVKSNKFu2hcJVYib6L9d1rUceaFJ6LkfxbVzT/Up
 7E8wCjevp7gyvtAmWXv4YR735Pk5yYAYVilbKCnscU5AsonRGYFzWPMiV/mKcfq5hfXBIVDuU
 6aQjSsg8d4RuofIUaMcvJVI+s2O2E0pvntoHd4zocqQ1jz230i58llR1EbpMQzy4YrXTgoWFr
 Itl3cojCb0jh2DE8CkKOb9aokTLUAa4/HZO3hO7PAtMf+Vrr4S46zwHqb24dwD6P7BqF2oG5I
 8bpMi4ahGUBktmRYxk0YMY91+svrQTTJk1CBi0A56mJJiGahxmwb8zcdRCPxmA2l6NF9Sa7Yt
 sQ1R4Hbr+Hq0eCpAKCVQ3WVrLcQyFvDI8+zSS/rONT1EoW9fbPAs8qhVtTCelJsEz1CC1oPyi
 ZClEoeIU3KLITsj4F4PLa2V6MgS7LjhmvRFCabBAbG5ypDzRc76q2r/DicZzHnnrbdPEBFdDP
 r/kid2S9o2DDnT6ZniIan9oyGGBh7hII1yGSrOXWFrAcyEWOe8WU5gWcFPzvaI107wQZwS7VN
 zzhnzNYSkqs1pQuHD8I3hC+A6qRvhwgpp2QuUY8tf+6ve3QWfiQT3Tr5vdMHN6mkmMsPJWGRN
 xJWP3etEuRD8Ai/K5OxkHWRpDA8WVhKo7hwNbvN9r16s692Q5dARQkaapYFwlEMmXKkA6Gz7u
 /fnxYeH7dTTvGEWtTJFWR+zzBSsCvvFS42U0snB1KswFlPKzMVVn1B3XHgdIW/HnktbAokwW/
 vSRjL4XBseqsrNRrR7YNCjRDhsSwVBAd2e8ZL3uq3TYvZx/IGCI26PG/T9iWykMWQHssW1OF/
 gJsK9rtyl0BsQU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The additional emmc2 interface of the BCM2711 is an improved version
of the old emmc controller, which is able to provide DDR50 mode on the
Raspberry Pi 4. Except 32 bit only register access no other quirks are
known yet.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/mmc/host/sdhci-iproc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc=
.c
index 2feb4ef..2b9cdcd 100644
=2D-- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -261,8 +261,17 @@ static const struct sdhci_iproc_data bcm2835_data =3D=
 {
 	.mmc_caps =3D 0x00000000,
 };

+static const struct sdhci_pltfm_data sdhci_bcm2711_pltfm_data =3D {
+	.ops =3D &sdhci_iproc_32only_ops,
+};
+
+static const struct sdhci_iproc_data bcm2711_data =3D {
+	.pdata =3D &sdhci_bcm2711_pltfm_data,
+};
+
 static const struct of_device_id sdhci_iproc_of_match[] =3D {
 	{ .compatible =3D "brcm,bcm2835-sdhci", .data =3D &bcm2835_data },
+	{ .compatible =3D "brcm,bcm2711-emmc2", .data =3D &bcm2711_data },
 	{ .compatible =3D "brcm,sdhci-iproc-cygnus", .data =3D &iproc_cygnus_dat=
a},
 	{ .compatible =3D "brcm,sdhci-iproc", .data =3D &iproc_data },
 	{ }
=2D-
2.7.4

