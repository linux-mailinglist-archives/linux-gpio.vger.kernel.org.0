Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD406A060E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Feb 2023 11:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjBWKYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Feb 2023 05:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbjBWKX6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2023 05:23:58 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B714D620
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 02:23:49 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-536c02eea4dso168973057b3.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2023 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/OPltVfi8Fzilwf7h+y32kT/iTrktLLKyywaCM3Qp5Q=;
        b=LZ0tkeRhsbUpNedDVvt4VYjZq+7WKrzgnIwhuGkbcmbX0D1fmMZek4v01V0nUnkYwz
         8o1Gkd9ORHLBaYQeU3fZeb1lG54I3umPRNbTQRRRVbunGdT6a2O2o4WPeT+pu/LnTL4m
         v8zFxOBSl7qD+QEcRvlbS7CC/y8tMX/j4KPN5SgQOdoz6tu8C5zKLA/eyGdILhQFMuDD
         c1ITwTNBlpekxokU2u5kxqns4xu1rj2PM1n3I2FYaA5BBF9nS8DshqKN0izRRDlhRn6m
         qvSZ1VSGryGiOIV2Y29q1hDkVF4T8fJzCrXm7vvTovdJXYuFOJzQ8mxFxJm6ZV7KOVrS
         lo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OPltVfi8Fzilwf7h+y32kT/iTrktLLKyywaCM3Qp5Q=;
        b=udeqnV63Nvmtus2Wv/k/BR33f5kmckEn9x3GPBexnrh6nyOVTuUXPQjt2a4FGRN1p/
         mKZwyA8l8jo8jFUI+HXq0iFhcG0L276tEcNYfWrAm46khkE44CH+6Ro6C+TrfEoi1oOY
         vd9qUYaLSAvY6DNPLpTXE4AdFiigEwc+hvjmUr9dx5Cut3ysoMg39xpjmRYAQSqb0vXE
         D11UKB1911hEO6wWa4zFdlHtQN0fy20XgMd3nVMTXmwgJRmQ8jBT+aUT7XOMQYzxjrVH
         avIVLlxx3O8xzHJMEJPZgw2zrG8a347XieDAyPIuBmocA1dTmQi3YQOWZGUlgT69Ykco
         jNxA==
X-Gm-Message-State: AO0yUKX4jXqb4v+pPIJnR7Eryb8KGfQoLgR2wAdVAeCnx+RINWndfDee
        o4maIsLtmi+qcWgsdWedVyoBeA5GW093Qgf325TMCQ==
X-Google-Smtp-Source: AK7set+2ojjQW5QQ/ilb4x2UBbu2SgJC9wup1NY46kvQY3tCj+N/uP264ehmBWBwxxSqLZw8xltjx/QvBE4qPX1kIYw=
X-Received: by 2002:a81:af50:0:b0:533:9ffb:cb12 with SMTP id
 x16-20020a81af50000000b005339ffbcb12mr1972874ywj.10.1677147828802; Thu, 23
 Feb 2023 02:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20220824200047.150308-3-kumaravel.thiagarajan@microchip.com> <20230217103116.2126311-1-michael@walle.cc>
In-Reply-To: <20230217103116.2126311-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Feb 2023 11:23:37 +0100
Message-ID: <CACRpkda5NjddOUdqjg4b9YmJizd7Q0576S-nj4M=aw3xPF2Ywg@mail.gmail.com>
Subject: Re: [PATCH v1 char-misc-next 2/5] misc: microchip: pci1xxxx: load
 gpio driver for the gpio controller auxiliary device enumerated by the
 auxiliary bus driver.
To:     Michael Walle <michael@walle.cc>
Cc:     kumaravel.thiagarajan@microchip.com, UNGLinuxDriver@microchip.com,
        arnd@arndb.de, derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 17, 2023 at 11:31 AM Michael Walle <michael@walle.cc> wrote:
> [+ GPIO maintainers]
>
> > PIO function's auxiliary bus driver enumerates separate child devices for
> > GPIO controller and OTP/EEPROM interface. This gpio driver implemented
> > based on the gpio framework is loaded for the gpio auxiliary device.
> >
> > Signed-off-by: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/misc/mchp_pci1xxxx/Makefile           |   2 +-
> >  .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 163 ++++++++++++++++++
>
> Why doesn't this file live in the GPIO subsystem? Seems like this haven't
> got a proper review from the GPIO people (probably due to the "misc:"
> subject). Maybe even GPIO_REGMAP could be used.

I agree, plese resend this patch with the linux-gpio mailing list and the GPIO
maintainers on CC.

Yours,
Linus Walleij
