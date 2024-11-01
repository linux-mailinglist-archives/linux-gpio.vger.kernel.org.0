Return-Path: <linux-gpio+bounces-12415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C79AC9B8A6F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 06:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F38D1F22398
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 05:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433BD146596;
	Fri,  1 Nov 2024 05:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W629EqT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331078467
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 05:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730438694; cv=none; b=IaDyz6efZ4KWfNuczceGpfmClFroNZ7unXJVCwmjaPnLhglAqu8BdKnzLX4kEoZRKA1a2fiHUBKJj4kIy4lv96YBXWMD6+nlvFuOt0zdyOFAVQpb3ophP1mb9GNplxAW17pJaL8foEj4DfxvhAMXz/Ou4andrfdwQJ2yPFze/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730438694; c=relaxed/simple;
	bh=i/I/rP8EpR52xHNlQf9Vxw2zHD+BziLr6W8qnMjeWDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqv778T7Q/2c8/dfmcn2IvukjOkIgUdOPQfNL4BVmiOW+np/jLwcuvPeg1zjbPaxik811IG1Mjk983rRV0JGCUj9Bvx+s2sCGG/f0CAGyDBvyFspsi3BrcjGWmmRrFmRAQp2gSCi0oxG2fwR4nEJsDYl/EFpFJlqv+w/srbo7/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W629EqT6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-210e5369b7dso16884415ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 22:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730438691; x=1731043491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHXZvV5VWIXMQNRqTTj8e5mctPAapxEvwh+ry0nUmME=;
        b=W629EqT6alf8FgpA/c3EzDsFOgOAlWm7ZC42RyNqH8wnNx/46WTNFzevkQoG/e6jW7
         l+zZlPho+2yUHeWvAAXz9m22ZQQbkBTgO1yXn629cxVjFCJ37FG5n+RFP+WZoDQ/6ImG
         dTR64zyTopUVjC8itOFW45KTmFDRCiu7b2gqBGYmitxWr/eQSeoo4NF+6ISBi8vjXfyN
         Xi3ksZaxpoU3lRoLjByHw/FnpQgnLGoJXqdLVOMXxsSr84sjrMJrpk/29YjB0yeRaIDi
         UN49D5r27GiQJQUxmZ8ZAeryRagRezucumv7nKMMaoxtT/IdmJ7ged7e6GO1G1cArhSv
         X2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730438691; x=1731043491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHXZvV5VWIXMQNRqTTj8e5mctPAapxEvwh+ry0nUmME=;
        b=WBtOcS/7kCXvBp7f/hQ/hwIMpF7h/rB/RdSzU2L5/pwEyoAgeL378GzqK81qqD5gsO
         8qucSEqWreXfif2gqgCXSoPH6Dm7LPl3AZZVgYBkIuveUhvs4fzXj4bYDWe8V4qFrmZc
         /XtMhrGVZgEBJ9toP2GsgRtXhPFJh2GOPhHiAYUsMafPVzQSHwotY3BHYhbEUv3RVIBH
         B9rE7ZqjJQ1xAEEC0W6T0e2Vkct6MK7Se1HLqYxSs6bil0yhBhp2XLf9gIfPEnTL4FdJ
         81xCqbkGivkI3qSnyY6HiTX06sWOew10H3Je/3wPHgLrWk9rfQAzxcCvXcXy/mlRnDrJ
         bkrg==
X-Gm-Message-State: AOJu0Ywa9SDIAhG4FeNa62P/Cqr71vWiua2OJwBdFJ56hzBHKlGAFOcp
	XepOdf7qERyXsWED/oxzwaK3ablVfXfnCUOjXMonCwRKRSaEvPJO2XHz9A==
X-Google-Smtp-Source: AGHT+IFb0KRIO6rwRHa38Ile8KlCaSQxjZAvGMaygFzqzOyzIXQPpYX7INjJOibp3yOlPdK5FGWRGg==
X-Received: by 2002:a17:902:cf0a:b0:20b:61ec:7d3c with SMTP id d9443c01a7336-2111b00131amr28860475ad.49.1730438691130;
        Thu, 31 Oct 2024 22:24:51 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057f3dc6sm16185045ad.307.2024.10.31.22.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:24:50 -0700 (PDT)
