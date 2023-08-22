Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26CB7840EC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 14:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbjHVMim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 08:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjHVMim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 08:38:42 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD2196
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 05:38:40 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-79ddb700ad4so1369119241.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692707920; x=1693312720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEEgAbkIBqZOFIoP5L+tgBDo/VtC8zCFJjmK3WDl1Yg=;
        b=HUi7wY7MZ3QrnN8iiD2+IAO2nM5lH+ocQoiYEE3M4ZesopN80IZSdhH6ayUUU3/kf0
         DGgGVo/xUcbO2srN+3ZPIaq/UAHcla1oiuHu/iy+elkRwhRlZnavOwgOzOay7vt4QAH2
         yU50Gf5yfOX+aviobMXhOcnDJuMCQGUZEfhXS5klTcEb5AowxBVAJ5fNDvQ/U3Ekx5kB
         7UHeIe+E2XYm4xMtPKXX7nd2yhulqs7567XkuZJlK7VTCPPoLFnDZuCalivHnDJZnD7+
         LaScW5/fnq2ha2BoXXexUkyddIJrzeKQYi44b5a8nbXywPZvjAmFUCCHn+pHaS1UGD78
         1IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692707920; x=1693312720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEEgAbkIBqZOFIoP5L+tgBDo/VtC8zCFJjmK3WDl1Yg=;
        b=iwLG0lkhTTt7KnMyX+uBepoIf3gQuF8IS3cWMt8aaluAspJDy9vmBHmt7EA6vwY8Xs
         5o2roOXwntZNcOLt8hCl/rdbVezQMBCRF86Cve2y5tVnKZI74jKJTo6B7Ws/5a5ZCc38
         1uRNxN7Crt2ka1zeTbUyNG3+++arC7ucIaEz3xjnWzgZYRyDgnL4GFgMzdcy0Z9vQe/Q
         lTS0zDSmw/+ygXPvrmp9ObBQt1xbRoNmrruwOpfEY+yfjwiDLUnh2rwPw/c5Gy37PBCI
         wD9NvZryNZFDa0wAkm1C2Eeatscd7f8xqY6k3P1KUceTrpxUnMS2qZ4nn5+7Vfw3rhJP
         UJFQ==
X-Gm-Message-State: AOJu0Yw4k4CJHznIINhSMu7AvE14Kycu0UtPI5DDLScrIduxkpQMM1RU
        lTN594I17ylPqiIJ88Q9MEksszgksWH7CoKI0lbG7Q==
X-Google-Smtp-Source: AGHT+IGSb9DFdGEMVIyWygI9Pzhe8fyPMGscDq//Y+oZZW2KY5haQ3d3RPUVRK0V3wRfScOEMMSOMh+QLD3V1tKU7yA=
X-Received: by 2002:a05:6102:108:b0:443:5ce7:e62d with SMTP id
 z8-20020a056102010800b004435ce7e62dmr7581525vsq.21.1692707919934; Tue, 22 Aug
 2023 05:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230822075122.6900-1-brgl@bgdev.pl> <ZOSmFGZHrLq3I+zF@smile.fi.intel.com>
 <CAMRc=MenZDhrVb9BgJ3R+NqyvoHJR2stjeXouSRWTkecgo160g@mail.gmail.com> <ZOSo+CVYuOxYCNPZ@smile.fi.intel.com>
In-Reply-To: <ZOSo+CVYuOxYCNPZ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Aug 2023 14:38:28 +0200
Message-ID: <CAMRc=Mfw09z2vnsQXmbc_xrg5xrLv4y1myCdm1zrx8GBWMWTzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sim: dispose of irq mappings before destroying
 the irq_sim domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 22, 2023 at 2:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Aug 22, 2023 at 02:16:44PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Aug 22, 2023 at 2:12=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Aug 22, 2023 at 09:51:21AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static void gpio_sim_dispose_mappings(void *data)
> > > > +{
> > > > +     struct gpio_sim_chip *chip =3D data;
> > > > +     unsigned int i, irq;
> > > > +
> > > > +     for (i =3D 0; i < chip->gc.ngpio; i++) {
> > > > +             irq =3D irq_find_mapping(chip->irq_sim, i);
> > >
> > > > +             if (irq)
> > >
> > > This duplicates check in the following call.
> > >
> >
> > Ah so it can be a direct call:
> >
> >     irq_dispose_mapping(irq_find_mapping(chip->irq_sim, i));
> >
> > ?
>
> Hehe, seems yes and no. According to the code =E2=80=94 yes, but code see=
ms buggy,
> and compiler may effectively drop the check (haven't checked this, though=
).
>
> OTOH, the problem may appear if and only if we have no sparse IRQ configu=
ration
> which is probably rare.
>
> That said, I will go without check, it's not your issue.
> And I found other places in IRQ framework that misses that check.
>

I disagree. If there's no strong contract from the provider of this
function then this check is so cheap that I'm ready to live with it.

Bart

> > > > +                     irq_dispose_mapping(irq);
> > > > +     }
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
