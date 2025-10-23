Return-Path: <linux-gpio+bounces-27565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AAC030B2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 20:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6541134851B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 18:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D19E286D5D;
	Thu, 23 Oct 2025 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s0yNVa/e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD88B2571D4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245044; cv=none; b=dQX6Irp6iSI4No7Y5QdobEy6c86GyALdcX92dTvhtbow8EaHG/KcF++6hve9E+aXcDDfhxebvftx6vDBUOOtbSdabs/sz2b5HYcFreE0mZNNGBJAr7MDuTX4MHNqcS5G+8nGjWuwlEoJu6t7ZEHDYgqZ60TLy44C8YKqOahBQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245044; c=relaxed/simple;
	bh=PYp52JdL1zIXM3tFl6ymQmTmBEsgbvGo+/rL6L5cfGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuKZx41SvJdprYgcWejQm14IVZiIBfbqqCArTfgU0cP+p3MZoCcQAVyejRmk5ow3IjWSdBm3lRFjVEsBCvzLo7INurSEcxO0VJlm3fD1zL4DOfsEbN6X78oxkR1LVOxvpNVZ6AE6t6y8l5s0ajZRcBCHJiPupnIWbzzXtNyzdS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s0yNVa/e; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592f3d2d068so1091843e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245041; x=1761849841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=s0yNVa/eJZhfoD3bMLT1xWtZBJPc1t8A/Zn2xYvJEgb/5MtqNO0u6wsuFrM8+isO8U
         a8RqaMEzvq4KU+ucS1pGmFbO1lJkh200XIxtI+uKBrtnG6LYvmZhKlbST26f1dgZKE1G
         dOKkExTkR8MKfeKYs7aXi148bX5ANT4YL2UKuU8MsQpC5zW3VrySCfAv6AqUxxr4U7+w
         YLQx0lhCkihrCpKURL10BMLreCwmNrK2c+SVDNma9CEgKoPeWpeXS4Dtfjcr7DRXw/5I
         R22ChlayhU94emhkIFIMNElmKGF4HJbaff2HtFXiz2ZXhy5tspL9shNNfuFjMpURLrzh
         TvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245041; x=1761849841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FILWuJP7z4ne8yyln1112yG3l4Q4g1VKcs5bhTHsJnM=;
        b=QHn1UOhO/BOG+ARfA9JanXqs0TBATvLEJW4wNOD7GNR1UhhZ62L2L5z4o8Tqu+pddP
         80E++Xsk0YB4ommXwY4r4KxLEYLSmYKm1AnrfHcamdU/sBjv69NNo7lQnwadFYD2jkfn
         HuSvKvUGXRNV0w0bDOiX9cJ+tUXLWLse9/RRpcau27Buccu24JPjlP4f3n7bxSElVSte
         3OPP4YVBX4KhA9VeLZOwjAPBevkjBPim+3dbnFT3U1PgyqRGkOB78kKkrnbHSAVnOrLo
         RBDvRDTli1OB0WGbmqwdSOrxj8tgt2F4VI7QCcN4uZYMMZhtShUP8uVkX24h3DUDQSsc
         +tTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaOrFBlyPdmOjPgb2HMg6wnRxKdT5mPfTBVcaFLZ3XdrbFCVHtUGfIldkmg4W4crQahx0n37A4Pzfu@vger.kernel.org
X-Gm-Message-State: AOJu0YysBhSLIYVMDxR08D9axbBgV/PN6Dol/hsy3EnpgV9HbttKeGUb
	HngTiO37OnIyfZLbqNYkNxL3NFRwnIe6N3rzZx+24t2yOJ6DzUpw/wFCPpxnaB9QIq25COfnCrS
	aTozM6f8b3eJtfFXBHk477KFyzNzw27+KAriUzOXZsC18DzIvjecb
X-Gm-Gg: ASbGncuE8AtaPmE5h16jVQpYmYY97Zpmb4aR1tT1FRHJ/sva0ieMK7MS2lQvhSG2zmF
	kjqbw3MeACWxQ+VqOVHaDOuXLospN/3etTQX99WmJixbU/eRzjZxbci6PG+F0HIo+EjAds6h8fn
	v0iFLnOjMW98SPMWTdVxsUGAC7HZ9q66oMkPtUQC4pdjolVnA7wrYXT2SH8vXYS9326NkZhJ3KS
	dcFk8dJXSTCAeS1s7hDWMFF9ijo6yJ4oOL5VTN44KlqQu594aKfMb8QbDqhViwMLyrj1Hexzvml
	oEB0ra1rxt8YwMKDJNZyvGkxlg==
X-Google-Smtp-Source: AGHT+IHraJus61bT3Hr2N07s+Ur3YCVMAET0C9pakpGhymtxfywdhGOWwy5gv3wy+GpPvNZ0Z7OpA/pQbI51BbDb264=
X-Received: by 2002:a05:6512:3b1e:b0:58a:fc55:883a with SMTP id
 2adb3069b0e04-591d84eb531mr9214189e87.4.1761245040819; Thu, 23 Oct 2025
 11:44:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
 <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com> <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
In-Reply-To: <aPkQi_Zn-17JKG0s@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:43:47 +0200
X-Gm-Features: AS18NWCf9BHk3M78U-yTtMgDQhhnI1g2CI7k-KfJvPnPOvApY9tkkzNXTL8vud4
Message-ID: <CAMRc=Mdah6ve68h=d93VHXGij7KAQiGWuOGtzX_7VSPsCi=bbQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 7:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 05:36:33PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static void string_test_strends(struct kunit *test)
> > > > +{
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > > > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > > > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > > > +}
> > >
> > > Have you checked the binary file? If you want this to be properly imp=
lemented,
> > > generate the suffix. (Actually making the function static inline make=
s my point
> > > really visible)
> >
> > Andy, this is bikeshedding. This is literally the least important
> > piece of this series. It doesn't matter for the big picture whether
> > this is inlined or not.
>
> It's definitely not a bikeshedding. I try to keep a bit consistency here =
and
> I don't see the point of bloating a kernel (binary as well) for the funct=
ion
> that just a couple of lines with simple basic calls.
>
> Also note that with inlined version strlen() for string literals will be
> calculated at _compile-time_! This is clear benefit.
>
> Really, library code is not as simple as dropping something to somewhere.=
..
>

Ok, whatever I'll make it static inline.

Bart

