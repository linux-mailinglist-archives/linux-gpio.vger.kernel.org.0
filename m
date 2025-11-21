Return-Path: <linux-gpio+bounces-28959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF0C7ABD0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 59AC2361641
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED25B2BEC44;
	Fri, 21 Nov 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDx3H+Fx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9AF31A541
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741331; cv=none; b=EryyfPU1eQglpEdQKisB8uVYBT9ulTZ0DgQnrgEBR7CEaDDsiu1iNnOJ8+8xaYHPt9xjtJPxIBx5keY4W5YBsh+5Sz/zkt+tnK7cKeUrI+U10t3YDXKqWjS39kLmXJ0H41xNoHZGlmPvAhuOgP0gg0YehKSS8uVrsslfP60Rn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741331; c=relaxed/simple;
	bh=vLOSdopcos+SkH8VDD2/vDgIes8aW5yV8lFpgtvuZAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkLbwWu2+vYsbJWvSkMBzKfvcvlFuKgj9N+Nfe/PUjxOgCH7p+DaPcNue1yWUEzfzXa9x/ZfH2Wam2Az5dHapGsxvDp0n+Vr6B/7O1nRw8V1szZAyA4n3uWkGtoT8hH/2lm5JnEnuiTD9INMqEsHt1scHTCjuiE49oW8xFr2+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDx3H+Fx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso10204225e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741327; x=1764346127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+Wk/DZC/1jKoY9S4btPUpx3LRrFHvRovKMVm+S1oW8=;
        b=JDx3H+FxUATBpxZyr/m8v4mTFGhPIqcPFKEpdMUbK71hFnoYB5JPGgQNQloEJnUvG3
         abVAQrvbWF0Mao2FAUaMq4zADmFY9943luYXZRmm2f2BEMxFINmtlHyaymh7E5pG1r4K
         OTIcYKnWmyhlMf5obB6I6r7ptgLuUq6l7k10YzlKU8DGafaEmOAy7SlStxTXUeuE21EK
         iAh87IBFm8sWNirt8AvPgXWQWc46C2h7ZR6WPt79T32prVedKNiT2e5wrz/XyB4Hf0le
         WVI4tJ/46pnxOLg1KYiuNnqGbFqA1iNj0fyv0jSMcwp88KtJp1wNIBB3DvBAGpxhBQC3
         qeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741327; x=1764346127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8+Wk/DZC/1jKoY9S4btPUpx3LRrFHvRovKMVm+S1oW8=;
        b=jSvMc7qPrBOQc4lDUbSvLOAOtB/Fg8LezNTHdOft7wtK54VohwIbHtWhYui1oXjTN8
         MjgCfxkAx28CGCgCqNvUgVNCSCiecLXC48i7wJy8NjofDT3vlTh1ddZxzPGXzsVlFmV1
         fmR1GNBoojZI8NyCeY1XYOZ+MMR/yKSg7Xx7C58CPY3EWTEbV0NUunToDH+JSNWUqVjG
         MtedAYCsi7H8U7b2sM/8tdrGDLX50ib1A3SuY7QqZP4YKVNv0z9MSThZCHGkhmfiECzN
         djihX8ethBHTsE2UhieoJdFpu/y1zgSgyjv4jHh8cx233i3vpl8NrmgpV/DcnNgIoU9a
         RZFw==
X-Forwarded-Encrypted: i=1; AJvYcCWA2zvxJGiPHcpdIxl8MNU8b0F/OypcRhrKS80y/XEhsocHIIvuo5M2a9CngjDxDlzQI/BapcC4tiKl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VqdMoIitz5v2SPmHuGNV2DDn2UKIIGUXpUdp37cQ/g+3VS0p
	a5LoUlffOB+3CNhzr8t2JZ2sUpAPTkfLVr4hO8vZfK0v21R7qcqohXUv
X-Gm-Gg: ASbGnctGtXLxG0qyQC3iNveCqbjsykMWoaMZveAGYNUjPYRmJIKxThq6RwbQBdzuGnT
	zogGW3UHVXZmPVRu02BUUdhNW1XDjREbsELftwP3OQAnL39g6Snk9fWXzucxmEnnVwJRS5UEfEt
	zhbgpMrSe0kQ+ivfhNWbNyrUc8Q96LM6SA0Vm0QpDcsMQ05yquxlQnnc5a7ouJkIAl/i9hAJNbR
	7iNmwIrjAckD0zRbBliHTXcEfGnQp++Sp+SRdyw1wWlMAdrdNsnDnvEHno3FIa/YC5hVFH8zxGe
	nza4EemlDLIHIpeEb9/UbIGfM1X54D48+TYn621biJszFJ8xZvAdXcz7HhKs4xEgp5DtO3/q8wS
	rs3RYYIJ+hIGXccheT+AYc6EMysc76TV2cJsBR7ZH3vL1yyz/GQ8hbMvHijYGTFffH/IE+/VXYq
	uOpwZiPHJh6XMO9dSLo9MohBc0qFIYJWJOks1bNCxZYEG07abbcafs6xdjLoAMUd0f1Qfj+GMAp
	bErU0MGJg==
X-Google-Smtp-Source: AGHT+IGjCqFLxEMBJ4ud3ry8gt0vlXxEsV38yvB3lG/lXorjvCf5r83VhQzMFrWRvA7XPPNuWhMKVA==
X-Received: by 2002:a05:600c:1993:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-477c01b495amr31137505e9.18.1763741327362;
        Fri, 21 Nov 2025 08:08:47 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 03/15] dt-bindings: pinctrl: rzg2l-poeg: Document renesas,poeg-config property
Date: Fri, 21 Nov 2025 16:08:10 +0000
Message-ID: <20251121160842.371922-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document renesas,poeg-config optional property.

The output pins of the general PWM timer (GPT) can be disabled by using
the port output enabling function for the GPT (POEG). The HW supports
following ways to disable the output pins.

1) Pin output disable by input level detection of the GTETRG{A..D} pins
2) Output disable request from the GPT
3) Pin output disable by user control

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Add ack from Rob and Linus Walleij.
v7:
 * New patch
---
 .../bindings/pinctrl/renesas,rzg2l-poeg.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
index ab2d456c93e4..ae027a490206 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
@@ -57,6 +57,21 @@ properties:
         <2> : POEG group C
         <3> : POEG group D
 
+  renesas,poeg-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2, 4, 6, 8, 10, 12, 14, 16 ]
+    description: |
+      POEG Configuration. Valid values are:
+        <1> :  User control
+        <2> :  GPT both output high
+        <4> :  GPT both output low
+        <6> :  GPT both output high + GPT both output low
+        <8> :  GPT dead time error
+        <10> : GPT both output high + GPT dead time error
+        <12> : GPT both output low + GPT dead time error
+        <14> : GPT both output {high, low} + GPT dead time error
+        <16> : External pin control
+
 required:
   - compatible
   - reg
@@ -83,4 +98,5 @@ examples:
         resets = <&cpg R9A07G044_POEG_D_RST>;
         renesas,poeg-id = <3>;
         renesas,gpt = <&gpt>;
+        renesas,poeg-config = <1>;
     };
-- 
2.43.0


