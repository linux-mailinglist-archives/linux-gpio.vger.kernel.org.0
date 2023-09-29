Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE27B30FA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 13:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjI2LCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 07:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2LCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 07:02:54 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA171A8
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:02:50 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso105852545ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695985370; x=1696590170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KPRjIEdGg0i0OVZ8h8IIy6wHhN76VDJQS6bQ9Ci5eFU=;
        b=rNY5AzoNMgCkgDxm6zMIWOoubiKu4Wx1eKW8bQD9OE+pzq1W3zh41OrJSwjzPNQ/K2
         kLwt9bhUxwYGNu7D7Rw8W6m+d+AKOORby2qxlErT10Er657hzIvZZPN6db28MnSx9LQF
         8bz2YY7m3iRQYmnqCI9l6jurmEhdKupKPjKrXm3Tx6w7zmF8ftM06Q8UTLwSkksCEIXB
         61R1pQ0OFitFbN9gu1vutoLx/15pNmC/V0P2HBfMwOYbDP9/9DFzAWLfmV6n5fbemOFF
         +tmwCIRldx8bZL4hY+EdUm0l+f5QYBUfeRJCO+kPgr2PQnGfGXyD7l9VDq5PiQt+7hNz
         stlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695985370; x=1696590170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPRjIEdGg0i0OVZ8h8IIy6wHhN76VDJQS6bQ9Ci5eFU=;
        b=na6HLB2SyPf3rbZJHfbf+KpHLEhTKs4NF8y1v9mgk1/og7cacAY6NgzIQRnFqxoW04
         l8XunyrzZcpPvSRKtt3WjBkwf/B+hT6hzXM0p5toVaWXOZ29xumQYlftmpWW5Ob1jbUS
         wB9I7UIsgUN7HEV/bcvQpdEcqTLEAppIooeZmhzWckga+156i/owgokGM+xRF8Yqhvq7
         MraO+QhGljnWgXd0/tXfChL1Ew3F1jKc8s65BLHE1f9GOCoOGwlQyJfFyMj3ojPHi+xM
         evZtYGS3Ie+ZvyB0dsajHPfY+W/FwoafVB30IB0qw+lPcN2xEvutAPg2+oTmqhf0L87k
         eU4w==
X-Gm-Message-State: AOJu0YzkcJm5KU15V6izbkCHTJvUySDOPrALUxh1ZQ+jFsJ/cBcHaqpm
        0wD+3DQ04Uo2XNOFLSGKRHG8ng==
X-Google-Smtp-Source: AGHT+IEVj9Ox/qJTWJL9Ffcn6hmvyoBq50qUfMvqMF9Rw0IiVT4496hh+Mf1g7SJiIAPLif0CXr1yA==
X-Received: by 2002:a17:903:25d4:b0:1c6:112f:5d02 with SMTP id jc20-20020a17090325d400b001c6112f5d02mr3113935plb.55.1695985370132;
        Fri, 29 Sep 2023 04:02:50 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id j24-20020a170902759800b001c5f0fe64c2sm1044030pll.56.2023.09.29.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:02:49 -0700 (PDT)
Date:   Fri, 29 Sep 2023 16:32:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info
 modeling
Message-ID: <20230929110247.5bfkyh5xix2i5akp@vireshk-i7>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <20230928112733.nkzirzdcdirmxr3w@vireshk-i7>
 <CVUJTBQZYN6B.17WXH28G8MKZ2@ablu-work>
 <20230929103915.mkq5hbzmks4rhykh@vireshk-i7>
 <CVVCJRMQOWE2.23245F2VB5792@ablu-work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CVVCJRMQOWE2.23245F2VB5792@ablu-work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-09-23, 12:58, Erik Schilling wrote:
> I think staying with `&Info` keeps the API a lot simpler (and this code
> simpler).

Right.

> >
> > > We would still need to cast it the same way. One _could_ write:
> > > 
> > >     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {
> > >         &self.info as *const _ as *mut _
> > >     }
> >
> > Can we use deref to just do this magically for us in this file somehow ?
> 
> Hm... Not exactly sure what you mean here. Do you mean a `Deref`
> implementation? That one would leak this implementation detail into
> public API.

I was thinking of something else, not worth it. This is fine.

-- 
viresh
