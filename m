Return-Path: <linux-gpio+bounces-5718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8728AD3BB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 20:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE801F216C1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Apr 2024 18:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E7B154430;
	Mon, 22 Apr 2024 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="teAiQ9Wb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A513F015
	for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713809761; cv=none; b=igXbiK2ecKCdVCJNoFvNMeT/duNkgnasZI0h7d4RNyniudEdDSMG8hzJCM/w7LCbea7V5MSgNN8LHzjcyYdlzXeA4OkBb4wni1tTgbpW8AzfIr5JRZjr1Njy/bOgXumheH64Xu3FGnBBEyhwbvRmLHA9xAptC77PvIpouoQAsAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713809761; c=relaxed/simple;
	bh=IOleGRSqiLrOnDc5YCXgdneK0qitLwASA+PISN9Mf4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGWjBuA3POyeyUVOsbsexcgOUnn0FdzQ/gkMktuDtWUIPbLNR/l1v8OKLJ+FpRb4ZkkctbNAcisV2JQJpTA1BA/Q1SrGIb2jz9bCXXTVg0rWmaECLb9j3Y8qYQAwa/la0C5gA/3/WfqXfTIBW/tTmE6oDBiz8nLGTyPzKaMDX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=teAiQ9Wb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2da01cb187cso81970611fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Apr 2024 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713809757; x=1714414557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W5ZN7raaRP3ZZ1h9F2RQUujI6Z+M9K+S0uQNN3LNFc=;
        b=teAiQ9WbAOgLLir1YBiNX5xg4xBP56yFYeBPZoxezPTF4tSVcbLdAr/97mpn8q3BP2
         bdwNGCk32uK5MEFTccmwAawmgwgYYMNe0Dzw+VXLioCDQZWQ+esYynEG+bbQS+7MJ7ls
         YVnAGVXWvsZV4DyJB+tqtGNAEQu5B1uUPerRKInvaY4LS87WZS/x6DQr7BWuO1Fbo3iC
         PIPV4mIaFNpytgSBy+9ZFCMhzXuq70vAxrkkBkNAyYpfKQHen5JEVG76yr45IZo+fATb
         s4XTX4Z/d3uWRjOpW4oGrp5r7lCAuA20LXhxAngdiEFnMdELxTBful645jLoM0l1Ozxp
         sZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809757; x=1714414557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W5ZN7raaRP3ZZ1h9F2RQUujI6Z+M9K+S0uQNN3LNFc=;
        b=s4/UsefYUaxADLTeWIlCUzQ3vkr6nqFLBmKQtGMQr9hfSKtCiNgr1I/UkHpgbxKI/I
         gAH3XqB712odYm7KcfHZyYFlWIF6LTMEAq3Zz3q50eMEBJ+b2Vn7kGDKcBA0SKwI/w7b
         kyZG/gCL4N6wo5DNwERnxIr49kkHCgikFyJ0Il7AwjG/ZS/qnEF0BHgapmHA3+DHgS7K
         cGmY3vYTCx+d5qGxg7EQTZpotdsGWrnCiME98gSmJv0HpVZ9q1t9YN0UJNSNAquApVWx
         uiDN2LkCvGHNWJ4D94X3KDbxgBcERmNCbsqdkeylpJaHA9uf20hxMI0840+ajBO9NPpm
         sjwA==
X-Forwarded-Encrypted: i=1; AJvYcCXeEE5K9495TmkKp+9OrEtTCWdQ7gIElLt6k8vgOMAVzacfmHSqt/vxxje5ZdJ5WnkeP50GuJxpfK5PZqW9YgBNY+D82F5RXn8h7A==
X-Gm-Message-State: AOJu0YwNvuiLGFdGosRtr4FQhrFeiJRw0Mfy0YmGrrejs0ejkpOZM40y
	kRH/zCMYIT1L/ZVlF+gFMT7otx4fWP9NbpVj8cS5IUU0qDUAq0si8u7hotB4RZsK5bS0bGKdSgM
	CpCCGMApm0Ml2ZrZfd5tt8iUmRrWmaLz6MN3EMw==
X-Google-Smtp-Source: AGHT+IHF0U6Z0JMZDp3wfqRK2LfkQhsTNo2JATZwgkEOA8YL2ECekB/juabxSjpvUeetR440tKyQC7kHdqT/WnVRuKQ=
X-Received: by 2002:a05:651c:198c:b0:2dd:c3e5:eefc with SMTP id
 bx12-20020a05651c198c00b002ddc3e5eefcmr2445901ljb.27.1713809757633; Mon, 22
 Apr 2024 11:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416215222.175166-1-brgl@bgdev.pl> <20240416215222.175166-3-brgl@bgdev.pl>
 <20240417072350.GA120983@rigel>
In-Reply-To: <20240417072350.GA120983@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Apr 2024 20:15:46 +0200
Message-ID: <CAMRc=MfJxFYBoVK5GGks-A++n6naLJ31B6-UJBdxiw7gvnfxfQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/4] tools: use ppoll() where higher timeout
 resolution makes sense
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Gunnar_Th=C3=B6rnqvist?= <gunnar@igl.se>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 9:23=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, Apr 16, 2024 at 11:52:20PM +0200, Bartosz Golaszewski wrote:
> >
> > -             ret =3D poll(pollfds, resolver->num_chips, cfg.idle_timeo=
ut);
> > +             if (cfg.idle_timeout > 0) {
> > +                     idle_timeout.tv_sec =3D cfg.idle_timeout / 100000=
0;
> > +                     idle_timeout.tv_nsec =3D
> > +                                     (cfg.idle_timeout % 1000000) * 10=
00;
> > +             }
> > +
> > +             ret =3D ppoll(pollfds, resolver->num_chips,
> > +                         cfg.idle_timeout > 0 ? &idle_timeout : NULL, =
NULL);
> >               if (ret < 0)
> >                       die_perror("error polling for events");
> >
>
> One minor nit - I would introduce a timespec pointer initialised to NULL
> and set to point to idle_timeout within the if rather than repeat the
> cfg.idle_timeout > 0 test.
>

Actually we can avoid it by doing it once before we enter the for(;;)
loop. It's passed by constant pointer to ppoll() anyway and having the
struct AND pointer to it initialized to NULL sounds more complex than
it needs to be. I'll do it in v2.

> But that is just personal preference, so either way,
>
> Reviewed-by: Kent Gibson <warthog618@gmail.com>
>

Thanks, I'll keep the tag if you don't mind the above solution?

Bart

