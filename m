Return-Path: <linux-gpio+bounces-1899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB581FC4A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 02:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFEC41F2245F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 01:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934281382;
	Fri, 29 Dec 2023 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W661fIhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F99137F
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so70429421fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 17:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703811707; x=1704416507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZJrBhZKbJPqSu4iblF00C1MMP+Q2YLVSomyDHhvxMk=;
        b=W661fIhCOB6oTbU0uqcNRKUXI8ArCw2prIu9Y2FRGym2xfoP2RuvDFckXctKDtcnks
         SFYP90tN2EJV4/LX5Q4rCnuvwB07d0mRP4DNBOagupL/lN5XVo7kj7EhXLPN/ftsQTYg
         0d8updgW+XZBOOTX89A/jZ3xiNSLA31Cb2uCQWwjlpxd0FeGotnuOb2q1W5W12P9lt23
         lT1KxNDPuSFi2LZR/41MvRrqjVcQRw5m8BRz8r+DCrUviTCq8x2l60/xZfE6sM5mN+82
         0D+tnIKLkQCQ3Z2m4gqek0dksUdstr/VL3Ixim5SDf6rXiRxTuEcVlx2WffIVCO3qkIt
         hdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703811707; x=1704416507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZJrBhZKbJPqSu4iblF00C1MMP+Q2YLVSomyDHhvxMk=;
        b=hf/uVqIi8mV4D91OztcmK2Y2tveahMLuarP+5VAA7J+hWjcyqvzVzGgFeBMD3zC/+k
         A9tZjAwimtRJ6VP7eq1YI++69Z8ETf7LKHhMIQh9l6HWygf601NXOrhrCmkka261nc+u
         Zln5Q953hGtfavDiIz9arXim3EjnXs7CVgFfVnZ2gT3bbsmok0OgSk7MfufznWfVIXJc
         wPEZxyv5+uowFwavvCTIiY5rLxZ1315dli0cAMeFuh6tt6ngqLTlsKuRd5csXqMboGLM
         oVWDS+kv/TeCpUoqLrr747wc4IFxmns+lXtrYEkp+zGVDigkhAMZj/Kkmg4QjByUkjVM
         mydA==
X-Gm-Message-State: AOJu0YyIK3pAIAzENFcl4yEcn5c6wHniR2/N6ZigITNMKwm76ZSSK9Ku
	OM76bzZwQyoTZjws4s+g5JfNJidZBzATuq6klB4aPvutOAc=
X-Google-Smtp-Source: AGHT+IEmmobnu6hps6i1iPh7lBYY2Zz/p8uq7o1LiiTn8gQcRg6ZzyygQ+fk5l2lKHVE4qUwYki35l1FxRcEoqhbHsA=
X-Received: by 2002:a2e:4c09:0:b0:2cc:63b4:b2d0 with SMTP id
 z9-20020a2e4c09000000b002cc63b4b2d0mr3977780lja.98.1703811707238; Thu, 28 Dec
 2023 17:01:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel>
In-Reply-To: <20231228092915.GA67274@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Thu, 28 Dec 2023 19:01:10 -0600
Message-ID: <CAJ8C1XNXSHXpRcsBWJmrGRa2dg2VxBVo1BG6KC8mio7keYy_tg@mail.gmail.com>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 3:29=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > Hello,
> >
> > I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'd
> > like to share a few thoughts from that experience. By way of
> > introduction, I have a degree in Electrical Engineering, and I like to
> > experiment and build things using "small computers" that run Linux. I
> > have zero Linux kernel experience. I did my testing on a Raspberry Pi
> > model 3 running a variant of Debian "bullseye".
> >
>
> Then you might want to update your kernel - the kernel device driver was
> changed to support peristing [1].
>
> I get this on my Pi4 running bookworm:
>
> $ gpioset -t0 GPIO23=3D0
> $ gpioinfo GPIO23
> gpiochip0 23    "GPIO23"                output
> $ gpioget -a GPIO23
> "GPIO23"=3Dinactive
> $ gpioinfo GPIO23
> gpiochip0 23    "GPIO23"                output
> $ gpioset -t0 GPIO23=3D1
> $ gpioget -a GPIO23
> "GPIO23"=3Dactive
>
>
> I can confirm that the line values output match those reported by
> gpioget, so the gpioset is persisting.
>
> Btw, that device driver change should even be in recent Pi bullseye
> kernels too - I just happen to be running bookworm.
>
> > 1. I do not agree with the lack of "persistence" - at least as far as
> > it seems to be practiced in the 'gpioset' tool. When it comes to
> > "turning things ON and OFF", there is a long-established paradigm that
> > says when something is 'turned ON', it remains ON until the user takes
> > an action to turn it OFF. This seems simple and obvious to me. Using
> > the light switch in my bedroom as a simple example, I cannot see the
> > logic behind a Design Decision that requires me to keep my finger on
> > the light switch to keep it OFF so I can sleep.
> >
>
> The issue here is one of resource management and ownership.
> gpioset cannot guaranteed the state of the line after it returns as it
> no longer owns it - the ownership is contained in a file descriptor
> returned by the kernel, and a process' file descriptors are all closed
> automatically when a process exits.
> Ownership then returns to the device driver which may do what it sees
> fit with it.
>
> The gpioset documentation mentions that the line will return to its
> default state, which is typically and historically the case, but this
> is not strictly correct - it is up to the device driver what happens to
> the line.
> And, as demonstrated above, with the current Pi GPIO device driver the
> allows the line state to persist.
>
> I ramble about this more in my answer to a related question on
> StackExchange[2].
>
> > When I was in school we studied 'state machines'. I felt I had a
> > decent understanding of them - they were useful in designing automated
> > systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
> > turned on its ear! We can 'set' a GPIO pin to a state, but that state
> > reverts immediately (a single clock cycle?). There seems to be an
> > underlying thought/theory at work in 'gpioset' that demands that it be
> > kept resident in memory to maintain a 'state'. There may be hardware
> > systems that demand continuous software oversight to function, but I
> > know of no such GPIO hardware systems. Also, AFAIK previous
> > programming interfaces/libraries all had "persistence".
> >
>
> > I'll make one final comment re. 'gpioset' wrt to the '-z / -daemonize'
> > option: First, this option seems to admit the failings of "lack of
> > persistence", but beyond that lies a question: How does one control
> > the daemon? The only way I could terminate the daemon was to search
> > for, and then kill the process. At least with '&`, one gets
> > notification of the process id.
> >
>
> The -z option is for a set and forget use case - the keep the finger
> on the button that you mentioned above.
>
> If that doesn't fit your use case then don't use the -z option?
>
> If you want a simple daemon then try a script line this:
>
> #!/bin/bash
> # Example of using the gpioset --interactive mode to create a simple GPIO=
 daemon.
