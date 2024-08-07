Return-Path: <linux-gpio+bounces-8657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0B94ABC1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C285F1F23503
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 15:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7664984A40;
	Wed,  7 Aug 2024 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HctJdtwH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2A78C67;
	Wed,  7 Aug 2024 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043320; cv=none; b=uSJyiHVTIhQBsymjV+7DV2yc7rT3fgHW0WVTeXNapsxtT8V9EgcqtYSW5u1I7b6l22hfc4lbfI8KhVoICx0U5Ccx/c4qAGkNYMeFbO9/tofJFoXzHTm5XFxRZXs577k8w5VSZfHXcDI9XgZVo97/kp6hHZbze0cKk9ydWEM5d7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043320; c=relaxed/simple;
	bh=0UGHdTAw6VDnQfYkh0MWfKMbAXAOUeqDojPmv3gYugw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLVxEcshatYIGVwfE54X6OtDwyD7heAsy+DXHjCDeZzA+uu/W4aCvMve7CneuvlpUkVr7evMcWhGxZV3DbQ1974ewBhybsUKMF8PIjvvNCCo0CHKGwLTwt1Hz8OYR+EuSF0w0KSEB4EftSTf9NinZEbZn2t9f201a8GZ48T2lDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HctJdtwH; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id biH6s4lsUPZ0ybiH6sRgL8; Wed, 07 Aug 2024 17:08:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723043309;
	bh=f2G0n1RxaM2sBQWtRjrv2LjX8lvuJMLC31IYVtjWuo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HctJdtwHnDfiOI7/DtMXVlTSdhHGuRwTANIJGmqOY1dmE88fBpXQxRX+PCl65ZNq+
	 5Op86fklz9UfhsfOp29scmA03+5OqbWBixe1XY4Mm9wiwClroctC1RJ/BCYCKj4NbG
	 gTK4Xml/THYuMAYiG7WDtuGdBoM60DBejsv9jrodHHqIouDdsyIKobSA6vEO4ybK/j
	 7eQc2928aBSqUSVWjufe6Nw5dAfrMTlYd3fWx0ZkPlzVM7N4S+LFGekT2Mq96rZWai
	 DxI9AuWggkU8nQZMec9K1SikT49R/+Q4R7j8Onuuppore++1IUZviqkNhxGCaSCoz+
	 +l8UNe0VBSYgA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 07 Aug 2024 17:08:29 +0200
X-ME-IP: 90.11.132.44
Message-ID: <c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr>
Date: Wed, 7 Aug 2024 17:08:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linus.walleij@linaro.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
 <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/08/2024 à 16:14, Jerome Brunet a écrit :
> On Wed 07 Aug 2024 at 11:30, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> These 3 patches constify some structures in order to move some data to a
>> read-only section, so increase overall security.
>>
>> It is splitted in 3 to ease review.
> 
> I'm not entirely sure it eases review in this case.
> If a v2 is necessary, I think a single patch would be better.
> 
>> Patch 1: struct meson_pmx_group and meson_pmx_func
>> patch 2: struct meson_bank
>> patch 3: struct meson_pmx_bank
> 
> Is there any reason for leaving out 'struct meson_pinctrl_data' and
> 'struct meson_axg_pmx_data' ? I don't think they get modified but maybe
> I missed it.

No good reasons.

I'll send a v2 with everything constified all at once.

Should I take the R-b and T-b below, for the v2?


Thanks for the review and comment.

CJ

> 
>>
>> All patches are only compile tested.
> 
> Looks good anyway
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> On the vim3l:
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> 


