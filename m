Return-Path: <linux-gpio+bounces-10674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC298CE41
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 09:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9ECE2820D7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 07:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37A194A44;
	Wed,  2 Oct 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PiWxOnmR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF21946C3
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855866; cv=none; b=HGc2RmUT+x1R/kkXzHppqEk078BnJO2P57KGW1ZlhXdSxKc6I1ZybBLXTTWcb6otUYueKWNUnrMJ3KnEKfLHHPnLApz4AKIMMLJTE5Tpd0F33RRV9ITY/FC4e6mfa1W9WSYRSX4jFFoZ3hcI1ZTRjEXnEZLcUx5XbPxBFRmx2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855866; c=relaxed/simple;
	bh=pCk77qIJfh0LnnHxEPATrdKVmLR8o3DzmKjdn7BoPrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKskHSr1z21UxcRYsCtDCibpVA29LxVM9VCK3PWRk60l+rQ/ILwIogWkVuF3eoX2Ph7QtR8/d7qQxQpIpCgunfHgDqBn2eZrYjL2eGluQ0Ios5G12C7eNGTgrQ0PdP4N8OURlcHM3bMLO426/xPGcCfYUeCyT59NuwBAc+CmwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PiWxOnmR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cdefe9ae8so8424455e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727855863; x=1728460663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNSqhoZex9VfZ2tYxgb47tYVyfNq/IhFIWNzbBijETI=;
        b=PiWxOnmRSwGvMdSKgcjTksunX1aJvDMz3XHMxqayLTZlXugmwcGTTiO23zqVuDrgRx
         zXsXclwEnLhkJuW6D8k03G6CkqzQvwRPzZnzWEfzSt6e85BMA7Wj5h8xSBeaB4rynSmD
         ZxBmp9gkKUugfNJs0CbpEXhNLdhorTWfywrHgTotL9MfXUrylTvCL7hUZw83xxAPmvFE
         mXIHmqVqROiLgP8WUEWVNaxtowTKwB5gFVEr2MGCWutsyt2e4LrG9o+jWGsbR2t+IVet
         n9VEKttzBRlV2A2HMwzkX3T2nBiBJoJTUnZTiUN/hDkp+kHOg35uS4F8tBS9Y61wLbWA
         ILtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727855863; x=1728460663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNSqhoZex9VfZ2tYxgb47tYVyfNq/IhFIWNzbBijETI=;
        b=lF3cNqNHGTyM2s69WyD+foo27wbMVtfx2ngF0pvsijO7NB2fFG8nWEGDsUvbCFJHtN
         4sbo0nm+ye0Egsb6tluSS3VNhCVn7NtRv0lrcKdLJCg0Lg6mbm1Vd1gzU+G2Y5n/tSM3
         Qzu1H6g/G4xNWlGsV+Eo7E75PKa4XC4OwnV3wVbgEMLVrX/T2Jy4VdHMzospDNDCin4A
         PWz/fcQGHXnRNReTsFz/1C0R4gt3Xtn7vTbVDv++CtvWo0x3kg2+WdieJ0wWVx9K5oFr
         Jaz42w7WMg5uFtDOS2N+z9SBMiYO0Cop/2J8ae69AVhsy1tBQG1B84WTakqFSlkSLnka
         glgA==
X-Forwarded-Encrypted: i=1; AJvYcCUchqHOJnOJSfUvK6TK73Lbl95KumbaY+/h3tQkQqdSBChoCKN2VJHLGqvLGOURcxN0SB3kucOLsbu6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdxfCnuj8lelqW5XUQhZFk8sx8yWzauEIbfixF986YfSyITVr
	t86LQqw0CrsbLosoUfVWmpFuedBWTI+scsRwPnQ2QPlkPZ80CO8Rn5Zg9/Wj/A8=
X-Google-Smtp-Source: AGHT+IErB8/Ukmo4RestB0G01o3yBERAvryjxEfRQ0cRVCBGJB2P74DFW+UCxrNWOBZjh0iEtR75cg==
X-Received: by 2002:a05:600c:1ca7:b0:42c:c082:fafb with SMTP id 5b1f17b1804b1-42f778f3933mr7749825e9.6.1727855862932;
        Wed, 02 Oct 2024 00:57:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79eacba2sm11354245e9.14.2024.10.02.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:57:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Date: Wed,  2 Oct 2024 09:57:38 +0200
Message-ID: <172785576336.22676.6859433470666367416.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Sep 2024 18:44:58 +0300, Ivaylo Ivanov wrote:
> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.
> 
> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
> and dreamlte, but it should be really easy to adapt for the other devices
> with the same SoC. It has been tested with dtbs_check W=1 and results
> in no warnings.
> 
> [...]

Applied, thanks!

There was quite a mess in submission, so all patches had to be re-orded and
split. Below commit IDs might be not accurate.

In the future be sure you organize your patchset per subsystem and correct
order of patches (bindings are always first).

[01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
        https://git.kernel.org/krzk/linux/c/d27c76fcd4190cab051543b2ffa2f183a6142c0a
[02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
        https://git.kernel.org/krzk/linux/c/7f6ea7198e8350ad199bc56f524ea2cc753f8ab7
[03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
        https://git.kernel.org/krzk/linux/c/e6bb0575953f3f850f5583e9adae3260866e0cbe
[04/10] dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
        (no commit info)
[05/10] pinctrl: samsung: Add exynos8895 SoC pinctrl configuration
        (no commit info)
[06/10] dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
        (no commit info)
[07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
        https://git.kernel.org/krzk/linux/c/496374c1d0045177cb5c3e85ce33b2179b11a413
[08/10] arm64: dts: exynos: Add initial support for exynos8895 SoC
        https://git.kernel.org/krzk/linux/c/dcabaa8ae457647e334bbcaf21f9209315e8f752
[09/10] dt-bindings: arm: samsung: Document dreamlte board binding
        https://git.kernel.org/krzk/linux/c/2caf56f6cf69b026749a2c6c8ad083e5c47b8362
[10/10] arm64: dts: exynos: Add initial support for Samsung Galaxy S8
        https://git.kernel.org/krzk/linux/c/296621bfa3ddefcbc4a3c1f64f6e868680a1be59

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

