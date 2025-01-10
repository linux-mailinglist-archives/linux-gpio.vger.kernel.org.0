Return-Path: <linux-gpio+bounces-14673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D3A0968A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 16:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F259D3A8C41
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 15:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F266220A5FB;
	Fri, 10 Jan 2025 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rsi/b626"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA62116E5
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524672; cv=none; b=FVmpjaovQf1hpaxXZxwhmO+Duc5ynHCgrOtYnz7IRxKaq7EOSrZXqoTCBPUVXL7CFj4EM7gMryarXeIVki7kn5mCfogYJcF73EOWtH6ZNOFsFz4rhLkILOi4BNnGjidype9UXl41KeqWEpBuhsRSsw1p19KkK2uTKdSqNJOeo8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524672; c=relaxed/simple;
	bh=6DaDBZIm/3CM80d07HZC6w+Yw8jRDJ/X1ogR7d+iVY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwLdIlGxiPV0NRH3Y9kVZli6F1zg80W+bpS19ruMwMmS3kwhTIgSd+9JLPNmk0/bxDFBUHBaaXZn7PDQd+6d3mxmb08+63O9Tc8ZBW3733M8rnhXQ0DO7You8HxYBABXUxOhV/Fi4D2Sp/8K7vjjqplNLBjjr2sRmuFpQuaQ7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rsi/b626; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so1936322e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736524668; x=1737129468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DaDBZIm/3CM80d07HZC6w+Yw8jRDJ/X1ogR7d+iVY4=;
        b=Rsi/b626L8rz2RQ+lL8OUxszz3N7XUz+yarW81GKYplgujA6GsFe/wMY58GZ1ZCEQz
         zS2EX6BoUMyFZ6x248yKMyvixSoAGInpgroWk4TBEuEwH9jTmMHBSIB1MAvjSeWDgqNE
         WfXpcE+n1kwbsvoVXIsTKudOFrz45EkY1efECL+t8JN8IfgbpoAZvS8VOarHrYFpTqGj
         6ZSaiHMNFHKQ24wHs8fTsUhxx1mzAbtY6f/9/TX8QfgnZuqeDTHsRrzRQ7v2+E3v/9fe
         sOQwSTjn79AplT0+T4uQIvN4NCiynJBIW2t7JKdJ4urVx4djghmE2yYBJRnF8PFA40Bl
         MN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524668; x=1737129468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DaDBZIm/3CM80d07HZC6w+Yw8jRDJ/X1ogR7d+iVY4=;
        b=Pt3JdAnP/6w4jcyQISFsVX9+2b+tDKdeGQFLRjlCLaFYohFu2NWhLDrvZoxovmlmMg
         tBHRhQ1PQRJ/wj0TRLfXWjapQiSPJ1dPgZoSdCZJJRgg7Lqnw1/UnGI0QXm6v/wg+G6U
         eK+NystxDYcl+W9IYiEWYAmSwuHZU2nbWIGH7eiaMcGVBdXwxRVhsjG7snTmxWrly3pH
         BHo6BG1YxJLRUaXdaW1x742IEKAi89jbr6RLkSymvHbaWsTtR2TAErJexrHz6L4ZMMo0
         A02DluGQ4qTcuxkl0QQcCj/HePhCGnCzZlALwMbEJ7V2RJf9DRIDmvd9mJ50X7ykbI0M
         DqAA==
X-Forwarded-Encrypted: i=1; AJvYcCV38PB72ugRBHdBUdfOMRrsaDC/Q5b/dBEsYSeW7Gm5NBwsLVSZBiC2YOJsaZO9xZByQKWkY94YBHbI@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0UCoYbN9ZCLo3c4Tz5/gzGZLsRFmGNOBu4L9pftmPyH2QdEx
	mq+VE4hPlmrPS7dKqmAX7ETNaFtt8JBW5K6N4rEY3kDorVj85rm7brBbiXvJhoojxW20ow5fJsF
	8s8kdXeZb1hKzxJ83+7R9rmURfyvSGZNHMNs85w==
X-Gm-Gg: ASbGncsbD2aynz8k4FG9Rn7P2cRtnJrZDOmPsSgw6KH7iqdEJF98zXecgQav0TV77A2
	6PyY46Q/WNCwlu8oVf/lJsBg70hSvEBDboWSutrVrUjJlF+5+OQmdwLg39lC5lrCSUHuL
