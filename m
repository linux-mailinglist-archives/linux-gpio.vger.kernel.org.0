Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E242570FD
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 01:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgH3XOy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 19:14:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37245 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726178AbgH3XOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 Aug 2020 19:14:54 -0400
Date:   31 Aug 2020 08:14:52 +0900
X-IronPort-AV: E=Sophos;i="5.76,373,1592838000"; 
   d="scan'208";a="55915797"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2020 08:14:52 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6EC33411632A;
        Mon, 31 Aug 2020 08:14:52 +0900 (JST)
Message-ID: <87imcz7moy.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place
In-Reply-To: <CACRpkdZ_ss-GqV0ig2BPpEE+8-F-9qZzpb+-C5h0TpbWCcL6Rg@mail.gmail.com>
References: <87r1s5hoht.wl-kuninori.morimoto.gx@renesas.com>
        <87pn7phofb.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdWqc1Peo06g_1JrEvEExyaY+k33WJNmbhugE7YrppiRmw@mail.gmail.com>
        <87blj0zzax.wl-kuninori.morimoto.gx@renesas.com>
        <CACRpkdZ_ss-GqV0ig2BPpEE+8-F-9qZzpb+-C5h0TpbWCcL6Rg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Linus
Cc Geert

Thank you for your feedback

> > > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > >
> > > > Renesas related pinctrl CONFIGs are located many places,
> > > > and it is confusable.
> > > > This patch collects these into same place,
> > > > and group into "Renesas pinctrl drivers" menu.
> > > >
> > > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Still wondering about moving drivers/pinctrl/pinctrl-rz{a1,a2,n1}.c
> > > into drivers/pinctrl/sh-pfc/, too.
> >
> > As I mentioned before, I'm waiting Linus's opinion.
> > But will move these in v3 without waiting him.
> 
> Sorry for slowness. I agree with this move, let's collect all the Renesas
> stuff in one place.

Thanks !

> Renaming it drivers/pinctrl/renesas may be a good idea too, but I'd let
> Geert decide and execute that, it mainly affects him and his maintenance
> work, not me.

Geert, my patch moves files, but do nothing to folder names.
I agree to Linus's opinion, please execute it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
