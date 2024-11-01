Return-Path: <linux-gpio+bounces-12460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA59B9188
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA5C1C2149D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC2C19E982;
	Fri,  1 Nov 2024 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PUN8F5dX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CE487A7
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466561; cv=none; b=tq3jJKgn15+GSyIT8yLbA71v5uydVdIgkOUK3QtjgRfMeSf4NLRlNrxRJLAxXOeIDgTZA1E4t/swpAX8ioejcVATjZqPx/D3P71EKrgWy+AsLc3k5DxBCQkpK02sY0W56FyQrQCTAZIGc9tiPWf4NvDj3PYFwVaJA1KZIF8ApHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466561; c=relaxed/simple;
	bh=JkH1tJwdEc3iTa8A1dybv4ITu8qM3LQHlGwiVBCAsYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9f6yLVtaAZrlzCH+0Sevb/G3CmNLi5eMIuabdlX96Z4kCUNMtOqC3NQ0Adq+wdwiuJmqjUGzYSdp3kNjygkQh12UHR9gggOnIfZGNQH9KlMq050CGkx+x++BCSwJU4LqBvO7+7ej5ZtPcV9+JsdJ8SXltZ7b/npd2ksme1RNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PUN8F5dX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f72c913aso3243541e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730466557; x=1731071357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCOb7oWKMyRkovJLo99m17M3Qrl11k0I9CZ4yD4TyfI=;
        b=PUN8F5dXeq6vGx/m+Xd+p4LXSkqbLweJVOuDc1b0LA3lq/HEFpOQ+Fa+U+O+wvFiha
         ldsmdEIAK0rzujI7XAi02TpgBbA+/EeE9NEjUMk6VEZcHAmvGbKadh/kRJXGlsZilNl1
         bQwFh3hX/cHok71hrmN/oH2NN/0CuSdQhzxJOzttUsENgiSNkYLlo9qSjFw34XLgxWkI
         WN+bGuXY9ZRuKbjBIGeV3ecsdMkKjLrT0+IqgKKtyu+8piMkLIMB80lchmhw21uVJRs3
         zqyVsPP9ifbCSGCb29+i+j4oRt+KPMRNA+oBytIZKi1Mt3UxPMPRbp5sY2KAWbKXaVVw
         6c3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730466557; x=1731071357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCOb7oWKMyRkovJLo99m17M3Qrl11k0I9CZ4yD4TyfI=;
        b=hHb37bC6TIQLp2NVEI4Tzapuvvb+TIA9rqGKOXtEahx797NI58uJEldX7QvaKGniBy
         DJBT7uwg+vpuqCBfBHSLDYCMrDXP7M4QCcCfk6j4cA0WXvoJAuN46WZ6GYSJj5IffOZU
         8TPfqR2AhEcW2MQ684ll6SHOLPczIfVpYL7r2bBSu6TE84WZFPUV/TOF1s50+5dlrmeE
         VDiMdEbxE4UUe16IpiqSMB/v7CX0ZpIhTQGsrLr8psgYTxx4q+vJUvjM9aFd97S8dQ42
         Ph0XthTsfJrBTSNVUcILjD+wuqsewv6HGnQ4GCqToyw5kfrvbsocNAcJCx5dr8L6JorS
         /WVw==
X-Gm-Message-State: AOJu0YxB/XE5TncGaemLo3FHn/+Yllg153NOOda0EZcbbCSDdoxf1+9/
	XhrWDDaHJ917z6HXpsQS9E9u5zPzSQF0TR2KV46XP3CvK2u42qU1wFxKRptbb6VK6KQXQptkEOS
	G2BSs3iHsKoB0iG+s5kjVYDSIazmlO0BYrHD8Ra6ZLaLk37TC+pk=
X-Google-Smtp-Source: AGHT+IFQ2Iirxr4YpcoGWp8G923sFlFOEqdGocjjTn4i6iFnhwCBaaTlV28B1UipOmibRFZIJgHccANusz0TY0GXzoI=
X-Received: by 2002:a05:651c:50b:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2fcbdfae574mr123344001fa.14.1730466557316; Fri, 01 Nov 2024
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud> <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com> <20241101-cadmium-speed-78ff7577347a@spud>
In-Reply-To: <20241101-cadmium-speed-78ff7577347a@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 14:09:06 +0100
Message-ID: <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
>
> > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_input;
> > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_output=
;
> > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > +       mpfs_gpio->gc.base =3D -1;
> > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> >
> > The "ngpios" property will be parsed by GPIO core so no need to set it.
>
> Are you sure it'll work here? I tried dropping the ngpios parsing, but I
> get:
> gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to registe=
r, -22
>
> That's coming from the device_property_read_u32(dev, "ngpios", &ngpios);
> in gpiochip_get_ngpios(). Checking against the bluefield driver and the
> code in gpiochip_add_data_with_key(), it's not immediately obvious what
> I am missing.

Does dev have an fwnode correctly assigned? What does dev_fwnode(dev) retur=
n?

Bart

