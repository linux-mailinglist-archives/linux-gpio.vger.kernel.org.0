Return-Path: <linux-gpio+bounces-24717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC8B2F276
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8616C60389E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6C22C08D4;
	Thu, 21 Aug 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuC8yxzu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8525C802
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765158; cv=none; b=uveLzWeruvb0z/2UmzfQvQt+4wDqRte9WUEC0w1YxOO/QbrUmHytg1qmj4AzkTHDGBSEQzfbW8TyNo/i9g2cXMh2VZlY5SFFrgSEWfOHKtvcCsOwDj6/gyE56RzMb3UHNydGMN/MDJDBszDFNZ6qqUQZ9xsFH1zXgknvNi1GmO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765158; c=relaxed/simple;
	bh=aiOPgCva8kudkEPl+V/XfNEIoC3r9JUXD0el5mRjFUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnkOyoLFD5UCxjyI7dKbyPAieagc0z+jbOker42Bl9A07xHiZiOe9YMWWG1GQ1VzTgp8sNK62Tr3LrbiidPd+0PuR0movzMUl+7WTV22vp0v8C9MJA4WdXj6964DXbxo2ynpWpylsS61KSJ33rFd+/q/2MvLdB0YsFmhXneoqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EuC8yxzu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb79fb221so7457266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765153; x=1756369953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=EuC8yxzuTIGSwwo+J4J5INp3UtHri92iHTIKbwsvLLiyLluryTPwxb2vnlbDY06ZgA
         Ush3/iG/rTR5E2dSAuwUEj7YghbBSzrLIGIftcYr74YydSicK2HhW9GiXtImPC2ocCPv
         q7C7BJKbQM7CmDA1IaZCbL+/97PXnkHLG3rWCWe1252T56v+yeQ5nXCiFGcci/Zkum1/
         kfUT6Eez4Zss+MV6oP7bVvQLJwKDkCKZb9kM6oq2qNFh8ESpFgRe5QkJ+ysBsEwKjZ3E
         3Wr1inbm6X6BH1oW0adv/XMLo2eO3xle0LdwiExTmFIQATCjJrEWvbSHB3BqGEcHmvJb
         dH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765154; x=1756369954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=bavNDh5/4UIvAvlpzA/U4FIT0wQWzHLVT6CjZcqs1vniwjmMEXXwVQVXyM7JbpDR1w
         la/7nYgirmd1FSgDpRgIuSZ0YfsWghC3uqW67dDTDBrgUR/6YgLJOTmh5YRw/Vg4h2sT
         UqKkSngQNPFb9t5zC59/aeco4i/59xEHKC94UrRBI/eZ10Ti1I6d5BYHmTpzCBiyz6dg
         T7Fp3dN+XvzYJXPU/rsWGYTyrnexYLRNZwfZeUU4gIcL4Ghj3+lYCB7evbFrzzJGQfa1
         3oYetv2P0MPK7R2lv9tmYriBMxzX+5mPf3i0N+dlF82FTcXdBP2fRnuahTHhAU4OdHDb
         ryrw==
X-Forwarded-Encrypted: i=1; AJvYcCUTQ8SCWk8ITkapUv/4HUPrM78ZDSaav5nJ9UgoGrDHX04HZIcGkhzOHo7vTIc9BXG6NjbCkm1LC1+m@vger.kernel.org
X-Gm-Message-State: AOJu0YwXb4mkiBsCjECgHdCKWwbyany8i4SfmCj97hIkXsgKefrm4PB3
	+PGN0yO71TtBNTSrRnCNiwXoG1yFSMtmrtFnJDytDo32R1cxqnMDtZVd9aACqD9F4sI=
