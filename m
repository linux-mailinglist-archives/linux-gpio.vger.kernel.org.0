Return-Path: <linux-gpio+bounces-30602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E1D244B5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 990583044775
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221F537F8DA;
	Thu, 15 Jan 2026 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="l53qBHHO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE437E2EB
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477332; cv=none; b=cbKnq1V2mx5HJBW1HWPNBZj+caUq91iAnbS3SWpj+YnClPuHvV5D0VPpYFX59g19nvtTCnT1gugzl95lc71DAHWTeM+AxI4zS5yHWwX0QCO2nFJEYRZi8S3Ypq4+90BBXgOKwsOBkFJJHQ+bSJ4m+zU0JpzhhJoyuDya4Ft6BKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477332; c=relaxed/simple;
	bh=mkQUI++SFEZY6715sy/bRzpJpUAliolL1r9lnHRs51k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLFU8HV8VTUzaPIg7Zztam7QWenPNTO/PtM2QZ4ft656YbUhmTTsdUSePcvb0SmYPm440aHBtD7vtXlD2n8tITEIaPmGiOU/+Z23qXyfknGmKHo3Uxt5DV6ONYyVXGPIk4t/oFqQUawOWFY7QS3fZfPTpJjYl9qEjRdvHsMRj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=l53qBHHO; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12331482b8fso2545536c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477318; x=1769082118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmhD7xqaP3tJ0Ge3gQd2f9t6bDUERo+PNGIof7/k4qE=;
        b=l53qBHHOC3NN4gnjGmjzOZAahtk/NF+6fvAt9wqb9Im8E7JMc1M/45s2CqXUlB4W0a
         uuZHwx4eFrwNmU2bh3yp7Eoqb2WQitklVmlOsuVApYFjbE5nlv2cINFaj7P3hSAHunTe
         pxT/zsrKT3jXCVb542lNbKos3OrWTtwoQdJiYrKU1WflD0OQ1m8m/renMuVafFd28Gqr
         rFCo2UZhdRHYm+CMV1XgbKCZ7bJhNoY4ZNLDTqzC7wzp28ixZ0q/WqsPxCq8rlwFUG0k
         0Z/Wl4MKmwhFIkRPobQHpEa7OLi5f2q0uVYnp7z22N78r0M+hg8tJi9X5eKpxq2Z64yw
         mk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477318; x=1769082118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmhD7xqaP3tJ0Ge3gQd2f9t6bDUERo+PNGIof7/k4qE=;
        b=oc5mfWbIRQJ4PVVQeOfhgsj+R6wMsgF+dTPw14NOES98h/X2excDJkl/sBcl7lt6nK
         bm4fq6V1/dk1c/tLCsV29NI4G66R/5/YC8AWB/V3C/jdID4uUTak9bX7fDWuJTO/Hxcv
         gTlVqpQIcRsoFeHB8PqkiaxY02Ym8TN6UGR2wMLuPSbiEid1bitOtcnelNGhhd4sfmyZ
         wNoFFhIvdKvidSGpbv8sY5Jurl0Bvk/Va5j9RrntvJc4Y7ylFcXQ3FMJ79dgwnli/4jb
         OJpw1pQbTt48gtHo4HvUtHCIXcKH3IvkrN7qkyhkfSWkfO6hxyoPOlVhSS8vpI0bqu+5
         IE1A==
X-Forwarded-Encrypted: i=1; AJvYcCWCMFzJ8t4DScSrtw4Hi/SwXLVQq141B31KcOwlWx9xnd+8AxOC6ebbeNluKo/KdQb/8fOc7x3QfuUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Zr3VFqU7YabtO6KhQrO4yVv7/+Er//iRV+7eWdvSVRInTqHh
	B2x0p7lU3WWhvJ7VeHftW2UJfzBitaC7aNcPvg+BHeirnb5m1aYIKo8FH9JSmtBBKCc=
X-Gm-Gg: AY/fxX6CV2DQL62uT/ZSpiBGfZWW/oMsU1psw71hYOFqYV+dVlLP/PmFztAWapySVsw
	KOJD+WN/zbSK2ikxfvNb+ShPLdeRXirLsG5ry9kIsjAfbzj3KYFIDD/823OjEWyUR0joMIIw77q
	Szrfp9QYB1IhyxQj2q6qMODlKMK9egpXHnL0xHKS39EL8AdD6X2WwTj+wS3owBk0zaP1mGs4Ntr
	1nPIhCbH376A/hIITi+xlT1GYiudJXDsZw77vZyAp+B2yIt9YYHDyaF0flNTG/cPlWYLFfePUX/
	uK3pq6FsklMRpDENOXsZn/qhx6azYrdTvlKz9g8RPjlWy4s+nQknJ/SOTVGg3C4EblEBxNjlfue
	f6loXbgAeJILguyMobCoNYRpfk78fQBxF8Y20tgJpGrciTgZfgJDciVG5W3HJiZJzEfw/4shMAa
	XTNq1UfguGsYYcL/+c7a5rS/VB/JQBIpSYRIT/nMKaUprPf3+rLin73XhFauCkF9a9PyrqXJayC
	Fd3l/sN
X-Received: by 2002:a05:7022:6184:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1233778b5f3mr6944456c88.44.1768477317748;
        Thu, 15 Jan 2026 03:41:57 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:57 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 10/11] dt-bindings: net: sparx5: do not require phys when RGMII is used
Date: Thu, 15 Jan 2026 12:37:35 +0100
Message-ID: <20260115114021.111324-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x has 2 dedicated RGMII ports, so regular SERDES lanes are not used
for RGMII.

So, lets not require phys to be defined when any of the rgmii phy-modes are
set.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/microchip,sparx5-switch.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 5491d0775ede..75c7c8d1f411 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -151,10 +151,23 @@ properties:
 
         required:
           - reg
-          - phys
           - phy-mode
           - microchip,bandwidth
 
+        if:
+          not:
+            properties:
+              phy-mode:
+                contains:
+                  enum:
+                    - rgmii
+                    - rgmii-id
+                    - rgmii-rxid
+                    - rgmii-txid
+        then:
+          required:
+            - phys
+
         oneOf:
           - required:
               - phy-handle
-- 
2.52.0


