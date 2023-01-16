Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B1366C262
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 15:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjAPOkT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 09:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjAPOkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 09:40:00 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C989A5D13F
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:17:57 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4d19b2686a9so254922177b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jMWPYbjQSmRVDpKeSGqsCVfuSkZPvGKrSB2oUbUO47s=;
        b=SYFK53kycJxgo7F4nx8t+Uq1rDJ1llc++BuMPl8M5ZJX2xFkRpK8p5whug2ez8db+A
         KIPMoV484I7tP9WiCqbxFjGfOd6nez5/aptbCRUbR8qIxZ6txax865rbxwZL6SYCc7Ke
         RUib9ZIwffT/BYLQey+u5bZmZDr9ohQ3xlBmp0xuWgMMaebTCOU3NB4e/fIZ8RsF3HI7
         1dmvlBuN8v8tuoQPmaSMsb1vRnWEl+qLXvyJM3t1erv6w8kBP/k9JasPdAPgurI0RfPw
         XWsgS6ncV+ctoIcTMo0TImuXXSYEym7BQsIGVffj6IWXo1qrVtYaR0iNwrs/FiIEAo29
         MVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMWPYbjQSmRVDpKeSGqsCVfuSkZPvGKrSB2oUbUO47s=;
        b=ZotuiWeMCGiVnWJjphcbyHN0nPeyb3aLkJAW1SVGxXzr2VCWh2uMmqDSvxfSlT7Bsz
         dM34OBWkni3rTJzE5AT/H/cKvCz73OTmZvvMF0EX3+HSK+h70xjYfSGzoXkS3Ice0sSO
         fmXZbc7o9seeirrCyqgNuFz1zkvvbl/9ieGf1QTGnat/qS2DsarNRlLMDqpp5ZBQ/Kvp
         VqQXM3tijrS1EsPPlXUvhM397EEj+ehIebDQSHVOwnQr+uGCSVfKNK6d9iov7J3m4FjG
         o2Zvip/uV40NP5HKqp8vBZfEEfLsh705lIcYCmxIgpyHQRndMbNzOSofA+1fNB1ZdJZ4
         pi8Q==
X-Gm-Message-State: AFqh2kpfZ79usTpy7apG6fMYNSWKJ7unJkFEtFODIb29CQwXv++2bbMx
        JWiyr8DB8AV6VkVz/ugjxUTyNElt3Wwc+IAREu6t+w==
X-Google-Smtp-Source: AMrXdXtAh/ZzXCPDoVr/80rB6yvhSPUFDFti/ZSylP6eMttiHYWNAgRlJEvBO/7JBrCK/xVWI3UCXqewXP0ad6lW/PQ=
X-Received: by 2002:a81:a084:0:b0:4dd:ff06:1358 with SMTP id
 x126-20020a81a084000000b004ddff061358mr1666940ywg.488.1673878660244; Mon, 16
 Jan 2023 06:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20230112144526.66794-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112144526.66794-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:17:29 +0100
Message-ID: <CACRpkdYD-MfgCBUdTdNU0+kx+Z6parEmWwQC_3smDYxG73=XGw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Remove unused of_mm_gpiochip_add()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2023 at 4:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> of_mm_gpiochip_add() is unused API, remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

A bit late to the party but THANKS for doing this Andy, it's been
a pain for years to have this cruft around.

We even have some traction toward eventual <linux/gpio.h> removal
now thanks to Dmitry's efforts, this is great.

Yours,
Linus Walleij
