Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFA457671F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 21:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiGOTIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 15:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiGOTIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 15:08:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3943547B86
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:08:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id mf4so10582711ejc.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O5a3X9t1YrWJsZx3L00IG78+SlnOyUJczxU07YDKJPw=;
        b=YBzgMZfrk4mVRpuVuBjy3XuvoukgJ4MNN+YkXOQxxwYJtJAcU/3y/Gd3+enCSb7YIu
         lha7AW3/dNgDTRpYAFhD8TCJQXlAq5py3RcU2LPLBK793g9aa+Km+gdUvEPh39SxJuyK
         yP2ab6ttwZHhtr4Nm9vbKB5ULnKVYuV9skkoNfzROJrU1EfOfiZ5ZEhOWo3K7VxgDB+2
         LzqPubrBNNWWzeyHvrhE5F94Q0aFKPHHNvvyrOeeFP/CPBIbp0VPShuG9V2rRGON/MyB
         /dimrXgP4HAEmofqW+xuCGdTP37maTYgq/c5gcoR2BIfTXkFaFP9s110yeOZTtO/96lI
         w6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O5a3X9t1YrWJsZx3L00IG78+SlnOyUJczxU07YDKJPw=;
        b=dDdwTZjCN63bh7oK0slY0i8ZSsoYR88wiQwC4s5uBpEvc0xn25xuyUVOu1gf1yUjHx
         O+itpiTSR3ebPC2jgOLUPmGZQyf3JFUNE9CMQqw00iWzgBkMH/wGqipkDS9ml5PJsPBz
         NtG6vS0WUZ0OC28NJE6PaE50UQvuU5WDNwxrk8F4JQEKtpRP68yduAEEhIg9Koc8bvln
         JnZiwMtTur7RZN7o2+kyytHTBkbIQNwldQqZtXYLr6dSSmYZ+wcv+PBB4+n5mgfdGbK1
         ZZ6DMI26XA4hjTi3QHcsB+beeAFqERtkW3k9YBP/LTpSZHkD8pkALuiSKYjF1R4i69zj
         zWkw==
X-Gm-Message-State: AJIora/Rp8FhvKNaGOIUUiDTqTKv6fWp6e8k8wCUzbBj4O+kqBtfko6/
        FNjixEss2pIeMch4IqMRts8+gcSYR02PAJx5GLsM1A==
X-Google-Smtp-Source: AGRyM1uCYeEPqnGx9vuu/0R1LBBBhZvQnk7Vylp98e3xI4jcDev6CFTy8oNNCNkJDDCYIUd3xHZKMCbYfUPXOe0tZes=
X-Received: by 2002:a17:907:2c4a:b0:72b:5b9b:9c50 with SMTP id
 hf10-20020a1709072c4a00b0072b5b9b9c50mr15442732ejc.636.1657912081737; Fri, 15
 Jul 2022 12:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 15 Jul 2022 21:07:51 +0200
Message-ID: <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 1:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> Here is another version of rust bindings for libgpiod v2.0, based of the
> next/libgpiod-2.0.
>
> Pushed here:
>
> https://github.com/vireshk/libgpiod master
>
> V3->V4:
> - Rebased on top of new changes, and made changes accordingly.
> - Added rust integration tests with gpiosim.
> - Found a kernel bug with tests, sent a patch for that to LKML.
>
> V2->V3:
> - Remove naming redundancy, users just need to do this now
>   use libgpiod:{Chip, Direction, LineConfig} now (Bartosz);
> - Fix lifetime issues between event-buffer and edge-event modules, the event
>   buffer is released after the last edge-event reference is dropped (Bartosz).
> - Allow edge-event to be copied, and freed later (Bartosz).
> - Add two separate rust crates, sys and wrapper (Gerard).
> - Null-terminate the strings passed to libgpiod (Wedson).
> - Drop unnecessary checks to validate string returned from chip:name/label/path.
> - Fix SAFETY comments (Wedson).
> - Drop unnecessary clone() instances (Bartosz).
>
> V1->V2:
> - Added examples (I tested everything except gpiomon.rs, didn't have right
>   hardware/mock device to test).
> - Build rust bindings as part of Make, update documentation.
>
> Thanks.
>
> --
> Viresh
>
> Viresh Kumar (8):
>   libgpiod: Add libgpiod-sys rust crate
>   libgpiod: Add pre generated rust bindings
>   libgpiod-sys: Add support to generate gpiosim bindings
>   libgpiod: Add rust wrapper crate
>   libgpiod: Add rust examples
>   libgpiod: Derive debug traits for few definitions
>   libgpiod: Add rust tests
>   libgpiod: Integrate building of rust bindings with make
>

Hey Viresh, Kent and Miguel!

Rust noob here: I have my cargo installed using rustup for my local
user but I can't run it via sudo or as root (to run tests) because I'm
seeing this:

    error: no override and no default toolchain set

What is the right way to use cargo as root? I'm hesitant to just curl
a random script and pipe it to shell as root honestly.

Bart
