Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D1B234AE6
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jul 2020 20:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbgGaS0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 14:26:53 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44487 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387652AbgGaS0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2020 14:26:53 -0400
Received: by mail-io1-f66.google.com with SMTP id v6so17324394iow.11;
        Fri, 31 Jul 2020 11:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KuRbjLAdk2qF/sclDpIueUjPnM2F0YR1YcWElNzgbpU=;
        b=t6cwFtKE6N8y6jrpzbOq+VAzwZht9JT2wKANhmal7xL7kl8InN3Nhe6EXTvVPCKdLW
         /LYXLUWu1rAKhhCeNiU2Vm+4019ELQP8BcAF+ogu3wHqzuMyUzxqIfzksT/+Gl4NWGNg
         6XGR6k/AxeZMhup8AnT07P9zHxcS1d6+9Oxd2Rss+dxK68eqxmUwTzHCFreqI+SqygqV
         BniSVwtdXhiHq1SzUKqvwlJL0FfjTXnaCRkenLqjfJLRjb33Gz+mtU1iqXta771EaRDA
         oI30RWQv0X/VSkXqVSiGM/FSumX/1wkMKnZ6NRvyVumBkh1fO8dx9Yq8us/3HhbZhV0p
         7LHQ==
X-Gm-Message-State: AOAM531C8iV0SZiIrs0nqHOO0f0ydCnDhw7m7v/OAQo2fsGVGXetDts7
        L53CTEcaPgteB7ayzYUO3A==
X-Google-Smtp-Source: ABdhPJyQ+8uvOFgjmwMbjdzK/nhCeKXR4ECMzLtnQXdzQAe67dqY7s5ndxY9dXDf+RshQZN4g44q9A==
X-Received: by 2002:a05:6602:150:: with SMTP id v16mr4742498iot.80.1596220012124;
        Fri, 31 Jul 2020 11:26:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t17sm2378512ilq.69.2020.07.31.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 11:26:51 -0700 (PDT)
Received: (nullmailer pid 531147 invoked by uid 1000);
        Fri, 31 Jul 2020 18:26:50 -0000
Date:   Fri, 31 Jul 2020 12:26:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Loda Chou <loda.chou@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        CC Hwang <cc.hwang@mediatek.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Andy Teng <andy.teng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200731182650.GA531094@bogus>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Jul 2020 21:30:14 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
