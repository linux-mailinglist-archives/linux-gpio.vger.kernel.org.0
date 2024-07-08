Return-Path: <linux-gpio+bounces-8097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566C92A319
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 14:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3131281214
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C122B84E1F;
	Mon,  8 Jul 2024 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLf5FlBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B682D6D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720442618; cv=none; b=JghDOnKrJXKnOmFkv3z0ukE8wucWkZYNMQMZ6EU++6dR6fGSX6SubCs1TGfiHXBSbMhuq7uLomTCVodzuym2KKM8Xf0M/CLqiR22BO3KG4fvCkXu75yVP7pI538U28idl6uazU1gzfw+fa/oY9sJPHzytZ9CnzdhP7tBzbt9uhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720442618; c=relaxed/simple;
	bh=SZ1UNA7t0ZsPTsUrlqpusQ9waDlpeJgM9uvcJComKP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/9zdNHq6JRJQ9jFxfkKT+JKKlghTQIURgalHzuyXK3atcFpvK3zwggbH3nMbpIF/nsskiyRhGRoxSOAahEUHfLOvkjGjVV8JrdGOKmc9Aj4FMMr2dBtL+grBbuewOtN3yixnxTJi8AzNcFz8TUb4Sq95v2pfFYFCJ3CzZ6u3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLf5FlBc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b09cb7776so1814269b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720442616; x=1721047416; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xwg8oQ5pwaVDppWz8HawMxLWuQpxm4K+6gTKuwtimFw=;
        b=nLf5FlBciFRrOgc0PxLNHV7IQqwDMNaIQVtOZNSeGS1ZG7+O6SY54hkueKFe9TWGXZ
         z6o4Jo8woTLYFigR56jFyj+PqjOO6ousAaI9ENBrYKqTuZk+xTPz6w6hjPLj05Ab4BHA
         SQ8hEe646KBP/h06/agaznf1JFsi/rpheQNCqKEf9rOL+geniwM+RGP92aJ0QTO2FcLk
         3VYkhTQQ7fl+NVRZGHC9DAfbr877Is9ViCy28ZRlbhBtbn2ZdfMQT6YupEDla60CVAo8
         25Tc5Cw8Dd7c+GH7FmnSoMJtGUqiVJUJjI3ahfewcuT8zVE3UYMMkDZzfbmmo5SUCwLm
         AS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720442616; x=1721047416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwg8oQ5pwaVDppWz8HawMxLWuQpxm4K+6gTKuwtimFw=;
        b=DVn/ZiBQufKjj+Mpi5htSIVYQ9pYAIAYqJ5ePBbBDYZjKDdZVhf7G3Im/p6HrL2M6Y
         lXJtDZiPfXeJ163a4W0wttj4jRqzIbh4hOyrwTQuoTr50jQT6ZbaSgKh25X3uXzRm3l9
         uhwGwYLM+37CrqESvXoLdtA3SmNLtOVr4mw+3OsdHH1T+/sZOfOztlmU+vKhWBl0CwKs
         RuuAax0iaXlHykO+nJuhtoPXPiUQArkcLQXw4jCvt5ghOxgFNEZUiX1POCRAKVsCKauK
         5YZxB8XAN1IBnVZmFUJSw49gN6QaNCnwakqrAdvtEOTXyG4Ril2t21eHn9ICpbgOl6xN
         U49g==
X-Forwarded-Encrypted: i=1; AJvYcCXkKjcFGeTm1vBFGKMvjXLi4CsJfjOIaPOl030Q6CV6vNeNrJ+dwbzv+ObCoTrFyZiZ8SBkvZOiWLJYtnDvsivkb61A7i6R7CmENg==
X-Gm-Message-State: AOJu0Yzo3PyfwvVKZaQhjrHIXynjr21YXW0+hZ84TwfMIcMtyuoToE+9
	8fASv2CzUsSXRMgttr20n98cbJCSBWg5+xx0XLydO2HXkIPpeQuf
X-Google-Smtp-Source: AGHT+IHD1p3x1BxO70Q/QLLEQBM8LU50dsqOCeNgwB029qvb+FsV9AP84T9L1vRoTFHN3DSZtYrs3Q==
X-Received: by 2002:a05:6a20:da91:b0:1c2:8af6:31d3 with SMTP id adf61e73a8af0-1c28af635e6mr1541723637.10.1720442616477;
        Mon, 08 Jul 2024 05:43:36 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb842fabe8sm25381275ad.142.2024.07.08.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:43:36 -0700 (PDT)
Date: Mon, 8 Jul 2024 20:43:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240708124331.GA255037@rigel>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>

On Mon, Jul 08, 2024 at 01:48:11PM +0200, Bartosz Golaszewski wrote:
> On Sat, Jul 6, 2024 at 4:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > >
> > > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > > Generating the latest documentation on readthedocs is broken as the
> > > > index.html generated by Doxygen is now being overwritten by one
> > > > generated by Sphinx.
> > > >
> > > > Make Sphinx generate a differently named root page that does not
> > > > conflict with the index.html generated by Doxygen.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] doc: fix sphinx config for rtd
> > >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> > >
> >
> > Btw, I ran across this while updating RTD to v2.1 - their default build
> > config has changed since I last updated, so that didn't go as smoothly
> > as I had anticipated (the plan was to switch the branch the generation
> > uses from my fork to your github repo, but now that can wait til v2.2).
> >
> > I am also looking at reworking the documentation to use Sphinx/Breathe
> > to generate the html from the xml that Doxygen generates, and
> > incorporting documentation for the Python bindings, but looking is
> > about as far as I've gotten so far.
>
> YES please! We really need this and I've had it on my TODO list for
> far too long.
>

IIRC we last discussed it a couple years ago while working on libgpiod v2,
and then it dropped off my radar.
I was looking for something I can work on from time to time in small
chunks, and it seemed a good fit.

My current WIP is here[1].  It is generating C, C++ and Python docs ok.
Still need to workout how to handle the Rust bindings.
Once I'm satisfied with the outline I'll back fill some additional text to
tie it all together.

It is currently generated by libgpiod/sphinx/docs.sh, which is a
rough approximation of how it will be called on rtd, with the resulting
documentation entry point being sphinx/_readthedocs/html/index.html.
That is run in a venv with sphinx and sphinx-rtd-theme installed with pip.

It is totally independent of the existing doxygen doc generation/make
doc, which I didn't want to mess with.

Cheers,
Kent.

[1]https://github.com/warthog618/libgpiod/tree/doc_revamp



