Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69E472EABC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 20:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbjFMSUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 14:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236080AbjFMSUO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 14:20:14 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4566D19A
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:20:13 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-56ce53c0040so43301537b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686680412; x=1689272412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzoITlkvXOOXaxcBX10vC+q2MwiSX7omqPKM4OYACbM=;
        b=cDo4KYMSzW2JCfxx5H4X+/IYbdGF/FmH7l2YP8HfZhNYBBYG5MWtVg5dsfFzrxi2Rd
         MUilPZrQoqP+YYWhRGAF0SJFxrh2k8D3JPakgTZ3IybW8PkIhJyUXeIcfJHdh1htlnVM
         wZ0G4PYeSRkhtw+/tdPo1XxAg68gPOavBAh63KoOmySBJxpPUvxSwtl6nEWsMhnx43c5
         U3h4ICQ62FMOb0zjPOquPhNftt8d7Yw4vw04ZclZehSrxSy5hz7Vs3G45r9tE6t9wetI
         MplkXNr89ytfwMJTf2jUdTBd5LD0HhAioaAvly2ZRiFE252pcah1THDeJw4hnbZxcS4Y
         c1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680412; x=1689272412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzoITlkvXOOXaxcBX10vC+q2MwiSX7omqPKM4OYACbM=;
        b=fFKeWd2+rDKsKKI0dv3NRjtJIsCJdsxoxwbGg1lA5dRHMChnQurJRI9M2Z4Li/oo73
         EXT9vWK5GI5UhhlrdL80QO5P7rO4ASUT5HJ53LOTWUc+ui4OGzx/hfFNBcVGeF4gGqye
         Q0E7kzqfUJUYpX8jhE571K17YE5We+0HJH+mdY1kBqSh7Xm4Jkh4j8Dba871IUgHx7kV
         FKzPLmTGLbmzNqqYw4cTrgQVO/MCuQncMv/apvqEeEQyeONAWbD9wx7PKfetpvZy9lBh
         CyHfFnxcRS0ezgpObiKJfrfVB9ygQIu0c+XBCiY5S2NQaeMzqPzqIvmCK2vDPjxcI7ng
         dcjw==
X-Gm-Message-State: AC+VfDwJDQOPDYf+Nc0DYrfwGqvfiQc7S/x1Bgdw7RgdTYWPr2zvgJu8
        nzPQgB04DfyLmJZacpzLLOXwjIv6nXPOBBtGy2HFgw==
X-Google-Smtp-Source: ACHHUZ6+/uZzKrxAXzrWwTNJxKf0up28eWIWrk4WjaTGzjye0Yy8SiYEYBQVD/Itn2xQ0uoLa1D3G8NFztcWJyya5kg=
X-Received: by 2002:a25:2b88:0:b0:bca:efc4:2ccf with SMTP id
 r130-20020a252b88000000b00bcaefc42ccfmr1996804ybr.44.1686680412433; Tue, 13
 Jun 2023 11:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230418150606.1528107-1-robh@kernel.org> <b8a062a0-10e9-bf17-c109-f6986f9dd02c@linaro.org>
 <CAL_JsqJvmN7824Q0vnWpnO3a_Fdo5Ybc2tcGnJZAfDLM=-1Apg@mail.gmail.com>
In-Reply-To: <CAL_JsqJvmN7824Q0vnWpnO3a_Fdo5Ybc2tcGnJZAfDLM=-1Apg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Jun 2023 20:20:01 +0200
Message-ID: <CACRpkdaUGpwok_s-4UWXWmZKK6=tbAQ6DWn9CBdSruTD97=qpA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: Fix schema for "qcom,paired"
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 13, 2023 at 3:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Tue, Jun 13, 2023 at 12:50=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 18/04/2023 17:06, Rob Herring wrote:
> > > The "qcom,paired" schema is all wrong. First, it's a list rather than=
 an
> > > object(dictionary). Second, it is missing a required type. The meta-s=
chema
> > > normally catches this, but schemas under "$defs" was not getting chec=
ked.
> > > A fix for that is pending.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> > Linus,
> > Could you take it for current fixes? The code was wrong and dtschema is
> > warning now about this.
>
> I have other things ready for 6.4, so I'll add this one.

Thanks for picking this one Rob!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
