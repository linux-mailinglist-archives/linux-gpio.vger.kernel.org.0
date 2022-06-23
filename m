Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EFF557DF6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 16:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbiFWOgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 10:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiFWOgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 10:36:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AC53EB86
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:36:51 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id t5so9017174eje.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qp/cRCbGIgaCK9Ty5kMpVAtTHuKK7E2w/DMIg7EAxo8=;
        b=FO8cBP0K4xsPceTBKKHnUGgnYHY1Skq6ChggmGpBCgZGpla/bByE6oUaAlWXyWU0vF
         PLhf3kmatH5of8GlqKiHPsRCyA5+r7g41edN+j8JCyhoVtTvCLU8KnaJSihfW9NPUtiE
         nmoc/SF+baFHe+LoOgYH0o6VZ1Lz3ZwDdgerB0kAiYWTGdZARohhrhB5wpCbDTC/OnW5
         Db+cMHuhKmYI8yDaUhdbaOSBdGyYNHD7+pbSEks0YpCyXh7IS1Yczau7NBKgqZU6lJvu
         tF2SxqKZmSGq3uSzUjsN364b9VQui0bWtNcoey7TDDTr8EcUiQThWwTnhH/4221dF58O
         TVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qp/cRCbGIgaCK9Ty5kMpVAtTHuKK7E2w/DMIg7EAxo8=;
        b=H9RO8t+LkxvOwj1kseR5w8B7V48LNBMK0r3pA6MSOfkLUrXfF0iUKJ2ZYIFMYV0y+R
         bwO7mNoJ1jXhpquFw5qZRy7PH5aJ0XhYOwMgJLYf6B5Q0QXfpW1qo2E+axMFGmomHvs7
         Dhij62UOrhRIdRx6D0LP348c0biqfQmCsKsPfv4MtB53qsJhTZ6EW0ZJ0Wu4Wu4b4+pT
         ifnkHB1htiY22EhvmTvg/3G7mHduwLz/zS3eOtGTK0bS4pK0G6603ym+3pQFWFUUslju
         NuMc4sSoFQpUECq9YHhdlV1idf4vX4BEhPszxRhE+NDn+iuFkuLvOjzeu0LZozF+t6lb
         cbHQ==
X-Gm-Message-State: AJIora9TV8ENbmpFjW89F2uF1WEwD09QpffEj0P9iCso9rLleSUDkaA1
        XufOIRW7wjpoVda0dzweC/uiPI4syLyNucxb9exTVg==
X-Google-Smtp-Source: AGRyM1s564s3fiLiyBxM2nC5JNnQByLI+ku9H6xw8kOmrjGeURS4OVf9zehn05tp04En+oZZWCKo/XjwQ4Fy2TyI2f8=
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr8899574ejc.736.1655995009719; Thu, 23
 Jun 2022 07:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172842.86713-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220622172842.86713-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 16:36:39 +0200
Message-ID: <CAMRc=Mfqo19we+0ShbpCtbbsXgU6trKbwQR2Zg7LcAWSJ_834A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: devres: Get rid of unused devm_gpio_free()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 22, 2022 at 7:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The last user, which in fact was a dead code, has gone a year ago,
> previous one 3 years ago. On top of that we want to drop away the
> legacy GPIO APIs in the kernel, so take a chance to get rid of
> unused devm_gpio_free() and accompanying stuff.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Always a pleasure to remove code. :) Applied, thanks!

Bart
