Return-Path: <linux-gpio+bounces-2154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132B82BE88
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 11:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BC0FB20DAE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 10:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9376F5FEE7;
	Fri, 12 Jan 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="olxn7fuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA465EE61
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbed5d1ffb0so5823538276.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705054948; x=1705659748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVWLL3lmym4yw0fnNkxoVaMxr0aoy54FvXecMWwQQGk=;
        b=olxn7fuOoWWdg6w0cK8hWLcSzZ4sY9x2FMUYt42RrdvBlKXwfEO2ENq9spP6qmuTsI
         7cEFUqBxyV/2Bt3eel2Z0yzBCP5Gcvsb5yVeE9Fy4rAro1dFoutfOkbAooH9gl4ESKVT
         qsUYgT4wblOvt2E9jGXj8Udt6VjgNuwiHwAfpk4jeyZUlftyisLqnbNAnaTnpkIP6hfT
         TBPhrFVuDyrFpkZ8noqs861qrhfT8CfCLqfUijTD3UQM5qZPW/a5exDNxxnpQqfkx7gt
         uY9sKKeu+gEvxOqCQtjtasiyw2mjhpy7J4oRjusAHNu+u3SxY2tMB36NHuFsHcBVxHpR
         EkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054948; x=1705659748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVWLL3lmym4yw0fnNkxoVaMxr0aoy54FvXecMWwQQGk=;
        b=rGKc0aNi74mKZcrO1YlxLyENBNAtLGq96WXOdz82FTXHBMClYldAwMiBwsGoszX7q0
         zK3sIoN6+SkHTE1SAYZK5n4j+5xp5OdqZ3Zkl/27KlkIZHUWEyHevFWtoyHw+n1uZMff
         F5UwKtrMgUCMrPoSjDQaLr5oSzi3fD41janQO0SKWYLWunNuxLaizjrv+yB9aOlf6Ov7
         tHTZfWVYlG9J/EWj6u5gRtG/a6pfKz4sD9ubWcKHZ8Z6Zp4+RQzuvgBnHJ1d68KO1gCW
         8MwutFxDFJGPsBSyKTUVtKGW+cTEJlzxQC0eScIIPqltUmudV8BIwsmjpRQHirMLvX3i
         rBtg==
X-Gm-Message-State: AOJu0YyU3fYdG618iV6mR6SlDzlv3dsteQPzwWaKKLtJ4DpIpfPKdg2f
	2Thov2G31BGAXi1CLBUxNr/b1v/0zOHV04q1lcQ1StNq5SsmDw==
X-Google-Smtp-Source: AGHT+IFk2s2PyjJca5tBk2r2dLITHPWC5cwD5QA0cz2yRMl2TlKaCWXYMEvvlpsqmrjt/XXq82DQNxXmd/WC1+Cgvrg=
X-Received: by 2002:a05:6902:1a41:b0:dbd:b54e:56f0 with SMTP id
 cy1-20020a0569021a4100b00dbdb54e56f0mr483183ybb.79.1705054948438; Fri, 12 Jan
 2024 02:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112063158.GA22114@rigel>
In-Reply-To: <20240112063158.GA22114@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Jan 2024 11:22:17 +0100
Message-ID: <CAMRc=MeWUA1UmWa3Bm3FLkheFRUNZJq8Cmwv2=3infezJkpV2A@mail.gmail.com>
Subject: Re: [libgpiod] Feedback from the Raspberry Pi community
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 7:32=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> I've been poking around various forums looking for libgpiod related
> problems recently, and most recently stuck my nose into
> forums.raspberrypi.com.  What was I thinking??
>

Thank you for doing this Kent. This email is very useful.

> Turns out the Raspberry Pi community is in a bit of turmoil.
> Historically they have had three options for userspace GPIO; sysfs,
> gpiomem (which exposes the hardware registers to userspace) and
> libgpiod.  The Pi devs have finally seen the light and are moving away fr=
om
> the sysfs interface.  That only took what, eight years?
> At the same time the recently released RPi5 is incompatible with the exis=
ting
> gpiomem approaches as their new architecture has a very different registe=
r map.
> Rather than continuing down that path, the Pi devs have realised
> the problems inherent in that approach and are now endorsing the
> standard Linux interfaces as the correct way.  So libgpiod has gone from
> being their last resort GPIO interface, since sysfs and poking at
> registers is so much easier, to now essentially being the only choice.
>
> Of course this means libgpiod is getting a lot more of their attention
> and, as it doesn't provide a seamless plug-in replacement for their
> existing solutions, they are not happy and have taken to blaming libgpiod
> for their wows.
>

Of course they have, the world revolves around RPi after all, doesn't it? :=
)

