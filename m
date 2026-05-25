Return-Path: <linux-gpio+bounces-37472-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDE5Lf9gFGqgMwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37472-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:47:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8565CBE0E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 16:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE61930058D2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B1F3E9C32;
	Mon, 25 May 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGGlizXL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB60248F64
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720445; cv=none; b=hslzm5lp6h2ICDK038NrJq+lpfgsKmCpc/tlZ++8bomjZ+S09NlWuftj7IS+VYHtRVOYM63Z8I86dt7QV5aTkHEn7IRv/XcGDYpUVBgMOmQtJgtLj0QT7qbYLKPmRcYRLnHAni09pcj5/Pd9NHIJINSVac3l24rEXji4y3BGRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720445; c=relaxed/simple;
	bh=DLsg2y1+bliXCGG/reyDyV3bIVP7ZQeG9EfRj65TbF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYbQHfnMLqweEzoLt4B+XytUsmvtuFPNyJYgAdIJWv98FMe0oGNc0avmx/Y/OPgT1BshWz7mhKYeUnRGwuKgHvO8BBQJb5A8xZ6li8rFn4xo+YgbEy5Rca0kg7pROsxn9sX+78eeMYiT60HrfnrMt0ax2w1bwTQKNcNC4FJCNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGGlizXL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36aa4ae1f11so1053773a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720444; x=1780325244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=JGGlizXLFOdXxSL3LwmSAX5532L9SEsX5fI4bLNm2kQmqrVgQG2+c/OyyHmAyDHS78
         N8butyk0xZ3eHFiXZExuQQaTWYC5/xiD8yKRSPR433jJ3q40G/6wJCe/MVthxSE17ar+
         f39ON8WjbjhavWzVG4VqinC7WcjHaMWDtW4v+zJS4KE7tabYpP++Jl+274wrLtBy4xPh
         Rsk6aD79zPGd128FUBX0d55bGRnqWO3o5p9YS8bJB2/hkiAtPD4FoA9Ezm5MK43KdQAF
         dfTgc+G6N9X6xfZYWrKpwoIurQT4DkvjHNwgDW530ppEazyRl5/dEXJLsSQQ0O0UdeVV
         LkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720444; x=1780325244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=IwT8man7Ecx2PWvOoOcvkThTlFVByMhE5b/vZJQvNIh5fdpQfxrbto0iMeCNZ+hRTC
         PNB/scNJ8xmf4KItX+NlPkJiiD421y64CgrzD1Cm3B/8DVwFj6AXElVpDkbw+/jzOsLJ
         cLy/yqALOlOdDFsaz1yolFsw3t1+W6cpEpE01IcaJS4K0MxznkLnJlHM1YajAcQT6IZ7
         hLrtwD0OTveD9Nh9Onp/TP03VZvLhs6knMF+CHiqR/OL/qKlV+2oYOgM1EHrzU+bposR
         5PomRtaCXr/6aSpHZOlA34eACY5hGYqTWgoHzneOj5cpUPtVElAGFEiK5S+xp70yEWnL
         ld2g==
X-Forwarded-Encrypted: i=1; AFNElJ8DvQBFwgJ7dcKt9ThlqB3weHw6ZmkYOb8CLQkrWkJWsqUgWai2I7sAcx1b4NFsihZ8b/9xWlq791vd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfm/Mg17ussAFbW0LfSVegQohM74yPeXcShEqOoy5zu9IBQJLt
	puYoX8YKCwTMReKI3xinlBAoZixSktkS3ve3KasTInppiUdRasrM+Vkl
X-Gm-Gg: Acq92OG9HbgZec8XAeXzZlTMTB7mQX0n22GwanlXe9CzfSB6zqjLKRgzjEj2DRBi/I8
	FBs5A6SaO+ei8FmgI29foF10ulsTvsDemAVGBwOvDwNrDP8pn3n6/Lqa+NG1oxZqJlZCj7+ApRS
	QlmK6Bx/G126JnVAI8wc1A7ROjtiaeR1hJKL2mGaA9C5wPffYkmyH+Rpg1XCP+wO82cm/bmcijr
	0x2R6NAw7tGDqc+iVCnRAhnIF7mmfbbAkq3K2YvqtWt8sr60QOcK5xS2+aj9ghp7z1u1T4APhnO
	UpdD0Uq+yVtmpNjK2Xmauwcz8Qcqw5uSF/J/xxO2MJdd5Z8LHo4e45TldTyjN0h5Ae+0E9XtfVc
	0T0MjYVLCZu/w7n8oK0gw/KpaCrdiyAqIqWOLs04/yqK0jD1gyBAqdONJdWacYSI480Io7C64/a
	lUSgTH/0eJBtFRcIp/zTJjUFoKQWiotl2fIACwEEg=
X-Received: by 2002:a17:90b:1b07:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-36a6749ea42mr13774833a91.3.1779720443648;
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wei Xu <xuwei5@hisilicon.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: leds: issi,is31fl319x: Update description for the shutdown-gpios property
Date: Mon, 25 May 2026 22:46:07 +0800
Message-ID: <20260525144629.498630-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,foss.st.com,socionext.com,amd.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37472-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,tuxon.dev,hisilicon.com,atomide.com,sartura.hr];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4F8565CBE0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IS31FL319X series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Update description for the shutdown down (SDB) pin and fix the example
device tree binding.

Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 906735acfbaf..ebf2bed51e7f 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -39,7 +39,12 @@ properties:
 
   shutdown-gpios:
     maxItems: 1
-    description: GPIO attached to the SDB pin.
+    description: |
+      GPIO attached to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
 
   audio-gain-db:
     default: 0
@@ -174,7 +179,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
 
             led@1 {
                 reg = <1>;
-- 
2.54.0


