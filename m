Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37875FD485
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 08:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJMGMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Oct 2022 02:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiJMGMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2022 02:12:10 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5971113D73
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 23:12:09 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y8so1032301pfp.13
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=paspo5T5nmRarC4oTjOcGh2vgGAI5bymzSDjKOGX6l0=;
        b=rqAX+BoDv6goOmBEn0KKNpc6mEOl1d89m6PC9QIpfK5cDb5ZsFwPzUx2niPDuxdDTo
         lRPhevq/YvUXX7cEJMdZ1paMj1HFHAWoxgCYC2ExqEUpK+rlcivRr6Ac8QKWIgOUU7ZF
         aqtjZYcQubC0cW2SLE2VPP2uy+bgDEDJAg8S0VUZkvI3t8U3v6KI/iZt2RM7MMaPH/ua
         HY25EIOMzClzhiD20HQtdUXWUYcqs7CE9JUGBEseGvSIpCZuNCK8V6e1Aw4eVBonD1CC
         nr4yerhRXtOqoBm3rH/apQmtnhRmPNtssmMneGQfxpjKtk93f9GAcJMoq0uwGLYsgtQ2
         rkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paspo5T5nmRarC4oTjOcGh2vgGAI5bymzSDjKOGX6l0=;
        b=qVXnnIfznhQ2zEpa5HGdQBl0uePJ3ovz3X9ZjQOJYFKEmouPzap2wrYeltJSO1hsYg
         XvGIV9y5VKewBlVEUfTzIqOQTyZh8HRfZrsgKLyUwr9QXiJpHSnwmKmpVmhlhFvhlJ5o
         bCsMk1RgdTOWN+WS68Ec0sWn4P2pJTBbb/PVUU5ZpfEMrwiVLYWxJBmDq3dwUCeinsRC
         OyrUYvR8PlRsy/jRB8dVbxfTroFGEme8e4LavgIIzQW5x4vLsCZaDdn4qIzu2Gm+zY/c
         3oNihsstGsi9BCTRHBFiGMRUpeVHO4Oh7z/yNpelmcHJl81+uQxwP2/Q5/0jlTBlM+WB
         zzpg==
X-Gm-Message-State: ACrzQf1mFNAWAJiS1JsatvKAQj0BOe/Ko3qExGv7HbdQ/NuO/Hp631tW
        fiUrCR5vcg/NTo6XcSUwTI7xkA==
X-Google-Smtp-Source: AMsMyM6jF52d55YbSvso3m8rbx7EGnt24n4+kvjcG0Vu4vzR9F6Qd4J6SPv6k0RbqBdy5H4fMtlTOA==
X-Received: by 2002:a63:d145:0:b0:443:c25f:5dd5 with SMTP id c5-20020a63d145000000b00443c25f5dd5mr28600892pgj.554.1665641528860;
        Wed, 12 Oct 2022 23:12:08 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id g11-20020aa79dcb000000b0053e2b61b714sm965829pfq.114.2022.10.12.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 23:12:07 -0700 (PDT)
Date:   Thu, 13 Oct 2022 11:42:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221013061204.hu2vn24g42egybbl@vireshk-i7>
References: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011041651.amibtu24kcgm67e7@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-10-22, 09:46, Viresh Kumar wrote:
> What about the below code changes on top of V6 ?
> 
> Changes:
> - Removed BufferInternal.
> - Event contains a reference to the Buffer now, with lifetime.
> - read_edge_event() expects a mutable reference to buffer, to make it
>   exclusive, i.e. disallow any previous Event references to exist at
>   compilation itself.

Bartosz, should I send a V7 now with these changes ? I hope everything
is settled ?

-- 
viresh
