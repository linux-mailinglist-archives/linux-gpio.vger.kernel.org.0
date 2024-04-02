Return-Path: <linux-gpio+bounces-5013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B95895714
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FFC285223
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457ED1292D1;
	Tue,  2 Apr 2024 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfs30WC1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB912BEB8
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068656; cv=none; b=Kc9NfJj7xAXYOk7+clIIjsef7n/9rrMc1OqeTuG3KBbMEJ2L0sIxs+blFsKAc4yf1WGLb1zGVPthFHdje0EGjWkAsZdfBPfIKn4LY1mI497If/9JsE14bbVGo6Nzx8rT0Tc9A6pGFHnfHN6hJ+y7zXe27B9qefj0lCjqwlc1Jxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068656; c=relaxed/simple;
	bh=Fd/HwzaztITUJxMyj+qfecZwF8tVFkeNovH6sh9rg4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/3vJKYAShbjk7FVrp2ZUz0P9+yUHd7hDkBrb/5NVBQ7cHXrG7HHfdE0mYtPC0Ta52tFR3LCkamOCGqYBbpoiBP89FfJvfDEWBVMWLOsxqtRXlFZ0e4VT9/yigfivHyytbNABUCXvAxe/GpcYcqqqzxcC+FBQa/1f8wSdivSJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfs30WC1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78a746759b4so382324485a.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712068653; x=1712673453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yj505szOiMmI3AOU7YTk/JHlLza6EgQ1B7WbRbTjg30=;
        b=pfs30WC1dMzVm/JgbPXfR3mN+GP6iCqOUiugP3PSLcu4uQZwcUtg41EhCHaaQTpYVH
         uXh/fTM3Ydag3huc4gXZ0rbLS6Fqgg23zMdHw11DkZGiGp1fO9HzI9DWBIcT+g6dF20Y
         WGhsMshyQhoWmLwLMt6fh6ZcvWJhlt2EQz4j1knhU1sBlcsB6RKK1+dSQHEbPXhMuczh
         Oh50zjupfH3Lgn5F9iyq9unLVsM1J3B/JwzTYQpSa2qGTJ3MF/zly5RqJX+jGJVjbaNa
         1K4P2ytWxGY+lxkC1kE6WlnkoV07qxK2Qn+en1P7D0P9frBDKgQe1WMEAhY8lSVF1imy
         tM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068653; x=1712673453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj505szOiMmI3AOU7YTk/JHlLza6EgQ1B7WbRbTjg30=;
        b=bo2g7Un3aCzJfElJMl3U9AxQXQPnE2wNxNN4KchnvYUB5l+AqUrmbrKAJKa1ECqpZW
         xkJ7zvqwTT036qCDuElPMurTrzGI+hoTx49JFJlvlJnwsAcbZqMNp8gUkH5AU3EZKpmJ
         qnO42gw0czewKbNlTTPngUuTdS66EBtykS/qfK7mkFmk3vjEgucboWw/CpJVKM/JbsmP
         vT6cWBTg8tDGkcFjj1ULO2qrxT68MvfUB+bhkjJJEnqMiqcENIFtK2YGYmWztx4aWbFz
         25y3+IdKygM/AzVjksAgf/usDxPa0Dl8CvvedzFZeoAQ3xq817Y7NWjg8mWPGbNhZM7p
         PRTA==
X-Forwarded-Encrypted: i=1; AJvYcCXe9068/xl3D4aifHcT1Z6rdkOz05YJmbmoyVHndExQZDhrYEH84MFcCZ/LrZzOBMnqo31IM6KjGX5unkr3Tc3Ru4mQ1D0RIedeTw==
X-Gm-Message-State: AOJu0YxjYtunHC06x4xWpk1Kx+sV9HRZrvVKpDfEnCZgzLUwAi7WIy5c
	DK0lYE9yp80WYiinEh+oHFHx+S6SHaFloszGxpP5tCXZ3420/IexaaInTHk4G0dRKGNTgsH0+ro
	nwUNBKUeRe3PaQBaxJ1oN2+Q+NDolJQhUfIdZ6A==
X-Google-Smtp-Source: AGHT+IFyEOBYmCLSqQYNdbqQlreYLQqXbs4IG0N6ntPCkLO4z9b5DuFz0gSNB5+cj3PS0S8i6gj1En3J70FKvsWu9Vg=
X-Received: by 2002:a0c:ff4b:0:b0:698:ff7e:7ad6 with SMTP id
 y11-20020a0cff4b000000b00698ff7e7ad6mr8744063qvt.15.1712068652960; Tue, 02
 Apr 2024 07:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402114159.32920-1-brgl@bgdev.pl>
In-Reply-To: <20240402114159.32920-1-brgl@bgdev.pl>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 2 Apr 2024 16:37:21 +0200
Message-ID: <CADYN=9+Cz=MSLq++P6e+VOYo=ndP-nrjY2gj0LhV2Jvba2hMEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: check for NULL labels when sanitizing them
 for irqs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Dobriyan <adobriyan@gmail.com>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:42, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We need to take into account that a line's consumer label may be NULL
> and not try to kstrdup() it in that case but rather pass the NULL
> pointer up the stack to the interrupt request function.
>
> To that end: let make_irq_label() return NULL as a valid return value
> and use ERR_PTR() instead to signal an allocation failure to callers.
>
> Cc: stable@vger.kernel.org
> Fixes: b34490879baa ("gpio: cdev: sanitize the label before requesting the interrupt")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/lkml/20240402093534.212283-1-naresh.kamboju@linaro.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Thank you for the quick fix Bartosz,
I applied this patch ontop of linux-next, tag next-20240402. the
libgpiod testsuite passed.

Cheers,
Anders

> ---
>  drivers/gpio/gpiolib-cdev.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index fa9635610251..1426cc1c4a28 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1085,7 +1085,16 @@ static u32 gpio_v2_line_config_debounce_period(struct gpio_v2_line_config *lc,
>
>  static inline char *make_irq_label(const char *orig)
>  {
> -       return kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
> +       char *new;
> +
> +       if (!orig)
> +               return NULL;
> +
> +       new = kstrdup_and_replace(orig, '/', ':', GFP_KERNEL);
> +       if (!new)
> +               return ERR_PTR(-ENOMEM);
> +
> +       return new;
>  }
>
>  static inline void free_irq_label(const char *label)
> @@ -1158,8 +1167,8 @@ static int edge_detector_setup(struct line *line,
>         irqflags |= IRQF_ONESHOT;
>
>         label = make_irq_label(line->req->label);
> -       if (!label)
> -               return -ENOMEM;
> +       if (IS_ERR(label))
> +               return PTR_ERR(label);
>
>         /* Request a thread to read the events */
>         ret = request_threaded_irq(irq, edge_irq_handler, edge_irq_thread,
> @@ -2217,8 +2226,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>                 goto out_free_le;
>
>         label = make_irq_label(le->label);
> -       if (!label) {
> -               ret = -ENOMEM;
> +       if (IS_ERR(label)) {
> +               ret = PTR_ERR(label);
>                 goto out_free_le;
>         }
>
> --
> 2.40.1
>

