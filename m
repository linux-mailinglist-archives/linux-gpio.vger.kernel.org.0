Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780EF40ED63
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbhIPWeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241102AbhIPWeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:34:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772F0C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:33:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i25so24860456lfg.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C2Pd9oQGhsIAALkBCdNNs3Jk3IqYwXgIkUsJNmKqGe4=;
        b=AFSoc9u3yI+qZzT607V2n1nfEHCXO38yJEtaibfgn8ZEFzLgedJN/Rop5q/SWjAqam
         NExNaUbhkeVgxA/JRNTOLd+QU79s8Y0aRXFaxaTY9UbFHBAAjtNlESlSl/L/dMqas/vG
         +prNUa2EEa2Ft6E1RlwGuxTVLZjNN8Stgh+JZr3AtjtKO62Q/XIs3iS6mNbSSQUw1eCz
         fgHlZx78TKrmNlK/BOZrlviCUFCG3Ip8T8nDqFbZB8w5r/F6h9uu89rWa+upbH3cJpcY
         0wlfA0GY9GgbLoNL4fllS6wGxeD06CTdJZ7HMLfPfpKeTyefnImaRTMjLjJsKql8PrUe
         YBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C2Pd9oQGhsIAALkBCdNNs3Jk3IqYwXgIkUsJNmKqGe4=;
        b=2ubVhKcgvnbDEIrs53ieyctapg5upfStAQwIhbQ4pCdMvHDjrgNvBIqmW9DPX0GDVm
         9W1EM/o9WbfkzE9rxWzj2CgAlyTXQkIRN2AJtNRL34Tjh1bCRub1I5l4zokb4vjNEuu+
         EWU57JFiqUu9wLmVALYpQ80BSyymB30dlVomkOMo0QYWKRIJ+FL4rK7Qo/WASlEuIRDC
         mltZCHmj2EfjLJKSt61neXv9qajFELS96t/4POGrw5FxEU5AW5YdxnMv7TMvcEQLEW37
         xi2WgoTSpVn6DTwx/rC6e8uI968xoCwBNps4sjceiS75sKCmlEuGhPGGA20YMYtulZbV
         Ow9Q==
X-Gm-Message-State: AOAM531rn4lQ3if55eAHWTEGv5voDd2lpuNN+hJXPJAugXvIQe0Tu2uq
        psn5gmRWcHnDIlFiyPvXczgeiLMj8/PQCRGSpSuPCg==
X-Google-Smtp-Source: ABdhPJyxqxvinOj8aMJiZNnMyx2DgvsDEllzpmCWgV30ksZxAhfVIZ1rNGoh75+UjjbXoIY477ApJn6fT4OHdj1weFc=
X-Received: by 2002:a2e:5758:: with SMTP id r24mr6861004ljd.432.1631831578894;
 Thu, 16 Sep 2021 15:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210911071046.17349-1-zhiyong.tao@mediatek.com> <20210911071046.17349-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210911071046.17349-2-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:32:48 +0200
Message-ID: <CACRpkdYim-2xcKux+4M3JTwRuE7SgEH7d2HszPXO3Z=AKdHTrg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: mt8195: Add pm_ops
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
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 11, 2021 at 9:10 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> Setting this up will configure wake from suspend properly,
> and wake only for the interrupts that are setup in wake_mask,
> not all interrupts.
>
> Fixes: 6cf5e9ef362af824de2e4e8afb78d74537f1e3db ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied.

Yours,
Linus Walleij
