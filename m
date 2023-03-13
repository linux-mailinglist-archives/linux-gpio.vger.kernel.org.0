Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EE66B73F4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjCMK2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjCMK2Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:28:25 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0D4CDF8
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:28:19 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5416b0ab0ecso103146937b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3+wPjzMgjy3hIDsRk5TlUP92tI4bmfPwG1j/aFlgGzw=;
        b=wWIIm2NHFE/wkyxG+OV4iOLINuMgxvPVNrsKLCZub4K9dTPMnDvKpiSEZZg8hPnrJb
         i+DOhm6mwr46r+OXoohXJoUZRETZ3PK7ENUiFdvK5h2iue2wyQHMrPSuZ492467f6JiX
         19PRIa5UDuZrmyxsXuZ26giFPJ/uSKeVmaWOGYMiCfwPMpwiQZCs+HfGHhbG1fAuXLSc
         sRaPXIQwX/iaTt2fZj55yElwdiij/1NXNvbYNwKO8NTo7QgNe8EHSZuP85UZlC78K81b
         rLAedAomvHcRcgWnRv49Q+6u0MdleovLVUss26EiMgwrFCy7CZFJZ1KdXWBt8FCyVG15
         GuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+wPjzMgjy3hIDsRk5TlUP92tI4bmfPwG1j/aFlgGzw=;
        b=WY1TJGeStRYjgI4zAzKk3ZYQAcgCJN2xQRzOroStFQyOvLLG4kSGSS89WOJCyGfPek
         CYX+XlRt51YBNepNsuTC6dTB3P/rgmwZk+6MRCQC7IHoRNeshw0m0U2+KWTFnRJSERid
         Et0IH0HyK5FpvxnHCnBME6qGs1bXMaY9kTZJVVlgm78PQQcyqNHB+eaNdb03tF9FpAtU
         /5GLHY2a5Eg9YfpxhepNA7HegS/jeHCG2gILu1sX0OIfIJuFKHpvhNfRqh46il7WduIF
         84PcEKMBzfWvNydC0Uy/hLfTzDW1r3i5UDa6WlcCl7MHLR4yUa8bk4zT0ebLWwR4r5dK
         nLGg==
X-Gm-Message-State: AO0yUKV0BO0LApJMH+0AKn7GPWcV8Ird2CmT3+dMsDGTpUdpkFNen+CB
        HEKK3y+CIOVsQhsxB0qg0/GgFwp5I06FvXoWAURkae4TF7mXb5vG
X-Google-Smtp-Source: AK7set8lAaTs9SN3hTPTK6CmjY+cT/Ez8RNzFWqCmfnbh5P/hh+CCoSU+5jFHEXbFvut1yfzUSEtKNxyJmFjf5GKfr0=
X-Received: by 2002:a81:ad5a:0:b0:541:a17f:c77d with SMTP id
 l26-20020a81ad5a000000b00541a17fc77dmr1910080ywk.10.1678703298278; Mon, 13
 Mar 2023 03:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230309185600.84948-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309185600.84948-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:28:07 +0100
Message-ID: <CACRpkdYtcYBJ--S1F_SnnDL3DiTZ0Jv1BEQyhc3eYp2=ZcugCA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Get rid of devprop prefix in one function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The devprop prefix in the devprop_gpiochip_set_names() adds confusion.
> Get rid of it.
>
> Note we have more than one function in the same module that handles
> one or more device properties. This change will unify the naming schema
> for all of them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
