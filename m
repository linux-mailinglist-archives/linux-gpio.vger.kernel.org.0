Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD33762134
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jul 2023 20:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjGYSSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jul 2023 14:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGYSSd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jul 2023 14:18:33 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E721FF5
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jul 2023 11:18:31 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-583d63ca1e9so37305817b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jul 2023 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690309110; x=1690913910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHxe1YfaBcJ5vzDMQqmktbhf3AMJRILx98UaWc/ORTE=;
        b=wEgaZenPDz9l+e1u+X9JazDvOs2962XLBxVqBpIG9uerH2ZXOvUk16rAKe5LNvvTVv
         wEHqazZhOD5UE2RtfO2H66jwlyUFsbRR6laxhP1XHHLIPhpsouqYpIQAonSC94BqbaNE
         An9O8JCNLnx2S7eDeTqWfwXCl3RSuWIibvxKDTJLmY3GAD81BoJGHZbd1TGXUtQAnelh
         6T2VMQE5MACYJLo2QDsnosA5FPksbX1/OFFQ814WeFDJbRBPv8VFQwwfSVadEc22pOVu
         8gqiOExNYcliFFJY85PnGQx7pYzUZ46vynnYsDZ2PwlqJv1CSAaiuvff7y5jo6qg31WL
         N+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690309110; x=1690913910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHxe1YfaBcJ5vzDMQqmktbhf3AMJRILx98UaWc/ORTE=;
        b=GBQZMQ9dfUT2h4CMFCEzIfk8aC04rmnLd1hItc/eeO7MY2Z2cVu5/etVlmavzfKoTR
         eDsFczVCLNydGy+S842NknMjle8dqCHw8OIjK2nRiIW/V/7tFqSlRKOGJLgJeaIbqhz0
         qflGZTDJD32SUlc0/rSNex1rpmEj2qK0rQTxF+29vrAcC3yoyKlR4IUK0z1ZrXIqGd5y
         4IXjopp3kaOoxIl3JRJdbaES7/0rdtQC523XFSMNQ6+BIDBdGMTZeu3PIL4ITYU+5F+K
         JjLlygztLVEwZbRw+WJv6eZ75NF7p7c1iYhipCMRDY7Jf+9qhCg/RXUFFF4yqWNrrKkE
         fNyQ==
X-Gm-Message-State: ABy/qLZK4dqZ18XBBHUG6OQQP9jDXBG0KnD3ivbM7dQm/36ZcZKxtlfn
        DBJb00XUCnbboDddYtQjSY+v2NGg9m0Gz+WlwBc60A==
X-Google-Smtp-Source: APBJJlGkrCq8klkh0wt3bHuOriA1aDLa6kOW7ZHi2gVp5kxrTA76iHjF4ZEb5bGJ3fpjAO+Kutf62cVEIpEdQMKNfF4=
X-Received: by 2002:a25:ad88:0:b0:d0d:94dc:4a8 with SMTP id
 z8-20020a25ad88000000b00d0d94dc04a8mr6483671ybi.26.1690309110430; Tue, 25 Jul
 2023 11:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192058.433517-1-krzysztof.kozlowski@linaro.org>
 <20230719192058.433517-2-krzysztof.kozlowski@linaro.org> <CACRpkdbK7gU36nVOm0J+HbLk5JRKki+30=UaJ6hZjF1DiB4bBw@mail.gmail.com>
 <34be3638-ed14-bb0b-eb2e-c44f43c582f2@linaro.org>
In-Reply-To: <34be3638-ed14-bb0b-eb2e-c44f43c582f2@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jul 2023 20:18:17 +0200
Message-ID: <CACRpkdY=WYZEfHuYsJe3kxk4-E3r4wp-Ln=GyvSY2m=+-Ow47A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: qcom: sm8350-lpass-lpi: add SM8350 LPASS TLMM
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 24, 2023 at 9:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 24/07/2023 20:09, Linus Walleij wrote:
> > On Wed, Jul 19, 2023 at 9:21=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >
> >> Add driver for pin controller in Low Power Audio SubSystem (LPASS).  T=
he
> >> driver is similar to SM8250 LPASS pin controller, with difference in o=
ne
> >> new pin (gpio14) belonging to swr_tx_data.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > This sure looks good to me.
> >
> > Krzystof, can you collect a branch with pin control changes for
> > Qualcomm chips that I can pull? If it's OK with Bjorn that is.
>
> Sure, I can go through the lore search results and grab recent submission=
s.

Thanks, I think you know better than me what is the stuff that is reviewed
and ready for merge.

I have this on my devel branch so far:
59d612a3215c dt-bindings: pinctrl: qcom: lpass-lpi: Remove qcom,adsp-bypass=
-mode
abf02e132cb6 pinctrl: qcom: lpass-lpi: Make the clocks optional, always
1e46c7430af7 pinctrl: qcom-pmic-gpio: Add support for pmx75
8fff6514ff0a pinctrl: qcom-pmic-gpio: Add support for pm7550ba
75ec058db332 dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx75 support
4bbee99da13a dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7550ba support

Anything else is in some inbetween state and I'm not sure of the status
so it would really offload me if you could get it in order!

Yours,
Linus Walleij
