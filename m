Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED12CEA0F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgLDIoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgLDIoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:44:39 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A294BC061A53
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:43:58 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so6570967lfl.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KET1E+zuak3FlCY4zF7z/1ILHVvC2UNzSxg2qMKY1c0=;
        b=HxSx5uVAmmhLrfNvxVpDEfIm79FjWwE+/pIOwU9OCK4itu6RvC3I29vkt6XN+XnlQO
         35qbSosF0096esxtPaOnQPzrtaaFB7ldlWwSM8k6l7VOnau3V36cTZM947r6Yy5jxp6j
         V/UltUuV1NUcCDh14YfCLi2AQKk8jemX3ddOis+X+igZvQK39fa643oOfJrBRyI7Cdbb
         paw/zZAVesnY5ei4at4uYjHLTYCaHAvyWaqAf0sGcjOPfNlnYoyO7Pn8kbXazuKA3Z28
         OYVHXUhRguDKlf0ec/j9CbVkRgRlnWXbPEL1PlzphOt8/IImroG9s1ne8Axif63KivuQ
         WtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KET1E+zuak3FlCY4zF7z/1ILHVvC2UNzSxg2qMKY1c0=;
        b=TnCVyFIkBbT/E7iRmqFrrcN6U0fzcGk7mNuw6BBc6exy5jegS3bJKe/IcHyAXa0mij
         PuaIPQIEWlaFEUzpOjmOJUbAzUP+9iXp2RpNZpmMnMaLkWgRyLk2v2HdidrBY8Fwyn9m
         ZCyD0oy3whwuApiNea/eH22RFtDyf5YmFDlyXXm9br/qLmpe9e/XSjJmqhXPeEH/7M0j
         kishegSSwR53Sm7OITBxMfMSrdG8UGv2n022r7C3tpuXN8Y9elUw73QU96qP4SHauh50
         j0vtCgnj7yFdwgA+gmZwGflyqyxADXGqUqrAN0QFmOVWxDReP3qRsYBHlKpapiXmcE8s
         4prA==
X-Gm-Message-State: AOAM533wMrplJVocMGTWxJAdzQpLjJYGErqYx+Y7vSwxyP2QIeOnrNYw
        sJNAkHgxbAHe2/InU3QlMsNFuhAV3JQfWo34YEFzvw==
X-Google-Smtp-Source: ABdhPJxSmtAp/6oFP6JQUcOPafIUSq25E/Xy3Sy4VeE2x4VQ+ZmXA8JyQPwmPHVM/WpFq9Ryq05QtDCFXaeHkuFJhTs=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr2768677lfh.260.1607071437123;
 Fri, 04 Dec 2020 00:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20201120093058.7248-1-zhiyong.tao@mediatek.com> <20201120093058.7248-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20201120093058.7248-2-zhiyong.tao@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:43:46 +0100
Message-ID: <CACRpkdYbVbgUEvGk4t2YHieUaFvMMg1EOR8opuCqm-w4wCYCOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix low level output voltage issue
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, srv_heupstream@mediatek.com,
        hui.liu@mediatek.com, huang eddie <eddie.huang@mediatek.com>,
        jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Erin Lo <erin.lo@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com,
        sj.huang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 20, 2020 at 10:31 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This patch is used to fix low level output voltage issue.
> A pin is changed from input pull-up to output high.
> The Dout value of the pin is default as 0.
> If we change the direction of the pin before the dout value of the pin,
> It maybe produce a low level output voltage between "input pull-up" and
> "output high".
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Patch applied!

Yours,
Linus Walleij
