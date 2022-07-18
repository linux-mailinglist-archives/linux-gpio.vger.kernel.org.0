Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64024577EC3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbiGRJfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbiGRJfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:35:04 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1A8E0C3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:35:03 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31c89653790so100367507b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qieC8+PNypjqU9XCrVZh9wTINnwJ/hl/d0JbF/ThDU=;
        b=GvJ19lxGvUR1vGRIjLP+cCJQ0m1HzwU4Xus7giM634RQ7bkA5GWKrLDBmLelmYOpqy
         5y3LrVpaxLNhM+Ah3loYZ0wcAMa3ecTVc807JBdjaWk/wIEsy1x2j75hllOBrXBNjsR1
         bTzFrANw9wwg9RGSoAAlxgJcn1qWwY/SjoaXxfY9IgQARPb8Np+eT2Dh/jmKrPfBbPz0
         vAC+js4xhimO8rBtIdXQA3uD0FiSsUHTzY+ebt3Rq0Ti930r8JgGHvkpWveui8NapwXf
         loX2+xmUACEU5ZTSU+mwoLtmIX3JGkpxm5h9PBQjWTZtaK9B48d1eNEW5Mye215h2QB0
         94EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qieC8+PNypjqU9XCrVZh9wTINnwJ/hl/d0JbF/ThDU=;
        b=OXtTIHHJzJV/WmQs2nPUjoXwGPj+jJZk7Wu/7PYarCEcOwMpucR/gmVBXPaNExJwZ2
         nA72LxzQF1x5reQytvW/fk1C25EVvyG6VJHUo1Nk4sRtW96TP0/5gEyS2Kl8t57Ma9SK
         pZqWxsI1alG+1O+SULczZtRhv1P0LYfRCADnvztMF0uP7+t7u+3bI23Lv2sDPpL/IKot
         QM5TNHzGsXqM0E8ZeNSjO2H/w7zDAYGgmrTuN7faF4sdYIoUXUB6P4pC/h2e5t/5RxWC
         MnpL86sXwSZEt9udVbc5YsYIJSnWbg6jDbPS2boDP2+xqY4PDNffaluVQYVq58UBFaWl
         fixw==
X-Gm-Message-State: AJIora+9h+6D9sznYyl95Pmw2hS8VzLET8li16zF+I50dcG54VA6zZqd
        wdY5Wi9UfoV0JzVbn7z6/i78U128iJ9ZsJCvpxTLpQ==
X-Google-Smtp-Source: AGRyM1uHqnvIJBxT4WotSCiTKf4QgOwgX9iTtGWVCm8zxYBwAdFQ6zLSKghUSJtFA1K3vvl4KLaxsaGyT3iHiJHDlL8=
X-Received: by 2002:a81:7341:0:b0:31c:c547:ce02 with SMTP id
 o62-20020a817341000000b0031cc547ce02mr28948230ywc.108.1658136902849; Mon, 18
 Jul 2022 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220714020319.72952-1-warthog618@gmail.com> <20220714020319.72952-7-warthog618@gmail.com>
In-Reply-To: <20220714020319.72952-7-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:34:51 +0200
Message-ID: <CACRpkdansQBsda6E447Whv1MCcZcw85ySNsEt-noW28RMSdE-g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] gpiolib: cdev: compile out HTE unless CONFIG_HTE selected
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, dipenp@nvidia.com, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 4:04 AM Kent Gibson <warthog618@gmail.com> wrote:

> The majority of builds do not include HTE, so compile out hte
> functionality unless CONFIG_HTE is selected.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

That's helpful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
