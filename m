Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C56774D30
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjHHVmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 17:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjHHVmO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 17:42:14 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EDB10C
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 14:42:14 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56ce156bd37so3912877eaf.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Aug 2023 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691530933; x=1692135733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=765bOZ9Q3Awq9pYBjVlK/6DW6ZaFqIzjRa6sQD5aWp0=;
        b=r1HmIfkFQtHA3+ektE8isZIInkgNkw2/0CirSxwHmYegAOIj0HjMuS9IVDW667VqDn
         tQp+oL6lbTfz8tW4MLa5XGbbCGb+DsTEd70RuIqjimPNBy+Jc+t/i7CrtEO+a3lA0Dwr
         dMeHK4vkjoSx6Ib2HdyieiKG7JsiY2G9FxVMFu2OvfyTIgEkF0uF9lyEtYMAwxmdocSD
         5Ls8HjxmYdcJt3dJuZH3UxQEPoQWtn3SwpIhuzvMLv/fFGW3dAs7SPmD9jonAfSVG8A2
         YK9Qhk39DgKtyeSnbW0Hwpog3K2cDbOTIqL4qvYPXgNpgTlxu59ppxrAO1ThaNNAho26
         U6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691530933; x=1692135733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=765bOZ9Q3Awq9pYBjVlK/6DW6ZaFqIzjRa6sQD5aWp0=;
        b=NPEvlS74sqfUdrFGakCeFjDY4pRxm9CkmYDiTycLQMfInzvnzUsaB6oJtuGSDE+tTy
         hXKDLFB9+BAFOQUjZJiGGgJ+vbc1d1NL/3TCShAc1Oyd5cK+BC6ZKDkn4DK3ER+yVzsV
         9mzxk7AX41OnmCP8nRmOKXRKRnek34SN/Ypzls5aQjiCaXPDUHmUVyXhjBm3I5Hke7+H
         xwiSKrYa2M+2v8z4wUV/FK8G0ZcOukLRAl0GOtAlbiK6DF/sVTGKjJv6VAzNN9NMUgkR
         q14sMWzhZo7JxJgKwMh5pzXcXR7Fg02EwVl0eu75QOWnAfLUL3kE6lhiyjN31Z1RaDzR
         GnjA==
X-Gm-Message-State: AOJu0YyjRygA/iZfMKNxL5FVt6yeAoztNP6DnM2cajBPCmkduTcQkLBP
        PiaMXqCZlhzrMJeIWTEGGXsXeuXQPYgH9+RFVJk=
X-Google-Smtp-Source: AGHT+IFAwLfgnbOmi18Zo3y6LoHgyRUD31XAyvN30kizlfZa9jJXkENaD7g81ioQyzehst17WFKTQCxSiC8+pngsD8A=
X-Received: by 2002:a4a:9b50:0:b0:56c:d297:164c with SMTP id
 e16-20020a4a9b50000000b0056cd297164cmr987995ook.4.1691530933092; Tue, 08 Aug
 2023 14:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230808153346.335411-1-shenwei.wang@nxp.com> <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
 <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91853FD015613B944B8D2085890DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Aug 2023 00:41:37 +0300
Message-ID: <CAHp75VdmfF_P+GUcga5goZEDccjX+W75tLLXTV4OTUk13STd1w@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] gpio: mxc: release the parent IRQ in runtime suspend
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 8, 2023 at 9:21=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andy@kernel.org>
> > Sent: Tuesday, August 8, 2023 12:39 PM

...

> > > +static void mxc_update_irq_chained_handler(struct mxc_gpio_port
> > > +*port, bool enable) {
> > > +     if (!port)
> > > +             return;
> >
> > When can this be true?
>
> If the function is called at right place and right time, it won't be true=
. Just in case. =F0=9F=98=8A

I'm not sure I get this. If you try to add a dead code, don't do that.
Otherwise can you clarify at which circumstances it can be not a
dead code?

--=20
With Best Regards,
Andy Shevchenko
