Return-Path: <linux-gpio+bounces-22345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF742AEBA3B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 16:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EBDF3B5305
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 14:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A232AD0B;
	Fri, 27 Jun 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCnhGL3x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7851632C8
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035560; cv=none; b=RBZxTWyhIgarTBQYQ4C2VFB89yoS61GRVcOmrcmivKx1uGDf8x+DgLub/gZCDlsX4hSQCkvDjY3ja2jM9xSmAjCQV+CZG3I0e610RGIv1ewQPtAPmHyPHUuKOJDQe0WUDRMaTT9izRIUBSJFDLL7PbLcIAsZcOBEeoiePwLyEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035560; c=relaxed/simple;
	bh=6i1nd2ZAAfWAOjOq8xXJDosHkMOqBr1CKsTjzYYmWuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3BEMSVCBPtrKPAH8zmsKa6TCRPeLKaRGJ6O1IIoRAlDQnRlRNZPgnbIGZ6wW9nuFPA/YBzq+7CvMxttMyzkTGIptkHmga+W6qwLmDgICYQd2e0yAW1IRLlSLbkR5BLaCU88Yljla4m+Y+KMlqUTDttx/w9w2Bxy08/BWSqbFe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCnhGL3x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB55C4CEE3;
	Fri, 27 Jun 2025 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751035560;
	bh=6i1nd2ZAAfWAOjOq8xXJDosHkMOqBr1CKsTjzYYmWuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GCnhGL3xxQKQ6qrFCV37NaptNIJxQS1ycWH3LRISHoP8tCKnuc81cMk6YslZwCnZy
	 H9+ZNHEnTMqO5CIAeU40o31SIiUKzs6UN547BP4rgtOp+C/pTHdkFWCyKUI25qTwmA
	 Waex+uzQiGBhu96YIjyEPmwd2MLfsm8A33iYtuSr1Hjoy4HDhLBFSQXkgmaw7uVmP/
	 fmGSrKQaRO72uz8T4wFknWS3UFXyU4exn1zpKCipMbN9dPSwRfXjipYQAJtAIkHWTc
	 Bzy3v3qMdMvFiCro9FE99hMNlV/BzkFftn7ZiA+VLwoqnAayzXWhHYgZAlfmbV7u+r
	 WGVj+twcDvLhQ==
Message-ID: <17c2e439-b82f-49ee-85cd-874388d3be41@kernel.org>
Date: Fri, 27 Jun 2025 09:45:58 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Clear GPIO debounce for suspend
To: Hans de Goede <hansg@kernel.org>, mario.limonciello@amd.com,
 Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
 linus.walleij@linaro.org, dmitry.torokhov@gmail.com
Cc: linux-gpio@vger.kernel.org
References: <20250626221409.2256551-1-superm1@kernel.org>
 <375eadfd-4ede-49ff-a75a-a39f68605277@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <375eadfd-4ede-49ff-a75a-a39f68605277@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/2025 3:04 AM, Hans de Goede wrote:
> Hi Mario,
> 
> On 27-Jun-25 12:14 AM, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> soc-button-array hardcodes a debounce value by means of gpio_keys
>> which uses pinctrl-amd as a backend to program debounce for a GPIO.
>>
>> This hardcoded value doesn't match what the firmware intended to be
>> programmed in _AEI. The hardcoded debounce leads to problems waking
>> from suspend. There isn't appetite to conditionalize the behavior in
>> soc-button-array or gpio-keys so clear it when the system suspends to
>> avoid problems with being able to resume.
> 
> Nice I do think this is a better solution then disabling hw-debounce
> in soc-button-array as we did before.

Although it helps this issue and should be harmless I intend to land it 
I do want to note we still have a difference in behavior for Windows and 
Linux in that Windows never programs the hardware debounce for the 
ACPI0011 device.

I think we should still consider a way to keep compatibility of behavior 
(my previous v3 3/4 seemed to do that just fine).

> 
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Hans de Goede <hansg@kernel.org>
>> Fixes: 5c4fa2a6da7fb ("Input: soc_button_array - debounce the buttons")
>> Link: https://lore.kernel.org/linux-input/mkgtrb5gt7miyg6kvqdlbu4nj3elym6ijudobpdi26gp4xxay5@rsa6ytrjvj2q/
>> Link: https://lore.kernel.org/linux-input/20250625215813.3477840-1-superm1@kernel.org/
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pinctrl/pinctrl-amd.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index 5cf3db6d78b79..4276bbe77e0e9 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -979,6 +979,13 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
>>   				  pin, is_suspend ? "suspend" : "hibernate");
>>   		}
>>   
>> +		/* clear debounce */
>> +		if (gpio_dev->saved_regs[i] & (DB_CNTRl_MASK << DB_CNTRL_OFF)) {
>> +			amd_gpio_set_debounce(gpio_dev, pin, 0);
>> +			pm_pr_dbg("Clearing debounce for GPIO #%d during %s.\n",
>> +				  pin, is_suspend ? "suspend" : "hibernate");
>> +		}
>> +
> 
> 
> I notice that the if () { } block above this checks if a pin is not configured
> to be a wakeup src. Since we only need this for wakeup sources maybe put this
> in an else block of the if () { } block above this ?
> 
> I've not strong preference for doing this change, just something which I noticed
> while looking at the code.
> 
> Either way this should probably have a comment on why the clearing is done here.

I'll respin with an updated comment.  I would rather keep the blocks 
separate so it's clearer in debug logs when multiple workarounds are 
enacted.

> 
> Regards,
> 
> Hans
> 
> 
> 
>>   		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>>   	}
>>   
> 


