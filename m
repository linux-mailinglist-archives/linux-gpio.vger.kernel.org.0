Return-Path: <linux-gpio+bounces-39891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gzm5Dg90UmoAQAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:49:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E474242D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:49:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CTbo8JvV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39891-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39891-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5838A3035D6E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444E3CB2DA;
	Sat, 11 Jul 2026 16:48:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020A3CAE8D
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 16:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788510; cv=none; b=ssp9btXgdXL0RY24YJwsIaozjzGcDVEZcEs4djcbl3R5tCdMsm5kiOgzjCCku/X41Wi2g0Ak9iQwu9iGEsYtgduQHiUIWZaxNlSp/ckDlbKMxUg6H4FnMB4xYT3g5mrRfUlDy1QptBix3oPswQ2L2/Gc/LkV9D5R3NfNXdcq8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788510; c=relaxed/simple;
	bh=rrLo2METxAPvW/Kvl+v935lLmIy60Gg/5rsQY3LkAQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMNgJsPpJ2jpwigl5I8SRd1JMbEqRujcgov9DSg0LLpgZs+xKSM9rODlc4BGmqxMVZv0NOR9G5sxlgr4iqxdKnK2u4WWygtFwqpkvJhXQFcAkL66bcSSmdgrbXUVbN1uqDPMBVC9h4xrJ+ZHtFBv6cr3k6vJv/RRJ9zSjj7dEHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTbo8JvV; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1201639f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788507; x=1784393307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovaR5Pw/la2QK7dtVGwmXlwaYYgjdR7NRcQLElGlwYM=;
        b=CTbo8JvV/2tDtnkbraf1mKjiLGCdEj/uCPEo5msQ2fWddssinHzY1BCRdcoEiMzPet
         hltcm/IWk1qdwXugx5gqzpsQju94Golx1+KfuXKUNnh6BSUU12SOC04HaX95sfiig+pE
         zyyFXSiptkq+Tig0px/Lx8PfclHSRB9R78wsb6dO/jG8Kq9YvJ0Dq592q50tY+2DTjm1
         M7+gPUPMgL8KBvM82DbLmvazEQtPAiHIGzsbeZh8iTkh3syl/sIgJ1Y5wZ2jP3Z1DEQK
         rxjUN5swjkylue9OWc5Rp3o3kouHMGS0rpCgTAWR0QpZp8H4Z2v9nHmM5Ti9igEk1K6l
         t5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788507; x=1784393307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovaR5Pw/la2QK7dtVGwmXlwaYYgjdR7NRcQLElGlwYM=;
        b=ANfAkbp/Nefkc8VlpU5lJbLOYVo41g/9be+7wjouX3ksg+8VcNO4YrCcV83ro49/Np
         nJvK+5CC2fcfk1Kr1teiwD/1ZqKUQu3WlaUzH7BlXI/1Yi3/+8lsBE2Xg05e1KWMLgBw
         JfWWqCQkb9Gtz6XiLK+SpX7y5KninMK2t0IBYabyGhrYLt4fvImhfmkQJMNkip741zx0
         6iBOLHDjYvvODXG5R1NfweFeOMPDrJFLW5wk+H+eHM178JTsDX+a47+jLVSXkUYK7Tt2
         bvH0UmsNm+SPE4hS3J6G4baFATTLC8CRLWbFQN8Rb2I7csOJLdmGq6zsDxDH8GtXh+wq
         VRYg==
X-Forwarded-Encrypted: i=1; AHgh+RqpPBD0sHUDVaNiGroK2Ke2S8ylAksfVrtwIP0aQ9lo2FS65+xbD8gZLANT4/nXEVteIr+V1g3vMg7b@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+aVQ9qi18w6ThqtQVR4AwtRLLbW/gsQEDbGC9MbdW0eycItW
	utREJ8fBeQEIOFRx8voz6Ql4C9vz0OjbYV1gGvbW1iRIgz7h05jXZVkF
X-Gm-Gg: AfdE7cktoSFn1ZiOVAAMnFTPTO7GNJK1gAnNK5F2WUQNr+gyGKiuO21GxnFSesq3aDF
	+QN/tKTWcJLvwI/k/ZVPY4k4vULET12xTfOOXGpyc0ZqCau6DiefmzCRvvCGZrg3wCVnHFN/QPE
	T0LRv3wP/cxEX+PaevqNSa3UW35vyTEr2EF3F/wPsHo2Bjrsx44syPOvnZLi9bfbmzcLHvAO+Ae
	a9tW6BrJOPxlY/PwILm0LuoS+9Ka2XQhCiGFVLLykLHRBrvjVUOUcKokUF3d2xdUgEvT2eItXZ7
	pa5PaE6GniF5Kg/wKUFkOcolt6OJk9jYEX5SUJexg7O0w9pVBHuOjxwWreqpIUK225hgbxyIsM5
	UzR/7D4XuyWXoDHiWFc2nkCCI/XjwJxQBIokVn+odYptcj8XyG9jNeRp6RgBInXGLaJcnYwEyDI
	sWEzCXn/nBggMX+NWiMNyhiWiOlLQLQtLD5g==
X-Received: by 2002:a05:6000:24c9:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47f2dcf400fmr3364939f8f.38.1783788507031;
        Sat, 11 Jul 2026 09:48:27 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:26 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
Date: Sat, 11 Jul 2026 19:47:49 +0300
Message-Id: <20260711164754.185565-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39891-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C57E474242D

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


