Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE98584AC3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 06:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbiG2EkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 00:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiG2EkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 00:40:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58EE16592
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 21:40:21 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y141so3643499pfb.7
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 21:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lVPnD5XVA9oG53hcKewDcZbTM9FK0akI9xFos/PncIg=;
        b=oekkOiGZhPdIa/V8dgnq/hkcYktWUlXso1Btdf555n/iIpjaZ/XS7rB6BKhKHsLI34
         xscq92AWvpEka0NHg/UGBbUB4Y0c9q6ICl43DkuYY5kKZTBq0a4yUq/6dBLyPwo/eYVs
         h6WrsD/sVTy2Hrn5ENOfbk8b8nzGOY3tZSAL85ce0cfT3/rkT+EHUj2KhmerOhThZDH6
         crRWEK+lD0sJPzEc8MzTLUbZY3d2VlWao+uJ48ccm8Q9LJ7EkBY+kuCkv/aYWXcrg47E
         5v2/xBRYIqHIi7hG/4yvWMfa2+4H8UFzESoZ9goIlAOd0qCD3A+b/0wsfMMdWCKv0Rh1
         XSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lVPnD5XVA9oG53hcKewDcZbTM9FK0akI9xFos/PncIg=;
        b=67ySR6bQdgeItoupcV7DHwXuMPDR/ngGc3sKd2EAKAqqUm7kuTUQGh2t/btxKPcKVP
         WHR59+FBm9fp1i1XrSRpqYFIZa6P7b4Z8EywVTCsEL8k13Tu95zu9IW/x61HNIZu51l6
         DGo/LxnqS4uf8ptc46sRiloAAGEdHl1YXLwt0Zpl00SgJCzffWRw1UCV/sfo0xc3yedi
         8yQRkFcDrZtoOEewWX5rT0jAz59KXgctTaAOl1f0mK4zr3YZVYx0h57kL1eT+VniADrt
         WiMq+gpTprQ/o3dptf00R59ghMiGGX6WureOtswgzB2WRILz7WOCpoNFbIwlXU7yhqDl
         +uXA==
X-Gm-Message-State: AJIora822k55qpyUoVDA4OcgK6XLT56Ytpo2XxSXDN/ZUpefZjoslbYW
        a3DdkmICPTelNEGOR1+6mDaVzU3EGxRLRQ==
X-Google-Smtp-Source: AGRyM1uacYWDxwhn/kRpU3wUSkUGR6BRUVhlWvG6ziFfI/O/o5Q0lbdAiH+pEZ1wrjrWs9p3+SPiSw==
X-Received: by 2002:a63:43c2:0:b0:41a:9dea:5dac with SMTP id q185-20020a6343c2000000b0041a9dea5dacmr1490286pga.585.1659069621371;
        Thu, 28 Jul 2022 21:40:21 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id ft18-20020a17090b0f9200b001f2f64eada6sm1878348pjb.51.2022.07.28.21.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 21:40:20 -0700 (PDT)
Date:   Fri, 29 Jul 2022 10:10:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220729044018.3xtbjx5d5onitd6c@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
 <CANiq72mXH2Z-5aOu6dz47-hDPZjNQZAqYeGPv1vu3fARHJUtuw@mail.gmail.com>
 <20220727124051.GA130052@sol>
 <CANiq72nGS492exNopKBZnbS72A4jaCYHAV_faSaMDuqE2P23=g@mail.gmail.com>
 <20220728031104.GB15896@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728031104.GB15896@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-07-22, 11:11, Kent Gibson wrote:
> The comment is:
> 
>     // SAFETY: The string is guaranteed to be valid here.
> 
> and that is whether there a NULL check or not, so it isn't clear what
> the source of the guarantee is.
> I would prefer:
> 
>     // SAFETY: The string is guaranteed to be valid by the C API.

I believe this is what we settled with now. I will make updates accordingly.

> and updating the C header to explicitly state it returns a valid pointer.
> It currently says "Pointer to a human-readable string" which could be
> taken to mean valid, but making it "Valid pointer to..." would more
> clearly place the onus of it actually being valid on the C library.

I will let you guys handle the C API :)

-- 
viresh
