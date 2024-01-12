Return-Path: <linux-gpio+bounces-2156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617982BF33
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 12:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3575286169
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 11:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B9867E7A;
	Fri, 12 Jan 2024 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YLROhBCw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6067E6D
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b7e4a2808bso1946837e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705058826; x=1705663626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0F+A7h0uJ2fddBkICIfKmPm3OFo9A/LDua65bRfYzM=;
        b=YLROhBCwkMqD4XKNtYLWNfi+3FSYuCTt74ByeqMgsz54B7Rj6Qhg8nIXYI63/mUvXB
         JQ7f+l9nTqDXlpiG+7QaN/SUyq0cu6YcizkJlFIvWvQ2xBukl7ev0wePoJwUR3uAP0gp
         23uNw2aq0e2pa54cO24MV/tL4aRcgdf1o5Dnq78wIuCEKpKqCRQge3GitOTOtgKCSVwI
         XpCa34IaNvrqeILfuhQzpgaSLJTkiuLhkPiLYSPJ+WXMzoYOrNDCbvYXVM6UrtJzFNYr
         F52J9kW+h4qfdpNDcp0LAK4pwwAr1+jA8a59nTl0TcvjLI16QQy0mCyf+bOm0/dgbTuB
         H57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705058826; x=1705663626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0F+A7h0uJ2fddBkICIfKmPm3OFo9A/LDua65bRfYzM=;
        b=iWZEqqV4rCIdfxiBPHcFjg6smuOM/VYcfn7ZWkL5VXY3CRrGwJGEVPM+G72o+Qmge9
         B567hkV2w86QL5KwKeUWCPViXN7GNmhLYNDmIaHCYwiBaxqhIArs8+X7fhqXBHwTY8D9
         yAJaraBS69id8dbgpY3NdIH3QmFTHJUR6qEGppuIxdJEvbjO+l3+rptvBAstu/zR3bE7
         hxF9VxjoV8PPTA+uS51bsDENJ8s82peIoqQT7bc4nLyEKxEfwcOzujVhZzCtVG73zITa
         qeGZ9Bqgn9/nrTX9im8ac6ey+CjgKnK1KCyajgmOCeLykr3dA/0A2UzmNrFVX7cBSRuz
         gtFA==
X-Gm-Message-State: AOJu0Yy5XkwEihSGo3FJ1AJZYhZJhUAUlzYF2MwTwUNuoFngTdeV5LNU
	bmdg4amS7xV4eoylNlsy77/Ccho+rxRuwejfD1/0xyAD2sn9Gg==
X-Google-Smtp-Source: AGHT+IFR7RtqUB/axiNj4YE8ZR0L7E3GoGsvUXlQJoxQucYWlxiukCK9KlJxoAGRlZO7vcBP1ULJ4gSsV4dzShS3mCw=
X-Received: by 2002:a05:6122:1b0c:b0:4b6:ce08:cc76 with SMTP id
 er12-20020a0561221b0c00b004b6ce08cc76mr980082vkb.9.1705058826283; Fri, 12 Jan
 2024 03:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
 <20240112003558.GA3310@rigel>
In-Reply-To: <20240112003558.GA3310@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Jan 2024 12:26:55 +0100
Message-ID: <CAMRc=MfeZTynTrdQdMqqvsMYsNo5yHgo+LzuRdqYpg-oZC+f6A@mail.gmail.com>
Subject: Re: Assign line names at runtime
To: Kent Gibson <warthog618@gmail.com>
Cc: "Westermann, Oliver" <Oliver.Westermann@cognex.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 1:36=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Jan 11, 2024 at 04:52:24PM +0000, Westermann, Oliver wrote:
> > Hey and thanks for your responses, those are actually quite insightful.
> >
> > What I read from that is that changing line names really has a lot of
> > implications.
> >
>
> After sleeping on it, I don't think line renaming is actually such a big =
issue.
>
> Firstly, hot plugging means the line namespace is never going to be
> static, even if I was tacitly assuming it was.  Turns out I don't think
> that matters as much as I thought anyway.  We just need to make sure the
> user is aware of it as well.
>
> The analogy I would use is files in a filesystem, where the chip
> corresponds to a directory and the line a file.  We aren't terribly
> concerned that a file may be renamed while we do a find, or while
> opening or using a file, so it should be the same for a line.
>
> We rename a file through the directory, so it makes sense to rename the
> line through the chip, and not require the line to be requested.
> So we would add a new ioctl on the chip to perform the rename.
> Could make that more general in case we ever add something else to line
> info that isn't controlled by requesting the line, but I'm note sure the
> additional complexity would be worth it, given how unlikely that is.
> But I digress...
>
> We don't inform a user with an open file that it may have been renamed
> while open, so neither would we with the line. If it is an issue for you
> then you can add a watch on the line info, similar to using inotify
> on the filesystem.
>
> The point the analogy breaks down a bit is that we allow duplicate names,
> (I don't think anyone really wants that feature, but historically it has
> been allowed so we're stuck with it.) but I don't think that is of any
> consequence to this discussion.
>

This analogy is great and all but there's one issue with it - we're
not dealing with a filesystem that everyone can modify. We have more
or less agreed so far that we allow multiple readers of GPIO
information but whenever there's any setting done, one needs to
request the line for exclusive usage. Now we'd break that logic by
allowing all users to arbitrarily rename GPIO lines and I don't like
this.

> If we did want to provide a consistent view of the line namespace, that
> might be something the GPIO daemon provides. (conveniently handballing
> the problem to Bart ;-)
>
> > Kent Gibson wrote:
> > > Alternatively, are named lines the right solution to your problem?
> > > Is it important to you that the lines are correctly named, or are you
> > > just using the name for the chip/offset lookup?
> >
> > We would really like to use named lines as they are really convinient, =
but
> > your question actually made me rethink my initial question. We do actua=
lly
> > not want to change line names, they are constant throughout the runtime=
 of
> > a device.
> >
> > > If the latter perhaps roll your own pinout lookup based on the platfo=
rm configuration?
> >
> > The truth might lay in between: We would prefer to use existing feature=
s and
> > standard interfaces instead of rolling out our own layer. But maybe it'=
s
> > just the initial naming that we want to move. A better solution might b=
e to
> > add another option to define and probe the GPIO driver at runtime: Inst=
ead
> > of being required to set all information in the dtb (and therefore from=
 a
> > very low level), we might trigger the probing through modprobe and prov=
ide
> > the GPIO line names from userspace. I'm not sure if such an option exis=
ts
> > currently?
> >
>
> That sounds like the job of the udev rules that Bart suggested - once we =
have
> the ability to rename lines from userspace.
>

It would make sense if we could get a udev event about the device
being created, pass device properties - in this case gpio-line-names -
to the kernel for this device and then get it bound to the driver. I
don't think it's possible but I need to look deeper.

Bartosz

> > Best regards and sorry for the quoting style, our mailservers mess with=
 your
> > mails.
> >
>
> No problem with your quoting style - that looks fine to me - it was the l=
ack
> of line wrapping that was the issue. And your response isn't tied into
> the email thread either, which is a bit unfortunate.
>
> Oh, and it would be handy to prefix libgpiod specific questions with
> [libgpiod], though in this case it has rapidly moved into kernel space
> anyway, so no biggy - just for future reference.
>
> Cheers,
> Kent.

