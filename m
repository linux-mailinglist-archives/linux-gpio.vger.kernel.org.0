Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101986F667
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfGUWZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:25:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39276 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfGUWZd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:25:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so35575763ljh.6;
        Sun, 21 Jul 2019 15:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M/F/QLxD+79GE01PfgQgLIp6/H8EJl99k1BFyNSSGcw=;
        b=ZZIxkgcda8P6Oa7+FiUF1L0lMTTvLvP8zV4ZdrJUZ/osAAHIS5RFMQ/2IJmuxIC6CZ
         YEeqtzJsafJ9lBhZ6syfTRbLMAfw3E2iXtQFemTFlnSqic5mvsvQSWJHpjl0T/gqOlwO
         FMPd1iHHjQbFRN2xroLrlM3j2S3ka+InPK1e9OJ3t5Ecpt1UPh8U5fuhJUBNjqtvoZvK
         xePrPPEoxqgV6+7OGCUeYhmZ+fAKOPLixBrGSSUOaRlkImwln9NYdHzQPr6TjIjjsq5A
         nFjB/+CMhFnIvkNbJCfY+ChSfmMjLUdFRa5LrDLDn5nrGBP+BYp2FD061rnIBg17p4eQ
         yWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M/F/QLxD+79GE01PfgQgLIp6/H8EJl99k1BFyNSSGcw=;
        b=LvxpQe2UXgdzKA7I41LOkL3joy0ymFwH366Si0Nlr44xL4Dfl71dfardAxumwNEUXH
         fX0D4J0skyFTBIqUrSKn20DwXCG8XfnPS7yv6BgLz3ePoHMGl94KV7V5rMmWI4VUgOsB
         BrwFdPSk4jS/k8YxA3g+ahs+/qhYL/Dk4yGK+zWuk/uIQdUIS5Ru2GoF2SW3vddTeR07
         Pg/BVGALZGeiMPP0SnUVQ2lrBN69JSxwMkL/EeW1bTltK6DpYH0ypTiIPUTzLsJ8euB1
         lnAFePnJMTHuGztF+GhYDkKq74BsSy7w2aYFYV7yrFwmtYgmCcRoLk8DFZNDhtBPo9jb
         k1cA==
X-Gm-Message-State: APjAAAWVe6YxZ4CmxobSdOUg4f4dYkUvHNcf8fjhFfGGjiuFqXBoKtkg
        bTlyqymrq+OlIx9ZB13eG7T8Qjhl
X-Google-Smtp-Source: APXvYqx9mkwyIOM+NdmPsGtuTSqUVxUqqglSo5hT0/HtqA0pe0g6uHoqQY1VKc+Pt8K6qOHcCDKPGA==
X-Received: by 2002:a2e:894a:: with SMTP id b10mr29729805ljk.99.1563747930505;
        Sun, 21 Jul 2019 15:25:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id e26sm5812693lfc.68.2019.07.21.15.25.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 15:25:29 -0700 (PDT)
Subject: Re: [PATCH V6 21/21] arm64: dts: tegra210-p3450: Jetson nano SC7
 timings
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-22-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <29137a3d-0463-2832-7484-caf768ed2bc9@gmail.com>
Date:   Mon, 22 Jul 2019 01:25:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-22-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:41, Sowjanya Komatineni пишет:
> This patch adds Jetson nano platform specific SC7 timing configuration
> in the device tree.

You should stat all names with a capital letter, hence "Jetson Nano" and
"Tegra" in all patches (commit title/message and code comments). When
unsure, just go to google and find how official name looks like.

> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 9d17ec707bce..b525e69c172a 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -382,6 +382,13 @@
>  
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode = <0>;
> +		nvidia,cpu-pwr-good-time = <0>;
> +		nvidia,cpu-pwr-off-time = <0>;
> +		nvidia,core-pwr-good-time = <4587 3876>;
> +		nvidia,core-pwr-off-time = <39065>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
>  	};
>  
>  	hda@70030000 {
> 

