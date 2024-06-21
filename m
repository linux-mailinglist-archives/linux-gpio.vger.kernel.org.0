Return-Path: <linux-gpio+bounces-7620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1530912D8C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 20:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D72561C21423
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 18:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0E8179957;
	Fri, 21 Jun 2024 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="DLFr7q3X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E138C1E;
	Fri, 21 Jun 2024 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718995951; cv=none; b=Gqdlrt0jtCAjU4waovkU55lWvCbLXw51KsWA57SATT9uFRCZa/9YuOhyBwYl4mXxP/o04eg/9ZUWiPEhzU1pLAhPXP776lgjz5yW11XZApu+a+nraJDR8C300U0e7bA8/hwwSUy5paynSYOt2uddqyUbVfg8TyfL5jXQSFHfCFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718995951; c=relaxed/simple;
	bh=ecwtGev0KvQNSzwp35e+yNAtAWdvf51o9B6zM/n6gQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZSTfifgJfjPGpmWXZNp75Pq2B4pZs3LgQI6JT7lU7xlXEMt9AERvpJ+q+UcBQ537V6W2qgQL1O8kvPZ4ys9Nuwv/j2+ebO561ze1cig64jSnOJrbHUu36Es+5D/03+FWXwvmP1iGVYoFWAKIRD78QWxhRoDSfpWphjqmAxfCXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=DLFr7q3X; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id F1A7E100002;
	Fri, 21 Jun 2024 21:52:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1718995927; bh=xUGHglTcHE+deAdqIJapo1+7Zs90p4nFF+okhK8BfmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=DLFr7q3XqgXTXr8TWhGqMLSnWx9ePg6/0RHwcWOPy/aN9NbwSWHhW7VYR14E/MLy4
	 PeaVMvdZyyVhEcmRX8CSaXCDgVHkly8Algcff7NTayOXz8WDeqdN4f34rDGZebLBOj
	 wUwoFG7smwZv7r57Ts7v+aJ8KOSIU6j4CcoyYEyUp4bZscbCOpXBWo+2BfACFqCoZG
	 wypmMpU6jIX/QDPOgoU4LAwRw3JEhe5EPEQ/Ke2WreHizKdObcWhRxt8AXv97WdX+V
	 i3ftbSvyMbAsi4iyZq/tbeiF5QLSGKXMOVljzvAXbrklTc38U2sibVBZHzblbquySs
	 aPNGBjzBGW4xQ==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Fri, 21 Jun 2024 21:51:10 +0300 (MSK)
Received: from [172.17.214.6] (172.17.214.6) by ta-mail-02 (172.17.13.212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 21:50:50 +0300
Message-ID: <f6b0e5fb-c692-4d67-ac0e-36ddbbc0a784@t-argos.ru>
Date: Fri, 21 Jun 2024 21:47:27 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: davinci: Validate the obtained number of IRQs
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20240618144344.16943-1-amishin@t-argos.ru>
 <CAMRc=Me5R+YLmx6mh_mfszRj7TKx25cL9Vx3J-7mvRTuat8Puw@mail.gmail.com>
Content-Language: ru
From: Aleksandr Mishin <amishin@t-argos.ru>
In-Reply-To: <CAMRc=Me5R+YLmx6mh_mfszRj7TKx25cL9Vx3J-7mvRTuat8Puw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186064 [Jun 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, git.kernel.org:7.1.1;t-argos.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;mx1.t-argos.ru.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/21 15:05:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/21 14:39:00 #25651428
X-KSMG-AntiVirus-Status: Clean, skipped



On 21.06.2024 16:59, Bartosz Golaszewski wrote:
> On Tue, Jun 18, 2024 at 4:45 PM Aleksandr Mishin <amishin@t-argos.ru> wrote:
>>
>> Value of pdata->gpio_unbanked is taken from Device Tree. In case of broken
>> DT due to any error this value can be any. Without this value validation
>> there can be out of chips->irqs array boundaries access in
>> davinci_gpio_probe().
>>
>> Validate the obtained nirq value so that it won't exceed the maximum
>> number of IRQs per bank.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
> 
> Why not Reported-by: ?

It is an established practice for our project, you can find 700+ applied
patches with similar line:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

> 
> Bart
> 
>> Fixes: eb3744a2dd01 ("gpio: davinci: Do not assume continuous IRQ numbering")
>> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
>> ---
>>   drivers/gpio/gpio-davinci.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index bb499e362912..1d0175d6350b 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -225,6 +225,11 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>          else
>>                  nirq = DIV_ROUND_UP(ngpio, 16);
>>
>> +       if (nirq > MAX_INT_PER_BANK) {
>> +               dev_err(dev, "Too many IRQs!\n");
>> +               return -EINVAL;
>> +       }
>> +
>>          chips = devm_kzalloc(dev, sizeof(*chips), GFP_KERNEL);
>>          if (!chips)
>>                  return -ENOMEM;
>> --
>> 2.30.2
>>

-- 
Kind regards
Aleksandr

