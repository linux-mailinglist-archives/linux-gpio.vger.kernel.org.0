Return-Path: <linux-gpio+bounces-9778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5196BAA8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 13:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3905B27DBC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CCE1D0DDD;
	Wed,  4 Sep 2024 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNERhmWL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD51D04AA
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725449350; cv=none; b=RAAnWLkkDfAbtmNUukDtHSeT6fNyD9KIxxadxG0icde4GJ5KoH9pSHCzYqwMdZbUepcYgl1ZsofAUmxFEmZ/xcZ1FwfXUczL2NO/T8pssfeEgc7ZQXTyWaoQtMQZc/T4VLW90izZglnX9UvyTo50P8glv46w1wCdrXxQkM8ge18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725449350; c=relaxed/simple;
	bh=oX/ncoBlowwxE2Nq8PYue8X6kp9mSVDFoxrnFH8gBTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPbtXqr3pds5DsxNtk5qVnpVlx0LbNEs+4sPfVxh08H+ZI2bbeBnAMfOt94qnoWvc734qszrnx5e80fsREeyqTi7nm6kI0K+5aWxcHE1xCZH/N/O8xTFG5zbB5UNeJe5DM782z1GfmBG5xl7A9ePI2MbomrZMNbYF8n/p+slmy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNERhmWL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7163489149eso4338529a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725449348; x=1726054148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkHHvih2p1PhpByfpZJg+MAkYlvDypKxkMek+DkQ/BI=;
        b=RNERhmWLJdVn37wzx8wqyQFOGoGe6EpxTb/JmVsgnX3DaP6kDdn1++81vJHrJQTExr
         RmMZGv9mZIC8a/LTe9AJK9v7AsyIPhgnvC/R/a8ucg52r+viG0woZTRrCbvd7v7qyTuY
         jvW/9WU35k9tTPQpcpN0ULHZ7QSKiZQDm4Avja2JNXX3esooohw5tt2CpcXdxgeOiBYF
         tvlkHc2HvIMER/Y6Y2KqvI0t4dfTJwAJdQig464g0Mf8kegV+D3TX3QGnFI2zNCMz/Js
         CESFfSJMJ/QPU787rH/7d1SXCLHWIoYe/o8dZ+YmoO1n4U6KMHRNE7yATdV1b2hxknhy
         e5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725449348; x=1726054148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkHHvih2p1PhpByfpZJg+MAkYlvDypKxkMek+DkQ/BI=;
        b=V3LqpjHYF6tFQwJ+qDmVE/knNm2e73KNajNmMRpy/IXyw9Sx2ZOxfzDW4a8Gc/Q3gY
         Ytaov452Csku24PL2wFI2Xyqo3X7u/bZza++K03DE026/cf0YOuCdR9N+cWntv9I4LrO
         eW2HS37f2VUPiJaWv8NZus4C/Goir+qLqP/OPr2hxHeO+ZA+3DHz4waMGsk1THP2cQik
         9r5EMRM5RT8BBZ48VBAMskzEmKez9wmWAAguUqDfwr2B9129JtwLLL4eo6kwMt0MP6cN
         JTonmgZEdrJjarwNRyBcVtdxtagXfORR/StEL8nUNFxr5kuDS05CBe3uY+1nIDZgmofZ
         HYxw==
X-Forwarded-Encrypted: i=1; AJvYcCXl9tHTXUBPrwDG98HhYtHS42zinp99aGoCJufQIaf+gcOyFp1xgSrygDNjzeb3nHCCjtdPwtcFNNk/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6j9VY/s0RQvbGGmNdDcSsKYHUpXuFkeXjGFeYHfvByGZfQMc9
	B2YO3KL0g60zHk5uVNgP3kWXAC5NdsUijlEBKPJdM+gGLCRxS7lkRb/qQg==
X-Google-Smtp-Source: AGHT+IHmsnIW2jej2j217veQ1VwqiDeD1Paq7UcOWUCLKIfJIHqwMPkEXKpDhqiAw4eIwhlOTskY7g==
X-Received: by 2002:a17:90b:46c3:b0:2d3:bc5f:715f with SMTP id 98e67ed59e1d1-2d88d6ae5a5mr16392608a91.10.1725449347904;
        Wed, 04 Sep 2024 04:29:07 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8cc28ac9asm6901390a91.28.2024.09.04.04.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:29:07 -0700 (PDT)
Date: Wed, 4 Sep 2024 19:29:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: Re: [libgpiod][PATCH] build: imply --enable-bindings-glib for
 --enable-dbus
