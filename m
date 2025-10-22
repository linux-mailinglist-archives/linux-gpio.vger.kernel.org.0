Return-Path: <linux-gpio+bounces-27478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D849BFCEB3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F33DC4F0B43
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F57334D4C4;
	Wed, 22 Oct 2025 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L12t+1rE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E32434320B
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147413; cv=none; b=Y+a4pst0YsGwinNbcD1gLED1cOLq4+eHY+RquFUnl1LrHTiQ7LW/bVowhglhfb1+MOj8L4VE2Ly9yOAdfy7qsGGd6kpuBUvJh0HtqVtpQop4kcPgy9fUSLHEB8zNee3X/HLqQHJwC0cOjU2+Xzpa9oDzqD3XrQVq/1QCQuWgV24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147413; c=relaxed/simple;
	bh=voJSs7Hw3Wl/EZaQou3RkTgu4VdQyS/EVwb9Mp9QVNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axcxcJVzAunhZPBenqfhNK3opqADqMRQJuWlCFESNGRDdsqy0977ZpszVIdgFZwGRnGyt8QfneVX95Sj7HoP+eS4OvTA1e6iIOk0w776r+IbnEpBUQqy1Pe0hT3Gmud7m6ccx9H6iYS1/ZFGIccFPZNoBvST5i2Xq/XqrxyGsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L12t+1rE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57e36125e8aso6648618e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761147406; x=1761752206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=L12t+1rE+8f9f2Pii8C/PIdRs9UoviXh9nOuNQfciu+K6ySdJHYZaubI8Ar0qund4h
         87cLYIm2isV0LihywDTjrUE33d2U+F+uSNel4OMVteAUWqf0NhsWuZGk//KVBBzthMBJ
         W4fB8wRsqMKZBHbuNv4Rq3PwYFsdylxTWDHSw9FcnkCog+tqej7kEXIUGk9df1LSVmCO
         srJ/y9tNCneiHfOQ4AUrXz6ZT4gF/cjiyLsErvxX4C2dZlZ/o3e9gTtiaz2Nyi7iuszQ
         VuSLCt8QoP762tAXBhLqvElEO/Tszi67Dds/nmxWBVMdZeiozzYZ7buez5BkpisZTuFA
         9tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147406; x=1761752206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=l//6zRRJbCBltoGzsweFbAFu0AbNkoWywWLWha1s4kXX31s4nNt7i96mgJMlQYnPhO
         k4YPsT13DUFZURXco4WV2JSq7h6KS2KdaR7zoR1rDAFPE3MD0Sfep9+griroxUaib9B4
         Imo3v9DeAi3pmmxNeOU2DZ1OWSq0MVaFOZyejFutgICTva+i05ho0hnzUxsx8qM4NCEG
         hrNVWXxPfg+mD8qDLgiU0QXlPybWkAEh/rS4w3br351Ym/Ui8t76lZQ1fFraQG/vkfZK
         5hhoULFbMltBuxQheUzl5KWJBYU1QsGIsZF8TpicZa5FfKCp9NiF0NxsLlrm4ClAukCg
         I/0g==
X-Forwarded-Encrypted: i=1; AJvYcCWn3RqqRHkcWnypSrbxYPRbHryui5SKuOilPwRnG1Hj3/e8dncbjZsEZl8V8oxiBdvHEmlq5zDhS+3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6g/ILX7XJrtHsOZg66Q5QaFAE80Nr7xgo5kLKX7tnxVsXhGf0
	45lItkgjvPBBPkt+wcm5TXVtV9gcX+i5sr5lVq/EUzjzOPauT6cWOZJYJquII/adLWxM7jSOcwO
	Az8BZTQGnq55JaeypfbqhhHQ1DY2MtS2XCFkDsEH15w==
X-Gm-Gg: ASbGnct6tkpfEUyNSIB+OzAIlG6iyDmHLejeCe+UXef5aJwCtkM2a2ADQJJgZw6G3dg
	c8rPWwtccyvdSxJFTecGpQ+Oi3TEOZWvl7kCvDiNUZ/97lvVehhxGfvwv3SQHSOPE2L7VQO4G+m
	nyaWgdwaFnN86ojtufdxWsSfhwF8hK3AsuFKvRFiuWRzF0Q1zlzgHFX+fUtaSvZVdD0nhgL5LIn
	MDw2pCXbiKz1XG2yG4SbBNQhaVTeizFomdmUgm5OEBsWat7ncOaXv46ZF4tkeE7xWU+hFByjF/a
	bce4/YMbWK6dRav1yXh/NftOmUM=
X-Google-Smtp-Source: AGHT+IEi/irswdy4VVxLlO1hAN0Zsc9fjvuDKRe+i2ePli5jYREx+Bc29gt/0YVceCmzNFvpblDZjtrVlJp1Cz69730=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr8169026e87.51.1761147405947; Wed, 22 Oct 2025
 08:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
In-Reply-To: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 17:36:33 +0200
X-Gm-Features: AS18NWDr85-ZpXwSC6o2WrSo4j9nQyRJc99PDFWHduyckze-ToGPJ6wk6IRJ840
Message-ID: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
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

On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +static void string_test_strends(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > +}
>
> Have you checked the binary file? If you want this to be properly impleme=
nted,
> generate the suffix. (Actually making the function static inline makes my=
 point
> really visible)
>

Andy, this is bikeshedding. This is literally the least important
piece of this series. It doesn't matter for the big picture whether
this is inlined or not.

Bartosz

