Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D899225412F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 10:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgH0IwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 04:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgH0IwT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 04:52:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFB8C061264
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:52:18 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t6so5504413ljk.9
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 01:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYacB22eYqjS0h2EHD7vpnW368MZpgmYVMb0jVEC+0k=;
        b=I4CqqHi8i6aZUgWVs79dQH94/DTsPWfoTtqiUAGLfoUuyChmrVFlCJt2xtstW36Y4j
         srvtiSanJALvFkGgcExhOsRLJbdHal2iROBeZUh3KvND7j42b6+Few3BMJlywvKTA7dk
         ybPUE3SK0t+TFNUTx8lqxIfifMsnc/xuZHJ1ZNs5saEACMpfE+DV06RyD4dc+tMEIecr
         I2BAxZtGiqRHJEg+8eBXUoM9SUQUsRKQoo5M6Pmfww7FbPgNKKtKPjTn0PNhRle64LMB
         waN3UegYTBknmsNPNhbhnfmpgGvCbM23phLffVIVJpeM8L3Z2wTYNWoWZ4Xe4xSgWSpT
         bZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYacB22eYqjS0h2EHD7vpnW368MZpgmYVMb0jVEC+0k=;
        b=L6CRCrvAqp26MTIRjCkYA/8NQW52uvNO7T3t38SZxHJGi3NFRYYrFOhFMKzwiZZBK+
         Jmhu4nqulPoFjdvPYU5nzmKzfcqR4w9GeQ7uUDQaqoZn5HmPC9FW/CL5Eg+e+loo/Qf5
         lxRfgnYzBuoQKrzLp6H91WemM+eLzEfbOXY80qOR2j1mgIKwkRsd3T4MU6wNp+LsnStI
         Plhvs/9vorSWQFVpreJ7dEXyevWUcw1BAADoHNlq3Dx4xtzu5yKEvwZsQ2Ruh3385pvQ
         Bh27kecTWYPRtiMFgTluABrMNrjIZ5/kptfOCL9GcoIG2mbQNAZ6oNqbFGSqT8fLB+MS
         7hMQ==
X-Gm-Message-State: AOAM531eFWMrpAT/y0Zj72RXRueRnHwPXeT0RTLtooVleOnK4OnxCB7h
        q8PXbcMYer9R2HwxLaT0R3+ssDorRd2tNorg4NRnZA==
X-Google-Smtp-Source: ABdhPJzMK/QQzozGDxzhZ1ptVcFeOA7pCMf7o4BoinmpKAwFETGR2jOwjTUEQE5hG43D4uonIeuqoQ+98b/Uh0VfqsM=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr9913723ljg.100.1598518336643;
 Thu, 27 Aug 2020 01:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:52:05 +0200
Message-ID: <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com,
        hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>,
        Chuanjia Liu <chuanjia.liu@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, sj.huang@mediatek.com,
        seiya.wang@mediatek.com, jg_poxu@mediatek.com,
        sin_jieyang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 2:18 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 3 patches:
> 1.add pinctrl file on mt8192.
> 2.add pinctrl binding document on mt8192.
> 3.add pinctrl driver on MT8192.

Patches applied for v5.10!
Thanks!
Linus Walleij