X-Google-Smtp-Source: AGHT+IFpm/x6dtbVRhQVXgtNXsgzeEPmueRvdr1m2S3LT4kasSyM9XX2sMRujD3QiB4FPvNdXHXYxSmxzKfrenahp/o=
X-Received: by 2002:a05:6512:138d:b0:540:23dd:2139 with SMTP id
 2adb3069b0e04-542845d322dmr2921448e87.29.1736524668550; Fri, 10 Jan 2025
 07:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB1603C49CC0A3B2E9CA3C91959F02A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603C49CC0A3B2E9CA3C91959F02A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Jan 2025 16:57:37 +0100
X-Gm-Features: AbW1kvYKO8FKdvdyk7Ib1dPugjVRl0bgtCMB54OzWblKP9rGDht-8VDm8W-5cvE
Message-ID: <CAMRc=Md5NcJAitNr-4Oma=9HCfuwM1CBbgrfwE7xrocx+1ZZZw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 0/5] doc: improvements for ReadTheDocs
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 3:28=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@bgdev.pl>
> > Sent: Sunday, December 22, 2024 2:08 PM
> > To: Vincent Fazio <vfazio@xes-inc.com>; Kent Gibson
> > <warthog618@gmail.com>; Linus Walleij <linus.walleij@linaro.org>; Erik
> > Schilling <erik.schilling@linaro.org>; Phil Howard <phil@gadgetoid.com>=
;
> > Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; linux-
> > gpio@vger.kernel.org
> > Subject: [External] - [PATCH libgpiod v2 0/5] doc: improvements for
> > ReadTheDocs
> >
> > One thing that this project is missing is nicely looking, accessible an=
d
> > automatically updated documentation. I'd like to finally address it and=
 replace
> > our static doxygen pages with sphinx docs.
> >
> > I spent some time playing with sphinx, doxygen, breathe and exhale. It =
turned
> > out that exhale doesn't support doxygen groups and I really want to hav=
e
> > them for the core C API to avoid having to manually assign each functio=
n to a
> > specific module. That means we must use breathe on its own to integrate=
 our
> > existing doxygen docs with .rst.
> >
> > First four patches in this series address some issues with C++ and pyth=
on docs
> > that became apparent when I started integrating sphinx.
> >
> > The final patch contains all the stuff sphinx needs to build us a nice =
website. If
> > the RTD theme is available, then we're using it, otherwise let's fall b=
ack to the
> > default theme.
> >
> > Eventually I'd like to extend the documentation with examples, descript=
ions of
> > gpio-tools and DBus API etc. but first let's agree this is the way forw=
ard. For
> > now, the docs describe libgpiod, libgpiodcxx and python APIs.
> >
> > I allowed myself to publish this branch on RTD for testing purposes.
>
>
> Is this https://libgpiod.readthedocs.io/en/latest/ ?
>

Yes, I keep the WiP public on readthedocs. It's changed quite a bit
recently, please (re)take a look.

> These look really good!
>
> There are only a few things that stand out, but I have practically zero e=
xperience with sphinx, so don't know if these can be addressed or not:
>

Yeah, I'm not an expert either so I want these docs to at least be good eno=
ugh.

> * Class __init__ functions are resolving Enums back to the base `_ext` va=
lues and I don't think we want to publicly reference that private module (s=
ee LineSettings).
>
> * Enum __init__ function signatures look raw. I suppose I was expecting s=
omething like https://websockets.readthedocs.io/en/stable/reference/sansio/=
common.html#websockets.protocol.State but maybe that's because we don't use=
 `IntEnum`?
>

These should be fixed now?

> * We're documenting the `LineRequest` constructor. Ideally users don't ma=
nually construct `LineRequest` objects. The __init__ docstring says "DON'T =
USE" for this reason but the class's docstring is being used in the generat=
ed docs and does not have this warning.
>

I added a tweak to include __init__() and its docstring in .rst.

> * Is there a way to generate links to the source code for the classes/met=
hods (the websockets docs do this)?
>

Ugh, I don't know, I spent a couple minutes looking for answers and
none are straightforward so I'll skip this one for now.

> None of these are huge issues and can be worked out in subsequent patches=
 IMO.
>
> -Vincent

Thanks for the review!

Bart

