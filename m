Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FAA582302
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 11:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiG0JXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 05:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbiG0JXX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 05:23:23 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B332B608
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:23:22 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a8-20020a17090a8c0800b001f30e4c002bso801746pjo.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hdTkdKgJo2IBjh6wkYqjh0RwlPtyVGj2lzibLh6VWo0=;
        b=K0AYIQH1TDgnwbKkQe6VV6FDnmdIATDCWHmCMoKYTihifLzHcttw7WLQu2pJ86ZBdB
         EAr8MSliLN2gD/Bqe0qqRHlDNDtH7Xv8X8GgN5n+uvhGn5hW0vFx1qlt4lAT+UZe+tTL
         kHWn1gyaYe72ppUiP2etckhRUc0Y7Emu5sy0mrsPafb8OBmtaqwT10ecDZRoW8pqPUFX
         5oo5ju3YDPnLrLlJTvm2ewrP997dy+7A9yWpUq73WbHIUh2mz4aLt4+iKfI+JI0lA3IM
         qNGkZ1HoSxpEWHnCDFarbNCB6MLsHK02hFofPaBWKpMApcnXIlArWDi2+NyZLRbkzdl6
         3s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hdTkdKgJo2IBjh6wkYqjh0RwlPtyVGj2lzibLh6VWo0=;
        b=rvzmX2QH+YqaFa4kJ385s0NoN7eDCvtc9RqAC/CsjKPPdS3u7hv5SAib+3uzdoY0Jo
         wOuhG0vahF4VrsQU1IhvGtmOIRQq1L3OXaHgA9No2j3dQhMa+V7xDrbrfWOW6Nfir8v3
         F4pniiPU4829DSf1r1VosBoiODOiDAOQnPnKl7AKRrEB1SmNV92Fud/FMMJuh/FCkuQM
         SWVXgtFAv2iZYPA+mzihiFXyR4gopgwM+0B5b2bmrjB8qzJmxHi2uEI9ZoN2NBFAyh1G
         9cmmg81axqIZCPAGiDXN6LJyyegDxunq5BUg470TXxmlOJx2NlP0coPydbQGtOOXlZeV
         aBLQ==
X-Gm-Message-State: AJIora8Dd5eVUaN11QQe/Gcl3P6Uq/5pafr2d9hSjATZ2sMjytZSMoQ7
        HHGywMf8PMmqHP/fs6aJLZkB8Q==
X-Google-Smtp-Source: AGRyM1tN4/RKJRcgZQriRlVbhE3ejWwCB521wbCdDqJQCTMvGjCbyT0pg3Czp9H4zYi1wMsnWhAGXA==
X-Received: by 2002:a17:902:f68e:b0:16d:784f:a7 with SMTP id l14-20020a170902f68e00b0016d784f00a7mr12975976plg.72.1658913802254;
        Wed, 27 Jul 2022 02:23:22 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id y22-20020a170902b49600b0016c5306917fsm13138448plr.53.2022.07.27.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 02:23:21 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:53:19 +0530
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
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
 <20220727025815.GE88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025815.GE88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:58, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:58PM +0530, Viresh Kumar wrote:
> > diff --git a/bindings/rust/examples/gpioset.rs b/bindings/rust/examples/gpioset.rs
> > +    let rconfig = RequestConfig::new().unwrap();
> > +    rconfig.set_consumer(&args[0]);
> > +    rconfig.set_offsets(&offsets);
> > +
> > +    chip.request_lines(&rconfig, &config).unwrap();
> 
> Wait rather than exiting immediately?

Wait for what exactly ?

> And, as mentioned elsewhere, add a gpiowatch example.

Will do, sure. Any existing example of the same will help though.

-- 
viresh
