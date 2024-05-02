Return-Path: <linux-gpio+bounces-6011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979A88B99A7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 13:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ABBA287C7D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 11:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094685FB87;
	Thu,  2 May 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9kNL6F4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7A5F84F
	for <linux-gpio@vger.kernel.org>; Thu,  2 May 2024 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714647890; cv=none; b=cKA8tkVuCAAAYgbGidLxdNxMhwXg6NWpx2ZGMXLs6TsnTQT4kI1exTPDjrai3VYr8l2DDRz0Bsvt30iLPl7ibcBnyrbw8dG++LdLsetHUqTrvz0K4XToHDvUhIkJOCMF07QRbBhFHM6kghbkIQlK18+R2JMgRs9kJF6KX+tkVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714647890; c=relaxed/simple;
	bh=/RK6RJcn5lW9KgB+3fKdf400n7QfTwqH2xMVpRaN9RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaMtl2wHiNW3+buF/mXbPBxtxffAM4K1YO5jHn15quXq0RNeAOnoZVvauZXDsuSUZKjvMAIyYE+/T31JDRUEmJBtOinEj1WIDOOanppWu93EJzxvH1/6X5uoRNbdkE3TgoG1EgaAuhEQc3KunZ46S7ZOiafnvsqcU1X2J2H5Nek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9kNL6F4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e65a1370b7so72323995ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2024 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714647889; x=1715252689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2gWPGa41ZJS/xXBUGG8sBlT//2oX2yPG20qE0bIPU4E=;
        b=i9kNL6F4Ujmcb6Bu+19xp6xLjDNSJGx6UqEsuD/KAsHgSq5zQtS+tWdOIgHtvzSrqH
         XM8GMreaE7S/7PecYtfLPGkD/1LxLe/Dj7vnuG3Lvg5bwvxEztFnUvDeT7nsJ4diTI56
         NMEl0oKUcPfrr3PXd7tDIWBHH29p5ftbC8n9aWNmw1JkQUCHz98jUISszqWKPWYaw/sL
         hKcBGRXyaWKI9mDIkw6pk1VRSpV9zHGO25OZjdDnkRWgIeezkaqTg5KIoPDCE0ZDG91O
         xUcuNATur62005e0Vq97x25MDDGSyId+O7Dm8WBFGZLvltJgX9Q+vqWFrIcWXF7EXv+p
         itxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714647889; x=1715252689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gWPGa41ZJS/xXBUGG8sBlT//2oX2yPG20qE0bIPU4E=;
        b=NDg2ouNoxHz7h1MMWS1SV62iQdif3G4ugUeE/kqAUsoGBT2KOaX36mx83x1yIUSZQk
         kGQiQAaBpnlVcG0BT8n0YwSslMv9RuPaoZxUdk0Qh9EvXfdaHhX/1w8DqXQt3yE5VrEs
         MayjbbwItJDQhUwjJBeQvPPuCTIEEr1ewjduz6X9/4wl0o+YgPe6v//jjHGxa+yHaLQn
         TBg2hALR7F7LTMCpMwAW/wDWnkTwwDbrN4Esvs2OEgsOgVK3LYpvBND464g9nEi47buS
         F8PUab0o0J/3ZbXqZCI/ZjFSRgSnVvu/KV+TuYB2oMuLjjudprGP3ANkpszVrP9Nx6i2
         DKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw1fMFx4oMMNsWiGnqUzj7VK+YDORqRWMg7LBxyqBUCqUT4Q89bZ0Y3RGwioKHeg10vBYTKJj5bVum6imh4cC/rp/By2hHvsgphw==
X-Gm-Message-State: AOJu0Yx40NTRP6XlsxI2C00mkFjIuGWOtBwVRaZ20nvh1f3vAtowIc3s
	lyHpyUanYEIeO0wUDP+2Ea9opF065JBtFilp6HbOBmcYD0EP3flP
X-Google-Smtp-Source: AGHT+IGCIKqSw6L/w+4gnPbAE8ruEpDuz3KbL9xnQAuQQLdbKWtXn29S30EOE3G7TPDp51OxMFPJ0Q==
X-Received: by 2002:a17:902:c084:b0:1eb:1240:1aea with SMTP id j4-20020a170902c08400b001eb12401aeamr1714131pld.20.1714647888767;
        Thu, 02 May 2024 04:04:48 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902a5c400b001e7b82f33eesm992557plq.291.2024.05.02.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:04:48 -0700 (PDT)
Date: Thu, 2 May 2024 19:04:42 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Make pin freeing behavior configurable
Message-ID: <20240502110442.GA315256@rigel>
References: <20240419204057.86078-1-wahrenst@gmx.net>
 <9a7fe0d8-ff44-4904-84cd-7b133f40a74b@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a7fe0d8-ff44-4904-84cd-7b133f40a74b@gmx.net>

On Thu, May 02, 2024 at 12:22:07PM +0200, Stefan Wahren wrote:
> Am 19.04.24 um 22:40 schrieb Stefan Wahren:
> > Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
> > So in case it was configured as GPIO_OUT before the configured output
> > level also get lost. As long as GPIO sysfs was used this wasn't
> > actually a problem because the pins and their possible output level
> > were kept by sysfs.
> >
> > Since more and more Raspberry Pi users start using libgpiod they are
> > confused about this behavior. So make the pin freeing behavior of
> > GPIO_OUT configurable via module parameter. In case
> > pinctrl-bcm2835.strict_gpiod is set to 0, the output level is kept.
> >
> > This patch based on the downstream work of Phil Elwell.
> >
> > Link: https://github.com/raspberrypi/linux/pull/6117
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >   drivers/pinctrl/bcm/pinctrl-bcm2835.c | 20 ++++++++++++++++----
> >   1 file changed, 16 insertions(+), 4 deletions(-)
> Gentle ping ...

I can't comment on the substance of the change as pinctrl is outside my
wheelhouse, but the "strict_gpiod" name could be better.
The point is to make GPIO outputs persist, right?
The name should better reflect that.

Cheers,
Kent.



