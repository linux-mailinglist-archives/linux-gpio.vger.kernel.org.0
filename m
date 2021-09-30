Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143DE41DDB8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 17:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344621AbhI3Pkt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 11:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345033AbhI3Pks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 11:40:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ED0C06176C
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 08:39:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e15so27127190lfr.10
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=itbG1ekuBIEb0/GfpKZaQh1cYlvDFGD/ZH0SvfHSVew=;
        b=mw0aWFiS29aPcceoUVLPh3E/6s22lyYpxw41OCKkIaF2gSEeM6Gp5HPdpcz8OHou9t
         sd3WzC8QJVgq0sycSKVjhZInALiCr34KE655vDMBGDh/i2TfY07RJ1gAUyghaOnKjJ1a
         e8IdnuglciQ3jTmoOl5cL+5nniBH2EHRt75RIc6me6Vc4pfwEQJ5AxHbeVbrMKJrHPZP
         47782SaTVV3QyZdG34lW3c0BXPruHuYdDQE8xTP9feCnfx3PsPGEIjXnv1WuQR+SPUZY
         WOsWUO5fWdDeuG+zHRWw5PG+WlzZI+kzfItHXQm8LK2rPj2CF/SXGG//JtvX110pJJhT
         5pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=itbG1ekuBIEb0/GfpKZaQh1cYlvDFGD/ZH0SvfHSVew=;
        b=43qo9mffx3KWokOsL54Bu2+KIwLuin7gR1V+PUK993ZhVrgWo244JkbfTMvVMplnuy
         wc+m4vChQGfQNgPFIHpRWFtQFDv5XByA3QGFifRrdiiCfiCSKLDpkw6Kn3+y1P/MfCQ1
         y1nryeH5nhX355YTXA+33c+sW6mshezzI1/AI4pb9Gostne8HsoxLuWrE+pMQRkBRBzP
         RAyQAQmuZWi00dZcUkyToTLDmN0A1F2HFWkXX9MZrCytdcSOR03V/Sa9kFFKgfSz+E4T
         lsSbZ/zKOQHO3/jWxcEMVt1jNd7gQSjUEyUmtZ0EieEN0vWDYh3rxq4Dm7wyBLUoJMcG
         ecIw==
X-Gm-Message-State: AOAM5300Cprzv3FgNQYWh0lEqZXX39O1DrZx0cc29jpPh1GR2dVeCQnO
        OvEJ9YgBFBOtNbCka3ocfsPbW4ukdYGMUOgcvpFxvg==
X-Google-Smtp-Source: ABdhPJxGlVSlRnqDTNPKMZ7uXq/9ATNld698ZXtbR374gYRhj4Be2kA9QICDdh6CHDCAWbJzy/h2Ti+75NGrzQaZIoY=
X-Received: by 2002:a05:6512:706:: with SMTP id b6mr6522994lfs.656.1633016341999;
 Thu, 30 Sep 2021 08:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com> <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
 <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
In-Reply-To: <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Sep 2021 17:38:50 +0200
Message-ID: <CACRpkdYbZi90YAFGBvZ65KD9tu9RaJt312dq5UZ9VYDuLKZOMg@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down description
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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

On Thu, Sep 30, 2021 at 3:54 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > > +  mediatek,rsel_resistance_in_si_unit:
> >
> > s/_/-/
>
> Hi Rob,
>
> what do you mean?

It's a search/replace syntax used in sed (stream editor) meaning
"replace _ with -" i.e.
mediatek,rsel-resistance-in-si-unit

Yours,
Linus Walleij
