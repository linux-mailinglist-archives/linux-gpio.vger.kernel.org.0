Return-Path: <linux-gpio+bounces-17431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F23A5C349
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C930516B78A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938125B674;
	Tue, 11 Mar 2025 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="IDBC+HDO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD531D88A4
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702167; cv=none; b=XuNVEWBthuTkJe0U2cCwKFWAUQRdn7mZVAPmDtHgb6EVkuDxORXnoZYDAXjmXhcN0K1HvyLbWEDDiBY37GSKfv5sHBpYVAG86EhwNkN+b5dB8noSbQwQlsAlAHvi201heVQ+X5UVG2GvjFe3fnnwXXYuI3dasv3kahwk0hALyK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702167; c=relaxed/simple;
	bh=yvQXTOenIw/rexLmtAwi2lUo0l516FbJ6cYE4QbYS8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3JJ9b+i49/xqnyfzKFyZNlDOaYNO8ID8Q2YVl0mi9BKEXKooeTyufhFZNzxUsEnAmO+bPvnLmocx78Ym3h4HpNfKy6X1xg6RY088HFu21aH0w1rIOR3kSflXuS9CqbK1K6QXl5k6+7Y0QgP+42aLu8jalFU2XlkQxxVIDcwDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=IDBC+HDO; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=sHJ/I/NwKEVR+tvM07hrs9JoMkywpmUnIKANpoAFlq4=;
	b=IDBC+HDOwmi/OnqaXdVV2t8/VymuRBIOrzerJ2kk+ZMmK8hBrsSnXRecbq5ANpkA0zSa4Oq+OOMlZ
	 qwNQ4VNNJo7MXtwtBL9COwcYUYA9CIkLpn0icSghrazT4rrBM4lKFydbG1nq/W+IaMd0196QfYCDKI
	 5Be3ufPmc9/LOrU2ZpByyEYMc4euw+nvwJ9zLjAUnfhIhWFuJ+wQEZ6KbfQvKZY0TWpx49ILSC+PGw
	 ix5DkoXsWKjVWOLe/ZfdZN94CmwY4v2yNPxZ5Htw8OpCa22Pc9q44Ot1g7jvAx4LZK6Sb+KFA1Cvkz
	 a3ZvuP36LTY1RJVL9TIeGZVLck+hYkw==
X-MSG-ID: 6bfec4b5-fe82-11ef-8b4f-005056817704
Date: Tue, 11 Mar 2025 15:09:17 +0100
From: David Jander <david@protonic.nl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson
 <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250311150917.3c11421a@erd003.prtnl>
In-Reply-To: <CAMRc=McLEtiF4tfGpOGW+agA8-BK_qU6UWjvq1BOgthWXXym3A@mail.gmail.com>
References: <20250311110034.53959031@erd003.prtnl>
	<CAMRc=MewC-7XFfWxPS7cmMycxo-62NDrUKFyjnnCbwqXQXWuZw@mail.gmail.com>
	<20250311133010.760abd61@erd003.prtnl>
	<CAMRc=McLEtiF4tfGpOGW+agA8-BK_qU6UWjvq1BOgthWXXym3A@mail.gmail.com>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Mar 2025 14:21:37 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Mar 11, 2025 at 1:30=E2=80=AFPM David Jander <david@protonic.nl> =
wrote:
> >
> > On Tue, 11 Mar 2025 12:45:51 +0100
> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > =20
> > > On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic=
.nl> wrote: =20
> > > >
> > > > On kernel 6.13, after git revert -n fcc8b637c542 time is back to wh=
at it was
> > > > on 6.12.
> > > > =20
> > >
> > > Interestingly: I cannot reproduce it. Obviously gpiofind doesn't exist
> > > in libgpiod v2 but I'm running gpiodetect with and without reverting
> > > these changes and am getting roughly the same results: ~0.050s real
> > > time for 1 up to 4 chips.
> > >
> > > Any idea why that could be? Can you reproduce it with libgpiod v2 (I
> > > don't know why that wouldn't be the case but worth double checking). =
=20
> >
> >
> > Can you describe your platform? Is it a multi-core or single-core CPU? =
What
> > RCU implementation does it use? Tree or tiny? If it is multi-core, is t=
here a
> > difference if you disable all but one core?
> > Maybe some kernel CONFIG option that makes a difference? I am not an ex=
pert in
> > RCU (in fact I barely know what it does), so maybe I am missing somethi=
ng that
> > makes this problem go away?
> > =20
>=20
> I'm testing on a qemu VM - SMP and single core. RCU algo is tree.=20

I haven't followed deep into the RCU code, but I had the impression that the
synchronize_rcu code sets a completion and waits for it, so I suspect the b=
ulk
of the delay coming from context switches. Maybe on qemu this behaves
differently than on real hardware in terms of timing and overhead?

Btw, there is also another way this can be made visible:

