Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317D149FB75
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 15:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348964AbiA1OSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 09:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348069AbiA1OSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 09:18:03 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0F7C061714
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 06:18:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id l5so10116430edv.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cHDLaAUNnVCqUhL2/Oqcq9dnu+A9H1xdC6EsnkKXzws=;
        b=AITCaPbfa/Q5lpqKshlwhXstPf36jt253PCwADweM/C1sFlBSMocfMMRnpmKCQRUKK
         1QdB/LTs2p654X1JeeTBqpgQSq45vnzWnyvM0h8VUzkY5WCWodeK9bBic0y4I432tP/a
         XDX2s/qxHnDOa9hNPV+ORp/dPbjvwaXWHMEEQXpP3SZom+7C1eI68Aso3JF3EzaEv/k3
         Vgxkb3mmRczLP7CF5XKKMUeraIWG8kmqbJNpgzveV2naNbptIKKMTc9X3rQUhrzG+XY0
         lPfiLh5QtROgZHxH1vwZMETiuCzqJOPGRqllLAR0G3z5Oz/TSZbtYjAyt+E4+y7gRlDP
         VVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cHDLaAUNnVCqUhL2/Oqcq9dnu+A9H1xdC6EsnkKXzws=;
        b=BCa423dvWCY97vwAmt048SDTHbz3lZLnGzMKjDGXxKuukh0vF0FlyItf2kRH4tma3x
         HGYnXdC7Xk58vJjLBTWmVWPn0NcBbHvBeKLnMOrs9FD2jV+RGphd4FVUWF+yGvg6TPGL
         aGiYbTPT1lJohsv3k1EbPOt1sD6iMTB/urqwrMe4vwXmMpClQIy0HWzLpEjfLRohM0NP
         mdaaNRpcn699CKeOFsDNy87B4mB2Xkc/pFf/Qy+9SyB2Z2dwA9jmI0Q7qMQuFymbLCHY
         7BXRTBLzDxksDxt21bf+Zm/8U5ngRGZw8xPE5YElpQPEV+3C4YFIMNbttEgQHhT2TBO1
         Y4Bg==
X-Gm-Message-State: AOAM533tRrQBtM0qWWJ3ywczMMbY7Yi8LZ6GnOc8Duxzs6Dp+WI2PD4g
        zlNH+rglGXQtVhJmAWSx5Gw43Tmu0zCwTK8fVZQORj/Bh9NhDg==
X-Google-Smtp-Source: ABdhPJzC8OM1tvOUimH8TLkPubZQuYOTt0n1IF2cErxn7q+lgcd4kjNtx/onzJVxPb42puiqVshF/BDSFHAj9SNPHG8=
X-Received: by 2002:aa7:d1d4:: with SMTP id g20mr8471011edp.296.1643379481346;
 Fri, 28 Jan 2022 06:18:01 -0800 (PST)
MIME-Version: 1.0
References: <AM9PR03MB76077A7FB926CAE37E1D8565AA209@AM9PR03MB7607.eurprd03.prod.outlook.com>
In-Reply-To: <AM9PR03MB76077A7FB926CAE37E1D8565AA209@AM9PR03MB7607.eurprd03.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Jan 2022 16:16:23 +0200
Message-ID: <CAHp75VdOY8a85us-DEAbySRAMNz9F50JHjov0nJRsQva0huzOQ@mail.gmail.com>
Subject: Re: gpio: aggregator: Using chips with can_sleep
To:     =?UTF-8?Q?Mikko_Salom=C3=A4ki?= <ms@datarespons.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: author, maintainers

On Wed, Jan 26, 2022 at 10:38 PM Mikko Salom=C3=A4ki <ms@datarespons.se> wr=
ote:

> Trying to map gpio from i2c connected chips triggered kernel warnings fro=
m libgpiod when setting or getting values. By my understanding the get and =
set calls need to change to their _cansleep counterparts for chips with chi=
p->can_sleep.
>
> For example:
> gpiod_get_value() -> gpiod_get_value_cansleep()
>
> Is this an actual bug or my misunderstanding?

--=20
With Best Regards,
Andy Shevchenko
