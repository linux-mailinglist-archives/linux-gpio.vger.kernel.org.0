Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452795619B4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 13:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbiF3L5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 07:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiF3L5s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 07:57:48 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E1F5A472
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 04:57:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id q132so33284162ybg.10
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3rIf2WKoO4JuOcvvdg36I6p0a4zTwkhUxuCJQlAZQ8Y=;
        b=Yw2zwNsZrenuhVo7xNe2Aa7KNT79ZOYN9FbATZuMJU81gu+nrenewL9wj7u1U51pbP
         yoq0xYBAF509dSCnlyiBgHUCUhKFvZIv3lS20clE1ebb+LjHXUCc05GuXeXvdZTPJMei
         JbvmGFlJFnQngv9vrTTiXn1Zqd4ORk46Ysb3XhpEFMOkm/6Nb88Oe8L1RCtFX6rUU+dS
         wHqwsOAqF5mI/X/krEiXehFi+suoC2y9/HEp0PdOKNLoZw3beCrYURiSDSUWZpgTmB3Z
         7AlgbEzIO5X4iHqMzWAHzBxumPppXoIzDEA18nhl3Tl3rpkvbr/THarkmF0hR18LEte6
         hfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3rIf2WKoO4JuOcvvdg36I6p0a4zTwkhUxuCJQlAZQ8Y=;
        b=HSsBWaKNftFpfJAan56zIcQjiGvtjjCQLDLV0j//FgPzvOvPywUkLX3j8S83PLqSUy
         dmJ0o02RAdX7u0Tny0bKoqr33X3nhDoIptXtz0OjrlaNaQ5nHyDqZc3VR7yJFROfcncV
         qsMlc4npoVOeQMxi3BewPXfKbG2hnZMndvwM3m75mI5gOrAfEXBYMslAmBoNstfiJqwL
         Xsmy6WkYW8X1zi027v7kszHJMCdLzUSmwAQgJB/rvAhYGRPe01Qq+oBzI7Kk9wFfa4uh
         90TbrKrGusWD/id2X7HQMMPQ5e2gcXaIxI+H5AKewLl5t2nlqc1jSu5OEi5iaMSMYGLl
         eLag==
X-Gm-Message-State: AJIora++v3CL8sV5GdeXfhdZKgtNacmFfu5w6ZnGEjzQjS6p7i1/2aul
        1JueRzS6S4Gu1EcjVrJ2dHoBcW9Tq57hreQj59L/xGQ14zk=
X-Google-Smtp-Source: AGRyM1uR7Mqp7LaJVLxvb/SLHSMnEuJi4zJdNgF16rLyKcYeGL6kIaxMZ2PaUuMHnvLOrVX8884YIX81bg4SCZ6c6Xw=
X-Received: by 2002:a25:d88d:0:b0:66c:999d:919c with SMTP id
 p135-20020a25d88d000000b0066c999d919cmr9525885ybg.514.1656590266415; Thu, 30
 Jun 2022 04:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220628193906.36350-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220628193906.36350-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Jun 2022 13:57:34 +0200
Message-ID: <CACRpkda1AtKEadG3YCic6dQw9n+wpFaWBJbn0NY4DHZRYmXNSg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: adp5588: Switch from of headers to mod_devicetable.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 9:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is nothing directly using of specific interfaces in this driver,
> so lets not include the headers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
