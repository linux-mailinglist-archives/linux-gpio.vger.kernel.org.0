Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4B54C99B9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Mar 2022 01:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbiCBAKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Mar 2022 19:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiCBAKL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2022 19:10:11 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870A747AC8
        for <linux-gpio@vger.kernel.org>; Tue,  1 Mar 2022 16:09:28 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2AB9B5C01FC;
        Tue,  1 Mar 2022 19:09:26 -0500 (EST)
Received: from imap49 ([10.202.2.99])
  by compute3.internal (MEProxy); Tue, 01 Mar 2022 19:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=RC3OmsTlLAhw7qINDi2JUOqFcPDvTCTiD6tbe8
        w7L70=; b=xPqb8e1dCyqjyeCQzx+FwlVDTHpTYXPz3BHoolYCe4az6zkOnHIpVy
        gbHg+XZJ1ae2+4fEPjZehmt3m4+4NG4379ml25sTopsN1i2jaOSJ1/A4zZ8hwCMW
        J0ME4E6bvAGFoYBPrAuZq2s58BLDSPfGksnAWzSKm0H0/uvasNDv45VAL05mLr9H
        FNYUC4mZJjTgHFhtdmJhstnQVt8hc515nFUjSIRHu8e/0zcspFqF+1MGnUf9xAVn
        heoUTeVjmTbHrTh9t9oGdRoOHRuCr+ja+K74ZDpG8yfU6MHi2GYt4WwnqJWWeXKv
        qHo47/3w20q69xV3KV1CnfDRJpK++VLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RC3OmsTlLAhw7qIND
        i2JUOqFcPDvTCTiD6tbe8w7L70=; b=aNVTKyQAnxF/xm+0rRxaXuuAThkyZZ1AM
        c3Sq5QqXo/ZnvInff00STzPQkWSnn/6ZYqoTghFdIg2v/H7fcihS1fiXKzQy/5Vy
        5qGCk2q9EaCrZ1sLS0uRl3pYFeA7VovEcNNeuVFek+vxuet4zsCMUWDRe04JWoOS
        OKf3ss4lsH3BhbpVhtKv4bdV/uurfolpkyluXAK2Ma8uOqB7WgtTOzu8imI5ob72
        igPnDlVUgZaytWs6CtdImP8bXVLM86K2lCjeW5zuJG84YBtm4F3SEvDR6P5UFxYb
        qPymS1/jF0ClrKAoXTeH5xhaIiADp2w27D5iD3f+sGXj19VW69bjg==
X-ME-Sender: <xms:tbUeYj5J-NGuWU_qmdrzTHfrQkOeCF_wnIgN0gd261zHXsNX61wUww>
    <xme:tbUeYo7_ogkzJaVtEB5RijUHn-2sAiZCS7X16igIthqpIwkrNILxMKFvGJgJYQN4r
    _wJtdCoo5mpm3WpdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtfedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:tbUeYqe7SD6MqRBlP96aQpQKrehwigutIIY8NsdvFjQSEGXdckx9Sg>
    <xmx:tbUeYkJcZ_K2B2O0Pqk1Lg7Ae_hvvWY3mmPTbOfPSvXgVfl0WdL-1A>
    <xmx:tbUeYnJYAZjEoaVoEA0wSYCBUe1l336K10Qw1QdfAuBpZatqUOz2UQ>
    <xmx:trUeYtjtgOCu9s-_tKUMJa3UGo4SVSOcjuICjWjsUASq-DTbFnZjhQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 23800F60084; Tue,  1 Mar 2022 19:09:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
In-Reply-To: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
References: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
Date:   Wed, 02 Mar 2022 10:39:04 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Weiguo Li" <liwg06@foxmail.com>
Cc:     "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: aspeed: fix null dereference in debug
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 2 Mar 2022, at 06:00, Weiguo Li wrote:
> "pdesc" is null checked, but already dereferenced ahead in debug.
> Swap their positions to avoid potential null dereference.
>
> Signed-off-by: Weiguo Li <liwg06@foxmail.com>

Thanks.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index c94e24aadf92..83d47ff1cea8 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev 
> *pctldev, unsigned int function,
>  		const struct aspeed_sig_expr **funcs;
>  		const struct aspeed_sig_expr ***prios;
> 
> -		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> -
>  		if (!pdesc)
>  			return -EINVAL;
> 
> +		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
> +
>  		prios = pdesc->prios;
> 
>  		if (!prios)
> -- 
> 2.25.1
