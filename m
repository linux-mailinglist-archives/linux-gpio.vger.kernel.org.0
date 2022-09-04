Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58F35AC649
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Sep 2022 22:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235013AbiIDUMz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Sep 2022 16:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiIDUMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2022 16:12:54 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A292A725
        for <linux-gpio@vger.kernel.org>; Sun,  4 Sep 2022 13:12:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x73so2005264ede.10
        for <linux-gpio@vger.kernel.org>; Sun, 04 Sep 2022 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wc+Wz38j60Q7l1csFn+LeKvfSEVzWwyMdA8x0tTNYDU=;
        b=hVb7tdmwazu5pkbV6qFjL1GEHrl1kx/9pXjgESq2R/SXYgg3b1BCCycnFo0I4aTv72
         qA1tLsAPDmGIfWm3v6xjFuPst3sgaYwOMl6Hx2XUW4XBx4MeBrt9NYjsKcnt1Li3dAcz
         0vmCHt44/4Cqbfai5bW2p8i7evMawEoewYuz99bD5Pep8TVpgN/0PBxurC4BWtdEUMMj
         jmkihigLI24idoLLpr+zXy4lR0IYEvWJ8xCl0ceHHvXR/KM01QPET5O523Bvxm4+ome6
         ZC49Qrfyx3jfAvh9fn5wJTcV/CUwOZSvtBYJWabGtEvN3/irW1uwufThu+9KJc0MXGvl
         5y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wc+Wz38j60Q7l1csFn+LeKvfSEVzWwyMdA8x0tTNYDU=;
        b=dL9d7437SvG1lbTWwUI6h72zuSOaPTmiJWWDMgEez9axMdlbOxxQOJ/pSJtcRtK6T4
         90UQoqxLFFAIrIAscxYUWzXlbedBBpA7jUNBd1cQaluhTKAkYl1TirLpKx9zbCmgugSX
         +P/nJZq25u4d5daK6Dfo3bU8AWxpnEtFjZvsuZn54jnyaPZ6KKMvrMer0aMflpdwP1Wi
         98Q//83Nr1kzRWtUYQy7ibeCkMJsbr6z4PLVUAwFUUshwijBocWZxoylDogbfi+TF56O
         VtyYCNLP+k7oPxBtaTLWJIeGDuWcllSuVqcgktZrO6dYPlbeAm1/zHth95SaQfZun54C
         VupA==
X-Gm-Message-State: ACgBeo0Yy8yhKt2N0X7ECLj05BR0fShAe9tTmPHvwoiluj28YByQW/VG
        Ut1PYjnBrIxGFtguf7Awj1CLBg0/7xQo9jUnFNHasg==
X-Google-Smtp-Source: AA6agR4HfZragLapKkUjZzy4TZmv6ATE2JGl7SwGjuVIiL+0XwxHvpfhtc/5VoGeTkXZNhjZdh47ayKNxwRyfvYNWvg=
X-Received: by 2002:a05:6402:2073:b0:44e:3555:5fcd with SMTP id
 bd19-20020a056402207300b0044e35555fcdmr4044581edb.82.1662322371057; Sun, 04
 Sep 2022 13:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <YxRDRx3oubAISIB0@google.com>
In-Reply-To: <YxRDRx3oubAISIB0@google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 4 Sep 2022 22:12:40 +0200
Message-ID: <CAMRc=Me+4xEgH8S9C594rrd=2_oBe4wqC+ay5iS0YqmEBCuDPQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: make fwnode_get_named_gpiod() static
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 4, 2022 at 8:18 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> There are no external users of fwnode_get_named_gpiod() anymore, so
> let's stop exporting it and mark it as static.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Applied, thanks!

Bart
