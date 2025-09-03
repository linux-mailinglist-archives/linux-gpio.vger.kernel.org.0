Return-Path: <linux-gpio+bounces-25429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33FB4156E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EEF61B265C6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7858C2D97A5;
	Wed,  3 Sep 2025 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fdzZTuYk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDC2D9492
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882047; cv=none; b=CDEEb3hIy7gWQRjQi4rMPpoGaQfQOO+C+RpgNUG/eJ7bWhQgpJljjRADWhrLRYZqPjhzy8THp8yDKFIW8X+Lwv6+9VguCE9OtGHeDYlDXmCB+OC7+lIjCKMiOvd3uvb20oiZq27MFsm/SI1qiOMfJa3W3tdXRqpw/rjQp8/MOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882047; c=relaxed/simple;
	bh=JPf9MBwFsXDqpcdtjQzlVagg9Dgm72GKmuu+o+i6Jps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzjJSa0wqb3W7IQJXmzibV6j9a4UZHVc8bqdpXxD7xSEyC6IiJhMOEAg+NwoCPxGqPyLp2mNnmAiRG6PjuP7aai/ESVD2M8DZ3otlDA6e6mrJGqBEAfQ+Na46zMaN4DVBKTzqSG2Zh4HnxCxB8HQ6VO+oWFWcDM4WHq+VloBUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fdzZTuYk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so2737075e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756882043; x=1757486843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPf9MBwFsXDqpcdtjQzlVagg9Dgm72GKmuu+o+i6Jps=;
        b=fdzZTuYkF29QgBigJfqqWon5n83S460gZRV2f4jgqqMtXu/gzDeqg+NYLgPQ0RV38P
         Sk/Jako15oRICnUN33bJMaU1upbbGzl3acZCpyGWq1NP56J4hY38LB9F9wkMgJuv5bR5
         OOFIq3ZOdI3Hb4toCnPk9ls5Jt5jswt2WXIrFoRtz3i/ZvkQp0aKas+BS5k50Vc8XLvh
         MhUvkvcLieCyIPaaZvTUu9zsK0eaJxlocxMgEqvisIEgL1DfJXauJAislBcZbusE5JcC
         sGBwcDp/0bfqxQjB4ucerRbjw+pJJvi5YnVOqGjmbTfM4u0RQV33fizl8MW0mIYGRT+W
         surg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882043; x=1757486843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPf9MBwFsXDqpcdtjQzlVagg9Dgm72GKmuu+o+i6Jps=;
        b=fIiER/7YIh2e4EnLWIDc7CZGN6/imw4duGb1VMo8kr1l4Rre4LYzEIduvxSpD2J8JQ
         e3AK/rwrKO9AUhlk48Enrs6tqNWKSixwdmEmK8E6W7wNT13cT/fH4a7ZZM40VbkdLk3G
         O3HyKcyq9j61Y3xdip+oTZC9NSrpS7GFMxMZjwGdY4pSsOjykCOSKCj/ErA2qhr3KvsZ
         RctRhKjKpu93XXpTvhDwJ8GRWkBiA/7ikMVpsLzxbT21LbjzejUCjLjd9HmDyHOr/7zX
         sNNN/pnk57Y2QQK4UTw8YX4lp/2U+UvlRDreJ1oe/Is5EEfCgcH7s5Lrlq7gy/Kel96k
         AfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnYW5PzQ0X8Etz4c66UHK5rzGFMwsXCrmL9O8tkxUaCvcPI20W3+FbhUyhMuy6EPATO6i5HMxQTIZu@vger.kernel.org
X-Gm-Message-State: AOJu0YyHusBJNUNW1WkkWFwKnlnW88M+7cYW3d1rMP9tB6DWKLoZELZ5
	UCeFbks/Bj41cI+gMWSo/7JpuAufK1USWl0xUClREHGQfX/ljzPdX3z/OoOk12bjhi1SvFOenb0
	jb4XllZWaeXv4bA6ISmkL9UI6Wek/cj/EkGEEY9K9zA==
X-Gm-Gg: ASbGncveDotvXqbQPK7Q0P78acW+Q0OhOiS+KfBHttWFB2lxsUyYm2Kk4pC1SvgF040
	Hg/dChAKnCi2FEOz3SyjutjOYA0enQznXoAMfODHjKbfxF/9vNhxlkhh6SJ9Rt8Pw3nlTgVJINl
	zuEODl0VDhuStW+O2yakB4hPjY8dZq0Vxu/LJ4ZHpii/cJHkR53UtorE9FggSJfpPURY9T8hjny
	Lg5JSzzme/f6IGWKg==
X-Google-Smtp-Source: AGHT+IG4YC4WaIVhdE/SO0C9kkujplv36YQBR7QppVwWs93lEzjQRfRa2semDZGhdaQs2p7GqIs9i0ivFJhWbHX0Rek=
X-Received: by 2002:a05:6512:2508:b0:55f:4b53:6fc3 with SMTP id
 2adb3069b0e04-55f708b1a85mr4516238e87.16.1756882043464; Tue, 02 Sep 2025
 23:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756813980.git.mazziesaccount@gmail.com>
 <08929460fe11dd0b749c50a72a634423f13f4104.1756813980.git.mazziesaccount@gmail.com>
 <CACRpkdbOhm4PawYZUxU1SMi8WGr-LxhR1jhSVPDvPh3TTp8SWQ@mail.gmail.com> <ffef0fa6-45e4-467b-b264-1df15754d213@gmail.com>
In-Reply-To: <ffef0fa6-45e4-467b-b264-1df15754d213@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 08:47:11 +0200
X-Gm-Features: Ac12FXz2kUTuIK7Qu_UhO-ePUCmnG1GuzLVWHurE-uLTn1uN0blwAJJV5wrS6c4
Message-ID: <CACRpkdbPzq6yKMHJXaFmXZSsttUkt5OAKRTSc_pjLwZZiZr7Gw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Tobias Sperling <tobias.sperling@softing.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Esteban Blanc <eblanc@baylibre.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Hans de Goede <hansg@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 7:23=E2=80=AFAM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:

> Anyways, fast-forward to this day, I don't see it handling valid_mask. I
> think it is a must for this device/driver, where pins can be either
> GPIOs or ADC inputs.

Why not just add a .init_valid_mask() to
struct gpio_regmap_config so it can just pass that
down to its gpio_chip?

OK I don't want to load you with too much extra work for
the driver, but it seems such a small thing for a blocker,
and Michael who wrote the library is really helpful
with extending the code, so consider it!

Yours,
Linus Walleij

