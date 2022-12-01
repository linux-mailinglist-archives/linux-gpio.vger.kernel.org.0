Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6F263E78F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 03:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLACOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 21:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLACOd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 21:14:33 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8C38930C
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:14:32 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 136so431578pga.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 18:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdnaxV5gLjVLfzirS5QsSiknKTEctfAKndidxn6VtFw=;
        b=rQuRC2TIwDnE3YFwYj9WQVXfAN6JEjUIJC5/EKMGPedi6IX3DZoELuGupMKI7ZnPNE
         C/jSK10yGm01Mt0SvMEqouPeUW/wTak+D+tAb3ptrwjCtz1P2Si9aQKQILWOWDSsvcok
         c1M+2yEsGnmfX8m64/m+AqR+d5/lJemCPcgGuC7le4a/tyogxBrNmm2kRf5ThSm64XwI
         lWG6bI6gFgT9BOdJcdMrYUAfkxPrQuxN125YfkcjOiavpw6J6CHc3CMGo3curmCkUJ0p
         ru7KmyVsKq/IfnpvHiSaHB0+s7mjmpF9GdelL1xrAGUaeqgcAQUKVOP7+x6RE39/QfxI
         5gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdnaxV5gLjVLfzirS5QsSiknKTEctfAKndidxn6VtFw=;
        b=X4HaHMvmHp/02l+OVtcWmB8YXALTMlJc7EE7UkGaUPXKp5ps551UdeP/1V9nhLUrDv
         ncbhtkj6zrqf2OSkfSJ+1xwdejonGpqJnXt0NKGyhavvNvC4dS7xpRK9RO84QI4l1HC2
         hI374/mBw+Oymbhwe4+WdeIqO4Gp+FaXXN2+ySYivTjhiYW3nnvW7kG1wpnqXS8RnDrn
         ch/jXPalpuRluh8YJVhUn3UMz9+SeDX3v61EERfgfYWAr1la2EHcPBg378ZuybV1qzYS
         0UIV8PRXIGi7NQETpnVHyP4NctSQuVqCoObi7B8GJhQfsEcZFr3QlASLA2OwykyqZUKX
         7k5g==
X-Gm-Message-State: ANoB5pnVIqp4YoBYnMWOiRmmS6FtRWjf1TdqSw/Ni7kPqb5qh8X8HswH
        Sv9BcC2ivXxjNj5A7odJpGx9uw==
X-Google-Smtp-Source: AA0mqf7UOJ7+yERMOyAs7Dlj4pL8qFw8uoq8OCyzvqM6qO7w2d8cUccO8hL1GeZARdycA3gnRbOLnA==
X-Received: by 2002:a62:6406:0:b0:576:51c:e539 with SMTP id y6-20020a626406000000b00576051ce539mr3149151pfb.6.1669860872223;
        Wed, 30 Nov 2022 18:14:32 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090a5d0500b002191e769546sm1870600pji.4.2022.11.30.18.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 18:14:31 -0800 (PST)
Date:   Thu, 1 Dec 2022 07:44:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
Message-ID: <20221201021428.ta64zhqqdbdkrgbe@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-8-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30-11-22, 13:42, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add missing license text files and use the CC0-1.0 license for the
> rust-specific .gitignore file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  LICENSES/Apache-2.0.txt   | 201 ++++++++++++++++++++++++++++++++++++++
>  LICENSES/BSD-3-Clause.txt |  28 ++++++
>  LICENSES/CC0-1.0.txt      | 121 +++++++++++++++++++++++
>  Makefile.am               |   9 +-
>  bindings/rust/.gitignore  |   4 +-
>  5 files changed, 359 insertions(+), 4 deletions(-)
>  create mode 100644 LICENSES/Apache-2.0.txt
>  create mode 100644 LICENSES/BSD-3-Clause.txt
>  create mode 100644 LICENSES/CC0-1.0.txt

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
