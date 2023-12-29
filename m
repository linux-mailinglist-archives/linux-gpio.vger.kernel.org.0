Return-Path: <linux-gpio+bounces-1918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A593282006B
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 16:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C341F21FD0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 15:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F91125BB;
	Fri, 29 Dec 2023 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH/W0tCz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B81125A4
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d9bf6f24f3so1553362b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703865522; x=1704470322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdNEz0dZU0+TyDt+VV2CkzmWahVuHF8T+ANIgn4Mtpc=;
        b=eH/W0tCzLfqJjoVAVz0zFvptn0YrbDphXb9HlZPOlOrvGPJNVa0e1wp3ox7XUJHATH
         bJ2A/erXSIj2Zi51ShVAUDNFtw+ZgeEqVK+H/kd5fvK+E4PGaasDIZy8GuMgWqEHxOWa
         5JwoQ5b4nXj0AdiPhMQ35ozP9pjStcRBNvXTs4z64qBxyzSeBEAHyiACLqxLrD2pi11R
         LCtM8cHFoEx3oCpvOJaSKvIPTRjpheBocxkPMLMk+lvpwNPp1zHmu6NasdgDvj077Ys5
         VqEQm/G9EosFeuCBz3oOiLKF4C8tZMvxg3xivmk1ci12JRjfIuLG8X8IAM6wsg+DnTld
         /LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703865522; x=1704470322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdNEz0dZU0+TyDt+VV2CkzmWahVuHF8T+ANIgn4Mtpc=;
        b=LKKN6PS/TbkX5/yzzRi5H1l84vXAjdrHtIL1mGM8oPoPPni4C+QerrFIJRG7mxwN55
         WlQdCT7JphrSPaS7QrQybnqTCA/1FP0U/0vRo+Pj4iYIDJa9ZiSCYPSK2/5G6oD07d1R
         DnqV1v9oannl8syCLwRG2qwS2uLFCnbaL/uJRPYB8mfKegHqSPVbmk2Cwz3nwgXvTiWa
         qxLzZXNdKAmkxMfEMl2xYk+9DpLzDduhtohzkU/4RVUGyK4K0NrSaVpckiOpe3aN9J2u
         2fWwTwxcU9i+TVVHHOXUMJo2X0m4m4atNZ2n1Hx91Gqha4QcEzCZaxSNmx7WQRYjBhW/
         1GqA==
X-Gm-Message-State: AOJu0Yxc7LQPruqrthY4HDzdUFi6FC3zJvcZCEovn18kj+Mu0woRgbAV
	BsqIiKV6x9KQIENC1d03XBM=
X-Google-Smtp-Source: AGHT+IGennDIYXBX5F1E95aXf/VjGgvu8lv1I2aKmCp60LGqHy5FDZV+dpzjnchPdRVwHSQ1LAODKA==
X-Received: by 2002:a05:6a20:1593:b0:196:5f47:f6a1 with SMTP id h19-20020a056a20159300b001965f47f6a1mr1433079pzj.49.1703865522312;
        Fri, 29 Dec 2023 07:58:42 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a035900b0028aeb7839a5sm22104292pjf.47.2023.12.29.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:58:41 -0800 (PST)
Date: Fri, 29 Dec 2023 23:58:37 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
Message-ID: <20231229155837.GA103278@rigel>
References: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8C1XMX+piJQiyKSz+KyZfoe4FfL=SVycAuYGh+p+noyzNm5w@mail.gmail.com>

On Fri, Dec 29, 2023 at 03:14:04AM -0600, Seamus de Mora wrote:
> I'm trying to add the 'GPIOSET_INTERACTIVE' definition to 'gpioset.c':
> I've installed 'libeditline-dev' and 'libedit-dev' via apt; each
> separately, and then both
>

Please prefix emails related to libgpiod with [libgpiod], as noted in
the CONTRIBUTING section of the README, so your mail is more likely to
be recognized by the appropriate people.

You don't specify your platform and what you've done to get this far -
you provide the output you are seeing but not the inputs.
It is apparently a Pi, but the distro and version would be helpful,
as well as the build commands themselves.

Have you read the BUILDING section of the README?
How are you performing the build? I would expect autoconf to choke
if it can't find the required headers before it even gets to the actual
compile step.

This works for me on a Pi, both bullseye and bookworm:

$ ./autogen.sh --enable-tools --enable-gpioset-interactive
$ make

That results in tools being built in the tools directory, and the
built gpioset supports the -i option.

That is with the following packages installed:
 autoconf
 autoconf-archive
 libtool
 m4
 libedit-dev

Cheers,
Kent.

> With 'libeditline-dev' alone I am getting the compile error:
> gpioset.c:16:10: fatal error: editline/readline.h: No such file or directory
>    16 | #include <editline/readline.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
>
> With 'libedit-dev' alone (or both), I get these errors:
> /usr/bin/ld: gpioset.o: in function `tab_completion':
> /home/pi/libgpiod-2.1/tools/gpioset.c:732: undefined reference to
> `rl_completion_matches'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:713: undefined
> reference to `rl_completion_matches'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
> reference to `rl_completion_matches'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
> reference to `rl_attempted_completion_over'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
> reference to `rl_completion_type'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
> reference to `rl_completion_append_character'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:725: undefined
> reference to `rl_line_buffer'
> /usr/bin/ld: gpioset.o: in function `complete_line_id':
> /home/pi/libgpiod-2.1/tools/gpioset.c:642: undefined reference to
> `rl_line_buffer'
> /usr/bin/ld: gpioset.o: in function `interact':
> /home/pi/libgpiod-2.1/tools/gpioset.c:748: undefined reference to
> `stifle_history'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:769: undefined
> reference to `readline'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:853: undefined
> reference to `history_list'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:855: undefined
> reference to `add_history'
> /usr/bin/ld: gpioset.o: in function `print_line_values':
> /home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined reference to
> `rl_attempted_completion_function'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined
> reference to `rl_basic_word_break_characters'
> /usr/bin/ld: /home/pi/libgpiod-2.1/tools/gpioset.c:484: undefined
> reference to `history_length'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile:513: gpioset] Error 1
>
> Can someone explain how to add GPIOSET_INTERACTIVE & compile successfully?

