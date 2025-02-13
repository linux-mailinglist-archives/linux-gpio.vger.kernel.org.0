Return-Path: <linux-gpio+bounces-15958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6EA34ECF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69A7F7A14D3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF52D24BBF5;
	Thu, 13 Feb 2025 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKHlzUZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A720764A;
	Thu, 13 Feb 2025 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476588; cv=none; b=VxA3MDd46a0ExStUh3X0NL0UEzWbZJbCJEo6M/xGZtY6UA4En+qTNKZBGv/yw6dAXLGwUm0/VENJxItO6Jky8E9bMbBh67dIWejHQKMF9Ridyi7cC/37wvVZxqwOalnFGscnOWrwCA43rQv9KJJI8IUbNT1CeTYuK16vkUanfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476588; c=relaxed/simple;
	bh=gCDADqQWjq1tNbhyIVjnHO18Ouy+/I4UEioZNq9HWds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryXO8Iy4OlpEvvXXQTw3sAugPgjSUHkitwPOnCVv7Ks0+MZuFaANcd8ttlO41Yf+iteYQ6tQ1xS5uOda3YU5LHLRUvvJT/gAEmRVCu5dKHt1id8i98FcPOSrPRJzpfX2znZTg9jcxarce0KYTA3WySx8olABlJlV8auQhnzw66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKHlzUZI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476586; x=1771012586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gCDADqQWjq1tNbhyIVjnHO18Ouy+/I4UEioZNq9HWds=;
  b=AKHlzUZIYdEhOtKVly8oGUSL4a9/d/4KC9YP0IJf+ENvSyjmMKXq92LZ
   KJv/5so64wTq+B/oi/3COF99iQ5h95lUKDecFHQTAjfxRN7mn6rShQpgI
   QdEjjmSWnNlDKPLcD2bpCQbszxC4xpVe1WToy8Kg2Nbu+BMjg4Q+pGnRp
   7WrHK3MyclLXxoiuYhW9QscUuvoZYI4m4LZDhlTQD03ih3fJHs7I5DbvX
   qoKdArUk42g1+PWTQdaYDcuaaOUbGXoqSdxW21r1zZwua6IBXGzOr+4KV
   by/7zS1m58zSsBQd9Jq91xUAwriOucC8tEfQecKrawi33K966bXPgOtwV
   w==;
X-CSE-ConnectionGUID: SrDbJGz4T6mJp3c4CYXG4Q==
X-CSE-MsgGUID: 3B7r02DGR9+oajg/4KYMbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40466021"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40466021"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:25 -0800
X-CSE-ConnectionGUID: jg2X7t55RnqL/4CrxLcFTg==
X-CSE-MsgGUID: qFx77ugdSs+oELbf7xYWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113745541"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 11:56:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E34271FD; Thu, 13 Feb 2025 21:56:21 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Date: Thu, 13 Feb 2025 21:48:45 +0200
Message-ID: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears that regmap GPIO doesn't take into account 'ngpios' property
and requires hard coded values or duplication of the parsing the same
outside of GPIO library. This miniseries addresses that.

For the record, I have checked all bgpio_init() users and haven't seen
the suspicious code that this series might break, e.g., an equivalent of
something like this:

static int foo_probe(struct device *dev)
{
	struct gpio_chip *gc = devm_kzalloc(...);
	struct fwnode_handle *fwnode = ...; // NOT dev_fwnode(dev)!

	...
	gc->parent = dev;
	gc->fwnode = fwnode;

	ret = bgpio_init(gc, dev, ...);
	...
}

Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Andy Shevchenko (5):
  gpiolib: Extract gpiochip_choose_fwnode() for wider use
  gpiolib: Use fwnode instead of device in gpiochip_get_ngpios()
  gpio: regmap: Group optional assignments together for better
    understanding
  gpio: regmap: Move optional assignments down in the code
  gpio: regmap: Allow ngpio to be read from the property

 drivers/gpio/gpio-regmap.c  | 41 +++++++++++++++++++++----------------
 drivers/gpio/gpiolib.c      | 27 ++++++++++++++++--------
 include/linux/gpio/regmap.h |  4 ++--
 3 files changed, 43 insertions(+), 29 deletions(-)

-- 
2.45.1.3035.g276e886db78b


