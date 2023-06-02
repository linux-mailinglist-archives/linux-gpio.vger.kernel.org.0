Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1EC71F801
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 03:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbjFBBfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 21:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233612AbjFBBeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 21:34:44 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A653F13E
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 18:34:43 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id a4e8b064-00e5-11ee-a9de-005056bdf889;
        Fri, 02 Jun 2023 04:34:41 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 2 Jun 2023 04:34:40 +0300
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
        paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sifive: Add missing check for platform_get_irq
Message-ID: <ZHlHMFRdTdpAhqf1@surfacebook>
References: <20230601082440.30110-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601082440.30110-1-jiasheng@iscas.ac.cn>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, Jun 01, 2023 at 04:24:40PM +0800, Jiasheng Jiang kirjoitti:
> Add missing check for platform_get_irq and return error

Also refer to the functions as func(), like platform_get_irq().

> if it fails.

...

> +	for (i = 0; i < ngpio; i++) {
>  		chip->irq_number[i] = platform_get_irq(pdev, i);
> +		if (chip->irq_number[i] < 0)
> +			return -ENODEV;

Same as per the other email, why has the error code to be shadow?

> +	}

-- 
With Best Regards,
Andy Shevchenko


