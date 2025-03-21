Return-Path: <linux-gpio+bounces-17850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE3A6B9B8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C102C1894271
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC87221F11;
	Fri, 21 Mar 2025 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HclqFgiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A412C1F0E49
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555898; cv=none; b=XFOsQMzSYOYWmPd+Ww2KXvGS+MK42s/xRAb+6GcdsmU0Dk6t5LNnhlWgmQg8kMS8oWoxzyuxJrxZpw6pJVWzROrBjH9yHESdT9k7sL9AJ7KuF8gGJ7zxcNqG4J0UJ3N94YV5g7+nYIGH8B85mh8n2w04HOJEpqxmXZEDzYJk/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555898; c=relaxed/simple;
	bh=0Re9nYIVG+3b6VsBXMUbI1ZtB6rKosaiajqm/7/xC+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSe2yre/Km8hd6xgPSNH/r7GxIAeSQperry3x6a4q6GWmjMQIQ9yTzPIzejZrLSCV2kR5klq5o1tIw2mb8cPm45W1BGyq0dyUuZcZmKyv074pNNA0Xn6R3o0cJqi9/3YEzydyXU0aRpLxj6rxb3SgwC/gaGLDK/poPRDl5A+oaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HclqFgiu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543d8badc30so2108676e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742555894; x=1743160694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCtKZJvKkPXJJY2Ss4/q9tNkLTXS6Y7jlq2lUla77Co=;
        b=HclqFgiulinnxF3RXgiZ+VT22RJj+reM+oTv0anHVKETygpACteo83YHXi6qYEz2Xd
         dsOe4zcnbAab92if5AjYS24bYhx+ngjJ2KFnIACMi5KnMn1lXPda7P3sofwNvDusBuAu
         cRWNk4IlimrX5t756v+PkV8oTjPNLoalVARxeWIbS2d9sjPjVLOAXXSX6oLZxqijclGm
         s++BVoG5kXk6w9TZ78cq4en0ctxRQmx3Q9Kmr1EiukIiIYQZdqr1PE7n1iMwWK2PwtGs
         bBxiFIlW1UNCNwdHHxO9SNdxMFrEKJe23+eA2L4zw7UXcdbgs8l/4I1QqZM3p9nVAIUV
         gQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555894; x=1743160694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCtKZJvKkPXJJY2Ss4/q9tNkLTXS6Y7jlq2lUla77Co=;
        b=T/Iybk6pvs8b4V1JwW5r4BFU72VmBD/lNTi53rtDfS/0MwEF/JaDyhk6vPohQpDOVE
         wzC95Z8wZRHIKnjypIkbE0TPKcR3+zTsCgogSP65nT5lIs62CwdnxurN78aVOQ2Skm9k
         x7Sx6QnyVISBSYG0GvIiynYmQGwmSsf+8dLLMyzIbLy3bb2fwBaN2nGu4y9v/9186vM9
         BUnc9e6VhDtfUUeZpAeyauW8QbSE0/0xHEEuFtkEE8+zyufAwImzHX9U5BAQ3RB6AlNV
         M4zNzxEscuLhUanGgdZ+WJpBlBWq0sLNqB0JYQ84lR8fjOanE4uf2O5aZmMyHmGfjdlo
         cqYg==
X-Gm-Message-State: AOJu0Yxj0VRg78YPLmA2JXadtxndGmpiG8fkfobRxIqazK8if0aqVRv4
	kXojnMGGlA+cn7HzAyqDT45zf3zUCKtUJidTsmZmSDPFP7ZCs7hdwYofEGnYPBjqQdOX82qQ8B+
	lEv5X84vI6mwRxL3GNcqRh0iRsr1dOzi5TUdaUw==
X-Gm-Gg: ASbGncu4ntcaU3zLifjbT1kcTfmsRPnZ8ZWkzUsLSiybm5C9o9v5BWnBJDKUyO7+rkG
	wEUzRPZhgdKaYA0iIRLgOr6btuIzu0p2KBG6h9Tcn5lV7/Yfl1FwgXPSbJcrdcSZjIxV3lEjuLa
	hDw1+wKygVLORjlHDNa6710ZpbCaG7PoY+E4tR1XY5Ya71Rq85B834wa/6Udk4g6lfhDO1
X-Google-Smtp-Source: AGHT+IERJm75s5rZciBb0RBn6fFVTeQTNfsC0eQdgKqDYyHMqznGKgeQzvEvo63JtZR1Ek4d8tCFdpoVi9klTzrD4OE=
X-Received: by 2002:a05:6512:1149:b0:549:7145:5d24 with SMTP id
 2adb3069b0e04-54ad6500471mr962726e87.46.1742555893632; Fri, 21 Mar 2025
 04:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-5-koichiro.den@canonical.com> <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>
 <6mcl34zdx37gjh3a3y4lc5kgb2vv5notvs355oewiwogpgg5g7@jcuukymbifnm>
In-Reply-To: <6mcl34zdx37gjh3a3y4lc5kgb2vv5notvs355oewiwogpgg5g7@jcuukymbifnm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 12:18:02 +0100
X-Gm-Features: AQ5f1JrplLiIs2CXFFDFsH3QT7byGbN_uqzclHZ1yTE_iRMbvq9HpcR-A6D5uNs
Message-ID: <CAMRc=McpqUsEsMSfwo+WrzWdaW6YnMbptpj3fAoS-JfVhSm9mQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:35=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Mar 20, 2025 at 04:54:26PM GMT, Bartosz Golaszewski wrote:
> > On Sat, Mar 15, 2025 at 5:41=E2=80=AFPM Koichiro Den <koichiro.den@cano=
nical.com> wrote:
> > >
> > > ---(snip)---
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > ---
> > >
> > > @@ -90,6 +124,70 @@ static int aggr_add_gpio(struct gpio_aggregator *=
aggr, const char *key,
> > >         return 0;
> > >  }
> > >
> > > +static bool aggr_is_active(struct gpio_aggregator *aggr)
> >
> > Series-wide: I would prefer a different prefix: why not
> > gpio_aggregator or at least gpio_aggr?
>
> Actually, that naming was intentional, but perhaps I could say this is ju=
st my
> personal preference. Here is a breakdown of the function name prefixes:
>
>   Before this patch series:
>   * forwarder:        gpiochip_fwd_* + gpio_fwd_*
>   * sysfs interface:  new_device/delete_device + aggr_*
>   * platform device:  gpio_aggregator_*
>   * module init/exit: gpio_aggregator_*

Yeah, it could use some more consistency. First: there's ongoing
work[1] on moving the forwarder code into its own library which is a
chance to change its prefix to gpio_forwarder_. You could add a patch
renaming the sysfs interfaces while sending v7.

>
>   After this patch series:
>   * common utils:     aggr_*

I'd prefer to keep gpio_aggregator_ here...

>   * forwarder:        gpiochip_fwd_* + gpio_fwd_*  <-- _Unchanged_
>   * configfs:         gpio_aggr_*

and here.

>   * sysfs interface:  new_device/delete_device     <-- _Unchanged_
>   * platform device:  gpio_aggregator_*            <-- _Unchanged_
>   * module init/exit: gpio_aggregator_*            <-- _Unchanged_
>

Bartosz

[1] https://lore.kernel.org/all/20250317-aaeon-up-board-pinctrl-support-v2-=
0-36126e30aa62@bootlin.com/

