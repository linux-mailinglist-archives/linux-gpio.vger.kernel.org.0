Return-Path: <linux-gpio+bounces-21955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E5AE2B63
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 21:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40E70189710A
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 19:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1329426A0F3;
	Sat, 21 Jun 2025 19:13:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADAA217704
	for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2025 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533235; cv=none; b=aOB9JaSvo7UPkmdxq3jD8ACb3/OazyMwAhKbr4RkCwGGl9FGNF4BKY4KH8W6jmsZKm7DcepRZ5Vj7iHDiCc81Fz6s0wxJiA589xAM/yiKXt9yTiTVOv6Xwoh12wHu0mJV+8MKwPPfVpguA2q9qp/ID4mdDIsy++sxkyT++xivXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533235; c=relaxed/simple;
	bh=3DgPE0stiAgy6zwxgjL4iwaZWfm9/g/fP6vmY1+Sulc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3icJP6G5SzcvYBqMcCeoxgxq/fiqQ40XWJQfLVo1hQxXHOoCPLRyK76xHuqoXTQC/DZinE0VFr5HyNixKjknXcTtxdG91x1Eu9W9mD8b7Wn6pf21vtZNizqEo5/oeOKm2pecQrCIR3qdupPCMzhaXTIz7PTmNBYAvfQL0EhbSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id b409b2db-4ed3-11f0-9764-005056bdd08f;
	Sat, 21 Jun 2025 22:12:41 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 22:12:41 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 2/2] gpio: make gpiod_is_equal() arguments stricter
Message-ID: <aFcEKWZvRKQRA6dl@surfacebook.localdomain>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
 <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>

Fri, Jun 20, 2025 at 02:58:02PM +0200, Bartosz Golaszewski kirjoitti:
> 
> It makes no sense for a GPIO descriptor comparator to return true when
> the arguments passed to it are NULL or IS_ERR(). Let's validate both and
> return false unless both are valid GPIO descriptors.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



