Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B0C60F9C0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 15:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbiJ0Nyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 09:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbiJ0Nys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 09:54:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C3A1A82C
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 06:54:42 -0700 (PDT)
Received: from [IPv6:2a00:23c6:c311:3401:4071:1b84:4622:8adc] (unknown [IPv6:2a00:23c6:c311:3401:4071:1b84:4622:8adc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 93DA566028CF;
        Thu, 27 Oct 2022 14:54:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666878880;
        bh=Kij8LZvTOfH9e45+Sv+jNU6x+Kd8v80TTeEez14IgeA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=kuMWN+mabCHS2MMHGb0S915DaH3BTYsxADM0YInJX0J8ZkSetX2PK/yotFp0sMGFv
         EbqWalq1nnY5ZGyVRAA1kDJ/FlWU9Y+HCjEJeeDD2my6tyMEGPRPwOXC72lZMs5wSe
         9iEmskjCC35NnT63uwF6xKHfgNvV7Fx4ytJZJiYf0Jn9VpojLakSI6ayPzXYHCwI//
         kMA9fnPbKAPd2Bl87SaNXW/f2LFYGspMDn83TWKB/j8rpX0mHSCo7bp5XsJAPmtoRT
         1DziwtGH8Twmxx+1457qShpY6flxwFPQyaU01bGh24trndfwryleEVfqmFX1T9geap
         l1THQDn6iqo2g==
Message-ID: <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Levente =?ISO-8859-1?Q?R=E9v=E9sz?= <levente.revesz@eilabs.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Date:   Thu, 27 Oct 2022 14:54:38 +0100
In-Reply-To: <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
         <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
         <Y1luUgS25ddeSCT9@smile.fi.intel.com>
         <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2022-10-27 at 15:36 +0200, Levente R=C3=A9v=C3=A9sz wrote:
> Thank you for your guidance, it is much appreciated.
>=20
> On Wed, 26 Oct, 2022 at 17:29:17 +0000, Andy Shevchenko wrote:
> > Looking at this again, why not to make PCAL bit as a part of the
> > type,
> > so you will have the check below much easier, like masking for PCAL
> > bit
> > and that's it.
>=20
> On Wed, 26 Oct, 2022 at 17:32:03 +0000, Andy Shevchenko wrote:
> > Consider avoiding the change of the ID tables in almost every patch
> > you
> > have. This can be achiever by carefully allocating bits for types
> > and
> > define the actual HW via bit ORed masks.
>=20
> If I understand this correctly, this should be a sufficient solution:
>=20
> =C2=A0#define PCA_PCAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(9)
> =C2=A0#define PCA_TYPE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0GENMASK(15, 12)
> -#define PCA_CHIP_TYPE(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((x) &=
 PCA_TYPE_MASK)
> +#define PCA_CHIP_TYPE(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(((x) =
& PCA_TYPE_MASK) >> 11 | ((x) &
> PCA_PCAL) >> 9)
> +#define PCA_SET_TYPE(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(=
(x) << 11 & PCA_TYPE_MASK | (x) << 9
> & PCA_PCAL)
>=20
> Use 5 bits to encode chip type: bit 15..12 and bit 9.
>=20
> PCA_SET_TYPE() shifts bits of the TYPE to the correct positions in
> the id.
> PCA_CHIP_TYPE() gathers the bits from the ID to form a nice decimal
> number.
>=20
> -#define PCA953X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0BIT(12)
> -#define PCA957X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0BIT(13)
> -#define PCAL653X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0BIT(14)
> +#define PCA953X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A02
> +#define PCA953XM_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A06
> +#define PCAL953X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A03
> +#define PCAL653X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A09
> +#define PCA957X_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A04
>=20
> Types are decimal numbers. Values are carefully chosen to leave
> existing
> IDs unchanged.
>=20
> =C2=A0=C2=A0=C2=A0 * 2 instead of=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(12), ID mask remains
> 0b0001'0000'0000'0000
> =C2=A0=C2=A0=C2=A0 * 4 instead of=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(13), ID mask remains
> 0b0010'0000'0000'0000
> =C2=A0=C2=A0=C2=A0 * 9 instead of BIT(14) | PCA_PCAL, ID mask remains
> 0b0100'0010'0000'0000
> =C2=A0=C2=A0=C2=A0 * 3 instead of BIT(12) | PCA_PCAL, ID mask remains
> 0b0001'0010'0000'0000
>=20
> PCAL chips have odd IDs, which means the PCA_PCAL bit will be set.
>=20
> It seems more natural now to have a separate type, PCA953XM_TYPE for
> pca9505,
> pca9506 and pca9698 with the [M]ask register. Only PCA953X type chips
> can have
> this register anyway.
>=20
> What do you think?
>=20

I don't like the idea of encoding whether a device is PCA or PCAL into
the bit offsets. Primarily because it's massively opaque, making
successfully adding support for another device that much more prone to
issues, especially if that person isn't already intimately familiar
with the driver. I'd also like to point out that not all PCAL can be
handled the same. The register layout of the PCAL653X_TYPE needs to be
handled differently from the PCAL953X_TYPE.

Martyn

> ---
> Best Regards,
> Levente

