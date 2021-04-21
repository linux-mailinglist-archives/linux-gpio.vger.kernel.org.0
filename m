Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE56836759A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 01:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239521AbhDUXNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 19:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244043AbhDUXNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 19:13:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAC8C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:12:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y4so29042274lfl.10
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
        b=grk9mpKC8n8Dl77wltDy3n2lpygqgROQ3Mfnf88x9+Sa8TqR3b5ZNHeiAz1CjAJ3fP
         XzHOf2+7s4RuzjlwjvGEgYufA8CVegzBB8517t0TS3DSqhAZLpi8BNkccULsh8nQetJs
         J9HgfKzcVgG4iZgJOlnAe3fsTvlz6TXBuOJR1VSCkq2sSB24IVeZzFmijlH5cLvjPl5/
         orezBpfRF0Y2RfnaJQ64eK5ROK1LunlreSLPMP7FuB/aQBTOs54Ca0EK9/qEzxL9Gsfe
         ZN0J1SSUyLL0loKgpaUOjU5cyiyDv6jkG87zZ/klg/rS/lhdxK+JMD0wekExZJv4xcte
         fapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
        b=Stqpi3fCN+dHD2I4ZSdmEWpiib1Kuf8Wf//Kyhoi3jWoHgLuqTuih6f3/AN9vidId7
         U0L+K0a2195TgJRwQRYln/FIKtxzh9qbHYj0hhorY48RsL5QA2b+6DOXPyW9dNmo0K/R
         IbXAcLIcXVmWqQROSyfL7HAsrnMub39mPjUhMwfW1wFodNrIHb+v/s+WjsRAOG9u4Lim
         64h9ipM5K+eBQOxmzW0dOmVz7YjC1lRHoVG+a4cZvcE7Y+3LoDDIwpJrrsCF6CFWTbIB
         Gb0ol4RoT3HM7mL1kANtoaWcqH5V8v8GEPt1XgX0P4CYCvCLK+BLjJuju8gO4osCvYl6
         NvjA==
X-Gm-Message-State: AOAM530so1qH8gem/2THFGyfW7n9qaeqZlkNVNoc6mbUQ6KVPAmxk4LE
        YKHO2K3o/ZqYPPEdS6rWH6w8rNNpsB7H1SS6k6puig==
X-Google-Smtp-Source: ABdhPJydFVuqJYzV7C5StXPaUPnHeDYzd1nUo4VCkoodIL0HJhtA7Mjd3Cre/972KXMc6uNGUvXpB82qHb9d8pPRf90=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr359877lfa.649.1619046766609;
 Wed, 21 Apr 2021 16:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210406144540.3467756-1-tzungbi@google.com>
In-Reply-To: <20210406144540.3467756-1-tzungbi@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 01:12:35 +0200
Message-ID: <CACRpkdb6KM-smFQ9BdVQgWCNOu-4_t=g8k3_NUZ8HH0Pjr=LGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 6, 2021 at 4:46 PM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   mtk_hw_set_value+0x100/0x138
>   mtk_gpio_set+0x48/0x58
>   gpiod_set_raw_value_commit+0xf4/0x110
>   gpiod_set_value_nocheck+0x4c/0x80
>   gpiod_set_value+0x4c/0x6c
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.
>
> Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Patch applied.

Yours,
Linus Walleij
