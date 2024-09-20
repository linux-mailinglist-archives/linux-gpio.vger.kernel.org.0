Return-Path: <linux-gpio+bounces-10322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CB97D7BC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D776F1C2176F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE71183CC2;
	Fri, 20 Sep 2024 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggJZ1mCC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4A17F4FF;
	Fri, 20 Sep 2024 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847125; cv=none; b=LFlt4BO6yPsNIsFCKZ20AO4RXlrGwJt4OsSG1mZ3Dge9/huqTaG4dO1ghCEy5iOhANFGEkR7H2SsPq0GGPqzFvQMMxVhQ9xvjcBiTrlchSnxa0Jazv8dBeE1RU9XTfehlQ6sVxSsXpik7oTmMCRVb6meK2aIV+xxuPdCB8YDJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847125; c=relaxed/simple;
	bh=XFqNXWfoDdVeLv5iAXvv8K8NiB1OTi9K5Op5H7O1Cgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTTQykFltjRyV6qgvrWQO2WHjo+1hk8tau2lxQK5wi71+JpzpX7cXYDlVr7dythdMJ1i1YF+UlITwqU0V1pDUyTPeSF44CJow/H/94y7uuI48e+OI5DgeiMVCWN8hUFacO7APetNN4td009rP2HQ97kLFqbY7uixVXOQ4fr2vEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggJZ1mCC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c8cef906so1584438f8f.2;
        Fri, 20 Sep 2024 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847122; x=1727451922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qVPLy9dlWIYmTbgpc5KiQogqTuKE0fYNGqHvBezkSw=;
        b=ggJZ1mCCrXPwfbWpCOXEwPkznLD/PIQ5hVfxmcEl5dGwiYrdW+Sqtri5/O+dDY8rhm
         f6AYjj3tnq+HonX+BYxBpptA4uv2hQK0fEDH2rLBslqr+X65B4zaaLxQSpG7zLHxYfdk
         pCi9XlEbBUO+Kn8YsD3UlXqvqAGSU8rY0raU41FTVVpObqKNd7ZFpdb2gs2zmwAAGfaE
         TF++DduLOb59Mvrkk7sBF4vxe7cf5FZnH6pRcKURMTW63er8/xPwvTekSD3ncK1hNtxl
         SgxlEtmtmsSmj3XXmVHw1tBhJdXTHFPpouURZ5cRIcItL9G0QIg9+kIeV88IwhVTCeHb
         KzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847122; x=1727451922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qVPLy9dlWIYmTbgpc5KiQogqTuKE0fYNGqHvBezkSw=;
        b=IcU1NjG7xyI+F7Zn0OAdfOfepnJeh1jYhPiFtieXy/bVqngp76ibw6V4GUmn+u0rxP
         FyixzvZI6kC8y1d5E4GkmvEkFpNr9WlvE8X6v6JwD58J3pHY/BWPvaxT8O4c+OI5rxQS
         +/n2mz3Kyz0Y0eVnGnSEMgWuDfwoYJrJgli9Rnwcc5q6r7S4SGvqB0asjJ2YqEYndWzD
         DiztXBCKPwf6NstJns48AxDsIg/h5NIhRLThtYKUnylLkQq0lpJRsCNBjNd13rx1RwYY
         oo0zfE9H4iZEqYsW+XioUBTFJ5MZfLG5wRF2GX7GYEPmQK937/HdVhIbAfCRER20fp8H
         go2g==
X-Forwarded-Encrypted: i=1; AJvYcCUv4VjwZ2OnFDHGMCdZnDkEsJ3CZzOs+ei/g8YWH2uuo6o9Aj52oXmPL3ZutxM0IK+WkNSJsauFj7Sk@vger.kernel.org, AJvYcCWEggLb3Qq3XUT+d1JTRPY4GPDKHtxlZtInb07fDmCj3jQmL6UarRPdpibjYPzid1Muga4YNnDuIuOkYa8V@vger.kernel.org, AJvYcCXedq58x/wK1qW7CfkC7mabSYy9Ijkuw+v22/+9uAf6vbE89a7pPcnz6Bag1pQt31PDg5IPpEcVZ8AyHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAgp0haXpavw3TwEf6dMgb2G8LPivs9Ud/8jjWtb/3QH4PDF6s
	dAN990SyVTX91dnsG+uscXgct+54V5DgJQgUfTiA2q4V/Ohz+pvqZyPhxg==
X-Google-Smtp-Source: AGHT+IG5WkOSAk/k4BZRwCTmyMBVUtAMJmwUS8aOGGACOJnHVq+ZwEzLRH1Ytd91eUL9XsKCZjTlww==
X-Received: by 2002:adf:fb83:0:b0:374:c142:80e7 with SMTP id ffacd0b85a97d-37a4312aa35mr2034369f8f.1.1726847122056;
        Fri, 20 Sep 2024 08:45:22 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Fri, 20 Sep 2024 18:45:02 +0300
Message-Id: <20240920154508.1618410-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 242dd13c2..a2af2c88a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8895-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.34.1