Message-ID: <20240904112902.GA199607@rigel>
References: <20240903095357.27998-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903095357.27998-1-brgl@bgdev.pl>

On Tue, Sep 03, 2024 at 11:53:57AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GLib bindings are required to build the D-Bus daemon. Enable them
> automatically if --enable-dbus is passed to configure.
>
> Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
> Reported-by: Douglas Silva <doug.hs@proton.me>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  configure.ac | 48 +++++++++++++++++++++---------------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index 1ac1002..a4dd05f 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -250,6 +250,27 @@ then
>  	fi
>  fi
>
> +AC_ARG_ENABLE([dbus],
> +	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
> +	[if test "x$enableval" == xyes; then with_dbus=true; with_bindings_glib=true; fi],
> +	[with_dbus=false])
> +AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
> +
> +AC_DEFUN([FUNC_NOT_FOUND_DBUS],
> +	[ERR_NOT_FOUND([$1()], [dbus daemon])])
> +
> +if test "x$with_dbus" = xtrue
> +then
> +	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_DBUS([daemon])])
> +	AC_CHECK_FUNC([strverscmp], [], [FUNC_NOT_FOUND_DBUS([strverscmp])])
> +	PKG_CHECK_MODULES([GUDEV], [gudev-1.0 >= 230])
> +	AC_CHECK_PROG([has_gdbus_codegen], [gdbus-codegen], [true], [false])
> +	if test "x$has_gdbus_codegen" = xfalse
> +	then
> +		AC_MSG_ERROR([gdbus-codegen not found - needed to build dbus daemon])
> +	fi
> +fi
> +
>  AC_ARG_ENABLE([bindings-glib],
>  	[AS_HELP_STRING([--enable-bindings-glib],[enable GLib 2.0 bindings [default=no]])],
>  	[if test "x$enableval" = xyes; then with_bindings_glib=true; fi],
> @@ -280,33 +301,6 @@ m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
>  	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
>  	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
>
> -# Depends on GLib bindings so must come after
> -AC_ARG_ENABLE([dbus],
> -	[AS_HELP_STRING([--enable-dbus], [build dbus daemon [default=no]])],
> -	[if test "x$enableval" == xyes; then with_dbus=true; fi],
> -	[with_dbus=false])
> -AM_CONDITIONAL([WITH_DBUS], [test "x$with_dbus" = xtrue])
> -
> -AC_DEFUN([FUNC_NOT_FOUND_DBUS],
> -	[ERR_NOT_FOUND([$1()], [dbus daemon])])
> -
> -if test "x$with_dbus" = xtrue && test "x$with_bindings_glib" != xtrue
> -then
> -	AC_MSG_ERROR([GLib bindings are required to build the dbus daemon - use --enable-bindings-glib])
> -fi
> -
> -if test "x$with_dbus" = xtrue
> -then
> -	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_DBUS([daemon])])
> -	AC_CHECK_FUNC([strverscmp], [], [FUNC_NOT_FOUND_DBUS([strverscmp])])
> -	PKG_CHECK_MODULES([GUDEV], [gudev-1.0 >= 230])
> -	AC_CHECK_PROG([has_gdbus_codegen], [gdbus-codegen], [true], [false])
> -	if test "x$has_gdbus_codegen" = xfalse
> -	then
> -		AC_MSG_ERROR([gdbus-codegen not found - needed to build dbus daemon])
> -	fi
> -fi
> -
>  AC_ARG_ENABLE([systemd],
>  	[AS_HELP_STRING([--enable-systemd], [enable systemd support [default=no]])],
>  	[if test "x$enableval" == xyes; then with_systemd=true; fi],
> --
> 2.43.0
>

This does not work for me.
Using both --enable-dbus and --enable-bindings-glib works, but only
specifying --enable-dbus results in:

make[3]: Entering directory '/home/dev/libgpiod/dbus/lib'
  GEN      generated-gpiodbus.c
make  all-am
make[4]: Entering directory '/home/dev/libgpiod/dbus/lib'
  CC       libgpiodbus_la-generated-gpiodbus.lo
In file included from generated-gpiodbus.c:13:
generated-gpiodbus.h:12:10: fatal error: gio/gio.h: No such file or directory
   12 | #include <gio/gio.h>
      |          ^~~~~~~~~~~
compilation terminated.

It isn't propagating the glib dependency that populates the
GLIB_CFLAGS and so the include paths.

That is on Debian testing, btw.

Cheers,
Kent.

