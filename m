Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 386516426AB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 11:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiLEK2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 05:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbiLEK1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 05:27:12 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6519710B2
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 02:26:21 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id k185so10615962vsc.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 02:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zty3jcbSJCY21FYxkmZcyioKVxKHc26JDIwFsWCbPaU=;
        b=Y2VNYHWrF43Bg4rxDfA9Ty5w9QaZ4LZVeXPs2QLtd/Rco8MKeiXS1Vpap6cdsf/lMY
         lquyUX6BImWuMw+xaFT68I1Cog3xczhAFrdSXN73jDbPz+lFEGwDyjEq56avYGtjEJ08
         9FbezZlgdLMFvtcxnWCJSzzgOVLKqLBAmP6zO9Kc/gCi6vOWq6Nr/yAsvhfZxXQw2uIM
         el7cyQJNzz/lXx/HBzwjzdpTuyLZItcnfTDm6fVpfq2XedUXGpObfOYkpNyU+PwxXxMq
         +2A7W9WyAfSTDDQk1cUO02942LMdFv/tzSc+jpVzKksKxLm8urKc84hyRoYgeUrVJMhO
         OJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zty3jcbSJCY21FYxkmZcyioKVxKHc26JDIwFsWCbPaU=;
        b=Vv4Fe91cFTW18H7FnvFVQEM0fvPnsM9upViDQ0ytSWh4JH5Yx2Yj7mUlwK0vGvsJeW
         3IZJLL1acCpE4Yj/gCPb06LbW/52+ekZ5nVHYbS+CXLbi465tstWwuxNmJHmOhQzPLMP
         3tsBQOQuoNQ14tOcV8SScRr6Df6GGb8T4l97dE0jdBPeN8snG9S2HOhvDeGIrfbsRr1/
         HRAS1arciXaGjSqYBFyS20aVtIzJIXxlVGTPMIz/b9+AttvnWhyj/MgG4LORtQTniWRn
         DN1sVFqBsUCmg2TBcQJnzm++Jk+6I/7KwJncSwSGp9QTrin4ARM63yy3+6d1gYcJeWi7
         ZaUQ==
X-Gm-Message-State: ANoB5pls9QSSReYFQ8frW7uLHURNz9IinAwNKwO3GvGSXlL4/JXxCYF1
        MwIO7tKyxRj6ccplYvoVIovzPUxlHv5PzvorquojYXIpTPC/zg==
X-Google-Smtp-Source: AA0mqf7XaMCOcAftBOmcYj7F9JXEuTUEO9o7enbzW2eQRlT3vWxh55TXPKJUWOzqQP0MIthfUbXBtzxVumzDRwnl8wM=
X-Received: by 2002:a05:6102:722:b0:3b0:eec8:ce04 with SMTP id
 u2-20020a056102072200b003b0eec8ce04mr10612907vsg.16.1670235980438; Mon, 05
 Dec 2022 02:26:20 -0800 (PST)
MIME-Version: 1.0
References: <1670221196-36806-1-git-send-email-wangyufen@huawei.com> <f6bab0d1-008d-c5c0-ef29-28a61df91e65@huawei.com>
In-Reply-To: <f6bab0d1-008d-c5c0-ef29-28a61df91e65@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Dec 2022 11:26:09 +0100
Message-ID: <CAMRc=MfD84WstmUO+qnkrAYviq_ESwvk554TGCjZq0P9JAG24w@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: fix refcount leak in rockchip_gpiolib_register()
To:     wangyufen <wangyufen@huawei.com>
Cc:     linus.walleij@linaro.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, jay.xu@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 5, 2022 at 7:21 AM wangyufen <wangyufen@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2022/12/5 14:19, Wang Yufen =E5=86=99=E9=81=93:
> > The node returned by of_get_parent() with refcount incremented,
> > of_node_put() needs be called when finish using it. So add it in the
> > end of of_pinctrl_get().
> >
> > Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> > Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> > ---
> >   drivers/gpio/gpio-rockchip.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.=
c
> > index 870910b..200e43a 100644
> > --- a/drivers/gpio/gpio-rockchip.c
> > +++ b/drivers/gpio/gpio-rockchip.c
> > @@ -610,6 +610,7 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
> >                       return -ENODATA;
> >
> >               pctldev =3D of_pinctrl_get(pctlnp);
> > +             of_node_put(pctlnp);
> >               if (!pctldev)
> >                       return -ENODEV;
> >

Something went wrong when sending the patch? Did you use git send-email?

Bart
