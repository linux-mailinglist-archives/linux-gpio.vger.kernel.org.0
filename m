Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A360D623D39
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 09:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbiKJIRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 03:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbiKJIRx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 03:17:53 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A809B1D4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:17:52 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id k2so3080852ejr.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0rNxJTluv+aPb6qbERbUxRGQJ+FJ2B1ayQ2etLoV6Q=;
        b=SjnpQc+sUQAfZXCU/tzpHLZoR+Vru8969ePWS+4wlZ4b/NTlQQgGoJHlUQhQNiULWu
         G3w/p3fk3EIHYeKedqJbgDFdtGxciVsTrZgvKAiyei9fxI8OxMQgO/OhHonmwC20ls/5
         P4BNwyGw/x30D/HxGlz7Pja1ErAiKIb+xSaF6OFZgyUFohSfsQjEMgrPZNf6kN9/xPRg
         sk9/iyk1C0o5kFnQELcSxVEAM93TOiBTW6/iqHI9TceCo7alfLQdbXc3jkqt3jUzoT9b
         sBKJbkg6Z6D5K/QoaKaDkKHqCJw9w+XKbAb20H0BySyFFxxi5s4pq/1uhzo6IIuzEnIo
         e1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0rNxJTluv+aPb6qbERbUxRGQJ+FJ2B1ayQ2etLoV6Q=;
        b=KnciOgi0F6SKIYXj3CRWrMC0+YR424A+Bh/bKRZbiVRHqYkPYW/Z1phcd5qnGJXERY
         XRotMz2LytzR73MaFET0mtTAfMjLdfFxE35m8HEEYMo7alekSqcLaNzxpVmFvAXcr6bB
         30OuNYTU3awRg8VrCEl2mHXcc4IeHAnqtfcyjCWG5zZXK4J+NYR6nHzvkVdMjyrL0z//
         S9YESpa2F0PRt1XnDHtjeVOS5g8uhtE9zXmrSsTOUgaWJXeHt1+H7gyYHKrJA4mz/1iy
         1BIcpVFReT/mXpLuPs4z0Ud/luTJygunWNJYdh1/f5I6rBAJjIqzthn7Gxr4EtBmH/FB
         SvDw==
X-Gm-Message-State: ACrzQf0a5bubt65j0TrqXUdnS3wCqCz6WOOPvWTOdcXx3zvl9I1Y5SKs
        xnp+WNSKiSVjhbJohCtl/AnI4k4lTtEHUowQl7MqxA==
X-Google-Smtp-Source: AMsMyM57abG3IX31gqYD6zyZL+Mj4T4rDNK7ab1oXdvxrtb/1s9RZjcKgk+ZPq6eWhOb5IA0UvRuMLN7iE5ATrx4B8U=
X-Received: by 2002:a17:906:2b55:b0:7ad:934f:abc2 with SMTP id
 b21-20020a1709062b5500b007ad934fabc2mr2266166ejg.690.1668068270958; Thu, 10
 Nov 2022 00:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20221109061122.786-1-zhuyinbo@loongson.cn> <fc52c692-4cbd-e5f9-2e62-d05b5330052a@loongson.cn>
 <CACRpkdbu-gqNBK0=L8pOr2TwYGOv2MUvFxzYiBNfJ5KyJT+A8g@mail.gmail.com> <Y2vA09rQSbCRX+rL@smile.fi.intel.com>
In-Reply-To: <Y2vA09rQSbCRX+rL@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 09:17:39 +0100
Message-ID: <CACRpkdb+siKhL+YKBarhRE6_f9LpQR=0y0zNihRLuONwQRkA7w@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] pinctrl: pinctrl-loongson2: add pinctrl driver support
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 4:01 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Wed, Nov 09, 2022 at 09:30:03AM +0100, Linus Walleij wrote:
> > On Wed, Nov 9, 2022 at 7:42 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> >
> > > I had added some changes in these series patch in v8, please help add my
> > > change and merge it into your tree and sync it to linux-next.
> >
> > Yeah no problem, I took out the v7 version and applied this one instead.
>
> It needs more work.

It also failed in linux-next because of missing MODULE_LICENSE()
so I took it out again, thanks for poking me.

Yinbo: don't lose your spirit, keep at it!

Yours,
Linus Walleij
