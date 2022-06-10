Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703E9546E05
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 22:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347206AbiFJUH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 16:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244918AbiFJUHz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 16:07:55 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A41723D5CA
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 13:07:54 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id y16-20020a9d5190000000b0060c1292a5b9so27450otg.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=c4MmH10o4nxyvNb+yLQx/gfjamZc60fdBQ6fL0rTVzI=;
        b=lc3Jw2kYMP3blVRs5hUBawz3Z348qfuHGhD4gAfTjY60kprFN86B288vsV0RzUZPx1
         L4vpiCkCaYKglDEWWttA+6QB56lkIvgoEWqjghhhgYk5Dw2nrJHkvcYYzn7Exz22MlEN
         w2i6N0ecijCkk2h7RfYLniM5gpudUcyROSG2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=c4MmH10o4nxyvNb+yLQx/gfjamZc60fdBQ6fL0rTVzI=;
        b=iAmJKoK2ZI8vV7XnrfOvg6CjyWOB/4Z1R2opfOTvgDpEYlASoRk5fodIR4THmMpQLN
         Y3YK4yCINoibM8n2IGmWYJuChTTmsyqI4dvoeUmJwXdMMKgJpT/T0guwFNrnRkCjeGcP
         2R1lrr+/x2JCe0/EZZMHEw0d5CkQB3ngfVka8F7ZVXvKSlwv0W6RKgNU3y/tB+BOTpdo
         IUZOym8t/p3pv2GTjG3dHF7N+ZzCzKvB32a6ksBMVqVF313UZvv4AMbO6Qgt8dRNeLJN
         PFnmFgouoBM0WZR8hmrMH0NMNht0obC1ojnjgq3/KGRuDrge2aZnxssw1uSpqaxrd5bl
         +m3w==
X-Gm-Message-State: AOAM533q4urwViMzPGRU0IW2Uv/wkZakLeZEciGEzKoCe66okGoZxns/
        /KVZhedIe0q2J4SHnexqv3cC4XrAbxtWf/YnWCSjQg==
X-Google-Smtp-Source: ABdhPJyQAhZjEcGLUr7co7U+cTdLJgv/8YL3LyUOYF93ir9ueFXa+ObQ+C+qbbjUI7BPoKwZJxHDMEdSN2VBIEC2EGs=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr73615otl.159.1654891673442; Fri, 10 Jun
 2022 13:07:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:07:53 -0700
MIME-Version: 1.0
In-Reply-To: <1654872335-4993-3-git-send-email-quic_srivasam@quicinc.com>
References: <1654872335-4993-1-git-send-email-quic_srivasam@quicinc.com> <1654872335-4993-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 13:07:52 -0700
Message-ID: <CAE-0n53TTyQ9FOcYCT-51wJZd2HP-VfAgTkGBk4gV3jawRPi1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: sc7280: Add clock optional check
 for ADSP bypass targets
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@quicinc.com, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-06-10 07:45:35)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 74810ec..6e03529 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -388,6 +388,9 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>         pctrl->data = data;
>         pctrl->dev = &pdev->dev;
>
> +       if (of_property_read_bool(np, "qcom,adsp-bypass-mode"))
> +               data->is_clk_optional = true;
> +

Or just

	data->is_clk_optional = of_property_read_bool(np, "qcom,adsp-bypass-mode");

>         pctrl->clks[0].id = "core";
>         pctrl->clks[1].id = "audio";
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 2add9a4..3fc7de1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -141,7 +141,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>         .ngroups = ARRAY_SIZE(sc7280_groups),
>         .functions = sc7280_functions,
>         .nfunctions = ARRAY_SIZE(sc7280_functions),
> -       .is_clk_optional = true,
> +       .is_clk_optional = false,

Just drop it as 'false' is the default.

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
