Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B5841B9C7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 00:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243002AbhI1WC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 18:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242981AbhI1WC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 18:02:57 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556E8C061746
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 15:01:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b26so893107edt.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GSMAPXo1PThgUYlUpGQDRfKG1H/fd1r5GZq0PpbbCCc=;
        b=ylGvyhAGItjO7WiKLBnz+mwd1ZvvxUzYebNGS6bN1GHcljmVhpdpWiupis7ctKb3qe
         DmGzGuTTiq5zLEOlnvoWK4DXIAAWyO4QgN73RS1GCiQ5Hh/pGciwsLnpiGKP9YJ+1o4S
         2pZM7SE1omvOzcDPBCGAMWof/F/rZdSgqXdcEwzHluPcp3YVn3pL/W9E5GE/WVpWfVQC
         9PlSwNUNNvVN7XYZGou2qjJSm+irCBIJHoVnxnC3ldMh3+Sw2sEpKTAZCBZQb3wQ9mku
         km13FBMLzRH4r6BdvvsDt85scfCsr2C1v7n6uN7AsSZF1SNSYMTvIpzMOi6aoTisYv+y
         5I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GSMAPXo1PThgUYlUpGQDRfKG1H/fd1r5GZq0PpbbCCc=;
        b=sFh31ye7rxanIQtIzUlY/Yfh08/mZqaKaeqQnHHv59EvsbrMszVrfjTUiFMZLVB1Ei
         a8rweFjJjQRSgJMwYfNymy8tpfSju0WGyJXINWhQobhbxR/pWe2BZ/nIQYonnn2CEyH3
         riugiHYBszPsRWEq3MikB2bE8VIaD7xOUE/26n6wJ+zLJT5YmwEWbC+epknOAHmnxs+r
         NjOMpUxsIiu8flz/Z8sVP6z4vf2kbkrzOAX2RxcNj/bGx7p5BRCFwFAqZuUxMLYnVv9v
         cxEU67xbWfqqjOP3DTyudJuawKvq89jw6xVm0SCvtm6QvIAI3VI0Xhq/B/sWjg7q9oOp
         ZzKA==
X-Gm-Message-State: AOAM532RtaKwPmHBPWaxmPwt7C10IBxNw3FeMowMt+S4mwmhrnDY6gPr
        gyyFoSXJHa3dumRpbOurUvDd/B0p6Kl1sS90D9Evqw==
X-Google-Smtp-Source: ABdhPJwwGKfBVQ/xIs+wKo0BMv2aFJRA4Eg3sQ9gWVT7Ahfqlg1nwBWFVAmFc4yWxeML7PMGdB/NRmNZNSSpwYTCd8g=
X-Received: by 2002:a50:f60a:: with SMTP id c10mr10420317edn.250.1632866475924;
 Tue, 28 Sep 2021 15:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Sep 2021 00:01:05 +0200
Message-ID: <CACRpkdauJpfJfLazF+9VbeioR8UqLjYg+Sk6yPFnfmQn6Ky9Fw@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Mediatek pinctrl patch on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
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

On Fri, Sep 24, 2021 at 10:06 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 5 patches:
> 1.add rsel define.
> 2.change pull up/down description
> 3.fix coding style
> 4.support rsel feature for common ICs
> 5.add rsel setting on MT8195
>
> Changes in patch v14:

Finally applied this v14 patch set for v5.16!

If any further fixes are needed we can deal with them on top.

Yours,
Linus Walleij
