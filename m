Return-Path: <linux-gpio+bounces-4021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61D86DD21
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 09:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61ADC1C20AD4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1E069D36;
	Fri,  1 Mar 2024 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p5D8AtBE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7D42A9B
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281866; cv=none; b=Bx0PRNz1J3v9mHVel2qLeh+FlyJiXO/29gVPLjsiYS85U/jQfzGjvxyiqKp0KmyOMRXcs7eVRTaHpA+Vy9xpm9rGopgJoUCXcaeBUa82xgst7bY3NHt17xGu0LnyJ0gbkL5pf9MsblrVVdIBED6U8evhZcPR8Vwq+KWVcwArEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281866; c=relaxed/simple;
	bh=YXBA+GcFuwZgsjp8m2PtmBFhx/is8VEvcplYegn/n/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDar8tNcGBrIxPNrZcebstcCtQkbawHwruC/Nqu4HkRdgFyBm1OGBksVVCOxoIu6IRoCC2iHW1yufCJzjd5D/z6OdSuzq/JHipa2xLtP3sf71sLk42r+xtnqBXkkr9oFY5ZHuNhlVpotRTijbHOtyl0fqJ9MMk0wpre84miCiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p5D8AtBE; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4ce2cd0cee2so545978e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 00:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709281863; x=1709886663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lELYH8h+hxL/iuJtoVrms/GoKsq2XvHNLfFd3ns5F+c=;
        b=p5D8AtBESMzYbNA+xHQ703g2/BUTLgZgX8vDX0IMbS48QFny88uYBxcZLS8Xc95SKi
         Rt1ub2FRO4s4SwDIVss/yqtt38Pztu/5wMvCCLGAr4e0n1O8UZlffJUWQ0NtBq1IzQaB
         Z0+YiVH5HRN9zXyEDPoLEHK3zytfox5gfgmENeTPV2Ng9WXXnRt5mLg3+EFpS9oazVLJ
         2BU1capY8RAsRFmVuV420ZOu3tTOBlbtMfeTm3rNactfmmqdjJjpEc3YQHIIDEAmfeSC
         iAbAcX3ClM1QnotnHXt8tygn7SngzsDdO7dpW0FxTceYgVe8V+qbRfCAIzkrmzvZhQV+
         W65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709281863; x=1709886663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lELYH8h+hxL/iuJtoVrms/GoKsq2XvHNLfFd3ns5F+c=;
        b=sv27mzLZQcXGpBq5YNxroJQ+6IaiJIV6edYkTqJcNXPzxTqPeGl0aTr5eUBtRN77pp
         XFptIvsYvvpWmmplnVfbT8xHD/FBeiRfyAPlaEoWL3guJR/R0UCIhsF7qqAmXRNW/GWz
         gM6HedVkw65IzJaZR7qChIPF8d6JuX5Yscg81fH+Y/2TQe8mFoziA4vHOXQ/MDjgA/th
         CUFyKn4WoFfCZKtpN4TPaGf04YK49EHesztaOkgeG7sjBwCKALW6RskcpNKLASLi4UF4
         Ebd4hpCAnZH3w6H76HnIV2byu70BAZ8ahNsWD7UvwL6sn9KjiP87Y5qGzOoJM/vXRNi9
         nk2w==
X-Forwarded-Encrypted: i=1; AJvYcCW1Rw1eM2zRVEDi9CLwruT0SIpUXeUU3sT8cFOtjGzCwV+XH+mHEM2riUoBCK5iwF/iCsrck2jiXueQX/eap2YTm5xJAYFGDVb5cA==
X-Gm-Message-State: AOJu0YwJ0qayAyzVNdsPmUdvUOO7FmMP4iKFHQ78e5Sov4ED66+bverp
	fs6XStr8e0IkbDcEDRd8sN/jRfpBySyEFS2ynG/t4eDNDy3Ypu/mR+WNFHMl6vx5ybauFC2atz4
	ojLBDgA46nocyya2o4TbabSEJ4SaRqkntiJf3UQ==
X-Google-Smtp-Source: AGHT+IFRDY3BPCDQD5iWo1yphcqOO9zcOl6psQ3cmTnKIEq8pACvPundsi04NcilWPzsEwn2Eg6zK2739v7iQYQFJi0=
X-Received: by 2002:ac5:ca86:0:b0:4d3:45a2:ae53 with SMTP id
 u6-20020ac5ca86000000b004d345a2ae53mr601563vkk.16.1709281863663; Fri, 01 Mar
 2024 00:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229172549.444227-1-brgl@bgdev.pl> <ZeGQk82bOZA7H5kS@hovoldconsulting.com>
In-Reply-To: <ZeGQk82bOZA7H5kS@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 09:30:52 +0100
Message-ID: <CAMRc=MdVzbb1ZxYprwFRDnCz0M=FQgZ1Osq-2nTxo5_AvKwqZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix resource unwinding order in error path
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 9:23=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Thu, Feb 29, 2024 at 06:25:49PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Hogs are added *after* ACPI so should be removed *before* in error path=
.
> >
> > Fixes: 6d86750ce623 ("gpio: fix gpio leak in gpiochip_add error path")
>
> This Fixes tag is not correct. Back then hogs were only implemented by
> OF so you need to find another commit to blame here.
>
>         git grep -pW '^int gpiochip_add(' 6d86750ce62391f5a0a7985d5c050c2=
e3c823ab9
>
> Johan

Ah, indeed, looks like it's me who really borked with commit
a411e81e61df ("gpiolib: add hogs support for machine code").

Let me fix that right up.

Bart

