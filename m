Return-Path: <linux-gpio+bounces-971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481280352D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24A91F211C3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 13:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0F52511A;
	Mon,  4 Dec 2023 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0NulV3dg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BE4170B
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 05:39:46 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7c5a2b5e75dso336440241.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 05:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701697185; x=1702301985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aykN48i+e3OoDO3X840k13yYydXS1iFRL8bf9Vv0ZMg=;
        b=0NulV3dgLKw3VvWNZc6KYS1u6UI4h7GORzUkyGe8vAgKx8Drd/Aw2hP23YEOGiMIr1
         Q42PZi+VncLXclLeRIoPW2MHdb6qkNK1xgnyMfKAJIHB3Xz+wRzisoAiA+zKooNkKFiC
         HYKVFZP/L48KskyI6j0OQ2hX6j030r+OkZxUjdeRfWnFlcM7XK864AzHxGa8F8PQ2A2T
         /23yeIUv0vaqU34LXkQS/w2Iete/BdieUBtidFFaC7notEUeDHfqaIJqg0FafoR+zdER
         EYPkr0qqRJI8L5NtmT8D0om2vsO/Cw7haDutdOmZqT+ReG+JPrOq+kVUs7NiQ/kWQdkC
         DZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697185; x=1702301985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aykN48i+e3OoDO3X840k13yYydXS1iFRL8bf9Vv0ZMg=;
        b=fC1Na7ohOEO8nESONZ+9ahjB1SVvjQcXToIMv6/tgXMfwqGk5lH0W1qLQWlAVwWhrr
         lgqtpbka/NHG9DLKv6pORdOjyRoZqEiNw+6KJJB1Bf6whdzYSH8GwCgdEpck5+CT5pmw
         9IV8f2KfT1qXZHolUHu2ljPnuSO43ORaht4n9h4SC/k2nNFhn7l8jOagsLyKqv5Mff6n
         IruRTVk5nLLbUG2RdJlTHKJ1er/1anQUbrSKhV3ticf+msLyfWrz7XV+VOt2Gs7JncbT
         fytvynUnkzdyCi3OSE2dl1HpN9jTzr/F2FWI+2giwfrkRLexgWO+uAoO8iG2IDjj/wez
         uvRQ==
X-Gm-Message-State: AOJu0YzRbpKNH5bJncptDKnVcIg/AVaiaeaZCWxaiLqIG/yup6SR27iw
	UeSa65sFquK8jeOOE0SL1QPRSsHDOE9PMGEzxWx5eQ==
X-Google-Smtp-Source: AGHT+IEkIy6UUCzB9F0dzSqV4WUQqHoTfYB3bCQ8j9jAbkYaTLAsdfBIdzsdB1eOollkeIade3UxRTTmDTxTpIl8oNY=
X-Received: by 2002:a05:6122:32cf:b0:4b2:c555:12fc with SMTP id
 ck15-20020a05612232cf00b004b2c55512fcmr982063vkb.27.1701697185442; Mon, 04
 Dec 2023 05:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204093509.19225-1-brgl@bgdev.pl> <20231204093509.19225-10-brgl@bgdev.pl>
 <ZW3TEQok8Ri-epw8@smile.fi.intel.com>
In-Reply-To: <ZW3TEQok8Ri-epw8@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Dec 2023 14:39:34 +0100
Message-ID: <CAMRc=MdaWEv+aj-W8TTJVDgKBOTrMt48ox48e37UAaY8FhorOw@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] gpiolib: use gpiochip_dup_line_label() in
 for_each helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Dec 04, 2023 at 10:35:08AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Rework for_each_requested_gpio_in_range() to use the new helper to
> > retrieve a dynamically allocated copy of the descriptor label and free
> > it at the end of each iteration. We need to leverage the CLASS()'
> > destructor to make sure that the label is freed even when breaking out
> > of the loop.
>
> ...
>
> > -             if ((label =3D gpiochip_is_requested(chip, base + i)) =3D=
=3D NULL) {} else
>
> I see, but...
>
> > +             if ((*_data.label =3D                                    =
                 \
> > +                     gpiochip_dup_line_label(_chip, _base + *_data.i))=
 =3D=3D NULL) {}   \
>
> ...can we drop this NULL check by using !(...) notation?
>

I'd rather not. this is already quite hard to understand and a single
`!` is less readable than `=3D=3D NULL`.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

