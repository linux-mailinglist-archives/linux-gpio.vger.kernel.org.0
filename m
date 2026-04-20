Return-Path: <linux-gpio+bounces-35277-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPZnMnWc5ml8ywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35277-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:36:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 232744343BD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3202300723A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 21:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC3E397E91;
	Mon, 20 Apr 2026 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxyA3F3r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304E38838C
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 21:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776720995; cv=none; b=OmyjJidN+kRjZt6R8QAE38TxByjpJFC2AXk8FCD3709kAiUZBXpbgwXd48PYdZKxpz1DnbNA52SekXY7iDqiZnDeIDnbnGtWL8q6sf6HGF373lXguwYPoCPXExCJakSf/d+rabf3IG+I5q9P8QWSkI2Z8LDZXZzRW6xUrsG5UkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776720995; c=relaxed/simple;
	bh=EKvdaIKyTKvcKJGyia+SK7d+HUNcnLjmavHs+qnlEDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MF/ZOfap0tx+J6s9t0K7UohlVeOMtn7tfC+tJY5fNJCRdXmlt3YAbNjfWAhtlSHl0b6B3wAjieBGtawv/aEv3VwAk+8VZKatUYqfs6TSbZKfuvRYKH/xm2QjtxLZfCYk+ejdLpTkjhAYIV1sqSxEWZbOG/yYohnWG+ez0FDgx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxyA3F3r; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso13725285e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720992; x=1777325792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=JxyA3F3ra4LE3ND+V8+JSqnBRDB2tlPE2Flnz/ivNKfjbfH9/rrwBEFRuMQwKzWW5A
         EGOmQJB6MEyMHgfMLGMqddDFkjBjciugY5BFnL9JdcMomFOnGZdgwWYpps5Ybmm2MUrN
         Ad2J1qddjha+2HOC9hf6T3IOity3ZRYCi+uX1P4h6Uw3TJlp17n+RGVIG8miACN9JDJ7
         kmUEEXtwRTUy3VqWRqMLXvnh+E60xXOvtGAUhCwr95rxAAkU12E9DZ6dMmciORPXXlbJ
         RRziC8tuXHv9YnEuTUU1guytduNpPRQgTMJAWwiT8FUdl5/kde5Q0fyxP1RC/PO4e9AC
         BMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720992; x=1777325792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeDXgOZ2fJAOAlM2C3zm9hiJl6sDVNOXzlY1iVGrLts=;
        b=K8Nkl/PDBfekpDwdPlsIbmC/3t/MjXUli1VNBMb7ukbtSOGTa3F7wloAcWqobwQUz1
         UwoJTEksoS3UIxF4itunmQkdkpYQJitq3Q6acdkue3aURaQBwdJKq9hp4QMha8mOE7vq
         bvZ0BfVXi6ZB6RN1gdB2A+zG5kykAnREI4/2veR2cfotaV/RuGpfTi1CSvbksw+m/+HM
         XdEsh7gwz5gcpjpr2FtrDzwPQJ8Eg1mxjqbSLI1b04vt8FciHD38h5L3873VCsCViIop
         ShrqFGC1V2FvyoSs6iiMbqDqxpdoWx6JEa3LoPHxpmkaYvINQKCnCVtIjP9yzw9Hbi7r
         /uNw==
X-Forwarded-Encrypted: i=1; AFNElJ/6p4eVzLlQfGyfbZ4Nc3D4sxelaO3GJur6Y7qY0tmwv7M3f/k8wHlGUdxILZAoHeL7jSeyc0Jg1JZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2Yox+mMjig21Gdb6kfMoGrK3pwoFBnw3DjDDx5RKdtNUs457
	lsrFRNvjkaEBm7SoZKA6iCLKzagzCEnQXf3sZxmknNwiSlBye1May2c2
X-Gm-Gg: AeBDievd7BT7t/pXFXBn6yV3b2Ya/GjESgSc+mnswv5Cw1PYq7UCZfhJ0q4+FVSBQDn
	D1ae9lJb5bEvKdzePQMtclr4n4ltMlIf1FGjJQ2v3bP0spk1B+NTvl3Z6Puszwg4F5pl9d02KVq
	gjKtdrlDWNnSk+eZXCe9EoCXcJQzdkbk+JPESjKEMGoQQxmkZ3uXkagQl3Iw034rD/gIDfY3tnY
	cDKgopUx73HiScATRCohRx1fBH2+oDnFJvnhF1g/ngg+RsOxp/LOO+gY4ZEwfkHR5NQwMF1mpkV
	D72b/qV9B6SpJZkOd40ivrwPg1RH8qyyTFG6H1jmOJAnRH0E66keY96siuKBkDqSy7FPDvsRPLS
	UKusVypSnqntuyDgGBQIQ1UTuDeqqi5xnGUGL1keJdhIK/Kwf45nuYjFLCYy85lxtQw8wlw46eY
	PzzqoII62Sq+jcATswtHTnyyxLwl4xnQ==
X-Received: by 2002:a05:600c:1907:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-489201cdf13mr58952175e9.12.1776720992169;
        Mon, 20 Apr 2026 14:36:32 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:31 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 20 Apr 2026 22:30:00 +0100
Message-ID: <20260420213529.1645560-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35277-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 232744343BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Its MFD driver
does not use the compatible property to bind the regulator driver, so
don't mark it as required.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..2866e95e338b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
@@ -231,6 +236,22 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6392
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/mediatek,mt6392-regulator.yaml
+    else:
+      properties:
+        regulators:
+          required:
+            - compatible
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0


