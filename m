Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7FB6A3F82
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 11:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjB0KgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 05:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0KgW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 05:36:22 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC99F7D9B
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 02:36:20 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-53916ab0c6bso162668047b3.7
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=katRvnpZHQkqAGSsGBo8w9UnkujyWw8lUbZ2qIpnUY4=;
        b=GwnvsEiCtINYG2zxZbN9ORqGQJ/1xf7fu4GdcIj8HzehD27Kfy1lwscqaaaS2QAUTz
         0IoHoweCfB+OhMdOvAkuNOpVucDCqd+i47jRfl/ajlyhEoHwgZB1tJ8ZatBKYqfVSHmH
         uvRtviB/4r30WjA+d/glCYDcOO5pQXEaIvBH59PePmxfkISdjH9pYCyyH2hWbBRebBOC
         BcrE+2XXXCPIEVLM4mdVcJ4IxTcAmAGfe+wXL99sl+UO5KQBG/tvkT3bRXid+gtpTksU
         OuAbF1ThoZWqQ956nyZrDGLwBvzsKi/Y30Z5KtiCteaAHagzeGOdM/gOmbLqyvsA7bA2
         VFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=katRvnpZHQkqAGSsGBo8w9UnkujyWw8lUbZ2qIpnUY4=;
        b=zYxPYOEh3ve24BiGLvdnKTLQzTB8b9TvRe3Yjry2sDtG7dZawN/UwWllAqiLo2w2mJ
         BtG5QIq7jqArHDFULnOAkmSKIWYWLp8h5ZdRgiqGMXprMw/PVGDAwEtcA+xg2ZLFdnDC
         w5v+Ev28nLOmeGOfUlR5YAdAlOXZ69SHZ+SiR/p6yC3dMYd+RpNWvtUR/IXxIEeorAJV
         QtQGNrH8qgXY4VAP3ituW7NFdrDnkMfQxugL9XG0N5jXVX+vMDd1sU3zq+qdjAkrhWRe
         3LBtDSAzFZEggpl91g2ltj6ryWSPnYHIMmP1RBgKnWbWE5thHabbS3j8HzPKzPgzsaeo
         gDoA==
X-Gm-Message-State: AO0yUKVP0sjty60clTVCOsRMovGM7dYa41GiyMZvjGHjjiZ4jiNEkBBy
        MBiBJhgbIIS2BO0+I3h5zdCnuFJMwqx+phzMQb7+FR3k1uwZ9FSx
X-Google-Smtp-Source: AK7set8Z7q9CzurMNWUplcaIxsflH5KFNIQ3fQDpNwtEUxufYs/JeaevZ3E9Ec6ABTJHcMXFHXrE20TEHInHQiPSNx4=
X-Received: by 2002:a05:6902:50:b0:8dd:52a3:b3a5 with SMTP id
 m16-20020a056902005000b008dd52a3b3a5mr8928431ybh.5.1677494180110; Mon, 27 Feb
 2023 02:36:20 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
 <Y/itg/cmrPCGa5qf@surfacebook>
In-Reply-To: <Y/itg/cmrPCGa5qf@surfacebook>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Feb 2023 11:36:08 +0100
Message-ID: <CACRpkdYLb6YApR34g5k8FzRi2ov5q7qcGAQ+83mL6niesTNxSA@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc3 released
To:     andy.shevchenko@gmail.com
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 24, 2023 at 1:28 PM <andy.shevchenko@gmail.com> wrote:

> That said, would be nice to have an additional flag (during request?)
> to tell kernel what it should do with the line after releasing the
> handle from user space.

I think that kind of lines up with the "default initial values" that have
been proposed again and again and eventually merged as part
of the PCF8575 bindings in
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

These states are supposed to be set when the driver is initialized.

It would make sense that if a GPIO handle in usespace is released
and the hardware has lines-initial-states set for its driver, then
the line should snap back to that state.

+/- however ACPI would define this.

Yours,
Linus Walleij