X-Gm-Gg: ASbGncshzDjLT1MNEGWnPCeJ0VYY4YT7d0Xf/9u5dOg+xLTqwRf6z1B3bENLstNOkB2
	ZHcs9NadtgosymYbMhCIgIwzXZM0yqwf0b64NHQIyuvQmDDkGyb5Sv44P/6QxIMKh9M48ccfwvg
	0XfQZy/fKndbDgp4AQiP1/jmgPniaHGBa4UlePBFqhAabGnqPYRk0pqWzbDwQi2jSktFDphez5Y
	yl9Io2tKAtJXwmQQRM1Ovkqb97w/6t0b/CubchLdghOdZcpL4pzdbUiCqzxeGeoUe6qwoeX5diX
	1nqYZrXlQcOklHx+GBdftIuEH8v1v7qbkelJKWQ2du2pIyhq+gpoXlMoYW390tIZvipuvByd9Vr
	C83L/morLGzEYywje4cS7bslZH/MzTxDwYg==
X-Google-Smtp-Source: AGHT+IGrKLDvcNhMPRRUz5yZ/0B+UqV3cuCDD78GAK5IX9VMQFlpjMOiQBg7/gspXEwR8WFrVNM3Ow==
X-Received: by 2002:a17:907:94ce:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-afe07618e48mr78991366b.0.1755765153518;
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478bfesm341676166b.60.2025.08.21.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:32:14 +0200
Message-ID: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=aiOPgCva8kudkEPl+V/XfNEIoC3r9JUXD0el5mRjFUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptmNfZQGc9s1xwN7F1mVlmTvdanxSxY0HauHI
 HP4rAniXDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZjQAKCRDBN2bmhouD
 13frD/9kUAvsG4k8pJHW7pM/M1lFmN1E9aryLzVWQdCoRNM+oMCJXweuixV9wDUQtiguoG73Da0
 HrY+SLZZ35XqDk/J10NgDL8vSKBSl/QH6wD4qhZpDxcRB+gNfBk+XtwDnwULbdNhsxf6Jo4PXrx
 HJribt3Qh+TFuMQJP85Q8wEVZNRdE1iki2kV6LWQVLDW5Y7akzcYz4gdMKjYfWNdQxlrimLk9Ob
 VFKndIUkSaEHo1izt8KnxGxdoCKhxRMDtSEi2BJ7ixlugZ2z29M3ykbYCCsidPnEs9hJt+J3+QM
 i+V5+WO4l5x2LEpUZ1+Qyq7+XUq7JkBBCTFq04DZ9l/S1QMLyBRo4XXShVB7MmvVrumAhy74KSo
 PB6aI4D7fk+4WexLlIOwKHk0GXVDiXSnmSqBfKX6RQqv9V1TG+FliEIex4cmGMilpT5oBPURibT
 19arh2P8kq4samhnaK6kFAHQ+iVo/MuT8UiFAjtWw97nSfRkrWVeEwl04yGd8YMludhYjju1V3R
 uamX9C1mdkuzSJFM0C4YBAV3a7irZZMDfED+dejWUfzPZQPvzJfLz/ZWaIhC1Z9OWIVrhv1xLL4
 NTO8viJCzgJ7dFii5xPMpRjF4ecUEoz8FVpiDWuebjdIRRf3rHRlE+KiFc9nl7cTXLERfDHgNcg ZfzyrRVol9a3U9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
index 82a190a715f9..4d200f9dffd5 100644
--- a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
+++ b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
@@ -95,9 +95,9 @@ examples:
             #gpio-cells = <2>;
 
             maxim,modesel-gpios = <&gpio2 23>;
-            maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
-            maxim,db0-gpios     = <&gpio2 25>;
-            maxim,db1-gpios     = <&gpio2 26>;
+            maxim,fault-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+            maxim,db0-gpios = <&gpio2 25>;
+            maxim,db1-gpios = <&gpio2 26>;
 
             spi-max-frequency = <25000000>;
         };
diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index ec0232e72c71..83e0b2d14c9f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -80,7 +80,7 @@ examples:
     gpio@d4019000 {
       compatible = "spacemit,k1-gpio";
       reg = <0xd4019000 0x800>;
-      clocks =<&ccu 9>, <&ccu 61>;
+      clocks = <&ccu 9>, <&ccu 61>;
       clock-names = "core", "bus";
       gpio-controller;
       #gpio-cells = <3>;
-- 
2.48.1


