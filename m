Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96FDB943D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2019 17:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393377AbfITPli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 11:41:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36223 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391672AbfITPli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 11:41:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id 67so6585026oto.3;
        Fri, 20 Sep 2019 08:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONjqYclRILSiONwW8nEyD+ABq5QQDUS/CzXxaDFud7o=;
        b=M6MPmx4ovlwfu0QFGk1RXGHzZUpO1YN09oGMfyPg5ghMowhJoxG2C4TJqHJh25jOKV
         TBZTsvjyU9p7XRr8Jy0/dq8sU5dg0LaOcP74HYtjr8IgCKMoaWR7OPUMmylU9N2DXgEW
         Bn5XiP2+wqMXi4VMr4RYXYmtcIRsviTyw/E2TWvKtqaGlfD0Vm8/gWkYSlLieypwn0DQ
         hsE6Q+WxLzayhr/H9dTg6DF1ttRaR1uCOD3pLmMHFTsnP4ItvirIKCSI9AmtKtBJMBn5
         YZnAUUZHyH4/GEiPIRmMHcaRqarM3ogUXxJIBVECqfJSuMp/5og9ssMJZKv3m5I5nZzx
         brWQ==
X-Gm-Message-State: APjAAAWrE5+Ydalro5UirdPOgp4bZgA+nD2a6Wet1mxa+VpNVqBq9ky5
        hyiMqa0R0eFFsf6a/zrnOeJM0+MWHsD4n+PxnHY=
X-Google-Smtp-Source: APXvYqzMvjPotcPF9OaeCBy6I8RLjudF8lPOMEfna6gUHnSiFDDUFyqG9N6bE93h+JO1xHVyzwPfi1QW2MoCiOCHYRA=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr11948956oth.250.1568994097713;
 Fri, 20 Sep 2019 08:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-8-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:41:26 +0200
Message-ID: <CAMuHMdX+urmvWYGy9cj8Xt9wAU8tYzm1eZ6jrXBySSEsB_wfOg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: pinctrl: sh-pfc: Document r8a774b1
 PFC support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document PFC support for the R8A774B1 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
