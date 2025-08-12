Return-Path: <linux-gpio+bounces-24249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF81B221BE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EDAB724AD4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628C32E264F;
	Tue, 12 Aug 2025 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fwMMmEsi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D12D6E7B
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988298; cv=none; b=guNNarasDdRbfmN3MUdblU6QxbSgOpwukG/EyeaEaBpbA1aBvMN2uDERwGe3eKRHS7Fes7S/B/H+l5Q4UERHcAMC4GxVDqWZvc0cdSJNNLG2e3HYm9avuRh7y63gLvQER4nlJipktkIyu7oi/X6Qn6vE28mqj9anUiJxxMcDpXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988298; c=relaxed/simple;
	bh=yUEBG3s2Iox5Z1YnWor/+RVWc+Tlit/BIkynfNjn8u0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cJFxckfL81JU0tfhj9tfPk1CQL3sebgzXy3wks64lOTwi92qvPKP7RPx51XtVTWfRNCFu8DPnAcd7Rzr3VGSt/dJtsbc3PIGd2xviJXZfkT9pOtvHTjRE5ypsV7f0ZwZmRLRw5Dgo0G3HZyb2juoGv9FW4Bw8bLEIbkeNijnu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fwMMmEsi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6157b5d0cc2so7468280a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754988294; x=1755593094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIMOvue31dwc/J4aquxw833RlbJuhQchriCV8fOzVLE=;
        b=fwMMmEsiVc+pLmQmqeEk98Y6Bpb8sbp7eqUEA5l3qqW+nsDnCJZKbXskaAs5/Gb8+E
         mCQnO7LKfyzy9w3nTl355jSCdt8YgrTUivBHa6YRLNYn8qwTslua/Oxf4v3bCTjFsdgM
         hXQV+O/JyWkylrjYLgYp/706HrGhvYx8ICmSEiPHdg85A6Pa8zn3rMe8W5M/nKNe2hWl
         IoVIHhUn9u9EtCPwfkXrfXgf4tB7U276Dvv86fDq1mhyn99wsMDgi99+dpNoOOHcLDnn
         j46gIsVBp9TyEjpU2itO8FSnxZpu7oeCUcQcBOxsqDWuG9g6Y8p866mX4+NMKLl3WD2j
         k/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988294; x=1755593094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIMOvue31dwc/J4aquxw833RlbJuhQchriCV8fOzVLE=;
        b=PLUnafVtk9uiGwi51mw4cQtnIUDetS3LTEXmldj3FtqkOnv1ehzXYRX0ZbUtKd0j0A
         FFzlBcUp5boNoe3UIHb2+KWqEP+V+b/tKz8cGfr3qvRipsOKaFUhZLZWwVQMbl+zOkIZ
         0y+0jwNMZltURrzpqFOUMr7EzvxWe5XF/NXRUfWtwvFHi4DcLaxOEFTYOSQTeKKHhPjG
         UNMx/Lyace/qSrh9iBX0sAXR3+JkMsNYb2DYOUI0g0AKpFuzzrBqrEhFHn2HD6SYd05L
         lyz7Ipw+pJlxx9Xx/Hs5Un0BgEL+fwlaSXgH7rndpeWtFFZLp3x238K5PMQamK3/AqFe
         C6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdUnLGLSvJa6fbc7LWBVDx9VS6on4F8gQFY1gBPRaobhqLyleGaMRveX7XNxIZQUea/Md2tRTWHqAp@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4E4/FzRH6Wad48ww9zK0I3/PkRvcKzlZVZaOP4GfgGmQFMXB
	lucwS5LjeLFvFFjzgNsIjd3821nTwiaLUS1p9a250R3AkRvtZT2N0tB9GxEO/yzXeuM=
