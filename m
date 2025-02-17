Return-Path: <linux-gpio+bounces-16124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68441A3833C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5887A3AA15F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11C121B190;
	Mon, 17 Feb 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="cJPYx9Zp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C221A44E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739796153; cv=none; b=BJB7YZEU6TE0/GfiwkdRewIBUSK7K2XpxrwcX2ah7dpzwjZ7e83hq6L40RhMh1iMSluLrTCWsRj9TpAuu16Ow1+kRhErVYq7jLu/dRD5i6hbi18vXIteEFBe4PUhmRYAIu6zIyoH6jK93zHSa2z5KqRwi4s6g/ukM0J7Zee7M88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739796153; c=relaxed/simple;
	bh=NbmGLDShUH9XzO69FUadiBXVfCY2xRVRpc4zupKDunc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1mxd2BiUEK7JN5CKEF2q1ngk25aasdYzJJBvsx7PExwhm3a58V38PsbzXQKzPe+W7cv5zna6/JDCGGQLF5poXfw6fmwIRcR3ocbs4LS8MjbBCsLPGQUL+IHq8ymXmJ5XeCjFgnZ3NyStsuAktSxIKC6n50wpdI1R0rT3c8Wuko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=cJPYx9Zp; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 656BE3F84C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739796149;
	bh=l6Kxk+GkIFDTn79tZ2uB28SbPhG15lw/FgLNV6Qqkro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=cJPYx9ZpBdNJQDnEI+zEHbW3AwOo35zgGXSfhIecywUKVxuzpHSrAvHivbXT4YatZ
	 ry0tSUqwDbMzn8SXStoG462B8/rzKfgjeYGy3aoADCjX0ZLsgIsT+5RNyxTrYVFgGg
	 LUAqhkQ3elSDQGSGEMMRZEnoAGbMY8fdHu88VBpXyxIMFZ2oA9+xCenEDTs1IqUfER
	 gqim23Q1W+PbbVGsKnFXay+HgIStMkapPUslhOWuUQV6SvX61oNAk4Gj9eyADnhTQ3
	 tzV7aEaQ+w559vYwwzFx21W5t4wKum4dKfqfGlI+flmI3QI+6D+SpFBdCn1YZdrfC6
	 9aUv+0E23Dtpw==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc1c7c8396so7598260a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 04:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739796148; x=1740400948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6Kxk+GkIFDTn79tZ2uB28SbPhG15lw/FgLNV6Qqkro=;
        b=w3XCRGYnqeLPMAOeRnOO1QS3RRN2ZSdF9wbe/O3stzPh5E1zd2mb8zoa6UkA1m46BQ
         Xd0hH2vkOUmiTCpm7P+8E8uw3exlru7RpjdzFK34qxHfaFBbjklOCkTWlCD2/gggnh1m
         m2M1tgperc9DeyR8QbFnvfvnzqOn6AMFzuwnOrMK7kGCy2T6AqxgoImDIJ4+IbqXEX8D
         1a9QtZHmkktRjOSKdkSjzk27L4O5jM/gTYC4eb7NKDY7O3JRlM47aLg1qCQJVVJ3siNM
         AKm818vJBcx6YTSpbqnl8PTAdz+UQF5YREtx+uKUPlJi7Nz5Ey8l5F/6rOlth5FKIYuQ
         bXzA==
X-Gm-Message-State: AOJu0Ywc5VNigJPPcwvlqOtpkCsGZvSTkcw/5Irg5AGIUhVXI0XlXGS6
	pHjRiio7MS3VwGpbtqk90n55HABfkoBUGzjgon/boC3rcKe6FhVXJNj9SYd5Kh7jAx5fdjNTabp
	cP3/r41dkJM+zCFW6t8Xu8jOsusSpLjkFxbiz/16Rb9lI42JJSKvO0qxPrJSQyvo8eAxkRz42tK
	iXOXc3dKE=
X-Gm-Gg: ASbGncuN6pBgKMUrGrXMF06QwoUTlwxfxdY9DXtASi4IyRTSd5eHHWIvWZ0KLXZ+v27
	5eCSrhLrPgSTYkZsBJMoszPXyE9bgTv//RCsglHPIUPiaV/eiiTKVeVdijaBR1QGSRm4qyXvRcS
	SniTgRy/uoOPs6nxwtGuBB1WLNYwzsvLaOMQevY0818AI2Y/hkFV67lDenx5vec52h8FJ1y3UOH
	CNPBu8Vdm2VhJM5TX80MZHRZ3B6xp+UUFr8JGCxJbnlefWvmZ01kTDEC/5F1lgMF2s4NhSKATBV
	DrKt4FU=
