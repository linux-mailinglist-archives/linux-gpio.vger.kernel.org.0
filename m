Return-Path: <linux-gpio+bounces-9763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C526A96B55E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 10:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D522831D6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 08:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377B31CC8AC;
	Wed,  4 Sep 2024 08:44:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C51B6536
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439468; cv=none; b=j+XqE0Z1zcJ5ZnAm+8ajjqEeDi08Ffo2FzCNrKXX++wOD4dJnPgFvf9n507cN4vzTXP9k4jMkdJYfkNlqi0WjG4qppwXmD0Fj3ScRXvRXMxcxCtLLlwUqyVJjfb60WJia8KqIrQDeZfz6tViXDslGpVPa0UXEWcSnLS7IP6hpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439468; c=relaxed/simple;
	bh=nvrR0pn4GITzf1gc7SM75b6zg9lkM07gkXzq1mfYKvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lmEFj0thTDMx6d8GCRzS1NM6B00YBJu1CqhnMEoov/FAHt3+hnRRiR4mABaatu+DzofJt1cgdrambRvU+IweHC9NAyE0Fwqz9t4HfISs0+Jm2ZHa3kPIOTS1kuHYqiIPOZcZFGFUc/zq6xjLBJT3CAltLmO4buX02JevJPZsXug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WzGFg5SL3z1xwns;
	Wed,  4 Sep 2024 16:42:15 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 79FED1402C6;
	Wed,  4 Sep 2024 16:44:16 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Sep 2024 16:44:15 +0800
Message-ID: <78c50ee8-a6c7-4eb2-8e56-eaca226b8d00@huawei.com>
Date: Wed, 4 Sep 2024 16:44:15 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Simplify code with helper function devm_clk_get*()
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>
References: <20240903080627.53652-1-zhangzekun11@huawei.com>
 <172543690825.12391.10926770607261853766.b4-ty@linaro.org>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <172543690825.12391.10926770607261853766.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Hi, Bartosz,

After receiving your ack email, I find out some mistakes in the
commit message. In commit messages of patch [3/4] and patch [4/4], 
devm_clk_get_enabled() should be replaced by 
devm_clk_get_optional_enabled(). Sorry for making these mistakes. I 
think I should send v2 to fix them.

Best Regards,
Zekun

在 2024/9/4 16:01, Bartosz Golaszewski 写道:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Tue, 03 Sep 2024 16:06:23 +0800, Zhang Zekun wrote:
>> Use helper function devm_clk_get_enabled() and
>> devm_clk_get_optional_enabled() to simplify code.
>>
>> Zhang Zekun (4):
>>    gpio: cadence: Use helper function devm_clk_get_enabled()
>>    gpio: lpc18xx: Use helper function devm_clk_get_enabled()
>>    gpio: mb86s7x: Use helper function devm_clk_get_enabled()
>>    gpio: xilinx: Use helper function devm_clk_get_enabled()
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] gpio: cadence: Use helper function devm_clk_get_enabled()
>        commit: 7cea93092a28d3338e242b08f8ee5099c82c1cb6
> [2/4] gpio: lpc18xx: Use helper function devm_clk_get_enabled()
>        commit: c9e5cb9916fcf73ac8d2e0a1e35a9327bf0e347e
> [3/4] gpio: mb86s7x: Use helper function devm_clk_get_enabled()
>        commit: 1c927fb131fffea28a7ebe00220071d400a11d53
> [4/4] gpio: xilinx: Use helper function devm_clk_get_enabled()
>        commit: f8d5200bd59b9688f5f59ec8b1e06e8200dc4fda
> 
> Best regards,

