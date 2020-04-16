Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D81ABAC3
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 10:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439858AbgDPIDf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 04:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440173AbgDPICc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 04:02:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476C6C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:02:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x23so4884798lfq.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HS3wh14onxfnVAAnelvXE++p13ZTdiNaT9jQji2UHzs=;
        b=vfo0PPID97JrT5WKWP575QXEQfMje8Y80j1J2y4VsCaINnaxBRBOwbphMCECPp2dp4
         B0B/RHjLCRYxZCwT3VKOk8T9rFGCrA9byaN8YYhGfODjonk63PPGpAkGlYgE5JJCG6t3
         brqYJkXoEUYfkA2gQEkVoUNveryy41bFDIecBXeQ8/6eLwP15B4SY1OZRlcAxaYoIirR
         NHB9W5QNDgUKLULGcDhmopaU6Oc18sPdfhqCsauY04aSSGj8PQ6dFzKaZ3FBM58TcTiX
         7Pm5np1XyoMAf9/uJ3q+fbexj3Ioq34+53S/J8DKepGd08s7ORCyG4xQJT/TryowzFmv
         +flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HS3wh14onxfnVAAnelvXE++p13ZTdiNaT9jQji2UHzs=;
        b=i83kibYFMy+XxhsN1eHS1s3MTI5S7HpRWsTCLw+m9aSqTTIoF59/gXH4S/pnn9PmP8
         b4NCxonpzPNlH4+bDwVGpcZxVJb9IQrOcYM6515RAQ11R1v5Nv3v2OSZHfY0RTp/bZxW
         AaTlfiQj4kxmrQ4pSz1m7h9FgJYRSmQnl008m5a+IZEyvH9TjWRhjFWDhiE//k0ng7DP
         cnNyE4UtTqenpbQVMapBYcljJh4Z/pWDWbroRXX2ijEI4R7LehqpUEB+vMyWv0ZAaAgQ
         R46smQ3yxj5WzCqil6W9v5rONJwp4wj17zF02LJTMxuEwJlXSXctJIsXhez0te/PpVbw
         fKYQ==
X-Gm-Message-State: AGi0PuY9GJE4t0nqgJT4mphZ+MtwOYKd3ygoFU4zbpA9LSjMUHKbFXrX
        Tgm1gPC/dd36oDfUNSRYKGu6ysiOXS4Yl5tZyr/mSw==
X-Google-Smtp-Source: APiQypLuIixLf5ucqE301E0Pfpc6UIvL9GPllhUYp731XovnEOOMBJ2YWNaowR5LKg0u97weWLvK2TO24s4t9c/jatU=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr5389181lfp.77.1587024149690;
 Thu, 16 Apr 2020 01:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:02:18 +0200
Message-ID: <CACRpkdY_86VK2Acjk3MoJi4K_F2RP-2YW7nfEDN9Bg=TB9nr6w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: mediatek: remove shadow variable declaration
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Kuohong Wang <kuohong.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 7, 2020 at 12:34 PM <light.hsieh@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> Remove shadow declaration of variable 'pullup' in mtk_pinconf_get()
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Patch applied for fixes, thanks for fixing this!

Yours,
Linus Walleij
