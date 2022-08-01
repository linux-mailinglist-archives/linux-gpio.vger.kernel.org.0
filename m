Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97560586ABE
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 14:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiHAMYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 08:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbiHAMYc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 08:24:32 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D47291
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 05:05:10 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id t2so10262181ply.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6WuhWPAiH8piIXz82gIwBLbQh8tzINYE7KOowwiVmNc=;
        b=ftiLN+sDLkwI5/xjj8yvFPXyU9qnnA3w09FFv7sPbTRsyIuqpd5wbAZyKehKffR825
         CPIb7OCoLXT0WzNwmC33//MA3NLl5k0WW9DBUxW2F3LUaBuHkJXmVTXtIesEQ8MXq650
         WRMG6Ii6h3Ouk9lsA/TVL3dB0eSdmPDmUgl3fsr3teos9mvJXQHa0FjCm2n0PhHS0fTV
         s8qN0yG5ZkUsnBeFhnpmeQlxvMt1lRJzytf8jJQRkdO4aSHGyvZi4UgoNwxlteX1bX+M
         80KQLcF0Ebc3Pon9XQYf4OpLa7Lw7ekysmvnJrbbzgUH9UrcYmtkmd//3vhSbuA0+jtO
         cc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6WuhWPAiH8piIXz82gIwBLbQh8tzINYE7KOowwiVmNc=;
        b=MC/BIcL0UjJzY+uk89r1j425K1RIGygqf5I66lbtJ89N7m0F84DZ7ajfwsZ5kZvkWV
         QZak9NCDZdyawXrZwMGdoLcXIYkk0oDw76tzpryMCQawcEXx1wFcso4IU2u5S9+REtVn
         tg2VyN/kFlL4Xaz7PbXmytm1UoFuXk4hVICIxsKL6b1AE2mMTvl+05kl2myKO+JVeKVc
         kuQ4eohxOMdxYXkNI4zjUm4u4TL7ElNe2EtuMGNSRV99MaEF6f1SZyIpxN5PAtx/rz9A
         w3t69/4TaC76TUoEEZIQkx5sOwITBlV65xXg7nC5J5AtEN9/azVsdTvd+6o6+jbpSDt4
         n0gw==
X-Gm-Message-State: ACgBeo3t1PdZqdpFPIG/wSa7FStGkbgds7awmDF9iIVDH3pN25iALeEY
        g0KMkJSHjic5yNDAgJg/vI1Uaw==
X-Google-Smtp-Source: AA6agR7ezxxfX62Oidda+nWCV78DrI0pDECXjqnUeI/+gM/LB56F46Bt9D/OoqnWqosGNyEKKUYqzA==
X-Received: by 2002:a17:90b:164b:b0:1f5:15ae:3206 with SMTP id il11-20020a17090b164b00b001f515ae3206mr1201890pjb.140.1659355509293;
        Mon, 01 Aug 2022 05:05:09 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902c65200b0016d83ed0a2csm9367781pls.80.2022.08.01.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 05:05:08 -0700 (PDT)
Date:   Mon, 1 Aug 2022 17:35:06 +0530
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
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220801120506.46emxdk7qk2g2gmf@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727100809.GB117252@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 18:08, Kent Gibson wrote:
> On Wed, Jul 27, 2022 at 02:37:01PM +0530, Viresh Kumar wrote:
> > On 27-07-22, 10:57, Kent Gibson wrote:
> > > On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> > > Consider modules and namespaces rather than lumping everything in
> > > the gpiod space.
> > > 
> > > e.g. gpiod::ChipInfo -> gpiod::chip::Info
> > 
> > The modules are already there, as file names. So what we really have is
> > gpiod::chip_info::ChipInfo (yeah it isn't great for sure). But then it looked
> > tougher/complex/unnecessary for end users to know the internals of a dependency
> > and so I did this:
> > 
> > pub use crate::chip::*;
> > pub use crate::edge_event::*;
> > pub use crate::event_buffer::*;
> > pub use crate::info_event::*;
> > pub use crate::line_config::*;
> > pub use crate::line_info::*;
> > pub use crate::line_request::*;
> > pub use crate::request_config::*;
> > 
> > which puts everything under gpiod::*. I think it is easier for users that way.
> > The modules are fine for in-crate management, but for end user they shouldn't be
> > visible.
> > 
> 
> The main problem I have with putting everything in the top level is the
> generated docs.  You get everything dumped on you, so all structs, enums
> and functions, and it isn't clear to the user what the logical starting
> point is.
> If things are tiered then you can introduce them more gradually, or keep
> them out of their way if they are unlikely to use them (e.g. ChipInfo,
> InfoEvent).

I am not sure what to do about this. I was suggested earlier to dump it all at
the top level namespace so it is easier/shorter for users, which also won't need
to know the internal namespaces/modules of libgpiod.

Looking at structures, there are just 8 of them which are exposed in docs now,
which isn't a lot really. And then we have 12 enums now.

-- 
viresh