$ strace -r gpiodetect
     0.000000 execve("/usr/bin/gpiodetect", ["gpiodetect"], 0x7eec5d94 /* 1=
3 vars */) =3D 0
     0.017348 brk(NULL)                 =3D 0xc21000
     0.000689 access("/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such fil=
e or directory)
...
     0.000677 openat(AT_FDCWD, "/dev/gpiochip9", O_RDWR|O_CLOEXEC) =3D 18
     0.000741 statx(AT_FDCWD, "/dev/gpiochip9", AT_STATX_SYNC_AS_STAT|AT_SY=
MLINK_NOFOLLOW|AT_NO_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=3DSTATX_BASIC_=
STATS|STATX_MNT_ID, stx_attributes=3D0, stx_mode=3DS_IFCHR|0600, stx_size=
=3D0, ...}) =3D 0
     0.000794 statx(AT_FDCWD, "/dev/gpiochip9", AT_STATX_SYNC_AS_STAT|AT_NO=
_AUTOMOUNT, STATX_BASIC_STATS, {stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID, =
stx_attributes=3D0, stx_mode=3DS_IFCHR|0600, stx_size=3D0, ...}) =3D 0
     0.000794 access("/sys/bus/gpio/devices/gpiochip9/dev", R_OK) =3D 0
     0.000738 openat(AT_FDCWD, "/sys/bus/gpio/devices/gpiochip9/dev", O_RDO=
NLY) =3D 19
     0.000754 read(19, "254:9\n", 15)   =3D 6
     0.000597 close(19)                 =3D 0
     0.000569 ioctl(18, GPIO_GET_CHIPINFO_IOCTL, {name=3D"gpiochip9", label=
=3D"GPIOJ", lines=3D16}) =3D 0
     0.000631 statx(1, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_P=
ATH, STATX_BASIC_STATS, {stx_mask=3DSTATX_BASIC_STATS|STATX_MNT_ID, stx_att=
ributes=3D0, stx_mode=3DS_IFCHR|0600, stx_size=3D0, ...}) =3D 0
     0.000778 ioctl(1, TCGETS, {c_iflag=3DICRNL|IXON|IXOFF|IUTF8, c_oflag=
=3DNL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=3DB1500000|CS8|CREAD|HUPCL=
|CLOCAL, c_lflag=3DISIG|ICANON|ECHO|ECHOE|ECHOK|ECHOKE, ...}) =3D 0
     0.001941 write(1, "gpiochip0 [GPIOA] (16 lines)\n", 29gpiochip0 [GPIOA=
] (16 lines)
) =3D 29
     0.000670 close(3)                  =3D 0
     0.006162 write(1, "gpiochip1 [GPIOB] (16 lines)\n", 29gpiochip1 [GPIOB=
] (16 lines)
) =3D 29
     0.000655 close(4)                  =3D 0
     0.006250 write(1, "gpiochip10 [GPIOK] (8 lines)\n", 29gpiochip10 [GPIO=
K] (8 lines)
) =3D 29
     0.000667 close(5)                  =3D 0
     0.006338 write(1, "gpiochip11 [GPIOZ] (8 lines)\n", 29gpiochip11 [GPIO=
Z] (8 lines)
) =3D 29
     0.000661 close(6)                  =3D 0
     0.006321 write(1, "gpiochip12 [unknown] (22 lines)\n", 32gpiochip12 [u=
nknown] (22 lines)
) =3D 32
     0.000662 close(7)                  =3D 0
     0.006365 write(1, "gpiochip13 [mcp23s17.0] (16 line"..., 35gpiochip13 =
[mcp23s17.0] (16 lines)
) =3D 35
     0.000672 close(8)                  =3D 0
     0.006389 write(1, "gpiochip14 [0-0020] (16 lines)\n", 31gpiochip14 [0-=
0020] (16 lines)
) =3D 31
     0.000641 close(9)                  =3D 0
     0.006268 write(1, "gpiochip15 [0-0021] (16 lines)\n", 31gpiochip15 [0-=
0021] (16 lines)
) =3D 31
     0.000677 close(10)                 =3D 0
     0.006330 write(1, "gpiochip2 [GPIOC] (16 lines)\n", 29gpiochip2 [GPIOC=
] (16 lines)
) =3D 29
     0.000648 close(11)                 =3D 0
     0.006358 write(1, "gpiochip3 [GPIOD] (16 lines)\n", 29gpiochip3 [GPIOD=
] (16 lines)
) =3D 29
     0.000655 close(12)                 =3D 0
     0.006333 write(1, "gpiochip4 [GPIOE] (16 lines)\n", 29gpiochip4 [GPIOE=
] (16 lines)
) =3D 29
     0.000669 close(13)                 =3D 0
     0.006332 write(1, "gpiochip5 [GPIOF] (16 lines)\n", 29gpiochip5 [GPIOF=
] (16 lines)
) =3D 29
     0.000653 close(14)                 =3D 0
     0.006359 write(1, "gpiochip6 [GPIOG] (16 lines)\n", 29gpiochip6 [GPIOG=
] (16 lines)
) =3D 29
     0.000653 close(15)                 =3D 0
     0.006332 write(1, "gpiochip7 [GPIOH] (16 lines)\n", 29gpiochip7 [GPIOH=
] (16 lines)
) =3D 29
     0.000657 close(16)                 =3D 0
     0.006344 write(1, "gpiochip8 [GPIOI] (16 lines)\n", 29gpiochip8 [GPIOI=
] (16 lines)
) =3D 29
     0.000661 close(17)                 =3D 0
     0.006343 write(1, "gpiochip9 [GPIOJ] (16 lines)\n", 29gpiochip9 [GPIOJ=
] (16 lines)
) =3D 29
     0.000654 close(18)                 =3D 0
     0.006394 exit_group(0)             =3D ?
     0.001335 +++ exited with 0 +++

