Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CDC580DFA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 09:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiGZHjf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 03:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238721AbiGZHj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 03:39:29 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED67227
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:39:28 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c72so13825747edf.8
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEjW3i53nKNwGgy6cdoU4iYrfg/JG+EZsIOg15Y2598=;
        b=q08Ica0QN0KRMr7WSTZVZNIgnwVKvcIu3vY/44tuPF8ntRGYItJFz2s+mJ/7PEc1uz
         NvJ8UXvxMVQ+puLSgjEgLumLHq91P5Yky9o4ran2MXCCEunJx2laVEtpNTQlByIupKjm
         xL1Rr4GVtAosU0rrgYkWEMl/Nn9ZPFQ/LVDsgHTngj882rwfikDwyaGjH3Uc0+5C+fkU
         SSmE/cLOBZVAr7pzFXyKtV9dnd+7DBb+/0nMwMXTEdv0xW44rbjGHyKYMLvc6CDEzUVN
         sOnrdq8kMeLs4VFLNmvVZRvTieWUIMPlTcc7pDMzS+t6iVOElzYkkwy1OMGw3h2hjNS6
         6Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEjW3i53nKNwGgy6cdoU4iYrfg/JG+EZsIOg15Y2598=;
        b=48E9LTmOGyTy5ovYMB2HS7hC+49jHJBAp8b7pJl3r6luXVKCiwyMfsTIAl21CaViLK
         1MMPfbz+z8EAgayn5T5LcDT78BViHNqfG919zZkcY85t+s9pw7YT+8YDdYWdlzyisYmc
         BmRgsyu3vEEkM4M0+auqPF7mB+G9Y8F/Z35Z5CSOlwCL5H2Q0KX1NaltJkgskDook7cI
         duNQxWnKFaP4ZlJx7NoWkdNLYlRxZDVXDfN/kcK29hkr9SIx1DX4EYC4HgMU9jCceGDj
         jQYJdQ0BdnLBkH1BQ/9EP6aavG+TmVr9Yg7WilFufJFOuUom+MVxko421a0+/QfLKvZk
         wACQ==
X-Gm-Message-State: AJIora/Yu4QF27n9g2s0w34GimtkMsv8tyzBiLWyzRAkSeNZXgJ7sxoH
        0vr8wmmqeylyHfOl70wd2w3R6Ykz7zKXmlXeZTQGEw==
X-Google-Smtp-Source: AGRyM1v4yFM64+Nd541eqrpmfdVCkO23Y5SjKq/UnG9Ji1uBt6NgEII7NA9Jd0ck878HjBdPfQmUul5EWbbjG2P5R8w=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr17047458edb.46.1658821167280; Tue, 26
 Jul 2022 00:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220719182647.9038-1-gaoxin@cdjrlc.com>
In-Reply-To: <20220719182647.9038-1-gaoxin@cdjrlc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:39:16 +0200
Message-ID: <CACRpkdYPfszs9LTDjV1zmO2OcbfCF7CeNBSo5y8syK_C_+u_Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl:Missing a blank line after declarations.
To:     Xin Gao <gaoxin@cdjrlc.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.com,
        andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Xin!

Top-posting because you missed to include the mailing list.

The patch is fine though, so applied!

Yours,
Linus Walleij

On Tue, Jul 19, 2022 at 8:27 PM Xin Gao <gaoxin@cdjrlc.com> wrote:

> Missing a blank line after declarations.
>
> Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-mvebu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
> index a1f93859e7ca..8ef0a97d2bf5 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
> @@ -96,10 +96,12 @@ static struct mvebu_pinctrl_group *mvebu_pinctrl_find_group_by_name(
>         struct mvebu_pinctrl *pctl, const char *name)
>  {
>         unsigned n;
> +
>         for (n = 0; n < pctl->num_groups; n++) {
>                 if (strcmp(name, pctl->groups[n].name) == 0)
>                         return &pctl->groups[n];
>         }
> +
>         return NULL;
>  }
>
> @@ -108,6 +110,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_setting_by_val(
>         unsigned long config)
>  {
>         unsigned n;
> +
>         for (n = 0; n < grp->num_settings; n++) {
>                 if (config == grp->settings[n].val) {
>                         if (!pctl->variant || (pctl->variant &
> @@ -115,6 +118,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_setting_by_val(
>                                 return &grp->settings[n];
>                 }
>         }
> +
>         return NULL;
>  }
>
> @@ -123,6 +127,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_setting_by_name(
>         const char *name)
>  {
>         unsigned n;
> +
>         for (n = 0; n < grp->num_settings; n++) {
>                 if (strcmp(name, grp->settings[n].name) == 0) {
>                         if (!pctl->variant || (pctl->variant &
> @@ -130,6 +135,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_setting_by_name(
>                                 return &grp->settings[n];
>                 }
>         }
> +
>         return NULL;
>  }
>
> @@ -137,6 +143,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_gpio_setting(
>         struct mvebu_pinctrl *pctl, struct mvebu_pinctrl_group *grp)
>  {
>         unsigned n;
> +
>         for (n = 0; n < grp->num_settings; n++) {
>                 if (grp->settings[n].flags &
>                         (MVEBU_SETTING_GPO | MVEBU_SETTING_GPI)) {
> @@ -145,6 +152,7 @@ static struct mvebu_mpp_ctrl_setting *mvebu_pinctrl_find_gpio_setting(
>                                 return &grp->settings[n];
>                 }
>         }
> +
>         return NULL;
>  }
>
> @@ -152,10 +160,12 @@ static struct mvebu_pinctrl_function *mvebu_pinctrl_find_function_by_name(
>         struct mvebu_pinctrl *pctl, const char *name)
>  {
>         unsigned n;
> +
>         for (n = 0; n < pctl->num_functions; n++) {
>                 if (strcmp(name, pctl->functions[n].name) == 0)
>                         return &pctl->functions[n];
>         }
> +
>         return NULL;
>  }
>
> --
> 2.30.2
>
