Return-Path: <linux-gpio+bounces-13854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC69F095D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 11:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0323216944A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135F91B87CA;
	Fri, 13 Dec 2024 10:25:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6DD18A6D4;
	Fri, 13 Dec 2024 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085531; cv=none; b=OINafjL5PEgP62ihwTrZNzsnNHKVuqW/iikIhC45fDtBYM5q2yhmSyGhm6eyyfkfWjN0fH2x1FBkEGPt4SB8firQHxK32LAbgZetcV+BGGSs7LS0c0Zx7U79f+OnqvxzXyzk7l1j5JURBcp5sQ6JChXKSzVqyHdcmAvSEQMNSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085531; c=relaxed/simple;
	bh=5s/jjuh8AVRCqrdEFxix5vhyI/mt2fAlSTzCpz97cGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZ8alTbn/0A6Zpv/bjLITFQsljPKSuvmCcbb6C3hPbUjTNzHcwxCkUiVtQDjwpLgSstnV5MagsBkILK7t0uWfK66C9QYZ2O+l0Eia4oEqkrQBpuDsLkJRNJLngmUXiotZmILwzFxKbB8C8D3ymEgIEwMjNQYLCg2KOM9zA90QDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:44887.575670444
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id 27A541002A1;
	Fri, 13 Dec 2024 18:25:19 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id c343a56593534b629cd8b1f3e3536872 for brgl@bgdev.pl;
	Fri, 13 Dec 2024 18:25:20 CST
X-Transaction-ID: c343a56593534b629cd8b1f3e3536872
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <e945f4e0-4256-40de-9946-c195b999bae8@189.cn>
Date: Fri, 13 Dec 2024 18:25:18 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20241211051019.176131-1-chensong_2000@189.cn>
 <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
 <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
 <CAMRc=Medmy5EqTUWuQ-4YrQamOArKOK788iAY-=Cy42Od7y_Sw@mail.gmail.com>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <CAMRc=Medmy5EqTUWuQ-4YrQamOArKOK788iAY-=Cy42Od7y_Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bart,

在 2024/12/12 18:29, Bartosz Golaszewski 写道:
> On Thu, Dec 12, 2024 at 6:55 AM Song Chen <chensong_2000@189.cn> wrote:
>>
>> Or we can use devm_gpiod_get_array, it's pretty much equivalent effect
>> in s5m8767 even without fwnode specified.
>>
> 
> Can you use it though? I was thinking you need the fwnode variant
> because it's the child (regulator) node of the device?
> 
> If you can, that would be great.
> 
> Bart
> 

yes, i believe so, eventually both devm_gpiod_get_array and 
devm_fwnode_gpiod_get_index use of_fwnode_handle(iodev->dev->of_node) in 
this case.

But, i think it's a good idea to introduce a helper to get gpio 
descriptor array with fwnode, i have made a patch, would appreciate it 
if you can help me have a look.

Best regards,

Song

