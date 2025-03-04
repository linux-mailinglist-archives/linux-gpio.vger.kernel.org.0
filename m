Return-Path: <linux-gpio+bounces-17042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE9A4DFB7
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7AD178F13
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4D9204C3F;
	Tue,  4 Mar 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g2rEfib3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B82046B2;
	Tue,  4 Mar 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096263; cv=none; b=Ebnblk5+vCUMPCk63m5fzLJsvp2IoAAPPgvxyb8JCl7G1UWC+9MX3Vl3QszJqDAPKgfLQ+dxhAz1IRzpVOhBC3of3swUh7CMCb4RtnzZvwxoMbqYhMdQaXaGYwxJvStHr01/ajPwMnhCol4lCdu2GC/qJZD8U7D4TrNVvwLZxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096263; c=relaxed/simple;
	bh=PiPkPIDmgiV8cZug0sW6B7OJi/s66w6EJzYFFKfyUQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ssdOmNzp1iAfEa2T/AESLFZP64NDOK8dFkBPapW/Ss+vFhNwAU0gMeqkQZQ6M6XYQXxoPqOJkX6izVqo5j5UTB3YXQpGYnPuXiHgwl/2TcgWTdnNpV9Cj/aeJpZFEkF05IBKpoHATDaTcwJz43/wEKvO5O/tkyehmCKGF3Yol/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g2rEfib3; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DA1843D79;
	Tue,  4 Mar 2025 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741096259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PiPkPIDmgiV8cZug0sW6B7OJi/s66w6EJzYFFKfyUQc=;
	b=g2rEfib3hxTcwW2VhiJSiBNs3Iktec0IokowYxkZP9+jVP9JgSSPpj6Fx6t/bc3WnzWNyd
	lquRO7WENZ/7zgWoie93TQSpNKL3VckXJrK4FFVKpJ8MyHb1JGgtN25l49q92Ix+Repijp
	iIJmrDr6sKUBYN/SzTPFm81R4R1rq0RpUS2YsomEPTOI00P3+YkXz7dk60Xn5mXEW8EbNc
	L2+mJVJPmTBYhzFSq0aN+kXl+YBqqzONgYgVnOSGN+EsIoPLzADWM1WqvIyLefuMpnDSQP
	fMwOJHgrB6QRf2BDQVNvnHSPt5DTlVzCeljLo0GGjCJ+bZZMQZ630eUTijMF2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,  linux-wpan@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bartosz Golaszewski <brgl@bgdev.pl>,  Alexander Aring
 <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: [PATCH net-next v3 3/3] ieee802154: ca8210: Switch to using
 gpiod API
In-Reply-To: <20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>
	(Andy Shevchenko's message of "Tue, 4 Mar 2025 13:22:34 +0200")
References: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
	<20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 14:50:57 +0100
Message-ID: <87ikoo29by.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqfihprghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhit
 ggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthh
X-GND-Sasl: miquel.raynal@bootlin.com

On 04/03/2025 at 13:22:34 +02, Andy Shevchenko <andriy.shevchenko@linux.int=
el.com> wrote:

> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().
>
> With this, invert the logic of the reset pin which is active low
> and add a quirk for the legacy and incorrect device tree descriptions.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

