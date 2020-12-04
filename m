Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425102CE73B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 06:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgLDFEd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 00:04:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgLDFEd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 00:04:33 -0500
Date:   Fri, 4 Dec 2020 10:33:47 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607058232;
        bh=Q5jC7j0UDkO8xdVRlKmo1TUObORlXY45HjohLz/J2s0=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=LoMWkplsVy27S3MezBfm9AQ5OopOlnsH12+MQaePm6QBLytNN64kw15QG5JO4PjAx
         1w3iUaYj05zAJOezMdPqtVX2u9V0CPc71tSSUVqNLDxczD1vf6A31fDt3pFxctFAl4
         2lJmt6ICbYDpu3cCMMLLMIIsK8jkwv8i6wSQqBoNc9QMje2RJYbbzvbpRv4h8a16Ao
         5n2yNDF2K4Di6zdjW77SbUONbA7L7t1p8spHdv3YRmh1/RVq75xZZDIw4Oh3H8kXVR
         ubDQ4MWM49rhSxN5a6QYG7KyDwqx/9lrr6xQCkgw8lup/r1pLw2J9RATBeWVS45gzn
         5VGTu0hTh5DIQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM8350 pinctrl driver
Message-ID: <20201204050347.GM8403@vkoul-mobl>
References: <20201203070900.2651127-1-vkoul@kernel.org>
 <20201203070900.2651127-2-vkoul@kernel.org>
 <X8l6xU+sVJa/+5r1@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8l6xU+sVJa/+5r1@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-12-20, 17:54, Bjorn Andersson wrote:
> On Thu 03 Dec 01:09 CST 2020, Vinod Koul wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> [..]
> > +static const int sm8350_reserved_gpios[] = {
> > +	52, 53, 54, 55, 56, 57, 58, 59, -1
> > +};
> 
> Reserving these gpios here instead of in the DT means that there can
> never be a platform configuration using these. Is there a good reason
> for this? Or should we just mark them reserved in DT?

So the question is are these gpios reserved per platform or for the SoC.
Looking at this, seems former, so DT seems better suited. DO you agree?

-- 
~Vinod
