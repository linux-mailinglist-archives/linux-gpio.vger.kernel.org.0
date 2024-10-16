Return-Path: <linux-gpio+bounces-11398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4B9A0147
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 08:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC16A1F2133B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 06:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69518D62D;
	Wed, 16 Oct 2024 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oh7Y6kSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088E18CC11
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 06:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059621; cv=none; b=FtedNxnLIzPkOF4vjLS9sNSbykr89xZFPCykN4MPNckNsm0nSymHhkGS31RtTc9wZUKBfXwlxUvCtgpVEPm3AekWYvhfNpI+5TX3QaC8YBjZe+nvXOHn03Edec5hDFqzQP1W5pCqnPbpV+IkjeEawku/LbIcszATkijALv9rvME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059621; c=relaxed/simple;
	bh=7JSgjt/5W2tCjzP18X4ou6+lz5nVznQreebmKWAODzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gHQbrw4DgMZX9fQQgqtSTKm8EgGcSDVxhGy/UQHp3V7q/KlockHFt/0jasZukhmQcIWMd6tvvHXHE/H0hE9BQuB8a+4EqwNfho2JeBG1T+xgad7hf2R4z3Z6B4BpLspHw21liIJGXiCYz+KpJMnAOUy77omNT7+9ToHgvFSoO/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oh7Y6kSD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43111bdd54cso9623455e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 23:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729059618; x=1729664418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytXbiH0qYtsul/qCW7PQjPX4CH9pWPDn7uLBaZcZ8e8=;
        b=oh7Y6kSDfL5xUViTRqZExZYHSSkHzzuMa5qOo0bn7UbwwNiEqt0erX7pb9ZqNYQ8UZ
         TJIMPqaef8ZzPoRk8rpbtpvmIwwmMYX2TaqcFslFSDk+xqj8z/gVPPXt7g9enExUWT1f
         CgG1fgbUxFcC+j3/aRwwOspwr7kOVwsE8zPpnLweNgrI8Y1p7EkB+dh/BhnwWTXynsTM
         UFnGKYlCS0TmFWK5/a8lT/fZ73CsIiUQGWOFwFP3wgCI8HPEUkBOy8UCWEVW6Yn3gUh5
         MJd89I1bUIoyC/qZ4F+cFIsCtMH81kvnR3vmB9WAjeBTWcZ6RNI53N9OKiZ7SGnpxVO0
         v+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729059618; x=1729664418;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytXbiH0qYtsul/qCW7PQjPX4CH9pWPDn7uLBaZcZ8e8=;
        b=qIc8hcXTOkspA7tVNZBtnAYTT5ql0MoGWsqb4n0VxS4c7D0aJ9QDCi4S6Im0mH4GW2
         TE0027QEuInB4x5UH7hiat7hTGifPVyADLpWvcs/fWUtIGqi6RInKut6J0iN9g2syr05
         J72uIF99tNeI8itlx7I/UQu0DsIxMEifMG/80WVqAEnX7eLb4OzRTe3l6TEFJc4EfxZW
         w5ZankbxHccNi17hxFBSiB5y4TCq67NjaIJ9+QNqa8T6cjfdqDxgPLZkkQmM0ERDZqkz
         vYrISY2+4rw1CU3DnlfGBeMnnblXHB7Qnx89AjLIArGV8w3Ld6yHsSgYhF7/OzQL9QOB
         FR4A==
X-Forwarded-Encrypted: i=1; AJvYcCXiCVQ/kI3BPoOiNX/cAZYAsdr8kcFWCwBfeVMDJdshgC2FghxG0TP9vTRCCWZK9yTZIymf/3G/kxg3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Sp0IYHEg64nR20RrxKEUSaSOr8X8XtldepeqWZUFPuxpnEBj
	Nuq7BxL5PVTbmCZ9YjCbGRn45qGC2z8vw67qav40eF7G0MZcEOeXOXbBS66UK14=
X-Google-Smtp-Source: AGHT+IE+UoOQRJOTLHySardR6ldHyh0e9elEwxt//vmMPx6P7kv7VSPMQ2O80HK+68vbi8nkoz8Kdw==
X-Received: by 2002:a5d:5886:0:b0:37d:54d0:1f18 with SMTP id ffacd0b85a97d-37d552a66edmr5968237f8f.6.1729059618378;
        Tue, 15 Oct 2024 23:20:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9050csm3398580f8f.48.2024.10.15.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 23:20:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Jaewon Kim <jaewon02.kim@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
In-Reply-To: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Fix interrupt
 constraint for variants with fallbacks
Message-Id: <172905961565.5996.4588460479278512095.b4-ty@linaro.org>
Date: Wed, 16 Oct 2024 08:20:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 15 Oct 2024 08:58:47 +0200, Krzysztof Kozlowski wrote:
> Commit 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7
> fallbacks for newer wake-up controllers") added
> samsung,exynos7-wakeup-eint fallback to some compatibles, so the
> intention in the if:then: conditions was to handle the cases:
> 
> 1. Single Exynos7 compatible or Exynos5433+Exynos7 or
>    Exynos7885+Exynos7: only one interrupt
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: Fix interrupt constraint for variants with fallbacks
      https://git.kernel.org/pinctrl/samsung/c/ffb30875172eabff727e2896f097ccd4bb68723f
[2/2] dt-bindings: pinctrl: samsung: Add missing constraint for Exynos8895 interrupts
      https://git.kernel.org/pinctrl/samsung/c/e0f89ba1e04307a0060b354c40d29d008a3fef6e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


