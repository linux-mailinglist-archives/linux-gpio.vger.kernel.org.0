Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E1F758536
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jul 2023 20:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGRS6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jul 2023 14:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjGRS6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jul 2023 14:58:53 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C979F4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:58:52 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48159634694so2256091e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689706731; x=1692298731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCXF+3DQeZRKgnE0AHasBLJEp5/cGqaVsuwTgG7AvaA=;
        b=Jw2vmqEg/Ahsxz82QM9peK2yVJSzgnryXnABWpTFE1snHJQN0vNF5wmdby19z9TNKk
         3p8CpqcJ5z7BGv/tfLWwhfe3SAd6KPVmYQhyuVAMmCG4dYLVWItBdlrSO8amKjlveKR8
         7mt3faCWaI7WZPw/AKUGzRQY/jKBGmkKlGwH0uPZ8DM4wh8Yb1hfCrJj2VFnpqRerxKv
         ySs24bc9rXYk0YCDjqsY/j2vITWjKdlg4PZDMgRFZm4PRABFFB462Ipty1lPYiFaUtZu
         EJJ7QbiGpOkP4WPmrc0YLmN8vWbPI9pmdnP1O60xnVJ8HYLGbkU+9CjNuYUs/BRZ6eLR
         Ndhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689706731; x=1692298731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCXF+3DQeZRKgnE0AHasBLJEp5/cGqaVsuwTgG7AvaA=;
        b=RWfl2UwJcAePQAXrlr1jsRfsOn1cCWqaoOU8uxV1bXk8GX1uUV93rO/uWaFmh0LCCU
         zLYPegvEUeA4xe7B6XDUn5eTLSze7OWMCVJnX/6Uf0D8CAQZMNA4yeZmiy7ItLsy+NwQ
         k+w/RYbknOiHaaoNjZbMGg3YEQDPOZfwhbohr9lR4CK9Aiw3hF4HDcniAutJBICq0Y2U
         Qd6CaIxO9Gm7DpsWpimWLJl0xLFyWwozytLnrc6Jd17tw+w9BvtK0zMep17o8QDMfkjs
         VF9c+QD8CCE4nlZaxUl78zIgcUlLxUCAKIDaL8sheDBo/AsyMOyUADaTe1p8A1OyoZCG
         Kmqg==
X-Gm-Message-State: ABy/qLboDB57QhnmNWZ+EFTin6cXV7VpUbO9wf+ML+7axMUAOVb5BV12
        yQHsEpAUxq7/iG2yUgLnFV/chk7RPuqGolh6CIqv7g==
X-Google-Smtp-Source: APBJJlEUB7vj1yaYT8FpBTe95IuQRlr3StaRyYOUt3pqTK2OiSyJTZJQIfIRUKSvNt/euq+mvodnNAVhyeSdjhMyGDM=
X-Received: by 2002:a1f:6dc4:0:b0:471:24c3:6cd3 with SMTP id
 i187-20020a1f6dc4000000b0047124c36cd3mr2339552vkc.11.1689706731222; Tue, 18
 Jul 2023 11:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230710214910.31892-1-asmaa@nvidia.com> <CAMRc=MeQBSJ8Y92VfOfiaDjDyW44RunYt-D1aFraNaR_dTRVOQ@mail.gmail.com>
 <CAHp75VcKH4ZJ7HjjY6q_Woi2wAwnhiqyyPySOpK9Amt_SHB8ow@mail.gmail.com> <CH2PR12MB38953B86B91D7529CF6DBEF5D738A@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38953B86B91D7529CF6DBEF5D738A@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 18 Jul 2023 20:58:40 +0200
Message-ID: <CAMRc=MdCb1OzeBdQ6YxBw3FMmj7jCs=1SabYiu-+0FdVLdZe9Q@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: mmio: handle "ngpios" properly in bgpio_init()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 18, 2023 at 8:39=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> >
> > > Applied, thanks!
> >
> > This has a bug.
> >
> My apologies for this inconvenience. This is not the right patch to be ap=
plied. It was rejected by Andy. I just forwarded to you the patch to apply.
> Its only one patch an dis named:
>  [PATCH v2 1/1] gpio: mmio: handle "ngpios" properly in bgpio_init()

Yeah, I figured and backed it out.

Bart
