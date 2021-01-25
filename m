Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66A1302557
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 14:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbhAYNMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 08:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbhAYNMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 08:12:16 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF34C061574
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 05:11:35 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id b10so15185575ljp.6
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LHPs6veKloMhyGbYCzf5Tkrc+RdfRRKizZUrP4RKFk=;
        b=no554Qq64SPim1EkiyV++9RtKXhSiJqgj89U4AUxO5hNWnnHViu7BjgjSz8ZDoJYqf
         LW0GdBFzeFeszL7hHdwkSntSWE2O/C4QGTBl5cxeS393dYKAbrciyRWA8TwJeTkSq7LF
         GlwdRfD5eT2bZ6lf9IEY1x1vKreOlXrNEsIwVN789eG5pH3s+8xzpJN3Dl62us/rCTHc
         KfmMOr/E4La8i+C5E9aGQVCMT6CnvHAoxMebnW7K5drwNziItNuyOutIGjYHA0BVMTb9
         p0C2E34IUVLijevWi8jla6iVc19Qjv7J5byAsZty6fAhKWu66e5nk58F6EB2B0Vsz4/c
         BByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LHPs6veKloMhyGbYCzf5Tkrc+RdfRRKizZUrP4RKFk=;
        b=sCoBpEc+s/XaYhWaNEVpuLriKpUVIz+VHH2ZWB9XuBazdOtKGUevMmLT4FaKON4lYC
         ROVaNYkvDkpJuDVv0s/080HNLO6HX8rv9sxQXxfLiOD0rnk+s9gSl+xDozfV9BmgGJjG
         u6Xlz2B0kv2wmbRWymEUad7jAwKzgRLFakrmoMZLJMpDWBiJa0nOiyCz9/jjoKpaCm2s
         fdLQ0n19DM0RfIQl+Lqf/jB+qMydij9dUR05Jy5AcCUOM0tLA+j1RBVrYwXKrHwqjKdm
         xxufi1Zlm1yyNfweCF+J4Ppu10Clks3eSAnsa/5NTmMdu7y97nhbv6z9Cl6/URhxo+CS
         Q15A==
X-Gm-Message-State: AOAM532Je3VdCDpzHIX4wzd9d3MI8P5h44ZNw189Z2vfk19fmjWSatUv
        g58rabozKSiuOiETaRmqOa3esofDpTEGCGQa/Sazz9NvIXroxA==
X-Google-Smtp-Source: ABdhPJy4HpEIGMikU7HZMCkt1pVwvvpvX/8qj1OgXZGQhen4TdHca8wLEsqLlamFaD35zyCmUp0OaXP94h/RKNN2IeA=
X-Received: by 2002:a2e:964f:: with SMTP id z15mr166740ljh.368.1611580294339;
 Mon, 25 Jan 2021 05:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210125041753.2214-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125041753.2214-1-hailong.fan@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Jan 2021 14:11:23 +0100
Message-ID: <CACRpkdadvp9t5xdpK+=35jwfbrR0AXM0bRSWBfWH9jJFBbEyeA@mail.gmail.com>
Subject: Re: [PATCH V3] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To:     Hailong Fan <hailong.fan@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com, chentsung@chromium.org,
        gtk_pangao@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
        yong.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 5:18 AM Hailong Fan <hailong.fan@mediatek.com> wrote:

> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.
>
> Remove mtk_eint_flip_edge: because mtk_eint_unmask already calls it.
>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Took out v2 and applied this v3 instead.
(No idea what the difference is, you don't say.)

Yours,
Linus Walleij
