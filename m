Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB5B11C57
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2019 17:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfEBPMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 May 2019 11:12:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37890 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfEBPMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 May 2019 11:12:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id 10so1280425pfo.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2019 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yc2jSz2PdGKy97kcSIVG1XsVhe9Q8as81N746C4MAqs=;
        b=GX5GMYb7lqCB37WjNBisvRq6uZPdCXLd3VxnXA/ZvLsqJBlfimcWzQT+C1sRNZffzZ
         AQMipqq1l/fhGJDRbBEUFBJwfhIWOoVx6WwBi6C98fLON6w8AFfj6H2PHrTzEWyHbcRL
         U4DSVvJ5mjVWHzr0DvVtQE6TQ50Ru7ZEuGw7fTpyTfnB/Z5mmGUjzDP+y1psPBT90gF7
         RKree+9JUf5tK9hBSIRAiiIaqa5esjjpA1tk11p+uUm6Cb84OlUnkpVJqy8ciiYLi6wm
         4l/gjVEgKgK9hIw8HKni/Rf0tAg3eBsUWMNffOQ7U/tm106+WRuq80tkv3RvguK3cyn5
         jjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yc2jSz2PdGKy97kcSIVG1XsVhe9Q8as81N746C4MAqs=;
        b=Fx0gdudPCeBeib0pB4f076rqRKnXNetBbtuJnPLKTt0Jl0XBdCcDxzSm1yNWUdwj79
         2nl2JoF04P6PHJN4Y1C38k/CPz7jboRGbBdk8LjJ+gYWq50yTaf5rl7G/qd7v2EovVO2
         Z+A+PnTQohZMXt4ffsUILC4DFhibAjV7w2na1gPuhORotocP72u4aXo1CqZ4P7Nlrh6P
         lhPdkdLFtOE3iwAiZskRNGim9e+uJJ8y5UFVGANY46oUEpij7yItzEApQfztz5e5ySd1
         Ao2ZGKOQVdFtd9h4S3mfo8YKaEnSCYTn+jvXd4olB0RRTI60x+A0p41sSQQB7ZqR+wzv
         gTag==
X-Gm-Message-State: APjAAAXlBC9H/IQj+xcqbtfWckS4hYFErOWoSYd3FhqrbznWZfmYVQ8I
        cTaLQwTvcTON2+uZ+bRPrPMmgQ==
X-Google-Smtp-Source: APXvYqwKEVoTXgCK1Yl04ktfUz1jePba/3rQOqT4m85x+ThB6u+shjyW4ngfqkaeGIYy6EdkKxf/Vw==
X-Received: by 2002:a65:60ca:: with SMTP id r10mr4556757pgv.64.1556809962969;
        Thu, 02 May 2019 08:12:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g65sm8315779pfg.77.2019.05.02.08.12.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 08:12:41 -0700 (PDT)
Date:   Thu, 2 May 2019 08:12:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: Add i2c5 pins
Message-ID: <20190502151244.GM2938@tuxbook-pro>
References: <ed5b1b55-285a-1c6d-c562-a965119000a5@free.fr>
 <20190427045151.GE3137@builder>
 <fcc97e67-3b8e-5b31-866e-6bee62a88fd9@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcc97e67-3b8e-5b31-866e-6bee62a88fd9@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 29 Apr 01:38 PDT 2019, Marc Gonzalez wrote:

> On 27/04/2019 06:51, Bjorn Andersson wrote:
> 
> > On Thu 25 Apr 09:06 PDT 2019, Marc Gonzalez wrote:
> > 
> >> Downstream source:
> >> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi?h=LE.UM.1.3.r3.25#n165
> >>
> >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> >> index 6db70acd38ee..d0a95c70d1e7 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> >> @@ -2,6 +2,13 @@
> >>  /* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
> >>  
> >>  &tlmm {
> >> +	i2c5_default: i2c5_default {
> >> +		pins = "gpio87", "gpio88";
> >> +		function = "blsp_i2c5";
> >> +		drive-strength = <2>;
> >> +		bias-disable;
> >> +	};
> > 
> > You need to reference this node for it to make a difference.
> 
> Right. I do have a local board file referencing i2c5_default, which I plan
> to submit at some point. It contains:
> 
> &blsp1_i2c5 {
> 	status = "ok";
> 	clock-frequency = <100000>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&i2c5_default>;
> };
> 
> > Also the drive-strength and bias are board specific, so please move this
> > to your board dts (and reference the node).
> 
> Wait... Are you saying there should be no drive-strength nor bias definitions
> inside msm8998-pins.dtsi?
> 
> $ grep -c 'strength\|bias' arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> 18
> 
> Why are the SDHC pins different than the I2C pins?
> 
> i2c5 is "tied" to gpio87 and gpio88. Could my board designer "reassign"
> these pins to a different HW block? Or is that immutable?
> 

Right, so it makes a lot of sense to have a node in msm8998.dtsi that
says that if i2c5 is probed then the associated pinmux should be set up.

But the pinconf (drive-strenght, internal vs external bias) are board
specific, so this part better go in the board.dts.


On sdm845 we put a node with pinmux in the platform.dtsi and then in the
board we extend this node with the electrical properties of the board.
This works out pretty well, but we haven't gone back and updated the
older platforms/boards yet.

Regards,
Bjorn
