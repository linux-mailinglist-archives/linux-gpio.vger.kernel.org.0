Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA036B9450
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2019 17:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404216AbfITPmm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Sep 2019 11:42:42 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42702 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404193AbfITPmm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2019 11:42:42 -0400
Received: by mail-oi1-f196.google.com with SMTP id i185so2112783oif.9;
        Fri, 20 Sep 2019 08:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rM8H4BPDAyCSGbTq1aY5onP7Ss5EnylCOQeGqZ8W1Qo=;
        b=OCAIwi1MXaJlg4a68zr1SjKI3tPvuQe543CbEWBfXBWKYKsoRuVnjjG+RjPLX3hql0
         h7VjKLEg1K8iMq+zHQ9K0PLPNic4MXz5NPqWG0eqLaDaHQtJFIMxYVw7mBOYHzYE+4C1
         LoRiMKn6kAdZAtpXjvC3Wa31MF/MYRKhOD2JZDqpBPuQqpSMTJpX9OgHGJk9VC2Dlooj
         Zyht3s1l/JN5TAbDs98zQwzG5US4JMwvMzmA/lVWbuCSKCWPfP6xnrD6nBKzm3wkn3OB
         MVxdQes6QWTmsiwvR2gsCFG9USQrGDl5IY+jjscLuvGabozTy/YaXiPKQWeZPQ6El64y
         dmnA==
X-Gm-Message-State: APjAAAXpwHFKaUcnCKdeJyI87JFQvdmVeCsDqdmvgLAiWu9yeNDrHX97
        Kl1gH4EvuUTOOwFX1u5q3cRvDtIRVKrw/j5a3NU=
X-Google-Smtp-Source: APXvYqyK4PKEsItvTvRTX+QLcME6drRPmOKgSC8XYp09gBI03le5zS5xcuDpZ++AWYSpweX8XGdH0VR0wZeUcLYC0pA=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr3350780oig.148.1568994161376;
 Fri, 20 Sep 2019 08:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com> <1568881036-4404-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568881036-4404-9-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 17:42:27 +0200
Message-ID: <CAMuHMdUhQxiE2Mb+ZAj7KiXmZODvioXOhoc==Sr6WUiWH9PmMw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] pinctrl: sh-pfc: r8a77965: Add R8A774B1 PFC support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 19, 2019 at 10:17 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Renesas RZ/G2N (r8a774b1) is pin compatible with R-Car M3-N (r8a77965),
> however it doesn't have several automotive specific peripherals. Add
> a r8a77965 specific pin groups/functions along with common pin
> groups/functions for supporting both r8a77965 and r8a774b1 SoC.
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