I hope this is readable. Notice the long relative time-stamp of the syscall
immediately preceding each of the close() calls that close a gpiochip chard=
ev.

For comparison, here's the output after applying your patch:

...
     0.000474 close(3)                  =3D 0
     0.000472 write(1, "gpiochip1 [GPIOB] (16 lines)\n", 29gpiochip1 [GPIOB=
] (16 lines)
) =3D 29
     0.000426 close(4)                  =3D 0
     0.000406 write(1, "gpiochip10 [GPIOK] (8 lines)\n", 29gpiochip10 [GPIO=
K] (8 lines)
) =3D 29
     0.000418 close(5)                  =3D 0
     0.000354 write(1, "gpiochip11 [GPIOZ] (8 lines)\n", 29gpiochip11 [GPIO=
Z] (8 lines)
) =3D 29
     0.000454 close(6)                  =3D 0
     0.000359 write(1, "gpiochip12 [unknown] (22 lines)\n", 32gpiochip12 [u=
nknown] (22 lines)
) =3D 32
     0.000457 close(7)                  =3D 0
     0.000433 write(1, "gpiochip13 [mcp23s17.0] (16 line"..., 35gpiochip13 =
[mcp23s17.0] (16 lines)
) =3D 35
     0.000412 close(8)                  =3D 0
     0.000422 write(1, "gpiochip14 [0-0020] (16 lines)\n", 31gpiochip14 [0-=
0020] (16 lines)
) =3D 31
     0.000416 close(9)                  =3D 0
     0.000416 write(1, "gpiochip15 [0-0021] (16 lines)\n", 31gpiochip15 [0-=
0021] (16 lines)
) =3D 31
     0.000408 close(10)                 =3D 0
     0.000358 write(1, "gpiochip2 [GPIOC] (16 lines)\n", 29gpiochip2 [GPIOC=
] (16 lines)
) =3D 29
     0.000441 close(11)                 =3D 0
     0.000359 write(1, "gpiochip3 [GPIOD] (16 lines)\n", 29gpiochip3 [GPIOD=
] (16 lines)
) =3D 29
     0.000443 close(12)                 =3D 0
     0.000359 write(1, "gpiochip4 [GPIOE] (16 lines)\n", 29gpiochip4 [GPIOE=
] (16 lines)
) =3D 29
     0.000394 close(13)                 =3D 0
     0.000413 write(1, "gpiochip5 [GPIOF] (16 lines)\n", 29gpiochip5 [GPIOF=
] (16 lines)
) =3D 29
     0.000396 close(14)                 =3D 0
     0.000479 write(1, "gpiochip6 [GPIOG] (16 lines)\n", 29gpiochip6 [GPIOG=
] (16 lines)
) =3D 29
     0.000431 close(15)                 =3D 0
     0.000431 write(1, "gpiochip7 [GPIOH] (16 lines)\n", 29gpiochip7 [GPIOH=
] (16 lines)
) =3D 29
     0.000471 close(16)                 =3D 0
     0.000381 write(1, "gpiochip8 [GPIOI] (16 lines)\n", 29gpiochip8 [GPIOI=
] (16 lines)
) =3D 29
     0.000484 close(17)                 =3D 0
     0.000374 write(1, "gpiochip9 [GPIOJ] (16 lines)\n", 29gpiochip9 [GPIOJ=
] (16 lines)
) =3D 29
     0.000480 close(18)                 =3D 0
     0.000418 exit_group(0)             =3D ?
     0.001373 +++ exited with 0 +++

> In
> any case: I've just sent you an RFT patch that switches to using the
> raw notifier. Could you see what results you're getting with it?

Thanks! This was quick :-)

Like I also replied to the patch email (kernel 6.13 and libgpiod 1.6.3):

$ time gpiofind LPOUT0
gpiochip7 9
real    0m 0.02s
user    0m 0.00s
sys     0m 0.01s

$ time gpiodetect
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
real    0m 0.03s
user    0m 0.00s
sys     0m 0.01s

Best regards,

--=20
David Jander

