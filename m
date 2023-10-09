Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF987BDDE0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 15:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376745AbjJINOG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 09:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376981AbjJINNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 09:13:46 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE69EFE
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 06:13:36 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a22eaafd72so56011367b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696857216; x=1697462016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKZKnrRJ3sYtky/2h2Hus8kthq+g2qZ6Wg41eu1H8Lg=;
        b=bm00HPNOX1W0TXsn3nZTubMYOd4U2VYtG5z5sgnF3NZ3jNgl7keFI1QaIujZxL+Ul/
         ULXUqfU/kXpd2NTSTjDQ7WNBx9AwRAxNy/OAWm6hqyKweQY8mwNpso13k6ZMtiyjep+E
         y7TTA/n5PoAG4gGyquc4uJqn0Y3xF2wFzB1KiHMlkaO9Z0OoGCg4ccJ2gM67EsqEXW7q
         9ZaEdmO/KI4ElXiMgsOIUSeC0lJRqaN9Hw7Xlg+f+0KvyLOH9Bx9o/LcVXUs2vkvm5X+
         iFy7xmDb8h2x06/yh/zaB+7rdLwYjpkSCZt6oip+uFKX2gBSGV3GeofttNg3b6teJJLZ
         OM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696857216; x=1697462016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKZKnrRJ3sYtky/2h2Hus8kthq+g2qZ6Wg41eu1H8Lg=;
        b=eQG07u5iOq6g4PcCyfbvHd4rtULc+30O3xfRnyS50egaNZCgbDxPrSSXHU4BXQPAzv
         GZWSC1yM4cB8ghJU5ihhuKVNX2PdCBBbw4LGS/zJQgLzV4898Jz7h0sl9D9diRE18lfe
         OEvolKqQCA81KV8AB3Y13saX/hL7G2MDP1rxgvYWl4h7wUgKM3v5yJRTO1/duVqXpZzv
         sqz0CNjEcQGJxSTEJtRku//lbuOUzBlm3cFJcdltUc5t4PNYl3Au/v7zZljlnum3tSTL
         c3rl3j+D9EWl2dFm3nKZhFI1SiatNmKpFErlCau22VHjNrj73V7k9kvi9s/eYfCZRyCl
         NfAw==
X-Gm-Message-State: AOJu0Yw982tv00o8wDTMPM4qL5vu2Gbf9d5+LI5tAOsMXwlujnYv/UWV
        NKXv9eR2Gs+1mG46gKFHf4c7S9ZdhPZV6Y3oYbYP0Q==
X-Google-Smtp-Source: AGHT+IGt4o+K7vRBblvmGc6ypN/viBqCTAHECrQcma5UGrocmzfjWytyeGJeKtv1Oy5/0dhqamzM1xbB19zZG60qbYE=
X-Received: by 2002:a25:768d:0:b0:d7a:e0f6:54cc with SMTP id
 r135-20020a25768d000000b00d7ae0f654ccmr14186498ybc.26.1696857216181; Mon, 09
 Oct 2023 06:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231005025843.508689-1-takahiro.akashi@linaro.org>
 <20231005025843.508689-6-takahiro.akashi@linaro.org> <20231006132346.GA3426353-robh@kernel.org>
 <CACRpkdaLsfSBEG-h9ZNT2_Lm8tW8AZO7tedDVNeuZoQAqSkyjw@mail.gmail.com> <ZSPDILYZkxvTnQia@e120937-lin>
In-Reply-To: <ZSPDILYZkxvTnQia@e120937-lin>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Oct 2023 15:13:24 +0200
Message-ID: <CACRpkdY=eza0TuBRDb_cWk9LM2qNQg76rZSgWa-RP4TYLL=Ppw@mail.gmail.com>
Subject: Re: [RFC v2 5/5] dt-bindings: gpio: Add bindings for pinctrl based
 generic gpio driver
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     Rob Herring <robh@kernel.org>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        sudeep.holla@arm.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Oleksii_Moisieiev@epam.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:08=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:

> > > +    gpio0: gpio@0 {
> > > +        compatible =3D "pin-control-gpio";
> > > +        gpio-controller;
> > > +        #gpio-cells =3D <2>;
> > > +        gpio-ranges =3D <&scmi_pinctrl 0 10 5>,
> > > +                      <&scmi_pinctrl 5 0 0>;
> > > +        gpio-ranges-group-names =3D "",
> > > +                                  "pinmux_gpio";
> > > +    };
> >
>
> Assuming the above &scmi_pinctrl refers to the protocol node as we
> usually do,

No it does not, it is a three-layer cake.

scmi <-> scmi_pinctrl <-> scmi_gpio

it refers to the scmi_pinctrl node.

There is no SCMI GPIO protocol, instead SCMI is using the
operations already available in the pin controller to exercise
GPIO. Generic pin control has operations to drive lines for
example, and Takahiro is adding the ability for a generic pin
controller to also read a line.

Yours,
Linus Walleij
