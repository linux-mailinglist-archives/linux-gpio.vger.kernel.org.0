Return-Path: <linux-gpio+bounces-19821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E62AB0C8F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728E14A1D54
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C643272E69;
	Fri,  9 May 2025 08:05:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FBC270EDF;
	Fri,  9 May 2025 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777928; cv=none; b=TMfWg0T5Ac+d4xw4q9i5fEG/45Hw/XtkMa6I8t5keg4U2dcF2t2/z9KSGhx8j3wzZT7xDAz4V1ZuEg6/ivhfYXV5K5b4I/fE2LLssiffpGuxCdgDee2UtF7JFFWT8/SzykNq90VhZ5MsD16FEwqsqKnHA9VS4J6FIU+8nb5/mN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777928; c=relaxed/simple;
	bh=phUxJmhWw7uIa33mXedAuFBhpzt7bDNrveNHCf8RS88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNSpk7IcAVcee2UB5b4t5i7nbgwV5r8M9Oz+BMIB/jmy1E7bWt1qO1EKPha4jgTBSKUPUrf3b+QLGsyZTUIdoJWdI0k5q5JHCstvz6SGz0z/RsVD7Y8dPSrq+BMvf6wnnooIv0j+pdYu/5ihmljYekIF5vmea7JJkrSPwk+akXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-524125f6cadso1216850e0c.2;
        Fri, 09 May 2025 01:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777925; x=1747382725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjQjgzloAxUI+ZXD1E1LDnROhCnYRs7NX6xfonnwgro=;
        b=wfNoACJPHdKt2NfjBCOz0A7v3+wVWvR1qGLx9DiFBevfcMN6HFrNATCahh2GbZGUOD
         CcyvepK66Lv0b42rGWozrHeWmtgJS1CIqdbRqNPwW3mkMM8/SNaYraHXrhJ7BpfFy6u8
         llZ1GQEYdsKit+zV+2JXPqTA+AOuq0ez3QTU+KyWcSlBDDu7Qiis55SyNsn6EIQZ/Q6x
         C5QZ4VYZlM5IsO7dSThW76GUCXc4/3MSOHVt0cPL/6t5unsxUisQ767w3OI3Mr7fDvnf
         2f6kCAyxMKDsTNNFz7FUcPr6X8/fTcRaPoUMziTKfxQsnGvkVZHjcg+XzgfOUBzR24Gx
         5F/w==
X-Forwarded-Encrypted: i=1; AJvYcCVlgitA8Zqh+4Z37+aowR7dVKUFHkRR5G97ViYa+KoBkrQcKARy1CJ3AgiwBx7MC0cwmMtkRa4jCtdDBg/3J+L6@vger.kernel.org, AJvYcCWytkUERRE0OhFvjA5Q1pxom+011930UnslxA4lany56crXOZsjbFe373ekkPxJcTgAWSDE4f9B30ppJTfe@vger.kernel.org, AJvYcCX2CwkUtpu+3dzcMwmDwNkPqm0I9ozXjjDtAugXbtTg05FCzKSzzx6n7YNpp60LzNZ4j2KZHU3h+FQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2MBATvDCw8u5eCq6zRFNMUd9MUnjrk3hoiHRE7+FKseodnEx4
	xIbDN1JBKjfdH/kKyXk29nLyD49c/SV3rCWyy5APKyBn2H0GXr3CjhBFQYaU
X-Gm-Gg: ASbGncvWvCubwC2PrAPBHl8bnjlyyBUBgk+DoUGvjPd190/bXOP/ibQ6oDEkPoKIRo4
	j84bLhjm4Io3BA5lMVGquETYOE2A5DfXlUzqZqR8p3u0q4NQ5AwKX4FTewPK96R5HAcmwPsF7ED
	3OS8degTV9cwMtxiVOPiFPwpSFe/I8D9qUkFIXBDWLFrVX3OxfUsAPvdrLxKBTRVK4ABsG065Hn
	5mQWJxdjPp8l9j9B6ZaBno/W0ZckxZ4q4pynoewg0k3+7qU1YF4/wzbrKHazOl+E7RxutUNa/qG
	4hqdqZRCxDlMmS6rmAgqG3BYf/94SLsIZ5uS9opv2tG2N9FzbBcb0LCNYYvIZ2PrRJ27HvdBRNF
	u3qU=
