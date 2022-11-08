Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01F0620DE4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 11:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbiKHK4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 05:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbiKHK4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 05:56:12 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753D845EE6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 02:56:11 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a5so21819062edb.11
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FccelAfQS/m5g8ggsBzyXrVvppJAlPrrtbe85Vmaz8Y=;
        b=feDRgRyqWhJmIdvbBPPnVEbuWegO60t1uAEif7gII8pT7NHrsotmcPggE2iXi07sok
         LoFVA1wmGZnhSaUApPZIeRymkQ0LLfUW9pNTUylaRhpfpq6S0RjCpGqiW42j3SQE0mcL
         8UhSo3xK2Z24huYBJUNp4WJjiAEfLfhlfwNdgsfwqWar6cD6OTzg7lwhMH8vl6S4llfV
         eBAnG3PdM7zj5H6TpZY8gt/fqIApdoHtblZD7WaXU/FoG+ETWt4KqJCf/qVKLxWRgcLg
         ZamVJQLseyGIMv4d1z8ynwiOuMlNbil0Z+OQaaPHzw3kup38BGdckBVdkiSlHkHtaQTj
         uTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FccelAfQS/m5g8ggsBzyXrVvppJAlPrrtbe85Vmaz8Y=;
        b=peXdx2qkkcCFlFMfOAJpPzfnw1wc5StWqYebHGZXp41CPqctKMQaigV1crUY5lgNYC
         CKZ0nkfo6LcvV6SNjDYsFDQwBwIF9tMB5ZkSd1fnNQwyAtaVSopEYYEFdDjVVypsuEMs
         IfClQdoS+9ABhG7OZ7vBnrx9HcwkCgqkPfvmL1IjCqRiP+TBTHnN8aL2QBBpPU6uoP8X
         a5CfXtYbD/T/ItOzPXwgFG93pOgzvCg520IuP6A+by+f01pjPNEF0A/GNYx3Wb2BsDeb
         C7KjewE6Iivcd2wvdDP0GIs5p6E+V8cLjIbd5gr0g0xHxjQyUUFh7ip06dxpTZ1EYYtw
         WhRw==
X-Gm-Message-State: ACrzQf3YBC/nKC9wmv6qLYwbCE+fUGPHeZeOCI4AQZNSwF/uAfTS4iZ5
        QnZNu6M6aMqUcpYYLgl10xvDDptvMXDjtprnIEfL0w==
X-Google-Smtp-Source: AMsMyM4KOaiC0JNQ11EpiDKQI00Gz/S86LhHNuQlyz7TpGUYby386MG585a5cdedC4QDpFcFKnOwfrbBWZ1atnMKnbI=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr53791725edq.32.1667904970028; Tue, 08
 Nov 2022 02:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20221031-gpiolib-swnode-v1-0-a0ab48d229c7@gmail.com>
In-Reply-To: <20221031-gpiolib-swnode-v1-0-a0ab48d229c7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 11:55:58 +0100
Message-ID: <CACRpkdYRcqHoW5KOaOW-kSh5QsTM2nZgdfM5AnNPZiepx7FWPQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add support for software nodes to gpiolib
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2022 at 7:10 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series attempts to add support for software nodes to gpiolib, using
> software node references. This allows us to convert more drivers to the
> generic device properties and drop support for custom platform data.
>
> To describe a GPIO via software nodes we can create the following data
> items:
>
> /* Node representing the GPIO controller/GPIO bank */
> static const struct software_node gpio_bank_b_node = {
>         .name = "B",
> };
>
> /*
>  * Properties that will be assigned to a software node assigned to
>  * the devicei that used platform data.
>  */
> static const struct property_entry simone_key_enter_props[] = {
>         PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
>         PROPERTY_ENTRY_STRING("label", "enter"),
>         PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
>         { }
> };
>
> The code in gpiolib handling software nodes uses the name in the
> software node representing GPIO controller to locate the actual instance
> of GPIO controller.
>
> Note that kbuild robot is likely to complain about this patchset because
> it depends on patches removing [devm_]gpiod_get_from_of_node() and
> devm_fwnode_get_[index_]gpiod_from_child() APIs that are still pending.
> I pushed them to
>
> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tmp-gpiolib
>
> for your reference.
>
> To: Linus Walleij <linus.walleij@linaro.org>
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-acpi@vger.kernel.org

I have waited literally years for this patch series :D

Acked-by: Linus Walleij <linus.walleij@linaro.org>

The ACPI details is Andy territory so I dare not speak about those,
but for everything else I think this is a go.

Yours,
Linus Walleij
