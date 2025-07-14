Return-Path: <linux-gpio+bounces-23215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699FB04029
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE67D1672E2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 13:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4EC1FBE8A;
	Mon, 14 Jul 2025 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="LMB9TRQc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153CD24A054;
	Mon, 14 Jul 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500020; cv=none; b=h5r53QaSMd13qCL49Ram3HiYpybFHdgKG/KtC8VyVTr2pG8e3uemln6t5zYHbEicM0IeLDTgQJgFmxj6UZByIjAvAMWpmaDFtbo/vBwe77B2c1b10pc63T4VXr5+aY8AxOn+s0wCGyUJEII0Owl4UnWzCskcpxIhbbss6wp3ffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500020; c=relaxed/simple;
	bh=CN7meXqcjOQl8Q5QLFDMsdkb5s/t5q/RVkICRRAqXxk=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=MCJif94/2NsuAdR/6BOYKWsmwuFU1Xnhz6EhIZ9cH/mnwAat9zKt4znGP2EPHw8w7z7AIeUS5K3bfPao/AegxIWqAZ4zaRGAsVysf8/OdDEtTpcS/TowCSfQJZTnpW6YOL+9vDWqzVzSa2k6oZ+2O2+aqHpShzISAxkjLeIkz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=LMB9TRQc; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=lLXoJeyxFBMFgfiUZIb4L0UR3mTeCKQZPxkrChu09mY=; b=LMB9TRQcR3UgTSCrnCjkXER1rv
	D4pSz81iFNg/8m6ofnxT8hkoa3ca/fji0uo4ZNfBuqMfl63i+cWOg47pBMe1WxGQwyXmhh1e1R3X9
	qT+G7V+K3bDlLl0hWAnFS8mYqzG1DlwKWKqfsxUW1MnZg8O2yEfzIdjpJLn1wLIbpyP8=;
Received: from [184.161.19.61] (port=36668 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1ubJJA-0002Rb-Uy; Mon, 14 Jul 2025 09:33:30 -0400
Date: Mon, 14 Jul 2025 09:33:28 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <20250714093328.4aad6ae61a6eda364b7b7738@hugovil.com>
In-Reply-To: <CAMRc=MeJh2H0zYg5mfkuZreNoRAOWar9oR68+xrAar+-W2gJqg@mail.gmail.com>
References: <20250709201028.2175903-1-hugo@hugovil.com>
	<CAMRc=MeJh2H0zYg5mfkuZreNoRAOWar9oR68+xrAar+-W2gJqg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.9 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] gpio: pca953x: use regmap_update_bits() to improve
 efficiency
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Fri, 11 Jul 2025 12:22:40 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

Hi Bart,


> On Wed, Jul 9, 2025 at 10:10 PM Hugo Villeneuve <hugo@hugovil.com> wrote:
> >
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Using regmap_update_bits() allows to reduce the number of I2C transfers
> > when updating bits that haven't changed on non-volatile registers.
> >
> > For example on a PCAL6416, when changing a GPIO direction from input to
> > output, the number of I2C transfers can be reduced from 4 to just 1 if
> > the pull resistors configuration hasn't changed and the output value
> > is the same as before.
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> 
> Nice! Can you rebase it on top of gpio/for-next, it doesn't apply
> after recent changes to the driver.

Sure, I will send a V2 shortly.

Hugo.

