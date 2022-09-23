Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2B65E757C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 10:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiIWINc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiIWINa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 04:13:30 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF51B12C1C2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 01:13:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sd10so17899201ejc.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ax1fal+7HKlRfvbfCUPFDrGZTL9um/EvRvlVhIFgvlY=;
        b=O6pBR+NMYwNF1yXW7ebTnUz5ufv0t+HIVtHHeHgQYLyjrcLT7aNi+X7b8Zr9l3Z5PO
         Q5JXGSBco0unwh9aWqV6A4OOQzrOINchxCOctglcEGMon0yaj2yXogl6BOrbEobmybG6
         3Gai1jYxCykvdIXrxJFbqAU2HsvJ5lr31xqDkB7sIOfIRsJdhCa626/er+qvepoXLuEo
         ncZ9TvmheZkFTEAeqHfAzXtrxch238OTioeOKCgPCT43gycz0rHbgSXBjFrkfohd7ipv
         3qL6qe/bhVQzU5U2WXknWnKfZUVwXXx0SpQxtwJJ5H5HDPvC/Kh6HhAeXOnFJ3mjrJjL
         dQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ax1fal+7HKlRfvbfCUPFDrGZTL9um/EvRvlVhIFgvlY=;
        b=ItwRylFOq1Xm7tTDKgom6sBhZuT714wGprLD2UKpHSoJ/451Kv13geh8VvWSePHFgP
         x4nVM71Qb+OimDmNt+4zWs8WmDF3mc8e2dmi1MbMwzjz9gw0DeoCjxx6FG49ih+e0twI
         ghjQxkRH7jVWIBzgBp0Yl7uZKD/4idvYK8ubUEb7tVHiQi3fBY53d/s5qHV/3JweAXNo
         Y3ab5o/yz/eh8QOZuEqzv9B1gn3Zh2eT1feTNE4zcdx5UyHcRG2HF8cJV5XxpSiAM1kh
         0SIXYfpF3DEs20ojNk3e4Aw6KbAClFdnbn7ovqPmEKppztiQCGLltb1TcYR7EEtheZ4N
         RvJA==
X-Gm-Message-State: ACrzQf2cbnLuSorxLe6FPbV09hGaNoqgVh3b9DXg1Ly2a2f8/y+gQ+89
        jjgArF6ce9tHsrzySWjzDJn6FDUnS2cSIL0+DP0n8XJYHCA=
X-Google-Smtp-Source: AMsMyM7Wu2yRv5iCv9Q76KPI1+TpkUOdeimYrLqgbd6i5imix0xowbsIQW3fsNfNRmMNt+yBDYv1zlvfQlEfQepL/Dk=
X-Received: by 2002:a17:907:3da9:b0:77b:9672:3f7f with SMTP id
 he41-20020a1709073da900b0077b96723f7fmr6098499ejc.636.1663920808359; Fri, 23
 Sep 2022 01:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220913161407.63472-1-brgl@bgdev.pl> <CAMRc=Mfj74JKgQNcYBySkpU_CXsA1xcPAEYa4YaKdH6TTvOktQ@mail.gmail.com>
 <Yyz5mpl/6h6UJC6N@sol>
In-Reply-To: <Yyz5mpl/6h6UJC6N@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Sep 2022 10:13:17 +0200
Message-ID: <CAMRc=MdG23VzkDieUjg89N29CdjLrrvfmiDKezczA6hRrPXGFg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2] treewide: rework line configuration
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 23, 2022 at 2:11 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Sep 22, 2022 at 02:25:43PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 13, 2022 at 6:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > This tries to get rid of the concept of defaults and overrides for line
> > > properties from the library (or rather hide them from the users). While
> > > this makes the C API a bit more complex, it allows for a more elegant
> > > high-level interface.
> > >
> > > This patch is pretty big but I'll just give an overview here. I don't
> > > expect a detailed review of every line.
> > >
> > > Low-level data structure model (as seen in the C API):
> > >
> > > We're adding a new structure - line_settings. It's a basic data class
> > > that stores a set of line properties. The line_config object is simplified
> > > and becomes a storage for the mappings between offsets and line_settings.
> > >
> > > We no longer require the user to store the offsets array in the
> > > request_config. The offsets to request are simply those for which the
> > > user explicitly added settings to the line_config. Subsequently, the
> > > request_config structure becomes optional for the request.
> > >
> > > In C++ bindings this allows us to implement an elegant interface with
> > > rust-like chained mutators. To that end, we're also introducing a new
> > > intermediate class called request_builder that's returned by the chip's
> > > prepare_request() method which exposes routines for storing the line
> > > and request configs for the request we're making. For examples of
> > > usage - see C++ tests and samples.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > I merged this into next/libgpiod-2.0. Same for the gpiosim rework for
> > C++. I want to progress on the python bindings front, get that into
> > master and apply the tools changes and get those Rust bindings in too.
> >
> > If there are some issues, we can rework them later when doing a new
> > API review before tagging v2.0-rc1.
> >
>
> I have my tool updates rebased to that (in the twools_v3 branch in my
> github repo - in case I get hit by a bus), but can you update to the
> latest gpio.h and add the corresponding GPIOD_LINE_EVENT_CLOCK_HTE so we
> can support HTE?
>

Patch sent.

Bart