> Here is a short list of their grievances:
>  - forum
>  - packaging v2
>  - persistence
>  - ownership
>
> I'm not claiming that to be exhaustive, but those are the major issues.
>
> In more detail:
>
> Forum:
>
> While I've gotten them to understand (fingers crossed) that the linux-gpi=
o
> mailing list is the contact point for libgpiod, that isn't very
> approachable for the average user who would be more comfortable with a
> github-type experience with an issue tracker, wiki, etc.
>
> I agree with that.  I've raised it before and again now.
> Having an interactive website of some form would improve community
> engagement enormously.
> I'm not sure what form that should take, and I'm not suggesting moving
> the primary repo from kernel.org or changing the development process,
> but I don't see how, say, having a github mirror that could double as
> the community engagement hub could hurt.
> (ok, on second thought after re-reading that, I can see how that
> **could** hurt, but I was thinking in terms of increasing engagement, not
> having to deal with some of the cr*p that would inevitibly land there.)
>
> Anything that would help address the misunderstandings,
> misinformation, and outright propaganda I've seen out there can only be
> a good thing, right :-| ?
>

I see. While I prefer using the mailing list as the single point for
discussion and development, I understand that this opinion is not
shared by the majority of user-space developers out there. I will
reopen the original github repo[1] for reporting issues. Possibly for
sending PRs as well for initial discussion but I'd prefer to pass all
patches going into libgpiod by the mailing list anyway in the end.

> Packaging:
>
> Raspberry Pi OS is based on Debian, currently bookworm.
> The problem there is that libgpiod v2 didn't make it into bookworm so the=
y
> are still on 1.6.3.  The problem I see there is that their user base will
> migrate onto v1, and then have to face another migration to v2 somewhere =
down
> the track, when we would obviously prefer they migrate direct to v2.
>
> The problem as they see it is that they like the gpioget --as-is option
> in v2, as it works with the driver/persistence solution that I will get
> to later, but that option is not available in v1.
>
> Either way, the Raspberry Pi devs appreciate that v2 would be preferable
> and appear interested in packaging libgpiod v2 themselves, rather
> than waiting for Debian, and IIUC are looking into doing that.
> They currently package libgpiod2 (libgpiod v1.6.3) and gpiod (libgpiod
> tools v1.6.3).  I figure they can add a libgpiod3 package (libgpiod
> v2.1) so they can install both library versions at once.  Wrt the tools,
> update gpiod to contain the new tools and depend on libgpiod3, and allow
> the user to pick which rev of the gpiod package they want to install, if
> they want to support v1 or v2.
> Requiring both versions of the tools seems like an extreme corner case
> to me, and could be handled by having the user download, build and instal=
l
> v1.6.3 into a non-standard location.  Alternatively they can package
> them independently and rename the binaries from one...
>
> I don't think there is anything we need to do here, and with any luck
> this will be resolved in the near future.  Maybe just keep an eye on it.
>

I am very bad with distros. I have no idea how debian or red hat
packaging works (other than being a somewhat "advanced" user) and I
just let distro maintainers handle packaging of libgpiod. For my own
work I rely 100% on yocto and so keep the relevant recipes in
meta-openembedded up to date but that's all I have time for. So there
will be no help from my side on the debian packages. I just don't care
enough.

> Persistance:
>
> Most Raspberry Pi users want to be able to call something from shell to
> set an output line and have it stick after it returns.
> This means they absolutely hate gpioset as it either doesn't stick
> (depending on the driver) or doesn't return.  The Raspberry Pi devs have
> addressed this by patching their GPIO driver to NOT revert GPIO lines to
> their default state when released.  This solves most of their use cases,
> other than the gpioget --as-is.  Raspberry Pi users are accustomed to bei=
ng
> able to read back the last value written to an output line, and insist
> vociferously that any other solution is a bodge. :-).
>
> The two solutions I see are the --as-is option and the daemon.  Sadly
> neither is currently available to them via standard packages.
>
> So two things we could do; the first is backport the --as-is to v1.
> Ironically there is a patch[1] for this early in the v2 development that
> I had thought was also in the v1 tree, but apparently not.
> Perhaps backport that to v1, possibly making it closer to the v2 option
> if possible?
> Not at all sure this would be any faster than the Pi devs packaging v2
> and it might even reduce their incentive to package v2, so maybe just
> focus on that....
>
> The second solution is the dbus daemon.  Which beings us to...
>
> Ownership:
>
> Pi users are used to shared access to GPIO lines and are content to use
> GPIO output lines to share state.  A line being held by one app being
> inaccessible to others is an alien concept to them.
>
> I did suggest shadowing the value in a tmp file as a workaround, but that
> is considered far too bodgy :-).
>
> The solution there is the dbus daemon. That would allow them to perform
> random sets and gets on arbitrary lines on a whim, just like they do now.
> They seem very open to that option, both the Pi devs and end users, so th=
e
> sooner the daemon can be available the better.
>

I know. I'm half-way done with the locking rework for GPIOLIB and the
daemon is next on my TODO list. I'm estimating I'm 2/3 done with the
needed functionality.

> That covers the main points.  For the most part they are coming
> around to the conclusion that libgpiod can do the job for them after
> all, despite their long held biases.
>

That's good to hear. Thanks again.

Bartosz

[1] https://github.com/brgl/libgpiod

