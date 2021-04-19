Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742C3363EA9
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 11:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238390AbhDSJhY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 05:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhDSJhX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 05:37:23 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0B1C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 02:36:54 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id v13so12518360ilj.8
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
        b=eWDXuqodg1bQmske9tHrOI8NsHDlHTEgOmye/Fh7/PyboTl0nFIePRWBJXVaLBLdYL
         BBjNk8q9vyDZezKgDRUmCn1awNKpBYlI0OSF6DUqF9YSVN7EBwQT4ClpVDPrVPjhsq7L
         /cxBzjOn4DB0/2dGz6Ke0Z7XsHYqtyhTb9aFcfzn+qEf3Otcf7rUrNozVwlT9uaX6SPn
         Z9WvX60f2TB21uehcch+M5JUSGJsw4MrAm0Kad+xf46C9sHo3ZJNUNQ9HcxIF1INfPhA
         WoIxZrisApTVtJLVkzVviMmSosJJo7uZgZ9C3LPBtqz63qdUc9AssEsj8K8bF9P3DQVF
         Xi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
        b=dHwUQEd1C5z+joq2UcYEM5lKaowao0Kf30itlCuskfJaKpY83BAFoRgRKNZpdHIvos
         Pban2mH/0J1lM/WSPxaDV2nFmFhY4XQm+D99sGGSLO7OoV2FKGrC9yHjk5pcJCQ+S1Q+
         ZZLm979vgmDZOOzNtJOtQypQP6HTY1/50E+YsrJcbQpH2/JvlFLRpNeXg1ONirG6j4bW
         /UapSb+nKID+He92P/xJ6XXl9kIniYLJQjFMTqFdB7fGJZpTEzqIyXLD2LlSr3ctT+2C
         pcLbEF/XRVI2+vKhm8f57TP6zf4Rx2krBFKozkbVSVRARzKBD/5ok2kesroDx+Y+RbM2
         UzwA==
X-Gm-Message-State: AOAM532QzEeNIYl4CIvwY2zc8YQ7zVZefcBkzjNtf2Q82zA44ostwnJL
        REfakjWvlgpDSNRDxLBjOSzuqoOVAj9tCcSSu8S1JQ==
X-Google-Smtp-Source: ABdhPJwwakYC15Jfwn61s38W3QBtR83s86sP27Ota3crJt0MVZZtVZ7G2Iwa4wN1Yir0Xa9WkfeUDQ1R15jnMDZu1vg=
X-Received: by 2002:a05:6e02:10cf:: with SMTP id s15mr17546452ilj.302.1618825013674;
 Mon, 19 Apr 2021 02:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com> <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
In-Reply-To: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 19 Apr 2021 17:36:42 +0800
Message-ID: <CA+Px+wUvrNT1p-pLDKd=2RyzBOiy_AuBfnyyapmbRuZWDdOErg@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     sean.wang@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 19, 2021 at 4:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > For example call trace:
>
> Please, shrink it to the necessary minimum.

I'll snip the stack a bit in the next version.

> > Uses spin lock in mtk_rmw instead.
>
> It's nice, but now the question is, can you have this function be
> called in a non-IRQ context concurrently with IRQ accessing registers?

Fixed in v2.  See
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=239787 .
