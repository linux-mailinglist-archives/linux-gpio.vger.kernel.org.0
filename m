Return-Path: <linux-gpio+bounces-14533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFBA02235
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 10:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD2A160494
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 09:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83741D6182;
	Mon,  6 Jan 2025 09:52:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C51CCEF8;
	Mon,  6 Jan 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.82.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157129; cv=none; b=t707QA1nMnkBK/wQAJqip1BsJrLh0xLlbupJnKmgzE3z0AJSqWJzNrtn6w52OdWFt8l0a/I8Kl18V7GFOPEPXRX6mkemJF2JBAWyTUUOCMMr/yFe4uMKokM+wiCB3/235zb/SburCARtqMXj9su8lBxPK9L5BszkiUDrt2OieXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157129; c=relaxed/simple;
	bh=W7p4MwwbuQqv1bdpw4mZxlelegPBY2En6spNHf7ULfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c728QdlMMufq15q4WE9vUrEWvzxJs6G0DeDFONPZ7dR97nVS60oTsVUP5DYnO0ZDLxFBJHOGlv04MJMX2GyGI2hZhqzdl9UpGDMmqAqT0hX1udR6NsG/nslU9Hb9JllZeqPxgrowKXkp6AsAsQN5tZQuX+okSj+mPZxrUcGcnKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name; spf=pass smtp.mailfrom=vps-ovh.mhejs.net; arc=none smtp.client-ip=145.239.82.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1tUjmC-00000005Hjt-2LIq;
	Mon, 06 Jan 2025 10:52:00 +0100
Message-ID: <36e47f2c-a8d4-4ad2-8f7e-60fa0b2787e8@maciej.szmigiero.name>
Date: Mon, 6 Jan 2025 10:51:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Take suspend type into consideration which
 pins are non-wake
To: Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <e61858fe70face71226727618dfaa9d5e54da0bd.1735490511.git.mail@maciej.szmigiero.name>
 <73486a76-d24d-40f0-ac32-792b80aca6d9@amd.com>
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Autocrypt: addr=mail@maciej.szmigiero.name; keydata=
 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
Disposition-Notification-To: "Maciej S. Szmigiero"
 <mail@maciej.szmigiero.name>
In-Reply-To: <73486a76-d24d-40f0-ac32-792b80aca6d9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: mhej@vps-ovh.mhejs.net

On 6.01.2025 04:18, Mario Limonciello wrote:
> On 12/29/2024 10:42, Maciej S. Szmigiero wrote:
>> Some laptops have pins which are a wake source for S0i3/S3 but which
>> aren't a wake source for S4/S5 and which cause issues when left unmasked
>> during hibernation (S4).
>>
>> For example HP EliteBook 855 G7 has pin #24 that causes instant wakeup
>> (hibernation failure) if left unmasked (it is a wake source only for
>> S0i3/S3).
> 
> On your machine do you know what pin 24 is connected to?

Yes, it's connected to WWAN modem, since this GPIO pin triggers wake notify
to this modem's parent PCIe port:
 From \_SB.GPIO._EVT:
Case (0x18)
{
	MSTP (0x3918)
	Notify (\_SB.PCI0.GP12, 0x02) // Device Wake
}

WWAN modem is _SB.PCI0.GP12.PWAN, there's no other device under _SB.PCI0.GP12.

Will add this note to v2 commit message.

> If not, can you run https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py and share the text report it generates to me?
> 
> I'll see if I can make sense in that report what it's most likely connected to.
> 
> Just want to make sure we're not papering over an issue in another component by making this change.

I think if firmware wants some pins as a wake source just for S4/S5
then it still should be respected.

>>
>> Fix this by considering a pin a wake source only if it is marked as one
>> for the current suspend type (S0i3/S3 vs S4/S5).
>>
>> Since I'm not sure if Z-wake pins should be included in either suspend
>> category I excluded them from both, so pins with only the Z-wake flag set
>> are treated as non-wake pins.
> 
> Z only makes sense at runtime.  As long as it's restored to previous value after exiting suspend or hibernate that should be totally fine.

Ack.

>>
>> Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend")
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
>> ---
>>   drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++------
>>   drivers/pinctrl/pinctrl-amd.h |  7 +++----
>>   2 files changed, 24 insertions(+), 10 deletions(-)
>>
(..)
>> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
>> index 667be49c3f48..8bf9f410d7fb 100644
>> --- a/drivers/pinctrl/pinctrl-amd.h
>> +++ b/drivers/pinctrl/pinctrl-amd.h
>> @@ -80,10 +80,9 @@
>>   #define FUNCTION_MASK        GENMASK(1, 0)
>>   #define FUNCTION_INVALID    GENMASK(7, 0)
>> -#define WAKE_SOURCE    (BIT(WAKE_CNTRL_OFF_S0I3) | \
>> -             BIT(WAKE_CNTRL_OFF_S3)   | \
>> -             BIT(WAKE_CNTRL_OFF_S4)   | \
>> -             BIT(WAKECNTRL_Z_OFF))
>> +#define WAKE_SOURCE_S03 (BIT(WAKE_CNTRL_OFF_S0I3) | \
>> +             BIT(WAKE_CNTRL_OFF_S3))
>> +#define WAKE_SOURCE_S4  BIT(WAKE_CNTRL_OFF_S4)
> 
> Since s03 doesn't make sense and s0i3 is wrong for s3 and s3 is wrong for s0i3 as a personal preference I would just call it
> 
> WAKE_SOURCE_SUSPEND
> WAKE_SOURCE_HIBERNATE
> 

Will change them accordingly.

Thanks,
Maciej


