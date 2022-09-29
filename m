Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068565EF10C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 10:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiI2I64 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 04:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiI2I6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 04:58:55 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5EA13EE83
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 01:58:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u10so978849wrq.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 01:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=49LO9KOXlQ5z0qQQQqCdbVyJW40MVbqgcdfSfBxCrcU=;
        b=WQ98pAg82F+SInoUJ/hDO0m/aYXNZw9xrzR5AF4TozeS8JZXHI2GjvVUB1/58vWuuX
         HDhzy7cJt3APMRWYv3rEbsgb7tJ6wmzFTujnVIq+ie/hxmiZaBe3+5XehcOrZL5C+R73
         8i4/pkyf514ycLY+F6zy+r8W2qdtaoxjm4mKwzoattrrbW4KYRx3LO7LkpyC3STbQ+H2
         TY207Y2ZToClJLDYl4IR2L6eOLg1XFZ6h9XPF5m4Qc95eROrrUpTcz0vkhNph7LXOvc7
         6ehdBffrDu2/xfgyEWcT3mU/0UJ6C8JUAqbYEguP2YkKn/Nrnz+oCEldicBjq1s6R5DV
         Zc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=49LO9KOXlQ5z0qQQQqCdbVyJW40MVbqgcdfSfBxCrcU=;
        b=MapkT1TbZy41ajggvaJ3tRXKutL3mGvrcQx/8iF3yRfLXKUeLIc+ZgqAtBalqStWzG
         dvaiypXg8rtUCq9MVx598iQDsU76KQO7sP5FnSoVdRVSUd7ABKyrrt0gWZd98/zIwJzb
         mQ+V3dst4GKk0mzs7t0vTWp42IQDObd7etAwm5j3B9mCCs6crJaDCYd2zzEC4Ujo3Shm
         Lea6ZJUwrSiHgjlAuIRoCuFbzONbfg5D0yOcL1UVYxx6O72It3d4Go0DGXWsyD4wjobd
         GOhuyqSiia0/LvxHtLGSbrKQdvAIiFgRj/fP7I5ggNhvEqPavMej0LuLB+FNpCsg1+AC
         CBlA==
X-Gm-Message-State: ACrzQf0PUkMVrB049Q9UYldvXHOLDDJmrdQBN3yhqJjYUW/ijU6wo6pJ
        57bjADkyQTAW5znMzEhz44Mhj9X6As/vvaHFDYnRxQ==
X-Google-Smtp-Source: AMsMyM50+y9zXkdSHRTS8tmdOEpf/G1XGPb768k4wgaTb/tkRaFDHIbT6HMpB8gw6tYcMf0UmDvoS1gor4vIOqHilHk=
X-Received: by 2002:a5d:5254:0:b0:22c:cae2:ddcb with SMTP id
 k20-20020a5d5254000000b0022ccae2ddcbmr1427079wrc.633.1664441932950; Thu, 29
 Sep 2022 01:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <20220929065409.rqilrzxaczvvds4i@vireshk-i7> <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
In-Reply-To: <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Thu, 29 Sep 2022 14:28:41 +0530
Message-ID: <CAKohpokyoQ2gE5MHLotj-QZSErKG+Ceq4Gqgq_BKqui9Y8x6TA@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 29 Sept 2022 at 13:07, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> I'm not talking about locking, this should be left to the user of the module.

Yeah, I get that.

> Can we force-drop an object still referenced by other objects in Rust?

No, AFAICT.

We can call drop(x) on an object, but as long as an reference to
it is out there, we won't end up calling the actualy drop() routine
for the object.

> This is what I had in mind - a small, dummy, cheap object inside the
> buffer that's created when reading into the buffer. Each even would
> reference it and then Rust would not allow us to drop it as long as
> there are references to it. Does it make sense? Is that possible?

I don't think so.

> Nah, just take the time off and rest. BTW, I'm starting at linaro next week. :)

Excellent, welcome buddy :)

--
Viresh
