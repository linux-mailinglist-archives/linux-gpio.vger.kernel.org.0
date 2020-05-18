Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A6C1D71DF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgERHcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgERHcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:32:07 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9A7C05BD0B
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:32:07 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x22so4206406lfd.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yDgJBK14qCAv+Ly5Qcs1dAnO6ksblSLGGgT9S8evwgc=;
        b=JS49KQEH/OR4uP/4njTqN6ALEiaaKHohd/LBQiGVcdrqaLVdBHQ2w5e33tHi3qdAcV
         r9/TEQFnykL839HJTEeOQyT9l62tOrOfSFETZeZBOfY04+GeZW0HIctkfKDt1KNXK2Yo
         JS81rztNjP13LyCgnV8yV0i4SLa4Sbp0On6MmGxPxGt+WinOHQR2ErBrg0Vp1t/HOr9J
         xCpO99Bf8AJIAKLlqEuA4cAHAxh+j853D0+NSddrXD5zbnBFs85R+hIRGjeb1HpNAhjL
         LYY8pBUf+UuGhj/2ULDY7YsLPcr99IGVuvU+38C2/rTzuDA84Zw1hYFiyUSoQorlH/4C
         5dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yDgJBK14qCAv+Ly5Qcs1dAnO6ksblSLGGgT9S8evwgc=;
        b=kkcbraGJJFpUbW487c/LlsII1OVJnFoK40e4KzjWeErbCjeiNKFkHKJaIcfGwWsORb
         CEY3JNAZZqebs5RlTJtKMVE3xtQusVA5IhRTpWpzumysxVn6O+GjgzL3jrr9E4gZUkdm
         BMXaZttApgJ8giB4D51CywCP/ZVxE8TeuKx7NvO9xQCVNCymPXW/tVc9S4Rm1Y+Ht8XJ
         gxThmYKeoFx2Cwv5fK7IdXeCgGbvbb1wCdSsoGy9b1IKKEm6cLbt5Gr8ed2JzJMCfqme
         z1NI+20lHQnqzfUT3k+D0a4ClvcGvxzrIJfIo4UA3dnwOZ4aFs+I4USPR36BXez/0qlW
         9fLA==
X-Gm-Message-State: AOAM531J+BaDxu06NGdP8DcFVsC9MUxvyPU/3FmoSyKbccZu1huJ4JFc
        EPSYh4e/NzYc1Tegk5KpbmDKwJru/9VueiY7YBYD1g==
X-Google-Smtp-Source: ABdhPJwxV8YVto5NNCCuMGHZxBejD642Xxg/qE3YJ9UCpF1p3OO1llWxz/lGbdc0Fb6TgpRyFpP/j9gd8eCnm9Agq/U=
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr3837953lfq.4.1589787125044;
 Mon, 18 May 2020 00:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-4-lars.povlsen@microchip.com>
In-Reply-To: <20200513125532.24585-4-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:31:54 +0200
Message-ID: <CACRpkdYo7AUzWTeK+1ouq29R_7rVJ8cz=rjBHVTQjHFx9HmMQA@mail.gmail.com>
Subject: Re: [PATCH 03/14] pinctrl: ocelot: Fix GPIO interrupt decoding on Jaguar2
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

> This fixes a problem with using the GPIO as an interrupt on Jaguar2
> (and similar), as the register layout of the platforms with 64 GPIO's
> are pairwise, such that the original offset must be multiplied with
> the platform stride.
>
> Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support.
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
