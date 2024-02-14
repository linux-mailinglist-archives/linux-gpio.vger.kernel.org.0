Return-Path: <linux-gpio+bounces-3283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD068549F2
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 14:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F1828D639
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 13:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6949C5337D;
	Wed, 14 Feb 2024 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T3LIOYRE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C2D5336E
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915733; cv=none; b=rtXwIRHec212hiOl4uB6FWrz4r7KOVksO++3fyFbQOubBieeMVPghftvlBVBMh2zlEFkDjm1WIGoBM4utczZlWqOPGxkr3gEMXuzK576JWRPiYl+W2brKfKJK/LXWSnto49XFr5LnX/o/tO7/zYoDnUCjqX8+z1dlkbc2gUouYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915733; c=relaxed/simple;
	bh=VD7zYtGMmHeVlAM2fz9royx2rl1vyec+KkY4i/Lv32M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgcvVKfCSG6XzZlBUS7VHEjoWDpCy9rG577amNyH1xWuGL4HapaKkqQJT/TAQQuZ6v3fi+gvJV6eM9ETEIEsUe45+lRNYTcZ7PaXdcIP6/r8/RVLasKVPNzShp22yNvRaEE6BNNUfgsy4YqnDQMENAXRCRQ690Xm4Cobq8/vmiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T3LIOYRE; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bba50cd318so4110166b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707915731; x=1708520531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD7zYtGMmHeVlAM2fz9royx2rl1vyec+KkY4i/Lv32M=;
        b=T3LIOYREjjNZSkhudnUc5Cr4UyY+hLGHLjAPM9mrvs3CFwxeayXomb8FVFfjZEFrVt
         Na+cHElgMJ02oY299tfhzSt9SnjmZdAIg5Dk1c3uy2WDJOXemFg4QMeDPuqujD+T4zkj
         r5ZN8hIOAAfePnS6dM1Vy9W8LP6o6qhtKjrZViAFX1tsQn/HrGi+fYDFCqISRVU17DYs
         lfp5UpoMuDUqXsd1a3k6CUa/G/ifp00UU24x9Ce+vR+8t5y7V9SRd7eTVLTflYuFonmA
         JScHAQl+iq11/hWIrzr5j7kuZ3CLlFwVky7tXRF+eubpUP/Pfo1pB/qticJoYLXoHv+K
         Eapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915731; x=1708520531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD7zYtGMmHeVlAM2fz9royx2rl1vyec+KkY4i/Lv32M=;
        b=MVRaGv9xOyUBD8HsUJXXiejLIUcd57t2iLFaIz+dTxFL5/7xzvGkTcnwEf3WHwLdOQ
         RnV4v7TPQEabIpaT+JU+1sa+MhS9rXIbS4FQ0mk3yLsry5EMsMW9NUMQpmNJoFmTMgf2
         LjPPqdTSo15/GSbJ6xx8f1zT0eVUVYkLa/1BhTBD9hcMaMwBxK8i1kGRAe1nkpD5NIHb
         PE1XkNmILFBjkJgV6U58VD54cvawNCiRaDbbVkLiG5iFZoZGXWUffDE8yTcqLu+L4KOS
         0o2B3NuwLxD4lC8mHAyWj+Xxa/QJMOEYVvX7EBmgd8Ez/Iq1IoRmG78I+YpjFddqYXWy
         vZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWTCy9tpufu0HBywBFJ3zp8KY5iLB4LW+fL9zZJz5HkKMZltKQj3Q/bUUvHjRorUMbLijwP81bA+64EuK07Ng8OY4QUgc21G4bUbQ==
X-Gm-Message-State: AOJu0YxSeet1vt8ncn0urwjvzNN777vzkX4CQHseIDjNP2ES22dCtGj+
	tw4OcPnLO2MXRm/0ARz/WL/krhEkHUX5E8rOMdAiVmZ7lWkSizv6MkmtrBfmzImqos1Va7Kmb8t
	+b5Zg1hoyAHSFugKBpT8h00BTgK8Rn/ouW+29Jw==
X-Google-Smtp-Source: AGHT+IEPS0V7YxUt0NBYw5QwuJGgE84saTNGAvFGJmdlkhRRd7Wdt4ChLS0y0QPWhBAUYffuH/+tg+hgttliVf3NB1A=
X-Received: by 2002:a05:6808:1a2a:b0:3c0:4838:a490 with SMTP id
 bk42-20020a0568081a2a00b003c04838a490mr2808794oib.30.1707915730831; Wed, 14
 Feb 2024 05:02:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214084419.6194-1-brgl@bgdev.pl> <Zcy3voO1yTPHo88T@smile.fi.intel.com>
In-Reply-To: <Zcy3voO1yTPHo88T@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 14:02:00 +0100
Message-ID: <CAMRc=Mcbsz6DbxV2uO+wf73g364eoqDKetxNNDHFJ94AMvUr+A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: fix SRCU bugs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 1:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Feb 14, 2024 at 09:44:15AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here are four fixes to some bugs in recent SRCU changes. The first one =
fixes
> > an actual race condition. The other three just make lockdep happy.
>
> Same comment here, can we simply redo this work so we won't have tons of =
fixes
> on top of the nice RCU rework?
>

The rework is clearly a new development - not meant for backporting. I
don't see any benefit from rebasing. These are normal fixes for a big
rework.

Bart

