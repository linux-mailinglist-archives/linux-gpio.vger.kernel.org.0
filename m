Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150856FC26F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 11:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbjEIJMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 05:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjEIJMh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 05:12:37 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E783DC58
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 02:12:32 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-757984bcbe0so13265485a.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 May 2023 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683623551; x=1686215551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD4d87xGqwj8x/aAkdAtB6F7zNjiV/R05nAVNR7p0Yc=;
        b=cyNNxcOgMAEz+pxIK8jws3GF/GGwMhJkgByFMbLlweStwKPs3fD/uGEYk18D0SnO0E
         xP5BD9cS/mxaNydVKAFG9OHI1AoLSJ+KCl0y3AsmsShmVhprLCmKEpaSbHb4qLBA2PHY
         PVFriZB/RgjH4iRxsiLW3hElqgz4nu3ljjlaZFUXXj2eHhQN5hkl6Ttvkj4p8ohmZ5Aa
         TSFAy20YjtTi0vxfys+NOfYK+V78kxc4aD3FxGy5A+dJR7hLy1kvHGJOFIuQueVUjsd7
         RQqVJeUxfEb8IGIICnA9HRXdIYvTXUsIHLh1EMQtlcIOWJnlM4+3qSxd1MvTmN+IGgB4
         k8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623551; x=1686215551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD4d87xGqwj8x/aAkdAtB6F7zNjiV/R05nAVNR7p0Yc=;
        b=PVKhvFAzNgNdrVOzrU+KS5yDYG1keDLZMrpk8HNwEhgcmKB8XqL5ekMa4AtxCmPMZb
         Ns/06YOwtd5I6IL3jjXsYgOdr4emKh2H1XLkthXA5bkxwXcSuHb/SPo/dD/mWyRp9HxV
         +QGrYkWi0H08OtRRxL5HErMZOxm6vtREDuITQQkx0g0LytzyDagMFA3zPaPOeDTbZSLC
         XIh0xDRiSxexCkh6ffYgq82G6tTUFKiimd/2veIiBdGIwViq1StCTobSkxZ28YXFEJyz
         zN8+kj3bB5auTaJHnIyAw5uGigBK15rC7lDv9FdM+yVAbQ5WDEl0Da6OcN199KRO47Iz
         vHnw==
X-Gm-Message-State: AC+VfDwvoMDhXyBYZrfY5+EWuIzFqE0SaqxnOeDyFDyplO4FLXv3px5s
        gjZ+t/WFoK0zel/aAuyDg0bamaH0VC8gCqBgZXT9ev1jsyFqTcQj
X-Google-Smtp-Source: ACHHUZ5BcIZfNZTH4hgGhb4e61mAhrMwQOYuyprUJnkY6wCix/GB42D/aI964LID1LLH3QEZTxuTdcl13nbKuBezaGk=
X-Received: by 2002:a05:6214:d05:b0:61b:637a:64df with SMTP id
 5-20020a0562140d0500b0061b637a64dfmr16250848qvh.3.1683623551626; Tue, 09 May
 2023 02:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230508194555.1057007-1-shenwei.wang@nxp.com>
In-Reply-To: <20230508194555.1057007-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 May 2023 12:11:54 +0300
Message-ID: <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional() to avoid
 error message
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Fugang Duan <fugang.duan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 8, 2023 at 10:46=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> From: Fugang Duan <fugang.duan@nxp.com>
>
> Use platform_get_irq_optional() to avoid error message for the

an error

> optional irq.

...

>         if (irq_count > 1) {
> -               port->irq_high =3D platform_get_irq(pdev, 1);
> +               port->irq_high =3D platform_get_irq_optional(pdev, 1);
>                 if (port->irq_high < 0)
>                         port->irq_high =3D 0;

I would rather do

  err =3D platform_get_irq_optional(pdev, 1);
  if (err >=3D 0)
    port->irq_high =3D err;

>         }

And looking into the code the above piece makes more sense after
asking for the first (mandatory) IRQ.

--=20
With Best Regards,
Andy Shevchenko
