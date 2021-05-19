Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABF388397
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 02:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352403AbhESALS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 20:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbhESALS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 20:11:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4404C061761
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:09:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x19so16378825lfa.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OuTM33XGtLwqa8MYciwrkAYfeQ5kekKTaJ8lI00J+rs=;
        b=h8O4DrZRkEIKrl/XUr78Ts7Z+5uTUkSBm2b+5q8n1o1rP5eMEsqe3JLY0RoalrthmN
         hFx904A+BhryeG5r014WnM3Ppb3ppkCbzLzH2yCCxevVIGIPrbxabKc4WEHvr1hDjdWq
         L/LVrgMDOlTc5LLNV02Y5nFswYHoZ5VQBrw1jc/Tr9If50zwJx+P5Y1yCzBki5O9QmoV
         jpsuQe/Le47+ZzAJ/OtWbMAAmrQXUAz2S+vcQfsEzEf0wfD0P5OU6toS75gEFj6v1Ew9
         9iBMry8hXEIvXdyzwh28L1Lk442e7oC4GWrHMsdBUKtvG15pRphJ+Qpmq6lB9ynjNzuZ
         ZBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OuTM33XGtLwqa8MYciwrkAYfeQ5kekKTaJ8lI00J+rs=;
        b=uZ7MwJ17f34PKU4GFMBcrOLyCUAlFBF0/dG2bbam+H8ejZxEdf+4DY2okK9Kq2nA89
         oWa0jqQHilG43Glc1uebUp7gEaLMw2pxCcRZh3ZYoG0WwnRw29iwTSEo4ey7iCTHFLOI
         3ehwaToDAuqJ8erjLiMf7Z7dDX9XDJALliBpt8gb3gKiJAPfLzzKPxeJpXVu+AB2eDWm
         g6z4B7PG4a7acb5EsKZR4hbPvSDA11Y4U8bV+1NNY4Fm9yq29Yz+ucShqd8TqYhuwUXH
         c3cz20N4MiSiNLTw/tPf21FKaJ++XdPOKsv811qoOXD7bD8DClF6e+jBQcM+EJQV928b
         DVNw==
X-Gm-Message-State: AOAM531Me04xsWtp11mwWYfrI/i7wPsmw6T5+aw0Wd5M56SukJ3475AR
        pLNEc+5x2+3X3RhpQ9hTRt7GUxgyUfXxhrnTQjx5yA==
X-Google-Smtp-Source: ABdhPJzXvwNyBIFBAGkgV+vqz4OfOm7bjiZHvKaE/3qxTD4SKunmkPBqDuIYym7TgM9jIoYc0T7bA2xvseQYyURg98U=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr5814348lfl.291.1621382997090;
 Tue, 18 May 2021 17:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210426024533.20840-1-zhiyong.tao@mediatek.com> <20210426024533.20840-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210426024533.20840-2-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 02:09:45 +0200
Message-ID: <CACRpkdaLhR9HgYNPZ_SQ-wi7RfpeT7iapXUfqf=bAwo05MBZqA@mail.gmail.com>
Subject: Re: [PATCH v7] pinctrl: mediatek: add rsel setting on MT8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com,
        hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 26, 2021 at 4:45 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This patch provides rsel setting on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

I am suspicious about this patch, sorry for taking so long to answer.

First explain what "rsel" means, because with no explanation I
suspect it means "rail select" which is what we already have the
existing generic property PIN_CONFIG_POWER_SOURCE
and power-source = <> in DT for.

Also add the custom properties to:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
(separate patch)

Yours,
Linus Walleij
