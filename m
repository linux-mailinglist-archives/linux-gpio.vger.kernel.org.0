Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5667A6AC322
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 15:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjCFOYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 09:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjCFOYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 09:24:05 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1EC31E18
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 06:23:09 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536bbe5f888so186377317b3.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678112461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5dOWzz5ptG78/24FUVPQGUEThQ6H9diL9d3zhvn+uWM=;
        b=GNs48ysPbT/xZ24D4CfgtbT9TZY3jSruyqLWF5Fty1geh6KAQp8eXevTTOfRrxGoqR
         mEG1UOzDvKmcE14L7+UEteRTt1OAXVAa2ExjPl98v7DlH34ZFXtGgrBBr3FTBs5BCqgc
         xhBv7a5nSXvLqYxurnCASKlNTk/gB7RxuxujOSiRFBjGXExeWMO/WKqXI8LzgfDw7jvw
         z65e6Xw0SRWVGgPKZkBREn9O6AC5oGztdhduwBZVu3cH05+XgSWEINmgjl0FRJorH9sg
         eggxDRSs4XVFSNvXGkZBQbbXObC/ezaFPG4NiFrb8t6yZ6nZ7LCs3kSMVTOCqsf4WoqH
         3v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dOWzz5ptG78/24FUVPQGUEThQ6H9diL9d3zhvn+uWM=;
        b=Xt1Q+iioPodP4FYbvr3f/6Gn4aYEI+peMPPsxF7211l5aae6sRBQdbFSxg5ivoO/53
         MArFK8eQXyI2QtSPHJWArtoOx0G43bQ3oYrrio+8JWRiYk8lBI4wxmnplfIf0JRDy02r
         +1TGDPZHGGjxwhb9fXbNYSm2iEdwvZwldekW2+kyfdY9hm3Zm7yuq6cg6GPCbI7h/lL7
         6P4zTIamIDQ+VYMALTSq8aJFjKIR4NTNLB8Z4fBgmlJkkRqY6rhSMLS1LJeTP8aw53GQ
         acAA6/Rr4dSNpUwJnCeC/zHm+B3M+/SW5bd5S64efoyXJ69PAYTuZnrOheDvOdapkWxq
         lx0Q==
X-Gm-Message-State: AO0yUKXt7nZu3H5rwkjjS0Oyq6j4GboMTPSSECOEPJRw1B3KR1wn5Kan
        fmt1zCx+EWTbD4WGx0mt4b0ipAZDKXvhG2yAb2xpJg==
X-Google-Smtp-Source: AK7set8qwioBxXmsDhA0H0TuRhZ8UNvJ2+iD4V1ti22S71JgWl+a31bTY+XLGka4hSvMtw5SMO+aM+npxDywx06BCDw=
X-Received: by 2002:a81:a12:0:b0:533:9d13:a067 with SMTP id
 18-20020a810a12000000b005339d13a067mr9186983ywk.3.1678112461287; Mon, 06 Mar
 2023 06:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20230227205131.2104082-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230227205131.2104082-1-dario.binacchi@amarulasolutions.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:20:50 +0100
Message-ID: <CACRpkdYLRyAzRuQDe2PZxOGQG_YwmE2YNnE8UDcj_c+Nt0HH5A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: use dynamic allocation of GPIO base
To:     Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 27, 2023 at 9:51 PM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using static
> gpiobase allocation"), one or more warnings are printed during boot on
> systems where static allocation of GPIO base is used:

Patch applied for fixes.

Yours,
Linus Walleij
