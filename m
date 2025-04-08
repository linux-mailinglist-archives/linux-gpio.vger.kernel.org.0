Return-Path: <linux-gpio+bounces-18463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E3A7F77F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 204F2179A9A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CF92641CC;
	Tue,  8 Apr 2025 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IcygTj4i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A3263F21;
	Tue,  8 Apr 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100174; cv=none; b=kra0zxnCrOg+AtfZtl5J/wNuHcy4y33NIVmpJ9NjkyvfZbf7KmUJUAiXBPRrfdlK6HEu3Lkwp2eJySpjQJdU5LF6ZKBdcMeUek/4pLqu7Q79skwdxWpKdXxoBYPZR3rqbsZy2M4EHoR3oNhf4Ihbd1d/muea3wUvgztpnVOJtKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100174; c=relaxed/simple;
	bh=FiJ5NF+1WARuSYMtETcpimlKIydq+Nlvvyv4konBGaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnLzjuYVeOTS3IGXE18ZOWT3+xjd28QYtJ09Fhw77QBdY0nS0BeY6NhLaU4QSCf6G60itc45cmwRz12/vUIGc/cHwTxJsRJuiAIA0IMeHLyKE6Rh3vfGWcdv7hbh9XaK61q6NbjgEn9yKg4UaJlgh4ZwbcFtbU/2a5ib/y7/7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IcygTj4i; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9AAC42EF5;
	Tue,  8 Apr 2025 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744100164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bc4rwIDLF1iVOu2eAJ6iVj5b+ZsPv7fwVYGZIcqecA8=;
	b=IcygTj4iqLO/e5Hcdqx2PnwRMhLfXla5rawBBIrb8gMpuRrjIqixAa6XGpxlnWl/8yat/v
	ixBtroYN7vLS6evxjGrD1af5t2soGjwlE+2c2TxHPvYZbuFytJ0BRg6G9DpzPf6kOIklas
	pDEcOzEytjje/xCF/dua5wgcBoIcNIqUzDRai93yN9fDjkqfPlbff5xdSgA8MyC9avsuu+
	zv9OhC8mnkAl3rnZLQ2Kl3ffo1DVrdV74FzUB2uZRD2RCHHy57NM+BHx5d6XO+iJh+F+lB
	2lLBi4VdatUpUYjrJIRE6Y5BgJGmPMthuZZtSaDhuIhcRRqFukEijInQouvGAA==
Date: Tue, 8 Apr 2025 10:16:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Shenghao
 Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 08/12] ASoC: codecs: idt821034: use new GPIO line value
 setter callbacks
Message-ID: <20250408101601.110c407a@bootlin.com>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-8-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
	<20250408-gpiochip-set-rv-sound-v1-8-dd54b6ca1ef9@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifr
 ghisehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehpvghtvghrrdhujhhfrghluhhsihesghhmrghilhdrtghomhdprhgtphhtthhopehouggvrhgptghhihhouhesrhgvrghlthgvkhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Bartosz,

On Tue, 08 Apr 2025 09:38:26 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  sound/soc/codecs/idt821034.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

