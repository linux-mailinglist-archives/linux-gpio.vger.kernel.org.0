Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505F5409D99
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Sep 2021 22:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347711AbhIMUCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 16:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241159AbhIMUCX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 16:02:23 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5F7C061760
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 13:01:06 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s20so15656154oiw.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7IuA3oPjzFr/omXOUi17jMbFMk97H562iUj3toh7zkc=;
        b=FruCX59UkRgRj224lR6XRX42UOlu98yoAnbCZ/qDTj4/xumAI+NMGF6tC6rTwLoTux
         PSkF8bTCUlMUrX6BBF3ZlxE5N3BNR7CT8ajdvBKWkhOisM6x7t6mg9wRBtV3FSOkZdit
         ECHdRplqaK9jzRu2XY9JOqTiLcEmd3bWtHfb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7IuA3oPjzFr/omXOUi17jMbFMk97H562iUj3toh7zkc=;
        b=M+dwxc50p9utybrlQo8ljJGkpohTivwV0FD/6gBfLUW4wNlENphbKWX3ZNFd/4xrAI
         Kn32blJsEcy6h8C5U6gCLdNmcM0ZMmnRkl1FroJbxveQoh5/L5nb/HKYycdKguttwgiu
         MdqKwMI8kJw7PA4dfVqXdaNsFDzPlqpDYajsIhxxXRpBE84IM8cVWu78Y34f15VQalYM
         07HL+JcGpwzYaW8SOEOOmtycfZVnTTtBb+csVAXGCXzsvlvhedw/hRPUOUoXx1MSiBay
         qDjAfE6cIE+EQ+EiUfxfJ5lC0Ho9zboBcUXOjS2BOGIFtvlnPoSY3NjXwSghuJE3UUTf
         6RWg==
X-Gm-Message-State: AOAM530L8oAFhC5E13C1Cz+11G9t8mHyfd9MSYVo4jKxZABXK1r9Zom2
        az30YmGAd9sgeAShgs/DwCsiTNnj89MqdKIWSAROig==
X-Google-Smtp-Source: ABdhPJxnFG2DugVLK60AwmrDalmpmQqkvFKIGWSVQHOafTPwk0I2IdQp3piFHA5/gW/RLSZD7kO2LdmYovrmC1piAFA=
X-Received: by 2002:a05:6808:909:: with SMTP id w9mr9094084oih.164.1631563266294;
 Mon, 13 Sep 2021 13:01:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 13:01:05 -0700
MIME-Version: 1.0
In-Reply-To: <1631167288-27627-3-git-send-email-skakit@codeaurora.org>
References: <1631167288-27627-1-git-send-email-skakit@codeaurora.org> <1631167288-27627-3-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 13:01:05 -0700
Message-ID: <CAE-0n50068QZCp8q_jf_S5VdPoPj8um=dHh=5FEGF7nr0fEmjw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting satya priya (2021-09-08 23:01:28)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 371a2a9..434c1c6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -239,6 +239,26 @@
>         cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
>  };
>
> +&soc {
> +       gpio_keys {

Should be gpio-keys. Node names shouldn't have underscores. Typically
underscores are replaced with dashes.

> +               compatible = "gpio-keys";
> +               label = "gpio-keys";
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&key_vol_up_default>;
> +
> +               vol_up {

Should be vol-up or volume-up.

> +                       label = "volume_up";
> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +                       linux,input-type = <1>;
> +                       linux,code = <KEY_VOLUMEUP>;
> +                       gpio-key,wakeup;
> +                       debounce-interval = <15>;
> +                       linux,can-disable;
> +               };
> +       };
> +};
> +
>  &uart5 {
>         status = "okay";
>  };
> @@ -284,6 +304,17 @@
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
> +&pm7325_gpios {
> +       key_vol_up_default: key_vol_up_default {

Should be key_vol_up_default: key-vol-up-default {

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
