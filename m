Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DED32AD01
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448191AbhCBVS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578846AbhCBP12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:27:28 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75718C061A28
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:23:49 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id u4so31891268lfs.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=phGkBVfIBc9N8/MYw3IsLowc0jNOtyQmeOezRPC5r6A=;
        b=IxEHOA/EeqJE9XesCg+nCfa3QJs4ZoTXMJRRwtoaO1dsS8/djz+UWJbAs59nUIy3FV
         K2RJk37iYNtFVVMwae8n2KqT6KXLsaMz+DupUwBbV3X/QoDQ3QmSZlw3bqnfXr7x0M9+
         6Bh00Lr5x3pTcsF0kX9ES2A3AGs/6hVNMJgkt9DHcPtr2p6TBqiDz3+Q14EH3dVEQv15
         PrI8M8O/MX6KRxLXecPHArez80P4gQQyHbwfXn1ItS3rQb840an7hPuiGWs44bUMI0qx
         1KWBY+Jpl9RKhWAFucv/VKzCkBEdA3ykrcitpsdOQaBpyVqG7G7SMRpyjKYYMgDZ0Xxw
         eXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=phGkBVfIBc9N8/MYw3IsLowc0jNOtyQmeOezRPC5r6A=;
        b=lC57ZE4Xwq2sYM8hgtWVsR4CDzwZ0Fi/Q+eLjCZuNlzb+0GQhsKlO+Xom1j+STlGQZ
         /HHDjwSlm2IlN3FKlqv+sRmse5Nk6yoIQkKTjOHDqGXzN/iTvF+cvFDOFSnXpAYCmAau
         ZqD46IyqTf/Tx2F2YX20byXh2FwZoX4te8r1nVJTdXx/lJBmE8tZtnoH7/Logk0RZf2m
         o2NDGZAqaQ00WmsaNE2Zp/GwsQe6OfVIDGOXC4bVx0n/g3Uj9VL73eZnr8Od6Corzr/Y
         k00i0nJAGAcbneOSp1UfuRG2yoIl9jdngc1dPMIBCoAQu8V9PBzQHKN7EJXPE4c012I2
         lx0A==
X-Gm-Message-State: AOAM532ro3Xtkmmj7xscNWQ/W8oy01UgFX35GhgFNKDVoV8PPBuyMu1b
        8iEdq4RkBT1UVWTJipCj4d+xudtZaZM8r9h3jFyC2g==
X-Google-Smtp-Source: ABdhPJyFEssv4TZ20RIixukIPx4G+ICtagjbJAX9g02ycgsPC8yvfaoZNRA54LDHGtijXLpyZkxVrklKXkjozmYype0=
X-Received: by 2002:a05:6512:547:: with SMTP id h7mr12960505lfl.529.1614698627904;
 Tue, 02 Mar 2021 07:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-2-noltari@gmail.com>
 <CACRpkdbjhTfQ4EcjndgE_Y7_uCT2ohadTjj-rrQAFNm+c0whRg@mail.gmail.com>
In-Reply-To: <CACRpkdbjhTfQ4EcjndgE_Y7_uCT2ohadTjj-rrQAFNm+c0whRg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:23:36 +0100
Message-ID: <CACRpkdaN3pYMDiPkk109SwOKF56Oxe14_bC5edftGGG0PL7VsA@mail.gmail.com>
Subject: Re: [PATCH 01/12] Documentation: add BCM6328 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 3:57 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
> On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>
> > Add binding documentation for the pincontrol core found in BCM6328 SoCs=
.
> >
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> (...)
> > +  interrupts-extended:
> > +    description:
> > +      One interrupt per each of the 4 GPIO ports supported by the cont=
roller,
> > +      sorted by port number ascending order.
> > +    minItems: 4
> > +    maxItems: 4
>
> I don't know if this is advisable, there are different ways
> of specifying interrupts so this may become ambiguous,
> I think Rob will know how/if to do this though.

After reading the code I conclude this gpiochip is hierarchical so this sho=
uld
just be dropped, and we only need interrupt-parent assigned. The
driver will know the hardware offsets between the interrupt parent
and the GPIO block, this is generally the case for
hierarchical interrupt controllers.

Yours,
Linus Walleij
