Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428951F1885
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgFHMKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729310AbgFHMKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:10:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0AAC08C5C2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 05:10:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so10505847ljv.5
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnuMx4prJWaz3MmSDSX5luNYF6ny7VlBDMlvxGDVpnk=;
        b=DECe0DOEoc0ekEHpqfhzy854i+LLcc3QojC6oWvBalgcxRCcNcQ4UdYmA2KEPxqjID
         CIn9xhmsyQQaCvxYE4inItjQh1ujSbkGGPC39BChqRi5Fx5mZV2GyQo6/JmmCFAfg3bR
         PY4u8sxcQbV1An1lQQdyaEMOjh5HMJJR0WFZcpS+BAGwG27KZe2On0eDMJi3g4w+OJd5
         LBGl/Qu+/hZYGoDqJ7ugci8VYcRhFdJTxv4uIiYYhFNwB4Nj6abO9byVEg0d/oWdoAIy
         /Ai6Tq/W+xjOf5ZtEW3kpCyrXxVOf6cbVT6FqTI5v1gSvl4MZ1DrfZuQDdUKWUfQziDK
         +2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnuMx4prJWaz3MmSDSX5luNYF6ny7VlBDMlvxGDVpnk=;
        b=IEYAWeff0oGwR4ZcbgznBLM4EHxuHSCwv5Jv/HzVw576tSl2E2ruPO0d0vwY8rSy1q
         eY25s/1ZhRBczOx3advDvyWhIp5lVgOMkv9itjlFC6Q0MWdWNJIztoH1b+Srvzonh8AB
         GJAE0nrovd3pFg7SNkqNlCjThTKckUQoNLHo5mwknlGO+y4qoQ91uxT+/i1rOwgo8/MH
         Z4AbI5R/yHq39UxHycGtrbN2gEQrcspGC57hmtptjFFe6qY9rp9qmvv2hYgZGQzkHx2f
         2mWGPmQfWEt++5biCb9mubSw8faO7rHEpJ+sI2zQOkgACVhSIuvn9/msA9W/0fEAgyDJ
         n8uw==
X-Gm-Message-State: AOAM531zALHmNC0vMQ556gKX3flqLZjUnCJqYwZmESJZhcvFQMQ4s16y
        cp210L2KZYO4o6yEnHKZdOeS+LSF6zrT5Td3zn9h11AXAXA=
X-Google-Smtp-Source: ABdhPJxW5ecrPm+pTD3M1VrIImie+Gc3JCP+X7h99owAXq8dopRUH+VgPgDUeyn8KPE4u97b+jNBLaduPggqeRlcda4=
X-Received: by 2002:a05:651c:38e:: with SMTP id e14mr11268758ljp.452.1591618234427;
 Mon, 08 Jun 2020 05:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 8 Jun 2020 09:10:22 -0300
Message-ID: <CAOMZO5AKmzm+bx5t9hfF46ju_47PM-Mt-jSBW51iGPc5xkX6xA@mail.gmail.com>
Subject: Re: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to
 avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Haibo,

On Mon, Jun 8, 2020 at 7:10 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> This patch block system booting, find on imx7d-sdb board.
> From the dts we can see, iomux and iomux_lpsr share the memory region
> [0x30330000-0x3033ffff], so will trigger the following issue:
>
> [    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl driver
> [    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for resource [mem 0x30330000-0x3033ffff]
> [    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16
>
> This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.

You missed your Signed-off-by tag.
