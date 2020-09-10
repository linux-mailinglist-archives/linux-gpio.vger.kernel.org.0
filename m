Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A41263B04
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbgIJB60 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 21:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgIJB4T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 21:56:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC7EC061343;
        Wed,  9 Sep 2020 18:52:49 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w1so4663510edr.3;
        Wed, 09 Sep 2020 18:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O4wihOtUGmKvM6OV1xz49d7GF6s8tThElPC8COTjJhw=;
        b=NoNawaGqtXD5PPRDwAAu3FydxWGnfWzWyB7YxDfsBTacqM0bBAm9iioberpOzHVRkX
         jTlVeOAZYbWO6LryijXb9r+fRSkQpWcD5qHVHJD7o9UWxOmYSRlJo6jojXpp9A/vDsDl
         qqxsimwLjGd0pfnV++gPK5PtI/JIFAWP9CaBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O4wihOtUGmKvM6OV1xz49d7GF6s8tThElPC8COTjJhw=;
        b=RQOF40Duc2a8CJ1AR3jA91Pmd0qbwpUNpqZRsZARJtwgXUePqHi4QgXPTV7+FjTXlF
         OBlXT/yzZrRNMYpFPpeiAEbIudy8GNqLS/z2eHi6Jh9QXJ25/0pyV7jfzSPwF76U0YDN
         j1XRIBiKBVmQRNF7nE6zdLA13vbL6wGwpKxDaeOLP92pqxwyAQv/cCPYrJ/RndAsilZA
         3nmoodhkFoKXBSe5/PbHn2c/WILzx28GiHNWZO9p5xNxxG9vlq4nnt5qcLsOO3c4kFXf
         f4l/QKMXRlK0BJM/0CupqPqt4Wnjtg6ph0DqkC8/P80veH2oSL4ej7l1ff2I9kdU6QTd
         kIeQ==
X-Gm-Message-State: AOAM530LKEn3XAD+6z2aTCwj1gayNb8u7rENrABFiJy9f60FdJbpeEB8
        HvzA/eAWjp6l1hzTSHjZVbQ0CLDWSEgGzWTcihg=
X-Google-Smtp-Source: ABdhPJx3tc6th2NQ3W5yI0UnQXkvVnc2gSxYPh/skJvLZlUli2agzUUaOAOxKvX4m89LXd0PAOcDIyBSHEkZWdpqMVo=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr7213014edv.232.1599702768129;
 Wed, 09 Sep 2020 18:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au> <20200909114312.2863675-3-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-3-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 01:52:36 +0000
Message-ID: <CACPK8Xe0WqmyXOHdxw=OWbFEzHew7F2aBQ9B5EPRJfDhj=vhmw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: aspeed: Use the right pinconf mask
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        johnny_huang@aspeedtech.com,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 9 Sep 2020 at 11:43, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The Aspeed pinconf data structures are split into 'conf' and 'map'
> types, where the 'conf' struct defines which register and bitfield to
> manipulate, while the 'map' struct defines what value to write to
> the register and bitfield.
>
> Both structs have a mask member, and the wrong mask was being used to
> tell the regmap which bits to update.
>
> A todo is to look at whether we can remove the mask from the 'map'
> struct.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Fixes: 5f52c853847f ("pinctrl: aspeed: Use masks to describe pinconf bitfields")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Owch.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index d8972911d505..e03ee78b2434 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -534,7 +534,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 val = pmap->val << __ffs(pconf->mask);
>
>                 rc = regmap_update_bits(pdata->scu, pconf->reg,
> -                                       pmap->mask, val);
> +                                       pconf->mask, val);
>
>                 if (rc < 0)
>                         return rc;
> --
> 2.25.1
>
