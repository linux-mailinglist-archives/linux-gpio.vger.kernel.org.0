Return-Path: <linux-gpio+bounces-5044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648A896B02
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 11:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854A81C22EF6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13D8134CEA;
	Wed,  3 Apr 2024 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IrxgW6gg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B851136651
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712137656; cv=none; b=CgXeEEZRe6cQpW4DxoHag08ZqVyQc3fyWhSdLMmoXnGN7brz8AwHC8Chu5jeQJMs8yyxwjHwU0fmVx5Yxs/Ry2x+xU5tLSpgZ0dqgvhKebUPVSeB6ZSdRlimaqEbWTFUwpDkdELjcSMGDskSU/mwG7jWIsslL5xQjg247cix5Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712137656; c=relaxed/simple;
	bh=qPteIPghEmNaFbFbiFtmdDCR/LlCAmuK8ocfUthHuZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctkqWSGMJc9VIj12sVrIWfINJl2aksDNsSfayy9hjaa3bp51ppQ2vxkqNK3hGqe+n2AY28sohzxJgMUgauq8JImjuhMDc+iw6O1KPaj3A7HIKpoThSfufNpz7ZCvx6OAjmuRrQRDloDGixprbarwrPKnIbLXWVbQS8H8YVMs8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IrxgW6gg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-515b43b39fdso662729e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712137653; x=1712742453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KABiyoA6kqLcaNOPFvDrUfGOgcIyRMqYJlYfREBWxQ=;
        b=IrxgW6ggp2laH/3u5v008fpHxZreyR21hYxus/LRUiAvd2IgTPhRUeu38SaK9I0Ddh
         mxUwKooL1kgXVcQ00aVGT7TK3KQZ4Q4Fmtge/oLlRp4aArlkZf4JDGJoZGTdQac9fIfm
         TQ0S03cX2SSGsCKhjWN89PiE/jafHfQQIh/OuvzGW5GmII8fMr+AaLrMm5hBRvqWm7mg
         9xfCRrqfIqYxUI5NJNiw1TmOPxPFNF2a54yK1iGOAh3rRY1RZi4b8g3gKi3sZw/L/LjR
         ydUvmXuL0qvz3J4mkfsVDDM24TEafweqaP1NWEGUMGoH1nAZsZl1U0a3WruvmWq3nI7S
         x1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712137653; x=1712742453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KABiyoA6kqLcaNOPFvDrUfGOgcIyRMqYJlYfREBWxQ=;
        b=mgeKfHUNlCroJYQ7XJX46FTaPpjQxGdEClvQcousiVhTREChzSyoZmGSVhkWSgwO8d
         Lx12p2WVGN1FZsBj7FqcvhTpiTzg/elPSvLJe0Okt3ZyG4D3HzCXOOWp7/osRheJIE4X
         xbhmzr15Q7YPZkVlAtUpR+3QQAQ0Fx0OvdJGcE5CZDBHVwUB7c1oUegktaen50eqYazN
         jfkTO+FJ9wBjCzQ5Up9HK4MkLvY42+CC7K/CHCS/RraGNKaLNyVAat1ce39rARGOVPzi
         DaVnP+e8Pra/qU/BA7T4O92zDqmEPSi71OWYRl2zKHgq6/hq5aft8YogNzG9ha+hWTJS
         XL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYCDaodWVs59BN6k+IOS3Z7PyIJXx+K/5wqFhzUxjquuiTrt/e1Bp0iMo+DpMsYCgkx2U4JjWn0+2UDkjXkRZIHIwZMobjTHLXQw==
X-Gm-Message-State: AOJu0Yxrd/NN8A5rwOMuLQqNptFil5PbY0gKAR9x/ko7zjYa2Y/jVJc3
	h+Wu/BGeoM/omZEliGP4EUK7Uf/3r/ERtHxDv24D7Hb3OLAANYvmoiBwIAYLNMgR7UATmB/q5wo
	1BNKtvrBYHPTXDDdDtS47BkgwVJfEY9oX/ZaQFw==
X-Google-Smtp-Source: AGHT+IG3Db0aH5fVKWMjadssHxAGVYgs1vlEPlw4hlOgGoFOBb8OwTQCY0tQE/dJH4EGfGfs4wf5rTdQTC65LycruUs=
X-Received: by 2002:ac2:5399:0:b0:513:e1b6:40b9 with SMTP id
 g25-20020ac25399000000b00513e1b640b9mr721023lfh.28.1712137652596; Wed, 03 Apr
 2024 02:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402114159.32920-1-brgl@bgdev.pl> <20240403094205.GA158151@rigel>
In-Reply-To: <20240403094205.GA158151@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 11:47:21 +0200
Message-ID: <CAMRc=MePwq_rnWZUA6skVqiqjxTKNLXR7cdfrrVeeaxz8Osxmg@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: check for NULL labels when sanitizing them
 for irqs
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 11:42=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
>
> It occurred to me that none of my tests cover this case, as they always
> request edges with the consumer set, so I added some and can confirm both
> the problem and the fix.
>
> In the process I found another bug - we overlooked setting up the irq
> label in debounce_setup() - the alternate path in edge_detector_setup()
> that performs sw debounce.  That results in a double free of the
> req->label and memory corruption hilarity follows.
>
> I've got a patch for that - the unfortunate part being that
> debounce_setup() is earlier in the file than make_irq_label() and
> free_irq_label().  Those will need to be pushed earlier, so it is
> sure to conflict with this patch.
> How would you prefer to proceed?

Can you take my patch and just make it part of your series?

Bart

