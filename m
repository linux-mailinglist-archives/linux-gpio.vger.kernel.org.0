Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C067B32E542
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 10:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCEJuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 04:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhCEJuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 04:50:00 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7A0C061574;
        Fri,  5 Mar 2021 01:50:00 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d11so1133982plo.8;
        Fri, 05 Mar 2021 01:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=laL6zCf03DrMkWEQ+Hck/bL2esEnBZj6TYpWSAvdSNg=;
        b=hvfrvbknr3o7UhJrMJNDoFDbSJOHEkHspm/ayCdp5NfSDsPv8LBG1QlI70EXDvre2O
         MYuXAF1HO0f5glU4s2niWReBObuNL9OLQTgGdabjijiAihwC9w0cGAzQhotBvnMFDdb9
         +6919eOwkE8SXAtqH66z0YeHo/3IHL+1XIcz75C+/cJ5I9CGgbgzFkaNcEzu0ubHI7+9
         4/XvKtuqzJOETmbYZttTppe5ZobfjrC7tpHGI6+HIHH8EIhdsQouHb0ercaRWZ6Fp2Yg
         yhNwOToktu8SKXquXvIm/vheZxwqQb3VHWZycb3VfJfH01Wi4c6TGtmyuBNLRENscS0x
         odbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=laL6zCf03DrMkWEQ+Hck/bL2esEnBZj6TYpWSAvdSNg=;
        b=XrSSF5VxCCCg2ML1krWHzP/+neqONLxW46j0Z4t4byd+hcdaU1/iu2Q5ihpUFZPVzk
         lnoH8Sf0qcadY+W5x6f+aetIWjodpBxsMe43Z5F+Dzntm3++YupioR/tocfFWfeKN8S/
         3xpN+lIR+bpgvk9kVEbSaOQ+dfu16sDBRksY9hH75o/o6QHO0U5oqKRa2XOiIqqewJEH
         Ozz0xrXVUlxjCYo262MBS9R8uIe7N/JF5EebXlkKwIMcTkV4gztJ3xVGZNe8ZRcXQvuz
         1V+cU3A/bJjbM7eyTnyWxj5URr5B+7WVw4S3faIfKb+ELOsbb8JYb5hwA4xgroeBWjLw
         ZPxw==
X-Gm-Message-State: AOAM5315866hwxUD9UWwtZHTgXP/j1oMXcA9qInkTIavZSagUe8wKx5x
        xkm781rFo7S7SepX73+VNw1Q253mj/7W/T1Cyj4=
X-Google-Smtp-Source: ABdhPJwd/iyR6XcRxo2Q5a9b5HqoQiosIKcqPmPBov3Lp/DcR3e2GbmWuCHWzUs+2wubCL0usByRRELQiW+K99hDayM=
X-Received: by 2002:a17:902:e904:b029:e5:cd76:20ce with SMTP id
 k4-20020a170902e904b02900e5cd7620cemr7990228pld.82.1614937799693; Fri, 05 Mar
 2021 01:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com> <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com> <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com> <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
 <891B849E-32A0-4115-BCE9-2F0495274404@gmail.com>
