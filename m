Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DE458698F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 14:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbiHAMEU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 08:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbiHAMCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 08:02:44 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1766558F3
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 04:54:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id x10so9527661plb.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wY0U5ljlR4Eg1VTSH6AENPMiR8VIiS9bYllC6WC1hJ8=;
        b=zyUE8FySoU0wLwSh8vDA215/7SZ5nyI5C7x4534hQwBJ5Pk3K21NhEUHj5VVyhdvHP
         0mfks0/9ixBIRg1E+hwMv3Bn8xGPqHs1F5r51q++3nFH/nxKY3jx0M8oHkfa8n0yOmaW
         mz+bQ3y9wB5m+RbNC2ofG0xtN3Vp01b4IwEercdi+yZ5LKdKXmJXH4Lfpvph1BvcABLK
         EG8mXHXVaaVuUIRnV4SINuYhx33+F6RAhaMvSGjuS8GIhDmnVP1zgF4BIdIxC7+35v0X
         eOL9Y/5wEiaL3TMtl3gYuX9tHXpJ1+BznO0gs6QWUAuIgTB2GW/+KJyhNSqkD36wjlcG
         mdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wY0U5ljlR4Eg1VTSH6AENPMiR8VIiS9bYllC6WC1hJ8=;
        b=iJNLwEnb63RyDSY1O8/8/Ctf/QKhtE83f/AUWw556zA1/TuzEF1oPleeduP282ULj0
         RDjKkNZQ8Qg4ABQbp8cQCbRDNldLdbNZPZa0HVsjPnPnNk6iittCWdZ9HiT1k1Fq13bn
         T/Jvy4NMieNXwaJj+HUpY4+5yVkL6bcuX4+567Js06MMWTAlqrDMxCq9KPmjGdYUP6Sq
         1NWux3xWZhm1lf7e+ztwO+qqO3kXbPkfK1ZtPP3q0eOJjz5wCkKm6sRxHL4s/VRJrK5Y
         uFxDrPRnSf8oamqkYJZVNhN3ow+C5o0V4t5BSnkBWdY35pMDz3jYDQhWl5T7r3Awwsrp
         7THQ==
X-Gm-Message-State: ACgBeo0DIRp25USOC3z6KR3m5THN2gkFqTRz2U/eUT3vL/xZjD+E7vVk
        Opbk44YJxHltMbiVYvZ5ueZQeg==
X-Google-Smtp-Source: AA6agR5xlG4sRgsn14nq8YbD4vsVsVfkNYQTZXQ27eHBjgHaHGXMsYPp32j/54sn0AGvqI25NKieVg==
X-Received: by 2002:a17:903:245:b0:16b:9b6d:20bc with SMTP id j5-20020a170903024500b0016b9b6d20bcmr15916046plh.14.1659354844713;
        Mon, 01 Aug 2022 04:54:04 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id i127-20020a625485000000b0052d87effe9asm1917762pfb.18.2022.08.01.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 04:54:04 -0700 (PDT)
Date:   Mon, 1 Aug 2022 17:24:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220801115402.uk4gsptesrisohvk@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025847.GG88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:58, Kent Gibson wrote:
> > diff --git a/bindings/rust/tests/line_request.rs b/bindings/rust/tests/line_request.rs
> > +        #[test]
> > +        fn set_bias() {
> > +            let offsets = [3];
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.rconfig(Some(&offsets));
> > +            config.lconfig(Some(Direction::Input), None, None, None, Some(Bias::PullUp));
> > +            config.request_lines().unwrap();
> > +            config.request();
> > +
> > +            // Set single value
> > +            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
> > +        }
> > +    }
> 
> Test reconfigure() failure modes.

What are we specifically looking to test here ? I am not sure I understood which
failures modes I should target.

> Test you can reconfigure all values for all attributes (not all values
> for debounce obviously - just the flags).

This I have done now, with request.reconfigure_lines().

> Similarly for request_lines (ideally in chip.rs)

Isn't this same as the above one? I am not sure again what I should test here.

I have pushed my current changes here, if it helps:

git@github.com:vireshk/libgpiod.git master

-- 
viresh
