Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C58C222444
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgGPNuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPNuJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:50:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65183C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:50:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so7230791ljc.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W0iuDU+qCWBUM7ba2OgUNPdlmGMl1pYMR/idMsHed54=;
        b=UPe+Ak5h0P6Z8onkrvDvi6QUVwIWIGpi7uVLXWjnR50zvyoG8zkGEuyKrRvZqzeaVs
         7flptBJJLbpHGwORkLYAmufCmWvGfUkoNyHT5bGmX36i/a0HegWUvz96XnbuJRHWAfmR
         vaKpbaNCPOFd9kZAqffwVWkCSOErYcQim25VAwe6+We+6xCAbwHI++HQ5iwpKnw3NA6Z
         AMU1wu9f4MKmZW6eE79d+LPAU3N+Gs/b0koGCHXt4m65RerZFlF0HvBXdiSkWQUAeFAp
         VoAuMgRT2f502rMCwgG6H9qyyTldwRfWJxb6dzlxVVget/xx4QR57S/61FyI8/bRXMjq
         g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0iuDU+qCWBUM7ba2OgUNPdlmGMl1pYMR/idMsHed54=;
        b=eZDf3xFzidEe3TTobsSKwUSPR0EETcKuzXA+mIZ8VN9BhfEVpjyiPZ4uSDHiB2WQOc
         O5Ek3PGZhc+GDYz1Pndj3itwBabxShv2rQqXVVHKfUFJOavK3JUsBH/IK8OIftFjtZDJ
         CAMOYV+hvGvZV/0d2O4565L4lD076D9RbtpQYvQxRMWG8PF0mdMi86XZVU+Fpua85TG3
         paOPdbqZI4CcIR68QK50vzVNJVa9hsLw9U2FhiKKKBhLPVuBasgMRPspi0NvaFvsyR2N
         CI7u0EpQQKg4UYMWLYlQY6SNtTyXb1UiAgeTGJiEtygM6kX5BY4ACI1PMQhIbI+ZREth
         pyJw==
X-Gm-Message-State: AOAM533kXEYv3buy4I6xpo7iBs+MMyJW2CQW3vHy6mklBnjSTwK5U1Nr
        Q1RFY0DlodJyIqt3z8HNmbbhlSbUb3xkLyjVhZXy2Q==
X-Google-Smtp-Source: ABdhPJyuZR3go+MjRH0QD2hTjIiPi2nGSy2AbPjYJo0SRP7oWmUGCCRWXTzrLI3Eps1+wMn3Fs9p2fh605lNHa8lJsM=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr2010346ljc.104.1594907407852;
 Thu, 16 Jul 2020 06:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com> <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:49:57 +0200
Message-ID: <CACRpkdYOtp027AOMgw_spyRdO2XjGjr4BOoEVfOJN9Y2TtJ=Kw@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] pinctrl: mediatek: update pinmux definitions for mt6779
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
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 14, 2020 at 11:20 AM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Sorry for responding to old patches :/

This and the rest of the pinctrl patches are now applied
to the pinctrl tree for v5.9.

The DTS and clock patches need to be applied elsewhere.

Yours,
Linus Walleij
