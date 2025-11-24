Return-Path: <linux-gpio+bounces-29023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC1C80841
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 13:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08F73342948
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3433016F3;
	Mon, 24 Nov 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVDGUa1A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2E301016
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988015; cv=none; b=As9hi5Gg3Uv+F5X/LC5lWTygyP+MI4M+vLeEpDB6GHUN8tLQAsFtsHNPbAA1i2J2s8BCqtqyyyOJDHQafumoMg4J/UMXKTbGysNdG4qQcCJlcrNfA5GYZC4liXJK6SM4Z/DF1pTg2EKXxkS8Y5DHcwi4kDLjavDyBEbOz7PJn+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988015; c=relaxed/simple;
	bh=P9pQFWroBf3VcvilWO+UgY4N8iqkS9qhO7xxhoJWsvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9Et1SmW2ND+9unLHQviAZdPMq/QTvG/OlyD4lPf+UY4B0OChmKGCzE0Czs0/uwooBVq56YbNsGT8BlcscmhkMscz89jX9j9c9Vq/Zw4nM7Oz4TMv/kkgfAa0QRQBioAP3T5+7RxeJpKYMjvlhyQwmqRTaD7pUyh6RxIySS7Uw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVDGUa1A; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-640d790d444so3562364d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763988012; x=1764592812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVT+P2Q2FNbO4yzzfNdRhD+z/9sACB9TSBL1VHafyeM=;
        b=KVDGUa1A90VIK7UEpWKM76d7A/pPTr69XK3tL2LQVXhF6hwZFbElVvo4aG63Yr+Tvx
         E6BOeClRg00W/A1m3+RTl2BgOFdVhHFmMdFNbbBF4yGLA9lePXThhGY6M+uKBLqhqxcL
         A3A8w+rkbdLyGUdBzA6QzZS/hifV1r6hdrWRVdVINDbV+oL5YBf+TqM9I7T9xhdeK2zL
         7iwuqbzcN2jd2Fp/Fk9068zBunQAGvzoNmNl8rKNgYWONsotW1TzvbfPbgskAxNBRZFm
         xuwQ65SHlEgqQGAtd3ZIOBk76dCJBXmWEgwHYpi+nfxoUFeJrc1Ysx/JfveP0I8+Hw2t
         wPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988012; x=1764592812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVT+P2Q2FNbO4yzzfNdRhD+z/9sACB9TSBL1VHafyeM=;
        b=qGEeAkRo1hiZe78Q6Hrj7ErxK7m0UtQdJ1JDGMohSCBDkxWhGJaSd0OhlcsV8Uq3/2
         UCqotzbqkPOXsoSGyQdwZMg2xG1AvRP/yFG9qYDgsxVBk+YfJ1KD5RnWytTKt/vhP6ZX
         fMJ09KiHE1Hn+K1D4Q+uJMswJgOmYQIcbhXPE3213x6nLw0rb4T4Q7I1JNBttJJNQUhu
         jfDPnYQeexKAtrTAxKk0SextR16yblDUf52dP08xIBDIX6s1q31071ju4bLuT8ZqNavR
         FnRuHVXREswf7KODzt1SvRb6qtDTI5rBpKv1mQY1RECB6TUp43r6XbjNtuuvXmA5EKsW
         7CaA==
X-Forwarded-Encrypted: i=1; AJvYcCXKUes38/DLq0PXdrod8ppq1/Avw7uVAfIpwhX4Gu8f0XgVFyPq8vNxa0qWOySxghTurzio2SZk/iKU@vger.kernel.org
X-Gm-Message-State: AOJu0YwLoVQQHvwTYBvzV2YWnnqq7D4ehlzI41g60Xwho5ylIgCtQrRJ
	5X0YpdiacXQYkmVl/km9v4S+I4hD+Da+ifgcYK9eMjzw8mWAROwJTNLDlJhH/iJkaPhdI+7ppbJ
	dDehtat+gj/wqnAk6U7jC4z/mFUA3ayE=
X-Gm-Gg: ASbGnct0DZKb247PLcl59qrOXdNZjUCIAJCpbTuqv69xGBJZOpPJ4VXjZRPXWhyW642
	WQA0q2N9Oe99wKMzHkVh4jPypbZg3c3n/krbkEY8/0fvWD5nBe+kUPpt7I2ne/e33ZJ+XZVGLej
	WXKqZwPwgM5VdlkjnT3l8s37oNatCVyZAWpz3ANlKTagpH8t0Q1d6UzhuHV4VouRXHkIbbtBkq4
	LGG4odWkrYoPs4XEBJAinpYjLj/HiLs2mrXahYgtohwaeIIuh6elDMu1OQ1irLPTxKjsQ==
X-Google-Smtp-Source: AGHT+IE1Llqkx1CcVPt39GnPt1w3RJWhFY7IsrU1F2MFCRvzmfovoyNjDStaDNVwB1QPHBPj5tW2Qo84aqI3y8Nh/Kc=
X-Received: by 2002:a53:c0d0:0:b0:63f:7d36:ac28 with SMTP id
 956f58d0204a3-64302acba70mr5672331d50.59.1763988012200; Mon, 24 Nov 2025
 04:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
In-Reply-To: <20251124002105.25429-3-jszhang@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 13:40:01 +0100
X-Gm-Features: AWmQ_blA870SHKIPqlSbPujYnm4wsQ6WId53r5BZ0bZ7_9yU2yeH8bEzT4EwQes
Message-ID: <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Doug Berger <opendmb@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-brcmstb.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index f40c9472588b..af9287ff5dc4 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -533,7 +533,6 @@ static void brcmstb_gpio_shutdown(struct platform_dev=
ice *pdev)
>         brcmstb_gpio_quiesce(&pdev->dev, false);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>                                       struct brcmstb_gpio_bank *bank)
>  {
> @@ -572,14 +571,9 @@ static int brcmstb_gpio_resume(struct device *dev)
>         return 0;
>  }
>
> -#else
> -#define brcmstb_gpio_suspend   NULL
> -#define brcmstb_gpio_resume    NULL
> -#endif /* CONFIG_PM_SLEEP */
> -
>  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> -       .resume_noirq =3D brcmstb_gpio_resume,
> +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
>  };
>
>  static int brcmstb_gpio_probe(struct platform_device *pdev)
> @@ -755,7 +749,7 @@ static struct platform_driver brcmstb_gpio_driver =3D=
 {
>         .driver =3D {
>                 .name =3D "brcmstb-gpio",
>                 .of_match_table =3D brcmstb_gpio_of_match,
> -               .pm =3D &brcmstb_gpio_pm_ops,
> +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),

won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
!CONFIG_PM_SLEEP?

You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
(which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
all other *_DEV_PM_OPS() macros do).

Best regards,
Jonas

