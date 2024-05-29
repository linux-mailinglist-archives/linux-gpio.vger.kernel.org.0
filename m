Return-Path: <linux-gpio+bounces-6844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC238D3769
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97645287299
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B05FF9EC;
	Wed, 29 May 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwCzb8d/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D55F12E6D
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988736; cv=none; b=Q8dzq33Kf3N/808wxaaEOdJ8JyHcsdQ4LqMJkmHd8cL5/uZ806RzbjEi6OrG3oTVrfEb3t012l969evtG8lWMAvDKnqpkVQ/VjbGsMDoHp5kp9ZXnuoAzhRM8GaO9GQrQY1IponveCA+0niN/1DvJ28rVEHQjGoM5e6i89CrMf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988736; c=relaxed/simple;
	bh=X3G0RqmUHHFPOVKQLL5C09HyFMDhF7CSx2vt9gIJBjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Arh15b5lThafuB+2E/Bb73f6lTx1zl83BD/5VDSBrXEaBH7e4vd7l/lUy+6NTlcbGeBlTJTRhZBLOiyvwbrGWi7Bm+y5Aj12Qf9GUIGqR5Wq22DnWV9YsDOQZ3TkX5QTXIREGG5I6FzIC7sTyugUOOAwHXMNJ3Mbmq6B/mIfsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwCzb8d/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4603237e0so712766b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988733; x=1717593533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkfvzk9YFm3QoUkqPDvLEnQ1DWod+pIfY3lb/O8RpNI=;
        b=kwCzb8d/5AgOsvigpq4JsPAKUaSklKIVAxuZw0dT/DSOD/QLSGZj9BJGGkSAfCglLR
         2ecr+QhUcZ9EOhFn7GYQXTVUHqvz55xx61KNBDV6JlWUougwnexl+h9HT3OHHVsR0yyb
         mxTNOkeXU9lBirOOtn3VZ9UpWiX+41YJimgD9P/avueqg8/FHeDHwlUXzXom+qBEr82g
         oXHcIlkg4GlS9pauPYBPrv6ydKXNsRFCrnI6Jvtjjt3K44m5KkSxIKb1Yttd18MmwZfu
         ZX4aD48eHT1v90535JZsAKbuOca4oSKpVVsDYb4Ux9qX6tliZT66aOrZ+M12kOpnTCy3
         XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988733; x=1717593533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkfvzk9YFm3QoUkqPDvLEnQ1DWod+pIfY3lb/O8RpNI=;
        b=PWD5pjrx7R8OsW6VHJeozcKq0G5hzQ1AbJbVxmjWhrL6VDpG+eXunsXYbFLcCNxhSQ
         SbcOyusnAHoc/+YP2KRT/y5fCe0jtMDH23OGCYX29kn0O/dXFCWeh7r7Nx3lvLkQdVQl
         eiTEYIT827buVVIZ7VHwUbIoEzLGH2JJBMBNYPqdV7x9FHPJyZZ05OrOcjCI+Jw1FOgu
         aBr1EzmNcO5M5IocUzp5WF1uGxN+bAjg0Kq4he/ucCbzW5A3nZPELhD34e7wP9FIWCA3
         /sjurcD4HYRyvF2TmJUFWPluTTL9TGNWdPKO484u7W/KXS+b+tab5veYGBA7bDeqq7tm
         KfbA==
X-Forwarded-Encrypted: i=1; AJvYcCXfuI1a4So+ve+JSc0iH42WVz3qTPKhySpo/UpphBQgH7BGKbCCCCgoxj3da0pBgajM/L6fHqQbLguY2XSvObxNRBCB7ihXW1eXsw==
X-Gm-Message-State: AOJu0YyLjjUYpRej3LCx9f1bfl8IQbrufxz0WReF3bYbNWvPYp6E2+u4
	R/B9rARmgXhYeYcgIjzuOn1YGy/fTqo2g6vuCnGAyWsv9RAePUqNexCz+Q==
X-Google-Smtp-Source: AGHT+IH9U807wd7HREZvZ54zvUhVuTDUNXvxiLN98HsR0kaLvDX9jKWWsfrbC4F5dpu9nemKoUYxAQ==
X-Received: by 2002:a05:6a00:1d98:b0:6ed:4a97:26c1 with SMTP id d2e1a72fcca58-70202bfebbcmr3015038b3a.10.1716988733381;
        Wed, 29 May 2024 06:18:53 -0700 (PDT)
Received: from rigel (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbe9f6csm7991060b3a.127.2024.05.29.06.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:18:53 -0700 (PDT)
Date: Wed, 29 May 2024 21:18:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240529131847.GA191413@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
 <20240527233910.GA3504@rigel>
 <Zlco4cBEWJVrnVU2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zlco4cBEWJVrnVU2@smile.fi.intel.com>

On Wed, May 29, 2024 at 04:08:49PM +0300, Andy Shevchenko wrote:
> On Tue, May 28, 2024 at 07:39:10AM +0800, Kent Gibson wrote:
> > On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> > > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > >  assert_fail() {
> > > > > -	$* || return 0
> > > > > -	fail " '$*': command did not fail as expected"
> > > > > +	"$@" || return 0
> > > > > +	fail " '$@': command did not fail as expected"
> > > > >  }
> > > >
> > > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > > should use $* there.
> > >
> > > But why does it do like this?
> >
> > Read the link[1].
>
> Okay, this is only for some debug / error messages. Still if one wants to have
> clear understanding on what has been passed to some function, $* is not a
> correct option. Also note the single quotes, shouldn't that protect from the
> arguments loss?
>

That's right - I was only referring to this particular case where a
string is being constructed.  Wasn't that clear?

The single quotes are within double quotes, so aren't they just part of
the text in this context?

> > Because $@ is an array being used to build a string, and that may not
> > work the way you expect.
>
> I think it's the opposite, $* works in a way I do not expect :-)
>

When passing arguments, sure.  Not when constructing strings.

> > In this case $* is clearer as that has already
> > been concatenated.
>
> ...loosing information about which word refers to which argument, yes.
>

It is building a string, so arguments are irrelevant.


> > [1] https://www.shellcheck.net/wiki/SC2145
>
> TL;DR: I consider this is still a bug in shellcheck. But if you rely on the
> tool as on the ruleset carved in stone, I will not die. Just a remark to
> myself "even honourable tools may also be broken".
>

If you think it is a bug then raise it with shellcheck.
I think you are conflating cases, and I agree with shellcheck on this one.

Cheers,
Kent.

