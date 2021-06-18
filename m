Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE35F3AC83F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbhFRKBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 06:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbhFRKBC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 06:01:02 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F08C061767
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:58:53 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s23so9943697oiw.9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOIw6n82TPYeF0v/0YjgvxC4lNlWdjmeYawtnmFBQYc=;
        b=EPA4AJrspMLp/Ra/H5I5fQ00+L141U+Kz4boPpR/WuTEjzDeX+VKL84fkeUFeeEmq+
         61cR65dyTXNfSQ3xpjNyTBmfGW144v60mLb4keUyKlblCJRyBDed7bv+/KrNbveNn4q/
         CvLKaqwGTM4PDBoxomaC3t62QRQWCMFfvnaNqnwXjV4WCVDFtT1acI5RnuZ+GVSkiCKU
         +WZUyTVXdZi9w9NRM3rMI3AQZ0iaTbTwsB27+7Etrr+ZMTVU5zKp/Q00t6iGZbd38k6n
         +SbeCNIwT11SgimNvuQDQ+IWmHB8WyuZmemJKK7w17OYTuyRCvfspwfsv2JF9t8oPROd
         Mc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOIw6n82TPYeF0v/0YjgvxC4lNlWdjmeYawtnmFBQYc=;
        b=JranMyL7mC76Qbgdagwe3pzAn+/wuEARE9kNkmT4ms43uV1RnVDjDjBbFfjeBgN1zC
         mtBHgHOj3rFi4IQPMXwV48uCj/P8dtGLtlOMLEslzww6VI/kdmGREvLqQvhwtqqDSXUj
         t2QtteOXhLFm7KXFfxuh8Kmp3HOa+fjYTFt5yuoX+TYLrnJMKfRg89ISw5jiDwebAb0D
         WEl8EVJSdP7zdaTTVe8XBtbCGd5TsXayL97arsykyKtReGHWThCl7+ihNyGDLr7jieCl
         FUAPdEBbnrv9zGNY1+xo+65eYx5126W1w0gYGuYFISAurgI3MlZ3/ovj9+0vU4pzLezK
         Gsaw==
X-Gm-Message-State: AOAM531e96nh6q+m+Af5CFZOYGKg6PBqCSNkK7+WwsPg3nEZr/pQP0Zv
        BCvx15oDhxsAmal7UBhAjeH9o/W62y2pM73qKanWYg==
X-Google-Smtp-Source: ABdhPJyFpWjzpuT5d0e6NwVemzHMdNPpkfuJ8rhZ5h81rBu8lA4gOlgQ5xjt4ubqCEuQhfLBUC88O3DD7nYKAm65G5g=
X-Received: by 2002:aca:4bd7:: with SMTP id y206mr6972005oia.40.1624010332587;
 Fri, 18 Jun 2021 02:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
 <20210617054548.353293-4-bhupesh.sharma@linaro.org> <cba788c2-f826-94f0-0bcd-bae491ac4189@somainline.org>
In-Reply-To: <cba788c2-f826-94f0-0bcd-bae491ac4189@somainline.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 18 Jun 2021 15:28:41 +0530
Message-ID: <CAH=2NtxezX75zfY0qVuFFjO-XfSgh7fuSwdyO25z9q8bq6nG4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: pmm8155au_1: Add base dts file
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Konrad,

Thanks for the review.

On Fri, 18 Jun 2021 at 04:04, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 17.06.2021 07:45, Bhupesh Sharma wrote:
> > Add base DTS file for pmm8155au_1 along with GPIOs, power-on, rtc and vadc
> > nodes.
> >
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi | 134 ++++++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
> > new file mode 100644
> > index 000000000000..b04c28e54470
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
> > @@ -0,0 +1,134 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2021, Linaro Limited
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > +
> > +/ {
> > +     thermal-zones {
> > +             pmm8155au-1-thermal {
> > +                     polling-delay-passive = <100>;
> > +                     polling-delay = <0>;
> > +
> > +                     thermal-sensors = <&pmm8155au_1_temp>;
> > +
> > +                     trips {
> > +                             trip0 {
> > +                                     temperature = <95000>;
> > +                                     hysteresis = <0>;
> > +                                     type = "passive";
> > +                             };
> > +
> > +                             trip1 {
> > +                                     temperature = <115000>;
> > +                                     hysteresis = <0>;
> > +                                     type = "hot";
> > +                             };
> > +
> > +                             trip2 {
> > +                                     temperature = <145000>;
> > +                                     hysteresis = <0>;
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&spmi_bus {
> > +     pmic@0 {
> > +             compatible = "qcom,pmm8155au", "qcom,spmi-pmic";
> > +             reg = <0x0 SPMI_USID>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             pon: power-on@800 {
> > +                     compatible = "qcom,pm8916-pon";
> > +                     reg = <0x0800>;
> > +                     pwrkey {
> > +                             compatible = "qcom,pm8941-pwrkey";
> > +                             interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +                             debounce = <15625>;
> > +                             bias-pull-up;
> > +                             linux,code = <KEY_POWER>;
> > +
> > +                             status = "disabled";
> > +                     };
>
> Oh, okay, so the power key is there, then I withdraw my worries from _2.
>
> I'm still interested in the reg situation though.
>
>
>
> > +             };
> > +
> > +             pmm8155au_1_temp: temp-alarm@2400 {
> > +                     compatible = "qcom,spmi-temp-alarm";
> > +                     reg = <0x2400>;
> > +                     interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> > +                     io-channels = <&pmm8155au_1_adc ADC5_DIE_TEMP>;
> > +                     io-channel-names = "thermal";
> > +                     #thermal-sensor-cells = <0>;
> > +             };
> > +
> > +             pmm8155au_1_adc: adc@3100 {
> > +                     compatible = "qcom,spmi-adc5";
> > +                     reg = <0x3100>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     #io-channel-cells = <1>;
> > +                     interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                     ref-gnd@0 {
> > +                             reg = <ADC5_REF_GND>;
> > +                             qcom,pre-scaling = <1 1>;
> > +                             label = "ref_gnd";
> > +                     };
> > +
> > +                     vref-1p25@1 {
> > +                             reg = <ADC5_1P25VREF>;
> > +                             qcom,pre-scaling = <1 1>;
> > +                             label = "vref_1p25";
> > +                     };
> > +
> > +                     die-temp@6 {
> > +                             reg = <ADC5_DIE_TEMP>;
> > +                             qcom,pre-scaling = <1 1>;
> > +                             label = "die_temp";
> > +                     };
> > +             };
> > +
> > +             pmm8155au_1_adc_tm: adc-tm@3500 {
> > +                     compatible = "qcom,spmi-adc-tm5";
> > +                     reg = <0x3500>;
> > +                     interrupts = <0x0 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
> > +                     #thermal-sensor-cells = <1>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             pmm8155au_1_rtc: rtc@6000 {
> > +                     compatible = "qcom,pm8941-rtc";
> > +                     reg = <0x6000>;
> > +                     reg-names = "rtc", "alarm";
> > +                     interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> > +
> > +                     status = "disabled";
> > +             };
> > +
> > +             pmm8155au_1_gpios: gpio@c000 {
> > +                     compatible = "qcom,pmm8155au-gpio";
> > +                     reg = <0xc000>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +             };
>
> And the same question about gpio-ranges from _2.

Sure, let's use the thread for [PATCH 2/5] for the discussion on these
review comments as the same comments are applicable there as well.

Thanks,
Bhupesh
