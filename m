Return-Path: <linux-gpio+bounces-6663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EB8D0135
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF3BFB27549
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6C315ECE7;
	Mon, 27 May 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEIaQcvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA94EB55
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816057; cv=none; b=LIrBVkY4eSG5M2Oo6tVtiOclcLRMCFUmQG85rvriyUqt/eLxU1hn7tQO7Z7TRTUKc/nu6lmXGAUkAteZjEneDEJZtmf42Acnvs3GzOzK9zJugzzI0X/eBZy+x8QsDNZ9dDmofd7BLgV/xxio+jvWzxiEjY1Ch0NAmQwYRXSunwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816057; c=relaxed/simple;
	bh=+nq7c89J7nrFFZo0eWJ24Eu47gVMkWrBEF0Kgs0Ry/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUndHCJ3bRJvdQJIq2lW3qSVUCtonyvD2u/0FCB14Y1OASWH6P4yzIM337elLd8tmo84gPIW9nrhOmwYkmtfLFR690Yt70mFEyYsRLG+QXxSSWyRLj/meyCGK3SsF4vMwYDPhun8cjwiYsx6DOUStKkKBQ/8jim4YQw7Fi6Tha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEIaQcvA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f47eb21f0aso11007565ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716816055; x=1717420855; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d40FhJFUquymv9iFsMGtnt1IB1SwO3Ai8V5SHnZ2URk=;
        b=dEIaQcvAiak9p0O4i8masnKe/98G9jg7gQDa+y+61/ivDr6eeR/SccIME+X4t8Of9O
         BSQM5xVLFd+K7Luj7W+frUjt/EwPcro6lIgAWW43C97fpBJ2zFeVwlCrVy9HXFpV0Eew
         QTpRoVm9/grGh4/KZe6UFmM4Xg8iDAUvnXeITnBL+WYeG5OBeh5aGr5/C8uPx55faPNh
         Oi3GEgw4NSXPBz9ZEUSfPeZTS3AXuHhHmfpkD9weMFhdM9SuLTTu6OXHQbgAN2xxRhuj
         FDrYF0I/MJ1zkVyA3p83MrkeXF8UQQOxbXRjPXITQEQK6qNaevmX6GKbMr/ln/e6tes4
         I4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716816055; x=1717420855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d40FhJFUquymv9iFsMGtnt1IB1SwO3Ai8V5SHnZ2URk=;
        b=xDAeJmreRnpV6cSoWGk/PavlBaiYUDsUs+vXt11ssuvLFEuVQC6EuV+0VxcUmU/OF5
         j5yCgTL6JixMzicjKcmkQuSKmBltKz/KPAjxBWL5pyxwQi/TnGYp3akXf595bRr3CLFc
         fJroNc7Nz/N8XzD1BCGAyF68xv+qdIrmqgsamZznDpMSAooSN4ab+O9wdYJMUOcC1Bcy
         Lrm/Af6rZczCisJM+HSZOBGc+xT0kq69DNbWdAjfXfRYCfqsa5c0KaiNDvDACh3WDBkf
         XSAnNAqiTAOgyaPpgshRSOgzXma/9b2TpqNdXqxrH2oXutyZRpt1yxZCuJiVntKJ7XQi
         uxCw==
X-Forwarded-Encrypted: i=1; AJvYcCXCOCyIvQHInSjxklggW2wA2TROqF40ZhOfvIkSHJLQECaLRY84T0xuyhLybGCNEibiDLPXRXh5CFkbDf5GomAcP4/J0UmxUwR79w==
X-Gm-Message-State: AOJu0YzJJ0biKkZIZG9mD8C9noozpIPe8HVwDuYAn8EyU+3eEOjI0vH4
	YdtABiNLGTYummImCcLRvWcL4bX0v3U5KBepJwbWs2SUq9Ref9LFOrTI+A==
X-Google-Smtp-Source: AGHT+IE4oliOCMWuQ75q8PQqf7HawLMFTalvD9e36c/6gr2pFSMe6HVtyb8l5WY61qS2/r1LvdaoXw==
X-Received: by 2002:a17:902:650d:b0:1f3:675:a68c with SMTP id d9443c01a7336-1f4486f5c15mr91585965ad.23.1716816055248;
        Mon, 27 May 2024 06:20:55 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f49ce17119sm18796695ad.256.2024.05.27.06.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 06:20:54 -0700 (PDT)
Date: Mon, 27 May 2024 21:20:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240527132050.GA133150@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <CAMRc=Md5OF7+BM8gqTbu581cqbWZsWUNCS7T--Hu0Dwq-r5mfw@mail.gmail.com>
 <20240527125732.GA121700@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527125732.GA121700@rigel>

On Mon, May 27, 2024 at 08:57:32PM +0800, Kent Gibson wrote:
> On Mon, May 27, 2024 at 02:51:52PM +0200, Bartosz Golaszewski wrote:
> > On Mon, May 27, 2024 at 2:44 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > $@ does not break up quoted arguments which is what we want in all cases
> > > > in the bash test-suite. Use it instead of $*. While at it: prevent
> > > > globbing with double quotes but allow variable expansion.
> > > >
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  tools/gpio-tools-test.bash | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> > > > index abb2f5d..dde26b4 100755
> > > > --- a/tools/gpio-tools-test.bash
> > > > +++ b/tools/gpio-tools-test.bash
> > > > @@ -27,10 +27,10 @@ GPIOSIM_APP_NAME="gpio-tools-test"
> > > >  MIN_KERNEL_VERSION="5.17.4"
> > > >  MIN_SHUNIT_VERSION="2.1.8"
> > > >
> > > > -# Run the command in $* and fail the test if the command succeeds.
> > > > +# Run the command in $@ and fail the test if the command succeeds.
> > > >  assert_fail() {
> > > > -     $* || return 0
> > > > -     fail " '$*': command did not fail as expected"
> > > > +     "$@" || return 0
> > > > +     fail " '$@': command did not fail as expected"
> > > >  }
> > > >
> > >
> > > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > > should use $* there.
> > >
> > > It also doesn't like looping on find results in patch 4[2], though that
> > > is not related to your change, so leave it and I'll fix it later?
> > >
> >
> > What does it want here? This looks correct to me? Should we do "$(find...)"?
> >
>
> Refer to the referenced link - it is worried about filenames containing
> whitespace.
> Not sure what the best option is here - I am only just looking into it...
>

How about using this for the cleanup:

		echo 0 > "$DEVPATH/live"
		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
		find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+'
		find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+'
		rmdir "$DEVPATH"

It is a bit less subtle, but that works for me.

Cheers,
Kent.

