Return-Path: <linux-gpio+bounces-24117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B44B1F60E
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 21:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5728B1799F2
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 19:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7024B279DA0;
	Sat,  9 Aug 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RcoN990w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jAiQOAmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D382236E5;
	Sat,  9 Aug 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754768726; cv=none; b=hFw7qdZjKEL0j5sRSX7bUZp+4iGKg1AUW6UvWWxMPQjm4PFY8Jlp9gjWRje68aasyQYnELlGSh7q5h/yoVdKQiQm6w6zRaJXW/294zYW2BvAtQwiqm6r1HXfv8MJdrDCuv6cd5cAyXJqOmkVQhAq1wDi5tOnobw8IlJVtGSHXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754768726; c=relaxed/simple;
	bh=0Pi8gqKn5uLblv1LOtv/ySLVYSXSmZaFBoX3kFZNzsE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Wr4OJ0LQPkgCtPkMDPfEBojC5dmpiHMamwOu5njN+NrO9YlqMnGT9/WUcPch1XdJP3fc/KuoGs+m0KOaeCNl9QV52RIyn+3FpAKAGend17xs0ehlsXgAlVwIl0OrqtuHyi4UMC73kDb3d3cx8SjMAqa2bsqxVmhA+rNCOhwM0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RcoN990w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jAiQOAmN; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B9F61400085;
	Sat,  9 Aug 2025 15:45:22 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 09 Aug 2025 15:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754768722;
	 x=1754855122; bh=xpFQtBM9BDyQogemW90Hly2XFx2AJszWu0cAmbodO6g=; b=
	RcoN990wicCgluRfYNAZETIZCGrgi9gKVu/8Lk70Q8JkIYIYHQ1ksKxSnt8SXgzh
	DwC/8jDkEq7IU84cOoH2e3gOzdyACEp+usybGBka1z8bNQ5KSootvpx09eHRwYS1
	dlM1MPIoaZhyb2diao+18LgzmAvOegdd2E8F6e7vph3pufIFIwCstghf1XeMEqqp
	tXJKJUdD/Jn5xgK3I/ac+68ioEuXXaFNH1x29t6Z3KgyQxjKCN9Nbn4qFpYIKjGi
	GZo5XsC7q1DzHtzVL5rX779U8qoTfzjiwk6ACBidL8Mq8aZg+wJrYqpH4Xl2+MTP
	XF1qST4UOAqD2CP4C4u4gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754768722; x=
	1754855122; bh=xpFQtBM9BDyQogemW90Hly2XFx2AJszWu0cAmbodO6g=; b=j
	AiQOAmNsuVywpJKAplwz/7NrpriJrtUzSzU9oQRVc/REsWuils9MSexf5g0Mgkbs
	J/V85S34gDdLOMDKhQ2XEjv6EKSB0BfMDi/K71Ee0LVJ0B1kMeFMXiuhHT1iseIY
	GngK+6WDAU+lfVm14zZd/cPGIFB4tc8mhH0JqDNQUJVKdk/NzitRpboX1vZK+Nqr
	ROV+UNfJBra4uqzAyqK/649tN/+y8TGAufWBogpl3GJo6O07V6TIEyrASyoB4X4R
	JbNu95zRk2ceyqrJs6tb3XmMMrsvytX1Ueu3v3enGyp43fA3Z5mMlOYosIcCioli
	aDA6R2zKFn0endArSHpAg==
X-ME-Sender: <xms:UKWXaE9mSjrxiASFXi__vKGs8R3i9JUwmzfKpSnS029MulKG71qvfA>
    <xme:UKWXaMulYsQt2Byw2JHrl1eJRfKRlP5LqU7k5FAyf9xNV0YfAMf8ovF6OcNgHbUxf
    lkXi7-Imh_CSsiZZhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepughmihhtrh
    ihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopegushgrnhhkohhu
    shhkihesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgv
    vgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslh
    hinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkohes
    lhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvg
    hnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:UKWXaEMDu5ZkDAowu8cl0LLJc-ZmNiIr89XGjTrCN7KCnlYKFGmXag>
    <xmx:UKWXaAe18ZjmLCKaNBeW_cQSwWb_OV_qGDWbNXO8e1nnxKeNTyG3_A>
    <xmx:UKWXaDn1HJ7DouedjmU3l-oP-LfMF2w1scxQ1usrJvRbpXbgxHEjnQ>
    <xmx:UKWXaKxe6HDDgJunmWzTY6R7uoCG2889UKPcP7Y_d-48Azepw6GYrg>
    <xmx:UqWXaMFdDk6lzsOQaTmmDm6Rfh9L7AzeD-GmVIu0L0zs7EzkZ4oLtI5D>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD856700065; Sat,  9 Aug 2025 15:45:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T6ddc270fb212d79d
Date: Sat, 09 Aug 2025 21:44:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Lee Jones" <lee@kernel.org>, "Dzmitry Sankouski" <dsankouski@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux <linux@treblig.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Guenter Roeck" <linux@roeck-us.net>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Message-Id: <3190334c-538d-4e2d-80a4-6e24b255e844@app.fastmail.com>
In-Reply-To: <aJccS7fdcx0INYTA@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-6-arnd@kernel.org>
 <aJccS7fdcx0INYTA@smile.fi.intel.com>
Subject: Re: [PATCH 05/21] x86/platform: select legacy gpiolib interfaces where used
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Aug 9, 2025, at 12:00, Andy Shevchenko wrote:
> On Fri, Aug 08, 2025 at 05:17:49PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> A few old machines have not been converted away from the old-style
>> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
>> symbol so the code still works where it is needed but can be left
>> out otherwise.
>
>> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
>> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
>> @@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
>>  	depends on I2C && SPI && SERIAL_DEV_BUS
>>  	depends on GPIOLIB && PMIC_OPREGION
>>  	depends on ACPI && EFI && PCI
>> +	select GPIOLIB_LEGACY
>>  	select NEW_LEDS
>>  	select LEDS_CLASS
>>  	select POWER_SUPPLY
>
> Hmm... This is a surprising change. But I leave it to Hans.

I think the only function that still needs it is
x86_android_tablet_probe() doing

static struct gpio_keys_button *buttons;

                for (i = 0; i < dev_info->gpio_button_count; i++) {
                        ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
                                                           dev_info->gpio_button[i].pin,
                                                           dev_info->gpio_button[i].button.desc,
                                                           false, GPIOD_IN, &gpiod);

                        buttons[i] = dev_info->gpio_button[i].button;
                        buttons[i].gpio = desc_to_gpio(gpiod);
                        /* Release GPIO descriptor so that gpio-keys can request it */
                        devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
                }

So the driver itself uses gpio descriptors, but it passes
some of them into another driver by number. There is probably
an easy workaround that I did not see.

      Arnd

