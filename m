Return-Path: <linux-gpio+bounces-2148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023AF82BB4F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 07:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C06DB24BE4
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 06:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800C615AC8;
	Fri, 12 Jan 2024 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Afyh3i8I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A5C42049
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4414ec9c7so32325755ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 22:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705041122; x=1705645922; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqlqGW4YjVtbFHmzQYsaO3OR2BJtRqKKyL7O0ay4TBs=;
        b=Afyh3i8IuEsXCk3niDbab5Yy64xrfxb/mXL7WezVlURwD9IIFAEL/SWJsO53eCoDwV
         Esm7CMUXolIHESORCqPx2NbMPtn+LqokG/X3xSZ0EESErfsy/rSjVowEqEpT1T1JSlu5
         Ee8VxSYAWSu4vgDwMIW5DnFk2ZmoGrjZdoblWwsHJqqS4qng5IiOnH74d08vRuV5qdba
         7UiADzhCUO0LjPWkWtTbzyRM4kGEMloLuAip0rTDhexCO/lUKV/bh09GmMhyUKjOK158
         68TRpYUvueLBJT7b5Si4UceLSGcSwyRJVTiCmzn1N+vwJlTmjxc3F/wzMWuRVqnGHezW
         5iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705041122; x=1705645922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqlqGW4YjVtbFHmzQYsaO3OR2BJtRqKKyL7O0ay4TBs=;
        b=AgToPAeSHEHmVrCyf9wwP9PexriNkJF/1ZYVKRam5FqatWtQiv9ZwywqUz7j0JiFaw
         RRK6UN/bW9l2ghDwqDmlraWs9OwNAwTJXG9XfKK2EO3H4NAWL40czipF2ZKfMTEG3XYk
         vl5LShGGWQzzS2tO55C3mUSU8iW7w8frAPUeKKXMI/F3W2SktbIeY3jqN7qGTFie3IR/
         1fmW8goKZptaWPuailGwOIxuPSwpRb9C6gatL3uWOelIyuEm0e4qvTCFPfDyrdmBoUJ8
         NtpYdvuBGuwus9SQC9cqiDg05aRRfc8EsDSvqd3Yh80HGrRQGE7WYmc7Mn0+fDS+0BJG
         thXA==
X-Gm-Message-State: AOJu0YxxLncinUjgxLwDo7ZDHMwGYIzaETQu10JouBPT8WrwP/eZNOGX
	A103jGlcC7ctrRKf660EDitxVXYZF0wcCQ==
X-Google-Smtp-Source: AGHT+IGFs+D78dkFHXyuihiNWYuf1VEfbdzTQEWY05rqdA2fzFuBRqG13AbZ1PZNX10PlDRwFId1tw==
X-Received: by 2002:a17:902:780f:b0:1d4:ca41:da4a with SMTP id p15-20020a170902780f00b001d4ca41da4amr300251pll.22.1705041121932;
        Thu, 11 Jan 2024 22:32:01 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090282c600b001cc2ebd2c2csm2273354plz.256.2024.01.11.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 22:32:01 -0800 (PST)
Date: Fri, 12 Jan 2024 14:31:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [libgpiod] Feedback from the Raspberry Pi community
Message-ID: <20240112063158.GA22114@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've been poking around various forums looking for libgpiod related
problems recently, and most recently stuck my nose into
forums.raspberrypi.com.  What was I thinking??

Turns out the Raspberry Pi community is in a bit of turmoil.
Historically they have had three options for userspace GPIO; sysfs,
gpiomem (which exposes the hardware registers to userspace) and
libgpiod.  The Pi devs have finally seen the light and are moving away from
the sysfs interface.  That only took what, eight years?
At the same time the recently released RPi5 is incompatible with the existing
gpiomem approaches as their new architecture has a very different register map.
Rather than continuing down that path, the Pi devs have realised
the problems inherent in that approach and are now endorsing the
standard Linux interfaces as the correct way.  So libgpiod has gone from
being their last resort GPIO interface, since sysfs and poking at
registers is so much easier, to now essentially being the only choice.

Of course this means libgpiod is getting a lot more of their attention
and, as it doesn't provide a seamless plug-in replacement for their
existing solutions, they are not happy and have taken to blaming libgpiod
for their wows.

