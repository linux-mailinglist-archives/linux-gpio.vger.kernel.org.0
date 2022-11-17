Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF6D62D420
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 08:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239282AbiKQHb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 02:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiKQHb1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 02:31:27 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1DBF17
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:31:24 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id c203so949595pfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 23:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4WMa9yFFbIu5RoLOTXtfWkhzoKUB6nZXbr4XUj070o=;
        b=MbdT4S2H4fA4x/qsjLalXRVJYloLvA0AgPSDWwdbUquePEfx7F9dUcLggUHOD66i0Y
         KT86oqXraxHeRh/sI3TOjjSLl3SOHbweiicy1Urscq+eSk9/gOTlbDpWwu3OdyY33GIb
         WlTDeig7c8lazVGhU4dcGG3E0RnIepAxFtCNKVkTf2CXKq46hFlyuaDfYtlKjZmz5p23
         csNyMPppE6Zc+KIGW5qJItY776aQ8s/2a7uf3QCSBqw8iRBY9fdfMPo1jJIuQSecNXCr
         KQq9Kj7NDOu6ZdZaL9tG92cJ5przDZZNF2ZFABJ6p0RSX1eJ2/kFa2na3TDRCWo46I5h
         zEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4WMa9yFFbIu5RoLOTXtfWkhzoKUB6nZXbr4XUj070o=;
        b=xYCMEbSYrncFhvus+NSdeK2VCZaYJzDE4gkDGqpYSEGtlL3l6aR9+9dnQBuOzhyq6O
         mGq4QPCOQphMZ//jNc8s1qc7OBuaohQ0lz7ATnDp8iU8RvSH+mHAeVCoIl+PqhcF4XXn
         Zhl0oxasMELM4xAV0bImwHVcVAucKiXZ+0nZDsLN0co8vr21FiIssR2ZzP+0zUZ8yXs7
         4DEVbodMl8zAv/xnsUG2nS556mWeI4gFZvJe0cZayLuITllxWiug9z4urMHjRLBTZoom
         1O6wTWFATYhshdOIfDgUf3R13Me6G3ANqhAlQTsbTFUFUkNH1njw+nPdPYIgF2Ee2my2
         7Zzw==
X-Gm-Message-State: ANoB5pmra5q9BgkpSW4ug0PAJUc415beHzsr9nvIFhqS6s3fiLwdqMdH
        g6sICCd0Mjqu1WEC842bZCiD8A==
X-Google-Smtp-Source: AA0mqf6aks4kEosQPhjYhpsTs9fdZQ9Rbf533X0PZzK4oysskgAKOjaPE8RhMpIopieur06XtePHag==
X-Received: by 2002:a05:6a00:22ca:b0:56e:64c8:f222 with SMTP id f10-20020a056a0022ca00b0056e64c8f222mr1725492pfj.71.1668670284259;
        Wed, 16 Nov 2022 23:31:24 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id ip13-20020a17090b314d00b00212cf2fe8c3sm7420217pjb.1.2022.11.16.23.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 23:31:23 -0800 (PST)
Date:   Thu, 17 Nov 2022 13:01:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-11-22, 11:29, Bartosz Golaszewski wrote:
> Hi Viresh,
> 
> There are some licensing issues I noticed now: can you make sure
> `reuse lint` doesn't return errors for rust bindings?

I have fixed couple of those now, but there are few which I am not sure about.

# MISSING COPYRIGHT AND LICENSING INFORMATION

The following files have no copyright and licensing information:
* ../../bindings/rust/Cargo.toml
* ../../bindings/rust/gpiosim/Cargo.toml
* ../../bindings/rust/gpiosim/README.md
* ../../bindings/rust/gpiosim/src/bindings.rs
* ../../bindings/rust/libgpiod/Cargo.toml
* ../../bindings/rust/libgpiod-sys/Cargo.toml
* ../../bindings/rust/libgpiod-sys/README.md
* ../../bindings/rust/libgpiod-sys/src/bindings.rs

File types:
- Cargo.toml

  Most of these have a different style for versioning, though the workspace
  specific files doesn't have a version set. I checked few other projects and
  they didn't mention it as well.

- README.md

  Here also version is mentioned differently (added now), based on how I found
  it elsewhere, i.e. towards the bottom of the file.

- bindings.rs

  These are automatically genrated files, with bindgen. Not sure if we should
  edit them to add Licensing info.

> One other thing is the license of the rust bindings themselves - I'm
> not a lawyer but it seems to me that if you link against LGPL code
> statically, your code must be licensed under an LGPL-compatible
> license. It seems that BSD-3-Clause and Apache-2.0 are compatible but
> it would be great to have someone knowledgeable comment on that. Is
> there anyone at linaro we could contact?

Hmm, not sure. Cc'ing Arnd, in case he can help.

-- 
viresh
