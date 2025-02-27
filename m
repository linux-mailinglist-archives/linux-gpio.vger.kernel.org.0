Return-Path: <linux-gpio+bounces-16731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0BA48C09
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11FDA16D528
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 22:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93EA23E335;
	Thu, 27 Feb 2025 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmPQhNmf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F31AA1E4
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740696806; cv=none; b=ukREOCfNB4QhhcmPOTvgwXXgt+agXyGVC/zonV+iR7+1G4KgqzY4Fulm7aXZTXL+oQ9mWi4om/fWeEHv/6eY+gguR7Btxk6OQKCJ5Dw5Eu6pxR0SL8JvPc6OJ4tsEGTN8PF97dTP81G5lYrUtWU56YmGmZ54YJEMXk+wx8bGCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740696806; c=relaxed/simple;
	bh=sGvdnue/B5GYlmaUtedTZkS3J2gnunXBcoKQK+BG5Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGgtaGvoKjJ4GgexWwy3YLeI8aSbYFrNMUH8oI/XmVHq4t49uq//SXjmjWw+IXy1Bpk9TxTBKld0NMhCTHagXC7hmweJdGEgmjRKJuXQBLivusiTMbKhaJvGa/SOWId+PDKJ9vqaUPTF546kjttOEmyi5G2uq/W1G+UJGez9NCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmPQhNmf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so1517213e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740696803; x=1741301603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYAfR6rT+J2Pmezoedxv/QKmEL6vhTnAGCGwcyVDn58=;
        b=QmPQhNmfL8rp1P+SsJQ31uOC9I0E1xF4FAHT/u4+BneXewIjwpCGKgMWfm6MUGl6dL
         PnTFPecK2+A2RSvqLMRJA8RjyyNHvWKN+RiwrX2iziOQFLDhBLQHhxnBfavV3Bs/jyPa
         J1b1NUguH4GIvHd0EF7wY3BonhF37V2CVAVJohpw3nARrF9AMGQcsBrhZIVDrXSt7dL8
         keQVZ1ENwE7OyMjGEhYERKekNdQVcZR85PHNXOFbKY7NfoZdIUP4Xl9b4ehfHHkprx3w
         3ED/qXY6qpvZ+/ZgJuMWwWq996sw9pD1gfnEMz5QBfgHRgLGRWjdrwXxghKtT4LTo+PP
         lRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740696803; x=1741301603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYAfR6rT+J2Pmezoedxv/QKmEL6vhTnAGCGwcyVDn58=;
        b=PjLCnyMtOE3LXjkMPuRl2mpqxIhDaTXx++PusRyjiJ0pssc08c7G9JhDB8qtJaFXZ5
         dWEb7ncOnTs/wuRVUDVukaNp2XjP0CCSFTCj6sXKSfam+ovxKWrRy9IVFvnLtFv0cUec
         VoSp4Am1s6pu4Gi4d3QiSl3V/Se+NeQWIM0hMPR+UNn7Pi7MXC7sAHFqYL+WW3htfJIp
         XzFgIc8W3FC2Wdk9cY5F2GZWgBtcobFWa25m9yBqE9aAqh0ToX2cBojsIFrF/r94ZIkw
         pc5GLEdAoQz3jVDkt3NAeuISLL3XRlriKITx1znrP67KwzzbIw6bx+pOrltLRLl3XesH
         hZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXBQwOTLClTLOxD8IFo7+2++8xPrEBrmLmAY/1bHQVLxb++eDlPA+sVOuo8fxjWqe7mSFzHPWq6OrNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwyefGjP7tm7OJL6iEqUGs/bAc+tS1L+ka9hoJexsSUdGyIyIRM
	fY0dsoNybclcc7tznbhRWS2sMzX9DBP/4ed5OoB8D40J7lBcpp9/5u7zrPT/0pUrQXUNnKNTMpv
	O7B4RrdGEJ60f1p2lfEGOHcvFdvRYjHRQYU0wcg==
X-Gm-Gg: ASbGncvJPe2wMALdCJhYpkU2xfUcyNgYO/d6r4mra3BpKxdD/t+2ren3vkk1ig1mmxk
	H2AzGLQODbzpshwBm3QOsqnI95nxJND5PjJL5IVVo5r+qlzQgP6CxSAWW3769PP+7rVvkV/F3Lo
	n5xHhrFtQ=
X-Google-Smtp-Source: AGHT+IEtwiHtj9LHUcW0e/otkeY6xFx8rK1S/vfrLBTeffolkmIjfF0YZc4BMa7wskN4DXcOEuc/fyfJLasqmpJiYAc=
X-Received: by 2002:ac2:4c4f:0:b0:545:2770:79b2 with SMTP id
 2adb3069b0e04-5494c351b83mr499150e87.33.1740696802619; Thu, 27 Feb 2025
 14:53:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl> <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
 <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
In-Reply-To: <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 23:53:10 +0100
X-Gm-Features: AQ5f1Jp6iZursAYFoyZhYUa8R_xOEcekX9mX715XkkcwLe7KRWmfwikYltCeIOs
Message-ID: <CACRpkdbkcX5pEeikkDZAxSGp+M3kJH5SWimxQA6P35iiDAUNdA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Brown <broonie@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 3:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Feb 19, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> >
> > On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Since commit 9d846b1aebbe ("gpiolib: check the return value of
> > > gpio_chip::get_direction()") we check the return value of the
> > > get_direction() callback as per its API contract. This driver returns
> > > -EINVAL if the pin in question is set to one of the alternative
> > > (non-GPIO) functions. This isn't really an error that should be
> > > communicated to GPIOLIB so default to returning the "safe" value of
> > > INPUT in this case. The GPIO subsystem does not have the notion of
> > > "unknown" direction.
> >
> > I see this was already tested for these specific boards.  I've also
> > found that Avenger96 is failing with bisect pointing to the same commit
> > this is fixing:
> >
> >     https://lava.sirena.org.uk/scheduler/job/1126314
> >
> > as is the Libretech Potato:
> >
> >     https://lava.sirena.org.uk/scheduler/job/1126285
> >
> > neither of which produce any output before dying, they'll not be fixed
> > by this change.  Seems like an audit of the drivers might be in order?
>
> Right. I don't know if they return EINVAL or some other error so let
> me prepare a change that will not bail-out but simply warn on
> get_direction() errors in gpiochip_add_data() instead.
>
> This patch can still go upstream IMO.

I'm fine to apply it, maybe as non-urgent fix at this point? (for -next)

Do you want to send a non-RFC/RFT version or should I just apply it?

Yours,
Linus Walleij

