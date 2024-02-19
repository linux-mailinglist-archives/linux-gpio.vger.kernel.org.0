Return-Path: <linux-gpio+bounces-3438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777385A513
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 14:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C463F283665
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38C4364AE;
	Mon, 19 Feb 2024 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jo8A4ADU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FD1EB36
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708350431; cv=none; b=jQLpvhlXXkAsRLu6XpxM43sWz2JRq3/X4qBevnMFclOZLJya/YpNj2ldQQOd6gzdjsXglUQjNge/yvuC1EdqVHwMqm/06r7gINaBni54KmCz+pJOOLnY0d9XTgC/AZu3mLPEvoYPsqD2l1rTmPpIIaCVzPzCCiLBEz/Pf0nlEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708350431; c=relaxed/simple;
	bh=xVULmkH+MvmGuLK6cHjXhoxBvhQTE6V+Cq5yQZH6Zec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfuI0jfsI5XZ1O/CEa2T5HwLiN9C73DodyapwI3WSZCFzt3q4YqHVQEYlon4fwPEKA5KAymrQRhqZL2TdHUXA3SWhCdMg244Vgt4FET5JhuTjzGmCi8M/l5gQ00MC4PvovC1X10TEkDNen0qBDgFBgnnmCbmpz0IqDtkequGq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jo8A4ADU; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4729054276.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708350429; x=1708955229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaP9PK7n/mX7mG7UuH28xuqrJj2zBGV+LtBPvpfW1yw=;
        b=Jo8A4ADUpXJafSlxFXDAUsqSwTJYftjwV589GQu60N4L3IkYTmd/aQuE+61vNBWhYK
         PNvOsqwrXDjz/46j1cnoo7bH4StVkXCIxtjcstygQ7iZ533m9IakXJXNepo6HnIosmMm
         JjQnyCsOwfGhSp90FeGLJJdI44HRu46tz3eqoDmTt68w5rfeTl90iDIN+elF2q7j0vqD
         6LMMZe5Xih1xpoeQbLrn5HWe9dILTUlICSPauBF/rvPGXDamOpcJT4trd+Br1dEJ5jRQ
         fIBKwYxyrnCxzHVONGDc04Hce+n1FrVL+9GkwD0Fdxvhol+abnC6PEdnTvPGMIwLicmP
         5KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708350429; x=1708955229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaP9PK7n/mX7mG7UuH28xuqrJj2zBGV+LtBPvpfW1yw=;
        b=hxWE3bO1QGEvijXCOxBU8QPXWkXvLQyCYRqU9u2+3TkqZbRAHv3E0wkMa01Wp1wYHH
         9jZwMhCI+ybcwhA2/iy/czuTzwJgJ27NvpHefl9byvJDvbkPF5Hu+ZD2jgKVXPNA+Sep
         xKQoZu8SMPnf35lnbnRpxRro++jtcVaSYEwoBeZc8BmpmiCHfytgIM7apcXz0FxQA6sj
         hfeyXKLj+kuOTVsi9uwTWS7ka5zTJfG3AWAZHJN+9XPjY2CNkjXqA4Q93mlnR4t1iSu1
         ib+mH86GWJlukLj3IFSzR1eICTaDLPF4MlrggJEzK2p/9BPVJjnlAE1sgyLO0iZGVCnc
         61uA==
X-Forwarded-Encrypted: i=1; AJvYcCVjuzZYrT9tBDbelEXlSVggahfRQxeSIwiTuu7JNO0Q1Bs81qSZLdUNOQXHOJ5SgKyywWmN4vxjokeCXIvUoahuxMjaWV5Pt6kxNw==
X-Gm-Message-State: AOJu0Yyi5y0SEjQ21KiyufOaa1uH8yFHwIEf+q+QzYjOsX7A4DdaCJVR
	5HKg2DLgs9tbUT9PsSTy7psk4oWzTMdiGr0N312eDB21WRSFXcU5QyHq3XYbWXYesHCIQRZ64+k
	brkvX8EtLFS2CAAY0lEqA60q569nSYWPyYLVWFQ==
X-Google-Smtp-Source: AGHT+IGFkA+JVZ1SqL6APIWMHJF1AvLD9iQNHaoGcRhOb+a/WJrMoDKbp9N/E7uTsOENDZxaYigmC6uwWBhCHX74uEg=
X-Received: by 2002:a25:a064:0:b0:dcc:a446:553 with SMTP id
 x91-20020a25a064000000b00dcca4460553mr10159671ybh.57.1708350429007; Mon, 19
 Feb 2024 05:47:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZdC_g3U4l0CJIWzh@xhacker> <CAJM55Z-t9e8L2_iFfdbCDpOzi7UxQao6-L6VU_W9OGBciJ46bA@mail.gmail.com>
In-Reply-To: <CAJM55Z-t9e8L2_iFfdbCDpOzi7UxQao6-L6VU_W9OGBciJ46bA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 14:46:57 +0100
Message-ID: <CACRpkdbkfWByoo+i57rr3w7QCyCgbiTbP6e_kT3ZNkiSeYUEoQ@mail.gmail.com>
Subject: Re: commit f34fd6ee1be8 breaks current dwapb gpio DT users
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 6:44=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2042,6 +2042,11 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
>  int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
>                             unsigned long config)
>  {
> +#ifdef CONFIG_PINCTRL

Please do this:

if (IS_ENABLED(CONFIG_PINCTRL) && list_empty(&gc->gpiodev->pin_ranges))
...

The ifdef is so ugly.

> +       if (list_empty(&gc->gpiodev->pin_ranges))
> +               return -ENOTSUPP;
> +#endif

That looks like a reasonable fix, I try to wrap my head around if it
would affect
any users but can't figure it out, we have to test.

Can you please send it as a proper patch? With the above fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

