Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A361BBF308
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2019 14:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfIZMa4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Sep 2019 08:30:56 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36550 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfIZMa4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2019 08:30:56 -0400
Received: by mail-oi1-f193.google.com with SMTP id k20so1913238oih.3;
        Thu, 26 Sep 2019 05:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y3b68w/pTPo2DCO6zay3jptE46Sk1GZsE/h59dkZ0Zw=;
        b=GxqzckqW/57zG2WTfqjZJzX9BmIIrU02vkEwhX+XiXlb8v4G62GCWEWaFYrf6g61xv
         DQbX798MkGW36Il8dDKLokMCHhUtZDiE2zqnCzDVpBm/Ah9A1ZKLbp47DHznwmhoTkVx
         2Iuc7CmaiG0bB16SrnhLQ/gPg9I1Q4WbtPjrpdgplsMpXHFySdIUgNxGiFsba/mI1AR4
         qWOVO5H/+W6kqhgbZpqca8mdtRo9A5HzYUMy+YL2s2XWtZBHStOtWxNE9fSeuPlmFLur
         naXXZxIsNjjOVf6awFHSYoSGIiDrnDRiR9dIlPGNXm3kgRgxwWeIlo+dLCcwRjLg3SDd
         fTdg==
X-Gm-Message-State: APjAAAUW4QdeO10xX8jHhGtnrjTSN2NZibZ4VF61wdpzdmE5fgReqAFS
        c9j2LJ+MbpbUDwU55RxM2y2HMOx+/zpjyC2PZ8c=
X-Google-Smtp-Source: APXvYqwybBOXw1S7CoEiYB1tzxMTGZVXYkC5r/isn14EZrLeRd+TtNYxRqQomjPaqsJ2KiEJEBOYa3xjj1G3G3nI4hk=
X-Received: by 2002:aca:cdc7:: with SMTP id d190mr2356068oig.148.1569501053979;
 Thu, 26 Sep 2019 05:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:30:42 +0200
Message-ID: <CAMuHMdXZ9Ntwqynz_t+Xi+5c36ppzt0E1Pp3sFF4wW1nABXVzw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add DT binding for r8a774b1
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Mon, Sep 23, 2019 at 3:28 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Document Renesas' RZ/G2N (R8A774B1) GPIO blocks compatibility within the
> relevant dt-bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
