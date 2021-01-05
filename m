Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C572EA554
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 07:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbhAEGPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 01:15:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:55218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbhAEGPB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Jan 2021 01:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75B16227C3;
        Tue,  5 Jan 2021 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609827260;
        bh=CWbfPoQL9q63I1jQit0eAhiT55H+f8NCydgTEbCorC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OJgt1iQ1EFlkrjdQPvqF6GMxBwbKTHcwGnsx5y1cr2I2yVgRzFEczkafsr9Xhhixb
         gk+Iv714iiQ3lPzuXMUhOGVddNxTPUm+dkzY+mDLe4PwwUemHpKRgGtEj7lz+g8g0l
         vrSpTwF74FgjLqFILStpOrTbvZKfGIxI2n2WFA8tfgU2M45js51zm/2D+3XdafXtlu
         mk2hw6bPaXbafJ3VHYBYrS7Ho49s5QNrq8yiQ9NoFZzSfznrH//xsHTDvGcGlxcZSO
         JKN+QZE7HPO4NxSEQXKSZVAO1gXbIm9sZVd5nJVn9PNVu+SMVeZ5TfHn5iG/sjNDPU
         11O6szPkYDEGw==
Date:   Tue, 5 Jan 2021 11:44:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20210105061415.GA2771@vkoul-mobl>
References: <20201208085748.3684670-1-vkoul@kernel.org>
 <20201210135253.GA2405508@robh.at.kernel.org>
 <X/NgUp/pm9T0JlTw@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/NgUp/pm9T0JlTw@builder.lan>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-01-21, 12:37, Bjorn Andersson wrote:

> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sm8350-pinctrl
> > 
> > If this block is called TLMM, then I'd expect that to be in the 
> > compatible string. But I guess this is consistent with the others.
> > 
> 
> This is my mistake 7 years ago and it bothers me every time we write a
> new one of these - in particular since we now support a few different
> "Qualcomm pinctrl" blocks.
> 
> It would be ugly for a while, but I'm in favor of naming these
> "qcom,<platform>-tlmm" going forward.
> 
> PS. And we can solve the ugliness by introducing the "proper" naming
> (and keeping the old one for backwards compatibility) as we migrate the
> binding documents to yaml.

Okay I will update this one to qcom,sm8350-tlmm. Also we use
sm8350_pinctrl few places in the driver, will update that to sm8350_tlmm
as well

Thanks
-- 
~Vinod
