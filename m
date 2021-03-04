Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2669332CE74
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhCDI2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbhCDI2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:28:37 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E28C061574;
        Thu,  4 Mar 2021 00:27:57 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d15so11396819wrv.5;
        Thu, 04 Mar 2021 00:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=eVwM5aRxs8pXI0Df4OGGCUZXISsKAq1m0sLGP/92WnI=;
        b=FMXKEnrlbxgBgUgF0opmoYINUoxhX144sTfuVl/8kfJFXvrmlRaW58/TPkHlOzT5zu
         B6AbGKEAZ5g0YDtgPmViEnEOfKEwDpbDGGzFIdmUz81R4F9ERymb7mLw9Q+2Rabh/IMQ
         GXyYizeemR0N3qndjI1N2YhZ+96HYIJoVEnGPII/zoRrJ/F5VKVLz2kJA5wx6oKLEGbo
         nsu/9g06Pioh+pkcsaS7Sjc4+YgZVCoSB5P0v+HYqFWKrag5vBuoPeb/mncC+yDrYLoP
         HNiRKr7Ms4fViB5QAQOqbTpiYbLLAtB+8i4iGyy9DHDiYcyFHbgalvDK1wFO1/2kRFQ7
         cn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=eVwM5aRxs8pXI0Df4OGGCUZXISsKAq1m0sLGP/92WnI=;
        b=j0KUDNRYsTsp26G4bPOURO6TWobgZuhUyhmrwwyFMnCMqTCp0rwDLkbSNUXTmuyBSF
         7spaQjYMIEa/OhDSgiOWpIRuFDdvVPUr8R+KWNT7mlvFo5aN3V7uWS6OSulREk2xQeHU
         IQrQHQJ8207GgBj+pgyTWQjeZzRwAeQoArw/73C+KN5GG7dEr0M3vDluv9avRIbDTPBW
         Sr/bto09yATy5sVGxKFQ7jSld3IQCtNjVp+CBxA7L7qOrjSReAyBxuXM0yYpIspp6U8w
         LTI+A/y4Pf1bOgbCbhyuxLF5dtlHQVaBpxaPOmuEsSmdjR4EF4SEeg2cjgbrzWWEhlZS
         cZ1w==
X-Gm-Message-State: AOAM531vrYqfYG+42J8NI3l5+86rkvP8PS0U7IafXDloQcmLVGnQ4vgS
        TB4XJkInJD7E0HuivoJgl7I=
X-Google-Smtp-Source: ABdhPJwj2WtrD0P9XOm5K9QM7F1BLKzx3mqlZ1ZeRydBUIpFsYqMWc5VqaNFCOAHMxaX5asJMw3GMQ==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr2714858wrv.186.1614846475806;
        Thu, 04 Mar 2021 00:27:55 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id c26sm36518129wrb.87.2021.03.04.00.27.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 00:27:55 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CACRpkdaJ3kGj6wi7L8_0WXq_dj4tt2LEbhPUy20R-Z-Mam_pdQ@mail.gmail.com>
Date:   Thu, 4 Mar 2021 09:27:55 +0100
Cc:     Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <005D6320-E34A-4078-8A4B-C1452B982722@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
 <20210303142310.6371-2-noltari@gmail.com>
 <40403445ae34e822474e5f39be75fd0b@walle.cc>
 <E341768B-BF42-4749-8D43-8C5CB24D64C3@gmail.com>
 <CACRpkdaJ3kGj6wi7L8_0WXq_dj4tt2LEbhPUy20R-Z-Mam_pdQ@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> El 4 mar 2021, a las 9:13, Linus Walleij <linus.walleij@linaro.org> =
escribi=C3=B3:
>=20
> On Wed, Mar 3, 2021 at 5:12 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>=20
>> Do you want me to send v4 with these changes?
>> Or maybe just this single patch?
>=20
> It's usually better to resend the series because then the b4 tool
> will pick it all up properly.

Ok, I didn=E2=80=99t know that :$.
Sorry for sending it as a separate patch.

>=20
> Yours,
> Linus Walleij

Best regards,
=C3=81lvaro.=
