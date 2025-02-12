Return-Path: <linux-gpio+bounces-15862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E44A32846
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC673A5E22
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24753210184;
	Wed, 12 Feb 2025 14:20:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05420F08F;
	Wed, 12 Feb 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370023; cv=none; b=IOdQsMAYJVOkGSuEvmjeOgbfu5V0Px/Xh1cWVQRsiHpnB3YVmYq7Jfxqe6ZlXxAItigyI2Xkp5pWegdSXYyzNRiN9gmzICZH9JWLTPLL94BCf4/N2pmT//BOO+k+REXo0JA0nyQduiTyxzp7M7gvJ9/iz7eRjJbcz3Op2PqHWfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370023; c=relaxed/simple;
	bh=KAdde7/YbmPjymod1BEVt4mvuRgqXMe35ab+tSR9ydA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUS+NpRFrJXBGDuPZmy+L+keKP0jwUCQKAMwCqPpd7RoZ5SlvGv3cute7ko5WB4gI358hl5G1S0c/TMgp4geg2rUJ0Iv765uW1WFSUqR3nx3cvzwfcSgf5ZJ9WTBKdM/xPU7xK4PDou/9ZwuMcE7NzIW3q7fwQjhLo+0b8ypBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4baf654570fso1028958137.2;
        Wed, 12 Feb 2025 06:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370019; x=1739974819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkMBG44/sW86YW+XfhRRb2qU3DXjedl8dAdo6+7avXo=;
        b=R2l2jXk9B8RzoRJDX8SZOBRznt0upWoCh0sVkm0I2XUuAy+JRhrEIF4BJF0o76h2Hz
         84BBk7TM8B6bfwIYFRqIK8ktJkLU6M7KG2sWBz6afhlhrlxDihNTEiJf1eGjOmBgulRQ
         dAVNTVaJX8wwRdFyd7CsVkfHcvU7oXCo4P/z3JMauNHKAZX28+/g8ugjV7X2/YLXfJU2
         J8t9ApxQlXWmg7Xr+/JEDPcTNzsrbABfAbN4N4UQ6dBft8KAmkl5gyfWnQI7cseyI+n0
         qcHr9aNe/nP1dlQd7KB0O/Q3ZYggI5iG5j2XbC8HSev+YdNZAurd8hb9spAC9+R6xO8N
         4Mkw==
X-Forwarded-Encrypted: i=1; AJvYcCUpGWXzxQK7pl1bEc/TPXbQdykorI4TzvGI5Ze0dlSynq2sZNhJBzXKQYi7BqUDRW3xuubSbGPLMqp5IHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcexFThhxVF+VwiqDY3jKv37OCMj0VQYfvIAx/lmimu4L8Lfz
	M+urKN6OiUlF3Ecw/qIJwkHpedQOwYAkF9N7+34sPC+hmhqZH6mrOGfXXGvd7C8=
X-Gm-Gg: ASbGncsxnNNraARdq6Ay7eYkxqGnJsi1h8jSQwNbxaoWBSubZ6rZ6qoyRIgi49r0X3+
	z00v7jShtMr2oedtncbWOsaKjIpuuYgFAv80ck91Y6l/yaJo8UtsznbqyevwMj9NagzaOsUAgrR
	8BqgBWJ8aXvMg7UEyuYEHsj5nI8J7/zoOriG1kTAlD4xIXK0puDQUNP2PzxbKZbFFsrCPZkcNr2
	Uu/Rju8vhLsFiBWiGV1C2oHjL+O0OXES2Xdj0YLlRHHnaUbfgcDGKRcGUzb+0pdH49nZEejcH0q
	V6HAb2E9E28L0NOIw1cakj36m0z1n6xy4k06rzRUoqmklPthn+3K3N9E1w==
X-Google-Smtp-Source: AGHT+IGgRLQ5KcH12oKOgro87sjmi0jezj5BZ4rnkkVx7v4d/vXA+akiNfZEtKPv9vF5SSGnNBKnnA==
X-Received: by 2002:a05:6102:1607:b0:4bb:c8e5:aa8b with SMTP id ada2fe7eead31-4bbf22e95f9mr3311962137.22.1739370019080;
        Wed, 12 Feb 2025 06:20:19 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9688cb9sm2092618241.15.2025.02.12.06.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:20:18 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5203d50ade0so703241e0c.0;
        Wed, 12 Feb 2025 06:20:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbTLZyYuMfks7XflJGwOiGWM1FwRHH8VDSG2Q8rYyVV3lyF9L2/LFI4nJnVvNGWK7EPCC8z9F2nHoYg4I=@vger.kernel.org
X-Received: by 2002:a05:6122:2187:b0:520:652b:cdf9 with SMTP id
 71dfb90a1353d-52067ba9daemr2796956e0c.5.1739370018607; Wed, 12 Feb 2025
 06:20:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-4-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-4-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 15:20:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUrHbizyKoLs-DJL43QvmE+Y=vCuGc+1yteYXYQOmURg@mail.gmail.com>
X-Gm-Features: AWEUYZmGqrEJ5R0Usjj2HJIMGPEzwVxXNwCpFPwFCcvHbnWb_hjEj6CTQBdm-Y8
Message-ID: <CAMuHMdWUrHbizyKoLs-DJL43QvmE+Y=vCuGc+1yteYXYQOmURg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> Add a read-only 'dev_name' attribute to configfs interface, which
> exposes the platform bus device name. Users can easily identify which
> gpiochip<N> has been created as follows:
>
> $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
>   gpio-aggregator.0
> $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
>   gpiochip3
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_attrs[] = {
>         NULL
>  };
>
> +static ssize_t
> +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> +{
> +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> +       struct platform_device *pdev;
> +
> +       guard(mutex)(&aggr->lock);
> +
> +       pdev = aggr->pdev;
> +       if (pdev)
> +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> +
> +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);

sysfs_emit(), for both branches.

> +}
> +

Please drop this blank line (everywhere).

> +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> +
>  static ssize_t
>  gpio_aggr_device_live_show(struct config_item *item, char *page)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

