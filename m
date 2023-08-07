Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1327724C4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 14:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbjHGMzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 08:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjHGMzo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 08:55:44 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D1410FE
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 05:55:40 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-585fd99ed8bso79143837b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691412940; x=1692017740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BfX6arEp17J1ApuZYgVDOdLXWCnkGmD0eG9nrcMvUg=;
        b=ChEFz+t5kaMKFpe2jJ5x53CigMiXd9t5Je2Z+hV5pL5nF1xYgl44Y46vsURMayKRTs
         sCyh6CM5EhZ08D9Cxq8tflRhGCkfqL1ZdfkCGS7CWLvIGMwTsEuwe9Wwp0/+SWSDA/YP
         BAH2qXENMJJW13xvhHMsaZMapXNOPAC8Zvk4HdChEmGO2TXHCCC9/kLnr5z7QInuaOoq
         DEaKwDsrtpodFVI4IL2qasaWBSXrUfdjM5PQR3Wg49qjta68P4kWcvja5Np1waUz0HnP
         QeMPndPopdTaT/S//11k7wQ8AHRbgKL35UhAExVtoZUUI2HQCoNura2q1owu2Ck+8Na8
         YvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412940; x=1692017740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BfX6arEp17J1ApuZYgVDOdLXWCnkGmD0eG9nrcMvUg=;
        b=ULIkwKqwlx+MkOdstDltNWBD/tCcrhSPNgTb+qXJPWxt8pX7K46JxrklVZx6u6/Ity
         lOOey9W36Tvb0fDm49NT9f04qHk0Vr/p65as4uZ/bOikXxLgx8goyy5nakpXmcYzyv3l
         q+lFK6gKEE1PKMLUXpHmT9XRxrp3WyQtEI91UimJiOm5Lyg6O6gFET5wHUcOMacRXxP4
         8cbq/6/H76vXvEQvz+ReZsh89nfGPlLJf0pWfcewB5ZUjzRZgaXq0PET1mtBnK+sC1rU
         ujtLHCoPRInXBv4RE7HCEdYKd8OOOpAqINvUUDsnws94XekoCD7goqbh5jXla1fQTeHh
         Hlpw==
X-Gm-Message-State: AOJu0Yzm8y93UBoqV3Tv+LyUM2nrF4/IrFAlzhN9EmYTw+OWvhbyNkG2
        5rQlGka4x5eUm/j+Wbrk0R1hJ3dMKYnmzZ9PXPcjhg==
X-Google-Smtp-Source: AGHT+IEBEw7X+sUekghvFs/pg7p7r8rTjn5GmiFSMqpTqd2GgLQW8CZaYlcMzQteiBhViqFLcWuQesWbPI6GF/4kX0g=
X-Received: by 2002:a25:2943:0:b0:cef:b734:57fc with SMTP id
 p64-20020a252943000000b00cefb73457fcmr7974595ybp.25.1691412939852; Mon, 07
 Aug 2023 05:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230726090409.16606-1-tychang@realtek.com>
In-Reply-To: <20230726090409.16606-1-tychang@realtek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 14:55:28 +0200
Message-ID: <CACRpkdYpFMwAMGnFuC-9agY4sV6HJo8hYBL35oacnGFvJxLJ-Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add pinctrl driver support for Realtek DHC SoCs
To:     TY Chang <tychang@realtek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi TY Chang,

thanks for the patches!

On Wed, Jul 26, 2023 at 11:06=E2=80=AFAM TY Chang <tychang@realtek.com> wro=
te:

> These patches add the bindings and the pinctrl drivers for Realtek
> DHC(Digital Home Center) RTD SoCs(RTD1619B, RTD1319D and RTD1315E).

I really like the architecture with a central driver an modules for each So=
C
that makes this nicely maintainable in the future.

There are some questions around the NMOS/PMOS totempole config
(I guess that is what it is) so we need to hash that out into the
documentation, then I think the rest falls into place pretty naturally.

Yours,
Linus Walleij
