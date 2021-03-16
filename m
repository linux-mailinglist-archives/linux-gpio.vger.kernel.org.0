Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA5033D4A8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 14:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCPNPN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 09:15:13 -0400
Received: from mail.thorsis.com ([92.198.35.195]:35214 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230112AbhCPNO4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 09:14:56 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 09:14:56 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 237E3CFA
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 14:08:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Hirh5aakN55u for <linux-gpio@vger.kernel.org>;
        Tue, 16 Mar 2021 14:08:02 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id AC3561C8A; Tue, 16 Mar 2021 14:08:02 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham autolearn_force=no version=3.4.2
Date:   Tue, 16 Mar 2021 14:07:59 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Message-ID: <946021874.11132.1615900079722@seven.thorsis.com>
Subject: setting gpio-line-names in dts for sama5d2 SoC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hei hei,

for a Microchip SAMA5D2 SoC based device I try to set gpio-line-names in .d=
ts file like this:

257 &pioA {                                                                =
=20
258         gpio-line-names =3D "",                   /* PA0  */           =
  =20
259                           "",                   /* PA1  */             =
=20
260                           "",                   /* PA2  */             =
=20
261                           "FOO",                /* PA3  */             =
=20
262                           "BAR",                /* PA4  */             =
=20
263                           "",                   /* PA5  */             =
=20

=E2=80=A6 and so on for all 4 * 32 GPIO Pins. However when calling `gpioinf=
o` in userspace, I always get this:

$ gpioinfo=20
gpiochip0 - 128 lines:
        line   0:        "PA0"       unused   input  active-high=20
        line   1:        "PA1"       unused   input  active-high=20
        line   2:        "PA2"       unused   input  active-high=20
        line   3:        "PA3"       unused   input  active-high=20
        line   4:        "PA4"       unused   input  active-high=20
        line   5:        "PA5"       unused   input  active-high=20

=E2=80=A6 and so on. Those "PA0" line names are set by the pinctrl driver i=
n drivers/pinctrl/pinctrl-at91-pio4.c before calling gpiochip_add_data() an=
d from reading the code in drivers/gpio/gpiolib.c I suspect devprop_gpiochi=
p_set_names() is never called then, so those names in .dts are simply ignor=
ed.

Those default names from the at91 pio4 pinctrl driver are certainly correct=
 speaking of pin names, but from a userspace point of view it would be bett=
er if I could override those from dts, so an application using libgpiod cou=
ld look for a name like e.g. "VALVE7_EN" without caring to which pin that's=
 actually connected. Can I override those with a currently present kernel? =
Or is it a problem in either the at91 pio4 driver or the gpiolib core? Or i=
s that no real usecase and should I do it differently?

Greets
Alex
