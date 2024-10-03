Return-Path: <linux-gpio+bounces-10772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AF98E8E1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 05:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC0F288280
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 03:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF2E20328;
	Thu,  3 Oct 2024 03:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGJV7hr5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCDE17C77
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 03:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727926607; cv=none; b=EgEUSYgraALoVBmMQRhfnh2vfVL+EbU1PPplZYNAeGvIPzmR4IuyAhlqRDplQvpECQfrEd+zuCPRwXlItOB9EZdvQijXRaFaUo33eOFjSLXesti8K4mbeKH9nGU6CK2NmvQzTdTLX7nyoHPtoYp0FUv3LxX9IBj7NrQI/4/2Xpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727926607; c=relaxed/simple;
	bh=VQK1iIi6Bx9X9iHa2i56lDRgh2XtvdSaQcPQ97/AYFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeBPDFWzsFBKH1SVM15jjfCUcYrwWfJvSNQH3tF12KnpWvYCqATSYJq6m2TE1wDmtU6g7crmblj0Se3clKHnykriv0uqAu4qZzsX3zKHsBx3M9zRJGat+hkwKcawLTWZLl67q+SbOA2cMWkRItr2l+WPPiVdaw0EpMO06QF5MpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGJV7hr5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20bb92346caso3433015ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727926605; x=1728531405; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EdPajD6j3bJ2MzSb/hG2HMVzn30Oq1J1X2b8Gik2lLc=;
        b=jGJV7hr5oaI80YMToxSMhOaQF62pUzGZ7aeQ9tewJjaLuyPotdNTQo949m5h+W5eM6
         ETx6Fb2b6Y/0P+/1+gWdqkbZQAZk49rqmzVz6c3zzJ/+XTkRO1HOrm7fFH+fH6WfdEHP
         UtFLcNFIOa+TMW1yl37g2cr1M2yG+BrTxABGuqm76KFMK3wcboO7/irQzkEg3pqcyjrC
         eDeHkobAPcbiFS1e6OHFJUyTdUxHIXCN8I4xou3w4P9vH1ZmIaYNWXVaOzUN4Xl4EoQJ
         8YdP4Ms9Wu24zHvc9q2DH7+W1ZA5ADi0TSSu30PrAACWSdvWFOUu4mimFAGs6tU/qzNi
         UIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727926605; x=1728531405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdPajD6j3bJ2MzSb/hG2HMVzn30Oq1J1X2b8Gik2lLc=;
        b=o/W/4wpWvPG+W23E1nu3wt9cEBqGJ3YGss9uB49iRzs0sMA37hzAkOB5ePFGq/+7P/
         yhm0AMfQ4uPGgCLwx1JE+Z4APk80utKn3RQNpKVU6FtKseOA1yLZSthLdTZ46ISIZjHJ
         fEIufir9bKJFd0biUz7/Iq8mnRPwO11RV6cKqAAb6R3AvB/9q2UaMIrcAaDS6PfKtD0E
         0FDWmZF4LUlUeY5l64OP/Y3Jn16WR8mmPNVOUGB9iyF4WibzyXd6ByMgv/vTMzc8cxRL
         fI3VKgTHKARu4nlwLXz7GeKJovUkBx9KkG5XWUwdwIgOOFQiXXSqajzXxaYu3UQ3K8mV
         /qXg==
X-Gm-Message-State: AOJu0YzFRugqqgbzrRV2kEOKxnSTZC76Ytj1N9oKWQO8aJTn7aE4cQKg
	Infba3L+wYp62NI1dQgpPM+CHGL0BUOLZgVL+HGxJF5Bz0k59lPQIaxflDTl
X-Google-Smtp-Source: AGHT+IEfdJhbcLeTbAEUnffoVDngB1eFxpQY1ERParp4cfXFPLLB9Y/1FA2vNYj+vBHMEJEmLFvEYA==
X-Received: by 2002:a17:902:da81:b0:20b:a8ad:9b0c with SMTP id d9443c01a7336-20be18c544amr31241335ad.3.1727926605065;
        Wed, 02 Oct 2024 20:36:45 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beef8ea3csm474035ad.129.2024.10.02.20.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 20:36:44 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:36:40 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.2-rc2
Message-ID: <20241003033640.GB63612@rigel>
References: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
 <CAMRc=Meo2ObyrpeYQ0TGS5Xhy6_hG7SvGdmrOvX_vVz4R7JogQ@mail.gmail.com>
 <20241003032457.GA63612@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003032457.GA63612@rigel>

On Thu, Oct 03, 2024 at 11:24:57AM +0800, Kent Gibson wrote:
> On Wed, Oct 02, 2024 at 07:50:04PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 2, 2024 at 3:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > I've just tagged and pushed out the first release candidate for libgpiod v2.2.
> > >
> > > It's a big release that - next to an assortment of smaller
> > > improvements and bug-fixes - brings in a big new feature: D-Bus daemon
> > > and command-line client together with GObject bindings to core
> > > libgpiod.
> > >
> > > It's in good enough shape to now focus on ironing out the creases and
> > > make it available in the following weeks.
> > >
> > > The tarball and git tree are in their usual places[1][2].
> > >
> > > Bart
> > >
> > > [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> > > [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
> >
> > Well, that wasn't very good, rc1 had a build issue in the tarball. I
> > had to fix it up and release rc2 which now builds fine in yocto.
> >
>
> I'm trying to do a build without any glib related targets:
>
> ./autogen.sh --prefix=/usr/local --enable-bindings-python --enable-bindings-cxx --enable-tools --enable-tests --enable-gpioset-interactive --enable-examples
>
> but I get:
>
> checking for glib-2.0 >= 2.50... no
> configure: error: Package requirements (glib-2.0 >= 2.50) were not met:
>
> Package 'glib-2.0', required by 'virtual:world', not found
>
>
> Why is glib now required?
>

Similarly (after commenting out the GLIB and GIO checks tripping above):

Making all in gpiosim-glib
make[3]: Entering directory '/home/pi/libgpiod/tests/gpiosim-glib'
  CC       gpiosim-glib.lo
In file included from gpiosim-glib.c:9:
gpiosim-glib.h:7:10: fatal error: gio/gio.h: No such file or directory
    7 | #include <gio/gio.h>
      |          ^~~~~~~~~~~


Why is gpiosim-glib being built?  I'm not using glib.  I don't have
glib. I don't want to install glib.  But now I can't build. Yay.

Cheers,
Kent.



