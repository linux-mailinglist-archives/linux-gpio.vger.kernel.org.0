Return-Path: <linux-gpio+bounces-12548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014B9BC254
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 02:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD9C1F22D80
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 01:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C618643;
	Tue,  5 Nov 2024 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXXSffuq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3CB65C
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 01:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768884; cv=none; b=ePyprHCSkbDucvfQTkEyJXc6QF6IcAWGR/AU7LM+n2BH/13V/T7ntKdhjWdUXi52eTDB6kzRE0qRA8ZHYBIgEvnFTzT0WWUAR5pQu8kPkZuBSgyWAPMDAsklTTCVU0U1l3k0PNuAvRhuRay0iy2HhKDybH0+LrIXF53f3G1teaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768884; c=relaxed/simple;
	bh=1lCNZlxDmrT90f9tRNRqwgrajOsx4gU+EsMZVmIRJG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIdaDRpNwPFohikHQnpZUPZcilUhy6fqjWPrPdPt2cslauVnSeC5RGNUqjOFq76IDAA/EuKhFaxNzfxvtT3S8OvZFF4DoxgJLciOvAeY6/8RBqFXcHJJcetjE340wq+JFgLLTXqL871u+Qcf10jbWaeAm+r226Wxs6y9LCQ+PGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXXSffuq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso3768197b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 17:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730768882; x=1731373682; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHG5NddTTsZLg0Yuif6JwlIuBxjj8dclTa95eKQ4te8=;
        b=SXXSffuq0fYx5r68pn4UK6ICNclBsblGL2zU9z6vDLYxuEH/isMx0AvWZv1dU/pOdR
         KYttfK422VW/6H0Hbi3TS/wPl6AmNTIbJOw3S+9Y5Uct2qouCdRU8bhQAY/cQCEHVPgf
         NNIE8dIL/wtilBKsvt182QzCT8MN2GXr3TN86794kL+1Ws9aTyekyyB8iHJWBJk1hSvf
         GdJUl3h4Mb9dFaJgxj57rAYMhlEjDOyAQV7kVpYfq1vIpceviWP6ALs63seGSu2yzxyi
         Z5/gtNQDRyL3eLnpZbtARGseti7P4Qh1ELqopwSDvbi6+ObzZmEvju85znjhU3zn7Gay
         GsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730768882; x=1731373682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHG5NddTTsZLg0Yuif6JwlIuBxjj8dclTa95eKQ4te8=;
        b=nJ2dEYcqGrExH/pjMM30FPdR/KSdCAvQKuSQR+9nmJuIWAv1VgVRVXYyoc6q+zONb5
         KoJNwBAmHtmFDeb4KJKq0i1B7bzl0++cIt6lR+/WFp5QrYYZU5nXF5MMCrngdenPUvtB
         tqjvJeAd5MDv6IZH7bYBuQOUQKdsBgaj6a0/2orMV/+2HISeA5m7xL2S5o+fQ2/kw7m7
         +rdN+jh3Xi7/qtLKRDZcAbFWvBWk87vCLBWu9fviTEOPvg4ZUx7DpeCiikTs02vtZxmM
         nAkSf/XfZ30nVJDE9AwZ+TCdWnZrQFmioEAEfyWbJ9VdPSNSqQJZOkHGs9+ndGTAEvBo
         OyWQ==
X-Gm-Message-State: AOJu0Yxw+5AKhGC2+luihokdg5ARLwT3P0Whm1ti5Y6VIjm/2xePE5rD
	O5efNMVVqa0Mz5BdIfxKIxzKg9Cx2x1rK6parRaPb3EMPnPKc/MoYnYIVg==
X-Google-Smtp-Source: AGHT+IEZJQYqcDPgqJ9fryqjDHRrbmkidZSB7bdNzxVhjCGvdlacD+z2fW9QTB+++zT+1rzS/uRLdg==
X-Received: by 2002:a05:6a21:998d:b0:1db:e3b6:e4df with SMTP id adf61e73a8af0-1dbe3b6e5b4mr4575061637.21.1730768881614;
        Mon, 04 Nov 2024 17:08:01 -0800 (PST)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2eb3cfsm8250937b3a.151.2024.11.04.17.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 17:08:01 -0800 (PST)
Date: Tue, 5 Nov 2024 09:07:56 +0800
From: Kent Gibson <warthog618@gmail.com>
To: brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	Le Chaudron Nautique <vanvan@chaudron-nautique.fr>
Subject: Re: libgpiod 2.2 installation on RaspberryPi 4
Message-ID: <20241105010756.GA5659@rigel>
References: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>
 <20241031020858.GA35451@rigel>
 <3404b96e-f858-48b4-abfc-0a836d00e730@chaudron-nautique.fr>
 <20241101052447.GA110734@rigel>
 <df44ef64-0534-4a18-8024-ba0d56fa16fb@chaudron-nautique.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df44ef64-0534-4a18-8024-ba0d56fa16fb@chaudron-nautique.fr>