Here is a short list of their grievances:
 - forum
 - packaging v2
 - persistence
 - ownership

I'm not claiming that to be exhaustive, but those are the major issues.

In more detail:

Forum:

While I've gotten them to understand (fingers crossed) that the linux-gpio
mailing list is the contact point for libgpiod, that isn't very
approachable for the average user who would be more comfortable with a
github-type experience with an issue tracker, wiki, etc.

I agree with that.  I've raised it before and again now.
Having an interactive website of some form would improve community
engagement enormously.
I'm not sure what form that should take, and I'm not suggesting moving
the primary repo from kernel.org or changing the development process,
but I don't see how, say, having a github mirror that could double as
the community engagement hub could hurt.
(ok, on second thought after re-reading that, I can see how that
**could** hurt, but I was thinking in terms of increasing engagement, not
having to deal with some of the cr*p that would inevitibly land there.)

Anything that would help address the misunderstandings,
misinformation, and outright propaganda I've seen out there can only be
a good thing, right :-| ?

Packaging:

Raspberry Pi OS is based on Debian, currently bookworm.
The problem there is that libgpiod v2 didn't make it into bookworm so they
are still on 1.6.3.  The problem I see there is that their user base will
migrate onto v1, and then have to face another migration to v2 somewhere down
the track, when we would obviously prefer they migrate direct to v2.

The problem as they see it is that they like the gpioget --as-is option
in v2, as it works with the driver/persistence solution that I will get
to later, but that option is not available in v1.

Either way, the Raspberry Pi devs appreciate that v2 would be preferable
and appear interested in packaging libgpiod v2 themselves, rather
than waiting for Debian, and IIUC are looking into doing that.
They currently package libgpiod2 (libgpiod v1.6.3) and gpiod (libgpiod
tools v1.6.3).  I figure they can add a libgpiod3 package (libgpiod
v2.1) so they can install both library versions at once.  Wrt the tools,
update gpiod to contain the new tools and depend on libgpiod3, and allow
the user to pick which rev of the gpiod package they want to install, if
they want to support v1 or v2.
Requiring both versions of the tools seems like an extreme corner case
to me, and could be handled by having the user download, build and install
v1.6.3 into a non-standard location.  Alternatively they can package
them independently and rename the binaries from one...

I don't think there is anything we need to do here, and with any luck
this will be resolved in the near future.  Maybe just keep an eye on it.

Persistance:

Most Raspberry Pi users want to be able to call something from shell to
set an output line and have it stick after it returns.
This means they absolutely hate gpioset as it either doesn't stick
(depending on the driver) or doesn't return.  The Raspberry Pi devs have
addressed this by patching their GPIO driver to NOT revert GPIO lines to
their default state when released.  This solves most of their use cases,
other than the gpioget --as-is.  Raspberry Pi users are accustomed to being
able to read back the last value written to an output line, and insist
vociferously that any other solution is a bodge. :-).

The two solutions I see are the --as-is option and the daemon.  Sadly
neither is currently available to them via standard packages.

So two things we could do; the first is backport the --as-is to v1.
Ironically there is a patch[1] for this early in the v2 development that
I had thought was also in the v1 tree, but apparently not.
Perhaps backport that to v1, possibly making it closer to the v2 option
if possible?
Not at all sure this would be any faster than the Pi devs packaging v2
and it might even reduce their incentive to package v2, so maybe just
focus on that....

The second solution is the dbus daemon.  Which beings us to...

Ownership:

Pi users are used to shared access to GPIO lines and are content to use
GPIO output lines to share state.  A line being held by one app being
inaccessible to others is an alien concept to them.

I did suggest shadowing the value in a tmp file as a workaround, but that
is considered far too bodgy :-).

The solution there is the dbus daemon. That would allow them to perform
random sets and gets on arbitrary lines on a whim, just like they do now.
They seem very open to that option, both the Pi devs and end users, so the
sooner the daemon can be available the better.

That covers the main points.  For the most part they are coming
around to the conclusion that libgpiod can do the job for them after
all, despite their long held biases.

Cheers,
Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3a912fbc1e2697f4479396fd11557b943b31d217


