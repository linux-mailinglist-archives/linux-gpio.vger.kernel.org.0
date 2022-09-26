Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62D25EAD60
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 18:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiIZQ7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 12:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiIZQ7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 12:59:14 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7AC6BCC5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 08:57:48 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so12875185pjq.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Fve91+Qky4XfIdzkq3rjb/VOBR2UF0t7Grvjns8qLCs=;
        b=UbxC17ypIvlIVmAyOZUbqwj1fxStG23r3QUtzo6cJEKnCdCSHK2+Raw+llEyGAEmG/
         dim18zI91BPqB+c+T9ObZJe5Ud4nFRnbztjt679xzvH0HhsXT7T1C1V+99GUL9+3i+ty
         IsJhwBwNqGwxIaXZMaS/bR5GDS7sWKHqFzZcz5xH42MLBxIfzUg3si03DXECTKrthtRb
         9RZZGl0H+sMV+4Oq6WlyesiJywEBhCMvE7pFBJPdxTBDqlDnkmH0Grjb1vKTmMDaRElJ
         kWJE+2W50LoLD9jG86Cql2kEZ+19vcTzgqrwlcA6CNBA20vQGnu8UjJj0uo8SyfV7ZJ3
         iOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Fve91+Qky4XfIdzkq3rjb/VOBR2UF0t7Grvjns8qLCs=;
        b=q+Eh5Z+iyvRhStBVVdrprbbjgSWGdGZtmWiVg9Hy6OrszDXZ1mNoj+tUMw5YeRD41N
         d5zZSEF/r6hCijuaaX3vyCZ34UkOrESWb/IUP9iCDzhmPHhlPS8PUcCrWo8yJ7+yOGz7
         k5n2DCrL6g6Zj0ayzgecskO/B5U7hzlmCbTOsYHPuNsBp/y0tQlB4KjSgkDrk2ZMdy6A
         e535P4WUCMM5/E08vzg+7bvf6DzRqgeHjvIs/34gq+Q1QiSw50QVZJkes2QDGa00P4LE
         i15ZtuZMG5u+zU+FKEtvChI/6KRHTFB7VfNaru502N0LdaKVsbxxTtSk2L+q7vSCjXnd
         xVAQ==
X-Gm-Message-State: ACrzQf0tQaK9y7hjlIOLudhN36B5OzJWOKajsTnvjOeQFXwlb3Baxc0c
        YIM0blzomgmoDv1QIz6FBV/xXg==
X-Google-Smtp-Source: AMsMyM6YP8TVxHoy3axEgnVGoYsS4EQNzSiKq4LTYqCnbvPQfwpcBfxeN8Au8HHSfQFHlqq398zEiA==
X-Received: by 2002:a17:90b:1642:b0:203:1630:c54d with SMTP id il2-20020a17090b164200b002031630c54dmr36361120pjb.122.1664207868413;
        Mon, 26 Sep 2022 08:57:48 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id i9-20020a056a00224900b00537aa0fbb57sm12218775pfu.51.2022.09.26.08.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:57:47 -0700 (PDT)
Date:   Mon, 26 Sep 2022 21:27:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 0/8] libgpiod: Add Rust bindings
Message-ID: <20220926155745.wlen6eird5bryfni@vireshk-i7>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664189248.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26-09-22, 16:38, Viresh Kumar wrote:
> Hello,
> 
> Here is another version of rust bindings for libgpiod v2.0, based of the
> next/libgpiod-2.0 + the HTE patch from Bartosz [1].
> 
> Pushed here:
> 
> https://github.com/vireshk/libgpiod master

Pushed current version as v6, master is used for something else currently.

-- 
viresh
