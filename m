Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6A632D2D4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbhCDMZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240530AbhCDMZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 07:25:44 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D95CC061574;
        Thu,  4 Mar 2021 04:25:03 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id n22so7869617wmc.2;
        Thu, 04 Mar 2021 04:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PgBypGec0QPYi6JphgaCfdVk4wLn5d7wrsbThrQwuv8=;
        b=srSwV4slc9dWu5YeW5DVJ0DJ5In2J3h6cT/4etg1vJDs+PZWGKHuRCc1KhzlFZ4nsQ
         DjLegxhubrRpKiuit0K8aDB/o+rokh+h/4BF96x5BDg6J5T12Secpe0osN6xSfJRTLRU
         R9ENJMqV4JPmDUveBv0Rx3oa7ZhOhrpA/PaP/pTUJ1laTeHbX0tRq4pSArff3zuWQ2LI
         WxjM9EyMfgSdXEcy2w4O9dP1iEaipquQ0501tQRd3aeuib4K7hmkb2lInp2L0lEKsF0f
         p2HZv573YVhpeELCTAeVd7snoUuHdblczgLcxhx/rjemP+brzNZQW2bz4edL20bfEv++
         g6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PgBypGec0QPYi6JphgaCfdVk4wLn5d7wrsbThrQwuv8=;
        b=bZJ+4PSRr9Q10DkbH9hdEVKx3GbVP7dQxtUNhoKznR9I7uw0rpqmtLeCwlTLDTU9fM
         t6KBHtvjXJqNzPM90Q/yMzc/7VKlFIKK4RoIHcwzVs/cSPaZjrRyz4DMnKu1YmCreWwv
         i5x2VuwggIKS3EBOWrSHuRXeATMP0UUyLo14iI+aBNAIWb/blLPVe2tdbfiqzeEWh28A
         bS/t4d2C0zLlLHAdpigvMLmbfEpA7zfakQJ6hC1O2wiRQZou7QxmT5ZAJ9hBA9HLmUzs
         JFHDIhXcITZgRSiU0yr1lOFNATthrA7B2y3Sad9Ok/O/eaWIeSFzvgJYfY7oTpL6t4Af
         WOMQ==
X-Gm-Message-State: AOAM532/pSZ+scHlvknjARwhWQFE+S5PI7j61ePf2Bud+E5yms5BehIe
        CCNVawTZr/6/+OnTRzeNln4=
X-Google-Smtp-Source: ABdhPJz3Jxgw46uHiQu5Klzcm7rfhheXgWF09mEaTSA7cfCNZ/Ec7TYywioD66IW8Ddh47j4mkPebQ==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr3686192wmi.112.1614860702342;
        Thu, 04 Mar 2021 04:25:02 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id i26sm2321015wmb.18.2021.03.04.04.25.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 04:25:01 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
Date:   Thu, 4 Mar 2021 13:25:01 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <CAE32628-DC0D-479F-BB17-2CFA475D5128@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
 <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com>
 <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> El 4 mar 2021, a las 13:12, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 1:13 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 11:49, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>> <noltari@gmail.com> wrote:
>=20
> ...
>=20
>>>> +       static const unsigned int bcm6328_mux[] =3D {
>>>> +               BCM6328_MUX_LO_REG,
>>>> +               BCM6328_MUX_HI_REG,
>>>=20
>>>> +               BCM6328_MUX_OTHER_REG
>>>=20
>>> When it's not terminator add a comma, otherwise remove a comma.
>=20
>> =E2=80=A6 so you want me to add a comma or not?
>=20
> Hmm... you tell me! If this is a list which covers all possible cases
> _and_ the last one is the kinda maximum value (aka terminator), then
> comma is not needed, otherwise add it (to me feels like the latter
> should be done here).

Well=E2=80=A6 Then it shouldn=E2=80=99t be needed, since this is a list =
which covers all possible cases and the last one is a terminator.

>=20
>>> Also, why is it inside a function? It's anyway global and constant.
>>=20
>> Because this is only used by this function and I=E2=80=99m used to =
doing this to comply with MISRA C 2004 at work :)
>=20
> It makes code a bit harder to read.

Ok, I will make it global in the next version.

>=20
>>>> +       };
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

