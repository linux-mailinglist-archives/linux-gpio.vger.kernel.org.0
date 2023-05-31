Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB12B71851C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 16:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbjEaOia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 10:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjEaOi3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 10:38:29 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1631E124;
        Wed, 31 May 2023 07:38:24 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6261a25e9b6so23313156d6.0;
        Wed, 31 May 2023 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685543903; x=1688135903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlshlRQWTJygtWaXLBl1OU6OTBUlCnjwtRx0FpTW0cM=;
        b=nYXKG15/pTAhpydM4KU0beoOWmnzzPh2fJUexzJhmEtHZbOkMOzr0S4Kj19xaw+MZg
         xfSGploDkjlu3aKLhihi7lUrT29TQs/7idxB8VX9wA27JqCzpenhItoEXEZTl4HYvXE/
         P4qWLynBbgsFraWC/thmgB0uYMvl7sGVFzpYpRACjOzytDwT8YEPFRr7RQGzQDcc8+0s
         u0Ps8P8db1hIkUEBV6oWJxtbt6cQ/FUyAGW/T+8DcxQ4V88X5/EmasLq0ybEr3f3enjp
         9wvyUx96uyhlPkrPr6ilPOdkuxCSlMnGkFfwQGVmLdyrVjcYzp7MDO850N7Wh06/N9wy
         DUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685543903; x=1688135903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlshlRQWTJygtWaXLBl1OU6OTBUlCnjwtRx0FpTW0cM=;
        b=ejAIi6zKfPByn6L9S5jj2fat8aJffsdavb3T5VOT/c1qLpHHwF9qNy/urfoJyRBZzz
         4oKraaqPu/q2oEwLWQu5ySTgtXhcAi7FJeAkYV+ohUldAGVcabsp8YKx+/9LGS7WIUX6
         prowy+AXbfejrWeRhFWDUPfyvH+drs7PVYp/RKX7Q3DQ0DkEPTcsfbaTPpqT+l0NUElk
         FUhAgsc1/812xdfvgXZgloOi8+5hoGjYaQdbCF1J2aHd3WmqRwFohDODD4UR0abAI8lt
         P+UmAR/IBERO793rGw7Qhu/Ycl4aNaTyN/GMttozZoEmqje2LW/FRZPCnc+d4bQhHwAU
         7xkA==
X-Gm-Message-State: AC+VfDzBtlUolvgqg/G80MtuyZmrJN4G4v6CHW594q/JtN9/iWSoBvOq
        FiLo8dJB1rB7URQGAF0vbhEr+c21ZKLGLBPoMxB+d6F8
X-Google-Smtp-Source: ACHHUZ5L7oZX1aXUn+RPnVDsXeyNFSrTxvzqZa/FJSacPrE/tvrG5TNipjQXS4e2xIFPV3TQIQVeg877EXOqq28jfDA=
X-Received: by 2002:a05:6214:62f:b0:61b:6a44:5f03 with SMTP id
 a15-20020a056214062f00b0061b6a445f03mr6685989qvx.33.1685543903178; Wed, 31
 May 2023 07:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org> <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
 <4810610.GXAFRqVoOG@steina-w> <CACRpkda7CuiJ0=9+gw9G+mmBAOH+P2xmofb2dVANjqqrW78xfw@mail.gmail.com>
In-Reply-To: <CACRpkda7CuiJ0=9+gw9G+mmBAOH+P2xmofb2dVANjqqrW78xfw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 17:37:46 +0300
Message-ID: <CAHp75Vf43JJ0j-G4-1Nd4kWNO8-YeaCUCz7+6w7OSAie1HArSw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 31, 2023 at 4:45=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Wed, May 31, 2023 at 8:53=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>
> > What do I need to do to get progress on this topic? Without this kind o=
f delay
> > handling the DSI-LVDS bridge on our hardware cannot be used in mainline=
.
>
> The DT binding maintainers (Rob, Krzysztof) need to ACK the approach to
> how this is modeled in the DT bindings.
>
> For trivial-to-medium changes I am convenient to apply changes after 1-2
> weeks of silence, but these are pretty fundamental issues so the binding
> maintainers need to sign off on it.
>
> I think they are a bit offline for the moment, but I would read through t=
he
> feedback from the binding maintainers and draft a binding patch that they
> can accept.

Are you okay with this to be the part of a GPIO controller rather than
the platform stuff related to the consumer?

--=20
With Best Regards,
Andy Shevchenko
