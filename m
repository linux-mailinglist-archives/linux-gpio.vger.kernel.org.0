Return-Path: <linux-gpio+bounces-26184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE232B583F3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 19:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BC717A19A2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 17:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44974274FE8;
	Mon, 15 Sep 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJSf30fI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9D101F2;
	Mon, 15 Sep 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958561; cv=none; b=jKkQW0ys3K0YKmF7j0feOUenk8qNlEKWeu2WhK1+Oaaug2DVB7h6okwlb+zMeaKI9z/rK213bhY/P4cM7pjkgC1s5lqJ6uLZBGBO883FXn6wN1gGN5Au6eDsq8/TzcDkgc5F9aHhaoOd2CpyNEgyRBew//l9yfyIjMlABRlv3Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958561; c=relaxed/simple;
	bh=oqOMkDLjrDehn7S/LFap64KzjTGq4HPu0TK1qIK27T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cU69NdlMwE1QRRqLQu4HvwleYeAjv3TLPsOqkcxJDPZn+Yrrc7+G86PRUt7o0tD6uinBADG9qUZw/XRLTtFP8CdK3/pa3B1LYHg2ReKH8eupiGfzsBJaTMn0W3MfoAukCABGm45Vo5w8JRQorNm6tNOdrftppkPp0LYUZzkIcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJSf30fI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E23EC4CEF1;
	Mon, 15 Sep 2025 17:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958559;
	bh=oqOMkDLjrDehn7S/LFap64KzjTGq4HPu0TK1qIK27T0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gJSf30fIVQ5uENV2J7AWHrMcZSXJ/asmHxhqPi7jeCK5keTs14GXGBCja+nIx/p1R
	 M7cULPglnFeaI8rMKcZzYpxIFtjw/2w9xG7q2XsOZ/C/uAiItwup/itWAkIu0GmwWl
	 s9009sYHQXMcu8qRqnVqmmuAh1guQDTdvIliXJzimGYObOtIjRHix/lplHZQSYUmCA
	 Alg5XOfF423Wj36CCpEE9HQBCVeRjn/gFXBnf9G+nnWOYJ6/T65p8CKWMZyNtRMp7F
	 OBn1yVKtjmKEgc73OUdnHRfYy+nvqhRpHSGMowu07Gwibcq8nbgSXL6OP6VYajVg8U
	 mVULXJ3u8MvOg==
Message-ID: <f6c18910-d870-4fa7-8035-abc8700aef2b@kernel.org>
Date: Mon, 15 Sep 2025 19:49:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: Extend software-node support to support
 secondary software-nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 stable@vger.kernel.org
References: <20250913184309.81881-1-hansg@kernel.org>
 <kpoek6bs3rea4fl6b4h55grmsykw2zw2j6kohu3aijlabjngyc@7fbnoon3ilhw>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <kpoek6bs3rea4fl6b4h55grmsykw2zw2j6kohu3aijlabjngyc@7fbnoon3ilhw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Sep-25 3:21 AM, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Sat, Sep 13, 2025 at 08:43:09PM +0200, Hans de Goede wrote:
>> When a software-node gets added to a device which already has another
>> fwnode as primary node it will become the secondary fwnode for that
>> device.
>>
>> Currently if a software-node with GPIO properties ends up as the secondary
>> fwnode then gpiod_find_by_fwnode() will fail to find the GPIOs.
>>
>> Add a check to gpiod_find_by_fwnode() to try a software-node lookup on
>> the secondary fwnode if the GPIO was not found in the primary fwnode.
> 
> Thanks for catching this. I think it would be better if we added
> handling of the secondary node to gpiod_find_and_request(). This way the
> fallback will work for all kind of combinations, even if secondary node
> happens to be an OF or ACPI one.

IOW something like this:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b619fea498c8..1a3b5ca00554 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4630,6 +4630,13 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_find_by_fwnode(fwnode, consumer, con_id, idx,
 					    &flags, &lookupflags);
+
+		if (gpiod_not_found(desc) && fwnode) {
+			dev_dbg(consumer, "trying secondary fwnode for GPIO lookup\n");
+			desc = gpiod_find_by_fwnode(fwnode->secondary, consumer,
+						    con_id, idx, &flags, &lookupflags);
+		}
+
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*
 			 * Either we are not using DT or ACPI, or their lookup

That should work too, but if there is an OF or ACPI node it should always
be the primary one. So my original patch id fine as is.

Either way works for me. If you prefer the above approach instead of my
original patch let me know and I'll give it a test-run and then post a v2.

Regards,

Hans



