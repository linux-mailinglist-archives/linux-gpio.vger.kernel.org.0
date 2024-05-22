Return-Path: <linux-gpio+bounces-6581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E803B8CC9F5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 01:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5028FB20C08
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 23:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEC314C59C;
	Wed, 22 May 2024 23:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhWzU1L0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A92E631
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 23:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422239; cv=none; b=IGEUke+5oD7Dh95cfv6E3E0MkNiKhs4X4rih/gxhDe/v3SDJF+NQAZCiIWWUL24KR+JRK1vxZiclODi+Cd2DnfsBOpBHC/NjHo86mco+3hbrW1FBTgO227O38SIN/2s0WyF5o7boWglnUPNlbAt5ssMvLps8XDCCDR9aCGERfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422239; c=relaxed/simple;
	bh=9wkrwYxU/q4ryX236i4D0Xr2J7Li3OkaZcQxJVazTy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNREhhQIqlfYT+aPzooAJCLh8FIWRGBz/o+F+/2/pZzqV9DcsIGxoPerk6Y4DdbQwd3fFTntXAwZrkVlcA5uM+VFFcnHgT7CFJ8XMlBBs8LiWq8N/xwM6nZGk1GeuspuBQtGdlmsISwDDZ7rH6zggeMBdgUwtCXVlXRhvBifnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhWzU1L0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1eeabda8590so13836695ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716422237; x=1717027037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZFfKQwqr6s5mri92g+Go6fHM7bFTVrRjo2sNagy+cI=;
        b=EhWzU1L0XFo1wnyaNxE1qS+PK/gyVhTiPOowKjjJGX2LRW6SHt0PD433PFknIUNSdP
         lLzY2lbE2vq4Ap5T8Wyb/RAshgpMeTi9vKki9f2W5aAhAkSMWjlyUO1vfra7rd86gsDw
         yweQbKh7QV11AznuKXTPBdOBaDDR7t80ttvf99owB0fxnI/0dAf+F8+8pGLUVJSCArk0
         wmhPO/Wu0QNM6exNHvsFeeZf0c1p8NI3GCjP0/Hk8+dmf4W31bxzLZ/q38AA67QvyHzx
         tcqOjmDjDAVT4o3M5/Js58nt5mzXCL95GMV7cbVwnpKg/8LsyRyVMu37UVVSaqTgcCCq
         8UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716422237; x=1717027037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZFfKQwqr6s5mri92g+Go6fHM7bFTVrRjo2sNagy+cI=;
        b=SKOOaf2ngfxKS+y0OsveezfEM8XDyVLXFv1ZYa55yuard0U73CJj98D2k4AV5TVtM2
         ICn5vDUb6uJavIvgCs+L8VlhK8zxF35oKNOFotHGyN2/LQpFpFQJ037Upn1OlFHS6kab
         E7G/NKaKs8dBeIKcwDdBvFTtkzEJWqKyxvSiL3EKJtCpFCy6ZH9JJY+JchKKYWQZGVZW
         xiXYmmgDgQtyfWeXcJTvmyJiunDwEu4nYIOnB9M/yj80NoGb6CtiBOSOSuEDJ5/sRFab
         YDuHil3bWeV0LuykRgBOqLicAKwUqtsnmCef72EYQwDwAIC7G8dXlhcDnv6EkwexQ2a9
         ATpA==
X-Gm-Message-State: AOJu0YyFXh8zvAl2FotWMvtMPtQ4dJjZ8nZNWlLSFUCVrAbEyj6G8bk3
	JoGGQnvsr57rblfjk3gKYqDirmFG59dKrLaa91E2y7FuOOLO2lS67p6CUQ==
