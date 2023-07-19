Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7F75942E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 13:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjGSLa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 07:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjGSLa6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 07:30:58 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C93510D2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:30:57 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-315adee6ac8so6495040f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689766256; x=1690371056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/5iUbGiXzAaS9O8/8KimlUeTindwAnoLDM1OEOMMDI=;
        b=t+IJmrMiM2UFEWyJB5fnofKgUagsM41Iejeg2bBq3bG+3nK0y7Hc1nADQgafszFH6F
         b+xkMU/Fj4d0CBnyAg3HZREkKKJQa5t1ylx5De/EGJ2Ma2eVf+EI0bBLTpZfGue0KDn8
         TAmiAtts3UFBGAeK9I0P8w4rw7iE5joD4i+qU6iKap3O3v1euGPWScsDZeMfuz4Oehah
         UGF9asLpKlPso8fOrNe5vjfTSNqE2vXC5ee/cDkZd6P+V+x/zuU5b2yS6BM5ivNfG095
         HkogoD1uEe4dhA0cxlxenb4Ee78RG+lV/keowM621njeNSHVViCLi7WhePwHPrXp0wxD
         Vhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766256; x=1690371056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/5iUbGiXzAaS9O8/8KimlUeTindwAnoLDM1OEOMMDI=;
        b=HkExrS0fQANu/CoyUFx/Pro45xvDCrgziYHWFHKUvM4O49RguHvgwfj5oguhxY+TZ7
         CZAZOEgkvHfRQ2iuu9oI8rvccacm0hvPLvyS5MjnvhkjqJqiKjAwiiSAZK7tLpZfwYEy
         C/G+gtyJSIkNp8QBHJ8zBmwfQQiXwZqAfrU5OCOagmoSk9ngMpAP0IqM6S48FEkhNXks
         zkYGdRqk7saPCpEkExL7Xml4/am35wLfN4lUmL0Ziywu+H6U2AfReUiyNeBHOrodm9Ws
         Fui83r+HvJo13RHwewQdqPxp756jmuX2FZ2tvj9X2LYmhg1c3nG4RwiGeeQG6jkNXh4A
         N9Dg==
X-Gm-Message-State: ABy/qLZSPRviwuUsPZIvonDNQItn/n5Ghen2iIN1MWYRDkVb8DjtnkmV
        iOVOeRNKTfV66IyYkFT2HyvxQQ==
X-Google-Smtp-Source: APBJJlEg7bWwfifcHqydXljqgfjwfkfLtmFOqPWjap5kd/yCj8gvNDvoWUR/C3O9ZZkUCMAEDT2HSA==
X-Received: by 2002:a5d:4bcc:0:b0:314:11ab:11a0 with SMTP id l12-20020a5d4bcc000000b0031411ab11a0mr13312036wrt.34.1689766255929;
        Wed, 19 Jul 2023 04:30:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d5507000000b003142ea7a661sm5039716wrv.21.2023.07.19.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:30:54 -0700 (PDT)
Date:   Wed, 19 Jul 2023 14:30:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Andy Shevchenko <andy@kernel.org>, Marek Vasut <marex@denx.de>,
        Marc Zyngier <maz@kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mxc: fix unused function warnings
Message-ID: <ac8265aa-25bb-4b59-9097-b1ca519defa3@kadam.mountain>
References: <20230718193913.3578660-1-arnd@kernel.org>
 <319ee5f7-2dbd-430d-8ab1-a7b072ac7a9f@kadam.mountain>
 <3e7dbbf3-351c-430e-9bfe-a9e9e9cb895c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e7dbbf3-351c-430e-9bfe-a9e9e9cb895c@app.fastmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2023 at 01:26:06PM +0200, Arnd Bergmann wrote:
> Adding __maybe_unused to both mxc_gpio_runtime_resume and
> mxc_gpio_runtime_suspend would avoid the warning, and that is
> what we used to do in the past before we had the new macros,
> including for the mxc_gpio_noirq_suspend/mxc_gpio_noirq_resume
> functions in this driver.
> 
> Since I'm moving the driver to the new method, it's best to
> do it for both pairs of PM functions at the same time, so
> the __maybe_unused annotation becomes redundant.

Ah, sorry.  I misread the patch.

regards,
dan carpenter

