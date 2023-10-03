Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E24E7B657E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjJCJay (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjJCJaw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:30:52 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47454B0
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:30:50 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-692c70bc440so499996b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696325450; x=1696930250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XDNas0x9E0bp93jVe3CDmv/Iu7HIhUVkP/fN4F6qL4Q=;
        b=nPMcj7QaR0362wmitR+OZS8Y/8nzqpbYRsE0i8syFtdcbdOGUW5lUuIR8Txbnvx2MD
         EG0rdW+DPJosbl4VQc6Z/Lols4tUAbTM0Pv/22qREvEyE1xy11h0psidAxmwQUtVonLl
         OHuZuKYwIfoKdqpPRC9Ik7aZ+/5/D+4kzHjUNTTi6UVsN4+4C8pgpoA2UoDJr9J94TcF
         pT2ebNgMsuPhdZ351Aywp18aQXWor+4+TJqg35jH4JiA9pf8Ra/1zjQrZdWB2DwfYtrh
         ozYzmKo+QaDR3xxwlpzo1WBkjhe3k/m7D1NVaQEKz46D5u4kykZmvOdr+adSPgwMY4zc
         prGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696325450; x=1696930250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDNas0x9E0bp93jVe3CDmv/Iu7HIhUVkP/fN4F6qL4Q=;
        b=oTAzcBonuX7tZ2IUaG6mMSNhki94MvRniS46vVLP+LbA5rbE5ub7x9v9+A+He8OU4B
         w8uBQd6vJfjs2HON+4FbJNAOrbcAFMR3rzejwC+KcKVnB1vdeMHhzthuhYmd15Suh4Es
         BLxGUn8tkP+zA7UhIshhTZWHbVn+TV4pXaGMAf3LL0EzWqlZeD0qkE19yzsiUW8Al2kb
         v0XjH126LSy3PH38JFu18+94yCAQMEoGTPNnc6zzFjSyqB3nhsb5NkueJIPxh9iB3CXj
         m54JDTfDxDxjsu4kOQXV/ybjsjTV/+t1opftoT7tbEyuKAaqXOUyln/WLsmWQYuLN0XJ
         8HnQ==
X-Gm-Message-State: AOJu0YxwvgPFk+m+zaCsLqJzRBfVc84UBCUmozKS49AcIEyP800cU6uW
        j4KbeYKKrfvMrxq3F8qz7LDJFbrrHeRGr1bd8fk=
X-Google-Smtp-Source: AGHT+IF/CwOdqWSRFSMicgquGJfFu17rw8W99v9ZEm5CqntY/Nks1qderlvOYCHz9Cvx6T3VS7HQnA==
X-Received: by 2002:a05:6a00:3a1e:b0:68e:417c:ed5c with SMTP id fj30-20020a056a003a1e00b0068e417ced5cmr13392862pfb.32.1696325449720;
        Tue, 03 Oct 2023 02:30:49 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id f17-20020aa782d1000000b0068bc6a75848sm902243pfn.156.2023.10.03.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:30:49 -0700 (PDT)
Date:   Tue, 3 Oct 2023 15:00:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH v2 1/3] bindings: rust: fix soundness of
 line_info modeling
Message-ID: <20231003093046.r5xen5cfdoqbu3yt@vireshk-i7>
References: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
 <20230929-rust-line-info-soundness-v2-1-9782b7f20f26@linaro.org>
 <20231003085845.5ldq3ghwez3impyx@vireshk-i7>
 <CVYOWM37OR3Y.3K4VIOR9A0DPG@ablu-work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CVYOWM37OR3Y.3K4VIOR9A0DPG@ablu-work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-10-23, 11:17, Erik Schilling wrote:
> Ah, I posted some weak opposition against that in [1], but failed to
> mention that again for v2. I mostly disliked `Info::from_raw()` being
> not very expressive without peeking at the type definition. But if you
> feel strongly about this, I am happy to change it.

I feel `Info` and `InfoRef` speak enough for themselves and what they contain
and I don't see a need for the routines to be named specially anymore.

> I would strongly vote for `from_raw()` since `new()` sounds like it
> would create a new instance, but really, we are just wrapping an already
> existing instance here.
> 
> So... Shall I move to `from_raw()` or keep
> `from_raw_owned/non_owning()`?

I like the simplified version, i.e. `from_raw()` for sure. Unless someone else
have an objection to that.

-- 
viresh
