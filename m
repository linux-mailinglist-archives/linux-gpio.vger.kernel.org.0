Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF243034B2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 06:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbhAZFZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbhAYKAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 05:00:13 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18027C06178A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 01:51:08 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id a14so3138787edu.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3sTQAwHfoRJvaKH/vQWa6xXs9OxptXgHLkzhd5OV29s=;
        b=g/i43z2GWqz/4c79iTb6rWqtPWnhKOVpg3Vg9s38NW+G3Z0pwVpjGcrclqfSZo64Yi
         gHDsozhgY9mASX9VmaYaGrb4is/OEa3j4lSAms1pZqp0x+6+rlz7B1Jenj8TUqC4LHxT
         jqckVQVqK3SB44NbZJB/xGXqfSrwOM6BWYACfcwD7fYhrx5ICGhQEWFE3ge87LOfEf4Z
         tTNw4k9nMiz+XngnriPnQfm/gkQ4Y0HmUGIwPwa9ohv9PiDXsx2De3xFvz6ZouKVTbwA
         Z21uapXWdJPkMyyD6idS3wH3bZSnCgb2120N26RUTz1a3eGEz7Bwsk7ZuwRon7y1Fv9v
         p7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3sTQAwHfoRJvaKH/vQWa6xXs9OxptXgHLkzhd5OV29s=;
        b=asdMoZWACW+dHEinW0w42M2TlFi7rx9K4VAukIriEMjOrFWDP1U+i4PAwH+PknKf5z
         eBCg1ODkMMQksRUxEXL8xqtcY62kU3jtWzy6p/SHhX1khj0RBjESTQqquXHEMS0tkq4c
         SJA5bG1k6UtikDol6b9Xpo+EfuYxNSyMXGZOiJRnr+XnbAuWHvDqu/jGrfXRd86hpaCG
         FUiW7gs5ZsHgO2g0j4rsp8tjyT48hdMoVklgYoM6L9aqymVQ9rVh1K96z4P7iHwEFs4x
         6NmuF1oJ0sJ7h4tO6mWjuOjZs+unQB0opa06RkW+prviJikSaNRE9j179KaVMHMwK8wN
         UuAA==
X-Gm-Message-State: AOAM531F6u9RAnQlbrlpEiUqRLRkywbwx9xdDYaaDL7vLYWOW031zg9+
        4JSFVg8dxYTHOHDWrb93JJgQ5MARYeuzPXVAy+bRzM2zOfY=
X-Google-Smtp-Source: ABdhPJzWD3VL+KVS+vVKPAdqW7ymqMv6I0aPQjq8A00k5+X0z5Xp8y4QIOPSPbclFNO/cHTlUUkW7h2zoHxRpJDgdvo=
X-Received: by 2002:a05:6402:35ca:: with SMTP id z10mr985353edc.186.1611568266803;
 Mon, 25 Jan 2021 01:51:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610364681.git.baruch@tkos.co.il> <75637257694de0d4a9e432e1d8270019a4e6328b.1610364681.git.baruch@tkos.co.il>
In-Reply-To: <75637257694de0d4a9e432e1d8270019a4e6328b.1610364681.git.baruch@tkos.co.il>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 Jan 2021 10:50:56 +0100
Message-ID: <CAMpxmJWjSyWkM6B-A7_eMZ38RmE4trvJ3oLaJdbkpr9Z00Ne0w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: armada: add pwm offsets for ap/cp gpios
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-pwm@vger.kernel.org, linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 12:47 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> The 'marvell,pwm-offset' property of both GPIO blocks (per CP component)
> point to the same counter registers offset. The driver will decide how
> to use counters A/B.
>
> This is different from the convention of pwm on earlier Armada series
> (370/38x). On those systems the assignment of A/B counters to GPIO
> blocks is coded in both DT and the driver. The actual behaviour of the
> current driver on Armada 8K/7K is the same as earlier systems.
>
> Add also clock properties for base pwm frequency reference.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Andrew, Gregory, Sebastian,

Can we get your Acks on this patch? Are you fine with it going through
the GPIO tree?

Bartosz
