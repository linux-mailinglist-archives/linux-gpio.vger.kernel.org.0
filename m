Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F94956BE00
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 18:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236808AbiGHPKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbiGHPKm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:10:42 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716EC18398;
        Fri,  8 Jul 2022 08:10:41 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 64so29025751ybt.12;
        Fri, 08 Jul 2022 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FyATTXW146ePrbCJoAXM5Za7QyR2Mr4OTZR5vn1lyDg=;
        b=ZDuR9wB5fnbcwR9fHlBpG9DlcDgeYNi+9oZqjroVeq0hfv8JaD5loNyjZCzMUv3NmC
         AHxGEtUZCxeMBYIWS7Pj7LW3Vxre8YdMo2EaaViM/SCNSlfIYPQjT9r+3iTqPUUhJXV/
         rdET2kW/0Kfocfk38n5HviqsvxVFYDWqhR9UU0RsTwITxBPJWfWK+Sj9wie1ZFOYDodU
         HDCdcUhCJcnbrv/2MC+kmsZ1A3huOAmOMaCF7vC3Hm7LwECvMOL5MVbuD4Fzw4X6Feg0
         OuGYnMgGddGoEzwiBw5PD38SoCYu0loSwqpOlh0CfTrHGh24SRCHacifWSAXRO2iV0/m
         QINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FyATTXW146ePrbCJoAXM5Za7QyR2Mr4OTZR5vn1lyDg=;
        b=IYd0synIuxzU+05ZUrC+Zz8srib2V3REgRJDkYOJaREaHgvQsvLrNo1DdkGln6e0+h
         c+3QXTzsCF2JGYpus4XFCs0RD2IHwnkSqs7y7rnWQ32VN6F9h/D6fZoa8xVTYJS2xllN
         fytyP0bEh2tbwMwD2v6slhIOMaAGt819SxFQ3PSZcAnt42u0kHERXRR0kc/xz0fIp+dH
         h14MYiB7vbxUu7uZrxFD7fzJsQ1sdfjqhkBO+Qqsl37d5TOyhRZLD19DdvEemvPHRzFD
         w92lSW31bNyygk9JYKVREKmRboHuedBbaReaRZY+3F8sON7gshpngWY1PZYktuCk7KI8
         oukg==
X-Gm-Message-State: AJIora9FnEfFVdmondY9JXefaH7F+fhSupNoZxW6xfWXc+tTMhd0rA2G
        Nkpnd83M+bXx5AU6B2zTUwq1RazRTionePIk5SgbHCno57A=
X-Google-Smtp-Source: AGRyM1takYE1ha7D7dK3xwnG6palmPl6uHCRAap+iqh+HC0UC294NH1T4mPi7ZjwDITu9DCw/L+GRjhdWgocl+PREMo=
X-Received: by 2002:a25:dd83:0:b0:66c:8d8d:4f5f with SMTP id
 u125-20020a25dd83000000b0066c8d8d4f5fmr4225765ybg.79.1657293040625; Fri, 08
 Jul 2022 08:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-8-nuno.sa@analog.com>
 <CAHp75VeKg9G7o6evb47P8jgwG2Pgh5prw7WJYwXZq4pMGZCxUQ@mail.gmail.com> <PH0PR03MB67865B851C724E5958F21CDA99829@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB67865B851C724E5958F21CDA99829@PH0PR03MB6786.namprd03.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 17:10:04 +0200
Message-ID: <CAHp75Vd+REEtRmhHoNaBXR-uRoQ5munE46zub_WV7=nQHR=pOQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] input: keyboard: adp5588-keys: fix coding style warnings
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
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

On Fri, Jul 8, 2022 at 5:05 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, July 8, 2022 4:50 PM
> > On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:

...

> > > -#define ADP5588_KE_IEN         (1 << 0)
> >
> > > +#define ADP5588_KE_IEN         BIT(0)
> >
> > This is actually a change. And if there wasn't bits.h included, you
> > would do it as well.
> >
>
> You mean because of it being unsigned now? Well, I guess it's true
> but in practice I don't think it will have any side effect..

int --> unsigned long

FYI: We used to have bugs with this conversation in the past.

So, please amend the commit message accordingly. And as I mentioned,
this should probably be done before the rest of this patch.

--=20
With Best Regards,
Andy Shevchenko
