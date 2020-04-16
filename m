Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7193C1ABAAF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 10:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440167AbgDPIAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 04:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439552AbgDPIAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 04:00:11 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E027C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:00:11 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x23so4879086lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sSf8uFnlnhLwj095+FU8Hbn9FbYIuI6qLS2jyiMbwJQ=;
        b=HTAxsHI4NFhxBaCaDB1DX0kXLNVIdVACrlSB7snYNia/S5Dxaduy0HAuEa14nLUnwh
         NjZ4+XYPjdEbGPlQtY7xdMJfc4wJ/ln5C9TgyMxTXtHwoH/3GbMtvLTxpiYS9aqcmyYW
         mbmmqyhMSBrFgMNqsZX+qMFEZjAGKsUeyE7JBzpLP+9Up/4SXYnUWGousajsyQ4e/gG/
         tp7ZiTkE0B16NNSEFY2ltXz8lNF4pGmLiLTfLBUnAHZV/4xyXmd7/wSkdV3an3765q5j
         BOERqjZVvDAeOKg/YdyD/hrlM9y2S5+Lf1xyea9woIZQAmW4/C6KW/yyDMkY+8oW3KCN
         +2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSf8uFnlnhLwj095+FU8Hbn9FbYIuI6qLS2jyiMbwJQ=;
        b=OQ7JbcGDo1KLE8aIScb5a/OEBI5TF0ysPbj/KPAB3MMsb+Pr/6ToGfL1isJoHP85Sx
         LBKryiRGYrCzk9osCFSAWd7bm1/oOUIM7KjrXFHpYWUaPa/j/y4NxA8JhQGx/YibaHux
         N/2JwRxnMiaI4Kij10iMtJgLnYEFPliYZzl+ZPJXFMIWEq4AbUg0WOMtEHcwTasUCcPV
         7b+yP3W9bhZWotp5mSoBuA6qxYI1eTSSSr3PEWN4rno+Eu137RKwQ60yFHxI57zXM33I
         NqOzQXdsItbvvSYgFB0NIQCGVzl7DoPSnUPMZbAfj+dzEakOtcmTzENm7YaMr1WDCnVW
         gDOQ==
X-Gm-Message-State: AGi0PubHKkUTm9ylksdCWbRqgip4KPmE1TnIsHxPbZBYSMjWIi1z2QtP
        8lheiUKcKGYKfLCoaneD57Y8Bedt/r+5Ic8nkOZzzw==
X-Google-Smtp-Source: APiQypKLGba57Vds1+EwidDyrePfi8s/BtJ+tvZbYfVRkMJ5bQ1HEXGS3YVge49dJY0iO94c5gudWNVEvYyk1g0PZ68=
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr5028454lfp.4.1587024009374;
 Thu, 16 Apr 2020 01:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
In-Reply-To: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:59:58 +0200
Message-ID: <CACRpkdbUzwwcJqqPb=HVcDptMb1OqmRnYNzPuTMLz75LOsmSrQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver
 ready for buidling loadable module
To:     Sean Wang <sean.wang@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 10:08 PM <sean.wang@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> In the future we want to be able to build the MediaTek pinctrl driver,
> based on paris, as kernel module. This patch allows pinctrl-paris.c, the
> external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
> be loadable as module.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> v6->v7: no change

Managed to extract and apply the v7 version using the b4 tool,
thanks!

Yours,
Linus Walleij
