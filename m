Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD69216BC9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgGGLj0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgGGLj0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:39:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A04C08C5E1
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:39:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h22so42333947lji.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
        b=NYzj/o6y2s9Z+eCQgmRYfSgsgU7i2HsuCMcPIod16JgB0/R/Bp8K5TCpEG+jy+bcgs
         ZeWixYF2ok3de8HvQOPk2q8rgIBZzWFC0mNPOVLWT6rbSD+GQswrYk/COzA1BzWJTS0y
         drlNb9cBsjk6f3wweib0e8CQxPQBi+sIlqBDP8H9T9s4aZi38GCvzy1ivpwPO1RFCqDw
         TjSHlhqypVPuC7Pb0P50dC7mEjFGIXvCXjSG/GQxWvFPcZ++jU5mQN6Ide3Q+e/v2VlF
         reom+VCXprUs4I5+pCDFnZNjMgq7tRgBCHRMqtD75VEibK88tGJtAMoDnCZipsfMypao
         zqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
        b=K/4w2T8Wfvo/7ffHCAb+1uQ5ye1iyBa6wK1QivxE0jDroiAaENmwu+FilSsfqq1x8v
         4Qhm6d3EmmIfg1NxTV7WWNWRhtiYzi7WQ957RJ4kh0kht5iaKVp5DsW4HJoI8K1rLyW+
         oEe1gdM+GNll9utgLJykfwAMwnoDOL1X0LyjZxnk/0PrnMJ9XXmTcsP2AtSL1qXe3QSq
         l47YParnzcxnSPlAuLXuNgSeSD+pXo8ekZGWUc1JWAeRQmQJlg4ARq3BpBBMukRTAOVj
         K+KBS5ScmoUartX32Oq1pmeTQ5agd907WrNAxWByPtoU5Ez0n+BRCh09Ft2pQCm/cZ6c
         h8qg==
X-Gm-Message-State: AOAM531dTwYMzjhWRHEz48BjEMeDH0zmYl/4uf3UX3Ob/3YKhu9Qtclb
        xtx4RFEajEDdWYrTqBlYngddbZQxSZs32QsWnPWMig==
X-Google-Smtp-Source: ABdhPJzaNV7qDX5ofVny2CYGichkvvyZwwCuYiY/DXFU9tcXKWyULk7QdWCDcj7Zwb2TtLbaWFduqFOHtHKtVZ06ol4=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15946172ljg.100.1594121963989;
 Tue, 07 Jul 2020 04:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:39:13 +0200
Message-ID: <CACRpkdZAjwcHURd6wCQPrjHjEgiEiUApqVUff+70nwjRPyAwBw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] pinctrl: mediatek: update pinmux definitions for mt6779
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
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

> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>

Patch applied.

Yours,
Linus Walleij