X-Gm-Gg: ASbGncvoLhbOIa6S/cSA7FPPfnJtvp3u/F8QG7TgWtKECIoGbYeW4jvnr1AvveZu1eU
	3ZEWK1oE4EPybPXOJ/To19jSGT2RIFWRP/1XKjwwyPhKU/WIAx5p7t0m1PLKQA0l5YfaQAaFMBH
	NBmbtfG5z5ABddykhgaT+HQKsNPezw32xvUHSnBfZe6oS1TQtxmIsRGH6buCnrTnHhjS4qhWCW4
	4dqiRqx/mhZec9IbWXVSlkdvLsIf+TOY3/6d9PccoVWDhWleZgufkqm+fov5dB7TY8TKJiW2A1e
	Z/YxUw8jR5hn+pA8RZGRYk+zkQB1w5NivLHJycnRHs7SBRpmXeKHvdpZI3HcDn65qYhxJPBr8n8
	CAUczfKxv25Y8vhyLUd4mUhxcBM+k64dMA2HSyvi/qCJzwNloFQ6NUqK1BgRmRX7bpQ==
X-Google-Smtp-Source: AGHT+IHGS28WyNhkMEqCYl++k5tXKsI+SYF4vISQjhRE5gJkG3IUVoDSvuT7pIyGxqFMWkpcex+/TQ==
X-Received: by 2002:a17:907:3f94:b0:af9:14cf:d808 with SMTP id a640c23a62f3a-af9c654272amr1559960166b.55.1754988293947;
        Tue, 12 Aug 2025 01:44:53 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078afbsm2158282666b.4.2025.08.12.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:44:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	andrea.porta@suse.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin controller
Date: Tue, 12 Aug 2025 10:46:39 +0200
Message-ID: <20250812084639.13442-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT binding for RP1 pin controller currently lacks the group
definitions.

Add groups enumeration to the schema.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
index eec9a9b58542..af6fbbd4feea 100644
--- a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
@@ -72,10 +72,36 @@ $defs:
       pins:
         description:
           List of gpio pins affected by the properties specified in this
-          subnode.
+          subnode (either this or "groups" must be specified).
         items:
           pattern: '^gpio([0-9]|[1-4][0-9]|5[0-3])$'
 
+      groups:
+        description:
+          List of groups affected by the properties specified in this
+          subnode (either this or "pins" must be specified).
+        items:
+          anyOf:
+            - pattern: '^gpio([0-9]|[1-4][0-9]|5[0-3])$'
+            - enum: [ uart0, uart0_ctrl, uart1, uart1_ctrl, uart2, uart2_ctrl,
+                      uart3, uart3_ctrl, uart4, uart4_ctrl, uart5_0,
+                      uart5_0_ctrl, uart5_1, uart5_1_ctrl, uart5_2,
+                      uart5_2_ctrl, uart5_3,
+                      sd0, sd1,
+                      i2s0, i2s0_dual, i2s0_quad, i2s1, i2s1_dual, i2s1_quad,
+                      i2s2_0, i2s2_0_dual, i2s2_1, i2s2_1_dual,
+                      i2c4_0, i2c4_1, i2c4_2, i2c4_3, i2c6_0, i2c6_1, i2c5_0,
+                      i2c5_1, i2c5_2, i2c5_3, i2c0_0, i2c0_1, i2c1_0, i2c1_1,
+                      i2c2_0, i2c2_1, i2c3_0, i2c3_1, i2c3_2,
+                      dpi_16bit, dpi_16bit_cpadhi, dpi_16bit_pad666,
+                      dpi_18bit, dpi_18bit_cpadhi, dpi_24bit,
+                      spi0, spi0_quad, spi1, spi2, spi3, spi4, spi5, spi6_0,
+                      spi6_1, spi7_0, spi7_1, spi8_0, spi8_1,
+                      aaud_0, aaud_1, aaud_2, aaud_3, aaud_4,
+                      vbus0_0, vbus0_1, vbus1, vbus2, vbus3,
+                      mic_0, mic_1, mic_2, mic_3,
+                      ir ]
+
       function:
         enum: [ alt0, alt1, alt2, alt3, alt4, gpio, alt6, alt7, alt8, none,
                 aaud, dcd0, dpi, dsi0_te_ext, dsi1_te_ext, dsr0, dtr0, gpclk0,
@@ -103,6 +129,13 @@ $defs:
       drive-strength:
         enum: [ 2, 4, 8, 12 ]
 
+    required:
+      - function
+
+    oneOf:
+      - required: [ groups ]
+      - required: [ pins ]
+
     additionalProperties: false
 
 allOf:
-- 
2.35.3


