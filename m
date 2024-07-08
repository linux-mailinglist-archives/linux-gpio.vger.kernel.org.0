Return-Path: <linux-gpio+bounces-8106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175092A5AA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 17:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012441F21E13
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 15:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F932144D01;
	Mon,  8 Jul 2024 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7LOHUGy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2C14431B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720452592; cv=none; b=WjBrw6n743ndwzIJiilj9dpoeamfDK4fZce3yJEbiJBSeaXl039CSyFoJs9ZACz0qlwN4XDy12toAWHTYtRqVDGF0+Z/38oZI3FVbpLMLKrvZ6nb7tP/R426z32GUScqBhR54mwm6j/f1NvU5yPmH8qe2x7VZnVaQMPTtQeumN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720452592; c=relaxed/simple;
	bh=BOzS8DO1AebAxmmo3uIhZSBxmkU6e4RoK8hA8fDGzIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSowJKb79/r2EPiifv8lQT+9IBCInGL8g3acjox1C3E3f5RKmPRozLw5oaaEd7nZIsX6pNlTfV+BDnh9EITw66jrq33SjO+UkiWO8PQcblmqfMlSzHf1uxI1+3J12nnIuqHeS9owB8SGwnlN2FgrzSk1W+yvvMDAa8y9fXAdjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7LOHUGy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c97ff39453so2769214a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720452591; x=1721057391; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NIoj5N2e4/uOnvbwDR+C6cKKWSyiISQd0KOdsiF2JGw=;
        b=i7LOHUGyDsxHuPgEDZIrtwLKO8VuYeWrZ2IuTFNjvSyUyKEIs+JW75ers+COVdXAYS
         gaYPJwFU7KGYgA86270E/H1SGo00FvNgzTRZtkWiThLXwru3Dx3ORAceQzxc1+RMyAiM
         LfJuwaGp22RaeePRPK8fPAD3AmFvTq8LTmNDMytlJFTWNf8l1O6+uuU2cel1yzY8Mojt
         fppS5xNBpmZDYFS8pTvaYOjnowxthvKbt0/55IVm/tcWHZFwrxvefjy+ibVmvwnlcE90
         1hPY/Iiish4rZ48oz6cqbOeYubqHXGhjXxds+SY1emgn9czLV6RHwz55jERX8WDwQGat
         iRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452591; x=1721057391;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIoj5N2e4/uOnvbwDR+C6cKKWSyiISQd0KOdsiF2JGw=;
        b=g5sfFB+DfhPh2gb+Ul1NWaKh+2+zbTU4ZxeVg0LCLESwj4LQgPOusVJhU42KBs149Z
         YlNnUzlxTmiBiLJV0opf+3MIWsD1aB6FsWTbwgxuI4ECXipSTIy5FFkHPz+XCfAvOt9X
         /So+jDZgMzegg30IPcPAqj3t5xP23Mvhy0pFXC+yZBzrIIrDk2mZY3oEtuuvo+SpSiEQ
         iz1kO/Zh3x4IrupZDKE10Wdr8hgVDGvd5bPWbLWz5i72XxdOrA89AgBZXrAML5wMMp7v
         JFTOXnF4So7Kp4M29SGRH1NOhLxQdDfTrSg6tSQIIoS+mtIdhDYpb/9JQZaaq3hdQmCJ
         ChVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQA84UpZlXGPNhm1NIqyndOGFcmC+7ZW97txY9CR1W4YOObjrnozf/gskLG7D1ghqCCq3H7kl4FAr6z0S7x+U/Nxjn90kOn2BfnQ==
X-Gm-Message-State: AOJu0YxLGZCa67VG00uDOc5hXP61k+HMXhzRmLxqMRASqDuFcIYgAEKP
	15XJTEc08KLLY1MgdVQri+zzpCOC6cgOaJd78x5Vw4XeTULCglzX
X-Google-Smtp-Source: AGHT+IG0l/LxUA/7p9SDTl/7sz/JScOcDDo5PspspCYgNHfGd1yaQ59CblIbINAdxWWGfeLi+mRNfw==
X-Received: by 2002:a17:90a:43c6:b0:2c8:660d:cc2 with SMTP id 98e67ed59e1d1-2ca35be1c8dmr67609a91.4.1720452590749;
        Mon, 08 Jul 2024 08:29:50 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca344c399csm138178a91.5.2024.07.08.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:29:50 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:29:46 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240708152946.GA363324@rigel>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel>
 <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel>
 <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>

On Mon, Jul 08, 2024 at 05:19:41PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 8, 2024 at 5:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > >
> > > Would we be able to then have a proper RTD website with a version
> > > selector etc? That would be awesome and it's one of the last big
> > > missing bits for libgpiod to be more available to beginners.
> > >
> >
> > Going forwards for sure.
> >
> > Going backwards is more problematic, particularly if changes to the code
> > docs are required to get them to render properly.  I've got a few of
> > those lined up already.  Should be able to work out something to patch
> > older versions, but haven't put much thought into it at this point.
> >
> > Cheers,
> > Kent.
>
> I guess going forward is enough.
>

I'm not ruling out supporting older revisions - but it will require
additional work.  Longer term I would like to see all 2.x and even 1.6.
But the immediate goal is 2.1 and/or 2.2, depending when it lands.

Cheers,
Kent.


