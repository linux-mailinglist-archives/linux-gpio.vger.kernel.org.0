Return-Path: <linux-gpio+bounces-13794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF91E9EDF2B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 07:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F86281CE6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 06:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4EC18132F;
	Thu, 12 Dec 2024 06:01:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576875684;
	Thu, 12 Dec 2024 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983318; cv=none; b=AGXbuP5FkGTBQsVP+q7UR50++GFopPewbcQr7LWxatlX0bPwVXchKBgAlStgXteQVqHwanYJUbQ/2khpNUY9d3VZKzUQtXzkSDvkSGn1GuyFE9dYzOYJKTdR5zJRwj0wLTKOTd2phy97DuFWRJTYJ5Tnn9XY7ujZqM3zsN90Q+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983318; c=relaxed/simple;
	bh=Ov0Go37VZ4ZQ7lXzpsfEFxPvSbFq/G0hhXSWUmXWpS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBGdzN1Ov1zjkVxXyv3bIqoxUqd4jATbVfrcyZmh5fylyHGblhZivfzvEjPRkjxF5+918xg7NQwsvwj1g5TZyRAUhU+rsfG856H4Cb8ZZv8f30nQIpwdROUsg9oM3mf9DWUTLYfUQNIgddIxh7pVBA53Gs4afficRXVe2I0wedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:45468.1797976615
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id 1DC3F1002D7;
	Thu, 12 Dec 2024 14:01:46 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id 59803a3dd07f44daa507ca3db8c2ecf5 for broonie@kernel.org;
	Thu, 12 Dec 2024 14:01:47 CST
X-Transaction-ID: 59803a3dd07f44daa507ca3db8c2ecf5
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <26ca5498-e3b6-4ea3-a653-50114e5d7034@189.cn>
Date: Thu, 12 Dec 2024 14:01:45 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Mark Brown <broonie@kernel.org>
Cc: krzk@kernel.org, lgirdwood@gmail.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20241211051019.176131-1-chensong_2000@189.cn>
 <8ecd5325-f347-4869-9049-2731b719f5d2@sirena.org.uk>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <8ecd5325-f347-4869-9049-2731b719f5d2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for reminding, will be corrected in next version.

Song

在 2024/12/11 21:25, Mark Brown 写道:
> On Wed, Dec 11, 2024 at 01:10:19PM +0800, Song Chen wrote:
>> This converts s5m8767 regulator driver to use GPIO descriptors.
>>
>> ---
>> v1 - v2:
>> 1, reedit commit message.
>> 2, remove development code.
>> 3, print error msg in dev_err_probe.
>> 4, doesn't set gpiod directions until successfully requesting
>>     all gpiods. It's pretty much equivalent with original code.
>>
>> Signed-off-by: Song Chen <chensong_2000@189.cn>
>> ---
> 
> Your signoff needs to be before the ---, and the changelog after the
> ---.  The tools will get very confused and remove your signoff here.

