Return-Path: <linux-gpio+bounces-16959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3BCA4C66A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D581898410
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE22215F6B;
	Mon,  3 Mar 2025 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N6yCfVR8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42497215043;
	Mon,  3 Mar 2025 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017999; cv=none; b=STIGNtFCr/yVMmMPgpb9pDkI64Vxxu1SkstaH2/1geeZaH9BYZd+EDvZ9R6mM5G8yldewoy9SD/pHKagTVzbpHpAgeC1bUv5JN350+skCXKXSmzMCgLU4b9BswZUEyCDhXjIpuqixngppQyv3SDlUj1ygJjF3Zm75PSdmG4Pyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017999; c=relaxed/simple;
	bh=0o/eLy1rhcIG2D9DbO5Vv2RfGE5XdW9XH+TnUEAbStY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FUzpDv+jD04v366otnpqquhY0yo6X3/tkBs/EGZzVggEGAq14+ZHWKINlE6NVnPIiAr+cI0qggmktKpBY7NZgmwjNtgHBVBJFE96QiwFfMSshgrOBcLR0PaOTaYMmhuUFCrgx2St406ZDTNvKrXdr20yGx2lMD1Vzuu2JSu9WjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N6yCfVR8; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A55444319;
	Mon,  3 Mar 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741017994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5ZXzMX1/ykUU6pr/kSKc0XUxU+Kw7kuEgt8sySazL0=;
	b=N6yCfVR852JO4sAGmx+EWlLVcGPCi4iQqEr3qvnd6nWeZO1PAaXRIvYad5O0oOwOJZs7vN
	OsczmmoAOyH8/VIjNDHU3Mb/lqqQzzHU3nZAGoUBX8XwRtNyaXfhy9orvJ5BbywOv6IaWv
	H116Fzl2m98+fQuI5aRfAniIbVCSea6sFoZQ6t0h32ipfRh8tuwhckRp48Wu69L1WBLyVI
	47KtN7nyc+9+bvDrfR2EfEiVMS0cjhNqHgW+gelli50yR2qZ/tJ3cMjqeO2Ck8oya5zReM
	cAo6Jx2ozblE91/XmM/71ChfwyJ3YwvxDl5UFgvF8S2w8YTHiwYerPpBWQPy7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Alexander
 Aring <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Linus
 Walleij <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v1 1/2] ieee802154: ca8210: Use proper setter
 and getters for bitwise types
In-Reply-To: <20250303150855.1294188-2-andriy.shevchenko@linux.intel.com>
	(Andy Shevchenko's message of "Mon, 3 Mar 2025 17:07:39 +0200")
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
	<20250303150855.1294188-2-andriy.shevchenko@linux.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 17:06:32 +0100
Message-ID: <87mse285fb.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepiedtleehfeeggeegtddvgffftdeutdetiedvgfelgeegkeefieefgfffieeuheffnecuffhomhgrihhnpegtrghstghouggrrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdifphgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrrghrihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehsthgvfhgrnhesuggrthgvnhhfrhgvihhhrghfvghnrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 03/03/2025 at 17:07:39 +02, Andy Shevchenko <andriy.shevchenko@linux.int=
el.com> wrote:

> Sparse complains that the driver doesn't respect the bitwise types:
>
> drivers/net/ieee802154/ca8210.c:1796:27: warning: incorrect type in assig=
nment (different base types)
> drivers/net/ieee802154/ca8210.c:1796:27:    expected restricted __le16 [a=
ddressable] [assigned] [usertype] pan_id
> drivers/net/ieee802154/ca8210.c:1796:27:    got unsigned short [usertype]
> drivers/net/ieee802154/ca8210.c:1801:25: warning: incorrect type in assig=
nment (different base types)
> drivers/net/ieee802154/ca8210.c:1801:25:    expected restricted __le16 [a=
ddressable] [assigned] [usertype] pan_id
> drivers/net/ieee802154/ca8210.c:1801:25:    got unsigned short [usertype]
> drivers/net/ieee802154/ca8210.c:1928:28: warning: incorrect type in argum=
ent 3 (different base types)
> drivers/net/ieee802154/ca8210.c:1928:28:    expected unsigned short [user=
type] dst_pan_id
> drivers/net/ieee802154/ca8210.c:1928:28:    got restricted __le16 [addres=
sable] [usertype] pan_id
>
> Use proper setter and getters for bitwise types.
>
> Note, in accordance with [1] the protocol is little endian.
>
> Link: https://www.cascoda.com/wp-content/uploads/2018/11/CA-8210_datashee=
t_0418.pdf [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks correct indeed,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

