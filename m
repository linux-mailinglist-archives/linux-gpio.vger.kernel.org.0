Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491767B05DF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 15:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbjI0N5Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 09:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjI0N5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 09:57:16 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92D3FC
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 06:57:14 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7ab5150a7b5so7504170241.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695823034; x=1696427834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMwjIJJgcxE3VMRMd2drhHFu3fo06bNaaNt8CiSb3ZA=;
        b=HhCx5VzTeMGkByx7ABbpm2S4ya+LVnum3qQQVZWqrxFISEqZ3ogxlIB0Q8fRkrW0gx
         cRjpF5YPkvHfs9DMwzi5D69G0DPHHGesrlxOebNaNgmRZGJjnj7yHfgJ7mszXFZsubSv
         CFNUPZ6kUqd3m3laCquQeEFpn+D+KCqShb1cw4Q0h8KB6LnPeu1ocD6bJUOvCCzfOBwi
         GOMYOrgiG85PTnDsh5L3RjHngodrTGrEmcrjycme6yaQ7WtKFqJf6ybU62G3tt95NO49
         +c9VeywOqYvnrwaq2nbpoUdwNUnBYFdrvxs0alJg6DVdEoYJY7QJrFlmcvWJsD7bbH3J
         06Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823034; x=1696427834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMwjIJJgcxE3VMRMd2drhHFu3fo06bNaaNt8CiSb3ZA=;
        b=V0h7XXHHNM99/kgiAH/vkSlqBFlz+PS/PrrU4mG0YSOuBpF9vNyItn0FgdaWLfaXNE
         N5zgbtP8xiXZcKEUH+t61HdMdxx1KkBZdBtb7IZ29BirStrFI/hhqBd+FPF0V57cVb7S
         loHKb6h9SNFrdpk2zDFmqe1JxajL96Jc1iiTdsfVbPVe2lX1ChWQgw7uCeRBZdT+UINc
         ntcxCTbeZ28jeOmbxVXkj8zHJ1LUjGTtmlSM/ouTgBn8mUFtDLCrlzQOE2hUpd0Nd7jN
         7TIA5hokYp5zIvjrbE947AtO7Yv+S4gfklznxO3O8FE93Kor5r6rCErBQrHVCHey7TQF
         QUlA==
X-Gm-Message-State: AOJu0Yz7jx1KmLpiZuED7U83M1W+k3Ce71RNFOn/AdC67xvkH8je7rMS
        hP2c5e2Y/gUzjSnrZCSGTSG66O78Kbbp8AI2cAyMEC28QVLDhJgf
X-Google-Smtp-Source: AGHT+IG8QPYt411jspTENiqRTlTfOTKc9VSZKjqh+jvAqpG0NijIqMYqnlA3c9yQcTj7Ts59sBCk4MXGHxEhudvFi+Q=
X-Received: by 2002:a67:fa05:0:b0:452:6ecb:e90 with SMTP id
 i5-20020a67fa05000000b004526ecb0e90mr929334vsq.3.1695823034075; Wed, 27 Sep
 2023 06:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-5-brgl@bgdev.pl>
 <ZQf6E+itll3dmCnU@smile.fi.intel.com> <CAMRc=Mcq-0yWcYp6ksDF5RP-B+7b+r2KYh5onEMKx1tpS9O4hQ@mail.gmail.com>
 <ZRQhIqpb6Ho9ifgz@smile.fi.intel.com> <CAMRc=Mck9R8LB6_g9O54ZhRDewx99aOs9g-bExR3yC+GJ-8gYQ@mail.gmail.com>
 <ZRQyqw/YWbSeQcJc@smile.fi.intel.com>
In-Reply-To: <ZRQyqw/YWbSeQcJc@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 15:57:01 +0200
Message-ID: <CAMRc=McRD8JNMUkROBPFor7E2t-tw+2wGEge7L6vbtkcEmtnhA@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] gpiolib: provide gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
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

On Wed, Sep 27, 2023 at 3:48=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 27, 2023 at 02:42:28PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 27, 2023 at 2:33=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 27, 2023 at 01:22:36PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 18, 2023 at 9:19=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Sep 15, 2023 at 05:03:19PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > > > > > +static int gpio_chip_match_by_label(struct gpio_chip *gc, void=
 *label)
> > > > > > +{
> > > > > > +     return gc->label && !strcmp(gc->label, label);
> > > > > > +}
> > > > >
> > > > > I am still wondering if we can oblige providers to have label to =
be non-empty.
> > > >
> > > > Of course we can. Just bail out of gpiochip_add_data_with_key() if =
it
> > > > is. But that's material for a different patch.
> > >
> > > Yes, but my point here is that
> > > 1) the current users are already following this requirement;
> > > 2) the enforcement can be done explicitly somewhere (in the register =
function).
> > >
> > > Is the 1) incorrect assumption?
> >
> > I remember doing a quick glance over GPIO providers and it looks like
> > ALL of them set the label. But I may have missed something. I would
> > start with a warning.
>
> For now I would drop the NULL check. We will have a few weeks to see
> if somebody screams about. Meanwhile we can add the real error message
> patch if no-one complains.

No, I'm not going to potentially break stuff like that as a way to
detect bugs. That's not a hot path, we're not gaining much. Let's add
a warning first, wait for some time, make it an error and then remove
the check.

Bart
