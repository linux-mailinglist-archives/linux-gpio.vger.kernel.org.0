Return-Path: <linux-gpio+bounces-16997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE49A4D60E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 450E87A8FBB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583511FBC89;
	Tue,  4 Mar 2025 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ilwOii9P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090E1F7580;
	Tue,  4 Mar 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076316; cv=none; b=eSqYHnHo8q8UFUpCD3LJxT/ZrzLvisg8c/7R+nTfz/txH4ggofvMhdVVY/fKlwrGy/UOUpMdRF5E1NQZpQ7gK8/Ok6nUhYyQD1Kwk4T2cqK1seJ7Vv/aS9KT82hDW2DbmTXbaNH/8mhh+iC4FqALyL1tphjwgfilBKA4pyDH6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076316; c=relaxed/simple;
	bh=OaCRmJhFgO/LZPmszp6nmDERYO8VveDcodtp3VEn/ZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n96tW/neCtb6GnLxyTUzE9Xydf6SMCOuHQfj4m8fpQflgL7AoxvfJrjGEd6RKyOVcz7pCJwO8jJpDu2sdP8rY46KresANk/9sdgMDHVsWf+wJ9AQ8Ec4qOV+Qfdb/aPeM9j3pBZu4lrEQEnbCj8TUEs/k6raxuISNUov1ZVIxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ilwOii9P; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD4E4452B;
	Tue,  4 Mar 2025 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741076311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OaCRmJhFgO/LZPmszp6nmDERYO8VveDcodtp3VEn/ZI=;
	b=ilwOii9PkFC7lLiA/XgSYO1/79NeVchvKKF8WHeaAFic3fcge7g8EayPpwy6BDHurnqv+F
	QYq457IzJxIQGd2+ABLvWTtzrBagyhw3gEJ8QnLMFrgkntssgFQAi/IjJ0anBrB/IjeKRh
	ZV440yxVbEUMYKD0ZyCy1fSd+brqEbdJzrwfPmNIMqwuf/dKrIRj8l8Ciy+CWffxgoq0mF
	8SF2jlNKkzozs6hJE2WJL4xGsZXQRxqdsA5ozF8SVf2gJ3WjUTynXEuPYQzp8dihXKbIdX
	bovxGVkDCSxiv2cr7eNHWqbKW74BkrnhO1mdshfoYHqqZnYVUlwA5eQbx83K8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Alexander
 Aring <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Linus
 Walleij <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v2 2/3] ieee802154: ca8210: Get platform data
 via dev_get_platdata()
In-Reply-To: <20250303164928.1466246-3-andriy.shevchenko@linux.intel.com>
	(Andy Shevchenko's message of "Mon, 3 Mar 2025 18:49:09 +0200")
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
	<20250303164928.1466246-3-andriy.shevchenko@linux.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 09:18:29 +0100
Message-ID: <87mse15huy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdduhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfihprghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepl
 hhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdgrrhhinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhtvghfrghnsegurghtvghnfhhrvghihhgrfhgvnhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghh
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/03/2025 at 18:49:09 +02, Andy Shevchenko <andriy.shevchenko@linux.int=
el.com> wrote:

> Access to platform data via dev_get_platdata() getter to make code cleane=
r.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

