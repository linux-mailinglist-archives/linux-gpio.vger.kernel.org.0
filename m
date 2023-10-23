Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110B97D2C95
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Oct 2023 10:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjJWIYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Oct 2023 04:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjJWIYg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2023 04:24:36 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54F9E0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:24:34 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7b3d33663so32807747b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 01:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698049474; x=1698654274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mayolstgy4T5uOdJ66ctew/h2/Q1wpOy6kH/NWQ5T8A=;
        b=XnQ0ueR7LMSR1Ty7GYuPg31EmGDBn1IpPpRhmCYoF+ehFa5OqfM+hwvTWQ3wfGQoJN
         wSbYZoZWjARb8tsWgW5d6+bdxvJaY4qNDtz0SzWpVs4ZtSNwqm8/QtIn0/kc5WrelKfR
         9A0hczS929AO1j6Yv38hi+ACAFtexo4u4Df5bbKxkY1djkawn+W014GZMJ/dZQbN6Zfx
         MwMeh5qrbeNv+ucMSu2AQda8iLRlZ9M6UBuudj5qp3yEolNfcZPDxgBIU/k+Oc9Vj4AC
         mDFnzkvNQOeF3oYJuCYXYIW7PdBXmyYFoZQEJYpthoIsn3M5brNtKhP0CElC2i2l4d/X
         fHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049474; x=1698654274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mayolstgy4T5uOdJ66ctew/h2/Q1wpOy6kH/NWQ5T8A=;
        b=d33i/7o3o40ikXxHAU+rz3krVJQU3Ehlr8Im4baRxfLTYzzpJPw3MxVyHdUVbMRPld
         o4mernzZIeOOBKHhQD0zNY7Ro4oj/sQkczK9rdWoVEYzT3DbE+RkBuHUnLCb/ww86Zxx
         VJSWMpdl5SV99fAi51qYPkPXH3645xXPDk+1u58CWqSwAdOm44FhRnWwS2iHcV3c6iBc
         yMJJC8xY8h3uR77ZyXUmQSonvP9At8IFJDv83o0iQdJaXsRh1ip8UBq25km7anJ0nQTP
         wjyq8NeEPmm5vRD6awxdSuBnzaJDUfI/r3GIUAFg7Uonz/VBcGtoZwth0OuMVMLJKCac
         U7mg==
X-Gm-Message-State: AOJu0YzN952R28QWNSqj64/Pobu6AmylFYncGcfvx2/40VgCZKJd/tB0
        1a/SFr1N5SfuWP9lF5D7kkhSpVCii66FpyJhgllfrg==
X-Google-Smtp-Source: AGHT+IHqaGryVNLtYcH/o4PcnTUfDi9IyxJlXkQzE5rV+FVSfix8sfv1gYTlNzE8KxkuavuaZgj325AG9uukF15LuM0=
X-Received: by 2002:a5b:b86:0:b0:d9a:b957:116d with SMTP id
 l6-20020a5b0b86000000b00d9ab957116dmr7951190ybq.27.1698049474104; Mon, 23 Oct
 2023 01:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231020170017.3610978-1-robh@kernel.org>
In-Reply-To: <20231020170017.3610978-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Oct 2023 10:24:23 +0200
Message-ID: <CACRpkdb6EpRPz-UPwJcS2aH3vtN=8a0gbfm1mXfpZvRWQ5BE-g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: nuvoton,npcm845: Add missing
 additionalProperties on gpio child nodes
To:     Rob Herring <robh@kernel.org>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 20, 2023 at 7:00=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node. Add the missing addtionalProperties to the 'gpio'
> child nodes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
