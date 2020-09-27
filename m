Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B40727A00E
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 11:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgI0JVK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 05:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgI0JVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 05:21:10 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE69C0613CE
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 02:21:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so5859658lji.11
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 02:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o7lRMwheEwMVDoZh1+98Zj6EI+Y2FXPbKq6Vx/JPPmg=;
        b=nCAMQcfO1adjOnVSOrDKmFpM0l1QZmc4Gk4gzdgH5NCxKbVN7fIsZnb1++bdbbHuGK
         0gO+FJihvUKpd+joia7EV4Y/nhDc5SkY1CghBYz8FI1tFntyf4tspPVYKMlDpxEVCOyn
         ZdjIv/d3/vg6gRQ5hV0yiN1LUo6RkI2F1SbMeOne/ds+3Zifnb6ihpoLZ8kBdeRR28i8
         Eo1tjpVlBqUimhkh3lEZZWkByJlb368sDd+SsSM6wdS5L1uBCP6zwdCEc5s4jyQLQ5zO
         TLFYNchXVtFGjAM0Vj9UgX3gB+GBpxeK2xX1wMeAxOGwa7im2wn+T2PMmm9u09HD6Rhe
         QQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7lRMwheEwMVDoZh1+98Zj6EI+Y2FXPbKq6Vx/JPPmg=;
        b=rnW0VvRJVQMMjrqSjGYFdfVZsScj3IZ3vuEdFmFNpey2oBYupeQodK591sKiL6onUv
         F9SgzMrmyIube3PK1FVhoQMbM5PoSM3snr2XxaFKSi17CXdnQZ0hvZZIYloW7ucr5W4i
         SAVTACoZnYBffHDadFIK0ElSh0OE/K8av6r+CaZtzwJo4iQsAJVrTzFFrC7lrFuHAcl/
         pd+ZdjKAxJdbQJsv5ibpftyDek4Ou/vCM9j7NhkmBEZZZyR3UyBx8cI4r+/GqrM6CsOY
         bvpfZQ3xm1kIIxhbolt4Ksd3P/W4Nyl+ijKW6lXXR7WUr7QYpTesuVP3U1tKbrUNIIMu
         d4OA==
X-Gm-Message-State: AOAM530Ttbb3ffeDbZWyr/RXzukPjXQAaDgImnB1n/Djt8RvlTbUAG5i
        2dOwlU+H7u2cOG1KAXaQ2h97qGCI0zYv2st+Qd+sRg==
X-Google-Smtp-Source: ABdhPJy6MVk1x45l3SzYVBvvCdEvD+7U4T8hhSI5A1uyFMODZMWC5/YlREL/K/c2cdE/Px3GbHJYxQ+SeOMZ3QRW/wI=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr3403136ljl.104.1601198468123;
 Sun, 27 Sep 2020 02:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200907110221.1691168-1-fparent@baylibre.com>
In-Reply-To: <20200907110221.1691168-1-fparent@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Sep 2020 11:20:57 +0200
Message-ID: <CACRpkdZ8hqVok8ejVACo7pxMuc8EpKt1Z+hSKnpGq6Waj9-5Pw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mt65xx: add OF bindings for MT8167
To:     Fabien Parent <fparent@baylibre.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 1:02 PM Fabien Parent <fparent@baylibre.com> wrote:

> Add binding documentation of pinctrl-mt65xx for MT8167 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij
