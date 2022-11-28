Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E280463B320
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 21:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbiK1U1f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 15:27:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234115AbiK1U1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 15:27:32 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26AFE32
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:27:30 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3704852322fso118074007b3.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKH3bTIhdP2NltugJv3hW78al1yhOHyN/jZ3aFLPs9o=;
        b=oB4/4Awq93GPhZpQh0/s5B/hyLh56UuwKnRlibyoSlNvzf7Snqhxy1rVnIIL0uML4C
         /8yqxRjUOVsaL873O1Ge3hBZT1ueRSeUsXC+21AHEQg/Ad/y4RW/QfOfm1BNfPrxT1MN
         JCx9723QQ+Xvu1ZqwAuqJrJdz2ClpW4UAWyvr057SrduA3YdpAX7Gg4+pVEo8pCswKuM
         YrjYNsYjpUUbdONReubbnv9c1Bh7CuC6ZxN9AXq3dlk8r8IoQCCRXWCdtgwOmOwhX6/B
         Iki1KMpdx3XLAYXnvP9rCAUUlt/dtQiRfjkdgjTiQHG1KTmWSJUlxO3s1y4nzDziQMIh
         GzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKH3bTIhdP2NltugJv3hW78al1yhOHyN/jZ3aFLPs9o=;
        b=gJ93FqgDw3RiPhnLRXdB18B0KO9J2EGd3zgcNKEP6TKqy70DiOoL6k70lXKTu1P+29
         Hc7LxtgqfgGctiBuJ3emgUVIPp/0PBkHmGFbP0OLk583YdsduBX9OOor4BPmihAlDqxx
         VGsRxfZkmtIu6+ClUZvncYM8CZMSceoomeFW+NtbTmg6EUim8FD8o9kSNsOp4A7MvOOJ
         e0KkmU4Ffa+Oraiy1S7Dg1yKqlNPDbBAJ7dOG2v7IduQ81EmUre5FX7VIBsLOhey/jlW
         3oXxV1zviXzO0tMOxprS4U3nb+Oi/HxUvxAMrUFRN6TN83cwObwXlbm38oZsV8TpJkpk
         ZjsQ==
X-Gm-Message-State: ANoB5plly1nMeCiStQWCS/aPQNL6tyISF3Xa6XzCiTWYjhAHiBgdDxTf
        ZcJO42wcvQ7DDjhFb8GQtqfz9I03cuex2wxOCrRz5/rxMxg=
X-Google-Smtp-Source: AA0mqf7w2rC6RWmFmxdrJXD7kfbLyBAM/ENCCW9sh8erI0TE2U2rKTP0O684i4H6RqKuZVwSsWUSdWiRgT1cH23Fy3c=
X-Received: by 2002:a81:3855:0:b0:38b:17c4:4297 with SMTP id
 f82-20020a813855000000b0038b17c44297mr33230012ywa.446.1669667250226; Mon, 28
 Nov 2022 12:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20221125181158.67265-1-andriy.shevchenko@linux.intel.com> <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221125181158.67265-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Nov 2022 21:27:18 +0100
Message-ID: <CACRpkdZvCMQH_TQF=12Oy5iX_XY0OTJCC6SWKOaUYCSvsXAUfA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Introduce gpio_device_get() and gpio_device_put()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
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

On Fri, Nov 25, 2022 at 7:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Introduce gpio_device_get() and gpio_device_put() helpers
> and convert existing users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That's nice coding taste.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
