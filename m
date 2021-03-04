Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481A032D6AD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbhCDP3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbhCDP26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:28:58 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A49C061574;
        Thu,  4 Mar 2021 07:28:18 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id z7so16321162plk.7;
        Thu, 04 Mar 2021 07:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=voTkZrGlRSJCOLgRJZZiHDWi2Mrxpand3AmKOnkZ67U=;
        b=r40jKJTs8vzxnGzg4I9RQx/Am38K9HVQ0N/bND9UlFACT+lUDRa8hHKBNacwVOHeTs
         Z+9Gf1W4ZXDmpjfON1G3l2Ju9Ip4ofe9Wza5Vo758clD3u1U6By40R3vxd4mCMVC/WEq
         ljYgHwfpA3DgaEWJc3mb9NNaG9gkTy0R+1fctqoe9Ox9JRpszXI6vjQO2E4FsR1D1Z8c
         8KUstw5knkjGDrecGqdF3zj/NcRuV8VW0pHnpEm9RypvPob2Hf1JN5bdYhYz+/c2Ed03
         lfi/G0Lss/6EaKj3fRpd7Secb2xFLGhlQ8MV1wye+BvPUo8Fqf8QFeNEKHuFwq/C52MD
         SXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=voTkZrGlRSJCOLgRJZZiHDWi2Mrxpand3AmKOnkZ67U=;
        b=IWwA5uJTEgyiEo8PmFdr/+QIGkFnsy1EtxU14JFO5f3rtd+dFCPP16lR5aqWGO9E8v
         oVWkz4zY9cCXyIIV1GSiNKA9z6AaX0EWjsTQ6C7wtPbRGaAQ39o5UEHAAHB8S226kw0U
         M9BJmiBN56L6SnBeUmpISIWHk7TLteRPX4zAciPkbgwgD5H2XTO/kbEEVh2109LUMzac
         eU4SnguN2yYl0ZKhXEvxoXRJw1nL1pImJB7yBC4igsgsq8q4qP9AU47FnLhOSLm8pUOg
         rwb489JfgfVNe1m6IeL0Xd3WG33u3sRUBEDQ6Gzwpk5+UJ6RSeKc+icHMX2BfIjNeHlg
         zxMA==
X-Gm-Message-State: AOAM530maPcjF/roh7/Q+XC+Hmcq/LuZMMXwBLuMXXBLEL6Qpc9iR79Z
        iDge0NsE4OE+cn4Y17JRN9NlvozAvvcKZiynxDg=
X-Google-Smtp-Source: ABdhPJxKEeUzPdwe0f5tmVUofXEupPB53AcS5fgkw8fRL/2PAPZuNrqdpzm+dsbulsNvn30KlUqd/bxPCejSdhBKPIk=
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id
 w16-20020a170902a710b02900e30b187e5bmr4260601plq.17.1614871697595; Thu, 04
 Mar 2021 07:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com> <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
In-Reply-To: <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:28:01 +0200
Message-ID: <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 5:24 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 16:17, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 11:35, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>> <noltari@gmail.com> wrote:
> >
> >>>> + * @of_node:           (Optional) The device node
> >>>
> >>>> +       struct device_node *of_node;
> >>>
> >>> Can we use fwnode from day 1, please?
> >>
> >> Could you explain this? I haven=E2=80=99t dealt with fwnode never :$
> >> BTW, this is done to fix this check when parsing gpio ranges:
> >> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36d=
ba370f797/drivers/gpio/gpiolib-of.c#L933-L934
> >
> > Use struct fwnode_handle pointer instead of OF-specific one.
>
> But is that compatible with the current gpiolib-of code? :$

Yes (after a bit of amendment I have sent today as v2:
https://lore.kernel.org/linux-gpio/20210304150215.80652-1-andriy.shevchenko=
@linux.intel.com/T/#u).

> > Also here is the question, why do you need to have that field in the
> > regmap config structure and can't simply use the parent's fwnode?
> > Also I'm puzzled why it's not working w/o this patch: GPIO library
> > effectively assigns parent's fwnode (okay, of_node right now).
>
> Because gpio regmap a child node of the pin controller, which is the one =
probed (gpio regmap is probed from the pin controller).
> Therefore the parent=E2=80=99s fwnode is useless, since the correct gpio_=
chip node is the child's one (we have pin-ranges declared in the child node=
, referencing the parent pinctrl node).

I see. Can you point me out to the code where we get the node and
where it's being retrieved / filled?

--=20
With Best Regards,
Andy Shevchenko
