Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F102D71438C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 07:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbjE2FDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 01:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjE2FC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 01:02:56 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6631FC0
        for <linux-gpio@vger.kernel.org>; Sun, 28 May 2023 22:01:04 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d604cc0aaso2298109b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 28 May 2023 22:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685336463; x=1687928463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGgEJMfq2VuMU8bqbjK9WgB2xWRf9xPPBmHZ+ISljko=;
        b=AyCMGx4+ZlPCA9Pa+qo/dEO2vLt/V9gRIcY2bgkAv9fjo8xHnSs0VE3FwbB0WmCYoa
         BBeIoYPO3MqojZWW3qGKqwmo9Juq+lpt1j7gYhAJr119zxPzwUUmkScO7yis1tGfd5eQ
         U4POkN0FTW28TgDBjvNQWQRb+tww8BsAX6xymNUiqPquHq13HvHOK3PtEXjmcn7IPV2i
         DeviAM3zG1pEnPA2mskZhSwCoAwNWy1ExiGR4yipaeajp2gfALLJJCiJDLcVYauKi87x
         6DllOeds6P8Ojtd+CTVVRt6rbj8y0u72DAeSUV0vrGtGIvdoP5MPwv/rdkmdN0qGR7XM
         fLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685336463; x=1687928463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGgEJMfq2VuMU8bqbjK9WgB2xWRf9xPPBmHZ+ISljko=;
        b=WICoePK3Od5bDDqxIILSV1e38rRa7picYrvbLDgYiHtaH/7JEQWqSiY5bNH6+izp22
         2uTMvffaSXG0UV+mWFVBqPHMBwM0pb91RjsunqeATLsD2UteACVHWt54u9RctAN7BHbw
         gM9yFXmm/1O5vno7g4QDmYIStbQVT0jjZEHSTrAPgrKuCp+w3MX8tfjPQ7BbyLzQlsSU
         JuQv7yofbHH/dNOazbMQZcPfLsZUwQVwci5FSjyMOt2twJTuGUaAAz/YT+QJmS50fR26
         ROhwcmpMreCT2e0Zqw1eaxJAOQgonNOljCasAri52ijysSMUcsN7idczTthCaemrmyvQ
         MxUg==
X-Gm-Message-State: AC+VfDyQ3rKfmlX/mB/lgw+JdFTBF8dgrwryHkKP/2cn6Q529XJoS96y
        MMhSaRp4j7OsHz3BCExP6Av+jQ==
X-Google-Smtp-Source: ACHHUZ4O2mSraAR74HTYVP/D/FfQTORPQy/ACw1GA5DlRrgwVE49euq4DHWcchk7t72fDlKbj9g4sQ==
X-Received: by 2002:a05:6a20:3952:b0:10e:5c1f:660f with SMTP id r18-20020a056a20395200b0010e5c1f660fmr8926026pzg.35.1685336463140;
        Sun, 28 May 2023 22:01:03 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id s11-20020a63e80b000000b0051b460fd90fsm6192951pgh.8.2023.05.28.22.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 22:01:02 -0700 (PDT)
Date:   Mon, 29 May 2023 10:31:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod v2 0/2] bindings: rust: allow packaging of
 libgpiod-sys
Message-ID: <20230529050100.vgrzdcawkqcbehea@vireshk-i7>
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26-05-23, 17:27, Erik Schilling wrote:
> As of now, the Rust bindings are only consumable as git dependencies
> (and even then come with some restrictions when wanting to control
> the build and linkage behaviour).
> 
> This series does some cleanup and then proposes a change in how the Rust
> bindings are built and linked in order to prepare libgpiod-sys (and thus
> also libgpiod) for being packageable via `cargo package` (which is a
> prerequisite for eventually publishing to crates.io).
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Changes in v2:
> - Added wrapper.h that I forgot in v1 (Thanks Viresh!)
> - Rebased on top of the commits that already got merged as part of v1
> - Automatically set the right flags when using `make`
> - Tweaked the docs (setting the flags is now done automatically, so it
>   is not as important anymore)
> - Link to v1: https://lore.kernel.org/r/20230522-crates-io-v1-0-42eeee775eb6@linaro.org
> 
> ---
> Erik Schilling (2):
>       rust: bindings: turn SPDX tags into comments
>       bindings: rust: build against pkg-config info
> 
>  README                                |  4 +++-
>  bindings/rust/gpiosim-sys/README.md   |  8 ++++---
>  bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
>  bindings/rust/libgpiod-sys/README.md  | 16 +++++++++++---
>  bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------------
>  bindings/rust/libgpiod-sys/wrapper.h  |  1 +
>  bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
>  7 files changed, 59 insertions(+), 22 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
