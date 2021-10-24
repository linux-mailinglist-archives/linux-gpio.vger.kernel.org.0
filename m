Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EC2438C00
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 23:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhJXVKa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 17:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhJXVK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 17:10:29 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B72C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:08:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bi35so274509lfb.9
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMYhbLkgTSqPSv9vA6KWgK1dElOofvGFtWwEO+48qZ0=;
        b=CCBwZTOnWvYExKQ/vwM/BrgQ+/2VXEta4i/lTffNfw3ohsCrs5RF8Di2tkXD7R8Y7Z
         9ImYAeELkS9dIztoT86WgcADOmObC7RVpSFYpgz+/50LupX31VuzTNej6sUzePQuroY5
         r4gbHDF/oxnmeyx638YZb/RUOGb+ZDJRlKK6zjRIKV6O9pOvVSMwqo4B1ZDJI2E7YiQa
         BdQfBeiHzL+uRB5vyFdJhTXJW5CWDfqTTDIvKJX3frysFvikSP0rBDRSynt8SiCB4HjA
         Tymjj8+wz1PdvZyiVTQU+A4frz7K2AGDAhuCNaHznPdjZwP0S60w1qdbtF2nSki37b7q
         thMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMYhbLkgTSqPSv9vA6KWgK1dElOofvGFtWwEO+48qZ0=;
        b=I57Xrx1MbD5oR4yGocyfoROn6Q+PRO2mSbSG71TXMjMhCkFxj9Q89pXzlzSjEuarF/
         MvrJfJLtMPBv+4IcWa6AdGcx3EtAR9M1HDkvB+jN/NwNk3JuyM1VLtHu/buXJgNZfuDg
         VCepbnxPE3uHYPErwHYv66rty78xVTKH+vQb5T1O3BJfAYYxkbLg0G8QDmI9pNy56xa3
         5k+KSiqIQWk5auRs4peFiynSvKGfvLV9MAOKC932f7rw5X10IS3RcaLWkdDNcqTwp6t4
         +vqTfjiU2tKzTpJfpy2DKJWO/WBORXCViSaTB+6DiV2nGLucmPLRHS9NpkRxcMcTSRWv
         ojMw==
X-Gm-Message-State: AOAM532VkGY96mzZzlPK/vTkhSqzIYYpibGwZdPp98yzm5G3nfAleRhM
        PpWbFIC+COIWtfQHbi7mc3+jnu42Yk+rJySCCl9Z3w==
X-Google-Smtp-Source: ABdhPJwAZbQpExa3fIcxuElrdBQpPSxEtV7dAaKscoaT6LDhlGxWjuDzvnxdv0SLWc6JCN8hPKHAEbgB51S3lCZGu1s=
X-Received: by 2002:a05:6512:1316:: with SMTP id x22mr13096950lfu.291.1635109687054;
 Sun, 24 Oct 2021 14:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211022124036.5291-1-sam.shih@mediatek.com>
In-Reply-To: <20211022124036.5291-1-sam.shih@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:07:56 +0200
Message-ID: <CACRpkdagzzWtN6Gp-ZMZkAqq7JwL0nf63J7NC8jpF=ZfRJG4JQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Mediatek MT7986 pinctrl support
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sam,

On Fri, Oct 22, 2021 at 2:40 PM Sam Shih <sam.shih@mediatek.com> wrote:

> This patch series add pinctrl support for mediatek mt7986 SoC series.
> It is based on patch series "Add basic SoC support for mediatek mt7986"
> https://lore.kernel.org/all/20211018114009.13350-1-sam.shih@mediatek.com/
> ---
> v9: added Acked-by and Reviewed-by tag

I have applied patches 1 & 2 applied to the pin control tree!
Thanks for your good work.

Please submit patches 3 & 4 to the Mediatek SoC tree.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for these.

Yours,
Linus Walleij
