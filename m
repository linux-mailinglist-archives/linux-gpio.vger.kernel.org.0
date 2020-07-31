Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5167234A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jul 2020 19:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbgGaRuk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 13:50:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgGaRuk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Jul 2020 13:50:40 -0400
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D9F822B43;
        Fri, 31 Jul 2020 17:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596217840;
        bh=xIA7hRiGI8hcIKt24KewaMAWkWoF/yDX6COzosKFz0U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2cAp12zBS5xCLw85wjvdjdkrrYdGenmddqas/YJEZAPOvYSUiVcQNwHf1z3FDbPuw
         cCHIZsg7FocV3nJ4qpnkIuFA1YuIb0cwL4oeVRXgvzuUmA+LA/qE07FoatkDIKFqYY
         T758LDjUVTI0sWA0R8iNFwd4qZl/8UA6UprEjHVs=
Received: by mail-oo1-f45.google.com with SMTP id x1so3871880oox.6;
        Fri, 31 Jul 2020 10:50:40 -0700 (PDT)
X-Gm-Message-State: AOAM530eNeW/qtFyhb69bip8WdFdkXWP8NUNHlWBRTsyXVazTzTwT6UG
        jS3fVjt5ABDFc9YrsuwdvS6MG9KwhnUL7FvpTQ==
X-Google-Smtp-Source: ABdhPJw/OSexwE0OrWpOTs5zx2c0CPD/ZcImiHA06bu/BmJSIz2sUGn0TTjq1kVG2vBqMM8m5HsBIkCPn13mRXjt5Ms=
X-Received: by 2002:a4a:9c0f:: with SMTP id y15mr4046986ooj.81.1596217839437;
 Fri, 31 Jul 2020 10:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com> <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
In-Reply-To: <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 31 Jul 2020 11:50:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKEPhRtf8zabUB6UKkOf=J4m+3P3cSvSXFSVp9UKd1auQ@mail.gmail.com>
Message-ID: <CAL_JsqKEPhRtf8zabUB6UKkOf=J4m+3P3cSvSXFSVp9UKd1auQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hanks Chen <hanks.chen@mediatek.com>,
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
        wsd_upstream <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 7:25 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Hanks,
>
> I applied patched from v9 1-5 to the pinctrl tree again for test!

Patch 2 has warnings as I reported. Can you pick-up v10 or an
incremental patch is needed.

Rob
