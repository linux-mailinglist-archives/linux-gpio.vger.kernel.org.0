Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E676B246E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 13:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCIMnQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 07:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjCIMnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 07:43:14 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48A430EC
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 04:42:54 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-53d277c1834so32361777b3.10
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678365774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pN4h/1ijmbo7VcsXSDhCDWn4G5XmpjpXno/f0xaIyH0=;
        b=Z+Dx/+gYAzdVBzbs1310VdlarysCjTY7EJ0rFvu03NmOB2bCGJJpVcrl3DUUZIpjF8
         c4S/yb7P4PhRkamTNhXU/D0mPpYCxlfr0YPRrKnX10BxaSnYtvq7l/uaT4bAp5aHvjBO
         C0l0UsHnkYs29Pub8UnHUpg13Nvd1+BMo5O88tWJNlYKV+9+Dg3QHgzm7G5nfdFUGyGz
         1R4ysnXcIpXRSZeJv0mfLX4EVcutBkOwy2xB/JtCG3Dd9wturQtpCfgfoH75IYMQPmgh
         zLmr0kww0Rlih1l29fLF/wACXNwFxlVv8JCBYWCNBCooiKq7SK9W7K048R1Sst0VcnT2
         oEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678365774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN4h/1ijmbo7VcsXSDhCDWn4G5XmpjpXno/f0xaIyH0=;
        b=Yb+9/o7l8j9HBHF3RH+MeLZSXqqbINlDHKW/MMvp2oiASVMGsP+tTzXKeEp6VL4tCn
         wyStOZ1gcJgCKB7+voRxldzR6uZtmSYK8Vie623bp9jBDl/GACq1Mzvad/pqf1nHEgoJ
         r3JEkOFBEYKQDPICeDLUx8L/F19y1cPgyj838xK78P6w6k+E2FbEtqkd76jvpdy28eXx
         LBrq4SvKhMcUyCcIsPTVpv2ExRBxyOCYHMBgLXDWancWkYcaymc6pJ9kt2PCAxp8dnE6
         RoGwZtxSg1vv21Vn3CZ51sGn46GlwjAqEBGSPXu2apo8xYS49nFGn0UgN3qMcfXlxoU3
         UG0w==
X-Gm-Message-State: AO0yUKXJe0E19POGBCgWFqVccD9NA/gCxldcBAWyS/hH9m6p3Od2FgUH
        Ie1BX+SQKxac23Iz30WYCRg+XHTzZrR6JB0jsoqPBw==
X-Google-Smtp-Source: AK7set/t/ge+RffANMD5Twp9435UGbkRmNCv0AEAYK/3L6JZ6ekMYOHyplvfHdKHhHHxUHJQvqTR3l+dEHfrX3PkKNg=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr13398613ywk.9.1678365773932; Thu, 09
 Mar 2023 04:42:53 -0800 (PST)
MIME-Version: 1.0
References: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
In-Reply-To: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 13:42:42 +0100
Message-ID: <CACRpkdZHXU7mrep-SnEYQiz0MFv4EaMpsnp_Q_AuwO4-s9iRhw@mail.gmail.com>
Subject: Re: gpiolib of_node removal
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     andriy.shevchenko@linux.intel.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 2:17 AM Dipen Patel <dipenp@nvidia.com> wrote:

> Should I revert that patch and add it in my next patch series or is there any other way to retrieve gpio_chip?

So what you want is a function to pass to gpiochip_find() to match
the chip corresponding to a certain OF node. You have this:

static int tegra_get_gpiochip_from_of_node(struct gpio_chip *chip, void *data)
{
    return chip->of_node == data;
}

1) Rename this function tegra_gpiochip_match() as that is what it does.

2) Do something like:

static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
{
    return chip->fwnode == of_node_to_fwnode(data);
}

I think that should work?

Yours,
Linus Walleij
