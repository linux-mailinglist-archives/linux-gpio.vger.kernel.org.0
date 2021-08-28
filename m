Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65F83FA5C9
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Aug 2021 15:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhH1NL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Aug 2021 09:11:27 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:38391 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbhH1NL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Aug 2021 09:11:26 -0400
Received: from [192.168.1.101] (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 78E9A3E7BD;
        Sat, 28 Aug 2021 15:10:33 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add SM6350 pinctrl driver
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210828125112.14721-1-konrad.dybcio@somainline.org>
 <20210828125112.14721-2-konrad.dybcio@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <b96e0d11-8c05-9850-c4d9-69f3ce6f9f19@somainline.org>
Date:   Sat, 28 Aug 2021 15:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210828125112.14721-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 28.08.2021 14:51, Konrad Dybcio wrote:
> This adds pincontrol driver for tlmm block found in SM6350 SoC
>
> This patch is based on downstream copyleft code.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Add .wakeirq_dual_edge_errata = true
>
>  drivers/pinctrl/qcom/Kconfig          |    9 +
>  drivers/pinctrl/qcom/Makefile         |    1 +
>  drivers/pinctrl/qcom/pinctrl-sm6350.c | 1593 +++++++++++++++++++++++++
>  3 files changed, 1603 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6350.c


I forgot to add Bjorn's r-b [1], sorry for that.


Konrad


[1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20210820203751.232645-3-konrad.dybcio@somainline.org/#24400233

