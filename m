Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6B32D683
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhCDPZk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbhCDPZh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:25:37 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E148C061574;
        Thu,  4 Mar 2021 07:24:57 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id u187so8403838wmg.4;
        Thu, 04 Mar 2021 07:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uBQZCQZDsL0gD5zlxULHLohvlBLpfne+0pPqWhHZD10=;
        b=lSLrx85E1+KwzESpfJy0Q1SADQDy92Onk4okcGhHqBeziZ9YOLo73cLrmDge5In3nG
         22QLoynVmnki8nwei5QIoiijJFMTSo60FSikjaRQ3U6oe6/Vq84BvX9mctHXPI4Gd2j0
         QoCYqm3OyjlwVPlk/WIyTjQA3D2hMiG0p/gf1qWHpBdaLzPilNRJAIBPw6sXQzNzvE+d
         RUiYDIIRCVMxMBLk4YZzCsVKbmWW7gateebeQRYLdI/MOn65Al3aGxYQ7ikgPuSPJ56W
         PLFHmfuEajk3whl4IesmjGNiypLbRtbGlrTaPbFLTHQ4QEjqgUDMyyXbfVfBTnY80qrW
         zJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uBQZCQZDsL0gD5zlxULHLohvlBLpfne+0pPqWhHZD10=;
        b=ihUv9HJdsov5tQzYT+vxC+L4Uo/IBSc9ndXCv5F+mAahVSx70VYrP62fUZ1NvsCDAx
         zH+C7heL71sTCuXCyctbJ90FtrsDCDXoidbL3rlsqfv1vN7HU9ag2ziDO3hZE4/Qs9AY
         cjGNNJDHH3IPufa0FMfBc8+Resoc0C+8jLyjNNoxTHFMe0GvfcIFWHnzemEVCwiqdEM+
         6ImgS9g53zJlvUFuH2CJrtg0hLyI/62wEaZklNq5QS62zyh35pwtdZiS7HBwsZXaCBGp
         CrD03HjfHXmpwAmFhSAeVCq5CWkC4gKmJElSo3u3sh3U41jSEPb3mGinq2ljfYwUBugE
         X9JQ==
X-Gm-Message-State: AOAM530uEHuDYa4aIuM17pUJOATV4ugJkqKskgQjX/iM6lTDZUenX7UK
        YFmBicO1wMbSZvGT0WuhNpk=
X-Google-Smtp-Source: ABdhPJx1pBjQ2htUT8NgQNYS2yzrylAJfFmY1KX3/9EpbPtNs8QL+8wE7ln9wgAmnvIZDcQdb/bs3w==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr4610263wmb.14.1614871495755;
        Thu, 04 Mar 2021 07:24:55 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id w25sm10007668wmc.42.2021.03.04.07.24.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:24:55 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
Date:   Thu, 4 Mar 2021 16:24:55 +0100
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
Message-Id: <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
 <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 16:17, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 11:35, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>> <noltari@gmail.com> wrote:
>=20
>>>> + * @of_node:           (Optional) The device node
>>>=20
>>>> +       struct device_node *of_node;
>>>=20
>>> Can we use fwnode from day 1, please?
>>=20
>> Could you explain this? I haven=E2=80=99t dealt with fwnode never :$
>> BTW, this is done to fix this check when parsing gpio ranges:
>> =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/gpio/gpiolib-of.c#L933-L934
>=20
> Use struct fwnode_handle pointer instead of OF-specific one.

But is that compatible with the current gpiolib-of code? :$

>=20
> Also here is the question, why do you need to have that field in the
> regmap config structure and can't simply use the parent's fwnode?
> Also I'm puzzled why it's not working w/o this patch: GPIO library
> effectively assigns parent's fwnode (okay, of_node right now).

Because gpio regmap a child node of the pin controller, which is the one =
probed (gpio regmap is probed from the pin controller).
Therefore the parent=E2=80=99s fwnode is useless, since the correct =
gpio_chip node is the child's one (we have pin-ranges declared in the =
child node, referencing the parent pinctrl node).

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
