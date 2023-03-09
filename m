Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC246B24E3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 14:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCINFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 08:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjCINF2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 08:05:28 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC711943BD
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 05:05:25 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id t4so1777229ybg.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678367125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnrANUjQ+Lrk34FiPIjYMi1eTOEaz1NM5RutVNwfpUA=;
        b=qQQA9vbSXGASTDa7L5itFUoKijRQMaQXHC+Tb184QLgGEu/WECKXsVuu31At3goYiU
         6TOsM6CDZN0NTXtfa1qwowt39JcLnz2e1kIFYU8wS9hN5aOv+je3AWUZ0tDdmqkXjjTd
         RuGEPIXiD1c/kF7NrYdcsz50PIdMlMvhnFV+CzLAD1K5MiWm7FaXg+DifUDBXhPazuOb
         XNF9UDbBxOqg2FJSOjgPgezyhWEhSkyuUv5D2Fpihu3/h1Fe/OBW4/ZHoLVBv3Sr+95b
         Hujy2sd663h8k2z23GEuD4X0GWB+qGSOls202Wmk7MW4t+06uU6HavrmiOSXGNkxOXAs
         tohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678367125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnrANUjQ+Lrk34FiPIjYMi1eTOEaz1NM5RutVNwfpUA=;
        b=fCUOj4fdTYbbHipPOSKpQNg4tA0AMZbp6lQvtmPDe2zh95oXkAALF3ZGzmDAVPGpXy
         vbbk6QSX3n3IKCNz0XBwz3YYKy/CDZnN3EAB7PojGSQ19wf1rV6h3SEpjgNaxpQmZOHb
         7NlXZNict1AjYHAFM4Ydy1d/KWWllFOY/3hOHuo4ZS+5IUn7G1ajBCkq3zoCDAYZXITD
         viN3xqT9K56ikFIE/zeytvoLs28h8W2LdItHt+/vDfXNeh7tZw3mxEjDpGL7ZFIJGRh4
         A2naCujZpuE06VQfoa9mDhI4kj67XPSNb7zJnVWi+uLZVoRmlajXlAqTr2hDwukKn3bl
         aRHg==
X-Gm-Message-State: AO0yUKUcQZUjch7nnfE4x7djyIJxi28UHV77x/2pTIkNDe77jZWZyUSI
        YbQz9xf9sVeSbY8rftzubjgctQQkyyP0XfF1rNEpGQ==
X-Google-Smtp-Source: AK7set/5Ta1ixeaI4lHltLEUpPHdNMmHGWIe1dSlPNgQRXkT0BZkj8fP0sy+IfcYvb8w777c9icInkovPtAqq5v+Y5s=
X-Received: by 2002:a5b:1cb:0:b0:9f5:af8a:3b61 with SMTP id
 f11-20020a5b01cb000000b009f5af8a3b61mr13349059ybp.4.1678367125084; Thu, 09
 Mar 2023 05:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 14:05:13 +0100
Message-ID: <CACRpkdY7zx+_QxDWMRa9BzXofvzeq-hJOfiH2WCRC7_pCUjCDQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 9:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Mon, Mar 06, 2023 at 09:00:02AM +0000, Biju Das kirjoitti:

> > > Add pinctrl_get_device() to find a device handle associated with a
> > > pincontrol group(i.e. by matching function name and group name for a
> > > device). This device handle can then be used for finding match for the
> > > pin output disable device that protects device against short circuits
> > > on the pins.
> >
> > Not sure I understand the use case. Please, create a better commit message.
>
> OK, Basically pinmux_enable_setting allows exclusive access of pin to a device.
> It won't allow multiple devices to claim a pin.

So what is the use case? Which two devices need to use the same
pin at the same time?

You can already:

1) Use the same pin with different devices at different times, because
   pin configs can be changed arbitrarily at runtime, see for example:
  drivers/i2c/muxes/i2c-demux-pinctrl.c

2) Mux a pin to a certain device *and* use it for GPIO at the same time,
  all that is needed is to set .strict to false in struct pinmux_ops.
  This should be false if e.g. the GPIO can be used to "sample" the
  output of a I2C block connected to the same pins, so the two
  functions (I2C and GPIO) are not electrically decoupled.

So do you really have a use case where two devices need to use the same
pin at the same time? I've seen much but I haven't seen this before!
Which two devices are that?

Yours,
Linus Walleij
