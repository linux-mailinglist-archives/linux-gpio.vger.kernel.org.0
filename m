Return-Path: <linux-gpio+bounces-2185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765182C91E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jan 2024 03:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277F61C228FE
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jan 2024 02:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFC218C3D;
	Sat, 13 Jan 2024 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRIVVd6Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805D1A700
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jan 2024 02:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3606f5295beso34426085ab.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 18:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705112711; x=1705717511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9edGGB/Z8Nxs272oT+htd89iJX5LUmSGViJchCA6DGI=;
        b=hRIVVd6Zp5mnAJOSqSo11vAmR+F/rDhCFLQww1oEmeanbPu1R46rKsM5Fojk9NJIL+
         2OTaf6PIqgYFbVy4Hgmu+Ye6GCk2GbHlePqEqr6qFFGjXgyJXEwwNZtRCyC86zgf0afm
         jp2uFeyjW+GTZ5lf6eS2OGOjHCJE7DjcbKjEAOFaJe7VOEyJryMEAjU+NBDL6BVwBAen
         FnT4Yj3wZi3fIOeIDJc0AIxbKeKxCA01nbaA0h6QW5057dXS7D+t0C0TQ6xYEan4FzT8
         WM3T36uXFm4Gjl03qtfgX0jVM53105IvJeux45sD+mg4IDDwV5iekKY+OEcmQ45x32Be
         QFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705112711; x=1705717511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9edGGB/Z8Nxs272oT+htd89iJX5LUmSGViJchCA6DGI=;
        b=Wol/0RI0q/Klplk/97dcD/I2zto9V4DudLlEWpKIHq0hc/7WB8IPxGAz4hKs1p3l7d
         KZs9cNqtEOqoPeC5V8KLOalwej74jcUwLuO4uzEVORnIKhRiwDhhTMI867z87xo0y1Sl
         ArfDqWXar4r/TT9qs6t4XhI/cvdaxLTZX7OHgi90X8Dhw1aJB2+vRId0C1hRd/9lpyaO
         lUavyOMPO0BX2LqltgQUbkQJvCFSjHBqjhLmHOEtSiHHSS1SKI/LUAyo76N/U9H8uIqU
         zTHE7EkxguIih1aloZ0rU9QrEOyxMj2KCoZZoL2h2rZ7DQHR2Rr4awgge93mw5NlEPFa
         8HUQ==
X-Gm-Message-State: AOJu0Yyn4o0YDGC6LxAh/p0wdi5KFgswuvfIbU+NsxxdqiJa52N1EGCC
	h3q2caXPxtvP5GHzhuYY1Bo=
X-Google-Smtp-Source: AGHT+IE9hhK/lxWKlyPht/oRgiCY+3g4Jc6sS7xQMj9sVI4rGe+Y6kwssNqSecccWEKl1VSoSzfWgg==
X-Received: by 2002:a05:6e02:6cc:b0:360:648d:1da9 with SMTP id p12-20020a056e0206cc00b00360648d1da9mr2274820ils.7.1705112711161;
        Fri, 12 Jan 2024 18:25:11 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id p21-20020a170902ead500b001c9d011581dsm3858267pld.164.2024.01.12.18.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 18:25:10 -0800 (PST)
Date: Sat, 13 Jan 2024 10:25:05 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Message-ID: <20240113022505.GB3233@rigel>
References: <20240112150546.13891-1-brgl@bgdev.pl>
 <20240112152502.GA92656@rigel>
 <20240112154030.GA94712@rigel>
 <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>

On Fri, Jan 12, 2024 at 05:07:42PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 12, 2024 at 4:40 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jan 12, 2024 at 11:25:02PM +0800, Kent Gibson wrote:
> > > On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The github page over at https://github.com/brgl/libgpiod has been reopened
> > > > for bug reports and discussions. Add a link and a mention to the README
> > > > file.
> > > >
> > >
> > > No problem with the patch, but the github page itself seems to have
> > > Issues and Discussions disabled.  And the Wiki might be useful too?
> > >
> >
> > The Releases section could use updating - it lists the latest as v0.3
> > from June 2017!
> >
>
> I don't want to do releases on github. The right place to fetch the
> releases from is kernel.org[1] (I should add this link to README too)
> and I don't want to duplicate release tarballs. I'm pretty sure people
> would start fetching releases from github for distros etc.
>

Uugh, yeah github automatically provides tarballs for releases and there
is no way to disable that. I was thinking you could just use it to advertise
a particular tag as a release, but don't want the additional tarballs
floating around.  So, yeah, definitely need to add links to the official
sources for tarballs, cos they can still download a zip of the tree, even
if you haven't provided the tags.

And, if you have time, adding an issue describing the daemon and where
you are at would be really helpful.  Though that is currently living in
the topic/dbus branch of libgpiod-private, right?

Cheers,
Kent.


