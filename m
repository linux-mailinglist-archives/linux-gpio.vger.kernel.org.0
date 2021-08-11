Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FC83E9449
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 17:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhHKPM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 11:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhHKPMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 11:12:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6032EC061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 08:12:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u13so5170753lje.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcci7RbOniWr10zlQhNO9X9j0cPC+wiKIP31/PpgIfA=;
        b=aBg8VdW5FsdEAePlPJH13bN3EGjKQiYuBEI7QK4LybN3HujK+s4J/53haGtC051uKu
         u/Ft45mxut7bj9HPFYdlsUlulR71M47lG/HWA1wmt41myYVug2e12sGVofWo34pKTQJP
         zZA8NRctNZCEmiRrefD+3tP9U4TM/EEA257JrQaNC3P9CN9OHWgyjVCaRelX7jjtNyxT
         VDbAaTld2VVI/d9pIyWwlBt2oLJePJJ/sQAZ/n65IhOxbWPBKsN8CcHzKi4IcTiR5cmy
         U31xN+pdX8lyKp9sQ9xAoO20nWHVDQLdOn4+VeHb6Tl3J3mQ2KkdWqCdKuNwC7KhzFBB
         nEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcci7RbOniWr10zlQhNO9X9j0cPC+wiKIP31/PpgIfA=;
        b=XDQf41vkPcArO0/AqhtmSkeMgmKssead7cOamAuSEiquJ7QAOAJag2Lxou/oxEypZJ
         p3Due7pdu6idrYxHXT6xBBrZaD43NYvOGnclbjgnsTrFfkbws9GfSKbnAttRXOKNAxpS
         4SGqYJ4h14fQByYZmd37gy1EV2wBs9llQbKAH/aAswZhg8EdBtptmuEfaVYN/7R6Km4x
         P2+irPY3hGsxU7u5ArOD6T8p3WceU4xWjUvrL3EZ3WK46jl0/CYp2jCifKS0eS9F1RAx
         fXxlqZxTS+bJbGA/FIWo8e0Hjaqk9OuVigfhoAphfVior3TUvpYfTHcrgLRRzCMMvjvd
         +sSA==
X-Gm-Message-State: AOAM532TCCP20OVrp6QZvy/6EqLxa9ADdSnELWwNCnVaiRX998kBO0RE
        rvGJ/38MMAMXzMo6VvAZA91aUkptrjFFRKbCQ6GFLg==
X-Google-Smtp-Source: ABdhPJx462fjlywiVaui00FxiTLW/TFgPDucoKoZKMXEMDAoyevvbE5UZsTda0Uw4SRiYpRinJx0h99Kju7l4PisMLI=
X-Received: by 2002:a2e:a4ab:: with SMTP id g11mr1187108ljm.273.1628694747373;
 Wed, 11 Aug 2021 08:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com> <20210805174219.3000667-4-piyush.mehta@xilinx.com>
In-Reply-To: <20210805174219.3000667-4-piyush.mehta@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 17:12:16 +0200
Message-ID: <CACRpkdYGD3s_7QEMa2cgx+5XFFJK_VwcN_km-Dbtr35hCSoFtw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: modepin: Add driver support for modepin GPIO controller
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>, wendy.liang@xilinx.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, rajan.vaja@xilinx.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 5, 2021 at 7:43 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:

> This patch adds driver support for the zynqmp modepin GPIO controller.
> GPIO modepin driver set and get the value and status of the PS_MODE pin,
> based on device-tree pin configuration. These four mode pins are
> configurable as input/output. The mode pin has a control register, which
> have lower four-bits [0:3] are configurable as input/output, next four-bits
> can be used for reading the data  as input[4:7], and next setting the
> output pin state output[8:11].
>
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> ---
> Changes in v2:

After discussion with Michal:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
