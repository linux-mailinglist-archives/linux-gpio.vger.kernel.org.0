Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8FD66D58C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 06:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbjAQFT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 00:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbjAQFT4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 00:19:56 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D958E2749A
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 21:19:54 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so9516591pjg.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 21:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTf7XdsKsuIAnhFqoRBIASXsAQIeGzy1MIly6J3SX8s=;
        b=g0Qjt143j3zIQAsUS0c5E0VJb2GF6z0pouNHTVth4lyIu0+D2TNcW/oOhnKDg6mdb7
         IrHO7p3Xhrq/7f/FqJIPHprG37h06tJmeOA94Jsf+i9uRnZP40M+O+LnfXxIyHn4pLBS
         lQXfZySYYnCZoUvZ/k3f63gSwiBMQAYq8aRDlDEPEFFEEC6L6ZpwCV4IVZM2ea2p8p5j
         sxtXYCJ/H4tbFncJk1EG74GZurQPNW6J835Z94XufibMI8C+W/Sbiu0RSQZ3zjw3koIm
         yhVo0p6aGT2AKihMNp6YVDjGYdtneaufj0YFWH/GEb6d7Amt0zExJsHdaWrJ9cw4jD5x
         De5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTf7XdsKsuIAnhFqoRBIASXsAQIeGzy1MIly6J3SX8s=;
        b=dWs2sCf4gcXOkfNCV3JQkVTTxiEf8pXFMoDYIGRm4PLggBoCrqLhbeTPQoqGFRW9XC
         VHChEvlSpFoq1OAU5mmaEou1zmzyVX8tn+i/+6RqCcc9p5I919wMMdeCojXxFG1Pujf7
         tC7NaTYFvioK4u2rF5IC++u1ZgjT3ICZ/hlRATfTrnyCxDK5UMH+Qv93N0ticS1L3RK4
         11znJrP4a9w7zQ4Lr6InvYCIwPv9q1JIGuVrjk2zNQqs0SC2i64NicISBxhJSwdUhxhA
         A2RfTDFARwGB2wgISnJnrUZo7QCYU458un4DpXHv7gO3yl951NkaTAMRbtBVtz9pyrlq
         8bgg==
X-Gm-Message-State: AFqh2koMh2mBNbdlKq+3e2zA/b6ngG+537q5YAGIQ0GFuTCrgGFLD0fo
        SrlVw/Nv8ZeuQsvyTVki5TOMeA==
X-Google-Smtp-Source: AMrXdXt+MdvaGQj1bGpFnHqKND24UVQc+mKPsTNK1lxj0BLOR/cpQUoaD3OMoVLtcGqXJjz1wDWnHw==
X-Received: by 2002:a17:902:d582:b0:194:8b08:a571 with SMTP id k2-20020a170902d58200b001948b08a571mr2319178plh.2.1673932794390;
        Mon, 16 Jan 2023 21:19:54 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090311ce00b00189c536c72asm20246025plh.148.2023.01.16.21.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:19:53 -0800 (PST)
Date:   Tue, 17 Jan 2023 10:49:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 15/16] bindings: rust: make mutators return
 &mut self
Message-ID: <20230117051951.ouw3tglnw5tkwc4j@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-16-brgl@bgdev.pl>
 <20230116060250.c6i6ouu2ojutubcd@vireshk-i7>
 <CAMRc=MdX+SbN65m2jkZqJOYKobGgi=H0jCVyqcHCPo56152fMA@mail.gmail.com>
 <20230116094058.7m3d4pdy7llnk7my@vireshk-i7>
 <CAMRc=MerVcJW=yBpSGbWhk9cWENtLZE-OVx4NT=xm9fBtZgpBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MerVcJW=yBpSGbWhk9cWENtLZE-OVx4NT=xm9fBtZgpBQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-01-23, 13:57, Bartosz Golaszewski wrote:
> Seems like I went overboard with converting all of those cases but in
> same places this still fails:
> 
> error[E0502]: cannot borrow `config` as immutable because it is also
> borrowed as mutable
>    --> libgpiod/tests/line_request.rs:449:24
>     |
> 441 |             let request = config.request();
>     |                           ---------------- mutable borrow occurs here
> ...
> 449 |             let info = config.chip().line_info(0).unwrap();
>     |                        ^^^^^^^^^^^^^ immutable borrow occurs here
> ...
> 456 |             request.reconfigure_lines(&lconfig).unwrap();
>     |             ----------------------------------- mutable borrow
> later used here
> 
> If I make config.chip() return &mut Chip then it fails like that:
> 
> error[E0499]: cannot borrow `config` as mutable more than once at a time
>    --> libgpiod/tests/line_request.rs:449:24
>     |
> 441 |             let request = config.request();
>     |                           ---------------- first mutable borrow
> occurs here
> ...
> 449 |             let info = config.chip().line_info(0).unwrap();
>     |                        ^^^^^^^^^^^^^ second mutable borrow occurs here
> ...
> 456 |             request.reconfigure_lines(&lconfig).unwrap();
>     |             ----------------------------------- first borrow
> later used here
> 
> Not sure how to go about this.

What you did earlier is the easiest way to get around it probably.
i.e. use config.request().reconfigure_lines().

-- 
viresh
