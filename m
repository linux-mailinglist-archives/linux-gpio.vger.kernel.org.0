Return-Path: <linux-gpio+bounces-12342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB99B7261
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 03:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CC9281A86
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 02:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D79983CD6;
	Thu, 31 Oct 2024 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT1CIqVZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA48121F
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 02:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730340545; cv=none; b=TlCltXBYPVvfmqQQkPTcjkkECnZyfRAbDw66N4hxpuV0F/Q/BrCOiFYFiOsRpih38/TS3VtAq4WhPi81D0Laypr/nvO4rKyGIrJ8EK9aL7s+b1S+qVb6yxus3l9jBLuz6NKTJNoEajJ4mbFCjTzeYsfupeUBk3Jn/yY+2g35fjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730340545; c=relaxed/simple;
	bh=C0e8fY6FBddoagf/nBuGlZteW+nZKLgnQllVXfgDHmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZEP0S1btoOe5pJFCiuFmyET0QmgN1v12QP8EnMAi6RuDYQWz+MylN7NPx7ZIS9hQAmr1Sfk+ul0+aXhLcVWp23C5b9px6dAX4RtQjAQGoBwjeCcNTXx3gWqczvctkwiIa8O0K4p4aCn2bMhha8DBiJudbI/p6aFtVVa0Gfdn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT1CIqVZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7206304f93aso380537b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730340542; x=1730945342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4z/0yV7ahbXnacyz9A6tF01tZq7Nsf6qg06hWaXf40=;
        b=TT1CIqVZIkQ4znF9X9IOXaU0DdTrjOJZ9UbvKDLB7egLbE8bSa0s8PA5qR+ge1QpGd
         v+P1KV8BTReD4D5hrPnlF7X7veIpMzr/lP1rgo4tmQ/87/F1tsHXWAorO2YiEW7lmF7o
         /g5BltwRsvrIIuGQ+59GA2zbk9446+LseV2DWRDzEw4bXf0cLqb6ygoMK0gtMZ0Fxewj
         8vUkQDQDZu4HRU97Tjx3bAsM8QFbf/ni0Ln7fQlhN4FJkzFubP1Wje98XL1BCr73c2P1
         qLsJo+Bs8VvmzAF2YVds6EwlQ8kJyc6hdATLwOy4dVpFCoQuMrXP6sr9NXIGKqqTknB0
         KOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730340542; x=1730945342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4z/0yV7ahbXnacyz9A6tF01tZq7Nsf6qg06hWaXf40=;
        b=wLFy23HIjPFnzHTHfQTm/SRYA/geKbIDHYMrknOMtklB5FGlNHWPfZsY13PmDy1/Kc
         uWqJJ+wOazTOw+gFFNzlOIhOTHHwxpWv0xtdMUJLr2mUYVZOQ+AtZZ/xC+tn/NKoDeb1
         F9mGyR2GwSWyHtMB+aeq/RHwVTk2KPJDZm3lo1BizY3o1l0kKHjA7Yl1BmwIK6SQZiNr
         +rhIsLagpONbNtocPtH6KgI5nRlunF6UapdkCTFWate1hlTs8s6LYuidIG7K7sCLgL5E
         hQo16v8NWUFnGVxpyl6Yzyknoi6FK/gIlJAd7VmWG20uWkV6O1BUDbvHWrdzYTbdzoM8
         eLCw==
X-Gm-Message-State: AOJu0YwOqn96k81zNU2XiPn63Fa8Kv7qGioVu8Qc1UrX/x7v6AhxwUsf
	vzyvshUUv2Vk3PBaR6EthQQ24KkfyFzx1TA3TvUvcZ/sWGea95dCjunNTg==
X-Google-Smtp-Source: AGHT+IEX8RlRwb+7gTyBBhyElWXzG7fAn+K2pxuLMOkcMHWCGIex1+F4dHHVkPLgGUoCPwC6zUOvhw==
X-Received: by 2002:a05:6a20:c998:b0:1d8:a3ab:720d with SMTP id adf61e73a8af0-1d9a81c64abmr24349503637.0.1730340542284;
        Wed, 30 Oct 2024 19:09:02 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5988sm318517b3a.49.2024.10.30.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 19:09:01 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:08:58 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Le Chaudron Nautique <vanvan@chaudron-nautique.fr>
Cc: linux-gpio@vger.kernel.org
Subject: Re: libgpiod 2.2 installation on RaspberryPi 4
Message-ID: <20241031020858.GA35451@rigel>
References: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35d12c34-848d-4093-a0f2-30fb57b1299b@chaudron-nautique.fr>

On Wed, Oct 30, 2024 at 09:59:05PM +0100, Le Chaudron Nautique wrote:
> Hello,
>
> I have some trouble installing the release 2.2 of libgpiod (or rather in
> linking it).
>

You mean "linking to it at runtime".

> I want to use it on a RaspberryPi 4 (kernel 6.6.56-RT and 6.12-RT) which are
> not provided by Raspberry but taken from https://git.kernel.org, thus the
> problem might come from there.
>

No, as you can link a binary, your problem seems to be with your ld path or
library installation.
The default path should include /usr/local/lib, so that probably isn;t
the issue.
On my Pi4, the relevant config file for that is:

pi@pi4:~/libgpiod $ cat /etc/ld.so.conf.d/libc.conf
# libc default configuration
/usr/local/lib


> I have taken the 2.2 tarball on
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>
> when I compile my file it seems ok (just trying with one of the examples
> from git : chip-info.c), but when I run the program obtained I have this
> error :
>

I assume you mean get_chip_info.c.

>
> ./prog: error while loading shared libraries: libgpiod.so.3: cannot open
> shared object file: No such file or directory
>
>
> The path for ./autogen was /usr/local
>
> gpiod.h  is in /usr/local/include
>

Not relevant at runtime.

> libgpiod.so.3  is in /usr/local/lib
>

And is it usually a symlink to the actual library.
What does "ls -l /usr/local/lib" show?

> My programs are in ~/prog/userspace and the makefile uses -lgpiod.
>

Shouldn't matter.  Try using ldd on your binary to see what libraries it
is linked against.

> Am I missing and option or a path to be declared somewhere ?
>

It is difficult to determine the root cause of your problem without more
detail.

Here is what I get using that tarball and:

./autogen.sh --prefix=/usr/local --enable-examples
make
sudo make install

pi@pi4:~/libgpiod-2.2 $ ls -l /usr/local/lib
total 372
-rw-r--r-- 1 root root 239480 Oct 31 09:40 libgpiod.a
-rwxr-xr-x 1 root root    946 Oct 31 09:40 libgpiod.la
lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so -> libgpiod.so.3.1.1
lrwxrwxrwx 1 root root     17 Oct 31 09:40 libgpiod.so.3 -> libgpiod.so.3.1.1
-rwxr-xr-x 1 root root 155480 Oct 31 09:40 libgpiod.so.3.1.1
drwxr-xr-x 2 root root   4096 Oct 31 09:40 pkgconfig
drwxr-xr-x 4 root root   4096 Jan 13  2024 python3.11

pi@pi4:~/libgpiod-2.2 $ ldd examples/.libs/get_chip_info
	linux-vdso.so.1 (0x0000007f9e276000)
	libgpiod.so.3 => /usr/local/lib/libgpiod.so.3 (0x0000007f9e1e0000)
	libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000007f9e030000)
	/lib/ld-linux-aarch64.so.1 (0x0000007f9e239000)

pi@pi4:~/libgpiod-2.2 $ examples/get_chip_info
gpiochip0 [pinctrl-bcm2711] (58 lines)

What do you get?

Cheers,
Kent.

