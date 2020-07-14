Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF13E21FED3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 22:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgGNUrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 16:47:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbgGNUre (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 16:47:34 -0400
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D4792065D;
        Tue, 14 Jul 2020 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594759654;
        bh=AW8Fhw54zyXMIIci6R4Vy13WT2UOAWtC/jxlBSMDeZA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sYIvu3f173B017/4ldlM0SC5lETWMyt6khC6MQ5xwhlIu0Ndqh3De7uCSwP+2rpVC
         vnUGQHRaoYn47Eqjcm2O4taCzxYq6uFKmVPiy2GPCO73etSHnkH01hOy1PmbO6a4Wh
         VyAXCWP+Jq3GSfPFE7nYN96XRbQYXtiOemHgPwe0=
Received: by mail-il1-f181.google.com with SMTP id t27so15369431ill.9;
        Tue, 14 Jul 2020 13:47:34 -0700 (PDT)
X-Gm-Message-State: AOAM530tMk3qu8avPBBWa9ZNABeCaDpW6E4VdytSwABXXUJPObPPnEmZ
        sNK/sBKfZ6X+tOQpGqRFFMUrjA41BBvpqqETR1E=
X-Google-Smtp-Source: ABdhPJzl2OnjW2TOVxFJ4nevMOUG50uYeQKfvJWwJjF+KRZ1tWxKUJfykO8UjV6vDxvWahYyVdWRu++GdlpKhdVr3T8=
X-Received: by 2002:a05:6e02:f42:: with SMTP id y2mr6628078ilj.264.1594759653637;
 Tue, 14 Jul 2020 13:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com> <1594718402-20813-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1594718402-20813-4-git-send-email-hanks.chen@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 14 Jul 2020 13:47:22 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqhFr2R4D00s4WCbPRwEsMjrY2RKg_OyFv-tTEQ7axTjg@mail.gmail.com>
Message-ID: <CAGp9LzqhFr2R4D00s4WCbPRwEsMjrY2RKg_OyFv-tTEQ7axTjg@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2020 at 2:20 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 25 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  7 ++++++
>  3 files changed, 33 insertions(+)
