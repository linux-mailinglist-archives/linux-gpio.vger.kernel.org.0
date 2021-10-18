Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA16430F6B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 06:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhJRE7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 00:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhJRE7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 00:59:43 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C5EC06161C
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 21:57:32 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id f4so3491864uad.4
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 21:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iPYB1T7gyfKLEKhW7wZ0g0txOGlKrluH3CU38I7q+kI=;
        b=Zs+ejEPn7RH6Eini+VRDCuMpDF7M5+SqQOc8HW6m+cbjp9tmm776ZfBbergz1W6RFP
         crVe415Bd6EpHRzNnPC9ILq6w1DsgVn6cd3a9NBqMD9RRaWnIaM7peuPY8tQE8dU7Stn
         rTCxk2Wg3Q9PmJWGM8WWKqfI35ubPxCshcavX5erfHGlizayUJd3DvccC28uReq/MJQ8
         m375MiCLIZq1qQxrTUAduLX+QKgi2/LfSCtji7P3y4/bGJ4fNxQpJGWbTJ4oVbi7qz0f
         PVEgbCjKWhIafNDLH68MMXsDmA5fDm0WAUBSKSD+6Kh33jnxpDPYIykBNgq1DMMVBAdz
         rZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iPYB1T7gyfKLEKhW7wZ0g0txOGlKrluH3CU38I7q+kI=;
        b=vjO7KafLZjFY04PJA3qvPnS4m1CtV/AEMU/NQiGGNEPPv0h3Tw49vvvVqc3T60VWA7
         2yqFG94A+r3b7aqD7xKQHxd0y32DMsx9duxAADpp0Muf1euy4XnzLenOFxVGEOOC7dzi
         pUfTlEy2l9b9LblvvjVxl+H/2f2882Nwj6QK3G9L6ctVByFU8LLryUVA9/LaORpIkN7f
         8UwzLFtZUUX51iLH3Nh4JqVUA3p+fvMl0uMx5T/Cx2pbHwMKkU3IDprlMjfpCJTfOTIO
         NS5IrRfB5RrqjYDb+FwX5mkWLDqOLu+VBbFXBSQ5O8dENcCHx/HBcTGPx6PP2aWLma2M
         EWHA==
X-Gm-Message-State: AOAM5333dsRu1RO3T6Aovb26tmiN/ALZp4rYvQM4TCi+NreP5W/3JIE8
        /r0BV7oFjTMnQojI/jafcP1HVdjEmOP/+xmRvi0h1nszcNI=
X-Google-Smtp-Source: ABdhPJzAk5rvMKDNpKxWgh67tpbNY8eamDkEkAZAuSb5qo08RTFIstSuH6E6wtgXkJSdvL7OGUCrlFl2ueLvVZWoPyA=
X-Received: by 2002:ab0:42e:: with SMTP id 43mr23290393uav.98.1634533051301;
 Sun, 17 Oct 2021 21:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211018005915.17601-1-luizluca@gmail.com>
In-Reply-To: <20211018005915.17601-1-luizluca@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 18 Oct 2021 06:57:20 +0200
Message-ID: <CAMhs-H_=7D9mGweMxRigVxSWR4GCaowExjgM28D7NB7MsPvcew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'
To:     luizluca@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Luiz,

Thanks for your patch. I thought I had reviewed all of this since the
kernel test robot complains once for something similar but it seems I
missed this one :).

On Mon, Oct 18, 2021 at 2:59 AM <luizluca@gmail.com> wrote:
>
> From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> mt7620.h, included by pinctrl-mt7620.c, mentions MT762X_SOC_MT7628AN
> declared in ralink_regs.h.
>
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
> ---
>  drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
> index 425d55a2ee19..6853b5b8b0fe 100644
> --- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
> +++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
> +#include <asm/mach-ralink/ralink_regs.h>
>  #include <asm/mach-ralink/mt7620.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> --
> 2.33.0
>

Can you please add the "Fixes" tag and CC also stable linux? With
those two added, please send v2.

Fixes: 745ec436de72 ("pinctrl: ralink: move MT7620 SoC pinmux config
into a new 'pinctrl-mt7620.c' file")
Cc: stable@vger.kernel.org

Thanks,
    Sergio Paracuellos
