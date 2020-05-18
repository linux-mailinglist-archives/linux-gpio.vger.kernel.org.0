Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DDF1D71D0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgERH3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgERH3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:29:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A68C05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c21so7120704lfb.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=KdzqRAP43Jx15JsBd7CMIo/2/+5tguTprPLSwNIyfoZQ0+ufPuN6S/BANnhJsjrhDD
         DtP3v+cVRz1H4W7gZemFOLYygUe9Nnqc8CiVseZ1qH7MkopzW0uYIM/6QDifbVQUaEzY
         I9Io5hrtK55gyaPukpP3UulY28GmqBr7704IEqyzsek9z5cWKXKh+nj6/8N35gBEzKLB
         z7UbsMop5bQJkCqzM/P6qv2TYsuzenpxX9AvppK/Ewkg0FlUbL6cOIGLnAWxK13GtB1K
         pL1FPAWkCnhD9H5FlvEDJp4hPMXkM7uAmjEi0J/HlDU7NpDvA7JOV3+ynsGeu4wzmRsg
         XxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0QQj8C5JeEmDZ6ZApGtOW1NT9hev78BCGty9WyW8HQU=;
        b=MtWf5E7GE6Qr4JmkZuT55w5wwNFWbuZ/pfZaOkjlKBrMimOSIr6XAqmzTDB99ySZWF
         PY/OYwgQDJkQCJ36sIpy1ti1Gx4fnFVg4pKCxORU7ybaxj5ArXm6enP7yAUWwMq7bTZ2
         ta8dH/nNGrl5R9d8pb49XhFrGWqpuzJmrkgNg62xWQ4VLYoAXuREb3YriQryfb4a+2vF
         5YRdYZlXP9Mk33qVz0dbCF6uvkGAI3apMVkWgQWRbNcWjkot0fdcCJ7uSTDu5QeRQZF7
         mh4IoHtmzbIe7b+Nd7rOWyw902rIDkRgJ3BovofPWjZwsZUgEtNJzbeLi0sCFN5ZajU/
         IUgA==
X-Gm-Message-State: AOAM533VEiOupgumaFZbpggTI2+OYGp9L6e5l8Zn/tGNScylbF4p/d9K
        W80PEh5SB80PMTZCQsx8mO9Du4I8VKaRm/TEsGO1QQ==
X-Google-Smtp-Source: ABdhPJx6fCXx6eAlYEP7owDMWFfg7cz4sOJv/yQfCTAhywTwMqJW95DyJ7NsllwioD8AhEiAVzPb9dcty/D6ToHML3U=
X-Received: by 2002:a19:c8cb:: with SMTP id y194mr7741076lff.89.1589786992310;
 Mon, 18 May 2020 00:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-2-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:29:41 +0200
Message-ID: <CACRpkdZF++0AExBvDHNT+whKP2sNKnbczV4w9SXksG2Dyctecw@mail.gmail.com>
Subject: Re: [PATCH 01/14] pinctrl: ocelot: Should register GPIO's even if not
 irq controller
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 13, 2020 at 2:56 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This fixes the situation where the GPIO controller is not used as an
> interrupt controller as well.
>
> Previously, the driver would silently fail to register even the
> GPIO's. With this change, the driver will only register as an
> interrupt controller if a parent interrupt is provided.
>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
