Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2075E600BA4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 11:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiJQJz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 05:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiJQJzX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 05:55:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA743B9BF
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:55:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id m15so15191148edb.13
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=30EAH+XQfO06e4I2eO6QbmQTxUyBtzeSnBO6VcUGovU=;
        b=A+vzie+Aa0ZqBEvoKjH3Iyik7guSk3Hj87QY6tGOEcp8B9mjzR84xnOzZ6pXK1uFbH
         RTI9LdnRwuSZma670NiYkz5gFoTzRsXYWUeEXlhu720/PJMQJ4k4fOajgt+qxITMCk9k
         1fGz1t443zQ+k/7aQjSePoy7ZSwOBEmh0YLzHK9rTTcwfuxMQbHaj9wHgk1kpPCo/g20
         4/0uctMBA976F8NyYCgPXXxweCYTulLkesiJ61KpeWAuIEokXJEmuHwrvkFOhLEOS0Nf
         HCoFqgN1nlmMDrsGPNCx1+uvj2Lbd0KY99hl3tFOat2AYYElRHMTNy8IyMXUHqtBhopq
         eM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30EAH+XQfO06e4I2eO6QbmQTxUyBtzeSnBO6VcUGovU=;
        b=zlaYYmQf2hBoJrxLl0I1AcCu5+88iq5uWZrSeF4jX8QWsLxqpvYfqaBsya0BTsUCkk
         BGZBvZ83j86lTW7JQEK8OS1vNg8MX7Nmldz+Vt8HRVQsIQRsLBcY2P+TEYs8UYMMghdc
         OAmM0y/2QjmzS4mIsyDqYLJoQy/PXr3t6Kj5V3QSV82iIELvwP1KThiFNmwmom8Z/dH2
         qXTZrrBAFVO43r6kUBaHbuOfMl01SeK+EdkcBusVtNoComcYpUoGoBlk4NM9MbFeGmZO
         FXDqAEozG/QXlyvoN0LFgVrmrQ6pm+SaQReQknYGgxompZyemhb8JQmvEsYTrkEdrAbL
         +QAQ==
X-Gm-Message-State: ACrzQf1w3uhIDxfsqZm0faMUNCD3FphcOJS9ZyjXAPZB2sP75ceBOz+r
        Pv9D4CM4021/IPg1w2+M41JJ71PyWHPhquis5dYdbA==
X-Google-Smtp-Source: AMsMyM6CVAqN3RuuHWsXYQ9UticrO6eK4VOYvsDHtH6SLWpkaSBuVLEAPy6VWCl0UwB6PuOYrp/2Qb96Jj6NNhv8VYE=
X-Received: by 2002:a05:6402:2694:b0:45c:a035:34bc with SMTP id
 w20-20020a056402269400b0045ca03534bcmr9347063edd.158.1666000518591; Mon, 17
 Oct 2022 02:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221010125221.28275-1-andriy.shevchenko@linux.intel.com> <20221010125221.28275-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010125221.28275-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:55:07 +0200
Message-ID: <CACRpkdan+xdcEdXz96Hm2dYWtQdEEqFGQazMYK1_9nonSCsnJw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: cy8c95x0: Implement ->gpio_request_enable()
 and ->gpio_set_direction()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 10, 2022 at 2:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Without ->gpio_request_enable() and ->gpio_set_direction()
> callbacks it's not possible to mux GPIO via standard GPIO
> interfaces (like `gpioget` or `gpioset` tools in user space).
>
> Implement those functions to fill the above mentioned gap.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, it looked a bit scary but I realize you probably
have tested it on the hardware and made sure it works.

Yours,
Linus Walleij
