Return-Path: <linux-gpio+bounces-471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B537F70B3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48FA4B20E24
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A63179B8;
	Fri, 24 Nov 2023 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a38AHAE9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249471A5
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:01:39 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5c8c26cf056so17315937b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 02:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700820098; x=1701424898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPKtCopZtjo9sHDnS+A4ZAdadrH7hVpFlfcBUcushSo=;
        b=a38AHAE97Fwtnv0Fqx41LZtSKbLI9zuCQzz9ykxgwlPrNEm4gU58X3WSBlrvrhyEn6
         wSYwBadjYJ0ZSnDKufVBBBDW5AFLyfgaS0Gyjlm219H9QuBXHVY9euQLMYvose9B4lTp
         632gLYvvF5bgC6kuQQDH9h7pOT6rcBIkjv/1sLErrys0bpCxsNihMIRb+PFAfeWZbCTb
         B4XLi7FqXOf0YcWOyL5N842l70pJnBC/914kQplBSjBTmJpjR2biWtLJKek18eWmE4mT
         RLF85vm/HvU2m/H88WyQAi4fHVHQW3K0A8LREk9q1k4Iqw8QN1kRcjXvBQ1EfKVg995W
         58Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820098; x=1701424898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPKtCopZtjo9sHDnS+A4ZAdadrH7hVpFlfcBUcushSo=;
        b=U7luW1EssUCS6NQr67DCfmxbv2xlva6/K9E6f9Sis/GzPEfYM7rALRH1mjE9lgd5nB
         K5z6fBnRF9n09uSm8wqRytotOYK9whA1zyOptCVWCmjEkhCXEx0dCGwn067yl/7LkOiI
         G/Vf3D0+cmn6utMquQ6VLUINoTV+WscRRKe/YDnY1utQPYJhyvQifm/LYRNzw/xx9U1L
         UUmsaIg1GiB3ah9x8W7LvUCHLOhWJ5HhrBdFPzvgVAMnT8RSLyO+fpDHqx3MBomiDXaD
         7dzXai3PuEkZW6fKvPnmm2xV9f8JpKqAG7pva7RVgjSLQDY+Jqpo/2p6PmMfoeUbmFUo
         y5RQ==
X-Gm-Message-State: AOJu0Ywd6uj9JmSI5is3HInsqXjVgnXdAQa2aho8P5aAjzWn8GYdN+vk
	uibehcaBdkqsuA7dSwWe8PZ3RTvgzn2KidfhViCLfg==
X-Google-Smtp-Source: AGHT+IEQyC4nSPcfo0BaJZ+VCOLswCLlYEsACBXAJN4r77FPCG2ucCTKzF44LOPdRFVatrdcBlDU5Fd67usGJvhsVvk=
X-Received: by 2002:a0d:e653:0:b0:5ca:67e8:4fab with SMTP id
 p80-20020a0de653000000b005ca67e84fabmr2008948ywe.8.1700820098221; Fri, 24 Nov
 2023 02:01:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115165001.2932350-1-brgl@bgdev.pl> <CACRpkdbDny8X3WB_qJ4h_vbwrjno5ytAtNMgTeXg4jpegdUH2w@mail.gmail.com>
 <CAMRc=McZJzdj04Ckf_ygDhWNN2JcbTfY+yefOZSYx_nTE_Jpjg@mail.gmail.com>
In-Reply-To: <CAMRc=McZJzdj04Ckf_ygDhWNN2JcbTfY+yefOZSYx_nTE_Jpjg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:01:27 +0100
Message-ID: <CACRpkdb7QwWcq=mDa4y8bh_QLAFU+X9LCr0chrGVL-_9YE5P9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: don't use gpiod_to_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 4:06=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Thu, Nov 16, 2023 at 2:43=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Wed, Nov 15, 2023 at 5:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Let's start working towards removing gpiod_to_chip() from the kernel.
> > > Start with pinctrl. The first patch should go through the GPIO tree
> > > and become available through an immutable tag so that we can get more
> > > conversions in this cycle elsewhere.
> >
> > Fair enough, maybe an immutable branch with all three patches?
> > Probably best to merga all three into both subsystems I think.
> >
>
> Nah, I don't think I need to pollute the GPIO tree with every pinctrl
> patch. It's enough to just merge the first one into GPIO and you do
> the same in pinctrl.

Fair enough, but I need that immutable branch for patch 1 so I
can merge the rest on top.

Yours,
Linus Walleij

