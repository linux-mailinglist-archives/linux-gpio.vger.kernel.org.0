Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01AC150342D
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Apr 2022 07:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356558AbiDOXdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Apr 2022 19:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239177AbiDOXdd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2022 19:33:33 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EDE46B29
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2022 16:31:01 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d15so8126331pll.10
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2022 16:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JK6vmV6CXxSuLt5gndd3I1PiZrARcDydn2Wml9uJek8=;
        b=f/GXfSwM+5LX/W7A1esUlhdeSMjoxf1vJrysnBaF+q9BlCzCoB9Uqgs/oQoHFeGBbG
         HN/LUnNyWa4ZWN7AOwZ0ZwIhHs6BKIEtSPOdjpBTOLprCH4vf9iZWhd5lxPYKN4EeBxX
         +vHUTD/PYLRWSbsAQf5HaTBEls5y1dy9o1+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JK6vmV6CXxSuLt5gndd3I1PiZrARcDydn2Wml9uJek8=;
        b=SnuCqujkXJM2PXAZ3XPs4vpiX3+g50kujujQt07r0gBWT5ILAYYR2KOnBs1CZHaRk6
         +yzB+4m7zC6rGFKKBZupYh1dmI3kvKq00kGk0PIjIFvTzq1M6XXXPhYbhqMZ9UZTI0RR
         DVu1t1siAryrR46K9osqzU3ZV36burcSrxqsjUtQO0ZreFd40ztULOWNYOuACLRAdSCZ
         tWoj/KPFX9dqLsRFVf0PsU/rxp7+j/EgWX8pb3HmvzXIa2BXozF+7W+sqkyaBz8G3JO4
         kS7N0xoQzHxGuLUYoRA5FIcmghpB+HiN5e/mXtHi+qvf/cal+OpWNkpscMiM7AFrHUFL
         NloA==
X-Gm-Message-State: AOAM533KfgE8UewctcKhS6n61Sx5Tnd2ojHjy720xMEcGvS6Zmn4JTHL
        B2fEk6nPvpUiqM1UIO00h51n2g==
X-Google-Smtp-Source: ABdhPJwpzWjVGLQj1ej7a1CNmp4Aw0aH9mAFpi57+mfdJpa3vF8S709hIIbPjez02GS3l1QWAJhWuQ==
X-Received: by 2002:a17:90a:e7ca:b0:1d1:22ce:86c3 with SMTP id kb10-20020a17090ae7ca00b001d122ce86c3mr4346128pjb.10.1650065460896;
        Fri, 15 Apr 2022 16:31:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
        by smtp.gmail.com with UTF8SMTPSA id i5-20020a17090a2a0500b001cba3ac9366sm9571478pjd.10.2022.04.15.16.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 16:31:00 -0700 (PDT)
Date:   Fri, 15 Apr 2022 16:30:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v12 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
Message-ID: <YloAMeEdb2kGvDSY@google.com>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-7-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1647447426-23425-7-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 16, 2022 at 09:47:05PM +0530, Srinivasa Rao Mandadapu wrote:
> Add pin control support for SC7280 LPASS LPI.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

>
> ...
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> new file mode 100644
> index 0000000..d67ff25
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>
> ...

> +/* sc7280 variant specific data */

nit: the comment is a bit redundant in a sc7280 specific driver

> +static const struct pinctrl_pin_desc sc7280_lpi_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +	PINCTRL_PIN(14, "gpio14"),
> +};
> +

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
