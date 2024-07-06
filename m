Return-Path: <linux-gpio+bounces-8076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B6929015
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 04:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E71C213E7
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 02:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF97BA4D;
	Sat,  6 Jul 2024 02:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV5MWDUi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4228F0
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jul 2024 02:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720233337; cv=none; b=apAeFOdAFw0fYi9xUogkevh1ZP7KhrlpQ8hP1r46J6WSWnMIyNaBX70SUn1ED6UulVJC96ct2y2jx1Uqy9/XeadxR51yRGIUN+sJ1L7FdyP0F9miXY41ieaeVYVLyx7sR4lXRUPG7sNO7kdxwoXdZZuEIaVcgCUHkEihJB+cQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720233337; c=relaxed/simple;
	bh=ZGo8qSqlMwkBaPmOX2UrYVUbb7x/zjxxmt7LkxEdda8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9oRe0LLg4ILu4TDkGZG2XHRNMX8EPa/HhNKCdsLKSXSzkyTJD6RHPVoyUnay2XypbpR9gSuhItP6/x9KB3TmNaWJQpPLH/gTG5L7eUuD5YyKFitDixu8aa/UfxzV8aj8vUilyJZmCK9KYrVWl5QukecJIX7sntKujXBxpEEaAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV5MWDUi; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3818c2d364cso8879895ab.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720233335; x=1720838135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9KDQaiyqp6a6saq7ikUbu6ICMT0dz74LNtPokipRHI=;
        b=UV5MWDUiwwuBhr2Pn/2NstmGxLCKXdxj2lAbm7W5vlWhzhQCmBbxP/bliCJCH5mYY6
         SO/d5tCdjIfyVNuU42kSqKtX1Kz5EmGWc9x+S6FWGb6EvJj6bsYWYlPQN1CNt2IG+0bB
         bwWQyw18/SOzset8IKBu83g2NrZOEv+ykrdVSyBb7bSJMkRQQb1RzbBLHyCc268ym/jg
         7D2aws7rDduACPXTj9ExhEKvVARP3FOzId/ACF32DOsumdAndiUqY/aNA4ftsSGJ8IOl
         w1YHmxynXyyjpOvUQkFeSKAfHO5QyDicYClSwuJKyd6HNLyX02Jre4Z53KI8Jx+kkQJK
         3h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720233335; x=1720838135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9KDQaiyqp6a6saq7ikUbu6ICMT0dz74LNtPokipRHI=;
        b=hlTRjqoBg0yrmgVDKnSotNB88PQXQQKm94rjtom3QK1LY21GxAY0R5zIP8JBEVIw1Z
         6vaYYVB94AivMS6gOPsGj26r5SMp+GU55VD9r9ZTf2QiYTiJgtSsWBWLka4u4AkGwPSG
         eCFdkt63KnqKZBNej/A0bGTJuSHqfUVbehREBkm62JCwPSPIlbAmr0QSnKk6979oK3cB
         a9eiYzmNKedu2z3e6Q6tqKLHlbCuV+hsCPZ8YXPwT0e/wxsgcUzAmqZ/5UPhlg2tustR
         ffg2Fuw9B5xPG9pZw+u1QD7sjNoLwd0k5uhWng0LTq1isZk/P/KV5UjwbtudtzOhz4fA
         E3/w==
X-Gm-Message-State: AOJu0YyqXX0OG74wjO/7I40yz4JPyUb4LNTkN1LDBTtUQ0oxD2aN9KXW
	5Xmc/VWX00b9GmQgMSXSAuMk9Rr5IULtQmx0KlJAzSd18mcI/yztGojgJg==
X-Google-Smtp-Source: AGHT+IHvRu4FiQt2/q25pzpfgu8NM7aEovcly9w9VQ5oFK5NjqmVi0gUx3uS42VVogPvLLHYJ5LR3w==
X-Received: by 2002:a05:6e02:1a41:b0:382:759d:60f1 with SMTP id e9e14a558f8ab-38399a6ac47mr75250685ab.18.1720233335312;
        Fri, 05 Jul 2024 19:35:35 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb15217780sm59741705ad.109.2024.07.05.19.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 19:35:34 -0700 (PDT)
Date: Sat, 6 Jul 2024 10:35:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/3] bindings: python: more flexible
 reconfigure_lines()
Message-ID: <20240706023531.GB12657@rigel>
References: <20240626053808.179457-1-warthog618@gmail.com>
 <CAMRc=Mdb5_F3oQ1JU5imCSyNfxPrkTciKw9MGuBafTbexHLeLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdb5_F3oQ1JU5imCSyNfxPrkTciKw9MGuBafTbexHLeLg@mail.gmail.com>

On Fri, Jul 05, 2024 at 09:34:52AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 26, 2024 at 7:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > This series addresses issue #54[1], making reconfigure_lines() less
> > restrictive in the configurations it will accept, allowing for
> > misordered configurations and reconfiguring a subset of lines.
> >
> > Patch 1 adds a set of tests for the new behaviour.  These all fail with
> > the existing bindings, but pass after patch 2 is applied.
> >
> > Patch 2 is the change to reconfigure_lines() itself.
> >
> > The reconfiguration of a subset of lines works better with a change to the
> > kernel to ignore reconfiguration of lines without a direction set,
> > i.e. a default LineSettings.
> > With existing kernels, if a line has been requested with flags set to
> > non-default values those flags will be reset to default values, though
> > that may not become evident electrically until subsequent operations are
> > performed on the line.
> >
> > Patch 3 extends the tests to demonstrate that kernel issue.  A kernel
> > patch addressing that issue has been submitted[2], and the test passes
> > with that patch applied.
> >
> > Cheers,
> > Kent.
> >
> > [1] https://github.com/brgl/libgpiod/issues/54
> > [2] https://lore.kernel.org/linux-gpio/20240626052925.174272-3-warthog618@gmail.com
> >
> > Kent Gibson (3):
> >   bindings: python: tests: extend reconfiguration tests
> >   bindings: python: more flexible reconfigure_lines()
> >   bindings: python: tests: add coverage of kernel reconfigure as-is
> >     behaviour
> >
> >  bindings/python/gpiod/line_request.py       | 17 +++---
> >  bindings/python/tests/tests_line_request.py | 64 ++++++++++++++++++++-
> >  2 files changed, 72 insertions(+), 9 deletions(-)
> >
> > --
> > 2.39.2
> >
>
> FYI I did not forget about this series - I'm just waiting for the next
> stable kernel release so that changes required for the new test cases
> to pass become available.
>

No problem - I assumed that was the case.

Cheers,
Kent.

