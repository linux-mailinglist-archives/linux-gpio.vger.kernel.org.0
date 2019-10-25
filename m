Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B2CE4246
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 06:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfJYEAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 00:00:48 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60967 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfJYEAs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 00:00:48 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 01FB9891AB;
        Fri, 25 Oct 2019 17:00:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571976046;
        bh=vxyX8oV8LDZHeHypVqKDTFk3B/PkkdVWLm2WW9YuFGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=tWuVPeEj3eXulN1GFnKsZJz5Ec5giL14Rf44NwS4NVXy7eqaOu301MXJ2WSf7DJZY
         breWmX6LJRPaDNURvRULvH3Y61xlY1tgWQms/OFxms2RNv6aEozY0EMRVoyewovy5J
         IW2Yi/drPFyQytysW7k1NtFxMAyKdaq8yYK7f3lFd5AOPoWU7XF1uuFG++53JcuhCt
         u1oJA2Mfgvt4mbCRi7XGG5C8Pcr8N2BvgLrmQaBdM3hoXNcEGt+tsYjU2P/B4eAo4d
         4ybRe2PtQlcGRdC5iurGe4lEu8GG2YkbsHd7KtJUKrvakgqgmvIZ8VK+ZLMZtX3Obm
         J+/P3bl/rCJjg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db2736d0002>; Fri, 25 Oct 2019 17:00:45 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AB52213EEEB;
        Fri, 25 Oct 2019 17:00:49 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id C073028005C; Fri, 25 Oct 2019 17:00:45 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] ARM: dts: NSP: avoid unnecessary probe deferrals
Date:   Fri, 25 Oct 2019 17:00:41 +1300
Message-Id: <20191025040041.6210-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025040041.6210-1-chris.packham@alliedtelesis.co.nz>
References: <20191025040041.6210-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl node is used by the gpioa node. Which may have more
descendants at a board level. If the pinctrl node isn't probed first the
gpio is deferred and anything that needs a gpio pin on that chip is also
deferred.

Normally we and nodes in the device tree to be listed in their natural
memory mapped address order but putting the pinctrl node first avoids
the deferral of numerous devices so make an exception in this case.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.d=
tsi
index da6d70f09ef1..dd7a65743c08 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -172,6 +172,13 @@
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
=20
+		pinctrl: pinctrl@3f1c0 {
+			compatible =3D "brcm,nsp-pinmux";
+			reg =3D <0x3f1c0 0x04>,
+			      <0x30028 0x04>,
+			      <0x3f408 0x04>;
+		};
+
 		gpioa: gpio@20 {
 			compatible =3D "brcm,nsp-gpio-a";
 			reg =3D <0x0020 0x70>,
@@ -458,13 +465,6 @@
 					     "sata2";
 		};
=20
-		pinctrl: pinctrl@3f1c0 {
-			compatible =3D "brcm,nsp-pinmux";
-			reg =3D <0x3f1c0 0x04>,
-			      <0x30028 0x04>,
-			      <0x3f408 0x04>;
-		};
-
 		thermal: thermal@3f2c0 {
 			compatible =3D "brcm,ns-thermal";
 			reg =3D <0x3f2c0 0x10>;
--=20
2.23.0