X-Google-Smtp-Source: AGHT+IHAfNMWPCQxTTauLmYLvlGdWozlAgPXWeOF6VowgpdAxEGS/h9BOH2wAPw0G7IxvpyBzrjAcA==
X-Received: by 2002:a17:902:e543:b0:1ea:b125:81a2 with SMTP id d9443c01a7336-1f31c9e4b34mr43660825ad.53.1716422236821;
        Wed, 22 May 2024 16:57:16 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f338e23fd1sm3510565ad.273.2024.05.22.16.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:57:16 -0700 (PDT)
Date: Thu, 23 May 2024 07:57:12 +0800
From: Kent Gibson <warthog618@gmail.com>
To: brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/2] support casting line.Value to bool
Message-ID: <20240522235712.GA5330@rigel>
References: <20240522004643.96863-1-warthog618@gmail.com>
 <CAMRc=Mfd_i7uBBJnxkVbuZkiudxcb2N3rM8RmZGZAG-85iAYoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfd_i7uBBJnxkVbuZkiudxcb2N3rM8RmZGZAG-85iAYoA@mail.gmail.com>

On Wed, May 22, 2024 at 09:22:50AM -0700, brgl@bgdev.pl wrote:
> On Wed, 22 May 2024 02:46:41 +0200, Kent Gibson <warthog618@gmail.com> said:
> > While writing a gpiod plugin for gpiozero (Python), I had to map line.Value
> > to its bool equivalent.  Casting seemed the obvious way to go, as it is
> > essentially a boolean, but that didn't work as I expected - it always
> > returned True. This is the case for any Python type that does not provide
> > a suitable conversion operator.
> >
> > This series adds support for casting line.Value to bool.
> >
>
> Ha! Interesting. Do you think we may need it anywhere else too?
>

I guess the same applies to the C++ and Rust bindings - I'll have to
check.

> > Patch 1 adds a test that comfirms the existing behaviour.
> > Patch 2 adds the __bool__() operator to make the Value behave as one
> > might expect.
> >
> > As an aside, I couldn't for the life of me work out how to run the complete
> > python test suite.  There are no hints in the documentation.
> >
> > There is a python-tests-run target in the Makefile, but that didn't work:
> >
> > ~/libgpiod/bindings/python$ make python-tests-run
> > PYTHONPATH=/home/kent/libgpiod/bindings/python
> > LD_LIBRARY_PATH=/home/kent/libgpiod/lib/.libs/:\
> > 	/home/kent/libgpiod/tests/gpiosim/.libs/ \
> > python3 -B -m tests
> > /bin/bash: line 2: /home/kent/libgpiod/tests/gpiosim/.libs/: Is a directory
> > make: *** [Makefile:677: python-tests-run] Error 126
> >
> > I tried fixing that but I still couldn't satisfy ld wrt the gpiosim
> > (I don't have libgpiod installed - just using the local build),
> > so gave up and called this particular test directly with
> >
>
> I typically run it like this:
>
>     PYTHONPATH=./bindings/python
> LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
> python -B -m tests
>

So a one-liner?

That gives me:

$ PYTHONPATH=./bindings/python LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/ python3 -B -m tests
Traceback (most recent call last):
  File "<frozen runpy>", line 198, in _run_module_as_main
  File "<frozen runpy>", line 88, in _run_code
  File "/home/kent/libgpiod/bindings/python/tests/__main__.py", line 7, in <module>
    from .tests_chip import *
  File "/home/kent/libgpiod/bindings/python/tests/tests_chip.py", line 8, in <module>
    from . import gpiosim
  File "/home/kent/libgpiod/bindings/python/tests/gpiosim/__init__.py", line 4, in <module>
    from .chip import Chip
  File "/home/kent/libgpiod/bindings/python/tests/gpiosim/chip.py", line 4, in <module>
    from . import _ext
FileNotFoundError: [Errno 2] No such file or directory

That might also be as far as I got previously - I may've been mis-remembering
that the final hurdle was an import error, not an ld issue, though both are
looking for a module they can't find, so basically the same thing.

Cheers,
Kent.

