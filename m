Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381CF6162FF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 13:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiKBMsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 08:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiKBMr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 08:47:58 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301FA2A26B
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 05:47:56 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id v129so17095401vsb.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dXqpuQrfv4D2NLIWf9R0mbtAArAQfDHSQiD2cVwxFNw=;
        b=jrO/FepUritzHWY/I+Gz9kV3kkcf2MLOAdHlUeYV6LP+kHERx6zWFbhxcvwi7EwI9q
         QP69kQ3SfjKBmyam3cQ/4ypDi9iGs1GwtB5cwU5iAQGp11v4EpOIS8Jv1FQOJnMnHsaH
         6nRIji0XMxTTAp+M5TvhRWFuho8NzCID/w89vsaO4/dwvi8JUfRUAImLdbmjjvt9BVxR
         bdkFXfloJoq2ultTg5lqBkE7ZgfeSq+1d54S9NAZFoWhs/7g92dfPD6mVa4MNvCLxB/J
         aY/Axa6bwqr57on7wQjyZBYAkDEXK/B30g4dH7GuBS8nH38RUblX4bNaUlz96PVAWAyW
         HU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXqpuQrfv4D2NLIWf9R0mbtAArAQfDHSQiD2cVwxFNw=;
        b=zzq24JG2LmZgDEBpQMxXz2WZk00OJyAURYV7vT7FB1+OF/NHylLhS8q+bNq2BrTZw4
         HQD+TOrwqPQMkAj8JB7Fkfs7XqhKSKzkADAWFalveQLJrdUaNLMgNzc2ohj1UZa6unrO
         KcExXqrSQV2FcaRU2TesmpMf3auqEDlK7mdg7ceSDIRkODZaoG2u+Z52I50E5ZiwP3B+
         HqCEH3IkE5iqyQeQ/OzXU7U6Mp2dW3g2WYOW+QfTkMFecAYRjc4UcIKPkE1fgwBRYZSx
         +1sFvYjk1+LUfWxHUTSIg6azrEzjFufjZSs1XeIFkUtnMgqpbIKh9NZVgyKH5JXKkUGt
         /xIg==
X-Gm-Message-State: ACrzQf3Lg2jiP8B6mzKjbAgf89ZmbGlQ25CzsHpZqFqISl/AjPc8CAY7
        7NNKe3g/QalrOCzSsIBPi4d60i2njX0E/6ylENKaBA==
X-Google-Smtp-Source: AMsMyM6bJmd7b2XNlF6HBR2+rQAqgPN1gLcWk3uxZH0oM3zZenE4JliexDVgIUsMrWFrhAnzO5NQm7a42Iu4UrUcYFY=
X-Received: by 2002:a05:6102:5788:b0:3a6:764d:1382 with SMTP id
 dh8-20020a056102578800b003a6764d1382mr12115347vsb.13.1667393275329; Wed, 02
 Nov 2022 05:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol> <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol> <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol> <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
In-Reply-To: <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Nov 2022 13:47:44 +0100
Message-ID: <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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

On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 31-10-22, 20:33, Kent Gibson wrote:
> > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > support, or as his work appears to be on behalf of Linaro that they
> > would have an interest in maintaining it.
>
> I will surely help in maintaining the Rust part. Not an issue.
>

Sounds like a plan. I'm going through Kent's gpio-tools patches and
rust bindings are next in line.

Bart
