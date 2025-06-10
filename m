Return-Path: <linux-gpio+bounces-21213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881CAD3769
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00F807A70D0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B49B2BCF61;
	Tue, 10 Jun 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZPYUevZW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED829ACEE;
	Tue, 10 Jun 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559722; cv=none; b=erVDXSBzfggOQzOUsVF2MA1M23u0lBidrXkXK9rVohP8LiZoD0Z2DmixmOaXLlydXCFehECn8sYF0PSbVUTG31a/WCFCYJRiuYm+eRqnXn8GJL9z6fyAA16l8UXWqwf+hWr3kd7wBtMZAxdLYoWWbZgZ/GlVZwOmjoNOb5N6CZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559722; c=relaxed/simple;
	bh=vAk9eOkdNiTKGzMcVqu8m02OEyc0CxqIjkuGX2ovFC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYNGwd77A1L1+b0Lw/HhEvJ3iQHWVuUDYxQNotd0E73DAgc3jZJCNvlktNQx8U5Vyv6mjtcl0tsTkIqrXFLso4tR/L+hC22Jk8m/xCcADIo7KOVdMMBSEh+FUOUalXN0j5P237RzcfZZN5F6E0X1lAP6k0Qt0J3jX+J6xDUPYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZPYUevZW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46336433B5;
	Tue, 10 Jun 2025 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749559712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBCPaYYOAsemees+fXLQJeUCZUeoXEQHz+o6sV7r0i4=;
	b=ZPYUevZW5dCe0AjfwTQjF1wC4oMlC7cDUWHLJ+ufL+iJ9yhcl+qnoQd2mPMEwPXUqcXfne
	vBqMJhafRVP+CB2ByC9Y54iLTfrsWTg0qc6lAJiX8pY9iBW+VsoZF7a0r8LGylnwGaRewz
	a9WMZ/2Ea1RlNoSmJ5JnujU7yzv3YAoRQbRQg12zE8Mlob3Wr3SjtJ9ZIwy4UHhAPbRYQf
	9lb2AbIUez2QBRV6k7W4I+aEUta5fUjq8R5NGTxlBUpnCikl25OFodwo2iPsNtOAqwz99i
	4kmqMVAOEUb4QFBlSC2sCqM/FGVlo7SAWiiS4SV9V+4yMjCNR6jJv7F5+zIPIg==
Message-ID: <ddbaa399-6bad-4c97-8456-b597442e5be6@bootlin.com>
Date: Tue, 10 Jun 2025 14:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
 <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduheduvdfgvdeftefggfelueevjefgjedtheekteehveehveegudejgfdvtdetnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurggnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnu
 higrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

On 6/10/25 14:42, Linus Walleij wrote:
> On Mon, Jun 9, 2025 at 11:51 AM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> 
>> This is the seventh version of this series. Only few changes, the series has
>> been rebased on v6.16-rc1, the pinctrl patches were dropped as they were
>> already merged and a fix was added in upboard_pinctrl_dbg_show() to handle
>> the case upboard_pinctrl_pin_get_mode() returns an error.
>>
>> Best Regards,
>>
>> Thomas
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Looks good to me, some testbot was complaining about something
> but certainly we can merge the majority?

The export.h header file is missing in gpio-aggregator.
I can send a new version today. Or I can send a fix later.
What do you prefer ?

Regards,

Thomas


