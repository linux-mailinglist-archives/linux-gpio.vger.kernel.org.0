Return-Path: <linux-gpio+bounces-3476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCE85B478
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 09:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3764B282020
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242F45C5EB;
	Tue, 20 Feb 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD7hcwNW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C9C5C057
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708416436; cv=none; b=ODyp3f2cGpcroeuVk+HfF4T8D3qU08rvqYYnxqbbnx5u5nL0JHllLLek0NYc5f7NaZ9cVGCO+OWmGrigYbMt/Ssgwpbu+EivRj072Iv56bvTW7QJN5h7NGhojWJbSm2uyjizVSvmvKCh6o0Rs4MAoQy9ebYusMe/7N9EqtkPb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708416436; c=relaxed/simple;
	bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J58kOzlBuBASW8al4JSDW9lg9uqBp0gf6RYWoJyrlUe/VZaxMQyfwQXhaKWVy6StZMk6X8rybmqERlr5tJz+13jFgXQJLCKHHnBkDZ0FsovANGMa9KcAJHm6IiZp4jwCrx+hr3vgBksJCJRyTfaUHJP3gdDyfxCJz18MquNdxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD7hcwNW; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5263592276.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 00:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708416434; x=1709021234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
        b=dD7hcwNWXJ2cGycOPtjBPwQuJ/2M5NhcvRJYvnPy5wBdtAGbHtreN47OB6JuDI0U6I
         a/+fh/jDenLkJb3GEU+KC+NM7LFDroyYh1eLUNkMPS9wVXmT8O6J65aIbXdMHc8EvZBI
         F7ZQZjtyqPg9fD+H/iwKCb19PH1kPRLCKQo00uG76bK6VUB44Pfd6+NJdwjnAWm/6nGP
         zh6rT20V4kU0w+O4n0ZAS4tuDqePlGizHCSjMLsiipqffNp70it/teKeBS2XhjYeJeJL
         684O+g9p93uA2ld79sfdgCt7g2Ej/DI55jpbbgefV1XApgztbz3C5V377jkhQc4oQAu5
         7qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708416434; x=1709021234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awT0zTo78ApZAKonWlAU5EVPZWIHDSpLrfEEEfQsDEk=;
        b=oIdGfQnk/xM/B1dtTbxwboC5TQrHqp97JZVGZ58aeLvVCfzum8sWPNQ4Fg6n0TptGW
         lxDHHCeZ9aRaStRCrW9xGuSkbQ6tZIopQ7pp35gXU9RmcQpJyApsfylmqpcJ4/eUMGKs
         APNcVMHAe5xbzUtChtj84ekc7yZVzDfL0GVetpQVFBCdQ9yVx5u7fS79MnPo5P8gfRAX
         o98d5NoqCGcxhmHTgarqcgT3MD7KBqR0CZIBl2QCa7FmHxIkWs62NdoJxBBFLbwO8Wu3
         yUqmI/4No5xCkCpxtECI/1AqvsUsxBIPi8L8xDyiVIgTeNrT7OVfKVkTSz9bVsk605cS
         Ks3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPjremNK3eMxSgiem1tcMwGKHjZAELgdcxhNmd4Cyx3/dRS+dg0ykAL0r1/JLncy4x62+xEiix2fdWQY+AfUK/R/3ShptRF2gPuA==
X-Gm-Message-State: AOJu0YyOkjxdTLv0ZF5uExBqDUJ8ts1ITFvPBBQoAPl0R1HoGOdLpDrm
	96FaEUHYWVi7NiZtPPZvbgbzakneViUn0+oCjRDRyNzbcs4DyAHvpA8Gf83zY1bjumdgnRXyw0x
	9d8SF+loqjQCUyHyxDfewGpxJ4Nl/wlqD8emqzA==
X-Google-Smtp-Source: AGHT+IGHpSsMIuEotxmsPqtQrf1oD0WZ/UCXgvkP+pOGh/bZIF0X9vZSLoc/4KAh0bvAGCVpcXQldb9yUsn24UnzWZQ=
X-Received: by 2002:a25:bc4d:0:b0:dc6:de93:7929 with SMTP id
 d13-20020a25bc4d000000b00dc6de937929mr11460135ybk.26.1708416433908; Tue, 20
 Feb 2024 00:07:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-16-f88c0ccf372b@bootlin.com> <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Feb 2024 09:07:02 +0100
Message-ID: <CACRpkdZ5qJY6qQRaq=4y3yf1_ppNMDo5EfDPV_fuCHMe+C+tnQ@mail.gmail.com>
Subject: Re: [PATCH 16/23] gpio: nomadik: support shared GPIO IRQs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 4:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> >
> > Support a single IRQs used by multiple GPIO banks. Change the IRQ
> > handler type from a chained handler (as used by gpiolib
> > for ->parent_handler) to a threaded IRQ.
> >
> > Use a fake raw spinlock to ensure generic_handle_irq() is called in a
> > no-irq context. See Documentation/driver-api/gpio/driver.rst, "CHAINED
> > CASCADED GPIO IRQCHIPS" for additional information.
> >
>
> Any reason for not using preempt_disable()?

I think this needs to be discussed with tglx if Grygorii is not available.

Yours,
Linus Walleij

