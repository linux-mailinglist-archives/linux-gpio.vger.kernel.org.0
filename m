Return-Path: <linux-gpio+bounces-10781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B787B98EC09
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 11:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E6E5B21184
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 09:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B5D45BE3;
	Thu,  3 Oct 2024 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BQRM0Dkn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB112C7FB
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727946409; cv=none; b=TFK6/pnIw5C747d6/v1YBgq5liPxsMMMlfSa9/9JFPOko6TMUWQ6VBg/ByOPRvSCMYqOuf5kG722ICZCmAdbd2P4SSNmLUPEk1Im/+TIHqzcUnbwnOf+HrlsF2JJLdknpCAqyo0+Lb9txbg2Y9nXoGwU4skN5iDz5WfWRY0Bqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727946409; c=relaxed/simple;
	bh=BL2PYdVzOtTcc4q8Le9DigMyQmxy+5fXoa+egr+3OOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOZeBgiDMxvwiP/b+LGSj2p+kUBKG3QvzshFjFLe64aKsEBdEBu8B5CHonkjzAQ6u7y87sIEIdHU6Nfx7BNFxoOErarITVBtIeQpjZMM6NmvANnQQDDdUwe+NtYejK1x/9aQEoqo9T1c5tdFZVgfkfxGQ/3LYwfkfvLNDpSS4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BQRM0Dkn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so785614e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727946406; x=1728551206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfJmiQeXmiJQEVQb/2Y7fcdrLFYwcJJU5fEKH20qNLs=;
        b=BQRM0DknFId+ccX52zwP1C8m0H0iEO6soOUwrgSZDX9H1oT/55pLwywaNnosNIp1V9
         pA/teXe0RHCMP2Q5mNQE5EIOQL+3p9nGgoLgNL6wnVLjUZU3MyltDy6fJdOApslOpdP0
         hbpjtdBo5QYsFAy/BWodO+bS2O8tZmPl5HEs2AyoFxk/ELo2kLzsEVfs8q9ctO6MSDmw
         EbkJHJekcPAvTKJ2PmyOpvs0msJDYTeemtndW81JMKVPs2pxjKdmqDgwheIBNsAaJvsT
         Ycac3QqhfB+waGIuVsJcqO/59pzrNjxJYK7C/97mpRpRadJf9lRznvXmwYve7VXIocfZ
         WeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727946406; x=1728551206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfJmiQeXmiJQEVQb/2Y7fcdrLFYwcJJU5fEKH20qNLs=;
        b=Le12wT5zCE5oo+uyTwuZULIWlzCB1HliVAZIpFe20EwxBilm7FksjKwV9UfKfuk0mO
         oo2ENmwISNQ0JUFH8nnRGJhWplWcP6YAS0HCSMfYzIxMSFDA+l7TwM+ifMc08x/B9b4v
         m2MLbPsctGXFIeptaZJcLL5TKMzYwU/67QCjg8z8TJAZa4s9hd5AuCeH1QHOEtx50UVu
         LhP0YfzxlOTA7qCQGjj5on+0e6u9uRWJER6s2yeeKWFOrjjvP2JjSVEYeiaszf81eaxI
         HkllNUjsjNLxff/yRrtJFH5sAkWwN2MZWdjQNxmPIjQf7D6klrUM7of1WX0Lbi94J9xE
         9KxA==
X-Gm-Message-State: AOJu0YzSHRec5xN+5V5xS0fKQoUtEb2QewFfrwJ/v0lZL7riPvUEFBxv
	m63Fld/jwmTdVvki8SpO+3p5Ae0lktloszEBBes8sDQAAZUZ/AbsEf835AoX56lccnDNBKeeh4r
	qmgBqSQ6fu+t4EOKZsQhb5MDL7BZUl3yYYrVYmg==
X-Google-Smtp-Source: AGHT+IEgHIuyi+g709ZBg37Z41r1mPAVS6mzCvRCDmdVA+Uf5QJUgiAM9HJ7CvPwOx8tfVXDqYWFV48FwKnhjOVQ9bo=
X-Received: by 2002:a05:6512:1111:b0:536:5e7d:6ab3 with SMTP id
 2adb3069b0e04-539a62828cemr856169e87.27.1727946406102; Thu, 03 Oct 2024
 02:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
 <20241003032457.GA63612@rigel> <20241003033640.GB63612@rigel>
 <CAMRc=MfO2NB0jpzhHU-cU00zVesdofM7EUqd11xmE9sCVdBQ-w@mail.gmail.com> <20241003085552.GA236079@rigel>
In-Reply-To: <20241003085552.GA236079@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Oct 2024 11:06:34 +0200
Message-ID: <CAMRc=Mcut2sGzac6vN2cvGP-DHtgC12BXksTvmcQNBaf_VvpZA@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
To: Kent Gibson <warthog618@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 10:55=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Oct 03, 2024 at 10:45:35AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 3, 2024 at 5:36=E2=80=AFAM Kent Gibson <warthog618@gmail.co=
m> wrote:
> > >
> > >
> > >
> > > Why is gpiosim-glib being built?  I'm not using glib.  I don't have
> > > glib. I don't want to install glib.  But now I can't build. Yay.
> > >
> > > Cheers,
> > > Kent.
> > >
> > >
> >
> > That wasn't the goal of course. Let me build a vm with minimal
> > environment and go through each build option individually.
> >
>
> It was the --enable-tests that pulled in glib for core tests - despite
> --enable-glib not being selected.  I was able to build everything else
> without glib by dropping --enable-tests.
>

Ah, yes but it has been this way for a long time, the test harness uses GLi=
b.

Bart

