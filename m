Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8417058A63A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 08:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbiHEG5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 02:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237253AbiHEG5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 02:57:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BB373936
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 23:57:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x39so2169809lfu.7
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2022 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xMkGLwqA1mZq7hExgTupMO8I0C9+XtTTkXpKuqm9Ujw=;
        b=DSeNS3jRZHgPZZ+INM8dpcAeWV8cIjv76LYbNH6dH08Z+9GSG6imrfAZmDRsgl9q2o
         l6MgySiyZik2m1y3WiLYUofInLCO+nLS9faaJVnw1PSYlEMQLo4ImCbxz0SnNJSCwRWd
         2uXF4myknLMbg59GhGMB337epFkNcvCDpSTfdlQxOEJ/5t8NQfdmHttAcWw/ZquIvnL6
         4A1Dbw0S/JakSggt5Dmr+QZRpCqAvgl6KFCnTEiSFI3IJxYg3sj3Hhu/7OP1DKIHun/+
         yhaIumIxYbLc9VHuU1n7yWI9eT70d/TzL8YUa62cejMfv/yHnFhkEt505mXlzY3Vf1J2
         GvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xMkGLwqA1mZq7hExgTupMO8I0C9+XtTTkXpKuqm9Ujw=;
        b=ZCzRbpOdCobcRQPY5xTvRip8bBrzpt0fwbF1qvbvlOw96NuhTFZIK53/nB+t1WZeQ1
         r9oajn5kAkPBjHEiQSD9FYnSUQ7Z6hxM676cE8HrBcJq34jS+433TqM7Z/eCS9vbY+Iy
         8MJvptAwS4mLfC5is60KcWW7d7G8Dicrwr2nnHtMYDFRai5UTCp0TUrcvJwcYGnAhsOl
         NjtmDlTE5368vlgqhgBpOPsN5kgKKiaAW7PxPEZ0M8EWifb+VtwwpoLQQutEVVREEq4B
         +rAdcIZMM+8EUQX1Uu3rxI+jvABQ2QbANT96Y5nViZZtjLtyB21IosdpuAM2oN6J2Vpf
         2VMg==
X-Gm-Message-State: ACgBeo3mejbSiX7j0RfJtgC2jjJmkzY9sXd5ym+ZKPO0SzVmhQov286s
        W1tTSZzBSzgvKeIJHhok/pCy/A==
X-Google-Smtp-Source: AA6agR6x2gIKuZ+sm8NQfXGc1OBDUj5wibHkXB/NWTPw0ZjTRxVF1vZy/vDgj1MbZ8INnZPMZDUSqQ==
X-Received: by 2002:a05:6512:2344:b0:48a:e5a8:3a6e with SMTP id p4-20020a056512234400b0048ae5a83a6emr1784338lfu.505.1659682648650;
        Thu, 04 Aug 2022 23:57:28 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id t8-20020a2e8e68000000b0025e77564a55sm269178ljk.42.2022.08.04.23.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 23:57:27 -0700 (PDT)
Message-ID: <c3060197-ef5c-ad41-1c18-9d39641d1ad6@linaro.org>
Date:   Fri, 5 Aug 2022 08:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 3/3] firmware: imx: add imx-scu GPIO driver
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220804184908.470216-1-shenwei.wang@nxp.com>
 <20220804184908.470216-4-shenwei.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804184908.470216-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/08/2022 20:49, Shenwei Wang wrote:
> The SCU firmware on i.MX8 platforms provides a set of APIs to
> control the GPIO PINs on the SCU domain. This patch implements the
> standard GPIO driver interface to access those PINs on the
> SCU domain over the SCU APIs.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/firmware/imx/Kconfig        |   6 ++
>  drivers/firmware/imx/Makefile       |   1 +
>  drivers/firmware/imx/imx-scu-gpio.c | 139 ++++++++++++++++++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644 drivers/firmware/imx/imx-scu-gpio.c
> 
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index c027d99f2a59..484c13f3149a 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -28,3 +28,9 @@ config IMX_SCU_PD
>  	depends on IMX_SCU
>  	help
>  	  The System Controller Firmware (SCFW) based power domain driver.
> +
> +config IMX_SCU_GPIO
> +       def_bool y
> +       depends on IMX_SCU
> +       help
> +         Say Y here to enable the imx8 gpio over SCFW MISC API

gpio driver go to drivers/gpio/

Best regards,
Krzysztof
