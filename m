Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE48D62D7D5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239321AbiKQKSU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKQKSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:18:18 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F0A2AE39
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:18:17 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id b81so595986vkf.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ohHBGb4Ucg+7fR4s1/N63W3YPBGAZ0E1xYBpO7m13A=;
        b=TfgOMbEBUxf63C7q7x1aHicIHiPui2EIZ+9z2Ur8PA4OnkQ9vQSPBm7g4YMJ8swiz0
         9Oj7DcsSW/nfzAPPcPiP0iFga6rYmwHEAtMlg6sZv0ykwDNllw9yl2O0NLwzubhpt5Sr
         tqcUy6e/eYbQg/f15l9jgDyTCb5N05UQl2YN8J5NJLId/BMfWLPnG5r3z+9xf77Kt76L
         wZIEVrreyWlQ7zFu15JntW+d64LsfeSjVju6qYWtGVrHgX7pXhex8nwQIaMPIpP/LXJX
         VIbvejWK87sK+5MdZk5cLKN8oF/PRDT4AYGnef1w5onv0V0RKnRZTnYD12xqIE+r+mCG
         zA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ohHBGb4Ucg+7fR4s1/N63W3YPBGAZ0E1xYBpO7m13A=;
        b=1kwp4PuoAUv3YU7HW5OZEc8LKuBbTmvnQ77N6hq+u98/JZTahD3+uftLCR9CMonobi
         hwVar7rDR0cvydDIeKEmKiFe4D7+SNwxYpUCNAXaZkgTvHUufnMI+jTHzx8mc1DRkEAC
         C3bRqUcP+9Os2tKKHu0qnQ23XF7KAck2LXR4fq9x6mxH+n+f7tlIX7r/OIJYC/2O0OYj
         RuJTFCr3s8U3YDzCdPOfwMWpWPE6TOgQF6BURYLhdQabqgLjl5jSYnRbMcEPjpdQaeus
         t3Jj8hXnA/3jp3IaDZBYjVu+5Lfyww0K2UhyXyl5TgMjs9PTRKXb44qfA6G7oan6SCh9
         OmXA==
X-Gm-Message-State: ANoB5pktNDn0I833wBYASI55C2F9dcltQjKgiPSScbQGPmbglVooT6Xu
        nBjQL67IoztNy4DAlMk9DeMx0L7eFAS0vGKbyBsak669WZo=
X-Google-Smtp-Source: AA0mqf4zxvmIcPdIOBJWybtQy6txvNkPpBi+bpsjKYROE/HJUl9stEC7DwGWv9gmQ4PqPnTTq5EFTdkXRwzZShp3zFw=
X-Received: by 2002:ac5:cbe4:0:b0:3b7:3aca:9868 with SMTP id
 i4-20020ac5cbe4000000b003b73aca9868mr808127vkn.33.1668680296951; Thu, 17 Nov
 2022 02:18:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
In-Reply-To: <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 11:18:06 +0100
Message-ID: <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 10:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 10:06, Bartosz Golaszewski wrote:
> > > File types:
> > > - Cargo.toml
> > >
> > >   Most of these have a different style for versioning, though the workspace
> > >   specific files doesn't have a version set. I checked few other projects and
> > >   they didn't mention it as well.
> > >
> >
> > Just use regular SPDX header at the top of the file in a # comment block?
>
> Miguel ? Kent ?
>
> > > - bindings.rs
> > >
> > >   These are automatically genrated files, with bindgen. Not sure if we should
> > >   edit them to add Licensing info.
> > >
> >
> > Can we not generate them at build-time then?
>
> We can, and we do when we do "cargo build --features=generate".
>
> There are reasons to keep them merged though. It lets the users avoid generating
> them on the go, like the vhost-device [1] crate in my case. I also faced issues
> with the rust-vmm containers, where vhost-device stuff gets auto-tested, in
> enabling bindgen support and finally went back to keeping them generated in
> advance. This is also the normal practice it seems, from whatever I have seen
> from the rust-vmm community at least.
>

Do these problems you faced apply to libgpiod too? Honestly, putting
automatically generated files in the repo just feels wrong. It defeats
the whole purpose of code generation. If we can't reliably regenerate
them, then it sounds like a problem with the tools, not the library.
Maybe we don't need to worry about that just yet?

Bart

> Maybe then add the header manually to them ?
>
> --
> viresh
>
> [1] https://github.com/rust-vmm/vhost-device
