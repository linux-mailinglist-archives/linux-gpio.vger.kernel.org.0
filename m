Return-Path: <linux-gpio+bounces-14527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7BA02191
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 10:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5031639EA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 09:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56551D63EA;
	Mon,  6 Jan 2025 09:15:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003291D8DEE;
	Mon,  6 Jan 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154914; cv=none; b=CqfqZJxVkXUfp2kcDuZWDobENz3WAfokTCV/X3QkqTQMmjz1no6vGGZIOLS+ZEKGiILaxrkPPq2+JH0BEPLdzf4fYa6BxjjvMHoaeg5RtWq3xSY1xFs7FREEqiUPWMaRZ2L1uFIw+Lf988XxWrfeWcXU7Gn5OUzkKidBOlUkHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154914; c=relaxed/simple;
	bh=Mxkrwt14fM4pwO4vEkcq1UxQWVbFPvDfuuaBuvnGlhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDRrvdFGdxUuk1kgnKgE6EzQN875HvxyGR/dvhh223HMCoTaG7+drUOpb0mMBG8VguWC9PKMJUH1pRn9H6xuccQIe0QTxOWeFRdXHr7qUG9IpoDYQbVRr8EAPLcUtXqGDM9LYv41JIC8YCJ5oZfk0SNwCjh08cQ4wuAJcUj79+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:1666.1653008831
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id D2E751001EF;
	Mon,  6 Jan 2025 17:11:29 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id a2fb0e8641834e57994da1618bc59e83 for brgl@bgdev.pl;
	Mon, 06 Jan 2025 17:11:29 CST
X-Transaction-ID: a2fb0e8641834e57994da1618bc59e83
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <e8e3ad94-1a43-4439-91d9-15ad91aaea9b@189.cn>
Date: Mon, 6 Jan 2025 17:11:28 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drivers:gpio: introduce variants of gpiod_get_array
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241217085302.835165-1-chensong_2000@189.cn>
 <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
 <CAMRc=McNWBNCbCsNPvqUHrMtwfveeMCy5am+yNxVKUficat_VA@mail.gmail.com>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <CAMRc=McNWBNCbCsNPvqUHrMtwfveeMCy5am+yNxVKUficat_VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bart,

在 2025/1/4 04:41, Bartosz Golaszewski 写道:
> On Thu, Jan 2, 2025 at 2:25 AM Song Chen <chensong_2000@189.cn> wrote:
>>
>> Dear maintainers,
>>
>> It has been a while after this patch was sent. I'm not sure if i
>> followed the idea suggested by Bart correctly, see [1], any comment will
>> be appreciated.
>>
>> Best regards,
>>
>> Song
>>
>> [1]:https://lore.kernel.org/lkml/CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com/
>>
> 
> I've been meaning to respond and it fell off my radar. We typically
> don't add new calls without users so I'd love to see this patch in
> conjunction with a conversion of some driver to using it in order to
> prove that the change makes sense
> 
> Bart
> 

yes, agree, i planned to send a patchset with this one and s5m8767 
together, but i had a question and haven't got any response from 
Krzysztof yet. Maybe i was off his radar as well.

I will send another mail to see how he thinks, you are in that thread, 
please join the discussion.

Many thanks

Song

