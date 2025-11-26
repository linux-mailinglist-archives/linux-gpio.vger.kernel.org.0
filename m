Return-Path: <linux-gpio+bounces-29094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1EC8A84B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5869D348091
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19EA30276A;
	Wed, 26 Nov 2025 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3Wtgqi98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F8303A04
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169533; cv=none; b=Opdzgw9bJEpPpWvkCdpefLIwlMMr9kjVFlXSa1qiLoduAUfEIs89rcjhKHKj00aatb9Udw0q5Wk8XXpYooGk8vVjaVEwWeOYRDOLUkQbvOGQP6PdTAjOJPqodTBEhWipN3x4hJ5XYe80W8/M7qDdZrVrCaSioLH1ey64+8bMOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169533; c=relaxed/simple;
	bh=J+oyg1mBBqSSQQkvSrNBpiZ7W6zMitALsCYhR3FXK+s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u22ZSWn+jCKnWO9tmp4CW+pHKKz3V+K0Uk9YM/ZjswFIcIcLr/wyT+YUPGGYA+DgfjFc+PMZvyDdpG+2ZytmLkcJQubuiwsJJBr14VYYNycotOG/BhsfV8prWXdaqMkcLUMWsrXaVuEQz5SshfOQIgUt1pq+f6ddCacOfLmpS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3Wtgqi98; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a34702a20so56072201fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764169530; x=1764774330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=3Wtgqi98DePCWX3LVQHFO8RvE/Uoctt4R6OLMyobJSdTCkfut6H3uSSejsiM2Wh0+t
         N8Sq1CISf/NnD1674k0f+jXFK4Q5/ueq/UQgrCAgSyakuDlQ06o3tNPqp1fjd7Bhodn5
         yIwb3CREJ8EQ9gkb9xkTKxLISO6byCyKAgSQY0IzMmVWuyTLYSECzlMS3c357eudzVN4
         0H/WU2X9T+ANnPruXCjmu9vSWit+hukqceg4wPIeKiZJDlyFOe+xdWtmF5jV9Uhb/0uj
         XFlBonSqH0dbr45jKeCPMN9rLBVJwvFjVLeXYFT5BdLzEYpAaIumMZBbTkA48bregwBH
         oObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169530; x=1764774330;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=k11TiggvQVq/16N8EmutF1jfOc0762cyOg+L0m303ZddM55SsWhGyFrlEN3+UxYIgP
         WCwqWZluNlV7iuvCgFIR72b3ru7tySBR1VNS+W6XcazU16k8KqIalEcDLMhd7PIYXAGi
         gqWNFu5AQKNQjWY/IJEqYHL7AvMEP4S8osUekv7Vzk+WQDHOlv68grE/zAhDZOBiD9g6
         3b1JSXT+zUwcccbeOISxNQw7kpfbniKJs4yPqD+aeRUI41Ooseqy0Yy2g85QNMoFzHzN
         B7+0fPe5tE7kIsHWB64i7i8NePoG4m5xXHe8yN5Kv4d9nlfKaslYhZ2umzMwXIcjH6VD
         j7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU4O9US19b6CNO9ZU7flpiF92PYmcTvif5pc+YoUtRbTDk6ozY4AZRbeXDAzXwhlslfDKu4YTC3TK3w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ie8pcbnSGENeHBpxrC0n4bpm3sqXkGuiq018RzAu7Vfbx0s4
	Mpve1C6HdkUXRLI4klx1hfjrPpK5pJdxu/i1pGcCg/UYQvyaAS+s360wu1MduApZOpgBY57EKtL
	J+3ufZjJMLW1VEPH6w1FXPOKSgvUB+Pj8y2xk/kwmsQ==
X-Gm-Gg: ASbGncv6oOkEUGZpalNQ0ZXc5sEc52Hy+Tdxs4SrMFkorOcd6h6vOwv4Dg2EPWskphc
	/Z3a7svXef/CUjw9dgj+TnliI0x+9XDptBBZfxsyMWiEBMKDQSOHyRoEvToHuExo3M8XwBeAWcJ
	x78XVxvTqkdJbYOxuIbMtksk+c00VkqfXw0gP1pg3e5HmfkLdFTzmidvi9FL5NXBLEqwXVCr2ta
	gq2UmdwCyb/R/ZLLY3OtZ/ZrYpTeC6U2GvM//fSST8+gKcjkCMWN+xR/IoFv7F6j/W/N5L0yXi4
	XFzW/xYFGXQuTBaTYSRmHU/rA6I=
X-Google-Smtp-Source: AGHT+IFW4CVHKhpnJ+JDeABCBeOEaqoUOa+vDI4F3g0UIFLPs7i4zmAKKWQz/RrJb85q7OyTg13Elak/IxVETnc6Fz0=
X-Received: by 2002:a2e:9f4b:0:b0:36a:925e:cf3c with SMTP id
 38308e7fff4ca-37d07952b19mr17246381fa.31.1764169529898; Wed, 26 Nov 2025
 07:05:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
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
 <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
Date: Wed, 26 Nov 2025 07:05:27 -0800
X-Gm-Features: AWmQ_blhTm345iaYZ4rHG9m3t_z_cQOEDjbyggM_ksomZgdEfdTrTBoPz53r_Yc
Message-ID: <CAMRc=MerzKQTSj6PXeiWDA4qfNou8ApKYLgJhUGLP0QBatqtVQ@mail.gmail.com>
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
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 15:55:54 +0100, Jon Hunter <jonathanh@nvidia.com> said:
>
>> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
>> Kconfig and post the entire kernel log on pastebin?
>
> Yes this is the upstream device-tree in
> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts. OK I will get the
> entire log for review.
>

If you could also add the following:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f99..51af7886d9f2d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -101,6 +101,8 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 		    strcmp(prop->name, "gpio") != 0)
 			continue;

+		printk("%s: %pOF %s\n", __func__, curr, prop->name);
+
 		count = of_count_phandle_with_args(curr, prop->name,
 						   "#gpio-cells");
 		if (count <= 0)

That would help me.

Bart

