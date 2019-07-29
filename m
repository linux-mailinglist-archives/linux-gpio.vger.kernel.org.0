Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8C678D23
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfG2Nqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:46:50 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64229 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfG2Nqu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:46:50 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6TDkP0G011156;
        Mon, 29 Jul 2019 22:46:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6TDkP0G011156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564407986;
        bh=qLoqc8SgJBDFKaergokyblK4+gJ/6TiiJ/m2LMCPOyE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EQdW3LxzSgcfz3nL3LKBEKlgdNjgkQTjl0SJdSkDxamBZAXu/jLmuoDQxHRneeCFd
         HdLUYc4d8wUVLlcKbh9nrnSZbbCwTfATuz9UClTmWHDSY+7OTG4SVWNUHT98gGxKUe
         xvkm9jgUOQzduV1JfMpxFTA6Nbq9gDoX/DFVdAg6yP+LgScy5ysyPd6EF8O8w661cL
         XnZbhAHpn+OLB5rDt1gjefINk6Yb3c3SwDt79g6fQHF/xhC/Hgkl8rIDq4KMWAQbyg
         q5ymojhZlHbhdpm4DVyrXCGIS0htjMwugFmIkEaStrJD3g29y4DN5yqTZ0WdjpQ1CH
         T2ZJ1sf55A59Q==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id m8so40849464vsj.0;
        Mon, 29 Jul 2019 06:46:25 -0700 (PDT)
X-Gm-Message-State: APjAAAW115u0JlZ3ar45mFxbXnXLsCDDZqgXGL1SWM2lDTthmLMFxLQI
        CczceCK+7kMgty3H0Ap+KAbzubgHGAmPKzCJ5I4=
X-Google-Smtp-Source: APXvYqx0tQvho/eS+Vd4XAH38/PRJt4peo3nbQti7+g5DwIb7TijNjEmOVk9sZOM4iL75B9cLkHSgmLm5wJs1UX3RLk=
X-Received: by 2002:a67:d46:: with SMTP id 67mr68024863vsn.181.1564407984713;
 Mon, 29 Jul 2019 06:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com> <1562668156-12927-4-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-4-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 22:45:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNHPwS50mKj72+3OWNODYaRUGDQx_b88mf=Fv34nR5yw@mail.gmail.com>
Message-ID: <CAK7LNARNHPwS50mKj72+3OWNODYaRUGDQx_b88mf=Fv34nR5yw@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: uniphier: Add 4th LD20 MPEG2-TS input
 pin-mux setting
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> The 4th serial TS interface uses the following pins:

This is the 5th pin-group
(hscin0, hscin1, hscin2, hscin3, and hscin4)
but I see what you mean.  So, I do not not mind.

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



>   hscin4_s: PCA[11-14]
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---



--
Best Regards
Masahiro Yamada
