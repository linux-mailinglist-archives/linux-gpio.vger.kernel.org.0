Return-Path: <linux-gpio+bounces-16786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8FA4947A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64B687A1932
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63AF254B0A;
	Fri, 28 Feb 2025 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCm52MDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E4253B57
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733931; cv=none; b=D7/rPsk04phMcRtVh8A/BzsURqxX/Sjy8+SfTZ/3C7G8IIRY+WtbkaPlE3XBZPAhRcB/+rxIYLA0oEBs7Jv141frSSqIX4xyu7K9HIPtJkc/ER2YsvzqcUjDXVB4ewjZjC/hxZpGq/JhvMuwolgFNM3Y/nd7z9DUw6v/LHq1ixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733931; c=relaxed/simple;
	bh=Lwg8wE5Xiedb892k4N/ekZfZJuMIFhCBkPXW1WUwn90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgDT939/gDdjmO+s2+gIWfHMMHnJtpoo+mk/Rb+IQ8a6mLTkZ6nrEw8La0DmwTrX2V0ETPXUh+6UJxnpThmUuQeLjcnQjBw7lnmrm4W/T3GGfafupz3KPRuM/z6/jTqy9+vmworTPlNnGBJRij8xik1CWDH7F7th+1Bo/fmLGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCm52MDY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1910068e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740733928; x=1741338728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=jCm52MDY3lRencpysUFEtOIzJzW06DiSRahUySDzAU3MInL7SCWmiRZpwKFafcEbYM
         K+PMEzn/BbcgHEXXUUdjfafXq5aV4LA6urKm64vncB2bD9es8Sxs3nH7R0Mbm3Gm2gUF
         J4Xh1FOq5iyh3ddM1/XgwWw71MZfzvGrAtyTs+nMAyFaK/bThWPSiSR9fGigdRG0vLOQ
         PFmBsM+inoB8NxyKwWEH5jBTW8zzSRkKXmdM3y4SMWGPHFl0ONtFCZF6Rr84PIBm6xBK
         iCb/NmRgttNfncI1AOXNuIVNhX0Xsz7OIkx7znlwRk5s0f04BUjWhxmy6Z6EDPCSm2xd
         0QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733928; x=1741338728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8NBOP2GQ2KlGT1kMn03prIoC3D0wUg1PxgjvTKjfnk=;
        b=EHlmEUqvB2AJ7sRf+4Q4mobJ6IpghfX+LkwtjZG0zQWKHY/Dm+0vgbGvjvSfwQK6+P
         geSL5T3qi4pKRJ9AlSaoQgdd8BBaXDLvK/WH0XUnS9YBD5xe7MqMjlonHqWiSutns728
         cnp5dZdASn1TutaMq+rX8gbkKIykaJkczRKuA+u0wQOmYru8btNnzndeNU07CbmEI5aM
         BZ7HxjGKxevGraC1dUbm4VYQ/kNzQFlalOe6TiILMKG26m2Hb2HEZtn2xVjDXzL20xxt
         XYGFAnTk07ABf/u2DHlELORAKKpANkixbh95NyozNVRTvHcHycfFTiv6RiiBEEP4L2T9
         tn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHCUlMzbTSSWdgaYYW6lRH4UYvj6HggObDWIjY9z6VF9xEtEv2Oas0D8F/16bJrWULBGCUtEa38yng@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOiOwFi+ShVv0vpea6eF5UkRALRFnEwufCrUaKuzKLwxHwayD
	aN6FrK3PvYo1iaBffI58oVICnHzK986f2JJxbQDPsVXHLtPtJmFnwAmoAiAu/V0SN3xJDp7Q+hL
	iysvd8YlL3gqphpv9zfZAQCgZppJhiEj/xMxtdw==
X-Gm-Gg: ASbGnctqaK7FtmHEPhFfPpMGR9LUKXs0OTHie7qzSJcBBfThLQmZz2ORFIgHvrMEfIn
	b74cJOFJrHzyTY2sCMA6AKLAV/RMteS1RyfIrK0n6fdle0rf2TG+hsTZZkn5nn/un3scy+W7xJx
	FsXpkRumk=
X-Google-Smtp-Source: AGHT+IFtHDQUwtIkZEmn26SAZGpaLbJ0ZA70JYYMxkjqCpaxYAkU8WvU0gBdbKbqlduqxgwjid1hfQ77kVQK8Hlzc1Q=
X-Received: by 2002:a05:6512:108a:b0:545:2b20:5b21 with SMTP id
 2adb3069b0e04-5494c36869dmr947565e87.50.1740733927813; Fri, 28 Feb 2025
 01:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org> <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 10:11:56 +0100
X-Gm-Features: AQ5f1JrL-KjS4W2cfXdgdW4fA0i_u-8CysEWcjvk-omutRUMfq6vTHu0adnO6VY
Message-ID: <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

thanks for working so hard on this!

I'm really happy to see the threecell support integrated into gpiolib.

On Thu, Feb 27, 2025 at 12:25=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> The select() function will be called with !DOMAIN_BUS_ANY,
> kernel/irq/irqdomain.c:556: if (h->ops->select && bus_token !=3D DOMAIN_B=
US_ANY)
>
> so vendor gpio driver need to explicitly set bus_token, something like:
>
> drivers/gpio/gpio-spacemit-k1.c
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> I hope this is a feasible way..

Yes this looks fair, I think you can put the description into the
commit message.

>         /* We support standard DT translation */
> -       if (is_of_node(fwspec->fwnode) && fwspec->param_count =3D=3D 2) {
> +       if (is_of_node(fwspec->fwnode) && fwspec->param_count <=3D 3)
>                 return irq_domain_translate_twocell(d, fwspec, hwirq, typ=
e);
> -       }

This looks good.

> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *=
fwspec,
> +                       enum irq_domain_bus_token bus_token)
> +{
> +       struct fwnode_handle *fwnode =3D fwspec->fwnode;
> +       struct gpio_chip *gc =3D d->host_data;
> +       unsigned int index =3D fwspec->param[0];
> +
> +       if ((gc->of_gpio_n_cells =3D=3D 3) && gc->of_node_instance_match)
> +               return gc->of_node_instance_match(gc, index);

We need to hide the OF-specific things into gpiolib-of.c|h so systems
not using OF does not need to see it.

Something like:

if (fwspec->param_count =3D=3D 3) {
     if (is_of_node(fwnode))
         return of_gpiochip_instance_match(gc, index);
    /* Add other threeparam handlers here */
}

Then add of_gpiochip_instance_match() into gpiolib-of.h as a
static inline (no need to an entire extern function...)

static inline bool of_gpiochip_instance_match(struct gpio_chip *gc, int ind=
ex)
{
    if ((gc->of_gpio_n_cells =3D=3D 3) && gc->of_node_instance_match)
              return gc->of_node_instance_match(gc, index);
}

And also an empty stub for !CONFIG_OF_GPIO so we get this compiled
out if OF is not configured in.

Yours,
Linus Walleij

