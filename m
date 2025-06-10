Return-Path: <linux-gpio+bounces-21259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9777AD3D91
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE293A874C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FE3239E63;
	Tue, 10 Jun 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="emkml6A4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8D23A993
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569590; cv=none; b=VXZRnIxPuBqRw0wASqtduvzfCxO+VwIZ/3NwsA0eac03021Jl3gUQyu0Vh3o9zlmIVoKj7gG9p7X6trewWqokJE4lczNGEnTzy4AYr/jbogq5f0t4oBaaTVMSTRp+PiLQeY5m0f5B+zAw12O4HE9TUyKl9U9LSbAIJcUDtPDOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569590; c=relaxed/simple;
	bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9UCTDewYoST9Ejv0U2ZuSdQadZTibbMyUj/RyWtQ0mK2hb+TuwCIQG/Ljl78kWXQGFUwiPmmC6n1oEd7apWb1drs2MHvKDG5B9sJ79OrbuRcJcWkkuXdtLheP0FaiKURsYn4xJLQL1x5UBG8QlfNi2OdSYdxh7eGyK5+8zoZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=emkml6A4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5534edc6493so6046614e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749569587; x=1750174387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
        b=emkml6A4scKtYToH2UfRwmtkomcJA92cboDZo5Wbf2QUBl192QiChEA2OksFv5Uzwh
         lyGzfbgxsJnSljo7itb3IRTHZoFbZFasBcRwuzLeVMb3KCJW4Xs2UU92aTrK7VCV2bE+
         3qvqoINlpbyoSzKxbNbltaoJPpeedmXr6hkwLLc3PeVds3Ne63gx6vvkvIZWROKDQKFJ
         dvhUC6h0l5XMSeD7x5PcBlt3BnfBpr5r6YEzufTmUzpA8MbkYLXYyms96r8nd4nGGe7W
         yMrAXbhlOz3dxV9JKHx//xV7MyHtg5njqzbralDxqbKhKdw4i7TaLEKR1J/IAdISUbo1
         V33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569587; x=1750174387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp6yjjTLV7IPhWsZQeYxGqlOtogpgQvGIcdZj1dlExU=;
        b=WR4r496sG66j+/utA2lHDHQaMwvy4yjl4yCZnEwDBYQGsBgvEK+j0Cx1/qAa8x6Bza
         wPk8bSuaA0+rLLwYpbDFvJCf3FUj+QtVm3BtCgw/K7VgYWOEpYPI6cfwlD+nUkXXS63h
         RPsKUjGU8i9zoD4bOaI8vvNj5k/kecTFie2O4U11ZwSgsQHIZzrGamTlBETYF7WE01ko
         h0maUr/tlg3ntlUCYT9f4MbMyT1sK/rGA35VAxRP41CRxz/1JJt8QjEa4A7bESG98SMY
         rEX8CAv/98JrLt5FOWJcn1kB7ImBdkzQBe0CMlRSJ4PXz6A86A4n5PRshhKnaRIPuIfG
         0RCg==
X-Gm-Message-State: AOJu0YwkTPpE1PgOh0DMUZ+rhG4TIaLrmroXl+sfAKlCDMYO6gcB4EkD
	thvM1toK4FOrwZEJJVLTcET0z2TcKfQyTk2QHezE7Dr6c1VObO1BPOXw1d7V3R0X4pZOrrLw2qb
	3+j4vL4gtQSiFGMttX7ZSaYh3OnkLPs6wHRVCgQlZ7A==
X-Gm-Gg: ASbGncujI0uWsjZZyPb+CTeeqx1pZrHVV5dNNASvWSZb/5GX+mHntnJ2GKmVVYUCgeI
	E6UM0wkxI7X2e3JxXwSi4hEqOV/VNuTLrMNA2XJDsyCNHUKTDVVmjCtqT6Zpk0jVaovpu5ocz1j
	zIh15gwMNTbtrRNUV4uQesyV6RhJKfa+BItuAAjP4N+3mjosgmHWqvjvXNoRgsMvJro2FWaOEJ
X-Google-Smtp-Source: AGHT+IHGiKRnkaIlNk4u6LKClD4MxD98f9NAtcNzrwse7wwO6WLcbYkMf2R+94+P+5WFQq+X5DJHtk2xMP667cpSuUc=
X-Received: by 2002:a05:6512:1320:b0:553:51db:69c3 with SMTP id
 2adb3069b0e04-5539c1f9ebcmr6861e87.48.1749569586725; Tue, 10 Jun 2025
 08:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
 <PH7PR11MB845555F9AA0823B53EFD48BF9A6AA@PH7PR11MB8455.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB845555F9AA0823B53EFD48BF9A6AA@PH7PR11MB8455.namprd11.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 17:32:53 +0200
X-Gm-Features: AX0GCFs4hmh1CGl7MqLsRMX92XhvhaRT6oxbXwW1TT6_s3aNJC4HGWUWBfcKYDk
Message-ID: <CAMRc=MepPni55s9mpCkZ_XrWtT3hOhSTN_QTzpNr_Qzk-YKP7Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: intel: use new GPIO line value setter callbacks
To: "Miao, Jun" <jun.miao@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 5:30=E2=80=AFPM Miao, Jun <jun.miao@intel.com> wrot=
e:
>
>
> Excuse me,
> I have a problem
> echo 631 > /sys/class/gpio/export
> echo rising > /sys/class/gpio/gpio631/edge
> [18090.472396] emmitsburg-pinctrl INTC1071:00: pin 119 cannot be used as =
IRQ
> [18090.472408] genirq: Setting trigger mode 1 for irq 245 failed (intel_g=
pio_irq_type+0x0/0x130)
>
> How to set the gpio631 as IRQ mode ?
>

Is this a regression caused by this series?

Bart

