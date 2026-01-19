Return-Path: <linux-gpio+bounces-30723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6132D3A1AE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 09:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57C373006E1F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D811E18DF80;
	Mon, 19 Jan 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRNFvmSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A147332EB0
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811615; cv=none; b=sPHrvuEeL/Rm8W6zhUqceWbcSMrE6VnctQBkjbDm5oW1/WEP1uVmd1RN63OsnRAgxBFTQhoOgh93L7pGCUb/YC5VVqXnnIeGQ+aj+PADPmXoWdrjis/cBbNdgJ1nJKbF6qi7WWL0G+Q1xzP0SQsyNkb/9XGGEj+f08qZHU+WLn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811615; c=relaxed/simple;
	bh=EuBTo90+0xISmGE1iNCeM36DlYb7oTzHhMLT3OQBIPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2WxZhQI6rwFcBkaycPZs/esaxNFIQtPHL7KV8EZINf71dJKh5bFxA6ZAHG/NPF+rekzqboy9eI0nqJO67fvNTNmBydeuPrWG524mxFJJMtTv+sgin7x4B0zUlWmFf20X4Q8HMXTPUbZ51+OxVLB2qsk5jG2afPSRRGunDFtx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRNFvmSK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649DDC2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768811615;
	bh=EuBTo90+0xISmGE1iNCeM36DlYb7oTzHhMLT3OQBIPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SRNFvmSKtc1/gW2SNtZW30SG39DZstyWleIGLwc3+e6Cv9azYLqCXmb0J/NGIhIbj
	 /wTmF4SDgNtHeyr2FQhinA3m/glZe57tHi14mTpCtWsPnYeUarbcRgIxavUISrDsiF
	 w/580IPMEgXFFwc0v8Fshggp27kbxKyhsxTXUNOCrH6QfHnsQbjYXNbt24nOPycd4F
	 vpnBXLnsXbBHOdAUahCpdjVRk1O+DOg03LaLQwKk8DkYT6QUgVbvubxkAb4QaizyoV
	 dDRBaZga/AKjAy63AKSFj542BZn6t8VmFnC/kOeQo5/ATIHt3qyii6u4zyfSqo04fy
	 OrmfHLBtQ4J0A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so4353830e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSM+8p8m0SFhXmf8+QQPydSUEVVrzJP/NtjEhl7MY8fti6BD+nUNV2kvVZLb4kxFJN7mSJQsJb/WWt@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcprMn73OLrc1dbYRw0FNNWn4GFsUVmPOU/EosIEQo6/l48ma
	rIv32SlwtSAdk7xaBRG2gcS3mkjpHvzfK1Yo0a4TkajNGEg7TSq7XE8KqTZYmjW72IfnMy4Y6je
	v4rrClxdp1WH0cxX2r9U+r8cRSpxiIouEqilS9por1Q==
X-Received: by 2002:a05:6512:10d6:b0:59d:4a12:5f9 with SMTP id
 2adb3069b0e04-59d4a1206famr260681e87.3.1768811613889; Mon, 19 Jan 2026
 00:33:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <CAMRc=MdOCvEb81k0whM9dGCE8Hp=tdxZTUuiFeiL3+WsEei9EQ@mail.gmail.com>
 <aWuFBqIfJpDL9g-J@tzungbi-laptop>
In-Reply-To: <aWuFBqIfJpDL9g-J@tzungbi-laptop>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 09:33:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
X-Gm-Features: AZwV_Qj-H4GoQtvkwFseN5jYlKSdPvBPHrbR8AGUp3PpNz29IUPVXyzfscvZ_KA
Message-ID: <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
Subject: Re: [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 1:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Jan 16, 2026 at 11:35:00AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 16, 2026 at 9:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > This series transitions the UAF prevention logic within the GPIO core
> > > (gpiolib) to use the 'revocable' mechanism.
> > >
> > > The existing code aims to prevent UAF issues when the underlying GPIO
> > > chip is removed.  This series replaces that custom logic with the
> > > generic 'revocable' API, which is designed to handle such lifecycle
> > > dependencies.  There should be no change in behavior.
> > >
> > > This series depends on the 'revocable' API, introduced in [1].  Some
> > > build bots may report errors due to undefined symbols related to
> > > 'revocable' until the dependency is merged.
> > >
> >
> > Hi Tzung-Bi!
> >
> > Thank you for doing this and considering my suggestions from LPC. I
> > haven't looked at the code yet but I quickly tested the series with my
> > regular test-suites. The good news is: nothing is broken, every test
> > works fine. The bad news is: there seems to be a significant impact on
> > performance. With the user-space test-suite from libgpiod (for core C
> > library - gpiod-test) I'm seeing a consistent 40% impact on
> > performance. That's not really acceptable. :( I will try to bisect the
> > series later and see which part exactly breaks it.
> >
> > I can also help you with user-space testing with libgpiod, if you need
> > it? Some documentation is available here:
> > https://libgpiod.readthedocs.io/en/latest/testing.html
>
> How to get the performance data?
>
> I tried on libgpiod-2.2.2.tar.xz:
> - ./configure --enable-tools --enable-tests
> - make
> - ./tests/gpiod-test
>
> There is only TAP output.  Also I don't see the difference between:
> `./tests/gpiod-test` vs. `./tests/gpiod-test -m perf`.

Yeah, no, there's no dedicated performance measurement in GLib tests,
I just timed the test-suite and it runs 40% slower with this series.

Bartosz

