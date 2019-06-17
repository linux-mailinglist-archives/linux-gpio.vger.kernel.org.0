Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C890F47E9E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 11:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfFQJio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 05:38:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfFQJin (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jun 2019 05:38:43 -0400
Received: from localhost (unknown [122.178.208.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81B682085A;
        Mon, 17 Jun 2019 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560764323;
        bh=1MmPNbYWZDKNu+tc8X2hB5HstMq/o4InRnTu+0NxeX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5ZQs+Ws1wpbolkQeLk4pmztF464THsCz5/kU6dg08HqAvIizOfA+uPBdYpwm43Q2
         0SptEJfjZu+aic1Q/cGFLXFZQlKAn/9YDKWXYuXjluyoFLjcr/6Ims+5W+jEuC8zg2
         sflA3O5D/6NJEcsd/GIvI25Mm7v4yIo2oSr7mHmk=
Date:   Mon, 17 Jun 2019 15:05:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Isaac J . Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl
 binding
Message-ID: <20190617093534.GI2962@vkoul-mobl>
References: <20190614053032.24208-1-vkoul@kernel.org>
 <20190617063732.GA18010@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617063732.GA18010@mani>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-06-19, 12:07, Manivannan Sadhasivam wrote:
> Hey Vinod,
> 
> On Fri, Jun 14, 2019 at 11:00:31AM +0530, Vinod Koul wrote:
> > From: Prasad Sodagudi <psodagud@codeaurora.org>
> > 
> > Add the binding for the TLMM pinctrl block found in the SM8150 platform.
> > 
> > Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../bindings/pinctrl/qcom,sm8150-pinctrl      | 200 ++++++++++++++++++
> 
> Looks like you missed the .txt extension for binding :-)

Looks like I did :( Thanks for pointing Mani!

-- 
~Vinod
