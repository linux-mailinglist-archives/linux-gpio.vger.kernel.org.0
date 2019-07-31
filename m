Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357DA7BEDD
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 13:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfGaLF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 07:05:58 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45986 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfGaLF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 07:05:58 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so8382066lfm.12;
        Wed, 31 Jul 2019 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xh7+I44XODvrUm1AKTaY/tJPp16IcuiRq+in3m/gPS4=;
        b=F93AdRHqbB5EptGT0gQxz+8oWrHkHoHjBeUkvDYCWOpIPKGTPON9CQzxrMmyEQAMoK
         HM3+Q9YBo3+UCaGadNzlWVQqW/F3dk83D4KJH5Iw33AFikYeyqaHcou9J6b9Pl5H54LT
         Jk8/TN5s0I1dQQ7xWphcSBup8AETRtnGceOD/dV6ACyvG76s4CYhgp744cWZI8aV1RRP
         A8DHdjNXSEomhh6XdSnAHlS0UMIuw0O3j4eLg97/pnRgWczItQCegDA2QkiEe+luMcod
         NFSrDMRfoeVT3XKhQI0t4MTN88C2PVYYTpBybnp/5G0CBUYFMjylBhf9StwlCQtCr4MN
         9iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xh7+I44XODvrUm1AKTaY/tJPp16IcuiRq+in3m/gPS4=;
        b=F1lEowywH8u0wjCVAWzbC1u27JhvV+zae7pOOAYOOeyKt0fu1k/3CFMiUy3pKpQNhh
         eg1Y49yb0M6VDs+aLQGgZXkL8ZLkvWLFssNAifhzteXZX/KQIrDFeCo3BWE8AZbSw5Xy
         Z4RTcPy9NIUHa8tg+LUSPTyYdSh3DQruxuZjmc56T1PK3Sf8wXj5rgmfP0ORtl7xkiga
         abZrVnFxBH46aofvwvvsu5N8LxV92eG8YUDXyXzgDK+Rt1un5Jlmm4cJliI6lpaiAhdZ
         CnwaRjZNrop5qXSLDUWdD/hWe69x+N5SGeH8sLbWIqxJUskpkBgDA4/bQ+0cPAh+hnBf
         Ngdw==
X-Gm-Message-State: APjAAAW74nVgDRMDbQ/IUBwfj6y16xHGqmWQwdorPgLbiwrJMuHGOgq1
        VKX7imqS1k3pqCDuMPsoqApkd4GD
X-Google-Smtp-Source: APXvYqynuGcdQPROENyCIRVih3PE0AUm8mzGeoaa84M8GEyZeYcPwyZxT5TFcsJZuLj6lJndCe/mAg==
X-Received: by 2002:ac2:4a78:: with SMTP id q24mr14580853lfp.59.1564571155523;
        Wed, 31 Jul 2019 04:05:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id z30sm13214645lfj.63.2019.07.31.04.05.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 04:05:54 -0700 (PDT)
Subject: Re: [PATCH v7 16/20] arm64: tegra: Enable wake from deep sleep on RTC
 alarm
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
Date:   Wed, 31 Jul 2019 14:04:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch updates device tree for RTC and PMC to allow system wake
> from deep sleep on RTC alarm.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 659753118e96..30a7c48385a2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -768,7 +768,8 @@
>  	rtc@7000e000 {
>  		compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>  		reg = <0x0 0x7000e000 0x0 0x100>;
> -		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&pmc>;
>  		clocks = <&tegra_car TEGRA210_CLK_RTC>;
>  		clock-names = "rtc";
>  	};
> @@ -778,6 +779,8 @@
>  		reg = <0x0 0x7000e400 0x0 0x400>;
>  		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>  		clock-names = "pclk", "clk32k_in";
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
>  
>  		powergates {
>  			pd_audio: aud {
> 

Is this a backwards-compatible change? Or it's not really worth to care
about the compatibility with older kernel versions, I'm not sure about
overall state of T210 in the upstream kernel.
