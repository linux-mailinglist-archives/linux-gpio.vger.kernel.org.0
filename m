Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0B12EA6C8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 09:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAEI4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 03:56:19 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:40554 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbhAEI4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 03:56:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609836960; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=KuJNnND9gNxn87Ys5RVKbNSQ/froZkWCUykAcB4+ZmA=; b=VER/6SgbdPFc27ziWZG0Y+lhqq+POXSd9hy6e5iXCs6C+ZitNp1X1jikHmW0B2RGwJJOtxE6
 EG/8DML409zmNCyXq1Ry5LEDpO4Mw4X6QlxGcBvmfOeWYQAxtoCbxQZGtCDvTwUu1srVAjf8
 infUuQdSKP9RzoGTg+bzjB2q2/4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ff42980b73be0303d4c5429 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 08:55:28
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37917C43464; Tue,  5 Jan 2021 08:55:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A7D5C433C6;
        Tue,  5 Jan 2021 08:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A7D5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=varada@codeaurora.org
Date:   Tue, 5 Jan 2021 14:25:16 +0530
From:   Varadarajan Narayanan <varada@codeaurora.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, nsekar@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 1/7] clk: qcom: clk-alpha-pll: Add support for Stromer
 PLLs
Message-ID: <20210105085515.GA30147@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-2-git-send-email-varada@codeaurora.org>
 <51544129-a04e-16a2-64e5-e004ea19bf8c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51544129-a04e-16a2-64e5-e004ea19bf8c@somainline.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 26, 2020 at 01:51:28AM +0100, Konrad Dybcio wrote:

Konrad,

> Hi, are you going to resubmit this patch? Looks like
> MDM9607 uses Stromer PLL for its CPU clocks and could
> benefit from it.

Yes. But will take some time since we are held up with
additional activities.

Thanks
Varada

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
