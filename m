Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B48A41DDC7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 17:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345633AbhI3PnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 11:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345623AbhI3PnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 11:43:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A806AC06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 08:41:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i19so23888366lfu.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vkiMt/G7bFXAXpJDQxe1pxlr8eHxyYeyKBiifpqcCv8=;
        b=cgIhgC2Dc4NbQWA+Np0faZRjXOIfA5Q6JS57HlBiEUSQSUzjg4MSeF5mSEA9WS0CGt
         QmPmhU1bRPjJ2fFdWpZ7Za+A+gMd7/S4KXUjERWkNLNvaFZv0jFlFkYfBNtsi1PjY+Fl
         bF3Tf/931BXCeVPfJNiYweKFHD76VytKHwKHubp1EE7fznmMpsb02OvqAFfSbohtFdHv
         wUi3B6dEfrHtvwHrKrQ+U4cRGTC4qUgbVSJWcabR86XIbSo6RJchJVnXr+GrVCwDLhbH
         Quzu5MAw6J5Fct26H4B0MUfbbS9p3k/KGUMnFU+iMrX3iuhR8QykVx51mEy/vYXEuT63
         9IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vkiMt/G7bFXAXpJDQxe1pxlr8eHxyYeyKBiifpqcCv8=;
        b=tnF/2lqS4vY5OR+8pEo/xTNrf57aopdRW2Ye7fdciLuPwPO+4/E2npUWV9qxwdm/AE
         gXNB8zVU/SYEwhDnoFaYyeQWQCrMgTWQ0nQnDg+592YmGqE+XidU/504ILxK9vqLfDvP
         3f2gDIqypco9L/UxaxB2ctOfvQXtoDgKjxe8lz9rfKUlVEjJEL8TTxLmEl9W9gA+QC5r
         AsqCFR4zmcjxgyttxAjBi+NWiAW3i/aLBxS1Bc4YVmXtDqPdl/T6EmSmxAiqpPMmza54
         KNToRGbo6nZEwUFC7Kx82iiF7XVk9Y12BTIxrtPCBELLBCQS5JWV3v5WhKwPZ0frRcel
         73sw==
X-Gm-Message-State: AOAM533C+7wQB728/6rqJb04T28TamTJ2N2tghmussI+pUU0iwYmIo8I
        IRCzEtaekVwkBKmB2orC6Zgd+xwPrTTwpUeOflS3Qw==
X-Google-Smtp-Source: ABdhPJzbQx3xPiacL41rCJErivYDM0vWUswmTjCsb5uUGMEo7NJ89zBn/DGOalij/ndQl9CH3MaHruCT6FaEoOS8rOg=
X-Received: by 2002:a2e:4e11:: with SMTP id c17mr6415015ljb.19.1633016487609;
 Thu, 30 Sep 2021 08:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com> <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
In-Reply-To: <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Sep 2021 17:41:16 +0200
Message-ID: <CACRpkdbWR_kmvMuHMTOjxLDqN6rq7zhrWcZxfi2L3Atau=TLSw@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down description
To:     Rob Herring <robh@kernel.org>
Cc:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
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

Hi Rob,

how do you want me to act with this patch set, as it is already
merged and I was pretty happy since it is a v14 and feeling
it was getting a bit over-reviewed....

Are the binding problems solvable in incremental patches
or do you think I should pull out the patch series?

Yours,
Linus Walleij
