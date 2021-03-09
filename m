Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F8233290F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 15:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCIOty (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 09:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbhCIOtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 09:49:31 -0500
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D38C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 06:49:31 -0800 (PST)
Received: from localhost (ip-94-112-197-160.net.upcbroadband.cz [94.112.197.160])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 49F2A400052;
        Tue,  9 Mar 2021 15:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1615301367;
        bh=7UI2m7sCaSTqhFM2y//7aLBNPNNPug0H6pqZ84Q63MI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lSxJTFOlasSg/GNH3QaKHjgApArSlcLTAnMSWJoea3iqY2O7D/i1LmdptwDefDZ7H
         ngFMNlNOaIq37Cc+zwcdcgqdpduKAkh/ryI+iUQRjLIigKcs6W+z7ctBnQtTNoVh9k
         m4+TZ17Z5/mOosOngXEpEjxuBpEWTYEA+bokGz+9pjb/5OBjNf/BI1b/AchZWg17/b
         h02MVJeOX0dzL0Ihy9aI5wYa0jAC+k52TJMIPC1bd10bwRo9+jcbznzTPrIPGacp2k
         6ZZhCs2ICGw2d/LA+gfSmsubruTZ3UrUVbY+l1QPQQ8mMLdr7JlfVHE75EhNKO+3Tk
         4fjPsHqlVE8iQ==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Date:   Tue, 09 Mar 2021 15:49:26 +0100
MIME-Version: 1.0
Message-ID: <e140a9d4-d50a-42d8-a946-7b94183ebf83@cesnet.cz>
In-Reply-To: <CACRpkdZope0J3QVWAdgy6oRRBehZSLFcTcynjJSi5kHiiMYOww@mail.gmail.com>
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
 <20200610080327.GA1805015@ulmo>
 <7e4a427c-a6bb-4036-ba8d-0f290a17852c@cesnet.cz>
 <30fdc2f7-47f9-486d-8987-3c3d8b157fe6@cesnet.cz>
 <CACRpkdZope0J3QVWAdgy6oRRBehZSLFcTcynjJSi5kHiiMYOww@mail.gmail.com>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Can you just send a patch to the Armada DTS file adding these ranges?

I looked at some other November/December-ish commits into the DT, and in=20
the end, this is the patch that I needed to add to my board-specific DTS:

 / {
        gpio_i2c {
                compatible =3D "i2c-gpio";
                sda-gpios =3D <&gpio0 25 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                scl-gpios =3D <&gpio0 24 (GPIO_ACTIVE_HIGH |=20
GPIO_OPEN_DRAIN)>;
                i2c-gpio.delay-us =3D <1>;
                #address-cells =3D <1>;
                #size-cells =3D <0>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&uart1_pins_i2c_bb>;
        };
 };
=20
-&uart1_pins {
+&pinctrl {
+       uart1_pins_i2c_bb: uart1-pins-i2c-bb {
+               marvell,pins =3D "mpp24", "mpp25";
+               marvell,function =3D "gpio";
+       };
+};
+
+&mikro_uart_pins {
        status =3D "disabled";
 };

The missing bit was making sure that the "i2c-gpio" instantiation sees a=20
correct pinctrl-names and pinctrl-0 properties.

I think there's probably nothing to fix upstream here; I think it could be=20=

considered common knowledge than one has to patch the pinctrl block in DT=20
in order to re-purpose a set of pins from, say, UART to GPIO. What confused=20=

me is that pre-5.7, this used to work without setting the pinctrl to "gpio"=20=

explicitly.

With kind regards,
Jan
