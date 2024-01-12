Return-Path: <linux-gpio+bounces-2161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A682BFCA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 13:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D831C234BF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 12:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8805C8FD;
	Fri, 12 Jan 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBFzYsm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F18F5A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d4a980fdedso56608525ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 04:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705062669; x=1705667469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1OolU8jpYBLBz0flv37RXtStRBY+U5scxLgatZQG5s=;
        b=gBFzYsm4nrBIi3bJuDq/beNbdA3ebTYJKIknYHb1YC3x2r3y75PqykW7eL2d5//K+d
         +USXExlJWq1eGCF7dsF4pK8jMIT4MPWAdVKzAiGb8qYvNnG+Op4+sXITumAWMvP3s6SL
         bd/yOiwUntCPt7uk8Wun+U+6/TG0dK+8+UwM+Jys3fbH/uXOSzTH+8FP9DsGWQyde/6W
         wNpXFt2rgdvFAkrM50eC3/v2nRcziMBTm84Ayx/I7BYieQdhZH6owYFst8huzUg9k3Yf
         MUTO2DiJoz8iKBqP3I66++LdNCy8jKydEllxl2mm3QT+oLkXzX25LGmLpBofNyf8XZAe
         SK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705062669; x=1705667469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1OolU8jpYBLBz0flv37RXtStRBY+U5scxLgatZQG5s=;
        b=GI1RDIi4i6bCmkanpzgCpFNp3wyGteFjCJ/HUDuIN8zwP919f4/iIyX3xLWHMGSVek
         DZ4WLEDgmNi8uCb0nUXcBnKA18bfdO6MOG4M4g2O1ce9hTuxUfDSTx2se2JUGbDjnHwG
         GF8Nc0Nod5Gpm6zEderUzGlLxwLUTC6wBSQ7IIKRlk0AShvmYiwVpKiO+aQeCo4JlTA0
         h+H58stMihclSF8JuBcjCtpz04gGt1T0zViW5DLeBBak8HyiSJ+wYi4VXQ0ghKzJIx/V
         FBm0Od0nzFTnhXPniqkhMzmt8XA320yMt0R2aCXvyK/6ToB7TAXoim+O4ih+vsyWgETj
         opYg==
X-Gm-Message-State: AOJu0YyxCnIZrxBRZL7oce8CtiuxjIakMY91xSiRh4NYEH1BWO8jD49D
	Uv8xdI/7iXo9PsbXOW6Kp98=
X-Google-Smtp-Source: AGHT+IHw4Irkaw0cgGwwrD+4Fod2cyos4FgEYQ4mVuC6pB26RQNnRk5i/P5fBg/rQzPHwGX7/srYbQ==
X-Received: by 2002:a17:902:f7d3:b0:1d5:830:19bf with SMTP id h19-20020a170902f7d300b001d5083019bfmr838495plw.113.1705062669382;
        Fri, 12 Jan 2024 04:31:09 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id m18-20020a170902c45200b001d0cd351baesm3028642plm.13.2024.01.12.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:31:08 -0800 (PST)
Date: Fri, 12 Jan 2024 20:31:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Westermann, Oliver" <Oliver.Westermann@cognex.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Assign line names at runtime
Message-ID: <20240112123105.GA66782@rigel>
References: <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
 <20240112003558.GA3310@rigel>
 <CAMRc=MfeZTynTrdQdMqqvsMYsNo5yHgo+LzuRdqYpg-oZC+f6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfeZTynTrdQdMqqvsMYsNo5yHgo+LzuRdqYpg-oZC+f6A@mail.gmail.com>

On Fri, Jan 12, 2024 at 12:26:55PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 12, 2024 at 1:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jan 11, 2024 at 04:52:24PM +0000, Westermann, Oliver wrote:
> > > Hey and thanks for your responses, those are actually quite insightful.
> > >
> > > What I read from that is that changing line names really has a lot of
> > > implications.
> > >
> >
> > After sleeping on it, I don't think line renaming is actually such a big issue.
> >
> > Firstly, hot plugging means the line namespace is never going to be
> > static, even if I was tacitly assuming it was.  Turns out I don't think
> > that matters as much as I thought anyway.  We just need to make sure the
> > user is aware of it as well.
> >
> > The analogy I would use is files in a filesystem, where the chip
> > corresponds to a directory and the line a file.  We aren't terribly
> > concerned that a file may be renamed while we do a find, or while
> > opening or using a file, so it should be the same for a line.
> >
> > We rename a file through the directory, so it makes sense to rename the
> > line through the chip, and not require the line to be requested.
> > So we would add a new ioctl on the chip to perform the rename.
> > Could make that more general in case we ever add something else to line
> > info that isn't controlled by requesting the line, but I'm note sure the
> > additional complexity would be worth it, given how unlikely that is.
> > But I digress...
> >
> > We don't inform a user with an open file that it may have been renamed
> > while open, so neither would we with the line. If it is an issue for you
> > then you can add a watch on the line info, similar to using inotify
> > on the filesystem.
> >
> > The point the analogy breaks down a bit is that we allow duplicate names,
> > (I don't think anyone really wants that feature, but historically it has
> > been allowed so we're stuck with it.) but I don't think that is of any
> > consequence to this discussion.
> >
>
> This analogy is great and all but there's one issue with it - we're
> not dealing with a filesystem that everyone can modify. We have more
> or less agreed so far that we allow multiple readers of GPIO
> information but whenever there's any setting done, one needs to
> request the line for exclusive usage. Now we'd break that logic by
> allowing all users to arbitrarily rename GPIO lines and I don't like
> this.
>

Firstly, sorry if I gave the impression I'm all in on this idea - this
is still spitballing.

You are extending the analogy too far, I'm only applying it to names and how
name instability might be viewed from the user's perspective.
I was thinking it could be a deal-breaker, but if it is ok for the
filesystem then maybe not.

I have no problem considering the line name to be metadata, not data (line
configuration and value).

You aren't allowing all users - you are allowing those that have
permission to open the chip, so it can be locked down if necessary, the same
as requesting the line.

Having said all that, I am uneasy that this capability could be abused,
particularly in ways we can't anticipate.
So I'm at the point that I think we could do it, one way or another, but
much less certain if we should.
I would not consider it if there was an alternative.

Cheers,
Kent.

