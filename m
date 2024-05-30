Return-Path: <linux-gpio+bounces-6891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E399B8D424C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A661F25350
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 00:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CB523B1;
	Thu, 30 May 2024 00:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAxB+Pcn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A436B
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 00:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028529; cv=none; b=G4eo3uLnFjqSlo7QfH99uTN2knJZAeDcUwZDhxaRMoBxMJJjZUovP6XVpbyAaSrvBFqJ9XjaHpMecIMgsY/l/B4DDi09yv9bU6ajigEEbLHPa4sXUhcaCrpUIEFMH+OBo3GwzuybpeZvCt8a/EQXZL0zHOP58yh5OTm6DT5JHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028529; c=relaxed/simple;
	bh=/CJk/MSFFnYVynWXYHi4jgztqP83S7+IGl/ezsUevuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrRUwJpQx5yyKFHionNqmLfCalpuJWlCBK93DCoGKqVvu/nDX3ik7+G8jlOnHJkK9kEEkuVCFgcrRiPfXDJ3OeaNXVBaDWBQZBETBEdhdVf/6bEDYdLopN8tFmotNnwC+O1q9JlcOKT/MPVMGAVd71Qw3lJxPmMef8U6piLlzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAxB+Pcn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f32b1b5429so2550705ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717028528; x=1717633328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqk/8IOcDe8yWSAFjeAkxJKrUSQ4Ia1D0lSyxJ9ddHM=;
        b=jAxB+Pcn3VHCSQSZwcJgbM1NNE1cNcXj1aVqZ8fruDZul2OCd80brxs1DaRZwHPdfa
         WmLzYYEbWCzdXAjb+6kGN90qdjku6skfbBn18yBq5JgnYSPTTbl16dHytJIEzmxiPJvC
         cGRe5nOhIH577Fe1JOdCYQyA2u8N8hdbgzjcoTCJ7en3rOwrXMs7p8OEWHSqffIBAh56
         OyP5VAUWcycUmQnmiF4HkiHL7z5YUNF8wDY9avST7P0Jo1d+Z92i8o4ZCq61XqwYQJQY
         LCYZ8/kcb5hHzGJhzIwt/9dZ/O6NnfYptFQW6MvwjjOVQjQh6kwQqZn8fOZuB6RiV6f2
         kSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028528; x=1717633328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqk/8IOcDe8yWSAFjeAkxJKrUSQ4Ia1D0lSyxJ9ddHM=;
        b=XI6jqeb5v1x6qE99xKd/y9/XKERWED1BuPSRD3E89tZJHm3/RHQie9JTlyC7yxp8Q2
         rCYHTvehP9pQNsE99ZQBfMysBcsuSSXKH7LevtlNkgqA+OwNvgCsTWMcdn2NzWnCIqON
         +fZyPZbgEaa1ewuznjGB1c3Qhjfj37Hixwkh0sdmkYorA3/iHh5T/X44+tCcGhDVOfIJ
         x3nM6UEqS/E107O0xQ9Vl3V/EVxLPmXv4m35H2rN4cwtfEAsaLjenYWcXxs+ThVdKAje
         NOB1cZawuR/DEcJNPZK6/+Z0lfe9zPtWrIIEMV4trya0SUfc8Dr+wn2zD/edx+RPYtHW
         RQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCUvKOvUIfHhWx8ezAYQYbiebyFQ0LJIyyphZxR3dMUuqL25sriqbG0rhc+pO/U4+699h/p4g95AXetrvYguBuwk96Ud5LWkPE9xDQ==
X-Gm-Message-State: AOJu0YwdhAt6JO+kQlN6EC0WzkizLeN2nOGkIaCjrR+VJ44BR8/R4KbF
	sCtbijAVhVoWlETNEMVB+PdDyGEVfXubGnxbkNna1b3hcpw4XNE6
X-Google-Smtp-Source: AGHT+IGBHChnuB7Do68/MP+qL8lxIzKjcD8ixQxScuhL6W+M7jnTsGgSIrpzwxPJYzVfpNV8hZudAw==
X-Received: by 2002:a17:903:1111:b0:1f6:62c:96f3 with SMTP id d9443c01a7336-1f619601140mr7739925ad.6.1717028527592;
        Wed, 29 May 2024 17:22:07 -0700 (PDT)
Received: from rigel (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f615010f5fsm4581225ad.200.2024.05.29.17.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:22:07 -0700 (PDT)
Date: Thu, 30 May 2024 08:22:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240530002202.GA33089@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
 <20240529131847.GA191413@rigel>
 <ZlctJNXjc5a-LYCg@smile.fi.intel.com>
 <20240529134440.GA204223@rigel>
 <Zlc8nBQIH89d_mug@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zlc8nBQIH89d_mug@smile.fi.intel.com>

On Wed, May 29, 2024 at 05:33:00PM +0300, Andy Shevchenko wrote:
> On Wed, May 29, 2024 at 09:44:40PM +0800, Kent Gibson wrote:
> > On Wed, May 29, 2024 at 04:27:00PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 29, 2024 at 09:18:47PM +0800, Kent Gibson wrote:
> > > > On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > > > > > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > > > > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > > > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > >
> >
> > Fair point, but $@ doesn't give you that either:
> >
> > boo() {
> > 	echo "star '$*'"
> > 	echo "hash '$@'"
> > }
> >
> > boo foo bar "baz bar2"
> >
> > gives:
> >
> > star 'foo bar baz bar2'
> > hash 'foo bar baz bar2'
>
> Oh, this is unfortunate. It seems entire model with quotation depends on the
> commands, printf makes it different, print -r -- makes it better, though, if
> one uses non-space IFS for it.
>
> > Is there any form that gives you the format you want?
>
> Yes, but it requires an iteration over arguments, roughly something like below
> (which is not yet what I want, but closer):
>
> 	for a in "$@"; do
> 		echo -n '"$a" ' # echo -n seems not portable IIRC
> 	done
> 	echo
>

Ok, we're heading into the weeds here.
The issue isn't that shellcheck is wrong, it is that the error message
is not formatted the way you would like, and fixing that requires
writing a function to perform that formatting as bash can't do it out of
the box.  That isn't a huge issue, as we currently don't have any
parameters containing whitespace, but it is something that might want to
be addressed at some point.

Cheers,
Kent.


