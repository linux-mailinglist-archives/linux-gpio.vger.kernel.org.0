Return-Path: <linux-gpio+bounces-4163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD08730E9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 09:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925B528784C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 08:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4F85D912;
	Wed,  6 Mar 2024 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ein3nH0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D715D910
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709714332; cv=none; b=fFGLYhKnXBe0MnYt8VutkxvUn/mKL9u9txgOGw3fLAo+Mrh4CKhURUn1NQr+IFXUBpOjtrFF07fsLoXkj6IwPb62cV/SVWgLx8p2cEzo8E7RXtnucHo1SwL+Ukd4PwpuA7Ir6LhZ6k4cJOU64qq8ITSbaIpg7MhS3yzbYTmycYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709714332; c=relaxed/simple;
	bh=JKfQSevmPOCRb92592Z8SBypvKHpL6XdbrHsgolSWJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcYmCLZp4/x77UevV1wnBw5ePliqGKhrL0WS84WZAooht85ORI6a9tl+U3jpPvsrpPicgrBDmIbYklOvUHv9+/0cmHMWAAltfws29q2NVU1DLjHDNpjwYkZ2A+gJpGWv0qCl1Q6+U2cfrj05NHHeUf0MT70Jp9mWKK1XuEhClI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ein3nH0Z; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso1704428276.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 00:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709714330; x=1710319130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKfQSevmPOCRb92592Z8SBypvKHpL6XdbrHsgolSWJc=;
        b=Ein3nH0ZJxX5Uz/MBcEmFmeoux4fsqJ9RcYIS2G5zMzTIMa9sGwOvrH+4XDo4rpVDp
         Uv9lww6nphJi4t2JwZbSZR3RHFTv/lGAZwjcj7yKxZxUkDOcHAPEiT0LcVz08O2d0ZHB
         6CBkc9TuBVnCt4Kc6QK/jtv1bQOCubBp36kSGE01xwPa7lYfc39FjV8uvodV3ImyxD+g
         vNeQAFDF8LVTR2QfcThNW2pGAEdBfZFXcm9gONwskc79jWlN7uQeJ4xKZWiLBn31leE3
         8d5ps9PA98Rlj8RLEJkIPFGdGzgsA9bU8ELPSxOGmJOsxOpwiOexEW1yBCKo9RBsZFuX
         PCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709714330; x=1710319130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKfQSevmPOCRb92592Z8SBypvKHpL6XdbrHsgolSWJc=;
        b=PI9WTyen17LJ5g+bpL7+fMWQjs/P1s+TfWJjSGfHM+Bcl9GSBejoQVztlM/TsvYx/4
         WrOs8FqxkJIo+qvn2zNrU6Xwzj5INt5k8xGRInEGtFmbaeVjtBAfKSS5+XVe0cLKAhl2
         gZOB/QXErzpicLhGo4+I7gapM8jaJc8JwUjoIF+cv2A9aNv3v0LFUP87oFHyiQU+svmG
         ueqW2m305y2Z6Vadzh7aWuO3gKndZieQLVbPBAmnuG+Jd6rULUHnvy5HjpTYf+42l2AP
         b+J6h9Ol5nO/xsbFz2aFsISemCVwTStXsSIX481A48r3NwfH38a0m08Hakis1oIgBYRS
         D96g==
X-Forwarded-Encrypted: i=1; AJvYcCXaJpRuQ951FCROKNZMC1d8S/VhbQtkI6AmQVx5IvJzFtUnWRQ9qZ57cP+EHsZ2kVAdbrAWsuHqbX9wjJBcP97CnNRdv85jtc0NYA==
X-Gm-Message-State: AOJu0Yx1UcZG4OZNKsmUK86Z9WGcCeXQIMkvi4u53yrTrQdFMSIv0GYX
	YjfJHg0eCQHsMFZIeeXSVjQT73Czs7NEzB5ureED5kkbUa8QSHEU12dZTw5MFapCNL6l/opOphU
	yajlIn/I4vl/uHxW/cFIVZ6mHPt7L3wv4pNtG/w==
X-Google-Smtp-Source: AGHT+IEYHmvP9yXV29D7DquFpqXISz0VM0lwIjWOku1/Pxa9ZGiag1E1capZdHkon0gZtLboEXtbjNNd2egyOoBDqlg=
X-Received: by 2002:a5b:810:0:b0:dc7:4692:c29 with SMTP id x16-20020a5b0810000000b00dc746920c29mr12032108ybp.33.1709714330114;
 Wed, 06 Mar 2024 00:38:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com> <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
In-Reply-To: <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 09:38:39 +0100
Message-ID: <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: wens@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
> On Wed, Mar 6, 2024 at 6:38=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> > On Sun, Mar 3, 2024 at 3:19=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > > Hi Linus,
> > (...)
> > > I'd like to take this opportunity to ask about INPUT_ENABLE and
> > > OUTPUT_ENABLE.
> > >
> > > AFAICT from existing comments in include/linux/pinctrl/pinconf-generi=
c.h ,
> > > these two options refer to input and output buffers or connections wi=
thin
> > > the general electric path, i.e. it allows the signal to pass through =
in
> > > a certain direction. It does not refer to the current selected direct=
ion
> > > of the GPIO function, which is covered by the PIN_CONFIG_OUTPUT optio=
n,
> > > and by gpiolib, if and only if the pin has been allocated for gpiolib
> > > use. But it seems multiple existing drivers do this.
> > >
> > > What's the correct thing to do here?
> >
> > It's really up to the driver author: the text in pinconf-generic.h does=
 its best
> > to describe the intended semantics, but sometimes hardware will not ful=
ly
> > match what is said in the documentation.
> >
> > I guess in this case the PIN_CONFIG_OUTPUT_ENABLE and
> > PIN_CONFIG_OUTPUT is not two distinctly different things for this
> > hardware so a reasonable semantic is to implement both in the same
> > case and do the same for both of them.
>
> But that doesn't really match the intended semantics. Maybe the driver
> should just ignore PIN_CONFIG_OUTPUT / PIN_CONFIG_INPUT if the hardware
> doesn't have matching toggles?
>
> On MediaTek hardware, they have input enable controls, but not for output
> enable. So mapping directly to GPIO direction doesn't quite make sense.

I think you should look what will work in practice, given the state
definitions in the device tree file and the runtime requirements from
GPIO.

If these things add up and work in practice it's fine.

Rough consensus and running code.

Yours,
Linus Walleij