On Fri, Nov 01, 2024 at 03:24:42PM +0100, Le Chaudron Nautique wrote:
>
> Le 01/11/2024 à 06:24, Kent Gibson a écrit :
> > On Thu, Oct 31, 2024 at 03:17:32PM +0100, Le Chaudron Nautique wrote:
> > > Le 31/10/2024 à 03:08, Kent Gibson a écrit :
> > > > On Wed, Oct 30, 2024 at 09:59:05PM +0100, Le Chaudron Nautique wrote:
> > > > > Hello,
> > > > >
> > > > Here is what I get using that tarball and:
> > > >
> > > > ./autogen.sh --prefix=/usr/local --enable-examples
> > > > make
> > > > sudo make install
> > > >
> > > > pi@pi4:~/libgpiod-2.2 $ ls -l /usr/local/lib
> > > > total 372
> > > > -rw-r--r-- 1 root root 239480 Oct 31 09:40 libgpiod.a
> > > > -rwxr-xr-x 1 root root    946 Oct 31 09:40 libgpiod.la
> > > > lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so -> libgpiod.so.3.1.1
> > > > lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so.3 -> libgpiod.so.3.1.1
> > > > -rwxr-xr-x 1 root root 155480 Oct 31 09:40 libgpiod.so.3.1.1
> > > > drwxr-xr-x 2 root root   4096 Oct 31 09:40 pkgconfig
> > > > drwxr-xr-x 4 root root   4096 Jan 13  2024 python3.11
> > > >
> > > > pi@pi4:~/libgpiod-2.2 $ ldd examples/.libs/get_chip_info
> > > > 	linux-vdso.so.1 (0x0000007f9e276000)
> > > > 	libgpiod.so.3 => /usr/local/lib/libgpiod.so.3 (0x0000007f9e1e0000)
> > > > 	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f9e030000)
> > > > 	/lib/ld-linux-aarch64.so.1 (0x0000007f9e239000)
> > > >
> > > > pi@pi4:~/libgpiod-2.2 $ examples/get_chip_info
> > > > gpiochip0 [pinctrl-bcm2711] (58 lines)
> > > >
> > > > What do you get?
> > > I didn't add the --enable-examples, I took the code from git and put it in
> > > my test file/directory.
> > Adding the --enable-examples is just a convenient way to get the
> > examples built.  Building it manually is fine too.
> >
> > > vanvan@lcntest-stable:~/prog/userspace $ ldd prog
> > >      linux-vdso.so.1 (0x0000007fa851e000)
> > >      libgpiod.so.3 => not found
> > >      libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007fa8300000)
> > >      /lib/ld-linux-aarch64.so.1 (0x0000007fa84e1000)
> > >
> > > Should I look at/capture the autogen logs to see if something is amiss ?
> > >
> > No, the issue is ld not locating the library in /usr/local/lib for some reason.
> >
> > What does
> >
> > $ ldconfig -p | grep libgpiod
> >
> > show?
> >
> > I get:
> >
> > pi@pi4:~/libgpiod-2.2 $ ldconfig -p | grep libgpiod
> > 	libgpiodcxx.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiodcxx.so.1
> > 	libgpiod.so.3 (libc6,AArch64) => /usr/local/lib/libgpiod.so.3
> > 	libgpiod.so.2 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiod.so.2
> > 	libgpiod.so (libc6,AArch64) => /usr/local/lib/libgpiod.so
>
> I get only  :
>
> $ ldconfig -p | grep libgpiod
>     libgpiodcxx.so.1 (libc6,AArch64) =>
> /lib/aarch64-linux-gnu/libgpiodcxx.so.1
>     libgpiod.so.2 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiod.so.2
>
> But after running
>
> $sudo ldconfig
>
> I can see libgpiod.so.3 and the program runs  without problem anymore.
>
>
> $ ldconfig -p | grep libgpiod
>     libgpiodcxx.so.1 (libc6,AArch64) =>
> /lib/aarch64-linux-gnu/libgpiodcxx.so.1
>     libgpiod.so.3 (libc6,AArch64) => /usr/local/lib/libgpiod.so.3
>     libgpiod.so.2 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiod.so.2
>     libgpiod.so (libc6,AArch64) => /usr/local/lib/libgpiod.so
>
> $ ldd prog
>     linux-vdso.so.1 (0x0000007f957eb000)
>     libgpiod.so.3 => /usr/local/lib/libgpiod.so.3 (0x0000007f95740000)
>     libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f95590000)
>     /lib/ld-linux-aarch64.so.1 (0x0000007f957a0000)
>
>
> Thanks.
>
>

As the reply didn't go to the list, just letting you know that the problem
was the ld.so.cache not being rebuilt when libgpiod is installed by
'sudo make install'.

Not sure of this is Pi specific, or v2.2 specific, but I suspect at
least one other Pi user has seen the same thing.

The last thing the install (installing into /usr/local) with libtool does is:

libtool: finish: PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin" ldconfig -n /usr/local/lib

which, IIUC, updates that directory in the cache and any symlinks it
contains, but it doesn't rebuild the cache.  So it will work fine if you
are updating but not on the first install??

The workaround is to 'sudo ldconfig' after the install to rebuild the
cache.  But I was expecting that autoconf/libtool would sort this out.

Cheers,
Kent.

