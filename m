Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC32124F5D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 18:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfLRRcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 12:32:39 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:59148 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726939AbfLRRci (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 12:32:38 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihdBc-0004nl-W2; Wed, 18 Dec 2019 17:32:37 +0000
Subject: Re: [PATCH] pinctrl: artpec6: fix __iomem on reg in set
To:     Jesper Nilsson <jesper.nilsson@axis.com>
Cc:     Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@axis.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191218101602.2442868-1-ben.dooks@codethink.co.uk>
 <20191218162616.qsxsltfsrxotzqhb@axis.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <048c9653-114b-f726-44b2-9eb1d460b5b5@codethink.co.uk>
Date:   Wed, 18 Dec 2019 17:32:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218162616.qsxsltfsrxotzqhb@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/12/2019 16:26, Jesper Nilsson wrote:
> On Wed, Dec 18, 2019 at 11:16:02AM +0100, Ben Dooks (Codethink) wrote:
>> The artpec6_pconf_set should have marked reg as __iomem,
>>   which ends up making sparse complain about address
>> space conversions. Add the __iomem to silence the
>> following warnings:
>>
>> drivers/pinctrl/pinctrl-artpec6.c:814:13: warning: incorrect type in assignment (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:814:13:    expected unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:814:13:    got void [noderef] <asn:2> *
>> drivers/pinctrl/pinctrl-artpec6.c:825:34: warning: incorrect type in argument 1 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:825:34:    expected void const volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:825:34:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:827:25: warning: incorrect type in argument 2 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:827:25:    expected void volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:827:25:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:837:34: warning: incorrect type in argument 1 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:837:34:    expected void const volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:837:34:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:840:25: warning: incorrect type in argument 2 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:840:25:    expected void volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:840:25:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:850:34: warning: incorrect type in argument 1 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:850:34:    expected void const volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:850:34:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:853:25: warning: incorrect type in argument 2 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:853:25:    expected void volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:853:25:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:864:34: warning: incorrect type in argument 1 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:864:34:    expected void const volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:864:34:    got unsigned int *reg
>> drivers/pinctrl/pinctrl-artpec6.c:867:25: warning: incorrect type in argument 2 (different address spaces)
>> drivers/pinctrl/pinctrl-artpec6.c:867:25:    expected void volatile [noderef] <asn:2> *addr
>> drivers/pinctrl/pinctrl-artpec6.c:867:25:    got unsigned int *reg
>>
>> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
>> ---
> 
> 
> 
> 
>> Cc: Lars Persson <lars.persson@axis.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: linux-arm-kernel@axis.com
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   drivers/pinctrl/pinctrl-artpec6.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
>> index 986e04ac6b5b..439a997b6bdb 100644
>> --- a/drivers/pinctrl/pinctrl-artpec6.c
>> +++ b/drivers/pinctrl/pinctrl-artpec6.c
>> @@ -798,7 +798,7 @@ static int artpec6_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   	enum pin_config_param param;
>>   	unsigned int arg;
>>   	unsigned int regval;
>> -	unsigned int *reg;
>> +	unsigned int __iomem *reg;
> 
> 	void __iomem *reg;
> 
> We're using as an argument to readl()?

yes, readl() shoud take an __iomem attributed pointer.

>>   	int i;
>>   
>>   	/* Check for valid pin */
>> -- 
>> 2.24.0
>>
> 
> /^JN - Jesper Nilsson
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
