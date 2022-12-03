Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7FE64176D
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 16:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiLCPBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 10:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiLCPBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 10:01:31 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD352125C
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 07:01:29 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id i2so7264898vsc.1
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 07:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09mwFGz4NcvFbSVkdum1P3oLswumOl7iXfX4mGer/Fg=;
        b=vn+zFXCqAI+urZrIK5ppevghvUY5FHb+9sphp7ac70gMg3YE73mE+3g6peM3093a25
         hkTfTljMkA5Eqx6zV+xR1Pyt/yAza1JBC1goCDnAlzFq/AsZ7OtkPRHW41rflaABgnWO
         TGNlRpgOfV6BdiXnzVvsCY+NLf2YVgOGiUylST1lMoI07iuJq/2xX8wYjKkxeeKqnJ7i
         +3KXGfXgPGEcFiBrShZLl+2f/OKRgHsdqmsfSrxrgaKFKRy2wI/JrD2fvUYwWuWX/Ik5
         EGtYyO+NZ4WPWm9KBrxhTujEFlUYCldEOB7A49T8wo8S51qhMeisMKqn6ygUqgQJcZ/R
         8JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09mwFGz4NcvFbSVkdum1P3oLswumOl7iXfX4mGer/Fg=;
        b=Dq00Da/gLBalbsVCvoWc/2bSXWe4IpujF5qm6bxGKMj18qIZMPZ6ZpSSi6uXGcxUMU
         yiUL4D+sYIBF7dzpNipO/1o16prSWy47O6FkcPR8g6Ou+VIxc62zSxRZNA+2MCrOyLTX
         AzLavvs160HtBMOZfE4dd+MUtsl7RJHs+ulCKqMUCqM429nc1Gayb2qMGi7+7DDmRlxG
         xwAnBbkXlCurtVmby1nuMDOBj8/kivegdWEYKqOEEtEy+hdH2l+i8bM+bX/uf/P0BFND
         kQHo7xCHKcEwHt51y2CH5HiaAR9OWSHy3YPRHAdxb5Y+hHxeQWhVVousMZN63Gi4q1NG
         v//g==
X-Gm-Message-State: ANoB5pkkgnIv/K/EP5MEwsegs2w12M3r2m1yV5bmdbonDsxiABMlcp97
        yCZBJGOYbeinKYHhTRPiwMB07D8HD9SAujKmvKZFKQ==
X-Google-Smtp-Source: AA0mqf4prrZgY5AZGLl8TsqsXt+T07g61OMhnTaRfqtm8oQHZV4+gNzjg0YMjGFSea+wglI7ScShDYsKrWU3UL7H+B4=
X-Received: by 2002:a67:e8d7:0:b0:3b0:767f:e291 with SMTP id
 y23-20020a67e8d7000000b003b0767fe291mr29399514vsn.47.1670079688361; Sat, 03
 Dec 2022 07:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20221203105825.15886-1-zhuyinbo@loongson.cn> <b6b34bc4-4089-9c02-81b2-9eaf2c9a4663@loongson.cn>
In-Reply-To: <b6b34bc4-4089-9c02-81b2-9eaf2c9a4663@loongson.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 3 Dec 2022 16:01:17 +0100
Message-ID: <CAMRc=MdqOA_xU6TdcMspF=GMYx0MbKv0MzrTNOuZ7W=kg2skDw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: loongson: enable irqdomain hierarchy config
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>
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

On Sat, Dec 3, 2022 at 12:05 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
>
> =E5=9C=A8 2022/12/3 18:58, Yinbo Zhu =E5=86=99=E9=81=93:
> > The loongson gpio driver need select IRQ_DOMAIN_HIERARCHY and add
> > such support.
> >
> > Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> > ---
> >   drivers/gpio/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 55b7c5bae4aa..0f014411703e 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -395,6 +395,7 @@ config GPIO_LOONGSON_64BIT
> >       depends on LOONGARCH || COMPILE_TEST
> >       select GPIO_GENERIC
> >       select GPIOLIB_IRQCHIP
> > +     select IRQ_DOMAIN_HIERARCHY
> >       help
> >         Say yes here to support the GPIO functionality of a number of
> >         Loongson series of chips. The Loongson GPIO controller supports
>
> Hi Bartosz,
>
>
> please help merge this patch on top of the existing series.
>

I applied this, but please don't ping me an hour after you submit a
patch on a Saturday.

Bart