Date: Fri, 1 Nov 2024 13:24:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Le Chaudron Nautique <vanvan@chaudron-nautique.fr>
Cc: linux-gpio@vger.kernel.org
Subject: Re: libgpiod 2.2 installation on RaspberryPi 4
Message-ID: <20241101052447.GA110734@rigel>
References: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>
 <20241031020858.GA35451@rigel>
 <3404b96e-f858-48b4-abfc-0a836d00e730@chaudron-nautique.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3404b96e-f858-48b4-abfc-0a836d00e730@chaudron-nautique.fr>

On Thu, Oct 31, 2024 at 03:17:32PM +0100, Le Chaudron Nautique wrote:
>
> Le 31/10/2024 à 03:08, Kent Gibson a écrit :
> > On Wed, Oct 30, 2024 at 09:59:05PM +0100, Le Chaudron Nautique wrote:
> > > Hello,
> > >
> > Here is what I get using that tarball and:
> >
> > ./autogen.sh --prefix=/usr/local --enable-examples
> > make
> > sudo make install
> >
> > pi@pi4:~/libgpiod-2.2 $ ls -l /usr/local/lib
> > total 372
> > -rw-r--r-- 1 root root 239480 Oct 31 09:40 libgpiod.a
> > -rwxr-xr-x 1 root root    946 Oct 31 09:40 libgpiod.la
> > lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so -> libgpiod.so.3.1.1
> > lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so.3 -> libgpiod.so.3.1.1
> > -rwxr-xr-x 1 root root 155480 Oct 31 09:40 libgpiod.so.3.1.1
> > drwxr-xr-x 2 root root   4096 Oct 31 09:40 pkgconfig
> > drwxr-xr-x 4 root root   4096 Jan 13  2024 python3.11
> >
> > pi@pi4:~/libgpiod-2.2 $ ldd examples/.libs/get_chip_info
> > 	linux-vdso.so.1 (0x0000007f9e276000)
> > 	libgpiod.so.3 => /usr/local/lib/libgpiod.so.3 (0x0000007f9e1e0000)
> > 	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f9e030000)
> > 	/lib/ld-linux-aarch64.so.1 (0x0000007f9e239000)
> >
> > pi@pi4:~/libgpiod-2.2 $ examples/get_chip_info
> > gpiochip0 [pinctrl-bcm2711] (58 lines)
> >
> > What do you get?
> I didn't add the --enable-examples, I took the code from git and put it in
> my test file/directory.

Adding the --enable-examples is just a convenient way to get the
examples built.  Building it manually is fine too.

>
> vanvan@lcntest-stable:~/prog/userspace $ ldd prog
>     linux-vdso.so.1 (0x0000007fa851e000)
>     libgpiod.so.3 => not found
>     libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007fa8300000)
>     /lib/ld-linux-aarch64.so.1 (0x0000007fa84e1000)
>
> Should I look at/capture the autogen logs to see if something is amiss ?
>

No, the issue is ld not locating the library in /usr/local/lib for some reason.

What does

$ ldconfig -p | grep libgpiod

show?

I get:

pi@pi4:~/libgpiod-2.2 $ ldconfig -p | grep libgpiod
	libgpiodcxx.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiodcxx.so.1
	libgpiod.so.3 (libc6,AArch64) => /usr/local/lib/libgpiod.so.3
	libgpiod.so.2 (libc6,AArch64) => /lib/aarch64-linux-gnu/libgpiod.so.2
	libgpiod.so (libc6,AArch64) => /usr/local/lib/libgpiod.so

If that doesn't provide a libgpiod.so.3 location for you then try

$ sudo ldconfig

to update the ld cache, and then repeating the above and the ldd.

If that doesn't work, try setting

$ export LD_LIBRARY_PATH=/usr/local/lib

and repeating the ldd.

Cheers,
Kent.





