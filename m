Return-Path: <linux-gpio+bounces-27040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF09BD32F4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4A23B42C6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401336124;
	Mon, 13 Oct 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlWNxiPs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8325487C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361754; cv=none; b=WlJNTlUc/ylpPh2rbX80Btyrvt2iqTFPSzMsrQUQmlmV0j2Jc5cH3I5A0hkmhaGSCNM6ycM5+3euVCPHqdl7yxfZ3rWYHNkzwX/qi+TR1DQLTIwIHaXQfFqI76OTkhLyhTIjBeJF4xJ7FKMfUoOJWm1fHCzlEbTR2zdcKrQ6YQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361754; c=relaxed/simple;
	bh=sdzCugawJR5yomrCcleyfBYzimfdjcRqs5/JBcSkuHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCjci82cCApb4+obGZa6Z17gVXYEdxBVx63aOaIKlTMai+B7y7IFP9FlBlBdaowqOC5tI8oHFUgoeaVXTFakrlItmgeL9K6V9VQaoDe9u7n/nWZ8GoVDUeMMasgsOivHWXdb9yhc6lht0KM/CS1K9HqTVUX0j/VEtxsNujs1uGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlWNxiPs; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37634d352dfso29137741fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361751; x=1760966551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdzCugawJR5yomrCcleyfBYzimfdjcRqs5/JBcSkuHA=;
        b=MlWNxiPsjoo0T5LCyUP28n37DcOLAOTwWD+DpAzc/pTf5m45ZZ3AZ+Buo+GB8bIglc
         Lgp1k2WnYYKkQg0OUYXBeLtf0rlQnQa/c6kqICN0/Mg+62isn5k1eH0C5V42RNo8uU/2
         O89YIu9wvAAKaDjCQQJNow//HTUopI7KCxkDecV+++eQlWZBjgH9mvfFON/bs/djnRjw
         m5qJzRJDkcrlOw83nb1kBM7KZe8soPgcJAyJPooExhtnXEdJ4beRh3tnwrLrx2ffZ6Kd
         04fvOXjhohsZtsSaXsVNpdE5zD3blxtpUIzgN1pkPK3g9JvciggUbR3G/n/FjrgHEjXl
         0LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361751; x=1760966551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdzCugawJR5yomrCcleyfBYzimfdjcRqs5/JBcSkuHA=;
        b=muraZJRe4Z6MT0+ulcwgkOW2I5YSK3oTWx96TD6YQjx7uu+lKMMfDby1W7sqSJgHKE
         A1Ybh9x0XQfLaUFnjPJThersRK6yYVmWJvEtuN+zY2b81Ebi6odQAHDR1hVa7PGlE2Pp
         LWN+oVenrS82ex+B3/FcTd61X8VqN7HN30lo4vnnN7QZOR5A5QKmYh02KKwi0oZ+CXwF
         0Qw9IM162U9RTopcKFBk2x1Hx4I28zDVSJ6SswJEoIi2kl57u6mvGYWsgcgNCksuzPeL
         zrUK4TxxRhp6uGeoXKJpx5m6GrYX116sYFnSk+ZQfFM/YbTFm1ihnrRd0AJwy0Xq39tX
         y6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvqTBorRvDfwZMtQZN/ubSR11Rq0TLj7CpGPnFDuyCv3V2GsVG10cpnOAfYwm6+PCFNrUP/wN2XTOz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxot25g3cN0FifXgjXi7UChp9a8SNzHuKyVzwDPSi+RfQlT0VjF
	2hC4+lFta2ixqJmu9m6GMOHvwYcT2vN0dj8trO37y0ZNtxWsK1lFdFcFObkQCAugUoQS0Rtn8qE
	DTgOOr00LoXb/6NCsJ0l9PTsUi5TBOCMJVtj0PI3aLg==
X-Gm-Gg: ASbGnctYYnhBJ6l+V/GjKkW+J4KyB2kUqRlkkhupUEmHBDhboX8LzKnkC5y5qQ7EWNL
	u+lpdda8dpnCc3VTas30ifeKhIWw6PYvxZR71WnUqkUJyEQrJ4XYWZGMFxvedIUNxedC6ud5n15
	7jeTp0XpnmVta9dAhL4InE/fMIYdFOv2yQ73f/F3o5QTvbi35XaxExX6mYV2RfRpTCBANJBQPVY
	kZ8bH7bA/csSw8t/tRyTqxdVyPYm7KzbhbrNzZJ
X-Google-Smtp-Source: AGHT+IFD3AIgRgN4jBUJbpK34gX4OpQi2/Ld3YOLcJ6oyzzxV171xkOqcylCUzBUtIlA/UWCtsK+8RrigJBOPn6Q18s=
X-Received: by 2002:a05:651c:990:b0:371:fb14:39bb with SMTP id
 38308e7fff4ca-37609d72cc1mr56226121fa.16.1760361750851; Mon, 13 Oct 2025
 06:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009132651.649099-2-bigunclemax@gmail.com>
In-Reply-To: <20251009132651.649099-2-bigunclemax@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:22:19 +0200
X-Gm-Features: AS18NWBjzabyAo7Iwc_ab_T7t7lGvRr7MIu3O5SMdfRGHuDa0E6rCvILh5I1Oh4
Message-ID: <CACRpkdb4HDhN6G9JSe093jeBe4__jCFz_+r1grUbHwEr4Gt1hQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to avoid
 cache sync issues
To: bigunclemax@gmail.com, Dmitry Mastykin <mastichi@gmail.com>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas <arturas.moskvinas@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andreas Kaessens <akaessens@gmail.com>, 
	Zou Wei <zou_wei@huawei.com>, Radim Pavlik <radim.pavlik@tbs-biometrics.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maksim,

thanks for your patch!

On Thu, Oct 9, 2025 at 3:29=E2=80=AFPM <bigunclemax@gmail.com> wrote:
>
> From: Maksim Kiselev <bigunclemax@gmail.com>
>
> The probe function does not guarantee that chip registers are in their
> default state. Thus using reg_defaults for regmap is incorrect.
>
> For example, the chip may have already been configured by the bootloader
> before the Linux driver loads, or the mcp might not have a reset at all
> and not reset a state between reboots.
>
> In such cases, using reg_defaults leads to the cache values diverging
> from the actual registers values in the chip.
>
> Previous attempts to fix consequences of this issue were made in
> 'commit 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at
> probe")', but this is insufficient. The OLAT register reset is also
> required. And there's still potential for new issues arising due to cache
> desynchronization of other registers.
>
> Therefore, remove reg_defaults entirely to eliminate the root cause
> of these problems.
>
> Also remove the force reset all pins to input at probe as it is no longer
> required.
>
> Link: https://lore.kernel.org/all/20251006074934.27180-1-bigunclemax@gmai=
l.com/
> Suggested-by: Mike Looijmans <mike.looijmans@topic.nl>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

I would surely like to see some Tested-by on this patch because
this driver has *many* users.

I added some people to the To: line who recently made changes to this
driver, maybe they can test.

Yours,
Linus Walleij

