Return-Path: <linux-gpio+bounces-26281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A08B7EC33
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E833AF057
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 08:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B742F7469;
	Wed, 17 Sep 2025 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lkePpMzL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA271304BBF
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096010; cv=none; b=On5/YYgurFu/2LNePuGx5OsQEMQBPXnjtAQR0XEEl1E4e7rmMCbsavZ3GA4OY3xhFKqmgKXsgqueosIV5vRUglqURPfWpxJEfkP8SnMKQW+ee/q6wQ3YE9NLwk1JbrHGWYSThvUwT3IvsJefVUq8sdt7gvT4z5kC7+cJqUIVZww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096010; c=relaxed/simple;
	bh=dq3u9o5VWwtiIVB9KcK9a0uDpon6l3TwOmFBbD+ZsXQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h86ks7hEy41DdnWBpXqk6Ti7ZExy8Jy6hlkW0m6p9Nwfbd7gQsbSeTBlRwVcEZFsPgL6QyAQJrzeuuaw8rBw3L6cgPt71AQkAW19JGR97mT5Wd8goVcYnAVCBDFHUZHJ90vHUgUf8xZjyv+dWQq7Bnq6RLZLuFZuGskXnRYDamI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lkePpMzL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-34fed7add35so46787711fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 01:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758096007; x=1758700807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEKtnillVVFfRZ+5u504JAMAMZFI1GIHyIZay2lch2M=;
        b=lkePpMzLNcm7aCq272zukiz/FVDmvMyQlS67iwrPiPQOXg44ECBVrtKATxCROLXrPg
         UEfhItceDdfZFf4tyG8LN4L0Hs2ZddvbYwXOzfLty0jTvVJCigbDP0hWkaav5ftIqp80
         i4A11ruQpDhXCpBAchMuU6XdF//4OS51z/u/kkAab/+wsCc4YLMN6+2Ob/ttMZRej/cT
         vRNa0qUAd/kQChcXtlOzyZc3Wq/wKAQhOs0p7p6liV2vpDWYGhcLSV2FmusnNpz05Wbl
         vz8WKXGxBfnynnSYfAP81dljJWUdNmSSKnRoNUL3CdiyeJCrLkyTtKEZ5rZcOqm3ntyq
         LFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096007; x=1758700807;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEKtnillVVFfRZ+5u504JAMAMZFI1GIHyIZay2lch2M=;
        b=HLNlstPJcxrZ+jnSkxiM3kKX25Bt3Onhs2UutWZ3LzeDyj/9yRQnMq+l69CSkIoB5o
         +EiTMkxvzOOK7eBPz/sxZdpeblbrrORmBSTNfc+RqnCCHaQwNmqxXiFzuM5jlwVxo1RQ
         VCVwgrS3KwZYUJ4i8FxlyY2q88bMcaQ5y4N0a7gmDTqYxLBf6L3QXB5ocff81Hl3gOzu
         EeO0jnHdin8qkRNLaGZlpI19Z7kRWhEAy2N70daHuLF5EQMTEtyZO0katWPYKNNQB4SL
         1qpWZV4CAem7oyEAtUIV7EBh8QqsAEstqKxx4dxr+fNIjB1ZVDoLxDqS+FBpcEbK0xBB
         cmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYETOAON9chz28lEAz+ujkp6JDBoe+pVmxNP191En6VAiK0kcLUsm6S9pbO0MiUs0vOjIOUn9q1BHU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywez6ngMoJn4jEUg3jwSltvOCkoEVeuJY6lhrmcUoqiK1BsHFvR
	Sy/yz8Gi3q6R7jgHSldPISzpAV7UHJaf5P8lq+G/8/gFdK/y9LSWaSQyx4XWSzyWprNn7zW1/eW
	HKSDHaciGSw5h3JwtyMOvdYMY0rt1/OJ8LhPRVY2WQQ==
X-Gm-Gg: ASbGncuyzj3TVv807nFe6lzrEMZSlDBE41e+x37qVXuY/c+xqWu90IV6Q5kU60GxTQL
	80q1pPAWi8N8bLowUY9lIMEzczoTSeIAwEqquQN0AzITQ7glQbfQFPwtdvG2jJ5UNN7F46dtXMx
	hEQ3iyXTEOsqJvtrSgprkupcnPPzAg3N65weIQf/ZlFUKeCEZeHePSs8t3smN9LRw0qy0V/duPL
	ulrT3g=
X-Google-Smtp-Source: AGHT+IFb7uT1amCYEcbDk/aG1gXDqhuVxynj2vweh0X8HkHwURxRRNA23Yw7fUXf7MR74tQK3DcqqGV4vVXMX6Mmtb8=
X-Received: by 2002:a05:651c:1503:b0:35e:401e:a8a2 with SMTP id
 38308e7fff4ca-35f653c888emr3283521fa.39.1758096006643; Wed, 17 Sep 2025
 01:00:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:00:03 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Sep 2025 04:00:03 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250917-rda8810pl-drivers-v1-17-9ca9184ca977@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org> <20250917-rda8810pl-drivers-v1-17-9ca9184ca977@mainlining.org>
Date: Wed, 17 Sep 2025 04:00:03 -0400
X-Gm-Features: AS18NWCZjow2-dnpLe_oaxtKdrNMg3nTySj8u9HPhpYEQB-s6-z3-oDqLWpwlyY
Message-ID: <CAMRc=MeHQf_Oa2DRR0T7tum-Tuk3qPh5r5gimxGY3EXTyvoKZQ@mail.gmail.com>
Subject: Re: [PATCH 17/25] drivers: gpio: rda: Make direction register unreadable
To: dang.huynh@mainlining.org
Cc: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sep 2025 22:25:14 +0200, Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> said:
> From: Dang Huynh <dang.huynh@mainlining.org>
>
> The register doesn't like to be read, this causes the SD Card
> Card Detect GPIO to misbehaves in the OS.
>

Hi!

Sorry but this message is unintelligible, please say precisely what is going
on and why you need this and why it won't break existing users.

Also: the title should be "gpio: rda: ...".

Bartosz

> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  drivers/gpio/gpio-rda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
> index b4db8553a2371ae407fdb7e681d0f82c4d9f74b7..56aaa9f33d29469dfb1bf86ed7b63c54b413c89c 100644
> --- a/drivers/gpio/gpio-rda.c
> +++ b/drivers/gpio/gpio-rda.c
> @@ -245,7 +245,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
>  		.clr = rda_gpio->base + RDA_GPIO_CLR,
>  		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
>  		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
> -		.flags = BGPIOF_READ_OUTPUT_REG_SET,
> +		.flags = BGPIOF_READ_OUTPUT_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
>  	};
>
>  	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
>
> --
> 2.51.0
>
>
>