In-Reply-To: <891B849E-32A0-4115-BCE9-2F0495274404@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 11:49:43 +0200
Message-ID: <CAHp75VcKNGDduFAo9fmzNFTE9icmJOb7Ex3=YrVgHFPtxhVuLg@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 9:45 AM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 17:33, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 5:44 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 16:28, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 5:24 PM =C3=81lvaro Fern=C3=A1ndez Rojas <nolt=
ari@gmail.com> wrote:
> >>>>> El 4 mar 2021, a las 16:17, Andy Shevchenko <andy.shevchenko@gmail.=
com> escribi=C3=B3:
> >>>>> On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas <no=
ltari@gmail.com> wrote:
> >>>>>>> El 4 mar 2021, a las 11:35, Andy Shevchenko <andy.shevchenko@gmai=
l.com> escribi=C3=B3:
> >>>>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>>>>>> <noltari@gmail.com> wrote:
> >>>>>
> >>>>>>>> + * @of_node:           (Optional) The device node
> >>>>>>>
> >>>>>>>> +       struct device_node *of_node;
> >>>>>>>
> >>>>>>> Can we use fwnode from day 1, please?
> >>>>>>
> >>>>>> Could you explain this? I haven=E2=80=99t dealt with fwnode never =
:$
> >>>>>> BTW, this is done to fix this check when parsing gpio ranges:
> >>>>>> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacff=
f36dba370f797/drivers/gpio/gpiolib-of.c#L933-L934
> >>>>>
> >>>>> Use struct fwnode_handle pointer instead of OF-specific one.
> >>>>
> >>>> But is that compatible with the current gpiolib-of code? :$
> >>>
> >>> Yes (after a bit of amendment I have sent today as v2:
> >>> https://lore.kernel.org/linux-gpio/20210304150215.80652-1-andriy.shev=
chenko@linux.intel.com/T/#u).
> >>
> >> Well that doesn=E2=80=99t fulfill my definition of =E2=80=9Ccurrent gp=
iolib-of code=E2=80=9D=E2=80=A6
> >> @Linus what should I do about this?
> >
> > Well, fwnode is a generic, and I strongly against spreading
> > OF-specific code when we have fwnode working. But let's hear Linus
> > out, of course!
> >
> > But it seems you are right and the library needs a few more amendments.
>
> Yes, but I=E2=80=99m trying to do as few amendments as possible since I a=
lready have quite a large amount of patches :)

I understand your goal.
But as far I can say you don't need to rely on my patch series.

> >>>>> Also here is the question, why do you need to have that field in th=
e
> >>>>> regmap config structure and can't simply use the parent's fwnode?
> >>>>> Also I'm puzzled why it's not working w/o this patch: GPIO library
> >>>>> effectively assigns parent's fwnode (okay, of_node right now).
> >>>>
> >>>> Because gpio regmap a child node of the pin controller, which is the=
 one probed (gpio regmap is probed from the pin controller).
> >>>> Therefore the parent=E2=80=99s fwnode is useless, since the correct =
gpio_chip node is the child's one (we have pin-ranges declared in the child=
 node, referencing the parent pinctrl node).
> >>>
> >>> I see. Can you point me out to the code where we get the node and
> >>> where it's being retrieved / filled?
> >>
> >> Sure, this is where the child node is searched: https://github.com/Nol=
tari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb48c04/drivers/pinctrl/bc=
m/pinctrl-bcm63xx.c#L100-L109
> >> Then the gpio child node is probed and assigned here: https://github.c=
om/Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb48c04/drivers/pinc=
trl/bcm/pinctrl-bcm63xx.c#L51
> >
> > So, this is not (*yet) in upstream, correct?
>
> No it=E2=80=99s not, but I've already changed the approach several times =
and I=E2=80=99m starting to get tired about it...

I feel your pain, although I think that the best way is avoid
spreading OF-specifics over generic code.
Using fwnode API is pretty much straightforward. It has been designed
in a way to make it less invasive for existing code to be converted.
There are plenty of changes in the upstream that show how it looks
like.

You may check drivers under drivers/leds/ which have been switched to
fwnode (and AFAIK new code is usually not OF specific).

> > So, why not to switch to fwnode API in that driver as well?
> >
> > When you do that and supply fwnode thru the regmap configuration, in
> > the gpio-regmap we may assign it to of_node (via to_of_node() API).
> >
> >> Basically, I based that part of the code on the ingenic pin controller=
: https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba3=
70f797/drivers/pinctrl/pinctrl-ingenic.c#L2485-L2491
> >> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36d=
ba370f797/Documentation/devicetree/bindings/pinctrl/ingenic%2Cpinctrl.yaml#=
L155-L176
> >
> > This doesn't use remgap GPIO.
>
> Yes, I know, but there aren=E2=80=99t any pinctrl drivers using regmap GP=
IO right now, so I couldn=E2=80=99t base my code on anything else :)

Be a pioneer!

--=20
With Best Regards,
Andy Shevchenko
