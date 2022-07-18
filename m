Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D970577EA1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbiGRJ2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbiGRJ2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:28:45 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A051A061
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:28:44 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31e1ecea074so23921577b3.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Um6tQ7ZbIk6/SLu0gTbqf7n6ewcb0e4sta2uEmym+rI=;
        b=KBCLwm9x4+fLjkyddez8bnY48JwDx33er4U9UiZDXU6UrrEqW9mCVimFlCFqkPxMgC
         hx3W+qAiiZ+BfyB0AGUcsMwf3z+CQfAycCbKx0If9anpXS55BC0vurh/+mu4WXqUktn+
         MnBITM2XoRXWcSCrT6K5MHV54CxJCPLbr5qv62i13guK09LM4vY6jdSZfujRFwCUwqEg
         AK7f84n3SvLhaILuS598eszpJZ3x33tm21xMaVyM2c1uyFOLcRRtvlm8GkFuxNEAahA2
         KFmTBAi/4gOUfkiL7JpW+c9T5WS29Ogq6mOkbbxH86Yv5lgn12K//fmMNuf7Hj645Pdd
         Llhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Um6tQ7ZbIk6/SLu0gTbqf7n6ewcb0e4sta2uEmym+rI=;
        b=E7NndK6xEn7VqjYQ+WhgqShaX6Wm23ZXe4W8TSLBtDN721z7THsORPH9zCaFeuCn3B
         N3nbyF9jmWwVeicNIXp6Adi+OLFDMB0SysZkAVoyRetGrHAx38ywCPN7Kt1ncqUQa48v
         STwWIWh1StSajpJoAzKziu0F79a8GMwxDPCLXqsBWMNJLg7WdOBPWplv2KIL+OSMqh3/
         tfAIVseiqiz8PJimUpn9BKSW9HQvrqcKrZu4TKTKmlGTjJEve/ECokbDuaGVvpAg0Ccl
         9FnsfqtAtsc1T8N3urdg/6MWYYQlG9S0hJDqkcsj45EKQEdUTdjDo1YuvGUJEyNfeVF6
         6cTw==
X-Gm-Message-State: AJIora/Ya2pOfTaK3eWhHy4gc9KkQx72TEFnLwMpRV/4x2NwPDzFQO+C
        U0rYQYOMc3hQnf63rfB9qMutY4GC1HacFR9Yc+zDWg==
X-Google-Smtp-Source: AGRyM1srPUIJ/8wNbS6vjugTjAvhN3VJUpHYCyoZ8aK0adIJFfpyaTsedEucVykY9PqbOUVp5IEHhE2Z1BVMp92KpeU=
X-Received: by 2002:a0d:d997:0:b0:31d:669c:5bd7 with SMTP id
 b145-20020a0dd997000000b0031d669c5bd7mr29282562ywe.340.1658136523467; Mon, 18
 Jul 2022 02:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220714020319.72952-1-warthog618@gmail.com> <20220714020319.72952-2-warthog618@gmail.com>
In-Reply-To: <20220714020319.72952-2-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:28:31 +0200
Message-ID: <CACRpkdbH1-V+T3WVv3gCM2--vNUApmrfzSe2yp6zvNd+ArYSSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] gpiolib: cdev: simplify linereq_free
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

On Thu, Jul 14, 2022 at 4:03 AM Kent Gibson <warthog618@gmail.com> wrote:

> The edge detector is only ever started after the line desc has been
> determined, so move edge_detector_stop() inside the line desc check,
> and merge the two checked regions into one.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Ooops reviewed v1 because of too deep mailbox.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
