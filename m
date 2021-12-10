Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B93346F89E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhLJBpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhLJBpc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 20:45:32 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AD8C0617A1
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 17:41:58 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id r26so11305694oiw.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 17:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CAEs6TA9o6xsdCdp2MRvi3WB7zMwWYnia8jBx/umBqs=;
        b=dy3rIqlj8uvzBxhcQD03MQEGT9iCSV29dHj5Ey3cpl0BkhBgxHQFcrOPBPvwRGWJEG
         QuDzh4CPlUK4jhFiKS9pADBoO8aOQSbsfXVlQrwqntPpixr7cwuKCaFtcuO1H+991Hid
         8hLR5aHaCEKX/BmOB9p6/8vIgQBjssvCGSYahyUURzmIDe4aqboHjLcYBITJWLZdYxRi
         FRRXvgj5fW8qZCPiyLjsApkXnfGNxKit0nMVPW82luqBaO9Lpq0BYqWYw9xKiIHBLKF7
         5bNF94kSietC/r1t8Ktl4XUouYu6Wokjei8QFCHTQbDMYg/zl6kwJaFEihy2Y9HIUx2d
         kZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CAEs6TA9o6xsdCdp2MRvi3WB7zMwWYnia8jBx/umBqs=;
        b=dAXE6Bj8BdPICpZbONCu+cRg7TOa9CKbdWkOB2EU42gppynQDXOTNp6kpU+mU1H3MM
         gPMCkf4mW7DCTvwP5b8quObnTqSaLbAU26YojaXTTEO0bVfBIand+ytGx4JZn+Gs2aMN
         AC3DDio9nur3BQUv/xEPhrU/+Iddy0yxFvVCNTa25+NvZbTd/6mtDC6IrKJJWW0X4o7M
         ICCIGl8yEu8Ghfwmu/rV2wDIV6put4hpzSKasayR+uc2pY1AVRxrik4BnrV6IbRIyiHD
         eMJEz1lIcVXsPBPT5+JC5DbFjS9OIUI8aTyw+0NvfnhKwh5oDxavHCXOI+Yyat5lIbG8
         iQyg==
X-Gm-Message-State: AOAM533mlTc86OZumCQ+bndSakYSejp+SiuiktqESZXRK/e57M52hm/P
        3LOIXhG74YySYzgXymesgrqhQQGkPegWZ5yczn5Uwedox5I=
X-Google-Smtp-Source: ABdhPJwBcRbgcZxhHro1YSDmrt7rzHSafyA3nD3aKcE4a+q4d22XA0r2ItBipMJp1FnUniZp6IqKB/rEgM/fmK1Ki1k=
X-Received: by 2002:aca:120f:: with SMTP id 15mr9624499ois.132.1639100517622;
 Thu, 09 Dec 2021 17:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net> <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
 <YbC6Bv2teZ5CFhFQ@latitude> <20211209082623.GF25091@packtop>
In-Reply-To: <20211209082623.GF25091@packtop>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:41:45 +0100
Message-ID: <CACRpkdb_zGz4+8R0=ORCbbbVeJVkLqBG2CDXAzi2VAA7-PPZ6A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
To:     zweiss@equinix.com
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 9, 2021 at 9:26 AM Zev Weiss <zweiss@equinix.com> wrote:
> On Wed, Dec 08, 2021 at 05:58:30AM PST, Jonathan Neusch=C3=A4fer wrote:

> >> BIT()
> >
> >I'll use it, but in this case, I think it doesn't simplify much the
> >whole expression all that much. Is there perhaps a macro that
> >constructs a continuous bitmask of N bits, perhaps additionally
> >left-shifted by M bits?
> >
> >Maybe somewhere in the bitmap_* API...
> >
>
> There's GENMASK(), though it takes a high bit and low bit rather than a
> bit position and count, so it'd require a small bit of arithmetic, e.g.
>
>   lastbit =3D gpio->first_irq_bit + gpio->num_irqs - 1;
>   ours =3D GENMASK(lastbit, gpio->first_irq_bit);
>
> or a manual shift:
>
>   ours =3D GENMASK(gpio->num_irqs - 1, 0) << gpio->first_irq_bit;

I think this can be handled with FIELD_PREP() from
<linux/bitfield.h>? Some examples at the top of the
header.

Yours,
Linus Walleij
