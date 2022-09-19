Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E8F5BC4FC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 11:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiISJH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 05:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiISJH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 05:07:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3C995A4;
        Mon, 19 Sep 2022 02:07:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46670B810A1;
        Mon, 19 Sep 2022 09:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1367CC433C1;
        Mon, 19 Sep 2022 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663578444;
        bh=sQEvRIY5evYtU34Ygtjo5VbWFVAY7fo/LsV81WKEafM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=l8gUJdcbibvTvULKl9vyNN9QftOJacUh/fg62x+nFG6k4LTNhSmYVGw3QsDxyffWL
         CFrPEER5aA0AODcsT0F2c3+6oUSAugod+9whmgIT+Y0K7d8dLXTXHMDuQXKSt1sk/b
         Iekj5yQlyhRX5VEMRFfd2R1cHyHul42RhTP8qXSAfLLJiClx+7BTzCeYiKS5exGfC6
         F3AVUWqA4XNA+FmGh5w/JCdSoveWBAzJSp+Fy1G7DiDMqCt4uiSEStTs1u9p7DzwKs
         FX4+6juNl+ETzextyZYlkXey9fVClAWAkLwz4tck5L5op9Qpg5HLYPL/9WNohdQn9i
         j2gMfoCiv3z8w==
Received: from 185-176-101-241.host.sccbroadband.ie ([185.176.101.241] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1oaCkL-00B1aF-MX;
        Mon, 19 Sep 2022 10:07:21 +0100
Date:   Mon, 19 Sep 2022 10:07:21 +0100
Message-ID: <87edw7lol2.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Dongliang Mu <dzm91@hust.edu.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: tqmx86: fix uninitialized variable girq
In-Reply-To: <20220919031250.770285-1-dzm91@hust.edu.cn>
References: <20220919031250.770285-1-dzm91@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.176.101.241
X-SA-Exim-Rcpt-To: dzm91@hust.edu.cn, linus.walleij@linaro.org, brgl@bgdev.pl, mudongliangabcd@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 19 Sep 2022 04:12:49 +0100,
Dongliang Mu <dzm91@hust.edu.cn> wrote:
> 
> From: Dongliang Mu <mudongliangabcd@gmail.com>
> 
> The commit 924610607f19 ("gpio: tpmx86: Move PM device over to
> irq domain") adds a dereference of girq that may be uninitialized.
> 
> Fix this by moving irq_domain_set_pm_device into if true branch
> as suggested by Marc Zyngier.
> 
> Fixes: 924610607f19 ("gpio: tpmx86: Move PM device over to irq domain")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
> v1->v2: modify fix method to moving irq_domain_set_pm_device into
> if true branch as suggested by Marc Zyngier
>  drivers/gpio/gpio-tqmx86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
