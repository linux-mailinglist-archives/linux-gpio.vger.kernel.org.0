Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C107B30BB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjI2KjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjI2KjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:39:20 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514BA139
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:39:19 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso12569098b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695983959; x=1696588759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhqSFRy5KiLYeJTBFhHZCBpakw2gbPMx/COc2YlpaAM=;
        b=Bbxeo+WUlGP54lVY0jq9h7fkmT1xJxzLPaY2/AheBdPxIwCyUzG7exfyT4Sd6V0OuA
         u/FIUnisf/YaK7MBXAQ2H4jsOdYuohq+ReFhMMYo/biv+oBnKdUPg5W8Faak3bjbCW8M
         qkAvUxkCJAQYLTPv9hgQoL8vQBdq90eCPyjox/bQZIuCvdsCY5a7XG2no0ht06Sg63wp
         RsuspMalhiqKvPyGw0Vcc/gqZMjcdxRRxv7xQMSuH+qXEbWC6ENTqyj+eyTFdJ0+GCNo
         oBfwwBB8oGmzZo7l0zEWlh2C1GEHJ7Sb6D3GQLm/FyD0+Y/o97E2tTk47QzgQWbYWYEc
         xg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695983959; x=1696588759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhqSFRy5KiLYeJTBFhHZCBpakw2gbPMx/COc2YlpaAM=;
        b=vGvM5HB46AnvQY7nfGmpv5Mjj6Ov9NAWsyV8SCpYf3XvBUijLtau+9D0IRJHxPaAOZ
         Mra75Xr/qu/njT0MlqDP43J1KKyztvHfumibz3s/pHWuJ8BEhExglQ0gIyWZKqq6a/c0
         NimpNzeKhz1zc9FNBNSpPilOOPHzETC+gL8d3lT0SbMT1mpEbcNEYvvGCyuQ/x5/nn0w
         Ll2RIcOYfeaVHvEm1UecNnHZvuuwYrqTr1C8e0yIFAhH1QUJhMOyWHP5YnN9vv5tkfBi
         VE2LsiZXFUY3bXFfmoZBCX/1WG+TB3hHb1fZm+ygXhATByXTfpz4+Awlw3Cl9bE1zOuk
         +mTA==
X-Gm-Message-State: AOJu0YwmXBO/zhMJJKk1t1UVpWXzYybhnitKqiuNH6WgZMigltCJMFTU
        FvkvfKgg4tKaOIL3CxQUXqigKQ==
X-Google-Smtp-Source: AGHT+IGUCX7B20+epCHuaT5h5Ezf0tN+FjXGtQ9JZ+rMaDtswAeqO6l9B0ijyLzKr/j74CaRo04tTg==
X-Received: by 2002:a05:6a20:948f:b0:161:2cf2:75ec with SMTP id hs15-20020a056a20948f00b001612cf275ecmr3590981pzb.49.1695983958709;
        Fri, 29 Sep 2023 03:39:18 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b006933e71956dsm3829402pfn.9.2023.09.29.03.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:39:17 -0700 (PDT)
Date:   Fri, 29 Sep 2023 16:09:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info
 modeling
Message-ID: <20230929103915.mkq5hbzmks4rhykh@vireshk-i7>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
 <CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-23, 14:27, Erik Schilling wrote:
> On Thu Sep 28, 2023 at 1:27 PM CEST, Viresh Kumar wrote:
> > > -    /// Get the Line info object associated with an event.
> > > -    pub(crate) fn new_from_event(info: *mut gpiod::gpiod_line_info) -> Result<Self> {
> > > -        Info::new_internal(info, true)
> > > +    fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> > > +        self as *const _ as *mut _
> >
> > What's wrong with keeping `_info` as `info` in the structure and using it
> > directly instead of this, since this is private anyway ?

Ahh, I missed that it is not *mut anymore. Shouldn't we mark it with & as well,
since it is a reference to the gpiod structure ? Something like ? (I must admit
that I have forgotten a lot of Rust during my long absence from work :)).

    _info: &'a gpiod::gpiod_line_info,


> We would still need to cast it the same way. One _could_ write:
> 
>     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
>         &self.info as *const _ as *mut _
>     }

Can we use deref to just do this magically for us in this file somehow ?

> But the cast dance is still required since we need a *mut, but start
> with a readonly reference.
> 
> This is required since libgpiod's C lib keeps the struct internals
> opaque and does not make guarantees about immutable datastructures for
> any API calls.
> 
> Technically, the 1:1 mapping of this to Rust would be to restrict the
> entire API to `&mut self`. One could do that - it would probably allow
> us to advertise the structs as `Sync` - but it would require consumers
> to declare all libgpiod-related variables as `mut`.

-- 
viresh
