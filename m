Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDEF32D6A0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhCDP1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234815AbhCDP1D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:27:03 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7D3C061756;
        Thu,  4 Mar 2021 07:26:22 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d11so28086705wrj.7;
        Thu, 04 Mar 2021 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZHKklL7F+P7ZqR+p79sjN1b24ShCqovtpYMcp8vZvhw=;
        b=VBVb7fKQSb+7dVTHOdj/tfMnZY5OmSUD+alZ8ginNdjeHX2rJSECkpfTQxSOsUxF1q
         eE7l1AbbDbEoiR0jLuxkhjAhADZGWfM7bMBLqJSv6GOboUQ10xaJZIq7Bbgud9UCAsJM
         eW6DZCU00loPTtY8Xv/CTTHwbPtYAmSLcoVurxfAqCWva46lyJkmE/WDfSaE+D3vPfA9
         snI4hoA7DwobEZ9ElY3kWk9CwSM8Vqo1qbiFp4XyWQQ4+QdCEFDfJbnCGgJto2pcB/dd
         WKy5wgFT26yRWiLJSfXTiWJlRgDc/JfiYAzpJjBRmtutuN83WWrvWp4Ax2fOKfLAVltv
         fajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZHKklL7F+P7ZqR+p79sjN1b24ShCqovtpYMcp8vZvhw=;
        b=ipVCQtEewPHa7R+LGrIhSejKsgt8qhQsriedltdfpAtrmjrFjb+QlOybFGUVVKMcB1
         08K8c1b7w/6+e06uP6BzuaWkrNo19TnOwQKyLJIiF/B5ox9U2oHE+rnC9Ts4DCuorwTk
         jN7LBAJN10pjGw9WM/a7hOsuP521SiQ3xvAq0nrN/F8o7m0E5QSrPsSGZN8n74dMw/Dx
         LM8Ot/no0iLpW7r9aw053RHeM0SQSYo4wu5iM6E6/0D472085efmuyOVwRSq4h0PJjam
         cdJXxkjUTmCWK4Lzw3FBBGAVD7LpgH2DvEwtUqaEt0NrSqgeB2NCcKT8Uw6sMxdzWALl
         n+eg==
X-Gm-Message-State: AOAM5302Of1InvWiunt3blDMwwZj32Mwx++BSfAJOJerfItCsqTUY1j7
        E/nVMVuuNSWFwN+jko4r6NU=
X-Google-Smtp-Source: ABdhPJywp9PgaY4Pv37FT4Yo/5jvjFSHh3DXxLI5gIQwiyVYQXKZd3d3YnjdX80NmcvVJhpafHvLcg==
X-Received: by 2002:a05:6000:1788:: with SMTP id e8mr4623441wrg.171.1614871581682;
        Thu, 04 Mar 2021 07:26:21 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l2sm38059495wrv.50.2021.03.04.07.26.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:26:21 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75Vc6azROSAc=ZUjY+VhAjZDMsukr2ZY1fQHMFwncL7_AbQ@mail.gmail.com>
Date:   Thu, 4 Mar 2021 16:26:22 +0100
Cc:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E174F742-BBBC-4B86-831F-96C520931A69@gmail.com>
References: <20210304071506.18434-1-noltari@gmail.com>
 <CAHp75Vc6azROSAc=ZUjY+VhAjZDMsukr2ZY1fQHMFwncL7_AbQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 16:22, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 5:18 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>=20
>> This is needed for properly registering gpio regmap as a child of a =
regmap
>> pin controller.
>=20
>> +       chip->of_node =3D config->of_node ?: =
dev_of_node(config->parent);
>=20
> After a closer look I have no clue why you need this patch at all.
> The second part, i.e. assigning parent's fwnode, is done already in
> the GPIO library core.
> The first part, keeping fwnode in the regmap configuration puzzles me. =
Why?

I=E2=80=99ve flagged this as superseded since Linus asked me to send it =
with bcm63xx patches and I=E2=80=99ve already answered this same =
question there.

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
