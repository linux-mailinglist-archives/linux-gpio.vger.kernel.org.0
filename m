Return-Path: <linux-gpio+bounces-14578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7875A04883
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 18:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233CB3A68F8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 17:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEB81F2C38;
	Tue,  7 Jan 2025 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Wa2LcvFk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04518D65E;
	Tue,  7 Jan 2025 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271747; cv=none; b=eVROB82N+oGIk/Gk9vhxwmvpR7U8/dLFTcFQ8ZEeB2iEk4OKpJ3Kc/JqGwIPwafN3LGT76IJMlDsTDf5DxITxsAwBeWeN87v97E3xMzaOx+O4+DyORH9yeZfInPqXGQRlrTRu8zz8ZoHeNBY7oQ6Ou8VcTj9/IuPD7CCrKen1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271747; c=relaxed/simple;
	bh=0XgZhUmiCS0fmIOafxfxj2Ab5jvA0AybJm5ALAaJGNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAz6RjLkQloFBottPU0bshpqykj87j2lmiKJvg4rFU5qmIfaNvyGWeI3i4AyMI88H6xRHnDAvcUKX1eZg/VbznZ5BeU7dWxF+sgm949Y0uMqrY0JqWuPuDR2cN2weUjDHVVV+eQZJ7NfDKKKl9uy1+U337G51jyNhOrkP+mEgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Wa2LcvFk; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id VDakt9eeD9jqYVDantwbfO; Tue, 07 Jan 2025 18:42:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736271736;
	bh=5mIYnytl3HKY6pkNTkFA+FKdHNM0CI77bpwBm5GEG+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Wa2LcvFkSITfkszCtVXzwTjsIQqZPbt8iSjbKZumW8oOLCTn1N9xvsXn+JnK2Q1OI
	 P2M1okG3bn0y645Zr2T9kcWszZI5yN5A5e48XysYiMSz4EQeUaD2lxOWAkJlX5G5Yo
	 WpTTOfqdMZpv2D7d6Cv2U2/rQDQQiS8zZdx/AkWkkXbnO1hpWIeHYPSFbGJptJMEzy
	 GZd/Mird+lMNIPiuxA4BccwBN492tnpFGDII8dqgs6thgTmSLvszt6UHqDOgUWLLf6
	 fIgKntnO5Db0aKSH1fu2HD7TzPf++bGOVBVLdHdTQydFOmrfYQ6UnhRsx4Anzx5DRA
	 aPgZJV9/51kzg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 07 Jan 2025 18:42:16 +0100
X-ME-IP: 90.11.132.44
Message-ID: <81b7066b-f769-4897-aa8e-8a1391894877@wanadoo.fr>
Date: Tue, 7 Jan 2025 18:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: microchip: pci1xxxx: Fix possible double free in
 error handling path
To: Ma Ke <make24@iscas.ac.cn>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org,
 kumaravel.thiagarajan@microchip.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <955f3abf-81b8-4471-82eb-b969dc5d7c9e@wanadoo.fr>
 <20250107011917.642951-1-make24@iscas.ac.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250107011917.642951-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/01/2025 à 02:19, Ma Ke a écrit :
> Christophe JAILLET<christophe.jaillet@wanadoo.fr> wrote:
>> Ma Ke <make24@iscas.ac.cn> writes:
>>> When auxiliary_device_add() returns error and then calls
>>> auxiliary_device_uninit(), the callback function
>>> gp_auxiliary_device_release() calls kfree() to free memory. Do not
>>> call kfree() again in the error handling path.
>>>
>>> Fix this by skipping the redundant kfree().
>>>
>>> Found by code review.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>> ---
>>>    drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>>> index 32af2b14ff34..fbd712938bdc 100644
>>> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>>> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>>> @@ -111,6 +111,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>>>    
>>>    err_aux_dev_add_1:
>>>    	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
>>> +	goto err_aux_dev_add_0;
>>>    
>>>    err_aux_dev_init_1:
>>>    	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
>>> @@ -120,6 +121,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>>>    
>>>    err_aux_dev_add_0:
>>>    	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[0]->aux_dev);
>>> +	goto err_ret;
>>>    
>>>    err_aux_dev_init_0:
>>>    	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);
>>
>> Hi,
>>
>> This is strange because the nearly same patch is in -next since June
>> 2024 ([1])
>>
>> It is also in Linux since at least 6.10 ([2])
>>
>> In [1] and [2], there is also a new err_ret label, which is not part of
>> your patch.
>>
>> On which tree are you working?
>> Is your patch compile tested?
>>
>> CJ
> 
> Thank you for your response. I discovered the aforementioned bug in
> Linux kernel v6.4.16 (the latest v6.4). It appears that the fix was
> not completed in the latest version of v6.4. I have also checked the
> link you mentioned and saw that the issue has been fixed in v6.10. I
> realize that I omitted the final jump patch in the patch v1 submitted,
> and I will perfect it in patch v2. Thank you for your suggestion.

v6.4 is not supported any more, so an updated patch would never be applied.
See active branches on https://www.kernel.org/.

Anyway, when don't working on a recent tree, you should tell it, because 
no one can guess that your patch is related to something old.

 > I realize that I omitted the final jump

So I guess, that you not compile tested your patch.
You should never do that, event when the change looks trivial.

CJ