X-Received: by 2002:a05:6a00:1746:b0:732:535d:bb55 with SMTP id d2e1a72fcca58-732617757demr14588450b3a.4.1739796147892;
        Mon, 17 Feb 2025 04:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ9WyvxQvLosanpLyxCpFkSToNb0EAcxqm8OB+Vp5TsImFgf8mCS6a3JMyQtZjkCJuP5wGbA==
X-Received: by 2002:a05:6a00:1746:b0:732:535d:bb55 with SMTP id d2e1a72fcca58-732617757demr14588420b3a.4.1739796147568;
        Mon, 17 Feb 2025 04:42:27 -0800 (PST)
Received: from localhost ([240f:74:7be:1:a6da:1fd8:6ba3:4cf3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273d9fbsm8264081b3a.102.2025.02.17.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 04:42:27 -0800 (PST)
Date: Mon, 17 Feb 2025 21:42:25 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <2amalyzhmqblq5rkcqnufpmszkqdlh2kxxmz6cttju5jgzs272@idorzqbkqn52>
References: <20250216125816.14430-1-koichiro.den@canonical.com>
 <CAMRc=Mef-cg_xt_+mEAyxY_9RfK4=qWEbt_GebeT2mu_8GWVxw@mail.gmail.com>
 <qw5epzoexlteotpuulafg4fyjatlsjjko3ldnzjezoumhodgko@a72wjsaw6fgz>
 <dc2w6gxdp3rhlhy6hvwocp76zdjh4jhdljhoijbub5q76f4xgw@ulfvg2s3rvub>
 <CAMRc=McL7XJfbb3h3XO+UUhL77sq0TZodS=rjaQ19uvKJj+NWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McL7XJfbb3h3XO+UUhL77sq0TZodS=rjaQ19uvKJj+NWg@mail.gmail.com>

On Mon, Feb 17, 2025 at 09:12:07AM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 17, 2025 at 2:18 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Mon, Feb 17, 2025 at 10:07:03AM GMT, Koichiro Den wrote:
> > > On Sun, Feb 16, 2025 at 04:56:59PM GMT, Bartosz Golaszewski wrote:
> > > > On Sun, Feb 16, 2025 at 1:58 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > > >
> > > > > This patch series introduces a configfs-based interface to gpio-aggregator
> > > > > to address limitations in the existing 'new_device' interface.
> > > > >
> > > > > The existing 'new_device' interface has several limitations:
> > > > >
> > > > >   Issue#1. No way to determine when GPIO aggregator creation is complete.
> > > > >   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
> > > > >   Issue#3. No way to trace a GPIO line of an aggregator back to its
> > > > >            corresponding physical device.
> > > > >   Issue#4. The 'new_device' echo does not indicate which virtual
> > > > >            gpiochip<N> was created.
> > > > >   Issue#5. No way to assign names to GPIO lines exported through an
> > > > >            aggregator.
> > > > >
> > > > > Although Issue#1 to #3 could technically be resolved easily without
> > > > > configfs, using configfs offers a streamlined, modern, and extensible
> > > > > approach, especially since gpio-sim and gpio-virtuser already utilize
> > > > > configfs.
> > > > >
> > > > > This v3 patch series includes 13 patches:
> > > > >
> > > > >   Patch#1-7: Prepare for Patch#8
> > > > >              * #1: Prepare for the following patches.
> > > > >              * #2: Fix an issue that was spotted during v3 preparation.
> > > > >              * #3: Add gpio-pseudo.[ch] to reduce code duplications.
> > > > >              * #4: Update gpio-sim to use gpio-pseudo.[ch].
> > > > >              * #5: Update gpio-virtuser to use gpio-pseudo.[ch].
> > > > >              * #6: Update gpio-aggregator to use gpio-pseudo.[ch].
> > > > >              * #7: Add aggr_alloc() to reduce code duplication.
> > > >
> > > > Please don't ram this new functionality into an unrelated series.
> > > > Split it into the gpio-pseudo code, factoring out common parts and
> > > > converting existing drivers, then send the aggregator series saying it
> > > > depends on the former. Otherwise it gets way too complex to review.
> > >
> > > Ok, I'll do so.
> > > Thanks,
> >
> > Should Patch#2 also be split off into another submission?
> >
> 
> I'd fold it into the aggregator rework but make it come first in the
> series so that I can pick it up into fixes easily and send it for
> stable.

Ok, thanks for guiding!

Koichiro

> 
> Bart

