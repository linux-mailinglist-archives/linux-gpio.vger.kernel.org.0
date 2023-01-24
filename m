Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7A06793D5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 10:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjAXJSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 04:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjAXJSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 04:18:21 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2383BDA6
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:18:20 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id mm11-20020a17090b358b00b0022bf61de7beso529435pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNeU/NWgSnJBhdIKQgK/dorsOz2RJxTAtkpivgH3j78=;
        b=vGy/8GhV9bDVoC9RciNMWbvFS8fze4buM22RY45T3S3t87tPJdKN6LRJk3wnkebjVX
         7Pkp5mGr+cWNZWXPQg1agr3IM3gJiTC8bZVuRqiWawxxhZo7dKWeoOMl5AieNMZifw30
         wZHUPf7fLCpX37pz+sC4eMeyC3NRxwUhHuXiyOtdd73u/sT8sXWtoNL3yGLoRFztDufJ
         /gRu7TsojcaUcm9QNgdCO6Ri5/1Bs4I5oSuCERKEyK4WwBzHqavjeZIqUa+CW2OQzv9H
         OlKEYQpCpsxqOBD/yw/a9KTypgME9u8t6r9omBa6m+OBgbDXFd/5kPqv3FYw8GSuPDAr
         oKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNeU/NWgSnJBhdIKQgK/dorsOz2RJxTAtkpivgH3j78=;
        b=zJDe3CHNlnJDnQtvsCbWBTbeGHawyyeSnT2VbAm8WNAcB/VAwH+L87DJhdLahXICYh
         KB5gE/Z64MxqnvmV6WMK8on7SHMtV/CQUBukMT4TI5Du9PlaLVYIJtgeNkCRbeN6Y6HN
         qd2239vT5P92ApINAZipi3Qzx+Z2bc6YPdBPifh9+EKlafyQi2H1t8BBfTHmDf8gdWkA
         xWC3y5gPCoVIi3vU/vgk6ZBots2GJt3Rm3/A0mQHRfJ5kEQMXK1F9/pb/8fR4yx9B9Bi
         H4W/Hx+U7RdT6y6iTBFbSFELvQbpP87cnWaUQJ7nKFN6LEpENdvhbieykQcbnWb8SE+F
         xafw==
X-Gm-Message-State: AFqh2koomEi7y6kx411aP6INvh719s25T3zc2knlk2aNumhjI2Df69pM
        S8PjWtqbKIhpka28/0Ge8dX9+A==
X-Google-Smtp-Source: AMrXdXsxc3VX2rZKzWffuZ57+DSfPumyhIzMW18gJiLs4LNclUIFvOkAcd5lEtiQesBK3e9sSrrQCA==
X-Received: by 2002:a17:90a:8409:b0:228:de0e:c8af with SMTP id j9-20020a17090a840900b00228de0ec8afmr29124507pjn.16.1674551900182;
        Tue, 24 Jan 2023 01:18:20 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id nk19-20020a17090b195300b002295298a2e4sm8037319pjb.36.2023.01.24.01.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:18:19 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:48:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] rust: Allow reusing locally installed gpio library
Message-ID: <20230124091817.xk2ssfps7oy4zhyb@vireshk-i7>
References: <3d03ede97ce0717e3f69de8fd4175407a3aa3a0e.1674548651.git.viresh.kumar@linaro.org>
 <CAMRc=MdN4BRaJ9jB0M5oyg-e_t-xq637NPq6+NCzPk8qPXXM5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdN4BRaJ9jB0M5oyg-e_t-xq637NPq6+NCzPk8qPXXM5g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24-01-23, 10:16, Bartosz Golaszewski wrote:
> I don't understand how that works very well but I trust you know what
> you're doing so applied.

Thanks. Here are some details:

https://doc.rust-lang.org/cargo/reference/build-scripts.html#cargorustc-link-liblib

-- 
viresh
