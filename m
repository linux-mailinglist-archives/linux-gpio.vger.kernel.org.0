Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320DB359EED
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 14:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhDIMiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 08:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDIMiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 08:38:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DC7C061760
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 05:37:54 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u4so6273365ljo.6
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vrj2njnju6P37FX4R5nkYyvVHTJwDCcIDa0jtbjQNS8=;
        b=rn4xWoJbIM2lElaUk3BqsK/H6dLfBdBqZzpEvAsAN6NnL8kR0USSkLu1dQhqsK1J73
         hO0N2vYqqgi6BuuEyWIcJHptFsRf589/TfncGZ4tWMbuGxjuhMvIH4q4Aob1CaQ36wfY
         mpnRgdkvTo8nEj52PVLHRIwETk0tWf1Tw6AKSpikF4l4vZTxbBL1rDbU4l9POzrFRxRu
         hX6yUamtAqRBJbEFUh5Ldynx4Om9m544+C55qRVe0MOh99tNfI/MIlDASxy6ou0grtc/
         wgbUxhiwrPWnsYoxvsvDwkkcc576juu94+/LZpw76WK+4XCzo5onUe7xRcRPc1b4LfK9
         JOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vrj2njnju6P37FX4R5nkYyvVHTJwDCcIDa0jtbjQNS8=;
        b=FTjAG5m5hbh4VFdxrFYrpEatdNVAgLwQiILsQGB6a5fi88MQ3TyjABKsRxtmT+suo7
         d7mm8g4xFuhirj7uiuMQvhYNWVL7gd/1bLPF+kMz26wrLPB0d82M3vBu0ggT3Znwkf4D
         k44yGo27maqVnB6q4XxoRrs/B0pZUbNt1o8BIwnBldsy/MFMG6yFbMh8iIkRjkioDu1K
         T1U/yuhZaU2FQf6LoCmKU39CcGLJgujBGbyn//lXeT/skOTq1G/vQTAq910wGIeCp8Rp
         d5nivQoEH/nYgFC4+rBZiKX9Lw8VoSpi0tFR3y7+IlJVbfOYJhcVloijWy5SyEzCCmyG
         MVBg==
X-Gm-Message-State: AOAM5313zVLdYUZxjnkkILupUR/VFbwVBc/aNbSh2zF26TPbry7TGemk
        Uhh/RWKoKrrQxeqQMntg2I3Aie/VRbmYQz7prNiksw==
X-Google-Smtp-Source: ABdhPJyjeXNIJsgKQzSnVqGXQBIctrOW1DI3Gkh598EGopzXaoTH+TVDD886ENRO8OX0ubAeeHKR+umKzc8k1lYTiHg=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr9430809ljg.326.1617971873118;
 Fri, 09 Apr 2021 05:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <20210319081441.368358-1-jay.xu@rock-chips.com> <CACRpkdY+A4bsW28yXRGeGVnK_UcR70sMeX3jpABGVJc49A-xcg@mail.gmail.com>
 <CAAEAJfB3csiXBtAioV768PYMb4Sv8UYvmaVaOXZDhJWEzXPLeA@mail.gmail.com>
In-Reply-To: <CAAEAJfB3csiXBtAioV768PYMb4Sv8UYvmaVaOXZDhJWEzXPLeA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Apr 2021 14:37:42 +0200
Message-ID: <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 9, 2021 at 6:17 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:

> Seems we are missing the dt-bindings for the new compatible string
> "rockchip,rk3568-pinctrl". Is there a patch for it somewhere?

Nope please send one :)

Yours,
Linus Walleij
