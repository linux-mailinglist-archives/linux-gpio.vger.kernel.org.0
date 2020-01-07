Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E7C1323ED
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgAGKlK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:41:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35671 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGKlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:41:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id j1so46789069lja.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
        b=S8e5zkbAC4vGQyN2oQss8+zjnBiH2/1Oxd7//7o3rqWykwynawOBgCdO/acAzcuB5s
         mODoPHD8qcw1L3hjquQCkC0OrsKrcB77niLT521ZG6XitmsVfXMynWJ0GV5sUyh27+6c
         F5sa19WSHj3ogwD0IBzDD5qOUnOnWfXQhXVbCRpjMxcv40IymAx9IzzcIdDW78P3BMOI
         F6NvHOluAoPtlerKGz/DgXzJFBDujqnWB7hghFmAiTw91WKVMfFytwqCY4iPZ7wFzFsa
         INUIQKDoVJaPbk4IKdzkl3uWNrGDY013KPqlTmEjB5IbTXAtPRNjwCgsI97dA8rZ8Mmx
         4vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
        b=kZr/N6wJ8EdB7DqDTs/YAo1oEVby5ZWqtpZdzzHa3eeGadniy7rI/4R7WAnifMjpk5
         UjxhCbIXiokZtiL4j9kpnWv/nDHUse0fg5yzBS8UVeL5/nfbFJ4QtOPQuYPvrlP9jY5S
         wonBe/Kfy8MQSe5Xy5RYkUM3Gjaao8nONQhs1R967MM/YiyDmpR0molZRVB4noTn6KRg
         caUCnM+LSwTmyaRnJwsejLpdL6zc2WlpgKafhYWL7b/P7roHEvx0197u629H0BafqhH2
         rFdSnrC4QpAB3kaf4C1uOWv7Gb6ekV/rIrC4DxKcUJGLIyLelmEf5MCK9KUxuDxra+Vr
         tR0Q==
X-Gm-Message-State: APjAAAUhzqVpuwlDKEkqVDVffuxxSiSowUhaFKnAVBt2x63bwEZtvDMW
        FUYvC1AoRKUs0Vq43aJdKY3tkb2FxcYXDsTku+NM2dGQGIg=
X-Google-Smtp-Source: APXvYqzPw/Qdx+sCdiOeNl65OnuQtCOolmEVElFYMMkBD7EgYjlKsv9P3YvfyZW4sD2cny18hKjAeDvhBrKHQUlYRoE=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr25961364ljm.251.1578393667915;
 Tue, 07 Jan 2020 02:41:07 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com> <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:40:57 +0100
Message-ID: <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To:     Light Hsieh <light.hsieh@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 31, 2019 at 2:41 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Refine mtk_pinconf_set()/mtk_pinconf_get() for backward compatibility to
> previous MediaTek's bias-pull usage.
> In PINCTRL_MTK that use pinctrl-mtk-common.c, bias-pull setting for pins
> with 2 pull resistors can be specified as value for bias-pull-up and
> bias-pull-down. For example:
>     bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
>
> On the other hand, PINCTRL_MTK_PARIS use customized properties
> "mediatek,pull-up-adv" and "mediatek,pull-down-adv" to specify bias-pull
> setting for pins with 2 pull resistors.
> This introduce in-compatibility in device tree and increase porting
> effort to MediaTek's customer that had already used PINCTRL_MTK version.
> Besides, if customers are not aware of this change and still write devicetree
> for PINCTRL_MTK version, they may encounter runtime failure with pinctrl and
> spent time to debug.
>
> This patch adds backward compatible to previous MediaTek's bias-pull usage
> so that Mediatek's customer need not use a new devicetree property name.
> The rationale is that: changing driver implementation had better leave
> interface unchanged.

Are these devicetree bindings upstream, or are these bindings never
submitted for inclusion in the official device tree bindings?

I don't really want to encourage out-of-tree non-canonical device
tree experiments.

On the other hand I want running code.

I suppose if there is a solid use case for backwards compatibility
that also affect independent developers (such as people just
hacking around with these devices) then we could add it.

Yours,
Linus Walleij
