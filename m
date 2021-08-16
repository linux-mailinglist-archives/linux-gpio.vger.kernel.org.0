Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B29B3ECC5F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 03:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhHPB3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Aug 2021 21:29:46 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:49697 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhHPB3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Aug 2021 21:29:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 8D83032008C3;
        Sun, 15 Aug 2021 21:29:15 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Sun, 15 Aug 2021 21:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=zrjj3
        NZvvnmRcNWtqP/+2krlnGf9P3YcJvsUS1DLVCE=; b=EBZ410DBPtrXzmOuhu7D+
        layLzIPTxZPOwA4976oH4nP9ulBtHiLRIP9lkDUpk6xVeibWKcDUhl8C6p0RqYSg
        BEm3OpFA2jd5QOJowV46/jC1R3Kjbjd0cLit9hzQkhsUFFVsWPQqborDdJq5Czxx
        NT7xfNipt3vqLcuRB+kBaquMajwYIkh/UaIE2F59vkHg7Q1A2wNPkF/QqqliMP8R
        It+VcXdq1Hu3QDNfFvWrqndcDclFC9xMZoouHi8L1mH4U8Pq2VNnEv3XM52WJisQ
        HKdubSEo7fOmUuL3lvlcDyI1WmwAE6Ol8E638WR6jLwrDXKMeK6tlyWInHxwVyKe
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=zrjj3NZvvnmRcNWtqP/+2krlnGf9P3YcJvsUS1DLV
        CE=; b=M80TFwTY2FJ2c6PF8brfdhZeiT8yBSjWrZaN+LAaB5DExK+PG27LGqcwS
        ViSVF2/oLZaEjUXnh+m2YqZtEVrN8PxYnl13uVMw97DDnJ6wXssLzGD2uefMqKJg
        QM5sEL5NgEvKXfNFIevaLs7F+K57SLyfOqkD9KioNw6ndR2mvYGM1k+6QUhSPvEV
        e3bMku5tDok0LmNlb01RficW9A++sm210/rsEpu34iR7st1eYyTSoqiuHIe5dT3B
        EDlNhrOqAVcxdjDW6RS8KVFVCorBszN4tqOiPWVCCEafF/1fxr3phSoh4ZMrln1l
        d9NKwsKQew9w0720whH1D1UdrMAJA==
X-ME-Sender: <xms:ar8ZYY36IPCVKt3dP8DN5OKlnCp-MJq7wo030S2qX-nQdKgf2BAcyg>
    <xme:ar8ZYTF4F2d9F5wbaHlwpkN-Ag2UOSWXs39pqoQivCEd4DtMlA2cnnzex10Tt5qpc
    gMpgfN4A3sJMO74iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
    ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpefhgfekhfdugefhjeduhfdtgf
    eutdefheejveetffegudduteejieejhfehfffgfeenucffohhmrghinhepghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ar8ZYQ6Lhj3_oweLwTqVgBML_Cg6CBFWf3em95Vu5ImCA3-WyjAZVQ>
    <xmx:ar8ZYR01A62RtqUlqPceatKMnKcd3S6KauMdTEdQwFthoTJ-BUYa8w>
    <xmx:ar8ZYbFvFeVeu2-micAznw9AiYhL_B085EaD9uyjWHJ8wuZnvqTswg>
    <xmx:a78ZYSwghhvxiF1A9dH4Ftb-M0GlW2sSQ19OsVWw4-apKEPeKYcgGw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9F50DAC0DD0; Sun, 15 Aug 2021 21:29:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1082-gccb13bca62-fm-ubox-20210811.001-gccb13bca
Mime-Version: 1.0
Message-Id: <9de6eda7-72b4-4696-bdd4-65806d2e0974@www.fastmail.com>
In-Reply-To: <CAFdkumhOs95j6GA6N3dHKhd+w0x2p2wKPD5vXPg_RV7g2T52-g@mail.gmail.com>
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
 <CAFdkumhOs95j6GA6N3dHKhd+w0x2p2wKPD5vXPg_RV7g2T52-g@mail.gmail.com>
