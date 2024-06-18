Return-Path: <linux-gpio+bounces-7521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7190CA69
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53E3287A1D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCABF14EC45;
	Tue, 18 Jun 2024 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N78y5zEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971814E2C6
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710476; cv=none; b=tFvcsykrM8VxGNdxFvM7to82OxudZIVMQXjcshyRsdef0fVHFOYH7k2rmNLmzep2kWvEmDpQW4FnZOnsqrwEg5sJaKuDGXRo+yn9luiVomJIKqFLUBb8jePfaSJcSZ1S23vaLsdZ8QDyMb0z+nd0AzlxajLf3lcH083kOvb35ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710476; c=relaxed/simple;
	bh=UMkfk1uz4OiFUzUfIWw8xL19AnVl0WWu88Rh0CNSYCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7QtL3GGTWIPNYnHOjouW6BdQm3PHhczyb69fWoImeavgV8n+qcElkLU8fzYWOmM42+QMAe5dKTujPHODWD8biQKPJiy2Zcwpsg4LmeVhAWcCB2R0fwzJqnxE8+D065oTkeeiEVqhS/bUaA4o52ZFn7jEdVJLQo1nVgrpb4+GAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N78y5zEG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso5606161e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718710473; x=1719315273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMkfk1uz4OiFUzUfIWw8xL19AnVl0WWu88Rh0CNSYCo=;
        b=N78y5zEGOvRJHsoLLBFoZ+q8mHQ7IzQHxJD75rVsXiyYWDEkN1TsiKGQFlCLFk575s
         /hCii7YmfXLGkTnuSH56M3Z2lMxPynfUnKNv2VObGz2kLoooL+7KP9TBeMLmBpAsmHxh
         0TtsvdZHNIkOHJ9RAlvIt+xEO2wc06+NE1paEaHSTd3FlaF4IfTWzH1ZbVPNlmqM84Si
         HCdwi9WJlgI0S+GYOcY3651Vmq3Fru5bANNN8PLTbCBY7JWlkkEjtVEM8JeF+2e8/Xmo
         BkKaliOhD+hP5eOya5xpSM6IpNSAcKqe9O0csqVrhFPCSonCVsXC5hOo1iffYNmbul0D
         Yu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718710473; x=1719315273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMkfk1uz4OiFUzUfIWw8xL19AnVl0WWu88Rh0CNSYCo=;
        b=DR+QY95tCEYP74AjfAItbYeoV8LrcGU8ObUSNCj8YV+fz32dWdrgs2CNbHnAZeNbJT
         CFHkiRCADSu9V9pp8FxGkFgm+Nz7soo4v+U9m5+FOzFHVWKwTEPmKGneZdQxHSNZFOCZ
         mDysoCpi9eQFc/RMWI8WAZhcTNsgyxGcscHx2/lLFkWV9rCeY6IqBj9QmIeNGYGvZY0a
         K+R2BkIi9AKOXtSxvztLNz3rafTEfoUnDanTJpxsrZNOrXMLlvxQpk8UD8Nr5GBp3os5
         5u6gXVJ7Wl7Yz6Ug0uVXbUXohTuNrcKWR/7aPnDDZUrjVskpzT/t66hBOIWxGElP5ZT5
         EyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAisIiySLD6VN5kEGNfEHRDL9hs9kRfi5RJfYX2VbJGCoaGcEC5/mCZzHqttnw8Sdxtif/LvJhLtfl1qIaoApzZPkIjmqsBNuXA==
X-Gm-Message-State: AOJu0YxO1OJGqyFyxHgPhVnJmQR2q5rVfPP4JP3M7p4JuW6vqqGRj8ij
	0BjCERwD/IJ/sRi+PCKCMoJuoXFormk09IXfiSP4HBfYwzi3g7HzKD3N2xVFVCrfxBXVS3vm7bU
	kOcTqalIoOmZ0/y4qnSbwqvscukM4SBXe0CWNGA==
X-Google-Smtp-Source: AGHT+IGyZn9ZxYOyqgLilSVSiYsQNPXHOBNuta8dqNri+uFDpDVvXJ/3px/0KeevQMRS1XyUFGcx9t0XkY+UWQx74Ag=
X-Received: by 2002:a05:6512:ad0:b0:52c:8210:13bc with SMTP id
 2adb3069b0e04-52ca6e98fe1mr9251684e87.64.1718710473025; Tue, 18 Jun 2024
 04:34:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618111824.15593-1-brgl@bgdev.pl> <CACRpkdYWqsV+2a_L-dzyvGiV4WYAdS2B7WvOkKMyZh6tGT39Mw@mail.gmail.com>
In-Reply-To: <CACRpkdYWqsV+2a_L-dzyvGiV4WYAdS2B7WvOkKMyZh6tGT39Mw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Jun 2024 13:34:21 +0200
Message-ID: <CAMRc=MepWmLu5zW8G+T93H6Eunb81cJh+ng1SZN_aYK64yYP_Q@mail.gmail.com>
Subject: Re: [PATCH RFT] pinctrl: da9062: replace gpiochip_get_desc() with gpio_device_get_desc()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 1:27=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Jun 18, 2024 at 1:18=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to finally confine the unsafe gpiochip_get_desc() to
> > drivers/gpio/, let's convert this driver to using the safer alternative
> > that takes the gpio_device as argument.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess you will apply this to the GPIO tree, else tell me what to do!
>
> Yours,
> Linus Walleij

I can, yes. Thank you.

I'll give it some time to possibly get a Tested-by from Dialog.

Bart

