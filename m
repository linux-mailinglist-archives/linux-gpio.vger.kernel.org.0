Return-Path: <linux-gpio+bounces-7059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FB8D803A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27E8FB25D57
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1550A82D93;
	Mon,  3 Jun 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQHwJmrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969E19F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717411394; cv=none; b=LJULzV1nBkmwtZXAffgS5J0giqEj2yA1/fdnuoRlf9GvfZ6zV0ra4+vek5luOD50umOlIEFJHn0INFARcbCkwa/TUQxLshmcGwqyNQNeb/p3TKOvxu9/vCVPDtv8zIYUn/uIslQRkUYkK3RVA4boYX4H1YxeezT13sPIZkI9fHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717411394; c=relaxed/simple;
	bh=S+Mm8R7PSr3VZboY4lm4Tl1/V38tvuYmS8Ldysportg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hF+e30KTKcDBCv5IaYW6vcVaalCWfsGTfvH+i72hCBsHC839k1GINLKs8GFF7WI775m34o46WVdAKVwhc20/QNIjQe/dODlfXiClywLg/kxjMh2woHMOddS7hhAslSZH8gEIvRGZpBiqpDMJa6Ju3qGUJ1dxwjzjT/XA9a3akUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQHwJmrI; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d1c1f4bbf5so2509212b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717411392; x=1718016192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vih1MjCC7BcYESdsluQwCnYAJxLBshLm5pxN3qljHk4=;
        b=TQHwJmrI8a69TI9ZNOhBsjBJWt2uBnG+Zv0XRaQXiSraro9k1z92Op4CWIOWC4E/+U
         k8KGK6++asMXnmKj5txnjTAHUhR1SYnONKjpUuutZFmmOhtLEpT3ISQOFQ3c4pt0BARn
         Bcji5DlSvkEjsLozMDa0Bb2/4eJ4agNjqiUob+l7vv6FrvPwwaDzUpZb4xnYdLdMonKn
         IA4uXdet8iDZeIxpt/3ayWYADpLqc+2Gnp7K0YG786sP28kwwULWtw4lAdfJ51/KCDMn
         zUObJp0WeNa0O+SsFrmTqqpes1OHu+9SY00SHWUIzq1aPYn7QeEvXQXJSLGEj7of6C7l
         ymOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411392; x=1718016192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vih1MjCC7BcYESdsluQwCnYAJxLBshLm5pxN3qljHk4=;
        b=JSn8cClor4E3Dp59yzowL01U4B6ZLUYTaR663F1l32FYIhRjbX0W4h7yEYh6lOPkHM
         TMBhKyMdZOfRmfCGWY8fiZ2zkHb1tTL7qnbPzduNFW1E7q1afct64swL5awvl2BS2BaZ
         5HuioWDbbRMcpHBcG+SzIb2l77GDdgfOnQ00LOMHE+UJMU2G5A+gxZ1U5U5LnE7uowNY
         oNi/jYpFzlzVPyWTh0SfnecB/jXvT5v7eWipAr2X+/XQLYEHUjaFUdzzrFBHmMtSw24k
         Dsae83IXV9y2q8h2xujXo7646MzQlsP4qU/EhyuOZmCUZkbJDkvI7eQx+MZyXJm9iRqN
         J5ZA==
X-Gm-Message-State: AOJu0YxsWBwv1gYBngv3s4rzDT07qeae8NsRe8D+NtvVN5v5ZH/RwruO
	n8UIVzC+RGv0KyzUJ5zTlyAxiC8Vh9b64ZL+FRiujQvXw3oHfVEXVm9+aQ==
X-Google-Smtp-Source: AGHT+IGYZ4BbWmqRovRS1CKIwrbbLCP3tqxJCiYLTQdQXcFhbCucrR01C1kLV5VbNnjNHJ6IO3UhKQ==
X-Received: by 2002:a05:6808:440a:b0:3d1:d1be:9152 with SMTP id 5614622812f47-3d1e3473c96mr8196088b6e.12.1717411392224;
        Mon, 03 Jun 2024 03:43:12 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c355cd394bsm5095101a12.47.2024.06.03.03.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:43:11 -0700 (PDT)
Date: Mon, 3 Jun 2024 18:43:08 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
Message-ID: <20240603104308.GA95478@rigel>
References: <20240531134512.443850-1-warthog618@gmail.com>
 <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>

On Mon, Jun 03, 2024 at 12:40:37PM +0200, Bartosz Golaszewski wrote:
> On Fri, May 31, 2024 at 3:45 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Following up on recent discussions, this series fixes all the warnings
> > detected by shellcheck.  The resulting tools test script is now clean,
> > at least from the perspective of shellcheck.
> >
> > These fixes do not correct any known issue, other than shellcheck
> > reporting them as potential problems, the intent is to remove common
> > shell issues that may impact future changes, and to simplify checking
> > that any subsequent changes to the test script constitute "good" shell.
> >
> > All the patches other than Patch 8 address a particular warning.
> > They are reasonably self-explanatory, but each commit comment includes a
> > link to the relevant warning(s) which describes the issue and the
> > appropriate corrections.
> >
> > Patch 8 addresses a number of warnings, all related to word splitting
> > and globbing, and those constitute the bulk of the changes.
> > Some of the earlier patches also address trivial splitting/globbing
> > issues where that would prevent a line being modified multiple times.
> >
> > Cheers,
> > Kent.
> >
> > Kent Gibson (8):
> >   tools: tests: don't mix string and array
> >   tools: tests: don't declare and assign separately
> >   tools: tests: fix unused variables
> >   tools: tests: use read -r to avoid mangling backslashes
> >   tools: tests: don't use variables in printf format string
> >   tools: tests: check exit code directly
> >   tools: tests: shellcheck don't follow sourced file
> >   tools: tests: avoid splitting and globbing
> >
> >  tools/gpio-tools-test.bash | 459 +++++++++++++++++++------------------
> >  1 file changed, 234 insertions(+), 225 deletions(-)
> >
> > --
> > 2.39.2
> >
>
> Ugh, you added links after the SoB and it messes up with b4. Can you
> resend it with links before any tags? Or better yet: make [x] into
> Link: [x] so that b4 can interpret it correctly?
>

hehe, yeah I wondered about that after I'd sent it.
I'll fix for v2.

Cheers,
Kent.

