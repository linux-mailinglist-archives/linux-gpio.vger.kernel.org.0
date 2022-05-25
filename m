Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5F5534188
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 18:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245462AbiEYQbX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 12:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245342AbiEYQbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 12:31:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899EA4ECD3
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 09:31:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso1415804wmh.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8FV5JUaluu69LdsoN1T9bi2vXC2/Pwgc7627w+7IE0=;
        b=iiwDTfeN13tL6fGE8/O/41RxuguehByAsXlBv9b9A01c7ZAdTpYS5aHEDpDso1Bu8i
         kgxKRcKgKhgdGd2vhyTjOKPHBaEWdj2HpQSVJQGGYQQtqyCZteYEFylu+SAto+2sZGmQ
         TIMe4hYZkvCtphweI93uLlhDGw2X/mIXtW4rcrWnuB26scIT9PZTO9a/7nUydvxGGl/n
         Tg5m2jtF3h9nn+t8Z0Wj5O1upTZIQcgwL8hln0PFBx5MIgtzPoADsg5J67ysbfmAfhkQ
         nNjKl5AeJaAYUFQYiyK14bxuDtMDYvnrSSSZuzQIfiShrsucyeJYAgf1Of9gVi3ahuMf
         hgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8FV5JUaluu69LdsoN1T9bi2vXC2/Pwgc7627w+7IE0=;
        b=SPC5N85Sn/i6j5pXta+AHiFN6QYpc8lmP+ByRJcGg4/jeNyrLwh8fgcg4qUu2IWmXr
         oJ34hrYa6KqiNxiwJfVEKuJFZun5IEkiZ6xDXVaFr6Zf0rs14LuAr6Qagd11AGrpSyBB
         P+S0dULpTQfTj6DOLaG4dba06nMs5q1pFp43qMtcLfZJInYtCHrI9s+sQ+mPhUPQGVds
         L489PSBbTKbDDU82pa4PVuZVTFJLCwpnsAMa7QiNPnFFFYHABCOhvowvYWfvaCjLojTW
         4vUd1S0gc+tBN2Kl/ycjHW6NeeFlIu8WikXaRjEQ5Haa6S2+FXITo5NCDQoofULdUqMi
         L07Q==
X-Gm-Message-State: AOAM531n0XJolDOuNgfuzz1nQH9f5RJLoMyF9Q+m7K3Bgia/X31nqEL/
        VBFgD8ZKYWc/wGXuJO6Q68lgCiuWt0SirDq4VNauGg==
X-Google-Smtp-Source: ABdhPJwz1YBHr2nIviBFJqClOiHWUWpdPAd4Ni20+aGv2NLGkrG68huw8L/+YWlQH8LdBrC5DevZ27OB4Uat2ZkcfBM=
X-Received: by 2002:a1c:acc4:0:b0:392:9dd4:fbcc with SMTP id
 v187-20020a1cacc4000000b003929dd4fbccmr8895701wme.78.1653496276038; Wed, 25
 May 2022 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220406233648.21644-1-brad@pensando.io> <20220406233648.21644-2-brad@pensando.io>
 <05febd3f-bfdb-13c2-8cce-b9dc422c5eae@linaro.org> <CAK9rFnyRrS_LvoZ_j66cKDHgecqcqzJN5krSxdCquBanViKyHg@mail.gmail.com>
 <49c1d200-8c07-b306-a400-86ee6a637bb4@linaro.org>
In-Reply-To: <49c1d200-8c07-b306-a400-86ee6a637bb4@linaro.org>
From:   Brad Larson <brad@pensando.io>
Date:   Wed, 25 May 2022 09:31:05 -0700
Message-ID: <CAK9rFnw9+seK_j3gcMrDOqCWcj7C4-eKVGziFF5_J=TnxWx06Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: arm: add Pensando boards
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        David Clear <dac2@pensando.io>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Sat, Apr 9, 2022 at 3:40 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/04/2022 04:19, Brad Larson wrote:
> > On Thu, Apr 7, 2022 at 11:45 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>> Change from V3:
> >>> - Add description and board compatible
> >>
> >> That's a bit confusing... the subject is for v1.
> >
> > Goal was to identify in the cover letter patch the key changes from
> > the V3 patchset to this V4 patchset.  Then in each patch that had a
> > material change highlight that in the patch itself.  Will try and make
> > it more clear.
>
> This is fine, I am talking about the subject - it is marked as a v1, so
> it's confusing to see a changelog.
>
> One way to achieve this is: "git format-patch -v4 -11 ..."

That was the problem, thanks!  Missed including -v4 in last use of
format-patch.  Sorry for the confusion.

Regards,
Brad
