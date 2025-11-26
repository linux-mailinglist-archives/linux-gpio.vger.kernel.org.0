Return-Path: <linux-gpio+bounces-29096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B72C8AABC
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1670E3B6D23
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E6533A01E;
	Wed, 26 Nov 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ekc7Rb5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6490F33A00A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171241; cv=none; b=jHh91CD3oJyVZbrpEZgTocX0X/5b2jYx12b0eNOKSf4BWQhIpCS8CLmexaaz/HWp7EJJIJrmeigKBlAsr/C1OtHdKiOepDQtDiZoWlduU3OZCcV++k1sXwoUVqul0JaJapJXAh7xh2Cqe0ycFwC4F1hNG1YrytqZk3LLhKKck4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171241; c=relaxed/simple;
	bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOzAmU4B9eoiCxOkUOv7L5jmxNw4SjgBiK9ZP0rQBHcimxoSlGSOhUtnXEhlnwkxRMxYmlQ2elL/2dSMiLHRkdWABJd7icw31qjZoVPYv+/KzbzbFJVkqrfs/7N1DOpWgiw44pBuL5AOh1iNVZ9UKyZjeOGQQzVcMZf8WMcDTOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ekc7Rb5Z; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b935df7bfso61885881fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764171237; x=1764776037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=ekc7Rb5ZoFqTdcd8CvsNN//6f6eriL7DrECX0IiUsuK8YcaAvtT/hlYyxGWhDnHEGV
         4waqkwmnQTetpoStQmgmxfz2PY4+LDpNfd2HFPL/zkFlWsFIa4eSXDku1caNf5kUa3lI
         Hc+Ex2cEXgMUCVrupcDM90b3RVDJGa+D6hcCxReTzL7osTYd8fcjq9yyE5qfKvxYF/up
         fVqdA9xKPKo1AFPP/FmRS80LaW9piOWyNXDmEHRLGQTpW7kD87PZJ/6UWp2BL0H2y+y+
         rj+lFOJ/vZ45iVnXIyQzdt5FUYoo7BDFfg8Gycp1WilvRpycRH1DSdXParqa4+oH/9ZE
         RBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171237; x=1764776037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=k4/K3/9xNXRY1chUj5d7Q+OnBpeovPK+ujtEXpn4HSnyiR+KzhmWDfFp9ZGvoGiUfO
         +c658RF3ogBufuwusrlGKVr/EIQB196dVIiR+k7l9fwW/kk82NqB42riFAGrwqgZ6dHW
         cOXm+Bh43Ni1+l+TpGqmaDLPNUaV7EzgKUAGv+boljzlEBLLPlHVv7waptrbaBGiypAq
         Ovs2u4FVgSRRTMPyBKj8Yj6wAMw0EW9/FLue+0yWTv2ZBU0mSNcHIB2Y1BlYDY9qrXst
         P8jrvn2BXEV92BN5JkM8zZoShSF5UkdaCXphqcGTjB22dvmLhc9ZqygFKE+SIq/P0c0G
         915Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5FQ+xoJYEk4MVNrjl9I12EwLLdHXKNusn9k1j04Smd6VC3ndBl2I2r+T5BDXOcOeadk0O29D6Dkvz@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmLhfqIBYv9cJi0kAvGOYsBUmH4WcTIlYGTsFk7cS/F207937
	+6ncAU07ii0aSEBtKMioiSOlhQM2W5AJsFJ6hKG7a4CzLRnSvFF0s+dov7SAvpRFH5gVvBYzVj4
	qkphc7h20YsSlhWE1wf4xUXisYy8K93Kv81EIH21tBw==
X-Gm-Gg: ASbGnctULSkIMXiHqe9klPE6juh2TrMFIUo70YuCMpoL+6Nc5bZk0uok86vCx2l4ZHh
	c6PqweiqQbhfhp6exdoSd/HTkcM66pLDyP2/0dMNPQV1rKl76JvznSS0emAK5UUgi8VLCsRe5M7
	GgPAnb5QWDF6I9b1vRLYZYZg66g/i8A7bUdCfdMNkc7xZVHxk6a7ZrlPT4G7maOt9tQ6mf+pwKL
	aSexhRl2FAGo602V30pPeCaPaawAHxtSUfPzPB91D0V2xcxDht+KhxHbU4tK1MJWPNNY5C1owZS
	8Id3kVOCj8MknGyG5RsW3G7FaWA=
X-Google-Smtp-Source: AGHT+IHpiJdAZcmd7ay5hxpzMSKF161dOYZF4eYXQjGHf0aIOIU5+E3pjAtawzgBqB2Cu4BXgwWds+NFi8l3GMK+YEQ=
X-Received: by 2002:a2e:6e0e:0:b0:37a:4714:ff39 with SMTP id
 38308e7fff4ca-37cd923e013mr51455941fa.23.1764171237355; Wed, 26 Nov 2025
 07:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
In-Reply-To: <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:33:45 +0100
X-Gm-Features: AWmQ_bmsAdHo5JAtQV4uhxKNZhn_21Nb7ErF3vgXJlQ_8wKth0d2tGKqeTK5e-w
Message-ID: <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 4:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >>
> >
> > Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> > Kconfig and post the entire kernel log on pastebin?
>
> The kernel log is here: https://pastebin.com/7rBh3T3T

This is not telling me much, can you try again with the printk() I
posted earlier, please?

Bart

