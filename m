Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E4119C49
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 23:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfLJWX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 17:23:26 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:59316
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726883AbfLJWX0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 17:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576016605;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=5O6ko1wMdH3ZAe3za/gTc6jGmfe6ltuEFSuJCuFhaE4=;
        b=GLA7OuE3q9Ckno+URVzFLhwwkaR1ZO0GcthJbP9hE3K5Iy3A/R+Y/IjweHZlbnqs
        IU0rQ3Jjl18qRlEcZxQZBeGL0m4xLxCZIWxAwTbga+xv15hFfTqg5QhJi2oDYSsgpUI
        CKC02DOEdc9qqI9xzxSx6p1/ZMkQXbdT/g3zgljE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576016605;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=5O6ko1wMdH3ZAe3za/gTc6jGmfe6ltuEFSuJCuFhaE4=;
        b=OblpijPjBWaUnQ7iMx3O1+gAfDhdKUreQ2A/HCrikRbTsg2II3DukNQ/wKGgSqWG
        rergx1m0csTGoWf/5M5hZUQVmUjj68p8DKzpzzQnhHyV1OHGYOYpI9pdeFMhBxaLPLA
        /p4taTWJHMq2Gq9nR+kp23AYTMJxDAQ1LvTpYxWI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0090BC59948
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 10 Dec 2019 22:23:25 +0000
From:   Lina Iyer <ilina@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
Message-ID: <0101016ef1e8f0a2-c8311e64-3d6a-4b66-9121-6fa4d0a604df-000000@us-west-2.amazonses.com>
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
 <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-SES-Outgoing: 2019.12.10-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30 2019 at 01:07 -0600, Maulik Shah wrote:
>GPIOs that can be configured as wakeup sources, have their
>interrupt lines routed to PDC interrupt controller.
>
>Provide the interrupt map of the GPIO to its wakeup capable
>interrupt parent.
>
>Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Lina Iyer <ilina@codeaurora.org>

>---
> drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>
>diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
>index 6399c8a..8a2b97c 100644
>--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
>+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
>@@ -1097,6 +1097,22 @@ static const struct msm_pingroup sc7180_groups[] = {
> 	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x97b000, 9, 0),
> };
>
>+static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
>+	{0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
>+	{10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
>+	{24, 61}, {26, 52}, {28, 36}, {30, 100}, {31, 33}, {32, 81},
>+	{33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
>+	{41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
>+	{52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
>+	{59, 37}, {62, 110}, {63, 111}, {64, 74}, {65, 44}, {66, 93},
>+	{67, 58}, {68, 112}, {69, 32}, {70, 54}, {72, 59}, {73, 64},
>+	{74, 71}, {78, 31}, {82, 30}, {85, 103}, {86, 38}, {87, 39},
>+	{88, 45}, {89, 46}, {90, 47}, {91, 48}, {92, 60}, {93, 49},
>+	{94, 84}, {95, 94}, {98, 65}, {101, 66}, {104, 67}, {109, 104},
>+	{110, 68}, {113, 69}, {114, 113}, {115, 108}, {116, 121},
>+	{117, 114}, {118, 119},
>+};
>+
> static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> 	.pins = sc7180_pins,
> 	.npins = ARRAY_SIZE(sc7180_pins),
>@@ -1107,6 +1123,8 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
> 	.ngpios = 120,
> 	.tiles = sc7180_tiles,
> 	.ntiles = ARRAY_SIZE(sc7180_tiles),
>+	.wakeirq_map = sc7180_pdc_map,
>+	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
> };
>
> static int sc7180_pinctrl_probe(struct platform_device *pdev)
>-- 
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>of Code Aurora Forum, hosted by The Linux Foundation
>
