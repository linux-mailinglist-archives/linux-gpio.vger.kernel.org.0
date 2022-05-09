Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF6351F9FD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 May 2022 12:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbiEIKes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 May 2022 06:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiEIKeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2022 06:34:11 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC161CA040
        for <linux-gpio@vger.kernel.org>; Mon,  9 May 2022 03:29:39 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7c57ee6feso139009527b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 May 2022 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3KnfpRE1jJY63bWKmv8QPpoiMIHAzes9xacKf4TRaE=;
        b=qFwM3493cmrIxp37XrEUcuVekgHhri2R4oFMCMkwz/y8Usebs0Dcx6hzTbQqxyZdQR
         LNNnRfLGfmOk20hFxdvpJPRnqvOaGiJ00umXlqmDLtpDzChpgRaGG7TORV2UoZD4w8jY
         RDco3AeTtYFhu6vs07+OvDKsyhxhS5ElvsbRHg2/ICcjV1yIiCkmOqxIMA1lehC/FoO/
         xDIkeKTNiQyktxzGxqCSrcSlradBjBOp7XabEoMs7BubUfn1q1gOTsJWHxLManVIqVQn
         g3QIx2kmlrf1tb9Cpsr2zTAV+7KYYA9Dp+4o/eJ33K7qhn9jbKZcKfc6v3kHP6h6v0jW
         Ur+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3KnfpRE1jJY63bWKmv8QPpoiMIHAzes9xacKf4TRaE=;
        b=E9YcTwK/9ho4rrgemUNliG9MBVP8U4StPhI3JzZA3xhyI03C/IrkEmiVszDnPRyB9Q
         tF7J4wj9WN5sEv5ZB1m9wvKT0FUq/auNj7LIkIQlzad5/v8qCz73BDliyhw0qrRLerlz
         vASn1Fnf68xsQedEkxOpAZrvJoA8L1jtncTrhtqwI4c0SMKe4e/zsxE3vMR8GfneJAKz
         a1nx0Iagb/QOzLKzHKNqt0rmKyauZZPGbS0JcgtdqeDscbf/olFRs+xXmz2ICchabU6N
         J6PCgLSIFbbVE8zKgASfuV7hkGF2IiJdduOGp7N5ZZSIA5ec3y72fu8xQY7ckIj1HPeb
         eGBA==
X-Gm-Message-State: AOAM530uQLz+Lq23n57by3OXeyT8ekJ4ogs1bpO2ysM0Xmj79l37p+uy
        axOh/3EOBhVriKwk/s774kOYxdDjytvAeiDPnQ1Dfg==
X-Google-Smtp-Source: ABdhPJxr8xm5ARjdil3677vn8iOtaiYzWzQZlE/Z23IEbvgtlECrIi2gZUiHPRqiFvpik23i5hzvUv0QQAdMEbnNwkQ=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr12845105ywd.118.1652092177163; Mon, 09
 May 2022 03:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220507123331.170516-1-linus.walleij@linaro.org> <CAK8P3a0yF-QzaYpWOqHVXvkbh06yWKub+7wwF2ENnRCktuVqXw@mail.gmail.com>
In-Reply-To: <CAK8P3a0yF-QzaYpWOqHVXvkbh06yWKub+7wwF2ENnRCktuVqXw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 May 2022 12:29:25 +0200
Message-ID: <CACRpkdZUsbion6Z6-aAuOUtfpdPjJ8gSUOSJoRONCzjqXAdTcw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 7, 2022 at 10:59 PM Arnd Bergmann <arnd@kernel.org> wrote:

> I've inserted into the right place in my series now, after making sure
> that your patch does everything that mine had. This included
> the simple fixup for an uninitialized variable use you left behind, and
> removing two unneeded headers that would otherwise break later.

Thanks a lot Arnd, this patch was a bad coscience of mine as I had
not updated it as quick as I'd like.

Yours,
Linus Walleij
