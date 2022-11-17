Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA68862D931
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiKQLQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiKQLPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:15:55 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A629C7B
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:15:55 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d192so1494840pfd.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2AxnSCxxm4Ad4Ygs0iOonWA7XhN/csC5CmhxLhU/Qw=;
        b=d+NXM9VREQX16pIV5AezDkrUE6CUR+q1R+8vasoYQ3l91VpCmSpAtLmSkWJN/XJC7V
         JfJgGV5gV8xIuDbROr0fbGU66F1K3oiZQmxFETJ7PGaDkI9bYFLrcw+Z2bJNu4qmowAL
         GeewOhnP3khB5oybplKsvSR62+/CLyJyFYemTAgCuUCdCMO0Y4rLIOlsIWXbBALtjlla
         bAEMg/yavWQiE+JinO0iSHwxk0SdseS6YGqBRyPUJHsTE24Btp4ou2tjluBuINdyNnxP
         G2/lYa3fraTzRZRSPKd4gHJXKbLotwwCue0P7/TYxaKix+LcMhD4a2dtYddk2v9zgba9
         8fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2AxnSCxxm4Ad4Ygs0iOonWA7XhN/csC5CmhxLhU/Qw=;
        b=O/lqU6kHBv3pEbcpE9n3FXsPF/qJarfKWzGeSZ3gbJMBMV7cskMYMFvAEUR4iOwBWW
         exRx/8lYMvl17lR/qU2g/uROBnNGF8Esv3LtxL0clKuFXKX4xmDXq4Tdpn2pHjatBiae
         WfnCmTbEZqxmYoxMO9sRCEQ8SYxg39gnt4L1RWDXEYg7X2j8UHkmBFBb72atI5JlFVEL
         mQlfDO7bo5m7jq7xor5gjGtkGCBedWwBpfOTKqCOP2OsfRPJjRAgbxAhT4WW6VHEapAN
         M0XiiDxKBs4E0K/7xYPpW7UMb/coaboDZ6NWvoN33EeHM+dMkhRDUK+qHV4t6C51qOU2
         6huQ==
X-Gm-Message-State: ANoB5pk2EkwdTBFV59SZY2OiM5yiqsFd3ynDto7qYZX2nkzKoMBgnvY0
        ERLbdto6fPIvAtHH72fd/0zLCg==
X-Google-Smtp-Source: AA0mqf4KmMf3ii0UmHErq6Wn7PJWdrq0t1CF50SvmBj0+kyWt6oxg40O0+FJnDBU8HWIngaYybo6Zg==
X-Received: by 2002:a62:5281:0:b0:561:efcf:1d21 with SMTP id g123-20020a625281000000b00561efcf1d21mr2432434pfb.68.1668683754814;
        Thu, 17 Nov 2022 03:15:54 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id 22-20020a621916000000b00565c860bf83sm816095pfz.150.2022.11.17.03.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:15:54 -0800 (PST)
Date:   Thu, 17 Nov 2022 16:45:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221117111551.4w7zp6wfwwirps2t@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <20221117104006.wvpuenedh7wqsjjj@vireshk-i7>
 <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
 <20221117105534.shhm4ib2aukj7d3e@vireshk-i7>
 <CAMRc=MdYuxK3cPHy=N3M2tRgu3y_ZQD4BJtBPy323s=9Uq3tUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdYuxK3cPHy=N3M2tRgu3y_ZQD4BJtBPy323s=9Uq3tUA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 12:05, Bartosz Golaszewski wrote:
> So it already only impacts developers exclusively and not users who'd
> for example want to install libgpiod from crates.io? If so then I
> don't really see a reason to keep those files in the repo really.

Users are impacted in the sense that they will be forced to build the bindings
using bindgen now, automatically of course. It is an extra, time consuming,
operation which can be avoided. For rust-vmm projects, every pull request
results in fresh rebuild of the entire crate, which would mean two additional
bindgen builds too, just for gpio now. It isn't a huge problem, but it is time
that could have been saved.

> I'm not familiar with rust-vmm containers but the fact that bindgen
> support is missing or causes problems sounds like a problem with
> rust-vmm and not users of bindgen, right?

Yeah it can be, but IIUC, in the Rust world, more often than not such bindings
are pre-generated, as this basically is Rust code only. These bindings will
only change if we make a change to the gpiod API.

Perhaps that's why I was asked to avoid generating the bindings there, but I can
ask again and try fixing the rust-vmm containers if it doesn't work.

-- 
viresh
