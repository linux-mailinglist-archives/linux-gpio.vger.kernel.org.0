Return-Path: <linux-gpio+bounces-24200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8308B20D6B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC6B17D0FF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357592E0927;
	Mon, 11 Aug 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DMqv0+yo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135532E06EA
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925489; cv=none; b=VOMX0QzC3OGlJteS58acCSWCfl3kCovXbU8pLziwoiP7YOkgnF8Pkm5aGpKMgIG15kHXnTgFw/IMzB9rKOf/GehJtuU09xH7g3pD7Ryhqe+EDAUTgIwGrG1KzG1yThgtWxRJFFBEX2t8ItbRJDh+8fZWJxRhbiUvnTKgpQBJVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925489; c=relaxed/simple;
	bh=YvWvllehKsY0eU8l/4yDh9aRcQewZPW2zyG86okcjvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/Qeejf4TTriSiVSy+tRHvPqB3EYCunstVOXVk/eNcCBjwxESEHFkvfStTy5MVlRDziOIa9B/IQRpwWOvUI3bAvzIByBCvd25ZitJ3vWnSJkj+faDsL3+wion8Bintdwv2lZkEoUL8/xJLz6MDH7SzFw0Butnw2NMAU3tG+PKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DMqv0+yo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adfb562266cso615108566b.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925486; x=1755530286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zhh5zaRs2oIpYFCywf4aV1Gc4V+uvx/WgvPXoTIlm1k=;
        b=DMqv0+yobTAyM91z4NzN/4oh2hr/MAe7td/gR0I4zmjGfVpdx15GBl7cbemZexMUjU
         3wgobkmvDin6LXVZrIO7BYdbkh5G0QpioJJ+RThHorYkjCZirZ9phowRd8UkLV038sdG
         EM9SE82p1Hv+PwnNbTZw9xInsSR5Gz1aibVjzriem6zLdax4wm6akVZhBmSftmd1xLLL
         XsF2d0P+3CjuEWf2cuogzfT3XZ57FpC/kMwTFUzdcMckqafggJ7hLo80rssrn9QPyejN
         DzkRUL0r3Bu0BBTxTDG0u5Mk/N4CdubSXWzXSe8GVDeYNNlm2j4JDpIneNLVd27PU/4a
         MkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925486; x=1755530286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zhh5zaRs2oIpYFCywf4aV1Gc4V+uvx/WgvPXoTIlm1k=;
        b=rvkR0L90hFyRhTjcAx24dkaEGvpgcYpffVE9D9IUqYULssHc4iZRDxbEmnLHRc0OLC
         JloXiIg722ENA84a95H/O47DkQ+jDFB51pnCuSzPm3Bj2F+MHsfCtdZUqi4iVcNbKZ3m
         ccLoZJnTy5djzPs2toPu9e+5wTKh7b0R/6dw9fJ+rIBhNI4b9Jv8ixCj/gnD9gR57Aup
         uG3FuImW6YtfOOQYJvUs2nLyJnmIanr6IbnUlN0+f9/nfORGUW03N5tfVwGK0iFcBnPk
         bJswCSNirZ2IvsctFpl8BEOsWM53043fh/q2NeuS7DxtF3r6xd9LilVCxX6AgvuLAPSo
         JovA==
X-Forwarded-Encrypted: i=1; AJvYcCWQfBYsTq/d9reqTVsJIp9OA/hDb256AHi3OEFl8MdrRlPMqIIv2xV8FlfCFuJoTK9Y3YPhnbfoUFj0@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHBOGo05MtUCSTMpRJwQ88C5oXVkg6yNeH6PtRNZPv9VEbFop
	QBHhsg6MXSE9ozkQZsh7JTtTCG55ByP0gCnWuP1oHKlINDiHcbLWQPnpomrrS1FDjJE=
X-Gm-Gg: ASbGnctSIxERdvqwRQ8hYOZRTq6kXZz1VPKHzWlKM7oDHgqKGEvAHxqmTWQVfXqYCfx
	exqlgGs/6ZBaQFxO2pULEg9NlgqzYZxKHrZYYtfA4WuMg4oCAaV3tpVosh3vN0ZrRSAYn9Z3G6I
	2hg2PmRZew9ywRbi9JjH2qWWqomo3RKWEXUUldSwYXP/DBrBL6Y+RdjB4V4LFtY38w4N+do/le1
	AxTrstkAPLIH0N2LtgHbaqnOnF+iHR9a2lQx7ADD9WaW9PTMZyyYhMt1Fv++qxPROfZy8mkear8
	OXkJh048SosHGEU6qdCRL3IdGGDXpb7rDRl2kV1jG1wnJPaXA8uXL5pM9ksZUgm7eFUDiPMkNdt
	sOE9N82oYUZGYlpfET5b8Xdm7C6DCWaPUZ8ImPvqjt3WaginJ/K4gNZCcNQ4lYcuEAA==
X-Google-Smtp-Source: AGHT+IGNa3UAEq/Ce3/sswcy3A+j3yXj3Hu9QHzagv2xAwHzDuZRAXkuzsWUlKzyxvuIXzuGjI7OUQ==
X-Received: by 2002:a17:906:9f85:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-af9c6373614mr1374008766b.18.1754925486344;
        Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07659dsm2020105866b.21.2025.08.11.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 2/6] dt-bindings: serial: Add clock-frequency property as an alternative to clocks
Date: Mon, 11 Aug 2025 17:19:46 +0200
Message-ID: <419658ce1a1009c6f8b7af22a02b278cd695dab0.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UARTA controller on BCM2712 connected to Bluetooth chip does not
mandiatorily ask for a clock connected to the high speed baud generator.
This is, in fact, an optional clock in the driver.

As an alternative, the call to uart_read_port_properties() ensures that
just a simple 'clock-frequency' property can be specified for the clock
value.

Amend the bindings to allow to either specify clocks or clock-frequency.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../bindings/serial/brcm,bcm7271-uart.yaml    | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
index 89c462653e2d..96697b1428bd 100644
--- a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
@@ -40,7 +40,15 @@ properties:
           - const: dma_tx
           - const: dma_intr2
 
+  clock-frequency:
+    description:
+      The input clock frequency for the UART, Either this or clocks must be
+      specified.
+
   clocks:
+    description:
+      High speed baud rate clock. Either this or clock-frequency must be
+      specified.
     minItems: 1
 
   clock-names:
@@ -61,11 +69,18 @@ required:
   - compatible
   - reg
   - reg-names
-  - clocks
-  - clock-names
   - interrupts
   - interrupt-names
 
+oneOf:
+  - allOf:
+      - required:
+          - clocks
+      - required:
+          - clock-names
+  - required:
+      - clock-frequency
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.3


