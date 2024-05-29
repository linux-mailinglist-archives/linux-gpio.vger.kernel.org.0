Return-Path: <linux-gpio+bounces-6853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346D8D382C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2997B25CB3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1AF1AAC4;
	Wed, 29 May 2024 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYJYEGS4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761421EA84
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990287; cv=none; b=fVbXAVkTzx95QfiogzlAjodpCeL/TXeuDU5QpRqfVmhDBab4cjfI21shKlAj4Xy5PWD/69AyFW3ZSHRHMTK+KSIZ9OxsxMKI7JyGPE/PeFVSAoaIir3vRtr4lVzIxcRiAy1eRe8LDpV/+q7wPItbLE8l2faTxNjI+vY8jCaFHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990287; c=relaxed/simple;
	bh=Py4/6SLGYg+wziqE7zSauXdnCY5u9mIbGU1bBBjwhT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUkK9XeExR7Nx+HPk8XzKGFYASrW0odKfmMaKL5Pr3QxRX4WZ7DYJEJ1xx7M+Bsc+T+jLePJDXNh7KzkyXSIXJ5E/Iuns+JaBalhsjb9PkGEkVARzRZI3IlOF9s4+fuSmmOkVtVcTW5eK+EPkfKHOtea703nKGug72yZPxPt/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYJYEGS4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso253963a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716990286; x=1717595086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtJ1YWEPn7QJHR/zyAv57b17Y4CsGlLD+2HLnqEoUBg=;
        b=bYJYEGS4RTD9Vn7DQLiEgxCoPYCRUG+iumJoBI/Vutht3ld3IH9BpKe6jgXiy+KFTX
         UppBXpAH4Xacq16F8RMZtFom1ajAr3pT04xKxI/gDKOlr++7vjhWfLp/ND67Dl/xSePa
         fOAPL/AMQhpaayA0gGdP7UyjnxnEiVrE807zAeqCsKfA4WiRydRhiJF0dnK6zhS8a/8Z
         IvwEFQDyOilnvkaxRK3gWIBFo2inEmRtZmistukR+euZZ75qzPw55IKGvMG5HhohnFdj
         w95sxZ/t8gt4sOb+I/80x7bNoaX+dCoz/hBSKzOiAbvOdCXKH61zdFuZZNfndf13wGHK
         6h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990286; x=1717595086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtJ1YWEPn7QJHR/zyAv57b17Y4CsGlLD+2HLnqEoUBg=;
        b=cN4AE2J7CilFft5BKX7fE03Nr4FmlwQnKZ8OFJvZo9zyunQbgo4po6zqqjItEVuTIN
         SZoKxYravRJ39fuasu9o17ik33O3vj9+YX1fXXr6AJ9Q6KwziL4LKiRK59BL/Yp4Z3ec
         g835A6jFweqBeh6QntO3TCBvDKqzaUsnhMQt5hgssnMHy0EpTFCplc7ADO1JI/Vn1JZ7
         cJl/rvEJ+kFHbla89SbrV0ROOi2l7HZBoDJKPsBZe9xsHOQb7qcPQmx+DOPv+LVvxJMx
         2MWjJfeWwxyNYfBOXVDH+LDWjf2HhC6kaeoapYm/Q5xnS8DEXBF0CTu4c5RcpDMuYgbE
         8pEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS2kqsykXV6KRN+PIZZ8VR5OvSbPuxOTWwvBRBj2VCEDPZ+leXCViy8Fc2dxFnbpNKjw3HqgT6vc6q9QmQ7EAC8dwVN5pbI4Hk7w==
X-Gm-Message-State: AOJu0YyQk+AGtid387rXpY86PYxyoh0Ks2eG6GOagQgPQX6bV+8Btb/L
	p+B7idds4aG8EBQEt73hHRBodtJnxi6Vy+CybRIcPzIRxxdUeHrn
X-Google-Smtp-Source: AGHT+IHcl6TzrV2vy8BkvU9rq3hAmUV+4plrxO3CYWgyTe3IpkSN3MW0fpaICRe8RxcJMKjQHooAfQ==
X-Received: by 2002:a05:6a20:4387:b0:1b1:fc7b:bc9e with SMTP id adf61e73a8af0-1b212b75363mr19629772637.0.1716990285606;
        Wed, 29 May 2024 06:44:45 -0700 (PDT)
Received: from rigel (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c759d0bsm99452525ad.41.2024.05.29.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:44:45 -0700 (PDT)
Date: Wed, 29 May 2024 21:44:40 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240529134440.GA204223@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
 <20240529131847.GA191413@rigel>
 <ZlctJNXjc5a-LYCg@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlctJNXjc5a-LYCg@smile.fi.intel.com>

On Wed, May 29, 2024 at 04:27:00PM +0300, Andy Shevchenko wrote:
> On Wed, May 29, 2024 at 09:18:47PM +0800, Kent Gibson wrote:
> > On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > > > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > > >  assert_fail() {
> > > > > > > -	$* || return 0
> > > > > > > -	fail " '$*': command did not fail as expected"
> > > > > > > +	"$@" || return 0
> > > > > > > +	fail " '$@': command did not fail as expected"
> > > > > > >  }
> > > > > >
> > > > > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > > > > should use $* there.
> > > > >
> > > > > But why does it do like this?
> > > >
> > > > Read the link[1].
> > >
> > > Okay, this is only for some debug / error messages. Still if one wants to have
> > > clear understanding on what has been passed to some function, $* is not a
> > > correct option. Also note the single quotes, shouldn't that protect from the
> > > arguments loss?
> >
> > That's right - I was only referring to this particular case where a
> > string is being constructed.  Wasn't that clear?
>
> I meant that if you want to have this knowledge in the debug / error message,
> you will fail with $*, that's why I consider shellcheck is incorrect.
>
> Ex.
>
> I have
>
> 	foo bar "baz bar2"
>
> and I want
>
> 	"ERROR: 'foo bar "baz bar2"' failed"
>
> type of message.
>

Fair point, but $@ doesn't give you that either:

boo() {
	echo "star '$*'"
	echo "hash '$@'"
}

boo foo bar "baz bar2"

gives:

star 'foo bar baz bar2'
hash 'foo bar baz bar2'

Is there any form that gives you the format you want?

Cheers,
Kent.

