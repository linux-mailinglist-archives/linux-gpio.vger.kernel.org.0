Return-Path: <linux-gpio+bounces-7869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F7923920
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 11:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9D7282FC1
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4D21509A6;
	Tue,  2 Jul 2024 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="WjO7GsAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E6145326
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911222; cv=none; b=O7nzUYhGjEFgTMrQkIYtuOIwCp454Wu9GKz1Qvcu+JFSUkOhggjsJ/pE5qByMxW22fxqtUMZ3JWg6wJTB21+OZjE5EltCOBd4jJPLAEEA+BCFpqDE13XzQs5hlnFLd9KaTWMbT2RP2RjvT5ejoH/08BDZLPV+v+9lWyNwMUfT48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911222; c=relaxed/simple;
	bh=4pFoV2xQ29ob0QJZdBFMeOsD+2luCEAknAnBarnXSf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGvQQJgEIihF5crvDquZNR2IKH0w/DFIFnZMCuCG6k6e0jXeRrli7QWrmJbuwknztsROWe92wwpd0VL8+qbR1qNTmPLtc0wH2Y5PRQdC2Ep3ZbF6XghbeZLCZRQSCbFwCi1oX2lYFG8vXcsA/gqjt9ErhrBHGYwLUVUAVQZFktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=WjO7GsAV; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from tjmaciei-mobl5.localnet (unknown [IPv6:2601:1c0:4501:635e::1002])
	(Authenticated sender: thiago)
	by letterbox.kde.org (Postfix) with ESMTPSA id DC7C93277C4;
	Tue,  2 Jul 2024 10:06:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1719911212; bh=zYaV+MXkCFDGkToUbgm3PYnZ7PutGyhqS2UilR77qiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WjO7GsAVZsTTldCUofuLZrBpbdB15Ua+HfjsQfDq1hwWJiOn3OU27GU9aowmTL5wt
	 yveKO+3N1dJ1xfXWQq1JZLDNd7cr4APkLHUX8GBoTnK/Nj6lwkjkJ8JGsym4ulh/In
	 pMZ1CsXqbgjcpwsmZUkTl7n6JuIvXy0npddFvf1KOo+/Ny75gr1Mei7eLi6/hqDPco
	 PnanS04XjYADFJkBJmYA/xpz+I9fIGdcn5wd/2EFqCQz+VzLAnxrDp5Er7MqmznHSf
	 l8nm2bFgb4eEqx4x1iRGm8noHoTjxTjx1URstgOgearJD2yHmFBfHAWlsod05PxpHf
	 J3AisOxdMz9HQ==
From: Thiago Macieira <thiago@kde.org>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "warthog618@gmail.com" <warthog618@gmail.com>,
 "erik.schilling@linaro.org" <erik.schilling@linaro.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "phil@gadgetoid.com" <phil@gadgetoid.com>,
 "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Date: Tue, 02 Jul 2024 11:06:44 +0200
Message-ID: <1867994.25eIC5XRat@tjmaciei-mobl5>
In-Reply-To: <93346bfc3647d24f1512e79088b26f804fbc228b.camel@siemens.com>
References:
 <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
 <1917470.LkxdtWsSYb@tjmaciei-mobl5>
 <93346bfc3647d24f1512e79088b26f804fbc228b.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday 2 July 2024 08:48:43 CEST Sverdlin, Alexander wrote:
> > What's the point of this property? It looks racy, as the user (whichever
> > it
> > is) can stop using it soon after a true read, or the line can become used
> > right after a false read? The latter could lead to TOCTOU problems.
> > 
> > Wouldn't it be better to force users to RequestLine and get an error if
> > the
> > line is busy? Because if it wasn't busy, now the calling application knows
> > nothing else can grab it.
> 
> this approach would make the inspection itself racy, isn't it?
> I'm thinking about two instances of "gpiocli info" running in parallel, they
> would display GPIO lines randomly "busy" even in case none of them actually
> is?

Correct, but the race time would be very small. The status application need 
not keep the line requested for long, only enough to get the current state.

In any case, my argument is for everything *except* for the status / info 
application. That's an outlier application, of which there's likely to be a 
single one in the system. However, there will likely be multiple applications 
that need lines for actual uses. The argument is that the presence of the 
property can lead application authors to check before RequestLine in order to 
present a message to their users, possibly because their code is simpler for 
reading a property than dealing with an error.

Therefore, my advice is to not have the API that can lead to TOCTOU, even if 
by accident.

-- 
Thiago Macieira - thiago (AT) macieira.info - thiago (AT) kde.org
  Principal Engineer - Intel DCAI Platform & System Engineering




