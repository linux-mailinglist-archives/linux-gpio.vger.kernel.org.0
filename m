Return-Path: <linux-gpio+bounces-13065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883309D0C00
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 10:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 093E8B24A1E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 09:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BB21925AE;
	Mon, 18 Nov 2024 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZV+TU7NO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7618C33B
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922823; cv=none; b=d0S6N6s+RGjqm/UHXNdzUDdC+si9h5PX8ApZ4E5fWwYYaS1JYxlGLTswzy5XmIUTmqZ4J2HoecgP1VTDE3rQ9dq5G96VxQnS/OT6GpB1eXTWXZNK18Chh5uBz2iGKXi8A/bb6AmqqtyVMw9Vrf8qXQEP2qjBWEYjkgv2pDvOPRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922823; c=relaxed/simple;
	bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ohi04cIQHY2aND5kLpR1dUpzWLnB34AjNVWbwxsgJ7HS0CizIbCE5KFudbCwCnhCFqDX+YNBhPaFPPMGY9l4G5DG3a7upipYWSnROPS1/MRnSMPsqIoesX2QPW/KrM2xtw1ExKGsyqHNgWe0q7Hx/zUXOXs4c33bu4UBzOKC3vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZV+TU7NO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso34636415e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731922819; x=1732527619; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=ZV+TU7NOJI40iDDH+7QIyyvyzwmDPk5q5oVOAM2vME0PtVYf6q8aGB9Ylnw2COb2a/
         xz1yfCBiDQAFlDH9kPdVkuZ2/Wg6Jfgis8a7VHWrB4qHTzVzrD7qpeJORBuO8SJDtx1i
         1pRCUsZhsu25gs7nwvqaiAn2Z3G2J3HijK3cT+5TUZKz5Q1IVna1M8lx0rbYf/suuZF4
         FHFX6a+j5s3mLUItgNapuMxE6r0+OroRTSHWHvOIo2XyeRqf/C9N2nejc3ttesjywWE0
         5FjNU1wp9qHzRNv3OrqMyHqZO1apq4bG3/hg59/DDZSbIdX1pazYGmMGKZdhoFikbk7A
         J7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922819; x=1732527619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=OM8RFLuMDANeTdGeWPwzHddp1AsJr472Vyk/vWD0jrh/nIvBO7MmCi5F/6GX25dJUo
         o3/L0QwrQjqg7XH0l+qTyZOZOGMDeTH+G1Urda6vo5BS1mlLKiiZkv4jK2q3SC2vu0D0
         IdnijC/QnjBo/ZJnLi5pCuIZjXdc5zVTSq+f2dCZLTVAdpgNCcT32vlVI5TqGb7671Ns
         3L1/8ZWnoiP9oBtT6d+lV3YrwMncgeFpJEVM/PEwtS58Eg+pfd/yusPJuMiXaVgv0OFR
         WcGvWe2buK7rb5UEj2utysjyYpyalktUMU8KBNIOb4VGQi8m2+/vjVNGiy8XSXQ6kbRM
         TKbA==
X-Forwarded-Encrypted: i=1; AJvYcCXuk7VwXT769oHUFgeXKGYVwrszXOfGL7BVRpW8LKYgf9ULxYSAQ5oqMRUaeNNGHnUUzcgVz3j6Atdv@vger.kernel.org
X-Gm-Message-State: AOJu0YwhHLsmWB0SkZZAQBtWOc/UiP0BT8Bqru6/GRq7yI9Z1vsnSaig
	V2OXVYivFLQJL9oV7HzDS5jz816DvxcfDWM3yaiJCTH0cWjuGIwk+NnIv5cdhvk=
X-Google-Smtp-Source: AGHT+IGHa7gc48NoS0q6ZGoDNAksIkFsU8teJxL7tX5AMyhsKg2Sq4IjQbIZKZWs65VOlUxgPKn/cw==
X-Received: by 2002:a05:6000:2c6:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-38225aa8607mr8472740f8f.41.1731922818924;
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382456ba017sm3220899f8f.97.2024.11.18.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Message-ID: <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Mon, 18 Nov 2024 09:40:17 +0000
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: 
	<f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-11-17 at 13:03 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
>=20
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
>=20
> Add a new label and a goto for fix it.
>=20
> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>=20
> Review with care, irq handling is sometimes tricky...

Well spotted, thanks.

It looks like there is a similar problem in exynos_irq_request_resources()
in same file. It should likely call gpiochip_unlock_as_irq() if clk_enable(=
)
failed.

Care to fix that as well?

That said,

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


Cheers,
Andre'


