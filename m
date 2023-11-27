Return-Path: <linux-gpio+bounces-531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA997FA407
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 16:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063E7281693
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Nov 2023 15:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD3731739;
	Mon, 27 Nov 2023 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8LJpZ51"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42A6AA;
	Mon, 27 Nov 2023 07:05:31 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-da819902678so4007564276.1;
        Mon, 27 Nov 2023 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701097531; x=1701702331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A14//g2UoXkLcdPQSx/k3Kefdj+ue5KGp8TIARcBONU=;
        b=I8LJpZ51Rmd3GLFTKtuVTrpb/fOvwIcetGBllIJx13uJcV4gkZ6j4cfiJ2djUtf1ld
         l+iaBWUM4K52tU99JjAhC+vVVfBQrtg7mAGVJta1alH3cf7IG72dE4yupewETfH12P8d
         QZZsOoyd0VVlqC07cgGh1sJhPnOzIzC/Ff44jatsHXEsU4ixJdJs7BtbVWEkgDXYa4xN
         W0IEB5oqXG9wMnqYr26jo5zhhOga2GMSXsggOuAhMkdP4kTsgge5LszoWJeaaAcjuxMJ
         uhH37eMgR+RzVYOWwcsIe/zdg0eGhOKrnwUQrFDNhLYinSt0Q1c81ebZvkvfuUm5kHxU
         e8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701097531; x=1701702331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A14//g2UoXkLcdPQSx/k3Kefdj+ue5KGp8TIARcBONU=;
        b=PG8BOIohJf+FW7qVL0Us8Km4tzlbPFQwuutre7kYvqfSnDNo2cCLovwVMzJvyCE4vd
         JUxNGOGQ6R0wFX4B7ZaYY9re3t/e2EBgr6KsiIraav++Jf1OyyfxFFl/8Z0VPnIS+T+u
         u6w3/yGo+x9vfFdRIKyobUF6Y13hnTJhw2HRZRJFaygc7+CRewc1nv5L1mSwX7huWmS5
         GUFkPy0mKBJRGRHPLQgMsugiciZBz8f3w9CMjVy0kVuZIRR7y6N95a9L+m23FTuiIrxf
         KHsx5uMHdV1KleNixzH197pPuUXszT1Yon0HP0QsMbit8MMcUDJA/5Y37O7tOA5/h5lb
         8UNg==
X-Gm-Message-State: AOJu0YyVoodxCEJglDmac5IVNJPulKFKP7AUHRQPmQPzGXUz3Ag5917r
	DDYomaJK+7HJZZaP3/upQxeZLFoblO0DEZNxWw0=
X-Google-Smtp-Source: AGHT+IFD5Yhlfu1wvzt/S0Z6RQjPCozzczGVg6VzXL32NvqafhWv5m2ewDPmpfJRhWrDAzc1Y5Sk8oPfeca2QTWxtBk=
X-Received: by 2002:a5b:201:0:b0:d9a:3bee:2eeb with SMTP id
 z1-20020a5b0201000000b00d9a3bee2eebmr12061112ybl.60.1701097530941; Mon, 27
 Nov 2023 07:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
 <ZVzy227f3cIiTmtE@smile.fi.intel.com> <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
 <ZWCJP48WopQdCp6h@smile.fi.intel.com>
In-Reply-To: <ZWCJP48WopQdCp6h@smile.fi.intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Nov 2023 17:05:19 +0200
Message-ID: <CAP6Zq1jrX+Mg70mWA3hEQDBYBU5PmDPdLPPEOZ5o+fSKw053rA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, 24 Nov 2023 at 13:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Nov 24, 2023 at 11:09:07AM +0100, Linus Walleij wrote:
> > On Tue, Nov 21, 2023 at 7:11=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> >
> > > > The pin control header provides struct pingroup and PINCTRL_PINGROU=
P() macro.
> > > > Utilize them instead of open coded variants in the driver.
> > >
> > > Linus, I dunno if you are going to apply this sooner (assuming Jonath=
an is okay
> > > with the change), but I have a bigger pending series where this will =
be a
> > > prerequisite. So, when I will be ready and if it's not being applied =
(yet),
> > > I'll include it into the bigger series as well.
> >
> > No answer from Jonathan but I just applied another Nuvoton patch from
> > Tomer, so maybe Tomer can look at/test this patch?
Sorry, but I do not have wpcm450 board to test this patch.
In general, the patch looks fine.
>
> Jonathan acked it  in the reincarnation in the series (see my big one).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Sorry I couldn't help.

Best regards,

Tomer

