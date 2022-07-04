Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF445565C99
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 19:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiGDRKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 13:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiGDRKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 13:10:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DE511A3A;
        Mon,  4 Jul 2022 10:10:13 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id d2so17790126ejy.1;
        Mon, 04 Jul 2022 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xA6mp2zr58Pi9rjKpCMXzs9aHWVQ74+CfkY4PkhIA4c=;
        b=SHw5y7/zBLcALCjVGyBv1Zfq9zjSm1hxROB2CIvLiHeWSqbGo37kV58nIwUXFv+OOT
         1voMwYe2tIogB5459PpfxPxGSkrg+bgzvg0NmFpULp9FguF+pGzlo6n4Q1oPsHGLIN/F
         59LzF90anYtp4j4r1YoDdFB6vbyzVILs/+yTFAaZezmzNTU3+9PUwpADZE/MB2ZtqhQ6
         0BAI1WakBEpDDGjz+eiJbeiUOzzY2wnETtJ6TKT0TEVb7fgHE6x26v4SI9yxHGLbKnVX
         fVWw1qTygpyWd+ceA5v19+2S66p3/a5+AHC1aKiBDrs6rtok/dk8/kSFBQjDb1WkB8vH
         GavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xA6mp2zr58Pi9rjKpCMXzs9aHWVQ74+CfkY4PkhIA4c=;
        b=etp1GU9mDJ6K1ZlOFcb0WIUT7pkwniHquPf+zPqC3+pfvnArQ3EC1BhT2407hXKtjI
         y8+Q2Bwrrt/7NuK4/bLQVuEV3Oz0P7K2FxvbXGkmEnlqsoKIq/S38Wp5yyyz+enf+rWg
         cLWiaClw74hHOUsN49IXxjCYd0fvDShzz8qgAelj6n7sOFs23lIPuu+uBbAVu3HNdhe+
         /QYsWt0vp4cd0BeLHcjzQ4pituMEtC0s6EbYEeEKc97BbrNa058moI4bhSkMV7HY5MSR
         InwpxyR+rqtrLl7dm2m+zUWp4+c9mV5Jxm4Dk/lqmT2HgJr7rrYJERUCSbNmJ/7Iioka
         ZbVg==
X-Gm-Message-State: AJIora9LWhtPtbh7CVFkLLVp9pkprmiJtIcIBJxp7DK5jVeyfhqJa2u4
        XZYhvm+wDgY7Hn9B85kjCUk=
X-Google-Smtp-Source: AGRyM1tKdKIEjYXSYV3p41eF/ho5jXl/0u0epNFdp0keQSsWs1OWwKGk8sRjNv/uRrnolsjE9ODNXQ==
X-Received: by 2002:a17:907:16aa:b0:726:9fe7:a989 with SMTP id hc42-20020a17090716aa00b007269fe7a989mr29817704ejc.760.1656954611843;
        Mon, 04 Jul 2022 10:10:11 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u12-20020a056402064c00b0043a4de1d421sm2686818edx.84.2022.07.04.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:10:10 -0700 (PDT)
Date:   Mon, 4 Jul 2022 19:10:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: tegra: Convert to json-schema
Message-ID: <YsMe8ZGuHv50Bumw@orome>
References: <20220701150501.443296-1-thierry.reding@gmail.com>
 <20220701150501.443296-2-thierry.reding@gmail.com>
 <20220701211708.GA1523809-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SY7W913tn/dH5AFM"
Content-Disposition: inline
In-Reply-To: <20220701211708.GA1523809-robh@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SY7W913tn/dH5AFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 03:17:08PM -0600, Rob Herring wrote:
> On Fri, Jul 01, 2022 at 05:04:58PM +0200, Thierry Reding wrote:
[...]
> > +additionalProperties:
> > +  description: |
> > +    Tegra's pin configuration nodes act as containers for an arbitrary=
 number of subnodes. Each of
> > +    these subnodes represents some desired configuration for a pin, a =
group, or a list of pins or
> > +    groups. This configuration can include the mux function to select =
on those pin(s)/group(s), and
> > +    various pin configuration parameters, such as pull-up, tristate, d=
rive strength, etc.
> > +
> > +    The name of each subnode is not important; all subnodes should be =
enumerated and processed
> > +    purely based on their content.
> > +
> > +    Each subnode only affects those parameters that are explicitly lis=
ted. In other words, a
> > +    subnode that lists a mux function but no pin configuration paramet=
ers implies no information
> > +    about any pin configuration parameters. Similarly, a pin subnode t=
hat describes a pullup
> > +    parameter implies no information about e.g. the mux function or tr=
istate parameter. For this
> > +    reason, even seemingly boolean values are actually tristates in th=
is binding: unspecified, off,
> > +    or on. Unspecified is represented as an absent property, and off/o=
n are represented as integer
> > +    values 0 and 1.
> > +
> > +    See the TRM to determine which properties and values apply to each=
 pin/group. Macro values for
> > +    property values are defined in include/dt-binding/pinctrl/pinctrl-=
tegra.h.
> > +  type: object
> > +  patternProperties:
> > +    "^pinmux(-[a-z0-9-_]+)?$":
>=20
>          type: object

Looks like this fell through the cracks. I've fixed in in v3 locally,
but I'll hold off on resending the whole series to avoid the churn.

Thierry

--SY7W913tn/dH5AFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLDHvEACgkQ3SOs138+
s6EcMxAArzQqp15SOF5hO05ev9K6KRoxKHvg0TS0zndWqQWucdZtE6uMUrN6R3AI
03LhC+d9H2Jb4ImdXjcXXbJg1Wen+HBeDRtbXDRmliSjnB0BLPhTvMqLrbX8cEbB
/hlkd7R7TP5NfJeObMnOlLyct5+bmV8SsnLtN1oUb8WU/iB1uaT/O8geV5+yJSXc
CqGJ4WL22zf/ZgG6Fr6unPBUpplCr8dM0C2o5z99xuzemr6l/sMdFpescgVBlnK0
PLUrh5oIcBBtUj0VZHJk17E/wz1Qf5bwEkcEkvkNf+08SWVV7xUokcryK+eA25G4
n/JIc7I4IgVs9Nyp4AMq9J3NY9qlWsISVqK8wMw0e9F0Qc8tuNI+J5mhCEXnUqtC
QqBb4SVgw1/8Q0QGLMbG0eQJh7QlOmOvZe/XgrXubq09s1KDlKHi4RxfedDFfddj
A1frT5+aJItAwOOL3b25mStKqVvgD9JzZyd17kBTaMrEP2LYuPmoF1ktXAlkT9qg
zNjGjGBevpdF+fflGHuTIk3/yaCdLgWVD+q5XrcX2inf6z0SOy4/4/HQM+glKlFs
Rj1vnv7DKo99m/yP/EAxCtsWqRjwbbEyLxyfpNZTRIhxhNGhzVjKTCrB94GWC+LN
T9vCwDpjXjOwEB0qdDurXtOMzRlEjMgj3MUJXGshciWONPSBap8=
=iK67
-----END PGP SIGNATURE-----

--SY7W913tn/dH5AFM--
