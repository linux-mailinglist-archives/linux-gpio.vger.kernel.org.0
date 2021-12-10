Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731CC470ED0
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Dec 2021 00:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345112AbhLJXkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 18:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345102AbhLJXkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 18:40:22 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5376EC0617A2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 15:36:47 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso11233297otr.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 15:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=htRXRjAd14aBnmI5sHA+uW73SpEYDOuXOl6hRR8Lyyg=;
        b=mSAR1jJ2dObQ4J1b6AF0MAapjT6bt3VVKMyro+f8CKmhpvxm74qF7YF8G6M77I6YHC
         u1qSW4P+S0Y0n77Qqq+RV/KxF9PpThhNeMj5xHYt4tDgusjxzqZkKaA/MlMfRGURjW/Y
         3hAwYH0gJfv05uLr3+ViTEZVMOwAm6uqfXF/0J2AEg98kUVFQAQkuXtALDm6ZbDhC2hO
         YsOcJE3VCXBHV+3v/NZpZkGZ3ulOHi+dHDdkk07/N4SFarJDYWGWuOdkyXmkb9LbgzW3
         WJ6kYl7EVcT2E/6GLeSpxqlEuzzHaJcGOSmjly+GWfdfBNQzEqihnzqaByuFNo3fnr69
         93FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=htRXRjAd14aBnmI5sHA+uW73SpEYDOuXOl6hRR8Lyyg=;
        b=WWDYyuSyJGqxWgko+zcujez6MKv7DsaLSRPYrkeqI+lh7Vd+dzj0Y0fmrc3rmbFdfU
         nfhpl2PGBCD9oGMD1/ZN0PSARYh+CUwBIGGFXvsIfad6OsCu2bapUZ0KkmGz3L8wh3jF
         EwRf7E1G0yN/FTf+wQuNGeDhSsw895M1Zz2LHeoWoE7oN8mwdeY63csrJxf7mWM03rwj
         FMl62dx7cnnOE6Gd7k1VOcvhm+1ehceMcFVnF50dCL0/HavyWQsf7s4i7Krmb2c73+8y
         KKku+cL8DTLNPL1dForqKZzz0pC3T3FE0GDZ2V8X7vgEvRu7+A+eD1qWuhDwoih3DZbG
         PPGA==
X-Gm-Message-State: AOAM5302r40K8PNCwwmuvJCq5PATNnQsh50JFek2eJ1FRZEiOA64UiGd
        Ne6H55WuDvRIssmqJsaIkblvC01Nhij/Mh5iIl9t1w==
X-Google-Smtp-Source: ABdhPJyiKAAwo+YZGkewQKZ2wnhWRkpesqKw0z/QAVrCm/pRfL9jaDdOiWz1addeTYuTK5pLmzAZAmJHm9xsoW+VplE=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr13095360otl.237.1639179406575;
 Fri, 10 Dec 2021 15:36:46 -0800 (PST)
MIME-Version: 1.0
References: <1638850665-9474-1-git-send-email-wellslutw@gmail.com>
 <1638850665-9474-2-git-send-email-wellslutw@gmail.com> <CACRpkdaBV81OCwHuFCObwv_t55B9ANHaF5jEc=oorZdjpey0Ug@mail.gmail.com>
 <CAFnkrskBVLk0q77Xkk=E07gxmWSNfRtwznz9yv1fd07u0P2HgQ@mail.gmail.com>
In-Reply-To: <CAFnkrskBVLk0q77Xkk=E07gxmWSNfRtwznz9yv1fd07u0P2HgQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Dec 2021 00:36:35 +0100
Message-ID: <CACRpkdZfK7+WasEnCggxPVkpsYiDZ3HGNNSNXArFiAucvWVjRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add dt-bindings for Sunplus SP7021
To:     =?UTF-8?B?5ZGC6Iqz6aiw?= <wellslutw@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wells Lu <wells.lu@sunplus.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 1:41 PM =E5=91=82=E8=8A=B3=E9=A8=B0 <wellslutw@gmai=
l.com> wrote:

> SP7021 has 99 digital GPIO pins which are numbered from
> GPIO 0 to 98. All are multiplexed with some special function
> pins. There are 3 types special function pins:
>
> (1) function-pins:
>     For example, if control-field SPI_FLASH_SEL is set to 1,
>     GPIO 83, 84, 86 and 87 will be pins of SPI-NOR flash.
>     If it is set to 2, GPIO 76, 78, 79 and 81 will be pins of
>     SPI-NOR flash.
>
>     For example 2, if control-bit UA0_SEL is set to 1,
>     GPIO 88 and 89 will be TX and RX pins of UART_0
>     (UART channel 0).
>
>     For example 3, if control-bit EMMC_SEL is set to 1,
>     GPIO 72, 73, 74, 75, 76, 77, 78, 79, 80, 81 will be
>     pins of an eMMC device.
>
>     The driver defines properties "function" and "groups"
>     to select this kind of pins-function.
>
> (2) fully pin-mux pins:
>     GPIO 8 to 71 are 'fully pin-mux' pins.
>     Pins of peripherals of SP7021 (ex: UART_1, UART_2,
>     UART_3, UART_4, I2C_0, I2C_1, ..., SPI_0, SPI_1, ...
>     GPIO_INT0, GPIO_INT1, .., RMII_of_Ethernet, and etc.)
>     can be set to any pins of fully pin-mux pins.
>
>     EX1 (UART channel 1):
>     If control-field UA1_TX_SEL is set to 3, TX pin of
>     UART_1 will be routed to GPIO 10 (3 - 1 + 8 =3D 10)
>     If control-field UA1_RX_SEL is set to 4, RX pin of
>     UART_1 will be routed to GPIO 11 (4 - 1 + 8 =3D 11)
>     If control-field UA1_RTS_SEL is set to 5, RTS pin of
>     UART_1 will be routed to GPIO 12 (5 - 1 + 8 =3D 12)
>     If control-field UA1_CTS_SEL is set to 6, CTS pin of
>     UART_1 will be routed to GPIO 13 (6 - 1 + 8 =3D 13)
>
>     EX2 (I2C channel 0):
>     If control-field I2C0_CLK_SEL is set to 20, CLK pin
>     of I2C_0 will be routed to GPIO 27 (20 - 1 + 8 =3D 27)
>     If control-field I2C0_DATA_SEL is set to 21, DATA pin
>     of I2C_0 will be routed to GPIO 28 (21 - 1 + 9 =3D 28)
>
>     Totally, SP7021 has 120 peripheral pins. The
>     peripheral pins can be routed to any of 64  'fully
>      pin-mux' pins. So total combinations are:
>            120 x 64 =3D 7680
>      This is why we cannot enumerate all combinations.

Please copy some version of the above into the top level
description in the bindings. People writing DTS files need to
know what they are doing and why this looks so funny
and if the explanation is right there in the bindings document,
that is helpful.

This is pretty cool. It is what is called a "phone exchange mux",
(anyone can call any number) which is a type that the pin
control subsystem simply assumed did not exist because it
would take up a lot of silicon space. But here it is.

So:

>> > +      properties:
>> > +        pins:
>> > +          description: |
>> > +            Define pins which are used by pinctrl node's client devic=
e.
>> (...)
>> > +          $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> Why can this not $ref the standard binings in
>> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

If this does not conform with the standard definition of pins from
pinmux-node.yaml then you need to vendor prefix them, this will
then be something like sunplus,pins.

Yours,
Linus Walleij
