Return-Path: <linux-gpio+bounces-8119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9B92B3F1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB3A1C21E9D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1300A15574D;
	Tue,  9 Jul 2024 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYZtx7vo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71699154458
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517674; cv=none; b=J/wg/4GzBMs7+naXV6r14dPRuhrhT9WUThmfWdkRCJ4Wc9YoelU/es37STSgMlrR9X5pNoaCG2fnrysjhgFrhp/YgQM/qx/2I+ij/IFo20s542a7giMF/WV3XOBvFhEHOZPVfy8TGKbsmp5jmDuT5iUFTlmITUg4wXjpn34N5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517674; c=relaxed/simple;
	bh=kK8/DJsYnixJrIDjGYMCr/9HjOueKiJ11XLy0VImYNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey/05dinD/Mmuov7yB8IioNAxBGl1SkclTTXg2qjesiNwNJCr2NF8PTBpwtHf1FXs3oyculYC7AFkM+nox5+hsnhOo/S7d/si++oBS1Kihsogo+VLEWC3j9KWNnZOhGzo47Bg+WPgbQnGJVzIDSI6K5ZIMcCEQ51A2zY8ckn57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYZtx7vo; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d93f9c793fso183715b6e.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720517672; x=1721122472; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bqzQomQpkVwyIvWv05dvVkIFXMwESqY953WTbL8q8Y4=;
        b=gYZtx7voEecDVbrol8vX12R+y5ddWKAeDcKCks/e+xAmeIxCtEJFy0SMVQ/KV09OoM
         NuuxX/S9+Fo87Pv7OyehtlO4hYYJUCHlyB1Mk6/iRR/zS197A/4lVJfb8kjELbGNYIR4
         V0/nTpKSJt3UwhqRGHY6IFXSPK0/FiaEed78RFtNn+9plz/BWB2sMNUN9RfLv6m4T+zH
         BfjPfyv2KnOtyCj0YtAkMZjmYaDW7z7McH9MaGaWTLMuR7U1raooQJenNcgukOMrxXrn
         iJS1JJBNij4+wzyZQfGYHmmmzEogf27ZVFvepHpDIanF2WhBVPmwIV1K9Gn3BDAVQIXC
         6nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720517672; x=1721122472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqzQomQpkVwyIvWv05dvVkIFXMwESqY953WTbL8q8Y4=;
        b=wNzQxK2svHpAvrDK7jyqUJVD7Zf+7CbpPKLduUZYe/ZtiyUSWC+DDUhIEUOlwuxaMB
         VV35hbKwP9r5KqF3jdvWRUX9P4R0b4d89mbfr0uzTSmyH6+TIHTgSPLTSZTifaidSWoq
         7KrJ1vmislfVTE+b1Kt+BWwVvn2fhjHcXwGwNwpiAJ2EU0dSU07UPy/FtmQtYe2/8+sb
         f47kKVIo1ltnELGJTnDjkRSmDy5yYCH0laRSLT+3152NR7KRxV8LdSfmJRTvJgHhqukb
         wmMeI3+JN5numzSXA6eiwEC4kFEyqy9RwTr/Plb/mr4zqBYRmBeppqrufp7QGXSi5FKM
         uMEg==
X-Forwarded-Encrypted: i=1; AJvYcCWOUOw0gIEYNW9f00IsXQuHYBaHt2kFdowplKjgL8Jh5veyZq5YZ06gb7txe2ML5HP7H6u6Yut4zlz0IQt786bpdDCMX7OBUklulw==
X-Gm-Message-State: AOJu0YyQzOBK8MP6E/Nn3RWGnr1TDD5kvNixgyVn4xzqfPhaiOv2c2z6
	Qn+xqIFi73q3qcwIMguQBWFaX1tP+zcgH4BGMkqqiMpSlt86U4xJ
X-Google-Smtp-Source: AGHT+IHOwOBL+nj/tNJHTIkq9nLBIvkBLIPE9dp6dz5j+1UZfY6xMkV8mSf/L9tMMGuExQfcvaM7zw==
X-Received: by 2002:a05:6808:17a9:b0:3d5:47bc:14e1 with SMTP id 5614622812f47-3d93c01c91dmr2493286b6e.23.1720517670889;
        Tue, 09 Jul 2024 02:34:30 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b220esm1378916b3a.176.2024.07.09.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 02:34:30 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:34:25 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240709093425.GA153473@rigel>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
 <20240708124331.GA255037@rigel>
 <CAMRc=Me-43__rZEFSafdq+YVjgB-mJxsuMMXgZvgKDmyi0n8qg@mail.gmail.com>
 <20240708151517.GA355364@rigel>
 <CAMRc=MdGbOf7f6W6811gbqCFYjZFHZa0LmXVnNHvBC6uz1mgzw@mail.gmail.com>
 <20240708152946.GA363324@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708152946.GA363324@rigel>

On Mon, Jul 08, 2024 at 11:29:46PM +0800, Kent Gibson wrote:
> On Mon, Jul 08, 2024 at 05:19:41PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jul 8, 2024 at 5:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > >
> > > > Would we be able to then have a proper RTD website with a version
> > > > selector etc? That would be awesome and it's one of the last big
> > > > missing bits for libgpiod to be more available to beginners.
> > > >
> > >
> > > Going forwards for sure.
> > >
> > > Going backwards is more problematic, particularly if changes to the code
> > > docs are required to get them to render properly.  I've got a few of
> > > those lined up already.  Should be able to work out something to patch
> > > older versions, but haven't put much thought into it at this point.
> > >

And the python build has changed too.

> > > Cheers,
> > > Kent.
> >
> > I guess going forward is enough.
> >
>
> I'm not ruling out supporting older revisions - but it will require
> additional work.  Longer term I would like to see all 2.x and even 1.6.
> But the immediate goal is 2.1 and/or 2.2, depending when it lands.
>

But of course I have to look into this now anyway, as it impacts how the
build is structured...

I was thinking the maintenance branches could have the sphinx doc
generation backported, and the versions exposed on RTD would correspond
to the maintenance branches. Those could be updated and rolled out
piecemeal. So I'm thinking that is quite doable.

Then I recall that the bindings each have their own version, e.g. python
is now at 2.2.0, and rust is 0.2.2, while core is at 2.1.2.
And I'm not even sure what version C++ is at (does that track core??).
How do you want to handle that?  The simplest would be for the RTD version
to correspond to the core/maintenance branch, as I had intended.
The corresponding binding version could be displayed on the page for the
binding.

Would that work for you?

Cheers,
Kent.

