Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0533300AA
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Mar 2021 13:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhCGMC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Mar 2021 07:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCGMCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Mar 2021 07:02:00 -0500
X-Greylist: delayed 441 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 Mar 2021 04:02:00 PST
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111D5C06174A
        for <linux-gpio@vger.kernel.org>; Sun,  7 Mar 2021 04:02:00 -0800 (PST)
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DB04A1F6B4;
        Sun,  7 Mar 2021 12:54:35 +0100 (CET)
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
To:     Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-3-shawn.guo@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <adf598dc-d000-15d1-d14d-b782455507f2@somainline.org>
Date:   Sun, 7 Mar 2021 12:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304060520.24975-3-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, 

>  
> +static const int sc8180x_acpi_reserved_gpios[] = {
> +	0, 1, 2, 3,
> +	47, 48, 49, 50,
> +	126, 127, 128, 129,
> +	-1 /* terminator */
> +};
> +
These can vary per device (unless Qualcomm is enforcing something on the SC platform), so I don't think hardcoding is a good option.. Isn't there any data being passed on which ones should not be touched?

Konrad
