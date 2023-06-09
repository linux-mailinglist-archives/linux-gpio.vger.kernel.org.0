Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4324C729144
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbjFIHgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239043AbjFIHfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:35:30 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B70D3A9A
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:35:24 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-565eb83efe4so13500127b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686296123; x=1688888123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXRQ9RMNSpYy4SJeb05z3pCFFv4+rzTyY7qrheEnngM=;
        b=nHWMokvQ7JrnTbK/Hbcl6pE2cSNyXivSPtQexVl2qWTlg9uJV3dUNC4ABuI6fvFz97
         wb0ul7Uz0LOyfqL+XyswCsxpct1UeiM2iDuGdHESecYgHtECza+U/hEMzkBNhVIM45nB
         7/K5mLWX9RDzO1fZ/6ytDipqBnmRejs6EiUbkCc2KmFw6qTlpdgSPO9B8H1+ZYBJyOhM
         wRDV8KtmHB9DGpq8TN9kPB4hKU71zRL0UN0wnzKgQJoVRVHBIlk3Mky/RhFlCHoHJnB2
         UV+HlVwEa8qDxUxeyzKeEv6/VFKesDXVeDt3yAN1eGphRytMKWEjs6NHwAecjCEjMnQx
         atJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296123; x=1688888123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXRQ9RMNSpYy4SJeb05z3pCFFv4+rzTyY7qrheEnngM=;
        b=L/y43Cff33bGyOPP1k5i6u1KZH7ZQ+hbQucXnp3hcpa6Sn18aqigInkK5CTqonn5qv
         99HPnDHjP63k2G/PG3wXTTJT2ckDdsG4vjJ0DY/4N4V086C90U+8ZkvLRz8QPByw6EMx
         QUdRaP4wTF2dr1xu/VvMjnXsJYLQsKC+/uo+0DfoFD7p6zjIRqu+9Q5uhjPcc9OFBcsR
         HlCtmnhJk2oa9KPuPlil72n5Zl1F6O6ezGn/RBnLqsQj+y/Xbv1qWPgsu9XrAjatEj6E
         lRQEAsMKpS+DdscKAh0O//utYt1yHeuwTsUMlnI0/je8rcxnPOaGGvP+mkapuyrrBxcK
         j7Ag==
X-Gm-Message-State: AC+VfDzMxcM0EYXc2ENns9oH5ZW59CvTjkfx7NQegE1O5yN5Q1jyKBmy
        UEWB+kLGOB8qa19fk3VdDyTHmzzJnSkIPEV0r4iRvg==
X-Google-Smtp-Source: ACHHUZ5TdzyoS8v5b303tNf7iOb2HLdgB+6G49iiqpAWRm9kp+gQXyegOUl9tEmeRlTSDQwxZhaUH8dJdCLZ432g2tU=
X-Received: by 2002:a25:d687:0:b0:ba7:f9a8:3cc1 with SMTP id
 n129-20020a25d687000000b00ba7f9a83cc1mr444732ybg.33.1686296123481; Fri, 09
 Jun 2023 00:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686063941.git.oleksii_moisieiev@epam.com> <a2be28c0aec04fdc3684f56801c78bcc498c3471.1686063941.git.oleksii_moisieiev@epam.com>
In-Reply-To: <a2be28c0aec04fdc3684f56801c78bcc498c3471.1686063941.git.oleksii_moisieiev@epam.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:35:12 +0200
Message-ID: <CACRpkdbyVWvHnZWGVt13ocBZX0=U4Q=rCpDPdU44Va_6HVqvBA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: firmware: arm,scmi: Add support for
 pinctrl protocol
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 6, 2023 at 6:22=E2=80=AFPM Oleksii Moisieiev
<Oleksii_Moisieiev@epam.com> wrote:

> Add new SCMI v3.2 pinctrl protocol bindings definitions and example.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

This looks very good to me! The DT is very readable which is exactly
according to my philosophy when I designed these abstractions and bindings.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
