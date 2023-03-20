Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64AE26C0EAE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 11:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjCTKY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 06:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjCTKYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 06:24:50 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27818BDC2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 03:24:47 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id w20so6263744vsa.8
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679307886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMr1WoTvszkHMn826fWIWzwxgXcAXUrmwDv+A43kxrw=;
        b=HC0Ol9AjVA6fsxwuasIjT+8fB4dMQKcPk8dZP3YbCa6ryA6GJVYaZuLfgQOYP4oF3C
         ee1FCMyZUlA1dqhvMtsrybitPi5eshAyrybZDDOHKlHJkCPsXPfuWSnrP8nfWRxmgkJx
         GwVUtzid5QicAj69sqw4TN2KO0mxrsmKVcT4Evs7dh8Us3ZJp3OrEfsERMmyDfN6hdt1
         oQMs1xFoUSfkwyy4cCRE1DvDBv4fw/CPWHHH+WieOEPgYUIBfZRoFC26VM8WxiWqhW5E
         B2IBubyGKRWItXGMJcDGQEdcBTubZ675+8phT19v9xtl8lbIcC4FPXlY1kLn184kMAUH
         zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMr1WoTvszkHMn826fWIWzwxgXcAXUrmwDv+A43kxrw=;
        b=QjQmbrQhajfwRG+rUdZkAVG/U20HDAJ1EEy0EpNVQkXeUiYO93hf/UEKg8uWUsRGpQ
         +XWH0XIcQBUASfDbE4FXD1NxFQWnT3zzNKvNr82HPuW3FOElep4y08Yw1A7SPZBtjycV
         GvBDj0bMJw+9QWc22x/rOaAIIDyMjtgud53XaQ3ELA2p2CN2FuzM2YmPLSH5Cf42gRUi
         3Z+ODbdjpo5vepZj2Jr6FEhL7TucOGShobYdAwSKX5149PKDYGy2Iz2Y0IOhdVAhb1qS
         KmZ74W/iWBBk3ET8YCynVDVoKzeHizLVyLWxjtveS/N/gMw/Xq9TRCt4A0K+pP2npnKJ
         KIZA==
X-Gm-Message-State: AO0yUKXbfs3ALvIgzKCZHCMl5fi16VQFyMHybWfvxOhMtcKCkZKiEf3z
        bzBm0suRytiCLRVDK9Atqo4PjxBvOfxtmo5tKnK4tA==
X-Google-Smtp-Source: AK7set+QVBe9J3CJc30jBUPlLxhp9RAGQykt/RN2GdLJJ1f2BAGM9XTNEP1fhBJxspkysoECoTvry9uuwZ2wiscA4y8=
X-Received: by 2002:a67:ca18:0:b0:425:b61a:9c13 with SMTP id
 z24-20020a67ca18000000b00425b61a9c13mr3780116vsk.0.1679307886261; Mon, 20 Mar
 2023 03:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183043.619997-1-brgl@bgdev.pl> <20230314183043.619997-6-brgl@bgdev.pl>
 <08dff56d-227a-a791-549c-15ac0f1ac08b@linaro.org>
In-Reply-To: <08dff56d-227a-a791-549c-15ac0f1ac08b@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Mar 2023 11:24:35 +0100
Message-ID: <CAMRc=MdSRY8w0pWuhprB1ALPFpcCdYOnyQZ63BSzJPa3u1a-jA@mail.gmail.com>
Subject: Re: [PATCH 05/14] arm64: dts: qcom: sa8775p: add support for the
 on-board PMICs
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 14, 2023 at 9:22=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a new .dtsi file for sa8775p PMICs and add the four PMICs interface=
d
> > to the SoC via SPMI.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/b=
oot/dts/qcom/sa8775p-pmics.dtsi
> > new file mode 100644
> > index 000000000000..77e2515a7ab9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> > @@ -0,0 +1,37 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2023, Linaro Limited
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> > +&spmi_bus {
> > +     pmk8775_0: pmic@0 {
> pmk8775..
>
> > +             compatible =3D "qcom,pmm8654au", "qcom,spmi-pmic";
> ..or pmm8654au?
>

Honestly, I got inspired by this bit from sc8280xp-pmics.dtsi:

 54 &spmi_bus {
 55         pmk8280: pmic@0 {
 56                 compatible =3D "qcom,pmk8350", "qcom,spmi-pmic";
 57                 reg =3D <0x0 SPMI_USID>;
 58                 #address-cells =3D <1>;
 59                 #size-cells =3D <0>;

Where the label seems to follow the SoC's numbering. Do you think it
would be better to consistently use the pmic's name?

Bartosz

> Konrad
> > +             reg =3D <0x0 SPMI_USID>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +     };
> > +
> > +     pmk8775_1: pmic@2 {
> > +             compatible =3D "qcom,pmm8654au", "qcom,spmi-pmic";
> > +             reg =3D <0x2 SPMI_USID>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +     };
> > +
> > +     pmk8775_2: pmic@4 {
> > +             compatible =3D "qcom,pmm8654au", "qcom,spmi-pmic";
> > +             reg =3D <0x4 SPMI_USID>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +     };
> > +
> > +     pmk8775_3: pmic@6 {
> > +             compatible =3D "qcom,pmm8654au", "qcom,spmi-pmic";
> > +             reg =3D <0x6 SPMI_USID>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +     };
> > +};
