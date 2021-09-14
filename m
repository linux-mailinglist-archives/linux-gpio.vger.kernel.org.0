Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6668B40B83D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 21:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhINTjg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 15:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhINTjf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 15:39:35 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A81AC061762
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 12:38:18 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso109005ota.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MLQfJAb2nshbl/BB+0CPYD8WzePweEOPxKjryODlhBY=;
        b=fU+2fUmhgATKS8sAffT3oVU6G2cnoZkbVdK4P3jZkCaJb9Xfxl7zEis23p11wyRKLT
         gevV9/SEA5s4KPdSYD/V458UJayvvtRbj36OivXuugfYVP8wsl59bEM5GB4iKnz7Luph
         dlhHwKeU4rYMBNLJ08Mo9iphxOG4w0qe+9FXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MLQfJAb2nshbl/BB+0CPYD8WzePweEOPxKjryODlhBY=;
        b=GQI1EXfCy533/y4brNHhRQijxAWaptjJzXDe29Odiy9qshW+vL2gocJ1viR7FjmUzx
         5Ad7534aDNQxg0pKFWmFi/mYe3ccs2VKyPxuiP75surGXZI2/bGmG42UaS7b3AAL/1vv
         DAAEt+trn8jKckAKSc/USFa9HECbWyTzebuo9P1Ac6UNIM5j3XuE2OrF60wCH+RXsP+G
         HtjPT0Ue5bvvrQYfTNiwLaLN0MjJfCwKCgPcwnIBTwDNXa7W0qc68M4rMXgvwS0yAujr
         HI7NBPV+CAqOzZn10t6657Pu5m8sUw/pmf44H5a4X9ST1r/2Fd2HfSn7dwAR/Ub12UW2
         txRA==
X-Gm-Message-State: AOAM533trmYVDsRm9r5bdsQjDtR23nnNQzMrk62pCFTyehm21J5o21q1
        yyiiIBXGEM8OEXB3RgN3fiKO5urp026cr1paoa7QwQ==
X-Google-Smtp-Source: ABdhPJxur0KKzVgNz/Rt1leSMplGKbq52Yi9bMuRCAElrwUadKtFKUESc7Cpo+vzi77WMrUS5VZsmr6ZB/ewu6AFCd0=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr16212633ots.77.1631648296004;
 Tue, 14 Sep 2021 12:38:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 12:38:15 -0700
MIME-Version: 1.0
In-Reply-To: <1631624108-15491-3-git-send-email-skakit@codeaurora.org>
References: <1631624108-15491-1-git-send-email-skakit@codeaurora.org> <1631624108-15491-3-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 14 Sep 2021 12:38:15 -0700
Message-ID: <CAE-0n53z4SmMAM4VfY+beCHNzpYfQN7+LsXJBGXC3+7Lm-s1XA@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
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

Quoting Satya Priya (2021-09-14 05:55:08)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 371a2a9..003112f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -239,6 +239,26 @@
>         cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
>  };
>
> +&soc {
> +       gpio-keys {

This should be in the root node, not soc node as it doesn't have any reg
property. Please move it to / and put it at the top of the file.

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
