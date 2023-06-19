Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5928734E97
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjFSIv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjFSIvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:51:33 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD91170A
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:50:21 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-54f73f09765so1285391a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164620; x=1689756620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZXT4OapEFCw6rpREC9esQy4JP36a9HB8VK2jMJ+Uwg=;
        b=G4FP3i6NfIl/aO/rr3qngHSYzwInOwbPdwAxZXoMilXwz4tAf7llsKX/asqd/WwZO8
         1RbG36O6TlvGT1vbCqKbTwwSzTqw+Dl4/mxBhM+iNBxYUQq0Ic+/CcXZTbS5BN3viCLk
         fXz9ijgohhXaSe1Lmt1b9tJoOl4vxj+Ag5nudfcuatPxfjr0pPoiE8NCFDfgsLzko61u
         gmSwy+izc31lqOEf9NQ2ZrgnivJob9MWF5vHUlQ56DVNwQEBWhcg5ormEPUG0APfbjnk
         iaj3o+YRMkV5LQfwCyERE8ntwtqK8VcpaQouqwnX+SvI6czBSueUgK2TSREVqy/FIM+c
         0yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164620; x=1689756620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZXT4OapEFCw6rpREC9esQy4JP36a9HB8VK2jMJ+Uwg=;
        b=J4f0F4xNfD3mXpbzWkg1/lS0Nk1JtWxSKwjTCU3AnSEhDBmbxJ8kVZP8rM/RT2htYg
         kwOxfbp1HlaVsobnPyQQedxsDSQBIj/ngecDe84ezkJoNSMvDfpq2pm1nTSOjtHv8eFO
         vl4oI9/i1LFM/dnhebZH8JXfva+fIleh9S8lheo8Gb6Bm46RHy/PRHD3Y3WxO5LiGx8I
         aOXM7hpHRwFTlW/FkNndOZ5mG+SyET9zUXxdajzzSlxgGty59Wl+G0oeYctJVOM7RHvW
         SnYpeQnrYiZiCiuSEpCuzUDEjGWrnCZDXbcoFEHfTdWJF2eWmEWNJ6bz8gK2WQFAIcpD
         mQwQ==
X-Gm-Message-State: AC+VfDxETcjhkV85zdINdHALEfpVgBUzJI8zTWKv3baYITntPTQDbwBe
        EpXmaYEfB6OZ2cCu5yoaLt1azw==
X-Google-Smtp-Source: ACHHUZ7h+3D5VlsX76Xfiu3VsgKNrDMV0bAK+Vkwzs0jejkfK4KeQg7kWUao4mTLEKn6hNQo9NLu8g==
X-Received: by 2002:a17:903:4293:b0:1a6:b971:faf6 with SMTP id ju19-20020a170903429300b001a6b971faf6mr4339302plb.35.1687164620306;
        Mon, 19 Jun 2023 01:50:20 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id iy17-20020a170903131100b001b50b8439e0sm8449259plb.96.2023.06.19.01.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:50:19 -0700 (PDT)
Date:   Mon, 19 Jun 2023 14:20:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Message-ID: <20230619085017.lifz2hcqzi6fam2k@vireshk-i7>
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
 <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
 <ZJAKTdRVEwZfnKb+@sol>
 <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I missed these earlier, thanks for cc'ing me now Kent.

On 19-06-23, 10:13, Erik Schilling wrote:
> On Mon Jun 19, 2023 at 9:57 AM CEST, Kent Gibson wrote:
> > My reasoning was simply that building the bindings as you suggested
> > resulted in lint warnings, which is noisy and iritating when trying to
> > lint my own code.
> 
> I fully agree that we should fix them! I was just confused about the
> explanation.
> 
> > But I'm just the messenger.  Your question would be better directed at
> > Viresh - it is his code so he should be able to tell you why the casts
> > are there.
> > IIRC we needed the casts historically, though I don't recall the rust
> > version we were using at the time.
> > If we've moved beyond that then I have no problem with the casts being
> > removedi, in fact in my initial comment I lamented the fact they were
> > necessary.

I don't remember the versions used at that time, but here [1] are few
of the auto-generated FFI bindings that I used to keep in my series
then, in case these can help.

IIRC, some of these were required for 32 bit builds. Don't remember
the exact details but there were build / clippy errors / warnings
without them.

I am fine with updating code based on latest version of Rust and get
these removed.

Erik: Please build for 32 bit ARM too btw.

-- 
viresh

[1] https://lore.kernel.org/all/401d9417d895b8b1b19ca577c84347d89f7e0fbd.1667815011.git.viresh.kumar@linaro.org/
