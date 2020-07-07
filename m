Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7E3216B8E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgGGLbg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgGGLbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:31:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02DFC061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:31:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e8so15196738ljb.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
        b=Ur+VVUqE3bYZZ9r2VMSQL6CBGFMzXAgsMnDYz/2TV0WzlNWb6WMQtSDMbYtLt4kWdf
         KiV/QoHYbRbKQDF5piV/CJ7dFU6096XxgZZDUeHaMgBdMjFAyHfNmaE1ISmW60e2S8Xj
         iT86k/aJIumKjx4rg82kWTWdOHiU1xy5RfnFqpoCRflyaOSryvLH9xHc09NuOPM+ZR38
         I/rpqIeTSmDwls3IAWeT8WpfajixmQYegnjgV0YD6OHt4OOQbr2/JI4wEC/SjqgDvqsX
         jTnuWRX7FK5vJTpjpTZ5ISeljGbMF5o6B+IxKdKLadDv8if+mNZ8g/Amcf4H2jQyw+2n
         FOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
        b=iO4Y0Oir581bMjfNkIK4eIQP4fYqvm5LWWI4tZh64NewtH/Sp/zl6sbRxR5tn5GfKn
         rSWmrqAi6MdIUPMJcqMINTcMGWDGE3UL1KIivPKcUIB1kwndv35BHqRaxKVU7iqL9c7a
         Qoy51SqF55HbjUl/DEkhtM9YVnOcFxFkHFTMEQuzhVtEYiLU5s5z7oDrz7p0OVxgURNq
         jNEmcjgtx+26+CnB+Ls/wYbNZvNEHjqG0s2ZeoRPUHt5EiYi9TwmSw9RDJrTra7AuXHD
         SZZoAOVla4Xuh7KbRh/STA2SJ+O4IIouNP4tIZYOdTaFqNF+bldZUjIO8IiJizj1SxiS
         ixRA==
X-Gm-Message-State: AOAM530vnfl4PMiFqUlLopP/sMBuqMLjsQy1f6pOIj4iJqiNfe9+JilV
        Gjqrf+Ll7dBgOqC+2anY6mngLMTDuD/Lj3c54JTYkg==
X-Google-Smtp-Source: ABdhPJxwu8LPZEcE6xITo3PK+ibXfZvzirfjgqwItXPsC33ipJdTwUPc3z5pWyDOFbMFJ/yL2oznPfkMolkPAi63JMM=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15925694ljg.100.1594121492164;
 Tue, 07 Jul 2020 04:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:31:21 +0200
Message-ID: <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Sean if you're OK with this patch I can just apply it separately.

Yours,
Linus Walleij
