Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9CB27BECE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 10:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgI2IFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 04:05:12 -0400
Received: from z5.mailgun.us ([104.130.96.5]:54182 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbgI2IFM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 04:05:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601366711; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=r+8Y1/iTY5V2CVTSF4MuhfKKHmbWKG8EGomgri5/hVc=; b=NnkQj28dFJSNd6IHEHYPeZwA/VAayI8+eKEcrxyRcL+JZrSyZ0azTBzCphBBpjdGNoeb0jhI
 ErQ7bSVFm99lwCW3e7fSSokv88JDrB2ChFkrsYushPBheQEV8vPaIJXy2qd524m/29uY4Lhx
 ONxXojYXIQNsYfqPWmGLPZp+ie8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f72ea9559892db41f51d014 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 08:04:37
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9616AC4339C; Tue, 29 Sep 2020 08:04:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D953C433CA;
        Tue, 29 Sep 2020 08:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D953C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=varada@codeaurora.org
Date:   Tue, 29 Sep 2020 13:34:26 +0530
From:   Varadarajan Narayanan <varada@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        nsekar@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org
Subject: Re: [PATCH 5/7] pinctrl: qcom: Add IPQ5018 pinctrl driver
Message-ID: <20200929080425.GA21805@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-6-git-send-email-varada@codeaurora.org>
 <20200928184322.GB71055@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928184322.GB71055@builder.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 01:43:22PM -0500, Bjorn Andersson wrote:
> On Mon 28 Sep 00:15 CDT 2020, Varadarajan Narayanan wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> [..]
> > +static const struct msm_function ipq5018_functions[] = {
> [..]
> > +	FUNCTION(qspi_clk),
> > +	FUNCTION(qspi_cs),
> > +	FUNCTION(qspi0),
> > +	FUNCTION(qspi1),
> > +	FUNCTION(qspi2),
> > +	FUNCTION(qspi3),
>
> Instead of having one function name per pin it typically leads to
> cleaner DT if you group these under the same name (i.e. "qspi")

Ok.

> Same seems to apply to sdc, wci, xfem at least.
>
> > +	FUNCTION(reset_out),
> > +	FUNCTION(sdc1_clk),
> > +	FUNCTION(sdc1_cmd),
> > +	FUNCTION(sdc10),
> > +	FUNCTION(sdc11),
> > +	FUNCTION(sdc12),
> > +	FUNCTION(sdc13),
> > +	FUNCTION(wci0),
> > +	FUNCTION(wci1),
> > +	FUNCTION(wci2),
> > +	FUNCTION(wci3),
> > +	FUNCTION(wci4),
> > +	FUNCTION(wci5),
> > +	FUNCTION(wci6),
> > +	FUNCTION(wci7),
> > +	FUNCTION(wsa_swrm),
> > +	FUNCTION(wsi_clk3),
> > +	FUNCTION(wsi_data3),
> > +	FUNCTION(wsis_reset),
> > +	FUNCTION(xfem0),
> > +	FUNCTION(xfem1),
> > +	FUNCTION(xfem2),
> > +	FUNCTION(xfem3),
> > +	FUNCTION(xfem4),
> > +	FUNCTION(xfem5),
> > +	FUNCTION(xfem6),
> > +	FUNCTION(xfem7),
> > +};

Ok.

> > +static const struct msm_pingroup ipq5018_groups[] = {
> > +	PINGROUP(0, atest_char0, _, qdss_cti_trig_out_a0, wci0, wci0, xfem0,
>
> What's up with wci0 being both function 4 and 5?

Will check this.

> > +		 _, _, _),
> > +	PINGROUP(1, atest_char1, _, qdss_cti_trig_in_a0, wci1, wci1, xfem1,
> > +		 _, _, _),
>
> Please don't like break these, better blow the line length limit in
> favor or readability.
>
> > +	PINGROUP(2, atest_char2, _, qdss_cti_trig_out_a1, wci2, wci2, xfem2,
> > +		 _, _, _),
> > +	PINGROUP(3, atest_char3, _, qdss_cti_trig_in_a1, wci3, wci3, xfem3,
> > +		 _, _, _),

Ok.

> Regards,
> Bjorn

Will post updated patches soon.

Thanks
Varada
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
