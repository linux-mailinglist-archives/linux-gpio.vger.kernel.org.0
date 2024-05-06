Return-Path: <linux-gpio+bounces-6166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B638BD582
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 21:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBBC282466
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B20115AD9B;
	Mon,  6 May 2024 19:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SYLA9OZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33E5FDA5
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024297; cv=none; b=rkOSMD5yLR8T06n0Y82Q3TIWVWHcLMzjW2+QbZsFbHpTQrjQEO7SgI7ST5YQvBHWwifFyX3tqwiVvdzIK32KTulxIAHFwz6mMPqTRiytBBAQY34ZMhTzU9U/49yd5ekhmpNJRt9A9WEcjkSLRNFa3WJ5nLKWTJG4CzXIUekpeg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024297; c=relaxed/simple;
	bh=vUavT4o501zk8ssY/thL9GHiZs8bj2Rn7eBDjxgU55M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWmCSJTFfZtF83tJniPkhwMLt72zO2Jayb9t2S7uCRr2g8X0lLSRrCUBNAgf10+sf4WAUt+4S7EC6krpbu4daPQ3Igc4b3QJkMU+xCbu6bi+1gZuG0by+xeZqqd2h5BhUf191txye1Ky7gTktUHYPnJcxCWGzqegVRH4QUvijtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SYLA9OZK; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <628abfa4-7e7a-4be1-ab4c-f01b7a90e4af@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715024293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EitrPKgOgNSA4s7vKg5u/VXB+zVHCVjfbxVpdIai8XY=;
	b=SYLA9OZKxnyK6WLDXQ4SRKnG8RXEN50I5KEiK9PmyE4kjWsJQEKXtzNYqK+1f6nj5ticCY
	AlOXowlOYX29b8viadhHJkBLGSGsPLGksxEwjhVdNQ9FCdusGsxmv2wVcJjEyH8XsJVZ24
	/5RQY948Y7L8p6A9TvL14nrgOnCiKHc=
Date: Mon, 6 May 2024 15:38:09 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] pinctrl: zynqmp: Support muxing individual pins
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <20240503162217.1999467-3-sean.anderson@linux.dev>
 <ZjkuzKEt2aiHIwg_@surfacebook.localdomain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ZjkuzKEt2aiHIwg_@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/6/24 15:26, Andy Shevchenko wrote:
> Fri, May 03, 2024 at 12:22:17PM -0400, Sean Anderson kirjoitti:
>> While muxing groups of pins at once can be convenient for large
>> interfaces, it can also be rigid. This is because the group is set to
>> all pins which support a particular function, even though not all pins
>> may be used. For example, the sdhci0 function may be used with a 8-bit
>> eMMC, 4-bit SD card, or even a 1-bit SD card. In these cases, the extra
>> pins may be repurposed for other uses, but this is not currently
>> allowed.
>> 
>> Add a new group for each pin which can be muxed. These groups are part
>> of each function the pin can be muxed to. We treat group selectors
>> beyond the number of groups as "pin" groups. To set this up, we
>> initialize groups before functions, and then create a bitmap of used
>> pins for each function. These used pins are appended to the function's
>> list of groups.
> 
> ...
> 
>> +			for (pin = 0; pin < groups[resp[i]].npins; pin++)
>> +				set_bit(groups[resp[i]].pins[pin], used_pins);
> 
> Why atomic bit operation?

The name was easier to remember. I can make it non-atomic.

> ...
> 
>> +	fgroups = devm_kcalloc(dev, func->ngroups + npins, sizeof(*fgroups),
> 
> size_add() from overflow.h.

OK

>> +			       GFP_KERNEL);
>> +	if (!fgroups)
>> +		return -ENOMEM;
> 
> ...
> 
>> +	for (i = 0; i < func->ngroups; i++) {
>> +		fgroups[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
>> +					    func->name, i);
>> +		if (!fgroups[i])
>> +			return -ENOMEM;
>> +	}
> 
> Hmm... Can this benefit from devm_kasprintf_strarray()?
> 

I don't think so, since the prefix is different for each group.

Thanks for the suggestions.

--Sean

