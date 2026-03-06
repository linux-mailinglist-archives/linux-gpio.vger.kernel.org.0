Return-Path: <linux-gpio+bounces-32683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJDLD5bZqmkZXwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:41:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4D221F0F
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6E41306D8EB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEAC311946;
	Fri,  6 Mar 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFUDe1kd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3F30DEC4
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804064; cv=none; b=C0Mrr/UiM+Ona2FuvCscWmsQzLUro7BCbsStOdrR/+SWl8hVpXSsFv9Ir+VVUdxRWsqIbp+2uy63bco5pYyXaCUdqpkNYCpDKsX2D5MRRtXwsmk8IlRAByO601AI+L3GM3z2hlTweWMRmHx0U65OV3ALnvKt6i8iSt57q13Ft8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804064; c=relaxed/simple;
	bh=sQMuxREvI14xCKQr+ivPy4kgzqxvGsoREnyqbhHL524=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArCYAYaaGrKgSAHxKKAKJ+QgDgeTehII/kFLAs4t6BS5OrmfmtlKWbvyPh00g6dzHCrw0eEFUGcaF2NM2B228TYTQb8bLdX/8lH6h5/dtASSSvYuLXl6tbqxRPDvkx9kX6bM5uqEHleROSucFPTePDigNwJM5bjKH2LZ8+EASP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFUDe1kd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439af7d77f0so5452959f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804061; x=1773408861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMYqmIcoIdZ/7uRWwTU4Z40LsDbT8y6/p6+mjdfeyBI=;
        b=YFUDe1kdAh5BUzJm95SlbvEjrWMA7kFTutlYeMjc8EHdrs75BLE2c3ZUIVrsF6kK2D
         BhNACTsYr7mAFRt/YQ4IpwxEdR1CGVmsPBxU5Vg+5FRm3ZeBMMrHrM66zrTnjZdk+lmw
         6zp3ybRxK5xJYyFOVcCmiaJT1PpVDjeiz3WkKf7BIY4AoNaBzEiCBn1MwCHHRjRoR9x4
         AuzJErommwOz/6tCdM0mc3bl7X0BuoHIwe1tofWcebeO30k9+dE0EjADEtTpeI8X8BlY
         wF/ZcbTF44HNdCqfhDzyPAcczaG80hMxkPLiIz9/TWjQPYzwjS/h3JRervtuY3bxYoDG
         9X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804061; x=1773408861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMYqmIcoIdZ/7uRWwTU4Z40LsDbT8y6/p6+mjdfeyBI=;
        b=mVtv0kAz+ZbBJ6QEzhafXkLScJNNMHZX9+BkVJjxlLT3TrFmfpti3vReJF2KkcOaSX
         oCBxd1ZHXDWCEj7SjSO7uUgS6bcl39q4GX7DvilhYsA55ObnjBZWRbivaFvQptn/F/0E
         eeK6gdVbJQp4h+HXYXovqGCmdqd39wtMguKueMZI4N7OqT6umo1aYmmCDy48ezfuRtXN
         9v+fUNk6/ki1dhBVkHAr6Fzc3eWtI1E1MyrkBPEnMaQY8dhV6M+wTjxPqY+aWMbl5HNi
         Oa33BbAhMoEq65lpPWyjK+gAP/ME9rZYdbbmv48cBB1Xvsr2B5h13IwGrtzn0q/t4SrY
         uqbg==
X-Gm-Message-State: AOJu0Yxxs0HrubfMKJ4vYO+Np/WmptbueBM6X5donXAQTHfo05IGZOVP
	SasXjybsUe4BNS+lhbKf58hPCMlD6M/DGNsQOpYZ/NxIvP6kRhYdbMqD
X-Gm-Gg: ATEYQzy5vYEvElmfsqpGA7axqFmfi++MdNZ6vNMxDmJWU0zCPZWHJmAxSTXnuLJ9QZb
	X0S32YjI5gvRkkhZoOitoxz9pMHXsDOBa7bsPpKiArm2XbNluuxt+rlsNtmYxUxXSX/Ka/3OVzQ
	PCQF7gZlcGQ+oRNzibjAuF/BJBTX/LwyszyPWmEZ6bDtu2nEqW5PsWY4F2APUV+buEbCuWgikyk
	OEGWF8CewLBxpefOsZAsFSkHRyszmiueW+UXmxl+nG4OebJyzHG78fQ43zdZ/DySUuNSktsEWaO
	RvKBlazlvnwKqm1t+t4HSbl9gyQChDFuf4phqnJN3jDinfvvcWI/0F8xhj5Tln5jP58rF8R7oh3
	Z70bpXY6KPsKPgWr47XB+n2ac/SIxXQfJ6cCz6lCPQ+wPT2ghFxnuQceO58bvvvzcFNxLE4orpc
	c07SCjQE3CGir5
X-Received: by 2002:a05:600c:1c1f:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48526967ce8mr36182365e9.25.1772804061356;
        Fri, 06 Mar 2026 05:34:21 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm80856735e9.4.2026.03.06.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:34:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 5/6] dt-bindings: mfd: max77620: document optional RTC address for MAX77663
Date: Fri,  6 Mar 2026 15:33:50 +0200
Message-ID: <20260306133351.31589-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306133351.31589-1-clamor95@gmail.com>
References: <20260306133351.31589-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AAD4D221F0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32683-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Document an optional second I2C address for the MAX77663 PMIC's RTC
device, to be used if the MAX77663 RTC is located at a non-default I2C
address.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/mfd/maxim,max77620.yaml          | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
index 42cbad56595f..246c7f9e572d 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
@@ -17,7 +17,17 @@ properties:
       - maxim,max77663
 
   reg:
-    maxItems: 1
+    description:
+      Can contain an optional second I2C address pointing to the PMIC's
+      RTC device. If no RTC address is provided, a default address specific
+      to this PMIC will be used.
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pmic
+      - const: rtc
 
   interrupts:
     maxItems: 1
@@ -192,6 +202,16 @@ allOf:
                 maxim,suspend-fps-time-period-us:
                   enum: [40, 80, 160, 320, 640, 1280, 2560, 5120]
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: maxim,max77663
+    then:
+      properties:
+        reg-names: false
+
 required:
   - compatible
   - reg
-- 
2.51.0


