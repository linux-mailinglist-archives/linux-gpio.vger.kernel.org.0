Return-Path: <linux-gpio+bounces-13906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 356029F2DB5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00BEB1881555
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 10:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BAF202C2B;
	Mon, 16 Dec 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="piviGXt1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93B202C26;
	Mon, 16 Dec 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343365; cv=none; b=ZWVoHNasvU8DfqyL8WZMt4Ku39csRElL3RL2BPmxjYijGz0ChTsieqbG6jHYtTCH9hOwMVhSzH3rB9NJn0TydS3emig+GuGKYzKBZODy3itw5P9zLr4eMj+wo+kWtpzebpB2Bop4ki6n3kJnzvR6JHaXJ/q+cRdH4vrU+6VL2DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343365; c=relaxed/simple;
	bh=3Bn0XDCgvjUAcs0JJMNweqfavk9Ae8nzA9aqUXkAjNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFRJ7mkvhC7G6D5mX+00gdXqFTaSLB/TkWBr5jkwreXbptoxqjtFuDhcXTvUCVbJjlS+Hxwi5iNB3rp8IuTaCL+V+uQEZwVNgaK4SRnCQoK9vVTHocuWW6FtaStaBNI1AKm9dQa1E3JPThydCZTvmeG+R9zJzlesxvTITHRF2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=piviGXt1; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2503E000F;
	Mon, 16 Dec 2024 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734343355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6bMkpsWG2STvsBYlJ3JnC7cvQAT4JZnLBQxIJKnkPHc=;
	b=piviGXt1wejSD3QKlfGdE7ChKJIB9GG2IT2kTYeBtRKmOcwwdwCvZiP62RMjQnGwDZUTtV
	Eh3QvwPmIAuR7X/kqpJ5KaY4siWERuhlcyIMcOxoatWbggw3NzJszvOcFcmI+RNRSSktKx
	pgxfwjvwc7IxjBnEYY8j39D4kGAw8gA4EX6O8eptY0d413/35X0wJNzow5iE/IMwFit3lU
	0R5I9YjmpQuNDdd2eRQGohfjB6RXP7EtjzqXT26cMvP51wLainFz28v2faVgn6+x4DuaHF
	4IXzc8HaXBPTzIKa/GXr59XjV1tDpFS/zSwjJr2mFAS4ifjmwUUOZzLh+e7UPg==
Message-ID: <19311182-b5d5-44e9-96f5-ee21f2178668@bootlin.com>
Date: Mon, 16 Dec 2024 11:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gpiolib: add gpiochip_add_pinlist_range() function
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
 <CAMRc=MfUDGaW1cBrsLzAZ6GORFFv5fAjEKXu7esO44v4XckheQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMRc=MfUDGaW1cBrsLzAZ6GORFFv5fAjEKXu7esO44v4XckheQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 12/16/24 10:17, Bartosz Golaszewski wrote:
> On Wed, Dec 11, 2024 at 5:27 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Add gpiochip_add_pinlist_range() function to add a range for GPIO <-> pin
>> mapping, using a list of non consecutive pins.
>> Previously, it was only possible to add range of consecutive pins using
>> gpiochip_add_pin_range().
>>
>> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
>> list of pins (which can be non consecutive). gpiochip_add_pinlist_range()
>> is identical to gpiochip_add_pin_range(), except it set 'pins' member
>> instead of 'pin_base' member.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
> 
> I don't have anything against this change so in any case:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> But may I suggest the name to be changed to
> gpiochip_add_pin_range_sparse() for a better indication of its
> purpose?

Hi Bartosz,

Yes for sure, I will change the name for the v2.

Regards,

Thomas


