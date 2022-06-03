Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A073F53C8A4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 12:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243629AbiFCK3D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 06:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234520AbiFCK26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 06:28:58 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA17366A3
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 03:28:57 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2ff7b90e635so77693517b3.5
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 03:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dC0gx01b2aNajXfhT3RxUnH0OHK3FMPo/gpngxGlMwo=;
        b=oG7zOFP1DbQh6Bo8e9Qpq/xhX0tcm0Z686SDBT7H504JhHxqE3dnOrHBJ6SB/2HSK4
         twuSJO1lPcK5rLD3Hh+gKG0l3jtSoA8EYExYCLiyANJoCWRY1XSu31iiJqtN8JeP4jR5
         KeCcRWNG8k0cKAwK+B8C+LiKyAUIyY35Rc2HDoJNL490sEJzAybFKJGosi2vB+5kM2fb
         CkFMly+sSSmDyfTmzvsm3PvJr8kwCzkRW05trOUye05ZR8AscObGzjpJwvBL/YOzAVbN
         0mw8bc8FHPkItci37uxaWwIcZPeZfUqrdb+ftP4a7ZovA0miQgbeVm9d2jAyuRTdKt0d
         Do2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dC0gx01b2aNajXfhT3RxUnH0OHK3FMPo/gpngxGlMwo=;
        b=mLn+uBdJX9xju+8xoHXVy/EgxK+I2qHVMZJ4FEW0GvYhaIiYHZZNhFAb0mzR47LOtQ
         tXXgQ+HpQWRA1zpMXsEK+OtIh4JPhlltKQYc7kYb6Hfw/Pz84VTwviO2unGvbrndwPw5
         FYfZM8PL66Pk+4SLB0Q+TRi21pgG+1btlj212i7YRtz8H3BvbcsH7fa03D7tJf64RCLw
         feJuO/EHx9cvRkpyCe+k6Y8+0s9NU8t01TTEarbvbTWyeLpGW0ThCB+BBUxjIE67mmHO
         pEiP22BZ00XFzffMVYSZrRQ+cutIhO479SzxTFuOsokZhY+V62w/ZVPwY2XvszJK2psO
         Sw4g==
X-Gm-Message-State: AOAM532I48lGhLWUxO9m7Pshn5Gq2B3wW5EqVr8D5mOK08Fx6G7QSSK1
        gn2J5dhoiM1r53sDTWYR/lvwwiSI97cr6rDqbMLFQA==
X-Google-Smtp-Source: ABdhPJxdb0406KtQA0ekY0TlTv81qQUxI5O/FyeeUoVHX8/Ot2ByU9RnuJwh7E4wA3eNsSCbGkhyW44rUkeitrBqRsM=
X-Received: by 2002:a0d:e246:0:b0:30c:5e77:7104 with SMTP id
 l67-20020a0de246000000b0030c5e777104mr10997642ywe.448.1654252136425; Fri, 03
 Jun 2022 03:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com> <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Jun 2022 12:28:45 +0200
Message-ID: <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant
 data for adsp based targets
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 1, 2022 at 12:30 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

So one way to just use a propert and avoid more compatible strings:

> Add compatible string and lpi pinctrl variant data structure for adsp
> enabled sc7280 platforms.
> This variant data structure rnd compatible name required for
> distingushing ADSP based platforms and ADSP bypass platforms.
> In case of ADSP enabled platforms, where audio is routed through ADSP
> macro and decodec GDSC Switches are triggered as clocks by pinctrl
> driver and ADSP firmware controls them. So It's mandatory to enable
> them in ADSP based solutions.
> In case of ADSP bypass platforms clock voting is optional as these macro
> and dcodec GDSC switches are maintained as power domains and operated from
> lpass clock drivers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 2add9a4..c9e85d9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>         LPI_FUNCTION(wsa_swr_data),
>  };
>
> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {

Remove static and export this struct in drivers/pinctrl/qcom/pinctrl-lpass-lpi.h

> +       .pins = sc7280_lpi_pins,
> +       .npins = ARRAY_SIZE(sc7280_lpi_pins),
> +       .groups = sc7280_groups,
> +       .ngroups = ARRAY_SIZE(sc7280_groups),
> +       .functions = sc7280_functions,
> +       .nfunctions = ARRAY_SIZE(sc7280_functions),
> +       .is_clk_optional = false,
> +};


>  static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>         .pins = sc7280_lpi_pins,
>         .npins = ARRAY_SIZE(sc7280_lpi_pins),
> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>                .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>                .data = &sc7280_lpi_data,
>         },
> +       {
> +               .compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> +               .data = &sc7280_adsp_lpi_data,
> +       },

Drop this and instead add some code in the probe()
in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
lines:

if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
of_property_read_bool(np, "qcom,adsp-mode))
     data = &sc7280_adsp_lpi_data;

Yours,
Linus Walleij
