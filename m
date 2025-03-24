Return-Path: <linux-gpio+bounces-17915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D1A6DA47
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 13:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3455D165FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 12:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E2F25EF83;
	Mon, 24 Mar 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNM/vz+m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE20825E445
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820673; cv=none; b=OV2R1HLXMU/EFrJnMK3C4El8F4Opo3llD74m29EmvjOdr5MwJKxr9Sza6UOawqHdjLRnz34Y9oPLKS3oqYlbbf+pNHFSZzPeiVeR+eP0uZl+llx7ojHntjrtt0tg/tgvgGyHO6QGzIMowdGIriXZgSdv5EWvnwAgwlbV3CRD7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820673; c=relaxed/simple;
	bh=lLfOSLdPa8J+gvx3KKdoc/YPg+4C/zjDSCX0M4dlUMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbaGUPzgsDV5No3ngqCsX6fJi7msU74/0akVGqUl+pvuTwteVmZ+bS0/RJCVFZkQjyuErCk2UZ1+srYozv/5JhJ4U32grv1p/fZGk2BC+ptPMNvyz81CbiNcw/KxBZTxmxtZqCK28B+UI9TMKpNm7MbUUYUTvsaEjgJxi142S6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNM/vz+m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so290719f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820670; x=1743425470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=hNM/vz+msgezokXpBQ1kH+3Ah+TuC4TN6SZHIftY+NXZ8EXuTyNJvK9k50XfQnYVm4
         qipw3v2YxEnNXJP4hJXqvUyq/Rua3QeyTijVgcJAOwJijFvSHlyvRmXKnSTdWRK0ezze
         jaPasXgPCGRaZmyWJLGnwVZ1PsubCkZLfrXV/+h5/8aR3hHtQ3MevswxgV6DN3E9eBXW
         cGk+gsBMxPYP3PF2/LqvHoYEW39E+LKcpHVEu0yqC69ek9PQ2ZbC6GMM6a61Lx+OTvOE
         TopHcdwJhhTTkhNSPBD2nwNVCbP4ZbQxJ8qI+dZk5sRdgBK6oD2ajpMrBQiBLCFBCG64
         SOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820670; x=1743425470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=IuCf+phiW5X8Z721d6AxBglAbDXIEKIHpsjmYWeoWrNixx2v4xvBaKCTDCEKYGYIry
         ZlYy/OgwyH6n/ck8BBSmzPhu/zvwBig7GNLPxF0vxiUxyb8vJF5Q3DCJ7fB+zjxtbFLd
         8gatarhoQYrR4rOhQRLm+VUExHldAtzginkiB1gC6BUis2HQxRNZ0lArEa8eF1PNk5Ou
         XRITzF+MiS4rKfDVDwG9eSHsqm3rL9xFAWujcFBs4NWbZYYrgRKjJV/6af+Q1fS3rTso
         8mLd3fc22XBNqagenKqiKz9+DLpr/lV39EfWMKyxrorgC7UFW+wWfyJtB8mS7gYO2ADT
         DUGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0IosPW0vXHDKX3n6owJLtCjRZ8EK2Ooi5HI6vvSx5+VK1mU6+MePbg3H5Ss6VSd7KLXROLxYvbajN@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvpSeXEkIRcIf7mfuGTzTZND5mWEePZb+k8tOTaxM6t4QugDq
	/VJRNlCDNmTpctWzEqPr9rxgvc+MDhRDy5yPBMBHVnE4xGrFvlltxBQx6mNEpog=
X-Gm-Gg: ASbGnct3RcczYSK2roeOfemnnusaS+PZG3XyyVXZiIMmE4MuPuKvZqZueKIiaqBHirY
	2ZjKD4ji0GohRkhcY84DjvU6wkyTQM8muJgh6jYpJSPFn+wnI9sCSOpHqv+Jn+R2HXgJui6AzW/
	OLFbyEtUcs5LrZoRNmtBeECbZcQwF8asi++6ZZH8ZZjeuuqf7Yn9bcg/iHSMxUfboeYtI0x/3S2
	qJDGSaxTQtBMgmAEKcPtFFrXxxsN8T+2a+ex6lmh2CasW3HtsP50S4rBD7k6wuL1MJ0PyFqrX5a
	QGPrrsYH8Isi17sHn+8aZs/MiRgWH7zEFrBrYdH+nUV0TTrcFh/vpqOEfw==
X-Google-Smtp-Source: AGHT+IEQndIp5eFpgd1dTDP4lH7gXczSBzoAyRnBiPmFPk1TMdz1z67MW7mzStpV92IOyZshhOAyYg==
X-Received: by 2002:a05:6000:1a87:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3997f9406bamr4947758f8f.9.1742820669984;
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b517csm11117180f8f.51.2025.03.24.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes from DTS example
Date: Mon, 24 Mar 2025 13:51:04 +0100
Message-ID: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binding example should not contain other nodes, e.g. consumers of
pinctrl of, because this is completely redundant and adds unnecessary
bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      | 10 ----------
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  5 -----
 2 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index bccff08a5ba3..5f2808212f39 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -136,16 +136,6 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        syscfg_pctl_a: syscfg-pctl-a@10005000 {
-          compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
-          reg = <0 0x10005000 0 0x1000>;
-        };
-
-        syscfg_pctl_b: syscfg-pctl-b@1020c020 {
-          compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
-          reg = <0 0x1020C020 0 0x1000>;
-        };
-
         pinctrl@1c20800 {
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 3bbc00df5548..f4bab7a132d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -245,9 +245,4 @@ examples:
                 };
             };
         };
-
-        mmc0 {
-           pinctrl-0 = <&mmc0_pins_default>;
-           pinctrl-names = "default";
-        };
     };
-- 
2.43.0


