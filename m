Return-Path: <linux-gpio+bounces-10213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519B097B04B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12580282D08
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30589174ED0;
	Tue, 17 Sep 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRHB1Rut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DBD1714C9
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577091; cv=none; b=gu01bt18AEvIjL2e/35Nn+cKRPsMAGFgr60qplTNIS/ovRpWSpAV64lUGQszid4lewa4YadUiC4abFm/jhHv+7tIBKIqY1DjNMq4iHSC+ZSOIhIHm3hzA+6uWKhzQKq6uTkKJS3Ho6mbue+IuGIY579uJY2fUR7XsOJt3r0Ho6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577091; c=relaxed/simple;
	bh=lw1VA7HruMKNZuk9OPf5G4/kAT02JN1aVSudwuffCMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLQS6MZK0/Fy1uCdjrCfSSuiEWs7AqK2IQoi7M2Y22XkLQsssUouNx/CkgyA8iShkLL19SpDV4UYpXXUMuDBRyRAyNNEZlqz5POcfmGD1AjtS+cdrOHK9pdMMYwcwNL2+elO9YH1xjZHYfeEna89P0yJ1Fq8PNFZdkMQca/PAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WRHB1Rut; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so701284966b.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726577088; x=1727181888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OIzm2VFG3GZs7HTH2caPyEKqzOOlVGPpJOwBVws1j8=;
        b=WRHB1RutFSC8/xau+CfoyQZko5cQZXptycIDKcX5DlFeBV6zYcWMGk4AY33EWl9PUv
         EqUW7HARgLudIbk6HtIXFf2AtII+6NA6EzhWXH5hbBJMtb7tTWd7do84+Hji/oXlBtnE
         L3Bfs1UPjSh8dTdaTVsCaHz53qE8HCdo8gFkrvp7aZqbvvxXb6INvvW+5X26vVVpiSnE
         /HoaBMHMt9juG/7SZrbm7YZdlrybr9fybe8YzTqy7uQP7PDGadew79FDkwpEYeChY6YR
         sySPq2piABcTgPpFhNmPvLpES7VtrR7DtB+6sUbcNbVj0yKVuMTUvxXev+f2ph1p8lL9
         j76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726577088; x=1727181888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OIzm2VFG3GZs7HTH2caPyEKqzOOlVGPpJOwBVws1j8=;
        b=an2a0W/uZxSSLjHi5J4B71Yjrqjozy546zdROVgfQCaNxF/AL13+s+dDvAnFaGSRjv
         Vo7m/tnxGyTK9sIvnMlBT6cHJdXsUisKMcGmGXb3mFSKmpzC0Uk0zdK86KKYNN4Z8xZx
         dwGYBFueLjiibePe8geeiVJ6GZdrXl9t0FCpN6vZMaomLdkzpKim+401BfxpUwWho+JM
         ab8/Mh7JXqktiPahpZB7/2RrrI4m70xafQ97kK9GNcHc8h024HIe6yruALVAJSzDrd+H
         rdPOhM37+8vMIYBtJJPimjqXsMDM2Y8aOHHnRCG9CcsGe1YtMEoSB/eGKFIrjQ+UXKgy
         D4wA==
X-Gm-Message-State: AOJu0Yz1GM3Tgv6MVOBovs8E6ElObSGTgma725d3NgywezgO43ICqhrD
	YQ8Fzm+gBBObalsBgYRCFRowrNTzHSUK8bHX4MgDYHwJege7IFR/O4w5VT51iP8=
X-Google-Smtp-Source: AGHT+IEcX6QodCIsRoOFvpuHL21AI7pzsEp3i7/iAbu+SROgnLr+IsRDFQ7//e0RYBzO0YcS1nTVXw==
X-Received: by 2002:a17:907:c897:b0:a86:6da9:72f4 with SMTP id a640c23a62f3a-a902947d622mr1770904466b.17.1726577087457;
        Tue, 17 Sep 2024 05:44:47 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f453asm443317666b.88.2024.09.17.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 05:44:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Sep 2024 14:44:39 +0200
Subject: [PATCH 1/2] dt-bindings: gpio: Add BCMBCA to MMIO compatibles
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-bcmbca-gpio-mmio-v1-1-674bae8664cc@linaro.org>
References: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
In-Reply-To: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The Broadcom BCMBCA (Broadband Access) SoCs have a very simplistic
GPIO with 32-bit data and dir registers. They can be supported
directly by MMIO GPIO.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index b394e058256e..0e5c6c6d647c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm6345-gpio
+      - brcm,bcmbca-gpio
       - ni,169445-nand-gpio
       - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
 

-- 
2.46.0


