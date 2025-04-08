Return-Path: <linux-gpio+bounces-18464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D0A7F7AE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE033B3008
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9A62641D4;
	Tue,  8 Apr 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nmp43COv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C723E22B;
	Tue,  8 Apr 2025 08:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100296; cv=none; b=Dn+OPi6jhwJyj+ZB6ykxI1IceLD2AWh9nHH+Y+Bsr1xAX/lG2xFrJXoNgfJAFGVjxxnTU/Q0I6MMDKtFmhfx6UAXdOf2Kvj3wFUv9N2nvjlHcS9H23qiDTOeDyXPk3N+77NShKUwYCeczBKPH/vTM2MyHLf8/qmWdegrUwjXBaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100296; c=relaxed/simple;
	bh=K8CFKQsHCYYtwQpKFu2fKlIzmF4HLTi3cnRKYpuiUCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXXgss0biqjD9U57nZLv7WjC00bYVz66Didsep1K6DWbcT7iz39OJ1OPysbBXW+gdMaWONtM4J4g9EC/DdhxViLYRoJFY8ZSMCAGbgNK/ogT8Y3zOasI0EEQoCR//HNroYmZU8gfymt1e0a1VdAqX5oCGjwxuEW7MsvowE0Zzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Nmp43COv; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39F51432F5;
	Tue,  8 Apr 2025 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744100285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CEpYMcjoxDgnZuN/RAxnjWni1gl5dc3YcgOiqQXSrHQ=;
	b=Nmp43COvGdE9oaClEw+sKxUT1Bc59JW4kmkLILdydyGpTqmzaHtDUkLK+7FxOP0gR6kXDl
	J99N7lTmsVhRpejHETNNLbpX5E++UZR3JA8PopebzkjFbrpuWboF5B/3lxsCQ5BTJZjRyt
	GhPSu1oLxD0nCZB+IJPKmcx2paRvq2QV0ovvjyqKqXqBn1JhEr95NFzMWm8Ne4T3F78txN
	4pV6agxjRRTTrgFupS4T6sZ4QGi5NYkBn39J6BsovwVuUklft97Az9J8f4R4FEWLF3QkQO
	/DuhxaltiKtWarmjWO5EZ3ujxezdnTWpcdr7GOOWqE+UHJwkIDwwSJqAlC0v+A==
Date: Tue, 8 Apr 2025 10:18:03 +0200
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
Subject: Re: [PATCH 09/12] ASoC: codecs: peb2466: use new GPIO line value
 setter callbacks
Message-ID: <20250408101803.365fe902@bootlin.com>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-9-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
	<20250408-gpiochip-set-rv-sound-v1-9-dd54b6ca1ef9@linaro.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifr
 ghisehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehpvghtvghrrdhujhhfrghluhhsihesghhmrghilhdrtghomhdprhgtphhtthhopehouggvrhgptghhihhouhesrhgvrghlthgvkhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

On Tue, 08 Apr 2025 09:38:27 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  sound/soc/codecs/peb2466.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

