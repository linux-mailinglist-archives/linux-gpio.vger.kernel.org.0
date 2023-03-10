Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE976B3B0E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 10:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjCJJn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 04:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjCJJnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 04:43:06 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C419719C78
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 01:42:22 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536af432ee5so88196607b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678441339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RPb4A7Oehz3TfZh3XBHKc5TBgIrGnLCc3ffP1cCitU=;
        b=MzOOMi0GL5DKa62OrIN7/U4wGQnlbLjfAlGAs/Xs+tOMkEbKA0MmI4L6mzOtMIA/ys
         p6TX67w+sn0XFdhNwBJF+9jKfImTb9ckr6r2HfjXPkDhqkKC0dVG+z7ma3hGhd9rJ69s
         nMs4yt164ThmTdxhp+adSNepWyWaZ19CS3rqGINyYP3K7lKTQcrXK2HOGtu4sahsTslw
         y/v3oAGAPmQymktIaddrrSufOCpHslB/9N33wDDm3Vl6UsI6Fey+AtaXp9lk36D2YKGB
         MtZ2ZmSIAyWXqZJpnarlIAkBQArj3QYqHCPUJ3nHDWNzjVxqtz/DDe4fNDjemCYGFF0y
         2jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678441339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RPb4A7Oehz3TfZh3XBHKc5TBgIrGnLCc3ffP1cCitU=;
        b=AY3u3RJVrw/3AMVVJtLWFOnGXngQhet1co31TfGbPRS2/hvXGdl/dcNKH+F62eN7KJ
         IQRvdU2842ZiGUFHR1nisdIX6/dYyOPAq6LH6Ax28GS6V2la0mqofP+bxw9QvFLb8RhK
         GpYeTr46NumfSki0W8170zxmoArSVqlJ1t8AuaQ9XpLevMnL//PUw6NHRyrIIK5o7FTe
         7ARGdsPowxWrX5cx9KLxy0OIg78jjfDyJyCmA+j3DDpwhk8ggxqs2L8IkTALL0OOEzfc
         jvQ0TJkWefWW7cpIakFGnxbIWZcgGoglSl0ogJpMntoPwhiPlv2E3g1l6hJYoGKxwfky
         oAKA==
X-Gm-Message-State: AO0yUKU2ZGFugSG2EjRShl3YHf5zDqNNAnBrfUoCoqt0QQTrlG4wXUbQ
        /Gsz2/eTwPsYXt//PK+SnKJ9hq5Bx89eqUvzuI+aAY3e4WfheUIQ
X-Google-Smtp-Source: AK7set9Eri1PaWk76cPuC7cN4Fh3u33L7yyaQ/62+5jggQn2bpqi9YHGkwx5xLBoI4OzTQ8KnM9EyFoGwA0zlu2XEEY=
X-Received: by 2002:a81:ad44:0:b0:52a:92e9:27c1 with SMTP id
 l4-20020a81ad44000000b0052a92e927c1mr16067704ywk.10.1678441339671; Fri, 10
 Mar 2023 01:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230309185626.84997-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309185626.84997-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Mar 2023 10:42:08 +0100
Message-ID: <CACRpkdan8+RHDomBQHwHG=Xt3XRwTxXrdksxKKQc-OSY0UdUzQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Remove duplicative check in gpiod_find_and_request()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:56 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The gpiod_find_by_fwnode() already checks for NULL and returns
> correct error code in case fwnode is invalid. Drop the respective
> check and assignment in the gpiod_find_and_request().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
