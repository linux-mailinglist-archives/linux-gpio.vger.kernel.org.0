Return-Path: <linux-gpio+bounces-2144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C410782B8A2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 01:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CB51F24C06
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 00:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E17262D;
	Fri, 12 Jan 2024 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2Rnmain"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E7377
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 00:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28ca8a37adeso4978941a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 16:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705019763; x=1705624563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgi6Ho/s9FV8aQ/303Oq+LGY4FxmHc3/kUwWFysJxBg=;
        b=i2RnmainWC4/JMTJZFbE32EvALasBdWN45FFJ860sPuIaZJDQf6pdKcz+6a815Ecfq
         iPC2wsWFtXGotnOGtjzMWv2yQB8O6jQvvsg5RTyMXmE8ZfvP3areX/JsCxky4ACOCkDj
         PAqZinPwbhENo1i5zpe7SbgN3rTNTUXJ7dQG7fKh7Pt1u0E8wczs7j73iivUx95AcNI2
         RIUrrIEJoLY3RaV8BS3JelGoyXlS2yQRZdRuc9p/hyVM9ZAHzpQt9+X2eRRMuIAnEkKY
         EVAMTNeTXOkYsvYCFWfpOl19D9dcFO0cZ0Zxc7czwFD2JhQyYVe/ZahEwFEI6VLnOytY
         /0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705019763; x=1705624563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgi6Ho/s9FV8aQ/303Oq+LGY4FxmHc3/kUwWFysJxBg=;
        b=TKqlNRPNkHvPkRfjfk1JWXUfbvbguI9ohkjcn7NAy7un9FoTqpduYVukNBQGOpHZqp
         G1h5xXvb4wIVL+VqxTFX2Mb3qXw7UlXoV/zEWt3KlUj1oKfRSLlsI2JMXuR4x7vt4Zu8
         Fiaj2FoCckHUbDOMAO7YLishSf2ut0Zxoojc90UINySbkynfVBEkKtCFfuyX9SOCeQ22
         Q3W7TezsiN9pWgpOU+AQ+KPn7F2ooypFYO4cos1wFz78S97US+0E8ONx618YHwWwhrya
         w3wRBSF8VCyIYSd16vfC9pSyXlCIlZkvkkeEeAMDuP2W6E8s91yi/o/hXyQNGvmB+47P
         DlSQ==
X-Gm-Message-State: AOJu0YwP5ZCvZiP1bHqwGr8p6nmC022am0MI0FVU1ynnwSgl91rNGTEd
	xBzDPFlmZ9uWULnthpJ+d68=
X-Google-Smtp-Source: AGHT+IHQwcYOnkeDLkGsMgLFA8goARw+fxx6+d8PgDfT+GshXDXaJluuh0vdu+haEnNLn16UlBN2Qw==
X-Received: by 2002:a17:90b:3705:b0:28d:fdbe:8b35 with SMTP id mg5-20020a17090b370500b0028dfdbe8b35mr580489pjb.78.1705019762768;
        Thu, 11 Jan 2024 16:36:02 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902650f00b001d07d83fdd0sm1812077plk.238.2024.01.11.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 16:36:02 -0800 (PST)
Date: Fri, 12 Jan 2024 08:35:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
Cc: "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Assign line names at runtime
Message-ID: <20240112003558.GA3310@rigel>
References: <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>

On Thu, Jan 11, 2024 at 04:52:24PM +0000, Westermann, Oliver wrote:
> Hey and thanks for your responses, those are actually quite insightful.
>
> What I read from that is that changing line names really has a lot of
> implications.
>

After sleeping on it, I don't think line renaming is actually such a big issue.

Firstly, hot plugging means the line namespace is never going to be
static, even if I was tacitly assuming it was.  Turns out I don't think
that matters as much as I thought anyway.  We just need to make sure the
user is aware of it as well.

The analogy I would use is files in a filesystem, where the chip
corresponds to a directory and the line a file.  We aren't terribly
concerned that a file may be renamed while we do a find, or while
opening or using a file, so it should be the same for a line.

We rename a file through the directory, so it makes sense to rename the
line through the chip, and not require the line to be requested.
So we would add a new ioctl on the chip to perform the rename.
Could make that more general in case we ever add something else to line
info that isn't controlled by requesting the line, but I'm note sure the
additional complexity would be worth it, given how unlikely that is.
But I digress...

We don't inform a user with an open file that it may have been renamed
while open, so neither would we with the line. If it is an issue for you
then you can add a watch on the line info, similar to using inotify
on the filesystem.

The point the analogy breaks down a bit is that we allow duplicate names,
(I don't think anyone really wants that feature, but historically it has
been allowed so we're stuck with it.) but I don't think that is of any
consequence to this discussion.

If we did want to provide a consistent view of the line namespace, that
might be something the GPIO daemon provides. (conveniently handballing
the problem to Bart ;-)

> Kent Gibson wrote:
> > Alternatively, are named lines the right solution to your problem?
> > Is it important to you that the lines are correctly named, or are you
> > just using the name for the chip/offset lookup?
>
> We would really like to use named lines as they are really convinient, but
> your question actually made me rethink my initial question. We do actually
> not want to change line names, they are constant throughout the runtime of
> a device.
>
> > If the latter perhaps roll your own pinout lookup based on the platform configuration?
>
> The truth might lay in between: We would prefer to use existing features and
> standard interfaces instead of rolling out our own layer. But maybe it's
> just the initial naming that we want to move. A better solution might be to
> add another option to define and probe the GPIO driver at runtime: Instead
> of being required to set all information in the dtb (and therefore from a
> very low level), we might trigger the probing through modprobe and provide
> the GPIO line names from userspace. I'm not sure if such an option exists
> currently?
>

That sounds like the job of the udev rules that Bart suggested - once we have
the ability to rename lines from userspace.

> Best regards and sorry for the quoting style, our mailservers mess with your
> mails.
>

No problem with your quoting style - that looks fine to me - it was the lack
of line wrapping that was the issue. And your response isn't tied into
the email thread either, which is a bit unfortunate.

Oh, and it would be handy to prefix libgpiod specific questions with
[libgpiod], though in this case it has rapidly moved into kernel space
anyway, so no biggy - just for future reference.

Cheers,
Kent.

