Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3225A32B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 20:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfF1SIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 14:08:24 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:36265 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfF1SIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 14:08:24 -0400
Received: by mail-pl1-f175.google.com with SMTP id k8so3665368plt.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=G6tQj9JGt5eWV6Usl/0DEM4bXR28Xsa6XudzWBZRees=;
        b=urIYMQLw7SgSurMotfZfSVmJc67vOh9HFHgSKGv5VupzUseVTLEXmT4xdsJnI7M+T9
         OYncOZk2MSaN8ehZkyEwnW0GdRndb+7sm1ngQeAfY47Axmo6TSzaIf/nq+y0zynVLrLy
         d/hK3wpwurXP4dybCFCwbMvYbG6iyoDoOem9/C+obwD/e34nssT8ZZ3OA7s+Zs3MHQFZ
         zNKOsouJEhQWT5wUUBmyfWd39S7QVEZR1e3BRaQbNsI8/cIRgBUyKA9EmGXPaUwwGfB3
         sk9Rl/U+Ol/TSHTDqiU7H9KoeYDOoMZc1vsZ+4sdoItr/3X0owjcXhKSfZgcTnEf66qY
         hhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=G6tQj9JGt5eWV6Usl/0DEM4bXR28Xsa6XudzWBZRees=;
        b=AiWCvpaCgpXGq4krhBviagHD1DUe75qTSDlHTYb85qtkFrxBqmPIQ+XKboVPPKlvrF
         YkTfuW1KPdicGremxDmr0aMWJFbbL/IeTiUXVDAXjwW7p5Um+Rc8+tgFf26gY02FJ1wh
         GuU/REwOBmsHPgRrO7MSmX4zdXXVaxedlvcou+p+p+3wq3tAuW1+tPMCFpEL9ppaD6u8
         QU2RahY5Fmpe/BFwyyntbqNH5OXQ23I8OelGlXlBFGkh61uS/aiScLbSa2NzHDIscTSh
         n8pHixm7nPha4ElFksqRPEnFFSPdLuoDDGxPUjzx+cUVsQyl5A2ioI/y7KzZ+22SMKMW
         upGQ==
X-Gm-Message-State: APjAAAV0+8zzIiREqYtNVxDPHcAROQ1FEAJUP0KnghbJVKUZJUy3W2PX
        ANkBvBEOzaUybG/GGEFtaXPPaA==
X-Google-Smtp-Source: APXvYqwgMrO9KnbOghS1eRTPHzN/QExULWcHo+Axo7AlQFrSWdgK3st/zL/VsoC8WPYxv1TleZVDSg==
X-Received: by 2002:a17:902:a414:: with SMTP id p20mr12470690plq.187.1561745303607;
        Fri, 28 Jun 2019 11:08:23 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id 196sm4065985pfy.167.2019.06.28.11.08.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 11:08:23 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 12/14] arm64: dts: meson-g12a: enable DVFS on G12A boards
In-Reply-To: <20190626090632.7540-13-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-13-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 11:08:22 -0700
Message-ID: <7himspr3ah.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Enable DVFS for the U200, SEI520 and X96-Max Amlogic G12A based board
> by setting the clock, OPP and supply for each CPU cores.
>
> The CPU cluster power supply can achieve 0.73V to 1.01V using a PWM
> output clocked at 800KHz with an inverse duty-cycle.
>
> DVFS has been tested by running the arm64 cpuburn at [1] and cycling
> between all the possible cpufreq translations and checking the final
> frequency using the clock-measurer, script at [2].
>
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

[...]

> @@ -297,6 +316,34 @@
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};

Just curious where this max clock transtion (clock-latency) value came
from.  Were you able to measure that somehow?

Kevin
