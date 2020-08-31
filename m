Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB4E258443
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 00:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgHaW6k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 18:58:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11848 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726102AbgHaW6j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Aug 2020 18:58:39 -0400
Date:   01 Sep 2020 07:58:38 +0900
X-IronPort-AV: E=Sophos;i="5.76,376,1592838000"; 
   d="scan'208";a="56016758"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2020 07:58:38 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD97E40FBD04;
        Tue,  1 Sep 2020 07:58:38 +0900 (JST)
Message-ID: <87mu2azapb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place
In-Reply-To: <CAMuHMdVpDJiBpzDjm2deS=GM4-it9sJVCnQYwt3ZfvwMHQ5MjA@mail.gmail.com>
References: <87mu2ky4rz.wl-kuninori.morimoto.gx@renesas.com>
        <87k0xoy4r7.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVpDJiBpzDjm2deS=GM4-it9sJVCnQYwt3ZfvwMHQ5MjA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > Renesas related pinctrl CONFIGs are located many places,
> > and it is confusable.
> > This patch collects these into same place,
> > and group into "Renesas pinctrl drivers" menu.
> > This patch also moves pinctrl-rz{a1,a2,n1}.c into sh-pfc folder.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thank, will queue in sh-pfc-for-v5.10, with the following MAINTAINERS
> update folded in:
> 
> -F:     drivers/pinctrl/pinctrl-rz*

Ahh, yes, thanks.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
