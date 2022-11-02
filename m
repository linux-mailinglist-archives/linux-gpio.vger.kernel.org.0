Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B92F616953
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 17:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiKBQkU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 12:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiKBQj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 12:39:57 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1346F32070
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 09:34:33 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id e2so9221505vkd.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 09:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rOQLda5FhJCc3ZgDmKX7cFNzYGQp7lMKfjz84whAfW4=;
        b=MQ8R97pmXxp1dk52UF62S6mwKICqh52WXMjvFUYU1bNXHz6FO6a0sRcqFDMyyjuv71
         SOwMGGCKiGoPCiWNJ5CI5VQrKn2uUX59IpYeGuWkRwZgsmhW+TEGu6Or0RcpTrGU9d/A
         H1LSRW5Rb1FmzCHfku8O2fdzwWTNjGsKhaGvrSoeMEYEoE8GyRjTvEtGx1QcofczGY4k
         /tQjnad1WXr8Xne8IC+HBzXsua/PHvzGAJu9nOuzYOtT0+1cYsab2rOe7Ahyu72gmoKx
         ZngaiqSjmRxqZJ7IXocySbI4UG9JxAFPwL6VGRJW6TANQ1yS2o4MhYgS+9YkDSWsPn/Y
         9mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOQLda5FhJCc3ZgDmKX7cFNzYGQp7lMKfjz84whAfW4=;
        b=w4StBArMsecx0Q+hcO0bZXC/+xJzWE2Mhlq9ff19ZtAK1rB84ijaaPwGhdyzqldmNU
         xadLnuFJNHyY6O8HoSEdOiLTkIpHD8a4gpKU0+ngxHvgl87uhkAyNF75vBn1JiuQ55zv
         C7fwlEbQOyp4WN57wPqWywxOHDBLxjFUyZigKxU5njwYl4Neql9pAjjjKJdmbJlJudij
         7hwV2k9H7AxHhAsUqHnJPFFwxMcxXVn4oYj28/zp1HSGaFy01u9y/NUD00DqayWjnL9L
         ltI0OBYbGQ1H7iZ+maXcUAC/FMbD5n/UppM1I9F7LQaDzOdOmTQTaeC8TmkVRvFjH5jq
         R3Rg==
X-Gm-Message-State: ACrzQf0TenXWgtNGjK9uwJOWfdUNhCCGGk/JQHynT0+iRxepReNJhZ/1
        2AQ/k4AfUGQ3SVJjaX1eQ91tN87LYYEvhtUWxhloSw==
X-Google-Smtp-Source: AMsMyM5UinHOAeOVpvCad/ZRUoqB692UkZiFYffcny254vLjpe/EAXAso0/CibxhnL0nHhrnMeLcLUBiNbG3kQi5/8Q=
X-Received: by 2002:a1f:b2ca:0:b0:3b6:e854:297 with SMTP id
 b193-20020a1fb2ca000000b003b6e8540297mr12589681vkf.5.1667406872159; Wed, 02
 Nov 2022 09:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol> <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol> <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol> <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com> <Y2JrywE5RB0Mdrqo@sol>
In-Reply-To: <Y2JrywE5RB0Mdrqo@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Nov 2022 17:34:20 +0100
Message-ID: <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 2, 2022 at 2:08 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 31-10-22, 20:33, Kent Gibson wrote:
> > > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > > support, or as his work appears to be on behalf of Linaro that they
> > > > would have an interest in maintaining it.
> > >
> > > I will surely help in maintaining the Rust part. Not an issue.
> > >
> >
> > Sounds like a plan. I'm going through Kent's gpio-tools patches and
> > rust bindings are next in line.
> >
>
> The rust bindings might make it in before they do - you may find that
> they are a bit more different from the old tools than you were expecting.
>

Yeah, I can tell that. :)

I have lots of non-functional minor things to point out - mostly
coding style etc. - that I will probably just fix locally when
applying.

One thing that stands out though is the dependency on libedit - do you
think we could make the gpioset interactive mode a configurable
feature with its own configure switch that could be left out if we
don't want to depend on any external libraries?

Bart

> For my part I'm just wrapping up a quick pass over rust v8, before
> looking for where the python landed.
>
> Cheers,
> Kent.
>