> #
> # Other programs can drive the GPIO by writing commands to the pipe,
> # e.g.
> #
> # echo toggle > /tmp/gpiosetd
> #
> # or
> #
> # echo "set GPIO23=3D1" > /tmp/gpiosetd
> #
> # similar to setting with the deprecated sysfs interface.
>
> pipe=3D/tmp/gpiosetd
> mkfifo $pipe
> trap "rm -f $pipe" EXIT
> # as bash will block until something is written to the pipe...
> echo "" > $pipe &
> gpioset -i GPIO23=3D0 < $pipe > /dev/null
>
>
> > 2. Why does a tool with 'get' in the name write/change GPIO
> > parameters? Would it not make more sense to relegate 'gpioget' to a
> > simply **reading** and reporting the state of the GPIO?
> >
>
> You want the -a/--as-is option.
> If you use that, and no other options, then the electrical configuration
> of the line will remain unchanged.
>
> That isn't the default, as historically the expected and desired behaviou=
r
> is to switch the line to an input (which is always safe) and read the
> line.
>
> And the other options are there as you MAY want to change the
> electrical configuration.
>
> > I'll stop here. I don't really expect a considered reply because AIUI
> > this (libgpiod) project has been going on for 5 or 6 years now. I
> > assume that there have been other attempts to inject critical
> > thoughts, and they have clearly been dismissed. I felt that without
> > expressing my thoughts here I would fall in with the silent majority
> > whose enthusiasm and support for the present design is assumed... I
> > can't have that. :)
> >
>
> Cool, hope you feel better soon.
>
> Cheers,
> Kent.
>
> [1] https://github.com/raspberrypi/linux/commit/022689f0973d87956b2e5e8aa=
a0c29803cdb2a71
> [2] https://raspberrypi.stackexchange.com/questions/136479/confusion-with=
-libgpiod-and-the-gpiod-user-tools/143016#143016

Thanks for your response, Kent... but really - there's no need for a
supercilious remark like "hope you feel better soon"; you could
improve your communications if you'd drop remarks like that.

Anyway - I'm still wrestling with the "persistence" thing, but you've
made some good points.  The view is still a bit hazy, but perhaps I'm
seeing the "bigger picture" now? And I finally got around to reading
your post on SE; I made a comment & asked another Q.

One thing I'll comment on now is wrt the 'gpioget' tool, and the '-a'
option. If you want to create a tool, and call it 'gpioget' my feeling
is that a **read only** behavior should be the default. I'd recommend
you consider making that the case, and use the '-a' option to mean
"adjust"  :)

I'll follow up on the persistence business later, but just in case you
can't be bothered reading my comment to your SE post, let me re-state
the question I posed there:

I skimmed through your reference to the [GPIO chardev
uAPI](https://github.com/raspberrypi/linux/blob/rpi-6.1.y/include/uapi/linu=
x/gpio.h).
I noted that there are several deprecated 'struct's in that API that
were part of ABI v1. QUESTION: Are these deprecated 'struct's used by
the `libgpiod v1.6.2/.3` - i.e. the libgpiod that is now current in
RPi bullseye (1.6.2) & bookworm (1.6.3)?

Rgds,
~S