Date:   Mon, 16 Aug 2021 10:57:45 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod]: Meson wrap for libgpiod
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

On Fri, 13 Aug 2021, at 17:14, Bartosz Go=C5=82aszewski wrote:
> pt., 13 sie 2021 o 04:24 Andrew Jeffery <andrew@aj.id.au> napisa=C5=82=
(a):
> >
> > Hi Bartosz,
> >
> > I use libgpiod as part of supporting various platforms in
> > OpenBMC[1][2], among other things. OpenBMC generally targets ARM SoC=
s,
> > and this means cross-compiling applications and their dependencies as
> > part of the day-to-day work.
> >
> > While cross-compilation for (complex) userspace can be achieved using
> > distro systems like buildroot and openembedded/bitbake or their SDKs,
> > the meson build system[3] provides dependency resolution and (cross)
> > builds as explicit features through subprojects[4] and the wrap pack=
age
> > system[5]. In my experience, these features are compelling.
> >
> > To help me develop userspace applications that depend on libgpiod I'=
ve
> > opened a pull-request against meson's wrap database[6] to add libgpi=
od
> > support for v1.6.3:
> >
> > https://github.com/mesonbuild/wrapdb/pull/130
> >
> > Meson overlays this reimplementation of the build system along side =
the
> > source as shipped in the tag, enabling meson dependency management
> > without any impact on the upstream project. However, as you might
> > guess, the wrap implementation is non-trivial as it transliterates t=
he
> > autotools scripts. While maintenance of this approach doesn't require
> > any work on your part, it does have to adapt as the autotools scripts
> > change. As such:
> >
> > How do you feel about switching from autotools to meson for the build
> > system of libgpiod?
> >
>=20
> My main concern is this: I know autotools and feel comfortable using
> it. I don't know meson and would most likely struggle trying to
> maintain this new build system.

No worries! It was a long shot and I wasn't expecting you to actually=20
change unless meson piqued your interest :)

> Does it make any sense to have two
> build systems supported at the same time? Possibly with meson files in
> a special 'contrib' directory so that we make it clear it's a
> secondary build system and may not work when something in the
> autotools change?

I think putting it in contrib/ would make it harder to use as generally=20
the meson.build files reside alongside the relevant code (just like=20
Makefile.am files). Obviously it's possible for both to coexist from=20
the root of the repository, but then there's the problem of "clutter"=20
from the build system you don't care for. If we take the path of the=20
wrapdb I can just make sure things work for each release of libgpiod,=20
which removes the uncertainty of whether the two (autotools and meson)=20
are in sync and has no maintenance cost for you.

So, maybe it's best if we leave it out-of-tree in meson's wrapdb for=20
now? It's easy to experiment with if you wish as all that happens is=20
the directory tree from the wrapdb is just copied over the top of the=20
libgpiod source tree. The wrapdb will enable meson for those that care=20
for it and keep it out of the way unless you choose to switch in the=20
future.

If you want to experiment with the wrapdb pull-request, here's how I've=20
been testing:

$ # Light test that it does something sensible as a subproject of the wr=
apdb repo
$ meson setup -Dwraps=3Dlibgpiod build && meson compile -C build
$=20
$ # The above creates a subprojects/libgpiod-1.6.3 directory, now build =
in that as if it weren't a subproject
$ cd subprojects/libgpiod-1.6.3/ &&
> meson setup -Dtools=3Dtrue -Dtests=3Dtrue -Dbindings=3Dcxx,python -Dma=
npages=3Dtrue build &&
> meson compile -C build

From there I've been verifying the output by comparing the following wit=
h the autotools install tree:

$ mkdir root && meson install --destdir $(realpath root) -C build && fin=
d root | sort

Cheers,

Andrew
