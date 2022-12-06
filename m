Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93420643C02
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 04:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbiLFDzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 22:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiLFDzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 22:55:06 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D77D15809
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 19:55:05 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id q1so12265511pgl.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 19:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c3ADJD0+OwiHt0wJC1d6WaGSqUfsEIsbT0nZUqOO5TM=;
        b=c50gxaNs+w1KCW/3KZ+Gb6xaccFpAHKJJ5OpRiogNboa8v7nFhCBikDQu+ACwbqdx7
         OODcpeB6AJ+3dNR/Ke1DF20PsoKFcWJc8A3ZlDI4r6IXm1g6e9j2RX3dIVxyyUdpoKWY
         4lj6EB7IxhVxX8Zbh/yez4qB/2s8B0VG84uzZv7K8pd+fD2AEn6MoRj9QzEZcG1luqhD
         ZOYJQMK7vg45vuf4nMmdYshDv+YNK3/8Y8NzvwHhQl9IxyCYDzwCgx/9E1XlzHipS6gK
         TgILhne4MDo65GwCAJPyqp9cRQZJc+Bs+tpLdWsC3XVI/Eo2Wyrt8lW58n0w25C9GOQ3
         swCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3ADJD0+OwiHt0wJC1d6WaGSqUfsEIsbT0nZUqOO5TM=;
        b=Lz0PEpo+rUZSZf17FFw/Td8lZv5Lm6Ti8uWLuoxBUpgp88jP94JGoID4eM3xMK6BgM
         aBqPDfrZwlTvUcvKOXITNKwRqpSDY7PgMcN/W5j1FDFJVWMWB+BrkoO4BM/7lUcVpHU1
         xD2m7Azx96s+woJhBb9S3LtN38tK10vGnxX07LJiV2Xo51IGB48jp45fnd/t08LdknsZ
         y7jCj1uPkrJBeULoLajGQFSu2ABdUI0raFo4iyLCXgM23s/xN7fLWacrwpCVkVHSm+pd
         kqaT6nszGcLLedMdeOLK+bK+u0Jbpt8WeeIHSPSvlTfeKZzM4gnq+q5KFfg51fLOGwiZ
         lQFA==
X-Gm-Message-State: ANoB5pl1MvgMH2kvxeBvS6pU2M08T33+izrD4pTmuRBvaxwtfSnTlI4y
        pVMqHjS9HA2uKvSJ4P33otg=
X-Google-Smtp-Source: AA0mqf4jadNEfhY2m8Gw8S6ecLjhzjcFPUsvlpxWQv8uX2q4m//Vwis4a7fQAiY1kgqZVer3ZZO2oA==
X-Received: by 2002:a63:e510:0:b0:476:a862:53d2 with SMTP id r16-20020a63e510000000b00476a86253d2mr57542826pgh.163.1670298905092;
        Mon, 05 Dec 2022 19:55:05 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id y184-20020a62cec1000000b00576c4540b63sm4049436pfg.12.2022.12.05.19.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 19:55:04 -0800 (PST)
Date:   Tue, 6 Dec 2022 11:54:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to
 meson
Message-ID: <Y469EqS544Klls+5@sol>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7>
 <72c1c5ef-8cc4-4ff7-9048-c9095e930e83@app.fastmail.com>
 <20221206034034.wranm36qjdd5ueqp@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206034034.wranm36qjdd5ueqp@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 06, 2022 at 09:10:34AM +0530, Viresh Kumar wrote:
> On 06-12-22, 10:56, Andrew Jeffery wrote:
> > My experience with rust is (unfortunately) superficial; the meson
> > conversion achieves the same outcome as the autotools integration (runs
> > `cargo build ...`). If that's enough then I don't think there are any
> > further issues.
> 
> That's all I care about at the moment. Lets see if Kent have something
> to add to this, else it looks okay.
> 

I've got nothing to add - calling cargo makes sense to me.

Cheers,
Kent.
