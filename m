Return-Path: <linux-gpio+bounces-7367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553390426B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 19:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A6F61C2200C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 17:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA22B4D8B6;
	Tue, 11 Jun 2024 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Subdedby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE394D8AB
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718126960; cv=none; b=o+7BYE8VSmORoGrZfbXkI+Q+ihZ3xO+a1LpkqgvaoQhmwRJgAlaJBrsTvmka5ST1anB/FL9f8P95GOqtrKSm772Fpu5YGxkR3V09TjuKJ1FWdC4GcZ3+JldqgIZ4WFMgBAAfK8Jk14mUQnMjAoKwivGtz3WjQ8CT58Z52dRVbGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718126960; c=relaxed/simple;
	bh=mlKSzDjUlVXZb2qrfhwVJV1rEUb2UFfuAgKP0vi5GeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIqvmdmwEx/sKYqCR+jYfw4WbJZ9eXlTO75ZmsnMg8Vav1md5c7MDovuAmQDrobj0LMLO+IvzXwZgz7xuhqr8LrLRVQeQsQZKkF9lLM9Q5piQ+rW4q2SBYoLCL6Yo7PnZz4iU1iEBKsP0kGya843b+I1URMm64PWrQwXtnVNhGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Subdedby; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a63359aaacaso182389366b.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718126957; x=1718731757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sF1UXz384TjcC0Vt26UHIKpVMAUank2ve/GSZIL34A=;
        b=SubdedbyB/C6ORk8qCPVH8m1CvpHnWJfhUfnxQZNwgq/recGxdTa5Y/CNHcLFWqP5r
         Bvtcl1mWwSpRS6uQLkSYvZmS7YhF1WQFFGTL/yVBdSl/DsTfe0W1xJOZ6L0InA1hBg+r
         QB96f1qo59SpdCDlNQBYZ8suO8jnG+3MUm2xt1rYF0xvPBAIu9Eu83V27potSA8ShT2c
         xnceA8ND+C5A66EA4SSY4c6LG03Hc8BwKfATUvQZh9nycCkdAmOV8lxLQuBAIQfMthXZ
         Oz5sp2TUo8ksIvpm9VxNkVwvUfNpgRgIgNhAGVWosgBbsg6UZiIpugR7L791ZWziP9UP
         vvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718126957; x=1718731757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sF1UXz384TjcC0Vt26UHIKpVMAUank2ve/GSZIL34A=;
        b=Qvby46lfDjnIWSJwhKiYu4izS7JcZJSzUqSN4QZ/cVSe/jk4nw0uVh5OuogSSAgNyy
         yqHv9zMBVALtzkkJGJcooHYXRhvKPRvunAZE4/AmMB59PcKm7Xwq5hfMHAl+JvUapl7r
         RILlQxHREiDKFDdvy33BvNCtweM4TAXcOZpcWELVoenf4awuxhW9DMcgwjVuf/vxPmRx
         1ebNLDY/i4E+kjSrV97kYUIH9EIcnA9CTe23+eVnDKpcrQibetqoBHlnfk1MKHU58ent
         djc9QGfH9MwZJP2bK7ilpxu1FjSVLtxz7ikXBSOlPmbCriWEModYwhIzzbGdXcV/J+uG
         GxHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmeN6lwhJGlAkvkgITTT2Z1HoZhoCwp5cA+66tzZZUPjiHltB3BEdrYTFPjcvEI8lqDT3uLZ60RjhXQvr112a0ZH9uu3jM9+F4mw==
X-Gm-Message-State: AOJu0Yzf+G9zH2cYRu7N4nz0FGKmjmtjRbbrnXyFCHShGbSSw0U1Rg8M
	f+Bl87jrKhL3w7xgq+TtoEHTwOUp1fdZtGb9x7V5sDdZAIVFHpYzWas55qlQhy7P5pOLV4GXPGr
	dmsw9HdXkXAKEHmK5Nq3M2TAs8NM=
X-Google-Smtp-Source: AGHT+IFsouzqjOJlCv9SX1losgI5ndqW7iizLBoZV4m8w2C7RKFavibYgKJHCS0mB1xN5TVFn3VmqmRDMaN1h/2W1C4=
X-Received: by 2002:a17:906:2a44:b0:a6f:1ff4:c7d2 with SMTP id
 a640c23a62f3a-a6f1ff4c8c1mr383847766b.20.1718126957020; Tue, 11 Jun 2024
 10:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611171509.22151-1-asmaa@nvidia.com>
In-Reply-To: <20240611171509.22151-1-asmaa@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2024 20:28:40 +0300
Message-ID: <CAHp75Vfb-0QM+HYX57SXJyS3ZoinqqxwiaXCc4kZs-T6GoUnRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, 
	linux-gpio@vger.kernel.org, David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 8:15=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> During Linux graceful reboot, the GPIO interrupts are not disabled.
> Since the drivers are not removed during graceful reboot,
> the logic to call mlxbf3_gpio_irq_disable() is not triggered.
> Interrupts that remain enabled can cause issues on subsequent boots.
>
> For example, the mlxbf-gige driver contains PHY logic to bring up the lin=
k.
> If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
> will use a GPIO interrupt to bring up the link.
> Otherwise, it will use polling.
> The next time Linux boots and loads the drivers in this order, we encount=
er the issue:
> - mlxbf-gige loads first and uses polling while the GPIO10
>   interrupt is still enabled from the previous boot. So if
>   the interrupt triggers, there is nothing to clear it.
> - gpio-mlxbf3 loads.
> - i2c-mlxbf loads. The interrupt doesn't trigger for I2C
>   because it is shared with the GPIO interrupt line which
>   was not cleared.
>
> The solution is to add a shutdown function to the GPIO driver to clear an=
d disable
> all interrupts. Also clear the interrupt after disabling it in mlxbf3_gpi=
o_irq_disable().

LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

