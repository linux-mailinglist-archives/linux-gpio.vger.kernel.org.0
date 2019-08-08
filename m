Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B31585C2A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 09:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfHHHzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 03:55:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34092 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbfHHHzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 03:55:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id n5so115139228otk.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GiQjexsggDYjcQqlR55R7WEvUq7jf4HaqEXdHw03WuU=;
        b=lcU/BVyaLexN2aRdGPvvabBbrxckbNK8WtsRy19UVqj5tblqXqHWk5slv9wLXF1rHD
         dFv4J7Pch4UyN0H8qOaGkMN6FAM0AatCt/0MY62/+kZh9OGYyfP3hWxiF0H416idt4Bq
         ONc8Z0WujiWryKKBTfCUcWqMXff3K9lmxVFtcy60O7dRxjh9cwpBHq2Y4e3r5OFMMyYc
         tNNFBIzr8hzfUsVVsxHCGeZX8PcxH6kO1go1WoZG8g7Jojzk8+4Zag73P0w9KbfEmkIM
         GuQXggfT5ks8El1zWYukosXSlOxVmRAI+SuXIdPL1BhHilTOiJ5kGmkWUkCBB2LCGyCg
         o2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GiQjexsggDYjcQqlR55R7WEvUq7jf4HaqEXdHw03WuU=;
        b=JhKR6HhWDga5DZEsRpwpe+QzrUIFLH5aWWU3PG1Qzpax+m1Z1l4XvBpnA9Pj3yOh0q
         inozz9/1YkAlhWwrTe9TRSjAx3bskPTXH6BEiIWTKvyHS/5MH78bPVX0PVxka+dH/dUg
         WLEvrImeu9GFh/nhNDEClXEtgOfBUuIZ6j8unH5SUhxCdarquBbk6huNRbCh91pgJ5Je
         AHf63WauQOKiu6L6Zf2Bu2ixITVXIEKGFx6zRuPiUafosDYs2pn7HKENeBKVHzYQgjBf
         mwy2LHnSLn/aZ1omf5Vkhi2X9d4ofeR8xsimJL9rarO9coa92yGkF3XdxT9se+ohcEd9
         P0ow==
X-Gm-Message-State: APjAAAX5qyiL1g8Lc1ymGIIe5NTkrYA16+Ssiv2x8fREHo+tcowDqLDk
        8zhg3/mZDXAhHXn3LQsro7zJfRJP2eOo/aIqUK08cQ==
X-Google-Smtp-Source: APXvYqw6ZLlaA814ZrczvWZRFjyiG0tpUg5ZtEbOD4XlIj2AfXHaw1qqOq//LRMxWir2hR9iM/wTE6Df7/lJRhOYdGI=
X-Received: by 2002:a05:6830:13c2:: with SMTP id e2mr11884404otq.123.1565250919459;
 Thu, 08 Aug 2019 00:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190808074329.15579-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808074329.15579-1-nishkadg.linux@gmail.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Thu, 8 Aug 2019 15:55:07 +0800
Message-ID: <CAMz4kuL=bLa4QMhy82Cffpn9fDk-H1MZYCrybZiVn+nZQyBmdQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Add of_node_put() before return to prevent
 memory leak
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 8 Aug 2019 at 15:43, Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
>
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Yes, thanks for your fix.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/pinctrl/sprd/pinctrl-sprd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index c31b58168772..5abb64da2c0d 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -940,8 +940,10 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
>
>         for_each_child_of_node(np, child) {
>                 ret = sprd_pinctrl_parse_groups(child, sprd_pctl, grp);
> -               if (ret)
> +               if (ret) {
> +                       of_node_put(child);
>                         return ret;
> +               }
>
>                 *temp++ = grp->name;
>                 grp++;
> @@ -950,8 +952,11 @@ static int sprd_pinctrl_parse_dt(struct sprd_pinctrl *sprd_pctl)
>                         for_each_child_of_node(child, sub_child) {
>                                 ret = sprd_pinctrl_parse_groups(sub_child,
>                                                                 sprd_pctl, grp);
> -                               if (ret)
> +                               if (ret) {
> +                                       of_node_put(sub_child);
> +                                       of_node_put(child);
>                                         return ret;
> +                               }
>
>                                 *temp++ = grp->name;
>                                 grp++;
> --
> 2.19.1
>


-- 
Baolin Wang
Best Regards
