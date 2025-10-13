Return-Path: <linux-gpio+bounces-26998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FFBD10BF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 03:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 011554E7649
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 01:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00331EA7FF;
	Mon, 13 Oct 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCefJiE4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127791DA0E1
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317400; cv=none; b=JwsQ0mM7csz2WXzVhk4eTjyyCgvom8fOZHN0UgXyFPWi+S5kZV/W6yOnxCArLGAEc2ex5ZSSnn+yq7Hzhjqd3K+02tU/DpusvvHeeRS8bU9LhrUU6HjdTNvWqSG2hCVA4iySfQvzwj+tVp6NOws3GvCcll0ZWkgzotvE+orhUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317400; c=relaxed/simple;
	bh=w6mk1UvfdM0MpecNbOUW/t9n0VWCYpN7ONTwfEDu5Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PQ+mP2duQSs+pGvrYKk3vCr1Y+kIzPB69ZMAwLmL/QLK6a0zzeQp9038xfk+sra3qUXL1Sx3ZrKRRUjZPCTkyYRWhBdzgpx+TlQDE8I5Niye95iAklN9qAkc/srbTdADUdqiGlMr4TCQo3y8faRChh7R3UfZcGWxM3QsELecO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCefJiE4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f68dfe7d9so365663b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Oct 2025 18:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317398; x=1760922198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q3CP5zn7Y6cNQVbKaOF7ZpsB9KeE22S/HHDAZmbRxI=;
        b=UCefJiE4fXjDmyhLoqECEpx+zyortNzLptySF2BOb/YF/xA+aT4TVtw5sM+9gYJ6wV
         ZMKwHKTJjQ6/ulSkw0Noy7uD0gYCdja5IvJZpcmIDqfEVeJCJncww1/xQYeC2UTS5eTu
         UhXUYYhvY7mFQpjwuCiGIsH7sSaKC9JVJ+5UkQdfr84ubSFDToE7hvwXpOluR9CM4Wld
         VOjHZasCBmSNw31I1HaUt0TwR9AmVC2OS0i+gJCEnACxg6JxfVWHXTWixMPSTyJoQyZx
         saV27K9doGouiGlmD89+3N+pB5rkGXLmFpIVJ6IRTvi3QCM2t/MLmyPnFjp/M9PKEYQY
         Lg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317398; x=1760922198;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3CP5zn7Y6cNQVbKaOF7ZpsB9KeE22S/HHDAZmbRxI=;
        b=sAtnBk0rBCI4lpzuxfc+GWL70i6uGAyJ51m5tErT91GuwML0cB5zVXWqR3INCk84Sl
         APbKobIkymBtg2SWrLDI7JMzOtdRpsgxV6Z9+DrkmxBGVc0+tS2mbJkxoTCti99zkTEr
         f6T9Um8FZsRQv/fi7l7XwzKC0/34xssJq4ToJVoRhcHNCc1v5Ky/di7U4ukhe19E49B7
         hr0kNebcFix2hFNQWQl5l2Xwsugf3I4xk+wFiHuPgVzgsSq428eIgMrHtzGwyeWCh6eX
         IpXehlxmZnuHp1JW5tI71jRfNWTFh3CWEghrReEDgMk1zjj6zvcLFBslzaCpD1cPGtgm
         jUug==
X-Forwarded-Encrypted: i=1; AJvYcCXEfFfN7y6ZqJDg5co3UCKHyWTaqWNMAWZ//L/b3qLgwWrz2fg30bULdpk12s1bI+cfJ9RkpctBLm8C@vger.kernel.org
X-Gm-Message-State: AOJu0YxYIErm2jTZLyJyp7RCvfSX+Lji2+dNs5pLyGzD5mgVisKnx/GR
	BSeasWOlx79IMygjQPrh82R3soZKoB7VhTQZdYED075AaI+0ZlOLz0HAp3q/L1nC0O4=
X-Gm-Gg: ASbGnct/5DsbJLe6JnSKOjHSd4/geWupYnY9jFrJP66+czKZBASr2niIBBrBaAqNtSD
	sf7K6la18sofRjco+rBqSzgZn/w8f/9ce0b+OgntvBnxuxLVmr//7Idro9sbdQvyiXGHgCg84cq
	vBC2s3l4htGRwK0cM/i+pU0zs1EYPOsP5mSGcHUkVa/dSGbt9RJclb14V4rWa6tnT7xlmKKi63U
	De+Yrd8GrQsQv7LlTbEsVuXqYTA4qzHgQdaV4Ah8+eY+V87rm+L0gBx1Vq3/AhQbSD6WSzhrsxR
	Glm8BpUy5rNiTVUBNXFvRWCfOYNzVS9XubBpXHagOk8zJgb28u7d+zS1EzASlnoe2YH6m+iQdgI
	pIN6oq6WuPMg/hibYmquZYXAX3y4jqVJ3oD6XEYS6OxDlplP8FvSKW8tKN2GrTriE28PXZks=
X-Google-Smtp-Source: AGHT+IE6WFNgYRTp3UFY/txkg6RFy8uxO6N+s/y3b8z3DaRZJqgiRHHOA6mC60ci9MWpIr704MGPKQ==
X-Received: by 2002:a05:6a00:a589:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-79382794da2mr11784375b3a.0.1760317398255;
        Sun, 12 Oct 2025 18:03:18 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm9543527b3a.44.2025.10.12.18.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:03:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 Ravi Patel <ravi.patel@samsung.com>
Cc: tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com, 
 kenkim@coasia.com
In-Reply-To: <20250917070004.87872-1-ravi.patel@samsung.com>
References: <CGME20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb@epcas5p1.samsung.com>
 <20250917070004.87872-1-ravi.patel@samsung.com>
Subject: Re: [PATCH 0/2] Add pinctrl support for the Axis ARTPEC-9 SoC
Message-Id: <176031739107.32851.16814214532966258235.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Sep 2025 12:30:02 +0530, Ravi Patel wrote:
> Add pinctrl bindings and driver data for the Axis ARTPEC-9 SoC.
> 
> Axis ARTPEC-9 SoC contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-9 SoC
      https://git.kernel.org/pinctrl/samsung/c/e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
[2/2] pinctrl: samsung: Add ARTPEC-9 SoC specific configuration
      https://git.kernel.org/pinctrl/samsung/c/3cfc60e09bdc95483875f0b63cfdc23aea67135b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


