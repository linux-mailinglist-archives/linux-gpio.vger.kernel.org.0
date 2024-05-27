Return-Path: <linux-gpio+bounces-6658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB98D00D2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 538301F258BA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F6D15ECE0;
	Mon, 27 May 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy0ZK4qJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A615ECCA
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814660; cv=none; b=fAj+D+UhVaeaeq2oeeBEYzkr+G7UvWxH0PsethgeCm9IBmgVqB16eBWybfcXOOW9ZAe/22cZ2pznNM+5JjDZCjoOhy9p5DbFGpszmSYWV4gZ0KTdWPL2gI47mBWsLHnyz4pTtY02XDGHtD40X3xkbiA+b+4RvWNt1xXBqTCOQSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814660; c=relaxed/simple;
	bh=YT6dv55K1eQtDJ+o3Pm61RB2agYbqJ1ULZiu0wOIqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqsTsUTSRTeOJpdqYbj0hfFUN31YoXr7GxG44jj8xPCN3aBP0Ql54z4Nmw5wcQpjNG8s71TxHBHCOBy22XwNd5+xI4SL+pXqSr8tkl05fFXFGjn1dGNDUewiPkF6LPdsOm3TXnnkq+HXSPXMCUFgEpLQeoiHDdzOakAPaWRBdjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy0ZK4qJ; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36db3304053so46394085ab.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716814658; x=1717419458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvMIy2rPv8J8RZwLjIv0ey64ZKHQ8sIKJbqcRaY2A24=;
        b=iy0ZK4qJaVQVTPahCruHyK3ZdOxZtRpfcc66nkaJOnp8x0PPK6ZmDVZ5oT16PXVFbp
         0JzkOBsgVENKWzNhUWRQUKxc0Siw163dRAR8s6zOfaAwcA195wkLQzBXt4t9W1vqNmNj
         Q8TGC2myNNC2Umj9vhf30h67HVvWSFSf5VSRkZkrWQUwC5ZqfQcEC53fdi17KDCIjxUX
         CVsg0672jE4QNK/GOnw3vMSGzy+dcTRwqkR/fnqY2OntqE3SEv3xEjQaF/UAIjzp2lqE
         F82QOycq3SSYN8Myl+KCZvuQOOZkkLELUZGOLtuN441ZeImIWpNN7giIu2dEaShIs9Ij
         0IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814658; x=1717419458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvMIy2rPv8J8RZwLjIv0ey64ZKHQ8sIKJbqcRaY2A24=;
        b=jyk0w5Yz8BSk3X+8B6OiMDmS4C+DMjPjqEHDopqxjxl81H0gTQsFl+fQqjwfImAjej
         Z5I4LnfU6fFTcOJv2p5cmRgB878CbEF4UgczDXVSZTljEbbW/rnITKu0uW8l+DFTo4pr
         aG3O+BD9O1RyBmJZ9L1o1LondHxLDR/CUFLUCTW/VcqYsePhWQUVGlm9eJeLO2vKTLnV
         xRdzieCN/UVeFILxjS0ix7PbzM5UOBA1OVIv32S75guw7ts3VgtvAo1OiAg7tIP6AIL6
         3fai55AWhm1dfP33e8hlSwR0a+N2hUUIJWFb+xR3VMwCB0lOsufGy3yAUIF5sst7DWp/
         ijaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV54l1pjVD3oZZeQvHLw9IcT6vojnJRxQKSZgrJEv8Yyw/Pa6iQynbk78ZYh4SedkwvqWERP+QU70mGSIogA5XIBMW5DkjFCy7Cg==
X-Gm-Message-State: AOJu0YykHRzvgfNxt1QFQ/fnsLBjd8+qY079zRmLsygsUBmmyC2NW7Fa
	CeifPF0ild7Yp6yY1NdMHdOkk0RMREDHDonWghCjUiVrYwwLpDe4
X-Google-Smtp-Source: AGHT+IHEV6PwgBwAiVMAaNbK9JJ6DDKBErzd5e2nnDh3VcG8UffXT/xv0uYGOZozOTBIIXmGdfs6BA==
X-Received: by 2002:a05:6e02:214b:b0:374:5d1b:828 with SMTP id e9e14a558f8ab-3745d1b0ba0mr12341225ab.25.1716814657600;
        Mon, 27 May 2024 05:57:37 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-68226549417sm5927799a12.71.2024.05.27.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:57:37 -0700 (PDT)
Date: Mon, 27 May 2024 20:57:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240527125732.GA121700@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <CAMRc=Md5OF7+BM8gqTbu581cqbWZsWUNCS7T--Hu0Dwq-r5mfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md5OF7+BM8gqTbu581cqbWZsWUNCS7T--Hu0Dwq-r5mfw@mail.gmail.com>

On Mon, May 27, 2024 at 02:51:52PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 27, 2024 at 2:44 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > $@ does not break up quoted arguments which is what we want in all cases
> > > in the bash test-suite. Use it instead of $*. While at it: prevent
> > > globbing with double quotes but allow variable expansion.
> > >
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  tools/gpio-tools-test.bash | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> > > index abb2f5d..dde26b4 100755
> > > --- a/tools/gpio-tools-test.bash
> > > +++ b/tools/gpio-tools-test.bash
> > > @@ -27,10 +27,10 @@ GPIOSIM_APP_NAME="gpio-tools-test"
> > >  MIN_KERNEL_VERSION="5.17.4"
> > >  MIN_SHUNIT_VERSION="2.1.8"
> > >
> > > -# Run the command in $* and fail the test if the command succeeds.
> > > +# Run the command in $@ and fail the test if the command succeeds.
> > >  assert_fail() {
> > > -     $* || return 0
> > > -     fail " '$*': command did not fail as expected"
> > > +     "$@" || return 0
> > > +     fail " '$@': command did not fail as expected"
> > >  }
> > >
> >
> > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > should use $* there.
> >
> > It also doesn't like looping on find results in patch 4[2], though that
> > is not related to your change, so leave it and I'll fix it later?
> >
>
> What does it want here? This looks correct to me? Should we do "$(find...)"?
>

Refer to the referenced link - it is worried about filenames containing
whitespace.
Not sure what the best option is here - I am only just looking into it...

Kent.

> Bart
>
> > Cheers,
> > Kent.
> >
> > [1] https://www.shellcheck.net/wiki/SC2145
> > [2] https://www.shellcheck.net/wiki/SC2044

