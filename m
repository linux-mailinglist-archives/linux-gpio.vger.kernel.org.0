Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7B1119C51
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 23:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfLJW1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 17:27:25 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:60998
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfLJW1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 17:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576016844;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=qs09g72P2WzVk9kLKtCbEP5yzZXU32zVewyt6/1ZN4c=;
        b=kqjOHnsTX2ImT7/4FP7DdoMUB5nfkElAn5lfjIGOr1BUXTNLbnOGdXR2SQbqbily
        +Jqr/eaEeeVBfMB3Ayoq5W7hM6swlmE+JVTpDKgSxbOit6qoCcR62rzwM1tpKBq7ueT
        0LiLyX53+lIJMROVszvtN46WIVAKPW7knAdLRV0I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576016844;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=qs09g72P2WzVk9kLKtCbEP5yzZXU32zVewyt6/1ZN4c=;
        b=IC44f+FS9xUHKxAV0bz6aLrPNMNm3SPR84JAo62z10KRmD3MDNydi2Cvu7H8jF7d
        CWZHQe8bgGVzVKiT4EYX2vgnzfNHsE4HFeqkQE7j7cOnBXqcptBunlwsGNTOIlJ0nvH
        LfoMSpM9b+yxd4PWBHzMThiyr+seyepHFOU993LA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8DA2C2BB50
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 10 Dec 2019 22:27:24 +0000
From:   Lina Iyer <ilina@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add wakeup parent for TLMM
Message-ID: <0101016ef1ec96ab-5815fb77-649a-4783-95ca-cc32d7161d47-000000@us-west-2.amazonses.com>
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
 <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-SES-Outgoing: 2019.12.10-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30 2019 at 01:07 -0600, Maulik Shah wrote:
>Specify wakeup parent irqchip for sc7180 TLMM.
>
>Cc: devicetree@vger.kernel.org
>Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Lina Iyer <ilina@codeaurora.org>

>---
> arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>index 69d5e2c..9040eee 100644
>--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>@@ -321,6 +321,7 @@
> 			interrupt-controller;
> 			#interrupt-cells = <2>;
> 			gpio-ranges = <&tlmm 0 0 120>;
>+			wakeup-parent = <&pdc>;
>
> 			qup_uart2_default: qup-uart2-default {
> 				pinmux {
>-- 
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>of Code Aurora Forum, hosted by The Linux Foundation
>
