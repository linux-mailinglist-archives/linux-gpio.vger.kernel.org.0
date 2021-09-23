Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B40416778
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243322AbhIWV3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243314AbhIWV3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:29:32 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBD6C061574
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:28:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i4so31621141lfv.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MBp78sUp/qq/D779imVL/Lbu9PeK78HM+BQnZD0lhMg=;
        b=dLMhZj2ATeDg8EvJemQy9FgJwq6XJChaKvKVxiGKZkC2ahFw9Fj48hgwfEnHh8VTef
         TPL7I+ezTKRF/ZnHsecdGreaLOpCu8Z4Iq2flgSFnWBx39Stm3/MizG30uwnXp10JvHU
         Cc/GeNUwVTlu8iRXXc+jwCAQNtjjys3yKN9BNkFiPzxpZcscgwBVyk+wLxbsOCYd8tfd
         zk8EWPQq9CWphTdO0mDwAtI5Lb/Z0wTSpWf2Q+xhaDytJQ1+SYAXty63wDD4enzYh5bu
         IOvHcfpoXXdmzKzH/EIyw6evK8wMqMqHAZoc0BnAJXBxbNiptwN0J2NMw8fwVKCaXwyl
         S9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MBp78sUp/qq/D779imVL/Lbu9PeK78HM+BQnZD0lhMg=;
        b=DWSNBFgNo1BQn/FiIM9cWf7Hn1g+NdggOK+FMjvJtLAHLdsyvcMBaZINRCPNQZk0v+
         ZbwXQhQmwob+ilII88sNzc54tu13oPsuJxNtAUavsVELhAM3geaOGk0Fnk3gFu4Vo0Y4
         V5unKHbvALg3E1xep0vIB2SfFUXX6uYFjfPIVRdvPPrd1OpSrx3bsghb1LFgQxaK7geh
         tc4ixpSr/OEteoyqeUIaFHCBuf065yLXqmpJgHmbw+bmRsz1v2KscTz163owRt5X5/dT
         WRTvfrSkO9LDSsj4DXfX6EsxrE9ZD6MVVORLxuZHOVxs9+XN5q99oD5KyMWsDBNu8qRE
         DIdA==
X-Gm-Message-State: AOAM530RySnntQvnlFt8ecuYy/cfYfW45ln7ACstFR8tFIUkg4c5twsq
        z48lk99GHr7/Wzua2iCZ8u0C/Ma7Y3NOuyzlHGOAYQ==
X-Google-Smtp-Source: ABdhPJxk9+92vir/6aKWvwZZqvrn3BXSHMFDTsYMgToDbdsDjjA4j0yBdIAENXKur/GrAjTKej3PrD+TXbGhxxaMH2M=
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr7430895ljk.288.1632432478448;
 Thu, 23 Sep 2021 14:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:27:47 +0200
Message-ID: <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Mediatek pinctrl patch on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
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

On Wed, Sep 22, 2021 at 4:56 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 5 patches:
> 1.add rsel define.
> 2.change pull up/down description
> 3.fix coding style
> 4.support rsel feature for common ICs
> 5.add rsel setting on MT8195

It appears we have consensus so I have applied this patch set for v5.16!

I had a problem with the bindings patch because the context changed because
of another patch but I think I managed to fix ut up, please check the result!

Thanks to you and Chen-Yu for working this patch set out in close cooperation.

Yours,
Linus Walleij
