Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE4673BA2F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 18:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387547AbfFJQ6B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 12:58:01 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39502 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbfFJQ6A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 12:58:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so5353828pgc.6
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 09:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=02QlD+dQyEGO4EEKFz1uYHazBVRik/r7SAjjSQVxSs4=;
        b=r9/fS6LliK6b9sWK/JXRrCplVnHPfXh2dJwY828nS9aFx1N6M2Rh2OrZ45pBoNUz+6
         63L0i4B6ANOoEgH5b0WSX0iqrBjWAHbZOq071SW5w1UWdAcvPXt8VxuhGzrk9if+tGIw
         5e0WH98Og+FomJIfAkK0vKnnVblD2abzMxb3oRzmZqihkkCJlgErDdnomlw+kS7CB9rh
         KiEOeKyJ1maFp146hlz1gTOSHRt60wGOBfmBrhdO+UzW/IohTj3wiStbyB3w5WbpbkZ/
         BoK0X0O4fERQ6zcUNNdpuyGYzyUku+AaJdj4AYDSfNeBBQ9PVARyBxt+cyEqOth/ycO4
         viIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=02QlD+dQyEGO4EEKFz1uYHazBVRik/r7SAjjSQVxSs4=;
        b=OTy4MM/tWOo8KXWK5ukZ1slkm34iYLGHyQhG96trQ1GgE76qcsUgotSfSFThJ+Tari
         meY8KVjMXvyv02ANPeTu2J61cUV42xgXveuYUmoBZu+3UCJjGwNNxPl+KbZ5SxjO8wHV
         BfIACNLZ2T9wVAHS5q3KJZfMmDDAIzVPOPmoBqujSxZJxfT4kmlzi+wIYNy+g43gSjeN
         nkOkpEYxFEuamOouzS5cfsrr+4NA6j4mw9yUDqYxzg8YvT9tPFpMUz/cJzie3XagN0g9
         pLwD9Ob49X//fvisH3WztJTHkJAs4v1VTQLlwCWa6yQWGHCcNKcwfYqV/VgU7cymCkwM
         1ZlA==
X-Gm-Message-State: APjAAAXvoX56IbsVnrhH74N0ZSGN6voa6Ln+lP/Ch3gWS2haewW2r7HO
        fbCI5Shn8GzAsED6oO+QX5PeUw==
X-Google-Smtp-Source: APXvYqzVfNPgK3styQsjXZr91PyrqVn2vP6x01Abxia0xpHcW5BIME9JyPDGk9UbFVDoMQ6TMxihtQ==
X-Received: by 2002:a63:8841:: with SMTP id l62mr14744140pgd.246.1560185879548;
        Mon, 10 Jun 2019 09:57:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a192sm470040pfa.84.2019.06.10.09.57.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 09:57:58 -0700 (PDT)
Date:   Mon, 10 Jun 2019 09:58:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linus.walleij@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] clk: qcom: Add ipq6018 Global Clock Controller
 support
Message-ID: <20190610165843.GC22737@tuxbook-pro>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-5-git-send-email-sricharan@codeaurora.org>
 <20190608033229.GE24059@builder>
 <6583f576-acf4-a71b-d691-bce548e2c008@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6583f576-acf4-a71b-d691-bce548e2c008@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 10 Jun 04:47 PDT 2019, Sricharan R wrote:

> Hi Bjorn,
> 
> On 6/8/2019 9:02 AM, Bjorn Andersson wrote:
> > On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:
> > 
> >> This patch adds support for the global clock controller found on
> >> the ipq6018 based devices.
> >>
> >> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> >> Signed-off-by: anusha <anusharao@codeaurora.org>
> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > 
> > Please fix your s-o-b chain, as described in my reply to 1/8..
> > 
> 
>  ok.
> 
> >> ---
> >>  drivers/clk/qcom/Kconfig       |    9 +
> >>  drivers/clk/qcom/Makefile      |    1 +
> >>  drivers/clk/qcom/gcc-ipq6018.c | 5267 ++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 5277 insertions(+)
> >>  create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
> >>
> >> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> >> index e1ff83c..e5fb091 100644
> >> --- a/drivers/clk/qcom/Kconfig
> >> +++ b/drivers/clk/qcom/Kconfig
> >> @@ -120,6 +120,15 @@ config IPQ_GCC_8074
> >>  	  i2c, USB, SD/eMMC, etc. Select this for the root clock
> >>  	  of ipq8074.
> >>  
> >> +config IPQ_GCC_6018
> > 
> > Please maintain sort order.
> > 
> 
>  ok.
> 
> >> +	tristate "IPQ6018 Global Clock Controller"
> >> +	depends on COMMON_CLK_QCOM
> >> +	help
> >> +	  Support for global clock controller on ipq6018 devices.
> >> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> >> +	  i2c, USB, SD/eMMC, etc. Select this for the root clock
> >> +	  of ipq6018.
> >> +
> >>  config MSM_GCC_8660
> >>  	tristate "MSM8660 Global Clock Controller"
> >>  	help
> >> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> >> index f0768fb..025137d 100644
> >> --- a/drivers/clk/qcom/Makefile
> >> +++ b/drivers/clk/qcom/Makefile
> >> @@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
> >>  obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
> >>  obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
> >>  obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
> >> +obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
> > 
> > Ditto.
> > 
> 
>  ok.
> 
> >>  obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
> >>  obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
> >>  obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
> >> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> > [..]
> >> +static int gcc_ipq6018_probe(struct platform_device *pdev)
> >> +{
> >> +	return qcom_cc_probe(pdev, &gcc_ipq6018_desc);
> >> +}
> >> +
> >> +static int gcc_ipq6018_remove(struct platform_device *pdev)
> >> +{
> >> +	return 0;
> > 
> > Just omit .remove from the gcc_ipq6018_driver instead of providing a
> > dummy function.
> > 
> 
>  ok.
> 
> >> +}
> >> +
> >> +static struct platform_driver gcc_ipq6018_driver = {
> >> +	.probe = gcc_ipq6018_probe,
> >> +	.remove = gcc_ipq6018_remove,
> >> +	.driver = {
> >> +		.name   = "qcom,gcc-ipq6018",
> >> +		.owner  = THIS_MODULE,
> > 
> > Don't specify .owner in platform drivers.
> > 
> 
>  ok.
> 
> > [..]
> >> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ6018 Driver");
> >> +MODULE_LICENSE("GPL v2");
> >> +MODULE_ALIAS("platform:gcc-ipq6018");
> > 
> > This modalias won't be used.
> >
> 
>  ok. But it looks to be there in other clk drivers as well.
>  

It serves the purpose that the driver will be automatically modprobed if
someone calls:

  platform_device_register*(...,  "gcc-ipq6018", ...);

So for everything that is only going be probed from DT (or ACPI) this
does not add any value. As such there are several other places where
these aliases should be dropped.

Regards,
Bjorn
