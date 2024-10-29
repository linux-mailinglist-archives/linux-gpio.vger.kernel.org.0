Return-Path: <linux-gpio+bounces-12285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98499B4660
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 11:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C2D3283A41
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 10:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A99187FE0;
	Tue, 29 Oct 2024 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2SEk6mL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5942038A3
	for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730196324; cv=none; b=pbH0dgs5oXqJ4Xmin2O9UZ43Zx5NAeZ4k678zPxLFYHVQ29KexCOT/uBatA96U8bszWK1VCHDOjxxAyw0mhMrzdqyICnzsnCKmbEz5AfNn6mUkk8A5ydvjZPCcPRvknQGT+UAZL9CUqLAk0xEU///KBPpeeNjcPCfw9Cq9ioF08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730196324; c=relaxed/simple;
	bh=AfykAnYLZupGg1fLCVn8uYBy1t/aBOVuyKkPyLQTwRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZINy91ualHaqZg/WSEX17tMi9JvoPnhvpHjBi0x7wHKAuuDxilFy1sLiIm9I/JNjAAKK04lhQDflxsskMu6pXfiAj/ik1P+E8eneggZYHKo1x3T8IEziRGT9JWk5NY3Ery9LMNkTS0xLhbeUQc8rwvZxkmh01SwfwaMIioZEATs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2SEk6mL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso4539677e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196320; x=1730801120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=K2SEk6mLQhmuMGkCEAP/7maZCivDCatMZZU0ZxYlsyNSCCxV0fLDCKM+gL8MAINSJ2
         966UBH/rygUX2pZm0WbB3mljpKcDeRCdmZw4LlSZEntx22jwxiGaUu2+npdSWrjr5O0M
         w7aB/2sw6qdLeI3tUcSjT9pVsah0SfZgpiW4vYMjER0M+6uM6ehds7TRlKSiE6A7uu6T
         +wgKZrlpDVgxRESgyv97l2sbU0mGz5/5nxaAowfDcUV3NMcKpbRf0N5iwNknbvACHYl6
         UHzmgKN9P6l1t1QRjnMJ68S+hAlJbjmdMdmMYtmZUhWF9Ci8VJWcR9ZXK+INm6ZKxyrK
         Aa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196320; x=1730801120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=D3wbYU9fOhBsQ8UqN6/VcyWGo8e7de3GimPzbldRw/PWHgveJqaxUa68Dh1eQCAHRW
         5xBp/SALlaJEwNhzJpOCAO9bVOmEn9ApS2P3N2WbpYYzpb6VYB/TDFjnxNMGp3LPl6xF
         6MbysYh2ZOS1Q0eRECnmrCjzQ7nWLYkoB/qKkqM1G0madNsDz8FUFG7MfSBTLFTIgqxu
         LpwtNEFIRrmfi4yekUnn0Vc/fl34sJiHZn3WzU0CIEZBTD5Sr4W3TPlHqV9FfKUj3xJY
         ksjSlr8328Vkar1B6ORdSMseZrlA/2l2fCvRTWV5dxK6X+IxePYyeItUwSvdTJ6GoCHh
         1dYw==
X-Forwarded-Encrypted: i=1; AJvYcCVfI2uM1tReaJ62uc4Hls8qKJhBhw4N34WoMpv0Z2fqnV3FPL5yZvvqZnm5T3hCniwrIEeyp7trNiGR@vger.kernel.org
X-Gm-Message-State: AOJu0YxhLeghav4dWc+6DNrZ2Nyw6i2jGkeD08n+Af6V8xqbHO9bk01Q
	mNhZEHWgfOTwtiBaN/ATu05UVAXwMV/p23rizIGabs6JGaSyn+ienPG3SAwGkKEi84zexNrkhhe
	ToGImiCdwJGHkW0HCGc530VbObGP9dIeBwMMYyA==
X-Google-Smtp-Source: AGHT+IHRjlZ5hUDjfU+PhK/6e3oqa7R+fo3XhjKnYIjv7VyxU8Q5LEQEqbHbzMAmS4KxgFa0+3jWkOmL3SAGQgEfxvY=
X-Received: by 2002:a05:6512:3c98:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-53b34a19727mr5084956e87.49.1730196320370; Tue, 29 Oct 2024
 03:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:05:07 +0100
Message-ID: <CACRpkdZCeQFzqbSN_=jX-_406OyxOoLb3b0R5NX3SjacE5JZSQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.13
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 8:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.13
>
> for you to fetch changes up to 6d2dbd4cec8939ad2b813b8052eb12406db528d7:
>
>   pinctrl: samsung: Add Exynos9810 SoC specific data (2024-10-27 21:02:08=
 +0100)

Pulled into the pinctrl tree for v6.13.

Thanks for sorting out the Exynos drivers, excellent work as always Krzyszt=
of!

Yours,
Linus Walleij

