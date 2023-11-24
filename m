Return-Path: <linux-gpio+bounces-494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4C7F84D3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 20:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D6901F21911
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 19:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69D03A8EA;
	Fri, 24 Nov 2023 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QsTDrsRX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A70F1B5
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 11:40:22 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4ac459d7962so1212447e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 11:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700854821; x=1701459621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfPuzQ88UTumZWzrpshNNxDAiNQ7rGXcChPe9HqpR3s=;
        b=QsTDrsRX3hYGfPWERq7r8U9nyyGkM0Wtly2QBeOjSuusxBuubK/GNkkZMHlft0G4fC
         eSAhhI91xaySkrZekI/Cm/67OlOP91Of060XTC5vjcQ7mOjfPHDGh8VGzD3oEJI7WOI4
         iYf4/zFF8bQ/gZ4nnDEi5/oOX8tIAg2jHEIj7kF04MTfXGh3EjGXa4FckKUs7GViODsq
         iWoqJt2XOHcFV9UipKs28KzD6mQiz4ezpqlLoxyOkWJhtebV7sp3CKj7FQZvV0GD6KF2
         r7Mn6KW0mVOeAZRZQ7HxyHM7bJYtGMY3+pizEl9kUcLgsXGqVZ5HAiwePVaaqkRVJhzh
         IXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700854821; x=1701459621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfPuzQ88UTumZWzrpshNNxDAiNQ7rGXcChPe9HqpR3s=;
        b=GeVKtRgdWzkND/x/s0HpUtwsjzJJuAIA4tryJCHmsWQ8MczE5bAjwn7UhgyqoE1Wil
         +RW5/ubYxJVBN0/DBM3qnYhQGDUFszS3WBrHhrtx4U3IpCx/YZPxBBtt3tYTyqlBGlOy
         XKggKmnuhbNq+oblDq1jyqV7ik781bGZIaH8kZMYLelpfmKrPHJEgBypkJ5iJ/MZccJe
         QOr7uHey3mltBMA3zojTkuBIqbVb5WbNemxJSJIeUsaC2Yzhea/1aP+gYCrZvV4ZKfyv
         3LyFmnpJunbdbWPKrnY/reOPZFuN1JHDRqsu57nNUJ6+h6ZswjAtbdREozyTIDYSN+7k
         oYEQ==
X-Gm-Message-State: AOJu0YwCeGEh4ATXHuZemel15frZuZI6s3WnIllJAvdWIEKNMhoxG7zv
	crnT3Tv1pWXw1BmCM74v9CXlRixFPSMxTVo//pNCjNYFsUnnhKus
X-Google-Smtp-Source: AGHT+IGaj4iMx31WHoOJsNqKMY2PR3YY/foCeMKUh9ruPFkRvtuUyQmgXBGrcB2rE8J6OUiUjsGAphzg4M8S3DVAK54=
X-Received: by 2002:a1f:4a45:0:b0:495:e688:72b7 with SMTP id
 x66-20020a1f4a45000000b00495e68872b7mr4731673vka.4.1700854821504; Fri, 24 Nov
 2023 11:40:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115165001.2932350-1-brgl@bgdev.pl> <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
 <CAMRc=McZJzdj04Ckf_ygDhWNN2JcbTfY+yefOZSYx_nTE_Jpjg@mail.gmail.com> <CACRpkdb7QwWcq=mDa4y8bh_QLAFU+X9LCr0chrGVL-_9YE5P9A@mail.gmail.com>
In-Reply-To: <CACRpkdb7QwWcq=mDa4y8bh_QLAFU+X9LCr0chrGVL-_9YE5P9A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Nov 2023 20:40:10 +0100
Message-ID: <CAMRc=Md+5N_u0QkL+OTc2xVQuxP0dZY-1GbrdGQqwhdJrv4Cbg@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 11:01=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Mon, Nov 20, 2023 at 4:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Thu, Nov 16, 2023 at 2:43=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > > On Wed, Nov 15, 2023 at 5:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Let's start working towards removing gpiod_to_chip() from the kerne=
l.
> > > > Start with pinctrl. The first patch should go through the GPIO tree
> > > > and become available through an immutable tag so that we can get mo=
re
> > > > conversions in this cycle elsewhere.
> > >
> > > Fair enough, maybe an immutable branch with all three patches?
> > > Probably best to merga all three into both subsystems I think.
> > >
> >
> > Nah, I don't think I need to pollute the GPIO tree with every pinctrl
> > patch. It's enough to just merge the first one into GPIO and you do
> > the same in pinctrl.
>
> Fair enough, but I need that immutable branch for patch 1 so I
> can merge the rest on top.
>
> Yours,
> Linus Walleij

I applied the first patch (after fixing the typo in the commit
message) and sent you the immutable branch to pull. Please apply the
remaining patches to the pinctrl tree directly.

Thanks!
Bart

