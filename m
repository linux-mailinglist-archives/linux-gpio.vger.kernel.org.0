Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860B063C97B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 21:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiK2UmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 15:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiK2UmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 15:42:10 -0500
X-Greylist: delayed 33597 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Nov 2022 12:42:07 PST
Received: from 20.mo583.mail-out.ovh.net (20.mo583.mail-out.ovh.net [91.121.55.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB2A686BD
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 12:42:07 -0800 (PST)
Received: from player158.ha.ovh.net (unknown [10.110.103.195])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id D58DA25161
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 11:15:27 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player158.ha.ovh.net (Postfix) with ESMTPSA id 46A5F3138E659;
        Tue, 29 Nov 2022 11:15:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G0058d0926ac-28bf-4aef-bf3b-464d960ad17b,
                    EBB6FAEB9E2E49B041ED7FFF0E08AB355E9D3184) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <aa4cb998-2820-1d5c-c6fe-663515b7bd7f@milecki.pl>
Date:   Tue, 29 Nov 2022 12:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_add_functions()
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        lakshmi.sowjanya.d@intel.com, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org
References: <20221129105820.1539875-1-cuigaosheng1@huawei.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20221129105820.1539875-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16847684732605541289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrjeeggddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnheptdegteehuedtvddukedutdekteevheetgeelheffteekheejteffgfevgeekfeeunecukfhppeduvdejrddtrddtrddupdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.11.2022 11:58, Gaosheng Cui wrote:
> The memory of funcs is allocated by thunderbay_build_functions(),
> thunderbay_add_functions() will free funcs when everything is ok,
> but it will not be freed when thunderbay_add_functions() fails,
> then there will be a memory leak, so add kfree() when
> thunderbay_add_functions() fails to fix it.
> 
> Fixes: 25d2e41cf59b ("pinctrl: thunderbay: rework loops looking for groups names")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/pinctrl/pinctrl-thunderbay.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
> index 9328b17485cf..10a7380af8e6 100644
> --- a/drivers/pinctrl/pinctrl-thunderbay.c
> +++ b/drivers/pinctrl/pinctrl-thunderbay.c
> @@ -784,8 +784,10 @@ static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct funct
>   
>   		group_names = devm_kcalloc(tpc->dev, func->num_group_names,
>   					   sizeof(*group_names), GFP_KERNEL);
> -		if (!group_names)
> +		if (!group_names) {
> +			kfree(funcs);
>   			return -ENOMEM;
> +		}
>   
>   		for (j = 0; j < tpc->soc->npins; j++) {
>   			const struct pinctrl_pin_desc *pin_info = &thunderbay_pins[j];

I'm wondering if moving that kfree(funcs) to the caller
(thunderbay_build_functions()) would make code a bit cleaner.

If you take a look at thunderbay_build_functions() it takes care of
allocating and reallocating so maybe kfree() should belong there too?
