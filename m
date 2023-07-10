Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A52E74DDFB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jul 2023 21:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjGJTL6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jul 2023 15:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjGJTLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2023 15:11:55 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3891DE67
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 12:11:26 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-440ad576d87so1363050137.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689016280; x=1691608280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTiSrPJ68bBh1WF8NAqk+/Z9aNvMpi0XqeGrN/eMmzs=;
        b=oSWlgOPKcLAvfEg/kmJX0zjE1F2BawjR4panXxZ5ek5rLFWZ4uHbTeuLWZ6QPxeL1H
         bJ3W6efBET8CoR/zBeiW29tw5sXGqgcs8LO5P/qzWC+6uuTXKEEy6pDbW29jUwKsZekr
         HolbQdX5Dn7i9Me9RPm7vfl4b7diH7qrFt4PtV4r8Gk2NtFElUOI2+94SAVfmvzEexI3
         xFMRtQwMlZbSi7V7bAfVNmjayRvTA/DL74Aww21b08e0ZFOu2Mc6TS02lKDXR205x4xO
         naRZSfiZwX2zI9b5zlUhK8zHSxweeZzWWQ8SGXzhndbiqapdbZUfxvImOK+P2bdGNkN4
         TgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016280; x=1691608280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTiSrPJ68bBh1WF8NAqk+/Z9aNvMpi0XqeGrN/eMmzs=;
        b=BjibIY6kDH87ppknftTZc+unjM5TfPVwasvo3IntKxwySoaIYjLCKAGxo4fChXOq/z
         /HUAH/nIOhEua94qXyVBwkd95QlAUoF0fnfN9LlbIJoV1BhAt4UjbCC0ZJFTaXaeu/A2
         FoHOneiXUohiGoUlimjGes4EsGAKtAJiBJu7RGBLUVK6LoHU7AH3EdBj/rVsfVTWs8rW
         L7yOalKFvkrf+bMcR2SPG0CZ1ZDiX0IqJx6OiITTazQN+9KKB7FSlJ8GVicLgkdyryYA
         RwjjH+jE0w+OWXvjjb2IuNByS5/SPmau8+ry8htTB5pUu9qKoXUVOcNn+MzK63GJqx7Q
         2j7A==
X-Gm-Message-State: ABy/qLY0R5NLxdxUDxBNGWuTOEK0F+9EdC5CCGbnNPKRoEwsEZStW1HI
        y9RfAesh3KUNv4drxHoJWH0xpJ2QFeN5XzA+JVxHIzE1L7JLeu+p
X-Google-Smtp-Source: APBJJlGY9MDuNdXLb0NkP0Z+ZlIV2XpXYshiGSQl6L2QoJSkw34aI0JVRs6XVAoQYM4fEzcTuKIqz2WTi/xPaSjA9BI=
X-Received: by 2002:a67:f24f:0:b0:443:7e49:c023 with SMTP id
 y15-20020a67f24f000000b004437e49c023mr6989264vsm.6.1689016280782; Mon, 10 Jul
 2023 12:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230323205733.20763-1-asmaa@nvidia.com> <CAHp75Vd4m79RhG-_KLRNzr0SPzphG07fOiTWwmGCfx8Lz=+6Vg@mail.gmail.com>
 <CH2PR12MB38951D4AC0D3C373E17FDDBFD730A@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38951D4AC0D3C373E17FDDBFD730A@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Jul 2023 21:11:09 +0200
Message-ID: <CAMRc=Mcv+dZsJB1yO8Y3Kh+7UJDAQXZMietA2KkGYE_+Xe+c7Q@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mmio: fix calculation of bgpio_bits
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Jul 10, 2023 at 7:26=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> Hi Bart,
>
> Could you please add this patch to the tree?
>
> Thanks.
> Asmaa

You still haven't sent it to my address and it's not rebased on top of v6.5=
-rc1.

Bart
