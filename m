Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E5C66C13D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 15:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjAPOJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 09:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjAPOHY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 09:07:24 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A4B22A3B
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:03:43 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4bf16baa865so380859297b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs1nOC1BgF0Yw9sZ8FNPaDvLfeuxX3ryCgdw4QPGT0Y=;
        b=NpTpfQpwXRyV/0FZU7AxgVGzwv5WYCS6o/mqW5qp+doCLsXz0N+OdxNUFHOwSQI87T
         fqtUfEXnX7RVFAvkcVbesfRy5u4TvfmKQx/XMX2BdU6Ytg6IGmr8N8GTaR0dEibHOSa8
         fw/OQS77aPMsPVYazNn1FWGV/hK2GXbWNYAZ+9E8qn4zEhY6htJwMMb7utgp0ME4ttVE
         r4jlszYkM9jYlZcdea7YttzodI6tgc+hQ+8g5mEu0oT4Em2Em+jDCkt1nZPc8gwTtri0
         ikPHbl2ngXYy09iiPKgsDl7hM05pgcjdvkQWWeoiBliyXK2F1e/sTBza59TtXKCP03v8
         nFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs1nOC1BgF0Yw9sZ8FNPaDvLfeuxX3ryCgdw4QPGT0Y=;
        b=ltaALlKE4+txxLxRhiCCYePkVVdhgj7WD00ZRyzkksiMjSuUgHtQT784m9SiGKxjuR
         gJCDt/4MG2rOA4Fbvt50J0LHV7mmHO1O0YDMFYfP+NP5dYx6fgNasiSM6Qq4UE0vTtpl
         0ToJNuumZuckDlUh2ZEiGvRJNhQdwZPvmCtmyfk8gq837Y5Q4bmXuarlRS9xPKnc2Sp3
         A5MtdNAWaZnx4xtUOSb6cxo7dF/rTca2O9y0N5rzhhbgNL5pNrA2UcRJ5JsNFDTAIsH7
         EMhxQQFMmY1dIbNjX0jo0kg1DPRz5/tGlSte7aqGQGzWkTE8dYynuUjyj+AbrElphxoC
         Oj5Q==
X-Gm-Message-State: AFqh2kq2uzk9ErFe+SMzkHrlwuhjmPUWEUpGHW6kdI9ng5hUV68nUlA2
        x1F3MKkaxSJKQLTB4bbyVmW05CZBdqjuCQ+W4Th5mjvwuR1HFQ==
X-Google-Smtp-Source: AMrXdXurzujl2iT8SUQnqmXrhxj7HcRTi+V6Nb7ymWtMCMJW+xhnjzzeHzauY3+XtIvkPSgoEvkDo4jpe3AyvZozrVo=
X-Received: by 2002:a81:6685:0:b0:4dc:818f:f9f2 with SMTP id
 a127-20020a816685000000b004dc818ff9f2mr1265000ywc.469.1673877822982; Mon, 16
 Jan 2023 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112185122.45216-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112185122.45216-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:03:31 +0100
Message-ID: <CACRpkdYVFxMQVbM47cMkiKGRhtEWUKHT309P3pj3AY0x1EvhZg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: sunplus: sppctl: Remove duplicate
 assignment of of_gpio_n_cells
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wells Lu <wellslutw@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dvorkin Dmitry <dvorkin@tibbo.com>
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

On Thu, Jan 12, 2023 at 7:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio_n_cells default is 2 when ->of_xlate() callback is
> not defined. No need to assign it explicitly in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
