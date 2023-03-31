Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 364E56D1CF8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 11:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjCaJus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjCaJuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 05:50:10 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7241F7AC
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 02:49:00 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5419d4c340aso404661107b3.11
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680256139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5pGMLww73dCFKjtdNGb3p3AEaqgdkuu0OlTQgtfasE=;
        b=wLEOdTZUxmwZSKw4DvZUMXcR8N9bTJFDhIHjFe8qvF2uIXigEoR70OTkV+40+oINWX
         ptUio2vPOJbJc2ytVw8zH83vpnHjhFhXaX8uIILXJ11cXbl2qZwi5whEP2f2u7Yrwg8K
         y/Vhxoq48aBPQFxXJAN/lXN1QtXDvCbCza0/icYKdYeL5r4ZaQn4fXnlZ2vfMdtLmTNN
         GEKa7GdHdzNjIwgVqpsD4a4qPVcWD4mwYMEt6Azsul5Hqr3Qb8qZzwhcIooiw+uRWJR5
         IJcSVRG0l0rM0x4Vb/GUHHcI4Ejy3OtHcfpHPpdJSgJ/CHWGkDEh5Yil7p4gfa+FmvOK
         8ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680256139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5pGMLww73dCFKjtdNGb3p3AEaqgdkuu0OlTQgtfasE=;
        b=oxSFvvdb8w0eFbRYv6a+2PdCOUhD85AAhV+W2hNZxqJCe7RhENheKsCgEZ61b2VYhG
         tLRz7PouttDhjI8ZdHLvZ48KWbZa7CQ2SyaXdfJDHdm0468rvZcRjnO/WHDIire0W3Pp
         oXsSatvPu+Wdb+8ehRPGRmDOvunl7IXlEq2zh0Awxz4sLP2EI0Yj7GyZUbHnNeutbYJY
         iziZ2mSI4OZvlJxhAjgLg8YMLKKJkNYi8SQwAPIE3jm7Few84USf2Jora1BLgCLnY1Yo
         gFDXhh+7ejIgBKoZWgzFy0N3Fe9iHOeaeHBo6w+MBwdUcE1Z/6C3j0tBDJsj7BkE0w/i
         TGOg==
X-Gm-Message-State: AAQBX9cMOwOcapmdhsV7PiM3W7K1bAL9R/bQBvR5T/DwTUTPU+7aVt04
        X2BG6cTbfVANfn1xFFiUe/qqlipXzFZxi4iFLs0G4Q==
X-Google-Smtp-Source: AKy350Z6UNMB6ZYBlO+LKWDPc3sFmI+LFVx1ogh8nZSx1YB6Toptx37QIYHp4BzP84FVtQN1kruXyRVFltAXXiuKNDk=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr13162630ywl.9.1680256139737; Fri, 31
 Mar 2023 02:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230328101011.185594-1-biju.das.jz@bp.renesas.com> <20230328101011.185594-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230328101011.185594-2-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 11:48:48 +0200
Message-ID: <CACRpkdYDR8Vuvag6nyOy0BWQ_qEmbz43ro4B_xjf9vUXckeL8w@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: pinctrl: rzg2l-poeg: Document
 renesas,poeg-config property
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 28, 2023 at 12:10=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:

> Document renesas,poeg-config optional property.
>
> The output pins of the general PWM timer (GPT) can be disabled by using
> the port output enabling function for the GPT (POEG). The HW supports
> following ways to disable the output pins.
>
> 1) Pin output disable by input level detection of the GTETRG{A..D} pins
> 2) Output disable request from the GPT
> 3) Pin output disable by user control
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

This looks good to me, Geert will know the details.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
