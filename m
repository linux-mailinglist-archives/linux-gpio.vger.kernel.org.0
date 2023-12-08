Return-Path: <linux-gpio+bounces-1118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A480A0C4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 11:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908AB1F21817
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 10:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380661862B;
	Fri,  8 Dec 2023 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjLlQMJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EFA199C
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 02:27:14 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d05e4a94c3so17093825ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702031234; x=1702636034; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ndVi633vGYkuOghPT81nvWZQ440J/A+y0aYkrSHj08Y=;
        b=ZjLlQMJ2TwknCZufPPQs+3DCDUMfuz4dIseEMF1qz3+HUoH/t/k1IHo24WWEtJti38
         6C/xazPij5jd+rTuVtYP0CuqGflOTx96viJXkoiYk/1X/4Bs6JEn1N+wnqNsvOTnGpwl
         99FXK5Tw7MHmhW1vDXWDU15ZOj0FFLalSX3aso05cw0V4W9yypV5B2E6aOrf4Bi1Au7+
         NeTazDyy9nAlX4hL98QV+IFCLltZEs6aIt8uA2fqF1b89C/Zux6AuOIETsZgzrADbab3
         hvBJtX0KisPvenFGTrEmf9E6eoxqsEV2ARoC+Hn6/+VSDi8g4aAn99ctwAaSibm/7gyR
         Pmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031234; x=1702636034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndVi633vGYkuOghPT81nvWZQ440J/A+y0aYkrSHj08Y=;
        b=erWmASXr95zwKD78UaHchxz0evU4K0caEbXh1Jy6ojKSEyuiOq76hZ31zl2YJhCpBb
         NOE9WiMgFT6nwSfjk7drdc3P6RklE4Hr+aAbPq6OK3tY4p47o0LRxDer25zRmmaDyrtK
         evvE73IEk4m4rRV3aK5Swrx2/FNtar4n4ZZR5Dr5IjCUu/1hW/8xcfzuFIyKQSNBGi/p
         4E8V/gjx1PUU+dIAqnYVEXbsg4BBsCnBp931pIcg1Jdj4Fjg+qctk44fsBO418dj8h8I
         5mk99wHgyQrB2AWeKVcvBO9xeF1jFKVQ9HSm1KHpCwLR/5b8rqEBgW+ggKASehMLwy/q
         XR3Q==
X-Gm-Message-State: AOJu0Yy0icU6We/ZChuKyZI0y8XjMACzzOHUWjat8ydz7y7SfRhk2MUa
	MzhH4QQP3kBHoKBG0X4Xtl0=
X-Google-Smtp-Source: AGHT+IEKrDmsitc2nNYmNUeesc4FBUzDOKBjLZm5Ru6N9QAaHmoYf2nDo+qu8vdiKpgbiUlhqp3F3A==
X-Received: by 2002:a17:903:2290:b0:1b8:90bd:d157 with SMTP id b16-20020a170903229000b001b890bdd157mr4798956plh.26.1702031233853;
        Fri, 08 Dec 2023 02:27:13 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902c08300b001cfc68125desm1337395pld.203.2023.12.08.02.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:27:13 -0800 (PST)
Date: Fri, 8 Dec 2023 18:27:08 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXLvfBWTAGZt0f0L@rigel>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <ZXJq2zGjBT0yQAXv@rigel>
 <CAMRc=MemJobowO_+FFaF0r6OGx1cWTc899A5yPzR+q+2=rwADA@mail.gmail.com>
 <ZXLWHTjv9W-IH_OP@rigel>
 <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfXQb=A=4f0kFEW4ENuNk0ZmL_qAkWihEvFcYaizCf8LA@mail.gmail.com>

On Fri, Dec 08, 2023 at 10:52:09AM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 8, 2023 at 9:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 09:13:17AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Dec 8, 2023 at 2:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> > > > > On Tue, Nov 28, 2023 at 11:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > >
> > > > >
> > > > > [snip]
> > >
> >
> > Yeah, no need to risk other GPIO users messing with it if it is only there
> > for cdev.
> > Want me to take a look at it or are you happy to take care of it?
> >
>
> If you'll find the time to do it in the following days then sure, go
> ahead, otherwise, I'll have some pare cycles today and next week to
> spend on it.
>

It would probably take me longer than that to context switch, so go for
it.

Cheers,
Kent.


