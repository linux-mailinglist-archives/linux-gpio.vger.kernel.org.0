Return-Path: <linux-gpio+bounces-39902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VFXXDOKqUmpVSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:43:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D3D742D2C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZH1+HJlu;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39902-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39902-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A860D302BE2B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A8F3126C2;
	Sat, 11 Jul 2026 20:42:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC23112DA
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:42:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802563; cv=none; b=CTjp7IhZ7cLztpsJ7NF270AjeslROgJrsvYItQwJ+vwq0Wma6O7+XM2gU2E4ZBxwqw/+oySgtQTiojBDIvKkEa3jCE9ceq3A+TgLcP4u1Sm9t/08BgeXl/mXefhnA2TJ6EsjcYNHSLCInBUCvc9eTdmFqphepAHPhCqANrJrKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802563; c=relaxed/simple;
	bh=rrLo2METxAPvW/Kvl+v935lLmIy60Gg/5rsQY3LkAQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvosMhkEkj+xaCxka7cukoN1UFRCBZpRyUHZrIviocUuRVFxqF0KM6LJmLIhZSWES+hbW7NKedJdk+VBWRIYto2JvJZDKqBgYZDxg7m+kUJT8jxLXljnpgh3RIzd8FcQ14esoIkoRvRVPLxeaH3qICHvsDIYHn9M4jhKd3QxefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH1+HJlu; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so14016315e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802560; x=1784407360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovaR5Pw/la2QK7dtVGwmXlwaYYgjdR7NRcQLElGlwYM=;
        b=ZH1+HJluLYVdZL5sYy0OaU5R1KkHaCN6IQNnn4Y80YEFDuSCjt1sgUXBtEKO431vJt
         a9MYF8nunimMvItseqbjS1a5ixCFCiiq+7j3LNn77hYp5+ZYci6Jj0stJO4uUn7MlQVQ
         qLxFc+IIWzLhGD8fs/ajD4kIVhlvyKOg28EO6HdQ+42MAf+U8PXCUyNRRm/MNna92ZW5
         Ra90O5KHtd4pqT3t1DY0xgKWPvD6KTcpi4DKx7zZLysnfjAJyEMYOyxNN70MrshG6+Lc
         mIdRAevoJ8ifeH62J708oQcU9bXtp5pJrRunWIUDzLeMkv/i5TTc01U2RO6kdaMy6hKU
         TcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802560; x=1784407360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovaR5Pw/la2QK7dtVGwmXlwaYYgjdR7NRcQLElGlwYM=;
        b=UhsirUczEKfFXqKfuw4OdKFZ0qTxZ/7JlCnk4lLVy5PTYqoiBUiLgsl87j93Pc5atQ
         qgydoc8G8h6pqbFMUEr6tLmVpmFMGNi2bd4u9Oa2fV+kNyCBdOG4immTE4dT9faQnNa6
         3IKE8msbpf+5JbCOhvHLgKckLwamOB6wZ2o67Jr37UeeALT0GUlOsAUpH0zOwBBvkxBx
         vqx6zhTuw1ARzCBwubB8NP9HYugRnYywQg7sL0uW7rwkez4DVwTUKRKezkyWPz6mVM65
         Ds8Yq7fmYjN5kU5MozypAsk7gerbsqf0SzeAWt73DoCpo1NHAYS8U/wuRY3hp/OYWJxz
         Is0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ajZQ8piCtuMp7TVgTRTlVPXGXS0aQiN4VlIdbjHg5QoZurzoxlBRxJWIiOrncAWooZczQr8T5ztv@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhGQ34F2M3mhu8T+Kt6XV6vcwOwUevMAA5pcnKguSOFcD/l2f
	kFi4DN/d71JQ6UdHhBfg7N/EHTHkgEjLFyWGhyaL0SRv9AkVfeFgRIEe
X-Gm-Gg: AfdE7cnU/CMrlti2cdqG/fekY5ESIec9EwsK240G46RDY1U/B/7IJvDUatN7iq57bxk
	r987axVMVx3Qxxtdx9r0KS4ujG1u/f5g5M0nnv2njlVjWZCqhJwyDSxpfSjncPl+L3EZKcGUeaM
	c5vsGLrToz51ouAF5CUAcsv79bEgyVStN6uT5/elFLQ9irwP4tlkO7lTU0/0YCemsnqmN27owqH
	tmprVokrlkQDIko1TGG4jtcYIGhp995HRJNnADhJ4MeGyilAJV2hbVNqxE9YOZHEB/AxPT3uacC
	xSvi31AxtnZUToiGej5spnzm/96ASDv4H82EPI4QJiVv7sDrr/k0/AtwrvqInE7dcF9P9pDYFht
	K8bqCC8AeicUwgsaCIHTPMfyYez7Ypzl2Mkzed7GLfaUTJo9XOGmFGO2GQ5PBcG4wzAOckTiTva
	E94jtlcNEGMeSQsf/eac5sPNoQv/kSMrtMJg==
X-Received: by 2002:a05:600c:310f:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-493f87d5d1amr31985415e9.5.1783802560352;
        Sat, 11 Jul 2026 13:42:40 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:39 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v5 1/7] dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
Date: Sat, 11 Jul 2026 23:42:04 +0300
Message-Id: <20260711204210.197144-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-39902-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D3D742D2C

Document the optional CPCAP charger detection interrupt in the USB PHY
binding.

Update the example DTS to include the corresponding "chrg_det" interrupt
name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..d6d52d21280c 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -20,6 +20,7 @@ properties:
 
   interrupts:
     description: CPCAP PMIC interrupts used by the USB PHY
+    minItems: 9
     items:
       - description: id_ground interrupt
       - description: id_float interrupt
@@ -30,9 +31,11 @@ properties:
       - description: se1 interrupt
       - description: dm interrupt
       - description: dp interrupt
+      - description: charger detection interrupt
 
   interrupt-names:
     description: Interrupt names
+    minItems: 9
     items:
       - const: id_ground
       - const: id_float
@@ -43,6 +46,7 @@ properties:
       - const: se1
       - const: dm
       - const: dp
+      - const: chrg_det
 
   io-channels:
     description: IIO ADC channels used by the USB PHY
@@ -91,10 +95,10 @@ examples:
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
             &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-            &cpcap 48 1
+            &cpcap 48 1 &cpcap 13 0
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "se1", "dm", "dp", "chrg_det";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.39.5


