Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4D9416E4A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 10:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244973AbhIXI5i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 04:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244971AbhIXI5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 04:57:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2E4C061756
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 01:56:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b20so37713627lfv.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nucC4Uj9fJVb5i7ika51MrVjuU9L1cZ58hKW4COSfs0=;
        b=ZifWl6IBuejnQvj5NUQi9mbAMQRXxLvXAUVeVj0JtdwtZ1yoR4bgtWUyjnAK/NfimV
         zsTHM9Oxtq4zsxaXXQusEaPP/fyOB01VN7+rWJSroQyG+xGcxvjv5OMbI9QPz3cJQpz5
         XXs/msnMkNhJuyAUNl5FVc/cXcmI8+/83k1xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nucC4Uj9fJVb5i7ika51MrVjuU9L1cZ58hKW4COSfs0=;
        b=vglyqlLJm/d6KdtK6BAntsPxjX+8r436yNT9hzVNR+MqFEqkQzFODhtCeF+7SxWYTK
         h7KEBP/+SJsQMU5aCv05SSFm83yZEfcmbgIQQv9hN9ogaELEtqQN8+lIsWEp6cwtFKqV
         ImyjYTXt6LXO3zooB4Z4GkymrkKZnV95a3R3hTH/hoKqZww+LqTgR1V4VEl93arh1QNh
         /SfLRRyGd+EebKFHnvBMkW42K/+h0tuFdgTS9tk7pQy04hK6vmH2G0AHvWl/SW8oc4Pw
         rSplu4k6XWSncJOJKO0U9FltERf2D0Vn1FRZWdxwNqcm9HRXc7gKGcTXqiiYC/4CwoBD
         FR+Q==
X-Gm-Message-State: AOAM532w4UBkJu+D6DP+H2pI67bt6pYveb//sr7/h0XhmLYIP2M8qp0J
        yuwUAyt0yUywk7AyP3Ivh4Bj4DIZXfgL0Mk8rAtbxQ==
X-Google-Smtp-Source: ABdhPJzTyJNABZRhRQ0xhI+mzCIh0W3gHxvAozxJ7wQ2NzcOsXrNReK4oWoG+x7ejEM+082rbzdkEEt5NWU2yOOzl9k=
X-Received: by 2002:a19:c3d3:: with SMTP id t202mr8426817lff.678.1632473763632;
 Fri, 24 Sep 2021 01:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com> <20210924080632.28410-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210924080632.28410-5-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 24 Sep 2021 16:55:52 +0800
Message-ID: <CAGXv+5HXS29-QHhqQ1L7PCwLMBXWXixmSEkyiq-1t5s8zMvGkQ@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] pinctrl: mediatek: support rsel feature
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 4:07 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch supports rsel(resistance selection) feature for I2C pins.
> It provides more resistance selection solution in different ICs.
> It provides rsel define and si unit solution by identifying
> "mediatek,rsel_resistance_in_si_unit" property in pio dtsi node.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
