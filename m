Return-Path: <linux-gpio+bounces-22601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C9AF1326
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC8FF4A049A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CAF262FE3;
	Wed,  2 Jul 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2DI2UzU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7C724A07A;
	Wed,  2 Jul 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454100; cv=none; b=f446/vMt7wOFHAvkMnX9lb4isonB8Sx3Epjxi9AZqXZNJtcrJTre+KaTwPEqVRsmtyEDdVGQnTqNZU7mrLtz1Ifpqtcss6f5TZnUKLFllJxZoUB0Va2/U3KnzLHOmFmZZ4As4Uq0R5jp6kufHuOG5ECzo73GqCxv6H5sL77ZBAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454100; c=relaxed/simple;
	bh=Jx3nrA3y02nN1a8g4PQwns0WXAh0O1ZzASAoOCJAAOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiNYgj4cNzNEEks3BFcSJHS9/L3siw07DE97E1CMHY9eXL29S5C/TZFUr4vfu/4Wc8xiKT1btmAfxW+7KmJUi9jaSRiWUHXduVEXt26EMTjK0tiDsWntD7sBNXCWsBMBfTBxdzNBMqMh83ItVgGK8E94EklQw0H5WbAaOa0uiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2DI2UzU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235a3dd4f0dso41553835ad.0;
        Wed, 02 Jul 2025 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751454098; x=1752058898; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOPaH+YDPVrASXxcxRgC02h4qR2oQtnWUqk9fTWuytQ=;
        b=U2DI2UzUMt5U3pWr2PEeyqQq/KXJRRQAlQqu4SuBxqmQvGgbSYBHqCWhczc5t9r6BJ
         +deVtHKS7rnAJUvqEvwkMHC7FWzGHkqcZJ7PM9tUWmqX8P21R1BJ3wxPz6uKv479LvqZ
         r+g3N5wbXOOvqv49QuQqZ43dHOQkWjVTajRGa3rTYIv6WLX7BA1o5+3+7hMaLMvnjXJb
         DzQHe83ANvnei+k0zlY8nwRMQHC+PPAOfudw3czAybi8bzdbK2YdoUMLXQZ/0vEJBzou
         /ZMjSi3xSkBobi0jaeP4m7KKRubT8Z5srYBjBVOroQ0iKMhwbWJ7EXi696K2pnQm+6CP
         Gj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454098; x=1752058898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOPaH+YDPVrASXxcxRgC02h4qR2oQtnWUqk9fTWuytQ=;
        b=c/lzUY5hxVXjwPVTzLWG+UdiW3khqbD9iPBFEWCE2UIFcnjqAxCuitcm23zDRheOFh
         5mlR7DnwEtObRaU87HW5N3ui04YDXHJhJHQfgF/uakrUmVmp9Gp0rhTckkWOifHdL5n8
         KDOd3YFPShO18va44mdzw59RaAGjm6U3TPLlHBSoq/CMCxVwO3fAbgAUdDHo48Mg/ywG
         a7s9qDXvyzlXYZ6xyoDSIT8IVKotyGZWORJx8qMcyCHhs7xPdwnw9iWbLwJqJys+grMK
         mgtHASSP4puwqkgb+SbEi036lmYzvHzVK3LT4B/uwdaA5IIK9Pf8DSMctiElEQEZX1So
         12rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Q4dHLehuViX+U30JwzySz9OZ5kDuO+5LfXoG52/UQ0sxymtJ2UjE+Z7WWwOQZP27OePcMizNdraK2OVq@vger.kernel.org, AJvYcCVXYEDH5an0sBcH9mtiC4zAqYI1dmNEQ+KpLdiB2JCWXWe0LFWKH6lYxPiSoblpkuMWCXh8t9bTEqTy@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5Mnu0QDWNwZMuHU2SdBg7/sL5cuPvMpR2CE27GFC7vAkVDCI
	1/ZKinQtwYVxPBvFqOzcifY0ZF2mEd1yb8qGM0cCqJnv85DYy5Whisyi
X-Gm-Gg: ASbGncu6dIyP8GmZbrmFMBV8fIb4sDoPMcHVUBPLpfJbEOUFEWC5lgIJUmK8AtSHT9+
	P/2fleh9AoX9aPRZpOqAT8IvGLFIg5x76rV1vl7fPQfGE7DVifFUb+xtgNww7aSU1zmB9VJYClc
	Fkt3v9Vl37j9KcQ0h+29+Tac43+AL34VY7GLXDDzPm5hehZBKc6khjc4n9NBgP8kwVEU5tAlkGg
	M0rpWLYdzX8pr5uEwFIhVJlido5V8CRvgeOIgTsFnozW5muW70dWBFnWfBh4qmd25NI3/kidTvV
	yLJoSQ2PXxnwoddiHXb3vYh4luNDdjY6ldfrwhRpUZ1ya1IRe3OHm4wUL78kwmj/2mMFAU2Z6Kp
	aDsk=
X-Google-Smtp-Source: AGHT+IH3iDn2QARp1hU12Ij89unmFmTckuBxbgbwVWw3NsxmxzgB5zxbKWqK6YrXdS5LmZnaITwGiw==
X-Received: by 2002:a17:903:4405:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-23c6e4d680fmr37152175ad.10.1751454098421;
        Wed, 02 Jul 2025 04:01:38 -0700 (PDT)
Received: from rigel (61-68-193-107.tpgi.com.au. [61.68.193.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e3a23sm135084225ad.1.2025.07.02.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:01:38 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:01:27 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <20250702110127.GA51968@rigel>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
 <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <20250702101212.GA47772@rigel>
 <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>

On Wed, Jul 02, 2025 at 12:28:01PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jul 2, 2025 at 12:12 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > >
> > > I tend to not interpret it as adding new features. We really just
> > > *move* what exists under a slightly different path when you think
> > > about it.
> > >
> > > So what are you suggesting, remove the `edge` attribute and polling
> > > features from the new `value` attribute?
> > >
> >
> > Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
> > non-global numbering version.  The idea being don't port everything over
> > from the old sysfs - just the core feature set that non-cdev users need.
> >
>
> I mean, if someone shows up saying they need this or that from the old
> sysfs and without they won't switch, we can always add it back I
> guess... Much easier than removing something that's carved in stone.
>

Exactly - expect to be supporting whatever goes in now forever.

> Anything else should go away? `active_low`?
>

I don't personally see any value in 'active_low' in the sysfs API if you
drop edges. It is easy enough to flip values as necessary in userspace.
(From time to time I think it should've been dropped from cdev in v2 but, as
above, it is carved in stone now so oh well...)

Cheers,
Kent.

