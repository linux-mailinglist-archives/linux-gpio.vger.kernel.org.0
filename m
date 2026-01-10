Return-Path: <linux-gpio+bounces-30382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8483D0D09B
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 07:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3EF53016724
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 06:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCB933C511;
	Sat, 10 Jan 2026 06:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CmUoZFhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234FE33C1BB;
	Sat, 10 Jan 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026311; cv=none; b=ToqzuDcp58n1O8t/U68DLejsr4X0czyw7TWUW4H+E07O5uue3n8I1urm7y+yATx2X8/1e/Qe6jZ9nDqao3jlD+L3zIr2erzO1pSOpbVbDZwuZpDejsYPNh9r/uMiDhRSzGanNLQjZcpplp9T9fppyDqalNupbzc/sE4UytfQQFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026311; c=relaxed/simple;
	bh=8mrzAp3GaeRGzgZbZusV8MPXcx0k/pv/uEE1mJwiRDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCYpYSbP2mc1I78Pb3OBMGT/0RA4VlZIG4+EFrvkmOfronkpm9tTJU9dTOsNACwAijZCbwb8AZsHyAi+4s2XGzJmaD5b0BeTFXx4c+67VKirv3Ci/MOieYhv4EpOTKoAg9wZZ7UHjHmK+h9xVxouR1KOpqQI1EFznW24Qkg7dNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CmUoZFhN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=y9rN2Y6rMaO1PcXHkuYMUV0HS8JBI5rf/nxP1m1TMj0=; b=CmUoZFhNw+K6nuqJPCL/WApJTx
	1ozrNs//61Feg6ksvuIVOtsp6QatlsJ1dYqMdkQAgV5tjlGCtMe/+0Qwx+IpgLSmf7o99tZ7ta3vX
	p8MoxXLwPp28hrFRY3apYWAguvm8BjAaWtm8iBQnjomV3xZPbc2NcSKNQiSZ/UuWR1EHOXm/JOSPz
	jYgOAaF9xj6UjiUD8KREPsajHcT3aB3S8rVnDU6N8QAUTazWB2q3CEV1jR6kDuUKGvnoQ+mXH1csL
	UhgXYguIKVhHP8KjdLIxctLlmIS5UlfyTVhziaPngj83fsHMek3eunWFGx06dQmcasMpSdcpIX5HL
	k7Bq0A2A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veSPH-00000003J3G-2Sxv;
	Sat, 10 Jan 2026 06:25:03 +0000
Message-ID: <3ffa7125-09d1-458b-96e7-624eee51adcf@infradead.org>
Date: Fri, 9 Jan 2026 22:25:03 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: drop Kconfig dependencies from symbol
 GPIO_TN48M_CPLD
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260108034217.2615017-1-rdunlap@infradead.org>
 <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMRc=Mcows9Mq9UC+307HzdV06zqRLgB9Bz=7igamT8k0mTCEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/8/26 1:04 AM, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 4:42 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> MFD_TN48M_CPLD is an undefined Kconfig symbol, so remove its use
>> in drivers/gpio/Kconfig.
>> Drop COMPILE_TEST so that the driver can be built at any time.
>>
>> Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Robert Marko <robert.marko@sartura.hr>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>>  drivers/gpio/Kconfig |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> --- linux-next-20260105.orig/drivers/gpio/Kconfig
>> +++ linux-next-20260105/drivers/gpio/Kconfig
>> @@ -1621,7 +1621,6 @@ config GPIO_TIMBERDALE
>>
>>  config GPIO_TN48M_CPLD
>>         tristate "Delta Networks TN48M switch CPLD GPIO driver"
>> -       depends on MFD_TN48M_CPLD || COMPILE_TEST
>>         select GPIO_REGMAP
>>         help
>>           This enables support for the GPIOs found on the Delta
> 
> I see the core MFD part of this driver was reverted by commit
> 540e6a8114d0 ("Revert "mfd: simple-mfd-i2c: Add Delta TN48M CPLD
> support"") years ago. Should this driver even be in the kernel? It
> seems to be useless without the parent driver that supplies the
> regmap?
> 
> I'm asking, because with your change, it will pop up in people's make
> config and I've been yelled at before for displaying useless options
> so I'm hesitant to make it visible for everyone.

I'll send a patch to remove it.
Thanks.

-- 
~Randy


