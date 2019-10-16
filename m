Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7499CD9075
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392897AbfJPMLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:11:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43714 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731367AbfJPMLE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:11:04 -0400
Received: by mail-lf1-f66.google.com with SMTP id u3so17266884lfl.10
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAcMglJ0sMZP7+r5P2KE/QX2T7ue0jf4q4Bd1DSk2+o=;
        b=kPp2LbyytXuiszE7XqY4dsXBc5wTYwqSTDkG2glMbJy8Pzs+bcaA9exT6sjDt6XIxI
         zbDgBJPyZkMVp/13P/6/lt/Am7sHZmwIQXCDGs9gNOmVqkTKc0ASGOUrz1Tkxf1vOdUG
         3+hgdaFZVjnoJgKTORduGR9Px142SvukOwkjnhZ4d/pZsRSWfTcFrMzxMkiLgF3hLe3K
         Csr2B0hlXr5Td3UaKF3awDZKfKY9cC+CvK4bTh/rFyvf7V3iRGlJ4QDYS8RZ6m3014HP
         um/NzdbRHbtwz3zKwxhUh1JOv7s0RkC9B3V8DxhSywbPSF9Nz4ktSeYRwZ9gBWRlA9fA
         ee0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAcMglJ0sMZP7+r5P2KE/QX2T7ue0jf4q4Bd1DSk2+o=;
        b=CCOGka5j9099Pw5h+5Hia0edBs7/Hl0zzRhUMYyQIAwAo8t/4cwGNeFIYhj0FnlSsw
         iAMVO9vSPUqaKv+R78QVhmEmc3NXxblmBlZzn9sWCb/LgDbGZ5JjCr26u1FKDYjEfVHr
         HbU0mGt9Cobxl1vkDfiUj1+aK4Y5L/x/lvsNUGzG4TtMCjAHRiK0db43jjqZ7YOOH9uZ
         x/a7y/E+twpE5zWjdOhR9rG6Q4EHHWEEVtdSv52xDk6r4Oyyd458w699Y8ILIuxB7NW2
         DjSs7cSBLyyszCMfmpq+zEo4f7ALcZeCFQe0+rLgEU5D/AP7xiXIpkXtoNrfMaQ4yg7A
         SsTQ==
X-Gm-Message-State: APjAAAVW3p8J0paBO46DerNZUU9NCsSUWsmzvcfsX6D71TwDLzNbHPbQ
        MCjYQuZZsGzhve4ZZOKhlRMT45oitujRsyiFn64eEw==
X-Google-Smtp-Source: APXvYqyC/8s5wFJQZ84rZaLlU3QiDyhyWI8h+dFx0LNQamFK0NlRVzDmYzTFmoBGE7Ny04pOfYsYDfSM9SKQDobKlpU=
X-Received: by 2002:ac2:43c2:: with SMTP id u2mr2022223lfl.61.1571227863019;
 Wed, 16 Oct 2019 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191011005643.41007-1-hui.song_1@nxp.com>
In-Reply-To: <20191011005643.41007-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:10:51 +0200
Message-ID: <CACRpkdaU82GHxRbWqF-CxHdsJJ02YHtdA0kWvZz-8eCWXNxHAA@mail.gmail.com>
Subject: Re: [PATCH v8] gpio/mpc8xxx: change irq handler from chained to normal
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 3:07 AM Hui Song <hui.song_1@nxp.com> wrote:

> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
>
> While this will work, it will mess up userspace accounting of the number
> of interrupts per second in tools such as vmstat.  The reason is that
> for every GPIO interrupt, /proc/interrupts records the count against GIC
> interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
> interrupt, the total number of interrupts that the system has seen
> increments by two.
>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
> Changes in v8:
>         - merge two lines as one line to fit 80 characters.

Patch applied.

Yours,
Linus Walleij
