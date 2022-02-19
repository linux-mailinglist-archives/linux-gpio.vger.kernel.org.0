Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3374BC4ED
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 03:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241112AbiBSCiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 21:38:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239045AbiBSCiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 21:38:25 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA796006C
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 18:38:07 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id g6-20020a9d6486000000b005acf9a0b644so3185573otl.12
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 18:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Q/d8d9FtvFLvr7ME3dVsj5LqYy1sSgbi/qeJ46Jm0aU=;
        b=igmVvA+pynBNZ+OpRVvuE3rxbpMYu4Wko1Nb6whyoNL4U/mFTtIz7mOzAWv8suyjpg
         qQkhX/GISFBC0mmukyAFo+aDL4DzmLx/DPsYOXeuQi4mp03agz3Vm0yt029c2g1miors
         6iDhXOSShbGUBPVzQ64qq73tiFAOrEqNVneUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Q/d8d9FtvFLvr7ME3dVsj5LqYy1sSgbi/qeJ46Jm0aU=;
        b=Pe9uLKbhLpFe8F/BkjGSBxSrHPDAvxk+NLfOYCPV+1Cezs2KLcIkIuQQu+sLvzgmd5
         Uz48n//v38GxSLkDOAdGdg3ZTVOTnkM3iu6hu8Rvr+O4hPnPWGAEcjsrxBCSKdWBsNLG
         r/uOX7Wk4Ni1hFbOmpS4Ob2+CBMguU4rdKHZ10KbpMkCjc6JbTJZ8SpD/BXTQWKnAgOZ
         iAvgYvk9TpRLOqKcni9eEvwHjl+mGVo0dJgOl2g2Rwr7xO6Etjp5nFyBY6VBoZGMQmN5
         0cA+jUlYAW5mbGwZ+frt9aXEa2hbHDt+wWgh0MFTTnJDfuaPCn3iD7YTACXGz3CyP1aU
         5OzA==
X-Gm-Message-State: AOAM5329ka6ytoQm+dsyffrPWRcewoPjEPqtL6nXt5CEWllOXRtDgmnT
        5srJZKxTRDfrPzq+IrSQzSTh2pl2183Z+0DyyB+9vQ==
X-Google-Smtp-Source: ABdhPJwDM7ap6YfqY8vNs89NKhqKuvxAmqVdqaPWrzkpraWmJ8qaQAj6OBhQJRKTB417QMhc9jcNWYtgJWlO7UpCuyo=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3361118ota.159.1645238286645; Fri, 18
 Feb 2022 18:38:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:38:06 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-5-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:38:06 -0800
Message-ID: <CAE-0n51vhcUg5ng7FWzS0-09-zazCk5JKwpvLPfK4w15_r97kw@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] pinctrl: qcom: Update lpi pin group structure
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:51)
> @@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
>         LPI_MUX__,
>  };
>
> -static const unsigned int gpio0_pins[] = { 0 };
> -static const unsigned int gpio1_pins[] = { 1 };
> -static const unsigned int gpio2_pins[] = { 2 };
> -static const unsigned int gpio3_pins[] = { 3 };
> -static const unsigned int gpio4_pins[] = { 4 };
> -static const unsigned int gpio5_pins[] = { 5 };
> -static const unsigned int gpio6_pins[] = { 6 };
> -static const unsigned int gpio7_pins[] = { 7 };
> -static const unsigned int gpio8_pins[] = { 8 };
> -static const unsigned int gpio9_pins[] = { 9 };
> -static const unsigned int gpio10_pins[] = { 10 };
> -static const unsigned int gpio11_pins[] = { 11 };
> -static const unsigned int gpio12_pins[] = { 12 };
> -static const unsigned int gpio13_pins[] = { 13 };
> +static int gpio0_pins[] = { 0 };

Why do we lose const?

> +static int gpio1_pins[] = { 1 };
> +static int gpio2_pins[] = { 2 };
> +static int gpio3_pins[] = { 3 };
> +static int gpio4_pins[] = { 4 };
> +static int gpio5_pins[] = { 5 };
> +static int gpio6_pins[] = { 6 };
> +static int gpio7_pins[] = { 7 };
> +static int gpio8_pins[] = { 8 };
> +static int gpio9_pins[] = { 9 };
> +static int gpio10_pins[] = { 10 };
> +static int gpio11_pins[] = { 11 };
> +static int gpio12_pins[] = { 12 };
> +static int gpio13_pins[] = { 13 };
>  static const char * const swr_tx_clk_groups[] = { "gpio0" };
>  static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>  static const char * const swr_rx_clk_groups[] = { "gpio3" };
