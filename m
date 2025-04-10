Return-Path: <linux-gpio+bounces-18679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D48A84C43
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 20:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BC84189C5AC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 18:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E7828EA50;
	Thu, 10 Apr 2025 18:41:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC028EA4A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310495; cv=none; b=V38RtoTqgC8ECUsjjDkC0iK4axNDuXYuWukfEb3ay/PSAbWIOuVX9CUundQqNGdEwxE+emAicfKVoE3Ab1JqFRoYohip94M8nUTIuLeZBW70D02JNg4xlMWc6huv0a236eBb0Ho7MNtwEBewTQ8swjSuEnKlq7lH1up7GP+ISHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310495; c=relaxed/simple;
	bh=T7UZl6Ece7qOgFFy7gpGnG7R1j1U94b4sSnKn8z7krw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRXg/vF0sj8kYPBs9tHkmOZIWvLxT0USpkJJgNRvHq4lsCj0RgYcYhq3Ail02y+3nrYXocjNDU7+1KNFkePK5mdZL1ApvBp/U5fWywttm1qoota7rPKQD561I8JkQQ9msjzCZrltu+JIodPVhTO8Cm+t+vQ753u+9/JMJIZCaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 6184be0b-163b-11f0-963b-005056bdd08f;
	Thu, 10 Apr 2025 21:41:14 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Apr 2025 21:41:14 +0300
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] gpiolib: acpi: Make sure we fill struct
 acpi_gpio_info
Message-ID: <Z_gQyg_JXTBRjisf@surfacebook.localdomain>
References: <20250409132942.2550719-1-andriy.shevchenko@linux.intel.com>
 <20250409132942.2550719-3-andriy.shevchenko@linux.intel.com>
 <98ded07e-33e4-417c-8146-fbf2783a7464@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98ded07e-33e4-417c-8146-fbf2783a7464@ijzerbout.nl>

Wed, Apr 09, 2025 at 08:16:59PM +0200, Kees Bakker kirjoitti:
> Op 09-04-2025 om 15:27 schreef Andy Shevchenko:

...

> Can you check and confirm that at least info.gpioint is filled in (or
> initialized)?

Yes, I can confirm this. And that's how I have tested it, on Intel
Edison/Arduino the first GPIO expander (PCAL9555, serviced by
drivers/gpio/gpio-pca953x.c) is able to deliver an interrupt to the SoC.

Before this series that doesn't show up, now it works as expected.

> The callers of `__acpi_find_gpio` pass in an uninitialized `struct
> acpi_gpio_info`

True.

> and after the call they read `info.gpioint`.

...when GPIO descriptor is valid.

...

Yes, I agree that NULLifying info maybe good to have, but I don't see currently
if we have bugs with it. Can you be more specific in case you have observed
anything wrong?


-- 
With Best Regards,
Andy Shevchenko



