Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3431D717FC4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 14:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbjEaMWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 08:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjEaMW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 08:22:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14012132
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 05:22:26 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-75b0b5c9eb8so363076185a.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 05:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685535745; x=1688127745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgf483Tity8H9J+afk5eaJBP26v2CodcRllfLsZeDnw=;
        b=pLR8xiTx8GTs8Hn/jw75lNZzp2lqgrGh/APhHCCwvA3796UKQSJRcUzYQSgt3Iqc9p
         kUBNsEg+8/2h9JTVBWyymWTu2jwz8iMwwgaVSwm4F9lyjIrq9FL4yPKwdIVh+AR3FtrS
         0DUe5ilg+Zl+rBn8/l7+Lx+GPFcxj2lRjNkDjPgrwq/Iwj6Bv/lq6JkWPFdQlOs/HBF/
         HQy4XFzvdy220WoupJby5BdHsG/XHv4dZera916loR//WFySTFMLJvptUIZS8D6ENiDL
         DnJluETtky3OoQCA0dDdpj74xRgdnSKMXCBmQtMfBTvIyHiBk34wHl8j1L+llIJ5eKF9
         kUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535745; x=1688127745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lgf483Tity8H9J+afk5eaJBP26v2CodcRllfLsZeDnw=;
        b=WxqPeO4CbqTR2kB5UlExGHr3o0oBy1jMOSLXsvHSrvhMT/ZgrvCOqHSwnUPBUX9xXs
         8Vbl3Rkm2AEbBwqUv32iBZ29Ed6qIYkOxbqHOvGYrRkbymoXZwj8+0HLOJTnOdcsCeSE
         bLFC4laLN0YeDAe7pq8oPUVzvM9AT1JZ1S4PimHDeiNyJeiTHN5pygsEj0W3/fdnM5gX
         X6HNuc+8RFOa8uQa+REVNu6BzUVOK3HdMPdll7jIt2W6GqKQe+dCrVMagvEih8V0gcqL
         xTGEKsUhfIxYW18RW6EaC4AlSbnGYtBk8Sx37QKgL4DkobDWmS2koZVvQhBt7JgbLMvI
         bv/Q==
X-Gm-Message-State: AC+VfDyO7D+56JtY18JhpOX3APFjX1MnYH6eYKC7oN5GPQfq3umVdMc7
        nKfEX9B7WshNwX5LuDV0QeV9uZ9YPBbLaV3U2H4=
X-Google-Smtp-Source: ACHHUZ6D2JuHRBwqj0z2I38XtRHatjGNCto5u+ove2w0/QAX0y2kC4P6AGV17+SR7RqFVLr/c3W8HJMOw4lhTo4ZUQ4=
X-Received: by 2002:a05:6214:e8e:b0:625:aa1a:b6de with SMTP id
 hf14-20020a0562140e8e00b00625aa1ab6demr5509845qvb.64.1685535745136; Wed, 31
 May 2023 05:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de> <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
 <20230531065829.7qrkv2ivs57aymcz@pengutronix.de> <CAHp75VeNTuQWLqieSyh0djyrBApoZRwKOAnMRd80fVGzfJAnbw@mail.gmail.com>
 <20230531100655.dedu3udhd4dv7r7j@pengutronix.de>
In-Reply-To: <20230531100655.dedu3udhd4dv7r7j@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 15:21:48 +0300
Message-ID: <CAHp75Vf0_M-0r9KDf_vg6TcfnaKfyF8P-iwpqnv-WiitUmnCzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 31, 2023 at 1:06=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, May 31, 2023 at 12:51:15PM +0300, Andy Shevchenko wrote:
> > On Wed, May 31, 2023 at 9:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:

...

> > https://elixir.bootlin.com/linux/v6.4-rc4/source/drivers/gpio/gpiolib-a=
cpi.c#L1262
>
> Ah, that was the necessary hint. Adding the aliases there would be a
> third patch in this series, right?

No. Just split out that one to gpiolib main code, since it's already
using fwnode API, update OF code to use it, and modify it and then we
are done.

--=20
With Best Regards,
Andy Shevchenko
