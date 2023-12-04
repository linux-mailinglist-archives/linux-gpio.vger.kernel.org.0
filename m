Return-Path: <linux-gpio+bounces-969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7380351C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E10301C20B14
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB112511A;
	Mon,  4 Dec 2023 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CGA7vVyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FA3D4D
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 05:38:33 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7c5cb5eeab1so246241241.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701697112; x=1702301912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1UpuRerWKubmFOnOhiP1vLCixCHUqesCX/FHO4e/TE=;
        b=CGA7vVyB5ChqTVVkV1hwVV8KS90GhdrGSkiq5tzDVvr4E5GcXep42sHeQIgOfODVFb
         L/6hmiWHuadgMllTs34OvUwlY5HE3TlENDmYrLiOlDszKkvw99K/7jyaj8adquzBEJM0
         XHRYvO6DSE+C0IG6ZOjsNBftedug/ToQggmA6KwlyIJQrBcEjaeNEOA4OkpSsfSN/rYY
         BtxURbqvW1iURtRv428jq8YT7jduDD0kEWy2+iFk6rx25wVvr5ij8ojh8zb7S0ZVHr8w
         9woJZytrFAbwqbrf+eoO+8Z0pdytfFoXBYPBRQ3Gd95wxAcd/HyH3uUcx7S9p37AyMKl
         A8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697112; x=1702301912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1UpuRerWKubmFOnOhiP1vLCixCHUqesCX/FHO4e/TE=;
        b=AEfszgIzpmDwP5XrEJveoar9Oc0/VRaybMKT8GTnT5gjM0sG2cqk0KgkH34vJv51wV
         vuF0bGRj1NkKZoze/9nMwNGmFX8SotcmqTOCEUYCbxmO9ZdjSuIj2YQBgY4dViEuaBIB
         8uWLmMz+ytKK9XpphDiIu8Yt+uZ+Y0EBaBy1Qaw9muPnUKAH5A2vFTBuNxoNSblmmBsB
         33q6GJAwAGxWeXh3iA5Y1EAH0vqBnMkA0+PdojjLamFf9FihABFBj30iHcBydlLIiH2N
         sBub1oKPxgDZrxiSnU0AM3L9ybSiIK2PJVqV+RArFqq44H2zJ/c2eGMhU+Wewrj/16yn
         0f3w==
X-Gm-Message-State: AOJu0YzhNzrInsJhj+5WtXu54Bv6e4ivUVtDZ/JlgI0Kt0JRDtJEP9pe
	EHajmQD5ZKpgpJt9rckj0zBTisn+8K6J1tc7HjdNKSpznQhTHyfr
X-Google-Smtp-Source: AGHT+IGM8wAGr7fLScqJtGZwmQGvYP9FpBLRz6Bjw+XTscV7du8vlhzmCYEnr9jCZ90nMnozFKOvOn0S4F1U+cCrhsk=
X-Received: by 2002:ac5:cc48:0:b0:4b2:c554:e9b8 with SMTP id
 l8-20020ac5cc48000000b004b2c554e9b8mr2292269vkm.26.1701697112157; Mon, 04 Dec
 2023 05:38:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204093509.19225-1-brgl@bgdev.pl> <20231204093509.19225-3-brgl@bgdev.pl>
 <ZW3RPxjsNPacT9Si@smile.fi.intel.com>
In-Reply-To: <ZW3RPxjsNPacT9Si@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Dec 2023 14:38:21 +0100
Message-ID: <CAMRc=Mf1MOFfN1XwTBt2=9rzB6kZ8+cW9cBR=7TTkMqHrLDh_w@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gpio: wm831x: use gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 04, 2023 at 10:35:01AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the new gpiochip_dup_line_label() helper to safely retrieve the
> > descriptor label.
>
> ...
>
> >       for (i =3D 0; i < chip->ngpio; i++) {
> >               int gpio =3D i + chip->base;
> >               int reg;
> > -             const char *label, *pull, *powerdomain;
> > +             const char *pull, *powerdomain;
>
> Make it reversed xmas tree?
>

Bikeshedding again. :)

But I plan on making all local variables across the core GPIOLIB code
consistent (no tabs and reverse xmas tree) closer to the end of the
release cycle.

Bart

