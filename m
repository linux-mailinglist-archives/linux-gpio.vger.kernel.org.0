Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0A87789F2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 11:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbjHKJcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 05:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjHKJcB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 05:32:01 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E82D30DA
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 02:31:58 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so28301341fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691746317; x=1692351117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2VGyZBytmpnhJA0vv2u38IIsmTj+XuPqzVQBW8m7X8=;
        b=pC1Os6ZCtOEPs37F7qkk1QPZGPEYNG3QycSK86EQO7CfDh4WeEengx5Q7GbAdpbtyu
         NbGVzL/JtntLzzgbs4OSb1JOh0kZN5bqQ1v0/tdgr25+tFtLO9BQYB9xQ6HsimF197B9
         Rdbr37zidkokL2for+H9vX+8p3WCo2R/nFhx4Vb5/aeal12LD/HglVlCte6QcXn9rRTh
         DJ+/EWj2HiLgBFV60XqexbZOhG5EJQL1rE2YtGvclqXO0tFMacDgkpSXghctoSITgJHi
         q2LoXpxtzrf6mc17Yus3kSunD5oA26l8YMxlyy0Q+XYyXWRulJMzfQSBbbXxcyu2/8WH
         dqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691746317; x=1692351117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2VGyZBytmpnhJA0vv2u38IIsmTj+XuPqzVQBW8m7X8=;
        b=YgyHQEYDamsfjZk2nNdiO1hKyRo1JuRaWsMeN0r7XOyeqw8j4tvdsbXchHaOaUk7DB
         Dasr58KYUPDp4SodpV8i60VKJ4j0Nvmq/ZlXjAevzBhJWKVi2aniflfKJGKAseQJ5cbx
         X11iRv1p8ApD9nzjeS2hM0otV76oY986rJfJXK2t+Tk7Cq8DbpN2jXLceZnnV7U0TpVb
         l2X0eA3PriR92SUObJIpXyWZYVcjTJKHAbOpeGYyF3Pfkudu55tGQrp51hcMg1Hfn7mb
         80EMuiElpGU7+Am1U0PEvgzm0nS17Hp9h0jHP1v4XaP8iItx9Or8jfPw2iI++ESQys3B
         KtAg==
X-Gm-Message-State: AOJu0YzYstgbP8tqhAUCOLeqFkhs9PwhFlin9nAWV7s4PARG0nanFkoM
        Ko7FRJWOieUd+WdI2eUGlkLXXg==
X-Google-Smtp-Source: AGHT+IEgLWmt9jM55+QIvswvVbtk9wb3d49vZcs5e6sq7Hrp8q5aRDoXXwp7b+uYFEjuwAOVYgb/zw==
X-Received: by 2002:a05:651c:104f:b0:2b7:2db:8ea4 with SMTP id x15-20020a05651c104f00b002b702db8ea4mr1336268ljm.30.1691746316757;
        Fri, 11 Aug 2023 02:31:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fba92fad35sm7608507wml.26.2023.08.11.02.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 02:31:56 -0700 (PDT)
Date:   Fri, 11 Aug 2023 12:31:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     oe-kbuild@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
Message-ID: <e1f0ddf1-542f-423b-9484-5f992c1f7d1d@kadam.mountain>
References: <20230809131442.25524-2-brgl@bgdev.pl>
 <2444c3ff-eaf3-4cb9-851b-8e92156128b0@kadam.mountain>
 <ZNX8DDKYMOyxdTnB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNX8DDKYMOyxdTnB@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2023 at 12:14:52PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 11, 2023 at 08:20:11AM +0300, Dan Carpenter wrote:
> 
> > smatch warnings:
> > drivers/gpio/gpio-sim.c:1472 gpio_sim_config_make_device_group() warn: possible memory leak of 'dev'
> 
> Isn't smatch a bit dumb about cleanup.h?
> 

Aw.  Crud.  I hadn't seen that this was a cleanup.h thing.

I did do some work to suppoort cleanup.h but probably it will take a
while to work out the kinks.  Let me figure this out.

regards,
dan carpenter
