Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075A5609B1A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 09:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiJXHQ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 03:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJXHQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 03:16:53 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0274F670
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 00:16:42 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x2so519964edd.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=726WSoY4mLOczSbEjc034AOsSq4sXpELuOZ7B9wIXP8=;
        b=sEW3ChV7P/8UmLxa1G2+XFIYYfgAt9wRianS4c/tt1Pvk7gtbAizBVqX9S/ZdXR609
         BXEMRf+IY/xF9ZmhoWMpyYFRPkv4ymrjlhqFemhzHNYrw59ZDCZQJqQwNNbMwJDgvGWr
         90b9q9eKVyivJYfae33mJMP25f6ANPDQjSHFHyzr0EujazizboOkSlMo/eNQWEv9ndah
         uxoFTs/bCnwwiuFmmZOk9D/nizlsrIvN8d2UZZoiDJntGHZKIIBUOV+zVJ51gRU6fOMi
         DK/y333c87b5OMeoxVZ+b7harJP6mldzKmmm5q6un851vbDNrwlqIPmoUymiB8cYLMWk
         nzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=726WSoY4mLOczSbEjc034AOsSq4sXpELuOZ7B9wIXP8=;
        b=6fU4yVngtlkVm0rYlK+R2cxTaXpG3vUgkYaei1xhHnzcGt3k+r7a/08MMuTnOfmeWK
         uesQwlo5X2QjMARFB7Dk4bn6uMynM88gDta69b8pF16SGpRGpxGc+grBrN9fPtQTZWNl
         eHZexqsxhY8DtfBqGCepISe98fiF3m0Y7apsCuLC9Rj66yiXWcfe93lRPf+Ap6z66Ibs
         VJw/JHF8Xn262Y977HkotFV6v+VqVpsXT1ggd3OHg5gkdNgA7vZNPY8tKU8wvvCFnl3h
         m218Vq4J+e6fdS3obDgGBE696sXNSCwUlXWC5bCoeCzB4Ape35/2ee8aPPYUaYuO8US+
         Zc1A==
X-Gm-Message-State: ACrzQf0cL/P2tiH3yWQOrNa1GCUFkGyOeuD6m2pDzNWeexn91okyrolR
        58y3kzkLHNGdY1j3HNpVXk8xKHJnvTESWlQPTzrL1fYJI2E=
X-Google-Smtp-Source: AMsMyM5W3aSQ2QWrntErCxduFaXbGVJCMJm8QwK2Wui70f976cr8bCYp1pbtrkb8xKId366x6qnbaXVJusXnzgUvPVE=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr26069172ejc.208.1666595800674; Mon, 24
 Oct 2022 00:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com> <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com> <Y1GJFakunT78fXmE@smile.fi.intel.com>
 <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com> <Y1WeMf+JQVoY2AAM@smile.fi.intel.com>
In-Reply-To: <Y1WeMf+JQVoY2AAM@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Oct 2022 09:16:28 +0200
Message-ID: <CACRpkdZfubwBDBrfRZV+QEU4j=1rgKu4O-QEEkMXoPZ=Y1z85Q@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 23, 2022 at 10:04 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Oct 21, 2022 at 10:02:35AM +0200, Linus Walleij wrote:

> > Bart are you fine with pulling this as-is? (I am.)
>
> Hold on a bit, I have to rebuild a whole kernel to test if I missed something
> (it's already clear I missed lantiq patch, now in my branch, but obviously not
>  in that tag, since I called it immutable).

OK I hold my horses waiting for your confirmation, I expect to
pull the immutable branch once it is confirmed stable.

Yours,
Linus Walleij
