Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F766AD109
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 23:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCFWEY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 17:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCFWEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 17:04:23 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9141316314
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 14:04:22 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id y144so9687039yby.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 14:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678140262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj4SlGol6U5c/Lr/TI0kdwQqKkOnoBxkEowA782E81I=;
        b=cj7ECO5tujuJz/Nv/pvwK/z+E/6PFURiEjAL8ZP6rwxHBj4TymSexHzYdOgSjbwSDg
         MwQKGhMdlya1ElMltvorZEfo6ZJ73Ip6mNFYPgFoZG3RBG9n8vd8aO3gFOKxb4hLKtcj
         5UurvCPm2SDS+D03MpgZtk7gpME+iyTgrrdpbUq4a9UamJ4XMWvLnKuADHOuTqCeur8n
         pzsgEAn2H6bn9WO7y2PbUC5fQdieXYo9qRfN9qAaGlvD+3LwzrYpu2Anrpzsvin4/kIS
         bCZtYTtSuMj3T6uNjKtmD1D6ZC3ueRRTkRQsADXbaO5VEWWe1Fb3pChYkPpvHmdgyQqM
         +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678140262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj4SlGol6U5c/Lr/TI0kdwQqKkOnoBxkEowA782E81I=;
        b=g41jFkzXldYf0cWpL11y15E3cO7dzjnI1Ca0jvY9coLxiVezV/ihPwczIm4LX97Mpz
         WwKo2d8OsueMVCOmUEB7pKYDUrK+QlL3OExFLiMD0+oPSkM5QUn1WAMA/jsf3cUNbcOh
         oLTUeGaIdK6yJm09xFctzGj2w5LnJfSfQallb3zBPpEMJUzgEAmnqu8i6I3pMvo2jtoe
         Ylmpfc1aPP3JSM4hTAJjG8bCBk01ZNeNTcHaVTw6dguUlyQwwk1DpYdSPTFppmMU+7tA
         TahA5M5pQeGE1LvAeJEe9iiqoMp6kzlfpSCOb2MzAEPoVked6PK429ylDMcfwozzgmRL
         TKoA==
X-Gm-Message-State: AO0yUKXK1mqg4O3ExxR+xC0Gu/W4ywo1EtExCm7HWV7yisNERC9wdIEx
        sUcVZbsxD+T8j8VCCiwGPQKaH7g8OYvwz7gdZETfXw==
X-Google-Smtp-Source: AK7set+wFCsgXgUYIDGEpMHMB73UyMnPBcZS5Za+NjqsbNmPAPmuIolhDFJR/AUEXYiry/T4wHPpmiOkMAbODo6SuV8=
X-Received: by 2002:a25:9281:0:b0:b0a:7108:71e9 with SMTP id
 y1-20020a259281000000b00b0a710871e9mr3142078ybl.4.1678140261781; Mon, 06 Mar
 2023 14:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com> <20230306191535.1917656-4-sean.anderson@seco.com>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 23:04:10 +0100
Message-ID: <CACRpkdZ-adsE1siz+MKvewNPoBLfwqhT_EjwDue3N9K9n0ET3A@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sean,

thanks for doing this. I never got around to because time.

On Mon, Mar 6, 2023 at 8:16=E2=80=AFPM Sean Anderson <sean.anderson@seco.co=
m> wrote:

> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
(...)

> +  compatible:
> +    enum:
> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO con=
troller
> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND cont=
roller

I think you can inline description: statements in the enum instead of
the # hash comments, however IIRC you have to use oneOf and
const: to do it, like I do in
Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
but don't overinvest in this if it is cumbersome.

Either way:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
