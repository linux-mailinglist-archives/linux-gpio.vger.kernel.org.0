Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428635BE57C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 14:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiITMQ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 08:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiITMQ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 08:16:56 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F557437A
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 05:16:53 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l14so5645212eja.7
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7gtq2D7ZlY5x6f4bF+Iyc+xdvmS4p6zc1uZBoY1keB4=;
        b=OJSTWU4p0vvqx+Eq4FPfcymTaD8QbFgEBPo+iQBVkrmyDk0X8kOj1QoC6UJ8ethNGr
         zNElUFOiJxVsY6MEQe4O/LUxV5sjpsQCIpidnv/WplAMfE6mlFwWlxPQZ9UDcS/HGT0N
         y30NlrUKzLJAe63fbQ+MiX7FGaWgxiztKlqwN+XhrW/vrQGaONtnZlblUbZyH1NUt/9k
         mp8h8h+88CjYf1tlatoLRDU8IyA+GL5fB73vdIdF7bNvqQ638c7U4FAAKxS1AtwX5HKU
         GR2qPT9YpfT3TBRdWR8I4/g++qRXkMM75yRLleUilfvnEJF1sQTmF9sJmh/4O4yrfTHQ
         KAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7gtq2D7ZlY5x6f4bF+Iyc+xdvmS4p6zc1uZBoY1keB4=;
        b=MRKFXRWqLMlPx9x45QmravbpXAO2M/pSLhtE4HuPV5L59ls/2HNDkM66040YiXt3iB
         DZIOgz/3XT+Oib5gZqzHd6xRc/FYuE8Ot+6S+JYOPe35CDHT1gCS19PuWw4Ncpt2jBRk
         QDWCgPltYzicpNmun5g02K1n9XL8wO+iFR/eT+u5LfrAMBjFoPUyllp7AvoFQGwu09A6
         vM1nflH42KF9dKmylfCdlKpHWOvyCNEIbCLDxvsw64eOgWDR7gIVWIuqg2z6wCLJdeKq
         SN+DkMxFVcWAPEwaOcJBMNjiQWOh5ReRvN6dU29YXZuzngzcrBVNz6X1nhMUkEBK+zmU
         6RHA==
X-Gm-Message-State: ACrzQf0cCnYV15OPJg3PkM0bMY/YkMw8Im88yrxWklrBaj8pTBGId/RR
        9HOYk7WqKaFS/V4ekFhb78Uod0Nqux8XVNDIq/DViQ==
X-Google-Smtp-Source: AMsMyM62bRTISJ7ZRxjTcCy1xiJ9QX0kv+wW8eMNky+/hKqM5AMqckoNDXqwsdKlnDnehUgviL7xaNf2l4YNJ/n7Hho=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr17118089ejt.526.1663676212184; Tue, 20
 Sep 2022 05:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220920010930.822856-1-jay.xu@rock-chips.com>
In-Reply-To: <20220920010930.822856-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Sep 2022 14:16:40 +0200
Message-ID: <CACRpkdYhCsOVN-sjAFaDBAS9nk7kn0cO6CshSsygcXAYZ3iC5Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: make gpiochip_find_by_name to be common function
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     brgl@bgdev.pl, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.or, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
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

On Tue, Sep 20, 2022 at 3:09 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Move find_chip_by_name from gpiolib to the gpio/driver.h, also rename to
> gpiochip_find_by_name, make it to be a common function.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

It feels like you are reimplementing component_match_add() and
component_master_add_with_match().

This is infrastructure from <linux/component.h> that make a device
initialize (bind) and probe subdrivers from a master driver.

See for example in drivers/gpu/drm/vc4/vc4_drv.c:

static struct platform_driver *const component_drivers[] = {
        &vc4_hvs_driver,
        &vc4_hdmi_driver,
        &vc4_vec_driver,
        &vc4_dpi_driver,
        &vc4_dsi_driver,
        &vc4_txp_driver,
        &vc4_crtc_driver,
        &vc4_v3d_driver,
};

static int vc4_platform_drm_probe(struct platform_device *pdev)
{
        struct component_match *match = NULL;
        struct device *dev = &pdev->dev;

        vc4_match_add_drivers(dev, &match,
                              component_drivers, ARRAY_SIZE(component_drivers));

        return component_master_add_with_match(dev, &vc4_drm_ops, match);
}

This will let each driver bind individually, then the probe calls will be
orchestrated by the component_master_add_with_match(): the master
probes first then each subdriver (hvs, hdmi etc).

This makes it possible to control dependencies in componsite
(componentized) drivers, as you pin controller and GPIO controllers.

I used this for example in a charging driver with dependencies in
drivers/power/supply/ab8500_charger.c and in some DRM drivers.

Yours,
Linus Walleij
