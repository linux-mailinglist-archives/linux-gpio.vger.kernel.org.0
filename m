Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AF0348C85
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhCYJPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbhCYJPb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:15:31 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCACC061760
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:15:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o10so1431323lfb.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jQSUS0sWefxNSCHEC1KdchHT6ruHmXruWSe0jguDBe4=;
        b=o57KpS/SVqgB4aa8+prMDX4/0f/sQZGpgBQ8t5UkMLPn5Qn3CNlhP1s7Y7cH4Uk0Yt
         5+aTgDlMtpj8VahIttojhrrqsMz/i3HQcvat2q+Z9IlJEJlzy4HXE35AMDJMbCm+Fwag
         qFIWd7dGn1Dkpw/9bBN+AjxUmjgcMmvYPGwu96VWRx3Jk3pOWVzsmR2MflpGxpsR/+zI
         214Nl9OF95l2M2We75WAIh54bzfBMQE0D8P4KtGSM+lKlRhSnbRTreADGhK5Iq5E6anG
         Hinv7XgoNn7ofg5sU3fNhh/jDogg7F6goe/WLIVqPG5zG3KvOj4ZK71BAHaib2103KXC
         sl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jQSUS0sWefxNSCHEC1KdchHT6ruHmXruWSe0jguDBe4=;
        b=MCWHv7W30p4fHtbCnm0HsDAw4hlwT8ZNLXuFfcA6gdiU5HnDtuldeUyt9P6i++7lPC
         aAX7DtMY67qIwwduFLY5ek2JDfeHH5wreCU39anT5ouAU58aghm0BqhV++5Gj+KV1Hn/
         p16pS3kge5RDmp5WALXu9fRhNwbt6h/5yqXLwJ6DWhB9pT2OQE46TKGrWSSGhOXuJnSI
         /mqltDPBYCHpPAttyRgas01g5cF6sTt9n8aOclW4Vfgd62ox1uBbWpJT6oh24rnUyfaW
         nKP9i75+z4bCCnob+pltdTMwfujK7qpOgZmW6YdYW97kzulXvsE9EQVPtGCF1NidmrIJ
         490w==
X-Gm-Message-State: AOAM530nFtVPVFRZvOZbAAcC3r0sygmm5u3KjVnbVgaZgE6/VC8JlpvR
        IsgnHU2FkblPDjpmiL5dqw+CHMXIAe+uEJvW9Kc5Fg==
X-Google-Smtp-Source: ABdhPJwItH2xIo9/hQ0G/Dsu3MfocBFrbbbYJg+8rqc4pz2dbpv/HCAoF4I48/Ib6niSpMgouHHNNiCfW6MgVKURop4=
X-Received: by 2002:a19:548:: with SMTP id 69mr4426509lff.465.1616663729558;
 Thu, 25 Mar 2021 02:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210321033150.15380-1-zhiyong.tao@mediatek.com> <20210321033150.15380-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210321033150.15380-2-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:15:18 +0100
Message-ID: <CACRpkdaO8YEBo53uUuUpegjFTwaZbtWtbKTUynAX_55p89Dfvg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com,
        hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>,
        jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com,
        sj.huang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 21, 2021 at 4:32 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> When multiple threads operate on the same register resource
> which include multiple pin, It will make the register resource
> wrong to control. So we add lock to avoid the case.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied!

Yours,
Linus Walleij
