Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0288440EAA3
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347148AbhIPTIP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 15:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347028AbhIPTID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 15:08:03 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28AFC06AA7A
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 12:02:37 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i3-20020a056830210300b0051af5666070so9641734otc.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FWeWVI89CMKoqS12Pp2ofBTtl9f9+kDvHLEYyvtvj3Y=;
        b=Wt7OcJpNUxw12DAwblAXr10E60SnW77IXBLxYGtjl4MPd+CK4GnWnRs87pe+Uuu3c8
         ohI3BW3y/F/UIenD56eQVQ6KreefgJIrVNqutHJM0rSM4Fb/zmBfCpOGmXur9lqq2EyJ
         IzKs4ujCFIvkiccoa6fLoYT+/DDXEJgWTUK08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FWeWVI89CMKoqS12Pp2ofBTtl9f9+kDvHLEYyvtvj3Y=;
        b=EDVSVJF4lYKxeoBau1Da9TdXd7+t8lTkN2YMt3y/v8zfr56whTpHLsMMn3BvugtiXF
         GwXBIyAaDaLZpqHZPgYuBw5umlnM8bhcS26FGt0pdn+TIfjmwGzVCVrGgTN/s97BbHJK
         Wp8l7kac6BZEpRFYMMx9VbbimnDH2EN3AhX+iFfKabwiXopRJU7S11ELtPBltiqr23ug
         8CN4Ftr9tfD8SjO52GX1tHCxrQzSmzzoceOY8NGW6pXwb5euhUBNozSWltAK13mXhygS
         bA0hx3RJ4yWX4csuVdZRUaTU16rj7y4wapIharWlri+pNuMsWG8c1zWtzfOUF2ZfIn2y
         vYdQ==
X-Gm-Message-State: AOAM531iF2BlaQ8jt67bEwvPGTJV2iovQOFy0Ih9humF3X6rdcCiOHdw
        eMSzRIpinCwzpKMCSxO6j2/vB2jcT4bFGtf8mPwL3Q==
X-Google-Smtp-Source: ABdhPJzEFLzP9i6NLH2BNZiamfhPoIiZWSUb5DRAGv784Z0t+KDMcv3d9XBq8O+KgpL10r2bUObyqJ+JYSPOsod0imQ=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr5777608otp.159.1631818956932;
 Thu, 16 Sep 2021 12:02:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 12:02:36 -0700
MIME-Version: 1.0
In-Reply-To: <1631798498-10864-3-git-send-email-skakit@codeaurora.org>
References: <1631798498-10864-1-git-send-email-skakit@codeaurora.org> <1631798498-10864-3-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 12:02:36 -0700
Message-ID: <CAE-0n53i4pU==W-dc=md_x+0Tqbd1gtwkPBFode+rtupSFi0WQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Satya Priya (2021-09-16 06:21:38)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 371a2a9..cbbb0ee 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -12,6 +12,26 @@
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
>
> +/ {
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +               label = "gpio-keys";
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&key_vol_up_default>;
> +
> +               volume-up {
> +                       label = "volume_up";
> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +                       linux,input-type = <1>;
> +                       linux,code = <KEY_VOLUMEUP>;

Is there an include for this define? Looks like
<dt-bindings/input/input.h> should be added as well? Did you try
compiling?

> +                       gpio-key,wakeup;
> +                       debounce-interval = <15>;
> +                       linux,can-disable;
> +               };
> +       };
> +};
> +
>  &apps_rsc {
>         pm7325-regulators {
>                 compatible = "qcom,pm7325-rpmh-regulators";
> @@ -284,6 +304,17 @@
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
> +&pm7325_gpios {
> +       key_vol_up_default: key-vol-up-default {
> +               pins = "gpio6";
> +               function = "normal";
> +               input-enable;
> +               bias-pull-up;
> +               power-source = <0>;
> +               qcom,drive-strength = <3>;
> +       };
> +};
> +
>  &qup_uart5_default {
>         tx {
>                 pins = "gpio46";
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
