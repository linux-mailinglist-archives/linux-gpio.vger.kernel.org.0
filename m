Return-Path: <linux-gpio+bounces-8616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F8E94A3A7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15125282430
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A921D1755;
	Wed,  7 Aug 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2qD2O+k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B147C1D0DDC;
	Wed,  7 Aug 2024 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021760; cv=none; b=NhalQaZBeGEOSyt0er1DlFcgr2+/v+t2xpD47yVfE4JZ1Ueo4P8RtmO70QjRRpjSBsCr9wV0QpGdLNkVRcjXj4t9heiaqROdRnGrojjNORlXi7Kc/x53i8t5yxTy62753Xokp3STqilb5FseVHJYdVXiLkovafrOi7kyEEFRsws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021760; c=relaxed/simple;
	bh=BACZp2t3koNpk0Kx5baIyUrgPL9GxILVFw3r67ukXfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=casb4URIIGfod0oCGJ7K8zt6W6foXeiFOravyZ6Ye1IKcCN5oXbwTi0njSFS+qU0OsGEp5uYHk3qugvJcESHlI8AqdizNp/biidmt2G8fPD1wZ1cKBFlU4wcPe7zh+lIZwPb8lQXrwHyJcA4eEgWTmVUJkNmvtJbg24nhHWCrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2qD2O+k; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso16539141fa.3;
        Wed, 07 Aug 2024 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021757; x=1723626557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=d2qD2O+kTs12QfQtn+lIpVEPTBpV6Ji2HMigOSSV2HWXf9hWU7+oUwqGRs8bnQUvKy
         zJk3d1vf2S7XNk6O3JDTjqKls4fm1Nde/LbByMgcadupu1Vrxg/DsWyfr1u7rcDrdTjT
         45+kFVpGPWCndHAK+vMs+yhSyfWgkRKKj+kQP2S5gq0kq5GqWBdCUpH/KpLauOCoJHRF
         kQJ1Qkts/DBkz/aUAswrhUNwy+U7V7cObTiAgU1VeQKZro/MNdaR1vbtKV9wUco+lkVS
         Mg4GQGZ+M8guHejCr6h1iVzHnuXu/A+konttP6oVphqLxM0Q5BlJJN+cMXubT4OvVPCA
         ZbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021757; x=1723626557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+rRgxOmYLi2N4XWgCIbZjKsFXKXkm9CvD8Sxq31aYg=;
        b=vA3UFZFZkMAyJpgLWh0xhM7IeIfSeqi6ow8N8P4VKrxNxLpPHtUx3vmmqarMpQmoDK
         FDhXtk2HI+hjaI6mlsgQAh6NLTHVE8otu6TOLHCDtDR9BYc26yX4VNHwh1JbM0e27tOl
         tXRaEqFmfC2yPSjTKWukFC4L9so31jfou+yIwwy0VkCkYji2SW7BTUAugMrVV0kAQXSx
         55b7AbBnAGIAxDN+bNBctdB+5sq/bmvyU9+uZuHROUv80jm9oo0COVqzN8+bGhsn7B2O
         a7RDhTVuzs1dyYyMLXLf56v+3HzdZNZiifIIAiIeYMTKcY/dfApdLLkaFm9o+KSVIsZQ
         oazA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BdgPhjFwp7rw0O6gJW9TX6eFjCySVH0nLPwMNw2ug4xVa9CEElqBn3fJHi37ZKMAmu1GSonRqdVj@vger.kernel.org, AJvYcCW+fxLsQxc4vq8Sg+j+bcopplI5IOaYHIrqtCe3VTfPNGUvLJW7Mp1e3p5TmSvQGj+OdBgfTLg539YTgedx@vger.kernel.org, AJvYcCXCt1EuwcUzJwC6JgKTBItS5kEjZfcp1aGAOHESlV6sIgpBLMfg68d3nN74YCtCOPiUfxcncpNSqSzMoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pG6WWCtR5B4T2hb6F3BsKgnl+MJeXziMv+MfbYshiNzkyEFJ
	91mxXaaXo17ZwYHgf3Wsi2NtcFH66jOBWFpOOySabHEZ0J1UqyLt
X-Google-Smtp-Source: AGHT+IHZj/qaVwBeUYEqoaOt4fPwTRtmjTIhR7CIMvfEavPnT6SbjpTOmBnJhDXNtvBimqFUiwAygQ==
X-Received: by 2002:a2e:3002:0:b0:2f0:2833:efaa with SMTP id 38308e7fff4ca-2f15aac3960mr115280051fa.25.1723021756645;
        Wed, 07 Aug 2024 02:09:16 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:16 -0700 (PDT)
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
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
Date: Wed,  7 Aug 2024 12:08:52 +0300
Message-Id: <20240807090858.356366-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
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


