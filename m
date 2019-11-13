Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454FDFBCA9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 00:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfKMXko (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 18:40:44 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40313 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKMXko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 18:40:44 -0500
Received: by mail-lf1-f66.google.com with SMTP id j26so3411356lfh.7
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 15:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KywlcZjhtRu9xyJPnCSxtXBYCQox6BpnxAExaMeZSY0=;
        b=zSy8jAI73/MrRV3crQLmVxdOrtAkuOT5xCr9dZgj9iuv4614K2BQBTy4dFIB1pvqY+
         yD+TP2kWvRARh6xzufTSEV+uAjMAxBEhpA50jm0szk7eO9fcnjIo4rVJSsSMIs5GUFH2
         /lhQvfGnvgFJYl093QqR6j00NKnTGE+8WSR/mNuFCVcHJKCFgmdSmSv8I6HVRUyGt+mf
         QEdHhF5kDAKtkkAXOlZSG/UEODQ5CQgqDVCNh3wp5apyJP0nRMSvPh6HZAxOmnYpve50
         +qG9fBXbUC5DeB/nm4fws4FEensLc7dHXVI7TbE4zm1RLWJTlcd0mM30KLTXdV8YC7Re
         rzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KywlcZjhtRu9xyJPnCSxtXBYCQox6BpnxAExaMeZSY0=;
        b=LrkSc5AF3PLxITwPl+7OxbDEId1YcA1wyK+W50/QtbAh3BBYNPC282E+IrN+llcmM5
         ayInUsyykvWMz/MQse366jPfaGvFNHCH81bhAKdpKVJ/wU1GFrZDqPMiA/RxKZs8dWsy
         Q6YOXeOXnHTDAYSvz+6AQ38HyhaUEEYeRvpzVhw13kAtC6iP/OKyOoDwMPHEWU9PKYWz
         twh3+FibXdHe2aOl5lUMBZD1AjkA4G9f3QHhuouPLoviAblXk/p3NNzt9kd2x8KnzBxO
         5O3JT+vGDaZypsKktuBB6VMqyriddW/OcUyrmqMsBDTUMNr/YJrtY8S3eYWVnarTOJ1A
         c5Aw==
X-Gm-Message-State: APjAAAWlie3orOkYuRWG/c2jqg8yR3Tazf4nqkibTrJpuoPlpZLJh6l0
        EK0vUq8g7Rmun3urOsum5lUWhFCCEkXABBrfGASebg==
X-Google-Smtp-Source: APXvYqzkxJk7zS+PqE55v/RB2uP+et6pSHchdENsELNpwLbj2M68u0EpE5nTbRPuGeX7tEmW+dXSonyzMPlu3a1B098=
X-Received: by 2002:a19:651b:: with SMTP id z27mr4338330lfb.117.1573688442559;
 Wed, 13 Nov 2019 15:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
 <CACRpkdaz23Eug+e+ghKQWWaDHegfdngPQ_UQkaP6zAbnic-7_w@mail.gmail.com> <20191113205425.Horde.MPwTgNxw4tJljEU5DoeUTIr@www.vdorst.com>
In-Reply-To: <20191113205425.Horde.MPwTgNxw4tJljEU5DoeUTIr@www.vdorst.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Nov 2019 00:40:30 +0100
Message-ID: <CACRpkdasYwYszTZwZyhvqjoUg2ku7Z7W4gxnD+qEjZzA=1bahQ@mail.gmail.com>
Subject: Re: mt7621: gpio-hog not working properly
To:     =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 9:54 PM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:

> mt7621 used bgpio_set_with_clear() because we have `set` and `clear`
> registers.
(...)
> It seems that writing to the 'clear' register doesn't do anything.
> I noticed that register address is 0x1e000000 in the DTS but in the
> code it is 0xbe000000.

Do you mean physical memory 0x1e000000 gets remapped
at virtual memory 0xbe000000?

> [    3.158002] bgpio_write32: 0xbe000600 <=3D 0x80
> [    3.165258] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high
> [    3.177532] gpiochip_add_data_with_key: gpiochip0 gpio7: 0x843
>
> When using program 'io' writing to the `clear` register 0x1e000640
> does have effect.
>
> root@OpenWrt:/# io -4 0x1e000620
> 1e000620:  0b75f7de
> root@OpenWrt:/# io -4 -w 0x1e000640 0x80
> root@OpenWrt:/# io -4 0x1e000620
> 1e000620:  0b75f74e
(...)
> If I change the bgpio_init() values so that we don't have the `set`
> and `clear` registers.
> With the patch below I do get right results.

That's weird!

> Any idea what this can be?

Try to pass the flag BGPIOF_UNREADABLE_REG_SET,
it seems the code is using the set register to read back the
value. In this case it is actually working you just don't see
it in debugfs.

Cc:ed Sergio maybe he has some ideas.

It seems to be hardware related then, hm.

Yours,
Linus Walleij
