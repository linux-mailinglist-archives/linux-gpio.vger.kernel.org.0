Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7826963BF6A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 12:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiK2Lxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 06:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbiK2Lxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 06:53:35 -0500
X-Greylist: delayed 985 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Nov 2022 03:53:33 PST
Received: from 11.mo550.mail-out.ovh.net (11.mo550.mail-out.ovh.net [188.165.48.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC5055A8F
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 03:53:33 -0800 (PST)
Received: from player763.ha.ovh.net (unknown [10.109.146.143])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id 0070525293
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 11:37:06 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player763.ha.ovh.net (Postfix) with ESMTPSA id 96EE33144B9F5;
        Tue, 29 Nov 2022 11:37:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003f4d50c74-976e-459a-a7ad-12d1a0dc17fd,
                    EBB6FAEB9E2E49B041ED7FFF0E08AB355E9D3184) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <6a7329e3-448f-bf1f-dfd3-34f6dd495408@milecki.pl>
Date:   Tue, 29 Nov 2022 12:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2] pinctrl: thunderbay: fix possible memory leak in
 thunderbay_build_functions()
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        lakshmi.sowjanya.d@intel.com, linus.walleij@linaro.org,
        kiran.kumar1.s@intel.com
Cc:     linux-gpio@vger.kernel.org
References: <20221129113410.1555592-1-cuigaosheng1@huawei.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20221129113410.1555592-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17213039251098807209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpedtgeetheeutddvudekuddtkeetveehteegleehffetkeehjeetfffgveegkeefueenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 29.11.2022 12:34, Gaosheng Cui wrote:
> The thunderbay_add_functions() will free memory of thunderbay_funcs
> when everything is ok, but thunderbay_funcs will not be freed when
> thunderbay_add_functions() fails, then there will be a memory leak,
> so add kfree() when thunderbay_add_functions() fails to fix it.
> 
> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v2:
> - Free the memory in thunderbay_build_functions, and update the commit
>    message and the fixes tag, thanks!
>   drivers/pinctrl/pinctrl-thunderbay.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
> index 9328b17485cf..84b64c3217a5 100644
> --- a/drivers/pinctrl/pinctrl-thunderbay.c
> +++ b/drivers/pinctrl/pinctrl-thunderbay.c
> @@ -817,6 +817,7 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
>   	struct function_desc *thunderbay_funcs;
>   	void *ptr;
>   	int pin;
> +	int ret;
>   
>   	/*
>   	 * Allocate maximum possible number of functions. Assume every pin
> @@ -860,7 +861,13 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
>   		return -ENOMEM;
>   
>   	thunderbay_funcs = ptr;
> -	return thunderbay_add_functions(tpc, thunderbay_funcs);
> +	ret = thunderbay_add_functions(tpc, thunderbay_funcs);
> +	if (ret < 0) {
> +		kfree(thunderbay_funcs);
> +		return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   static int thunderbay_pinconf_set_tristate(struct thunderbay_pinctrl *tpc,

Sorry, I probably wasn't precise enough.

This patch still leaves *existing* kfree(funcs); in the
thunderbay_add_functions(). Maybe you can get rid of that one and just
handle freeing in the thunderbay_build_functions()?
