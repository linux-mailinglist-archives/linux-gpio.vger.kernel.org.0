Return-Path: <linux-gpio+bounces-6167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154D8BD584
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 21:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 923CF1C21849
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824DA15AD9D;
	Mon,  6 May 2024 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mq0xAbuQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087381207
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024396; cv=none; b=B5Po4YBhELcSC1flqMy7WQRXujhWnLm8pI6OJgjHyxQYJLSGK3ZVhskNJuTAXbZSryG/Un+7xtV7eLwggApxf5ZPCfkT5lL2lvIb0adL3dGIofskqyFU4PIVxtbKSzlF9O47RKftpNBU6MjCv3u325y4MFHOXjJDYC3I5cNbPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024396; c=relaxed/simple;
	bh=kSbC0P1iih9AHBDll0/qcniTyFWdHujHDEZeNGz4bcU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=naH7OvMLgCsiJjVVFCIdkBqEFj80mtCOqdtoAmG+O3fDEZM108HjtKMbyV3+Abqvtbvvd84uaw//839yW5u3cTsrg8eJ/yWR6EQDH+J/2KCNFmDvrEucstmse4GAowhXu28+4GNZWz5q0wyCTNstAj4jrNhRZns4qD+uBchoH/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mq0xAbuQ; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4c6e3e74-cb0e-4f9e-81a5-751731130722@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715024392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3/ApWtpZdFKL65BEqeavRpFjRU1ETt/whrh56InYF4=;
	b=mq0xAbuQFZiNjxVWdwOuDhQyfJSF2ruAzqMGvg4b7GE7mUSjNn7WTq6u5xiRX/f69KeIuG
	hk6/ERsagPQ4wqy7s7W85YqCh8ZCMCzJj1hGMThUZX6gMFRKOO2BgYXL39CxqC8jjIYbnI
	/OFeacgHwu8swolD7wk0PoCKJbh43Jc=
Date: Mon, 6 May 2024 15:39:47 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] pinctrl: zynqmp: Support muxing individual pins
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <20240503162217.1999467-3-sean.anderson@linux.dev>
 <ZjkuzKEt2aiHIwg_@surfacebook.localdomain>
 <628abfa4-7e7a-4be1-ab4c-f01b7a90e4af@linux.dev>
Content-Language: en-US
In-Reply-To: <628abfa4-7e7a-4be1-ab4c-f01b7a90e4af@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/6/24 15:38, Sean Anderson wrote:
> On 5/6/24 15:26, Andy Shevchenko wrote:
>> Fri, May 03, 2024 at 12:22:17PM -0400, Sean Anderson kirjoitti:
>>> While muxing groups of pins at once can be convenient for large
>>> interfaces, it can also be rigid. This is because the group is set to
>>> all pins which support a particular function, even though not all pins
>>> may be used. For example, the sdhci0 function may be used with a 8-bit
>>> eMMC, 4-bit SD card, or even a 1-bit SD card. In these cases, the extra
>>> pins may be repurposed for other uses, but this is not currently
>>> allowed.
>>> 
>>> Add a new group for each pin which can be muxed. These groups are part
>>> of each function the pin can be muxed to. We treat group selectors
>>> beyond the number of groups as "pin" groups. To set this up, we
>>> initialize groups before functions, and then create a bitmap of used
>>> pins for each function. These used pins are appended to the function's
>>> list of groups.
>> 
>> ...
>> 
>>> +			for (pin = 0; pin < groups[resp[i]].npins; pin++)
>>> +				set_bit(groups[resp[i]].pins[pin], used_pins);
>> 
>> Why atomic bit operation?
> 
> The name was easier to remember. I can make it non-atomic.
> 
>> ...
>> 
>>> +	fgroups = devm_kcalloc(dev, func->ngroups + npins, sizeof(*fgroups),
>> 
>> size_add() from overflow.h.
> 
> OK
> 
>>> +			       GFP_KERNEL);
>>> +	if (!fgroups)
>>> +		return -ENOMEM;
>> 
>> ...
>> 
>>> +	for (i = 0; i < func->ngroups; i++) {
>>> +		fgroups[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
>>> +					    func->name, i);
>>> +		if (!fgroups[i])
>>> +			return -ENOMEM;
>>> +	}
>> 
>> Hmm... Can this benefit from devm_kasprintf_strarray()?
>> 
> 
> I don't think so, since the prefix is different for each group.

Sorry, the prefix is the same, but we have to use this format as to not
break the devicetree ABI.

--Sean


