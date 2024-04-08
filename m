Return-Path: <linux-gpio+bounces-5164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F8089BD8D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 12:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68EA51C2165E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9C55FDB2;
	Mon,  8 Apr 2024 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJWCO4Fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A245FB8F;
	Mon,  8 Apr 2024 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712573510; cv=none; b=sGqvGrOMU4ygNFm8INWqJ8LeTQIExiyFA0SI2Z4QpxakfmXrMl4c3twZpbuTZgWTNJrDdQftxUydbQJuEcV2+V4qSmHAbJraenvuQPJFa9QCEkWvRY/cEf4ZCV1cyikVZBRrPigTZ5ahiz4xm08aZ0m1zwBsDYq9+Ma3tuU/4hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712573510; c=relaxed/simple;
	bh=9X/0Xkb2EobpjkKVIk+F7u1iUf/T7Y4THZ6no1pu/Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=k6CNkCfTlqe/Iy8qSUabYYmF4NgkaYujp/OY+8TPBpIPBJOPHB6Rg5G//nZTx5FTaKgQwmV+lxD8Y22nseYHwcGZ4dp+Qw9OoHkXU7DR+8WcmScWxGQ3i3VpjQR4gonX5lSDkRzjMNJ5wJF9UrPni9VW52jl9kbjA2lj7q9lBuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJWCO4Fb; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso5690778a12.2;
        Mon, 08 Apr 2024 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573507; x=1713178307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgMBOXWSUTk2V625cFtn0BP+aJZnfiCckssn4N/MuIc=;
        b=BJWCO4Fbb9XODGGIpgZVNxQ7kKxIT+cIA+cUk7I5GxMxo/J2xHX+QOiwtvlwW8Ovx8
         TRGrejCeyRvBm9v0+kFz4o8+9aoKc2TX0EAfCnJAx/N0Mj91+5zWBx7DZ7umIm5rN8kP
         WtO1JtA05gkmMY7viFYr92c7wYC+krGzI0/uKCGo7GyA/gRfP3gG57Sy1psEPS+kv3V+
         NGJhxMCaRuugrojRze/twLO/l43YoDQgy67Mmcwcn3Vj8IDEOmN30ysMfvKBa8co6DL3
         N2yDsiPqFePyxQV86Rp2l5JH11Gsb4v+PdEDxz+0mRQ4dNPiU6UjsD9s8JAztUWdg8NW
         SfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573507; x=1713178307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgMBOXWSUTk2V625cFtn0BP+aJZnfiCckssn4N/MuIc=;
        b=FD3anUU9vDbZVzsTkuugr5MdleIbTEERp3RbZVO1V9G4++OhRv5OA3kAovNgTAvDw8
         CuAic/EqzJ/uHX/SQlogU3i5y+RcVoKyc+RRBDOMF4wSRCQI2fEAcqmV/HwnusFnPonj
         PfLuOvpFa0l/gKlggC91TdOGnWTVdur31ZjFAwC+TODRS14ozMHvFp1/w8nVde9DOyFG
         55hwJY0JdjITO8afSLnvXbdQlZWrYPL4lZAADx97BeR/EGyX7bBuVpkoeqJIdX5b4QlR
         L4eDgFJEkljnqWZxNON6sz8vVIiMt2G+mqsFlCp1v5P+wBevYhgY79GEIhRJKqH2/7jC
         8heA==
X-Forwarded-Encrypted: i=1; AJvYcCX4KoqVH3CLD4ZGhHbQT+Qd6SV2cb9cgieEauKRQ2ltydHaIAaWhlOE286kN4aykS2ix3JUUVQxNDwMlMPaicQ/Wc6Yj3r3hO+YBPMoaxuA8WKSwAtB8w+ge+IrmJo44eCiCF7x36U=
X-Gm-Message-State: AOJu0Yz2q2dQb1RGeWsEj0M2DxBfcfy/2hZof2fwsxaSL5gWGxfuxXpX
	rRUEJ7hhJsaqRsGS3xstZg6S4X9pWVsqgW19BLQAFJFeFNzMw9mj
X-Google-Smtp-Source: AGHT+IF1/ugf/K7uAP7APr+QbAPjgDSfGk4792+1LeuVHIJk9kuAxqHXAOJRMldWYia02ufJj3Ks0w==
X-Received: by 2002:a50:c003:0:b0:566:fbf5:a279 with SMTP id r3-20020a50c003000000b00566fbf5a279mr5312382edb.20.1712573506521;
        Mon, 08 Apr 2024 03:51:46 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id c9-20020a0564021f8900b00568c613570dsm3983900edc.79.2024.04.08.03.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt7622: add "gpio-ranges" property
Date: Mon,  8 Apr 2024 12:51:28 +0200
Message-Id: <20240408105128.30586-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Allow specifying pin to GPIO mapping. It can be find in in-Linux DTS
file for MT7622.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index eaa65512161a..d211f2e403f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -36,6 +36,9 @@ properties:
       the amount of cells must be specified as 2. See the below mentioned gpio
       binding representation for description of particular cells.
 
+  gpio-ranges:
+    maxItems: 1
+
   interrupt-controller: true
 
   interrupts:
-- 
2.35.3


