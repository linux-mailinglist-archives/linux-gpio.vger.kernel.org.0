Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E961EA2AD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 13:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgFALc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 07:32:29 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:33308 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFALc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 07:32:29 -0400
Received: from [192.168.1.41] ([92.140.207.208])
        by mwinf5d35 with ME
        id lnXo2200Y4WJoZY03nXyvM; Mon, 01 Jun 2020 13:32:27 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2020 13:32:27 +0200
X-ME-IP: 92.140.207.208
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     daniel@zonque.org, haojian.zhuang@gmail.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel.janitors,gmane.linux.ports.arm.kernel,gmane.linux.kernel.gpio,gmane.linux.kernel
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
Date:   Mon, 1 Jun 2020 13:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <87h7vvb1s3.fsf@belgarion.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Le 01/06/2020 à 10:58, Robert Jarzmik a écrit :
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
>
>> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
>> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
>> 'pxa2xx_pinctrl_init()'.
>> However, the corresponding 'pinctrl_unregister()' call in
>> 'pxa2xx_pinctrl_exit()' has not been removed.
>>
>> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
>> Remove it now to avoid some wondering in the future and save a few LoC.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Would be even a better patch with a :
> Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")

I was wondering it was was needed in this case.
The patch does not really fix anything, as the function is unused. Or it 
fixes things on a theoretical point of view.

CJ


> Cheers.
>
> --
> Robert
>

