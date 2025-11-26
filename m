Return-Path: <linux-gpio+bounces-29084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C0C8A544
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9671A3A8711
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CB7302146;
	Wed, 26 Nov 2025 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u4XnVqsX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F230301717
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167308; cv=none; b=Lhitdp2IZV86LeJm0mD9GP4SUIo9K11rnuSpiQV+fogSFWLtkZCGdoMSv4/FhkTw0yL4FJ+9P7bGGdef/xHrLMb5EVBnuctyhlslO6+wyMy2Mpl4JXfj3CDDVmjJwgELFA3+1alHGkCPZmVqCrNmOTLesscUGPOqVGmIPkt4sx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167308; c=relaxed/simple;
	bh=RN30k8HzM73JgGT4+Hmg4UWVBm1+ESD5dIcHIzaZOQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHqLgKelYqg0qiLaio2WhmToCFboMwL/I7ffBIEDZxB4dj4BhmvpDZY40Yj79YgvZgpDmb0EG2VWzZhr8qwWn1Jh1GKbWG0RZDIxIYjwQhr025p8BDSzKWTxhTfRdJZWQjIrsfpXqGUPFWIapNh2JhUt3xZkOrK8LuWB0Y35glc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u4XnVqsX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59584301f0cso7346831e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167304; x=1764772104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=u4XnVqsXhUgUuNrM6sCQ/+wFu2/nLoEhJvb5gjhzLyztc53eSubWAHkn7kLXRzXSek
         +h7bhQGh0Ntfbh9nlKeOHQgoIINugaAugdrMT/wbPqZ7j9+ceAIJiMC2DW7zaneqVqlQ
         VetOL0H209f6ODEJuIRs5kMhbDHwPstVHb8t1NnDl0T9K5wGVMP2JbvdtEQD6Ngahk0a
         zDZs0+i2P96RPzguhIDn9Vn0zfz8R0Oqk2I+PC2sEX8Qz09FY8Zff0ZYj4cVUCFphKl+
         1VyaWSkTh+kuhtykMvWQJtCrBaZDiY61Fr/GB2VfCRa4vLAHDxJPtz64p9m25dgVuIIN
         KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167304; x=1764772104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99lpnDtwvR5Caoe15DElF4/nsM1rUy76fnsNsLLTs4A=;
        b=CMH8+l8BR1+bQLNK9Vx4T0AWmFZ0cA1qlUVJj9Yu4xZ0CPvlOdbi/HQOD6aknq5Qbv
         rNudlh2kcYmPkOziHjXc+O2dKfZ6XGglk3LeCVJz8SVINtD/B+V5iNP59x9O+be9a/24
         c90cUVseqZXFWdeOO7YcjfN+vDXEpw2R/Wp93+tEO8/9OCdxlcF6DIUP1BKLBqwSjF3a
         otJdnEp1EqvXjf+CIjcNdSH/pQDOhYj1nudhxFmrb8Kqn1kJFb7HlvpkV+o403nzNvKr
         XT5JWri8IUQFgn4ASSas4+W5S+hS1B9ANzNsfdGfboOJrmpePHYHaN3ONJefv2c2tHkG
         FO6w==
X-Forwarded-Encrypted: i=1; AJvYcCWcHOVIDHNeouLNyutApJkqALyhYyaC5XojWmyIFfk2pUVp9Yf/Tl4NpUfpJmLaQmUWaMr4eIvUvHHi@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoW0OzNRUbeDi/EAyQXR2qXlZ6BjMMb0rsMnGSbnXXLHk/hLj
	xSAsjbrzTt7IvYpRul9Seihez8JYmQPgeGP4kQFU9vzlZpMf7i6Q04t4/La8qJtiPavJcXr2ZIc
	FUWPhSSmKpNjiozrhWDo/+JgTL9Z+wlkt3qq5RY2OyA==
X-Gm-Gg: ASbGnctcAtXog+NduwaAXQMLkcUypUDH+hFRgh59sS1nAEom1PFrefHtfWjTxl9mi8Y
	E9cTGJhTahcI8WcMZ9WwZ7fz2a9K1laKyx+sBg4gEhk6CRNEroNVjOO7OuKVMuXpBvGu6rT+b+n
	IZWpnrCyG+q5i1PyQPI0ROzuANG7KJTwcCluLCcpiY4XvRNdjN9xcNJ6hEelZZugc+TPXQiJyPA
	vrfjVxvL+W1dabQobxJ+Ptt3/aiLxeeZjXF2tC4SkTobL/UkafpfzX5Ka99d8wRdy1ZrM+UC5jZ
	1OzIcyaXbW0fdurxTbMlFZlme6Y=
X-Google-Smtp-Source: AGHT+IHk3ZX4aUUBolMwiCMXAcXiwyT2Dyate9UnnaEtVgZgfmV77bNvl6bV8cACmOgABB87QFqEt5N/Ut+6mcoRVj0=
X-Received: by 2002:a05:6512:12c4:b0:595:7d95:eacd with SMTP id
 2adb3069b0e04-596b4e4b76dmr2588737e87.8.1764167304291; Wed, 26 Nov 2025
 06:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
In-Reply-To: <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:28:12 +0100
X-Gm-Features: AWmQ_bk2gQa2v3AxwtOwsX10QuQjgn1DPsSzq3G8PlY09kgQ-V2J9JlUGzmza-k
Message-ID: <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Bartosz,
>
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> > index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -316,6 +316,7 @@ config ARCH_QCOM
> >       select GPIOLIB
> >       select PINCTRL
> >       select HAVE_PWRCTRL if PCI
> > +     select HAVE_SHARED_GPIOS
> >       help
> >         This enables support for the ARMv8 based Qualcomm chipsets.
> >
>
> I have noticed the following kernel warning on our Tegra platforms ...
>
>   ERR KERN OF: /__symbols__: could not find phandle 794981747
>
> Bisect is pointing to this commit and reverting this does prevent it. I
> am not sure if anyone else has seen this?
>

I assume it comes from drivers/of/base.c:1295 - could you please post
a stack trace of how you're getting there?

Bart