X-Google-Smtp-Source: AGHT+IHsCpw1GX1ejpfukYGOnQaPop6VOKddNJeEtNe/dJXKN1PjtjrZb4vjIE/GMX6be7v2Q/+v1w==
X-Received: by 2002:a05:6122:549:b0:520:6773:e5ba with SMTP id 71dfb90a1353d-52c53ae69f5mr2320409e0c.2.1746777925216;
        Fri, 09 May 2025 01:05:25 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375af9fsm766613e0c.23.2025.05.09.01.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:05:23 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4ce8aa3113aso1330656137.3;
        Fri, 09 May 2025 01:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkHygWvol1jvLfupz+Oo7yw4h5k4OUZCGmePgGFCCdTJ67iWiCPCeOF1gI05YxHHX55j6VM3fVCN3e@vger.kernel.org, AJvYcCWsHUvHVIIKX/p7mMICC2pnoqIBMhcy9zFpKSsk6k+l+fzQsFF30GmVJ6yNvij905JAMJT9bODmXMyeAsQp@vger.kernel.org, AJvYcCXIOYwGVKCR67GlrPYheM/Gu9AWfvHuZop+KML5kg9freLW3UXgUHtm62RljCO3oOwq2kzvavHrwZOhkL6k5ufj@vger.kernel.org
X-Received: by 2002:a05:6102:2c02:b0:4c1:9288:906c with SMTP id
 ada2fe7eead31-4deed33c572mr2540238137.9.1746777923178; Fri, 09 May 2025
 01:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-4-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-4-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 10:05:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNApWw_z4Gu7wyGx6Zs8ac7dyxZke4OSw1FWseNpfGbQ@mail.gmail.com>
X-Gm-Features: AX0GCFuYx_5vN6RKnbOfyaU_VsHdPO9HeuQ58XE6b2YMBL7bMjlbpNJQpjlnGNA
Message-ID: <CAMuHMdVNApWw_z4Gu7wyGx6Zs8ac7dyxZke4OSw1FWseNpfGbQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] gpio: aggregator: move GPIO forwarder allocation
 in a dedicated function
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Move the GPIO forwarder allocation and static initialization in a dedicated
> function.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -498,6 +498,36 @@ static int gpiochip_fwd_setup_delay_line(struct device *dev, struct gpio_chip *c
>  }
>  #endif /* !CONFIG_OF_GPIO */
>
> +static struct gpiochip_fwd *
> +devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
> +{
> +       const char *label = dev_name(dev);
> +       struct gpiochip_fwd *fwd;
> +       struct gpio_chip *chip;
> +
> +       fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)), GFP_KERNEL);
> +       if (!fwd)
> +               return ERR_PTR(-ENOMEM);

The caller expects NULL for failures.
So either this return value has to be changed, or the caller needs
to be updated, too.

> +
> +       chip = &fwd->chip;
> +
> +       chip->label = label;

Since you will have to respin this patch anyway, you may want to
drop the label variable, and use dev_name(dev) directly.

> +       chip->parent = dev;
> +       chip->owner = THIS_MODULE;
> +       chip->get_direction = gpio_fwd_get_direction;
> +       chip->direction_input = gpio_fwd_direction_input;
> +       chip->direction_output = gpio_fwd_direction_output;
> +       chip->get = gpio_fwd_get;
> +       chip->get_multiple = gpio_fwd_get_multiple_locked;
> +       chip->set_rv = gpio_fwd_set;
> +       chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
> +       chip->to_irq = gpio_fwd_to_irq;
> +       chip->base = -1;
> +       chip->ngpio = ngpios;
> +
> +       return fwd;
> +}
> +
>  /**
>   * gpiochip_fwd_create() - Create a new GPIO forwarder
>   * @dev: Parent device pointer
> @@ -518,14 +548,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>                                                 struct gpio_desc *descs[],
>                                                 unsigned long features)
>  {
> -       const char *label = dev_name(dev);
>         struct gpiochip_fwd *fwd;
>         struct gpio_chip *chip;
>         unsigned int i;
>         int error;
>
> -       fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
> -                          GFP_KERNEL);
> +       fwd = devm_gpiochip_fwd_alloc(dev, ngpios);
>         if (!fwd)
>                 return ERR_PTR(-ENOMEM);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

