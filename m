Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237877591DB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 11:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjGSJop (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 05:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjGSJog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 05:44:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E49E75
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 02:44:35 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3143b88faebso6994125f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689759874; x=1692351874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BEGbSD7Bjs/eDaJPOd5e2uMPDg1yiM7Q38BpjFCMfrI=;
        b=wX8Tx/XEx0VEZeOObfZqo6H1FFSJdGf5cWR1jSwwof1pC7Nc3p77DyAnt1BF3ocKZC
         nmDY4EDsQIbusAhROxcZ4WDTfwb5GIBJV9/1hpVdirJYdI3dWGXA92XwSX23fBNA1RkG
         WcLsqkzEJ9bkjwMbBm5oggwcPmw8rjSYyHn0WV8HgwlRDt7Mg/qn9/AyeJyRA1+PtKSS
         /tYdi+oBLu/6WV8QT2yfoRIgoEidcQ+ZA2cVB+8HaMnRer+KSiETFbPTy9EnloF1eSBO
         aA74xptLCJca+Ko9kA/4Q/5Doknu5zQLSKdkIffQsm6kBW9qyrlQr754PYq0zD3Lib5m
         d/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689759874; x=1692351874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEGbSD7Bjs/eDaJPOd5e2uMPDg1yiM7Q38BpjFCMfrI=;
        b=huAlTsPeL4zY5hs32mL9DX/n6tomiXc+fUttPzAqXJ8whSfrztbGolets9U6qlECoo
         mRrfh5yV+kHcD+3fGNTzoDfwR7Sh83USriD0OCpj04Ua3fUpwJy5h7jisz1w/oXKpXeL
         AS9pAS4UJvBjNOQafqaogBzOwe3/zhFhN8xG7z+clzbE7bX7IXYYuU6MT0cyqKzvFmDn
         bH4MhVtOYz7oFQj3riDPXgfcwgaundqP2asvuemqffDhl36g4OPnctU8SALxn81VBmp+
         XdC0Y2spM2ULVmzNFx+N2DxfPqAUVtVI4CqoJaPSAdP6Tb8vR118PV1J7MnDcoOaU5jW
         akHg==
X-Gm-Message-State: ABy/qLZMsgD8MBE0ctc3hhj44GL05OyZy5f+smc7tFzdCjUlcYCNhJ3w
        9cvsHFLYX/v4uCcAcElKjRB9OQ==
X-Google-Smtp-Source: APBJJlHuFKrVTIOQn09Y40jgIzTkU6W+gcJFi/EI3cnQXhcvh8uteAVd29DdycOIgLeI13PhsB2hDQ==
X-Received: by 2002:a5d:5506:0:b0:314:3358:d57f with SMTP id b6-20020a5d5506000000b003143358d57fmr14709214wrv.56.1689759873861;
        Wed, 19 Jul 2023 02:44:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d4d03000000b00313de682eb3sm4835970wrt.65.2023.07.19.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 02:44:32 -0700 (PDT)
Date:   Wed, 19 Jul 2023 12:44:29 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andy@kernel.org>, Marek Vasut <marex@denx.de>,
        Marc Zyngier <maz@kernel.org>,
        Dan Carpenter <error27@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mxc: fix unused function warnings
Message-ID: <319ee5f7-2dbd-430d-8ab1-a7b072ac7a9f@kadam.mountain>
References: <20230718193913.3578660-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718193913.3578660-1-arnd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 18, 2023 at 09:39:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new runtime PM support causes a harmless warning about
> unused functions when runtime PM is disabled:
> 
> drivers/gpio/gpio-mxc.c:612:12: error: 'mxc_gpio_runtime_resume' defined but not used [-Werror=unused-function]
> drivers/gpio/gpio-mxc.c:602:12: error: 'mxc_gpio_runtime_suspend' defined but not used [-Werror=unused-function]
> 
> Change the driver to use the more modern helper macros that avoid these
> warnings, and remove the now unnecessary __maybe_unused annotations
> 
> Fixes: 3283d820dce64 ("gpio: mxc: add runtime pm support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

The patch is nice, but I don't understand why __maybe_unused doesn't
work?

regards,
dan carpenter

