Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCAB2E2CC9
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Dec 2020 02:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgLZBAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Dec 2020 20:00:37 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:53107 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgLZBAh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Dec 2020 20:00:37 -0500
X-Greylist: delayed 501 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Dec 2020 20:00:36 EST
Received: from [192.168.1.101] (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7CDF71F98B;
        Sat, 26 Dec 2020 01:51:28 +0100 (CET)
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Add support for Stromer
 PLLs
To:     Varadarajan Narayanan <varada@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, nsekar@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sricharan@codeaurora.org
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-2-git-send-email-varada@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <51544129-a04e-16a2-64e5-e004ea19bf8c@somainline.org>
Date:   Sat, 26 Dec 2020 01:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1601270140-4306-2-git-send-email-varada@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, are you going to resubmit this patch? Looks like MDM9607 uses Stromer PLL for its CPU clocks and could benefit from it.


Konrad

