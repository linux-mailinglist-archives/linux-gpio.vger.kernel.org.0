Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCD93B530D
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 13:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhF0Lks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 07:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhF0Lks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 07:40:48 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B10C061787
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 04:38:24 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q4so11995309ljp.13
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pQxWdYWHvbbp+2LcaBtIbSxJfMMlfDTA83HjiKw1VAs=;
        b=gpCPcR/xeh65GpyTKLghTUCKCBUjZmZjSIw5/3lU3NKaN0qDV3NkoX8cWkQV11nz3B
         40OLGXRRT97wWZApV5ufDcq691C0KWtf1RAgH8XW5aVRZQwl1eeEg0DXS3+W2fAT1X5m
         m+hV9nIbmlXdEFaQN2Ou03/cQE/ayWqb2OdXUvtpJ5TuNplnDcPDJ6QsUknv4ctKXqDq
         t8ivBcrq7AL1Ayxl34OP8qlhlpAvWs65z5y0bsXzRpvk8qH17qOwtOUgp++z/gVLriRV
         u+jxcOzu0P0gL88faPMjewy77CjAJEe6iaBoE4TAU0I2NFbOVcs1TJuDXMsIzmidoOLu
         umAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQxWdYWHvbbp+2LcaBtIbSxJfMMlfDTA83HjiKw1VAs=;
        b=SvWk5XMAYtSTTmRvkRtb7vbeKfPCiFeoTK4Zr+cCT+p81W/OCyr0v3J31/LmqzzapG
         RWVPJfaj4AIeYghk2SVYK5Fvo2xFrDs/FXahhPswwf1F+/Dk70kLTqjfjDASjsibOlNw
         G7+KULoD0BveZErHxRoE4v4WJrPzytbAOhKw3C16w0MuXRuras8oOUt+wpmOoQ9SYEaA
         nUQi9BeltqOisXOQ0r6riib6xpqPjQoWD2VP9c/bwh9NMghTJwcGE6WNpNvg96oGyH2Z
         ZBxW1VfvbBZLEpS8RR2aNy8x/GLqJOs6oheofvG+2JeZY/iu8wKYgUYio4wHxY99G+0m
         iGrw==
X-Gm-Message-State: AOAM5321UTnUZojIK6o9vAo+s0bD4n/70MY0P2x2tZwi/AEiFn3Lf7/a
        janHO+X8dsLqnhNEsqCfromT/UyIH7UsYIy8y+/5dQ==
X-Google-Smtp-Source: ABdhPJz/VCxte05fHrLvpJorkmglZCxD3yh2bBhdMx2Ohc3IjXk204q1B1o2taLMzCkh5u2qTWBzMxJNPZA0eNiYgis=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr15808817lji.200.1624793900993;
 Sun, 27 Jun 2021 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-9-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-9-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 13:38:10 +0200
Message-ID: <CACRpkdY=b44SLJNobNqfteYyuEcpB+aGZ3xRBwUSG7Yx116YuA@mail.gmail.com>
Subject: Re: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, it retrieves timestamp in nano seconds by
> calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
> it disables this functionality by calling gpiod_hw_timestamp_control.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

This looks good to me, pretty much exactly as I imagine it should be
done, and it is also nice that we only implement it
for the v2 UAPI.

Yours,
Linus Walleij
