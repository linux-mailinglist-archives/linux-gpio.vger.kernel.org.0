Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1B62CA9A1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 18:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgLAR3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 12:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgLAR3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 12:29:06 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A650DC0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 09:28:26 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id h19so2433401otr.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TQyDhRIJ7rEiN9hCk9WyxKUDIyuozNAVVNkVc8YrpXg=;
        b=HfuFhzV/ccCro+uCbOb/y50FQGd5wN4ICHnvajiWVk0nS0pZiS+AOSFCnDHG7PnRCa
         GEox+dpy6qHL+erQkJ2IQLymTJ6UQECBqBn5BvhP7dbdM0wD5uLSEmIYpiNlFrDQ827v
         jMOmW+I724aOht3pb+uWjMxOQRMrdGoRi1HBBi9hfK2ymeetdRiogM10SAQnKMbzIm0G
         UsPT43p69dvtYbW3lCG+44I27of1q2IDNftLwQWY6AsqBeGi7Ci9v08C0oNx5g8eVL+E
         y23fVimIgWEuF98Q/cOVWI/lqISILVUdDAFTu7TGq0FjEU+RkKrtkNH54u6DYZxd0OL8
         +N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TQyDhRIJ7rEiN9hCk9WyxKUDIyuozNAVVNkVc8YrpXg=;
        b=Gci16EQEkrOT61innbTWKOumpJ8QcQCfE48wWwJZV66/Ff2N15ruE2wuN98hBch9Z7
         1p7B0llrkX8buchdt3Lqq2T3Ty25iUgGZjFHSj1+tPzHKUjxgdXhbBLTKAsGqHTx1biH
         upG9uS41PgWhYib1uyiJXqt/zWVvttxD7ysaLBfVD6+n9TS4T4crk8qAgQeBUpiJNSK5
         6o4w7KVpX5ilr0xOkUffg25V/4yxENIysii2CBCUWfNMfqvt4rti4SJejPHVKobdcGoH
         I7sLn2JeCa/MZFcnxFB+5MJrvbhQ5ZBZxvWH0w9FrbUGmVWFLZjM8qrTSPD2MnFRQQ2e
         6TeA==
X-Gm-Message-State: AOAM530IBInoyu+gAeyldVBgtqSL3CbLteexhQvQypNfBOWuaCORBprH
        QmXCLQfbqCt5XGy/EGo/tnk/gQ==
X-Google-Smtp-Source: ABdhPJyUjovjQasEJ8gL40gzaNNC8d5vbgNE/y2i5fRr/dA851rZ+zDqg+lrEeDCBXhCwBTr76kNkA==
X-Received: by 2002:a05:6830:1af7:: with SMTP id c23mr2591590otd.358.1606843705684;
        Tue, 01 Dec 2020 09:28:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g2sm78160ooh.39.2020.12.01.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:28:25 -0800 (PST)
Date:   Tue, 1 Dec 2020 11:28:23 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
Message-ID: <X8Z9N2Yu8xiyPRmj@builder.lan>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-3-srinivas.kandagatla@linaro.org>
 <X8WSucFKyROFJ7gF@builder.lan>
 <ec14afaa-8660-03ac-fbf9-79ff37889de3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec14afaa-8660-03ac-fbf9-79ff37889de3@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 01 Dec 04:01 CST 2020, Srinivas Kandagatla wrote:

> Many thanks for review Bjorn,
> 
> 
> On 01/12/2020 00:47, Bjorn Andersson wrote:
> > On Mon 16 Nov 08:34 CST 2020, Srinivas Kandagatla wrote:
> > 
> > > Add initial pinctrl driver to support pin configuration for
> > > LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> > > on SM8250.
> > > 
> > > This IP is an additional pin control block for Audio Pins on top the
> > > existing SoC Top level pin-controller.
> > > Hardware setup looks like:
> > > 
> > > TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
> > > 
> > 
> > Iiuc the LPI TLMM block is just "another pinmux/pinconf block" found in
> > these SoCs, with the additional magic that the 14 pads are muxed with
> > some of the TLMM pins - to allow the system integrator to choose how
> > many pins the LPI should have access to.
> > 
> > I also believe this is what the "egpio" bit in the TLMM registers are
> > used for (i.e. egpio = route to LPI, egpio = 1 route to TLMM), so we
> > should need to add support for toggling this bit in the TLMM as well
> > (which I think we should do as a pinconf in the pinctrl-msm).
> 
> Yes, we should add egpio function to these pins in main TLMM pinctrl!
> 

I was thinking about abusing the pinconf system, but reading you
sentence makes me feel that expressing it as a "function" and adding a
special case handling in msm_pinmux_set_mux() would actually make things
much cleaner to the outside.

i.e. we would then end up with something in DT like:

	pin-is-normal-tlmm-pin {
		pins = "gpio146";
		function = "gpio";
	};

and

	pin-routed-to-lpi-pin {
		pins = "gpio146";
		function = "egpio";
	};

Only "drawback" I can see is that we're inverting the chip's meaning of
"egpio" (i.e. active means route-to-tlmm in the hardware).

> > 
> > > This pin controller has some similarities compared to Top level
> > > msm SoC Pin controller like 'each pin belongs to a single group'
> > > and so on. However this one is intended to control only audio
> > > pins in particular, which can not be configured/touched by the
> > > Top level SoC pin controller except setting them as gpios.
[..]
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
[..]
> > > +	LPI_MUX_qua_mi2s_sclk,
> > > +	LPI_MUX_swr_tx_data1,
> > 
> > As there's no single pin that can be both data1 and data2 I think you
> > should have a single group for swr_tx_data and use this function for
> > both swr_tx_data pins. Or perhaps even just have one for swr or swr_tx.
> > 
> > (This is nice when you're writing DT later on)
> 
> I did think about this, but we have a rx_data2 pin in different function
> compared to other rx data pins.
> 
> The reason to keep it as it is :
> 1> as this will bring in an additional complexity to the code

For each pin lpi_gpio_set_mux() will be invoked and you'd be searching
for the index (i) among that pins .funcs. So it doesn't matter that
looking up a particular function results in different register values
for different pins, it's already dealt with.

> 2> we have these represented exactly as what hw data sheet mentions it!
> 

That is true, but the result is that you have to write 2 states in the
DT to get your 2 pins to switch to the particular function. By grouping
them you could do:

	data-pins {
		pins = "gpio1", "gpio2";
		function = "swr_tx_data";
	};


We do this quite extensively for the TLMM (pinctrl-msm) because it
results in cleaner DT.

> > 
> > > +	LPI_MUX_qua_mi2s_ws,
[..]
> > > +static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
> > > +	.tlmm_reg_offset = 0x1000,
> > 
> > Do we have any platform in sight where this is not 0x1000? Could we just
> > make a define out of it?
> Am not 100% sure ATM, But I wanted to keep this flexible as these offsets in
> downstream were part of device tree for some reason, so having offset here
> for particular compatible made more sense for me!
> 

Downtream does indeed favor "flexible" code. I tend to prefer a #define
until we actually need the flexibility...

Regards,
Bjorn
