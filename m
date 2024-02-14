Return-Path: <linux-gpio+bounces-3261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9485445D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC7E1F2A6AD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1B679C0;
	Wed, 14 Feb 2024 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jt8gIeDm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49B79CC
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900830; cv=none; b=E2VfA752eQ0sJ7GNk60ESvGjYcwh+EZG2mp2LqFS+En4xcTPsrqbjTXqSUxOkf/jiGf4JgFehsGxUJBtEVXscH5d3fQEZ7TNbkeM/hpqkK+nXNtoWt3bsPl00xBpgMhVFabqpH7zm/eTgMsr1gOAG8vsZxOIX9xkt8oZ4qIXGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900830; c=relaxed/simple;
	bh=X8CsfzWueKkHdTvTHBd2BlTOp/nwt3+3GRUySDVla9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heQCGzNwVDdxyIyTXS587mqiM/dvufh0J8YxkrwjJiROLK24tzceJUZx63zZPvbZN2ApjxVHExc8uGvfJOqO2/tQ9UsQOfhrnR4cd8V2SlAg5lO0Eyn3yBpwnCxe8h6CwQ+f0s8HLM7DT8rUQEpMdt5m8TunR0h5g+ML5tMV1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jt8gIeDm; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-46d7a67d751so419426137.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900828; x=1708505628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgf40JCwRQMzzYa5dyZHF7DouzYE6SnWyCi1Kz8dskU=;
        b=Jt8gIeDmkr7yEp4+SCOysC2xjSlMnVSsad1aMA1XoqV3S/LH3ji/JDZp5FT4/f4RNb
         horeBwvoBRa/lV49j9g5IYG1j7L7ZfpKGBBJ6wYBZQoOMowHdoBUP1GsQNhBgXB8d7Db
         ytzdiBHXex+CDp0ioQvW20XSWsUZK87RnX5WwgcKeO8MdOjxzX4Qy1TtIvxujEqeSuAP
         XLtj3ERlDH0+kPydX82xsL5gg5wDawCkATLE6eZWAvpe4ddItB96v+IZnbNeoLznF/4Y
         S07eLmtyU6oglWDSPHtb99Do/sHxIaH86fuMk1fBN4G88f1jMaZlgS2HK6+vGgv2N2VE
         xAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900828; x=1708505628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgf40JCwRQMzzYa5dyZHF7DouzYE6SnWyCi1Kz8dskU=;
        b=mBC5YSRUjX5ZsXTsanEbaUZC1GwLqo7z4NJCnhAQHidyKuGfCxNkJQ5ncynaX8kLng
         SV1OBCqFMpArVzHTf+5GjC/FIbWuBJKPVYulYvMICzxtCGk/QtdeCofUu9FAvOID8rVd
         NX9KiIr22WgeJ+sJUNx/biu4wwjvzMB8Rsze6JhUroNGcbGjHIQxbfK0SqdirmKTQrlO
         ye0B7YSOir1XAQgSYOvsMYoUn2pRdzP5dYW7GYQpsQlgE2EuzrLRUgGCnNryABIdK77A
         iYHBL1dEhftMQoCvU0oRYF78wwiCFlxJux6PQNb4tpY38nt/QcqklhRwnwBhjDknwWDf
         FRfw==
X-Forwarded-Encrypted: i=1; AJvYcCWS/HXv1p5La3xLx2CWOOtcppQg94Q3QNzpAV6Ts6pZatavcEXeYn7JVKLwD2V0gyK8Dh3+7/Qe2GtGSIzgEMUpyBmWMagGRMpHyg==
X-Gm-Message-State: AOJu0Yx0gXYKRpiBp5E6DeuzG8IYRrMH1bxx6CrCZtvQUCRua5QXESjW
	QBagrY6NFK9znuBTPQi5NFrRkkwB8KpqyqzZdNUnAtjYskx3cFQ0NYt7ReNFxK72fiUh+CYvA3m
	PtgTqbnZrvTzQc5xY4S2PaeQVDhww4WY85CKAuQ==
X-Google-Smtp-Source: AGHT+IHZvDvW1NVZWjPDZqlA1MmtQH3ZL8eid1tbNyjlhG5wghbOoxUNlc7oOdSnck4T3ANUSj1xX6cESNUjdj1Qqjw=
X-Received: by 2002:a67:ee5b:0:b0:46e:ce23:ce19 with SMTP id
 g27-20020a67ee5b000000b0046ece23ce19mr2090124vsp.30.1707900828365; Wed, 14
 Feb 2024 00:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <15671341-0b29-40e0-b487-0a4cdc414d8e@moroto.mountain>
In-Reply-To: <15671341-0b29-40e0-b487-0a4cdc414d8e@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 09:53:37 +0100
Message-ID: <CAMRc=Me3EZLNhOVrTn-x85LpEcZfuGWszZTsz3cCzEjiQC0W9w@mail.gmail.com>
Subject: Re: [bug report] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 8:36=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Bartosz Golaszewski,
>
> The patch d83cee3d2bb1: "gpio: protect the pointer to gpio_chip in
> gpio_device with SRCU" from Jan 23, 2024 (linux-next), leads to the
> following Smatch static checker warning:
>
>         drivers/gpio/gpiolib-sysfs.c:808 gpiochip_sysfs_unregister()
>         error: we previously assumed 'chip' could be null (see line 804)
>
> drivers/gpio/gpiolib-sysfs.c
>     786 void gpiochip_sysfs_unregister(struct gpio_device *gdev)
>     787 {
>     788         struct gpio_desc *desc;
>     789         struct gpio_chip *chip;
>     790
>     791         scoped_guard(mutex, &sysfs_lock) {
>     792                 if (!gdev->mockdev)
>     793                         return;
>     794
>     795                 device_unregister(gdev->mockdev);
>     796
>     797                 /* prevent further gpiod exports */
>     798                 gdev->mockdev =3D NULL;
>     799         }
>     800
>     801         guard(srcu)(&gdev->srcu);
>     802
>     803         chip =3D rcu_dereference(gdev->chip);
>     804         if (chip)
>                     ^^^^
> Is this test reversed?
>
>     805                 return;
>     806
>     807         /* unregister gpiod class devices owned by sysfs */
> --> 808         for_each_gpio_desc_with_flag(chip, desc, FLAG_SYSFS) {
>                                              ^^^^
> NULL dereference
>
>     809                 gpiod_unexport(desc);
>     810                 gpiod_free(desc);
>     811         }
>     812 }
>
> regards,
> dan carpenter
>

Thanks for the report Dan, I sent out a fix.

Bart

