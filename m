Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED5A7290EB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238667AbjFIH1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbjFIH1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:27:30 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C7B30C3
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:27:27 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565cdb77b01so12729687b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295646; x=1688887646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79c5wwIkf5JFBuHBe/pz5shE4weHE+6yaH3P5LzlEZA=;
        b=CDzIQHQESQF3OKQcN2e/Uk5EHv1GuvRpWWO6qmJ28hV2ZWI0oltmfJfsEuVni7JKUj
         MCdkaTR+qjFMBLDpsbPTxFzbj0w+A1JE/fAuGkUh0K6HjZzUrICNeUSAWaD+wOoNSS+P
         3FxmA4eW0FCjImvwEvo8l3yBa021DL2+11cFd53jLhmiY8Se/cULYNYoenWkI+RBXecI
         xmjN5QtEggW/NGkgrUp5NplJ3uOONvUVP14do+mliUULmzE6iUR9pHU+yyrl+xAlcBdM
         qBrseG0CmciAuLddOaigdFvLesrrEPSFx+PExltJsxIEHZq1Y9lgwGCE3hPUCH9MzndW
         3jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295646; x=1688887646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79c5wwIkf5JFBuHBe/pz5shE4weHE+6yaH3P5LzlEZA=;
        b=aOzTkCxtqSNhAj3kOuHeqpiCs6m344ufOcm3tgUo7K156TLVHX5/2wMfcLMNfegACG
         eMABMC10w+AY8YVyJnbwsL0Tq6TDnPrxluGIpW98iQOvMU1QZFhHd+UScWQ+ikrLwS1S
         q7LbYThUo89OMq7bzniLBHG7blJfE57YW/O4CNVJt1n5QIb5cWYd0OwB1IRAgXbtBiq1
         BOYa0UWX0RMv3Iyb7rsfGEePpx5uWBNinEyoRK3dgb5ktmQ8fG3buj5CS67BO9Y5/+BR
         btVW7qfRak+aWhIokcKSbxBoFLslYpG8BKjM9E3awLv2hMPriwnT4eJ7EsMPDmHCCAVs
         g9aQ==
X-Gm-Message-State: AC+VfDyQECkS5iCFiDWBeHea7FbpGMHMbJWDthqt4bte34owepEp5S+V
        Au6GDJAvAt0oRx/OVqtbBzM7OQY+3Lg5jPWwej7FBTWOXQQhoZ0v
X-Google-Smtp-Source: ACHHUZ6V8n51QunpOT9L+GvuKgO/ttKnk5Hb+I0waoIxJieTUrGVZBGkGdL4GRVfFKMIqAUIu0H1FEJhwjKDXkDyqJY=
X-Received: by 2002:a25:a025:0:b0:b9e:4d05:1f96 with SMTP id
 x34-20020a25a025000000b00b9e4d051f96mr385739ybh.44.1686295646461; Fri, 09 Jun
 2023 00:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:27:15 +0200
Message-ID: <CACRpkdYnFHBUt4rwLFqA7LYJRJxJ7e9hEGf_B8oi3rc_+Hc3AA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Remove unused gpio_cansleep()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 5, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is not a single user in the entire kernel of this deprecated API,
> kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working on this!

Yours,
Linus Walleij
