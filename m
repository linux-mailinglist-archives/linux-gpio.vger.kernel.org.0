Return-Path: <linux-gpio+bounces-27262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4EBEBEF1
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 00:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D092F4EF023
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 22:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AFF31DD8A;
	Fri, 17 Oct 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E838ksIe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646232D9EEF;
	Fri, 17 Oct 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760740814; cv=none; b=p58wgUjSLinIIMdKm42NPcLII3AiQ/Am7EKc8Lcd33hInr0tc9ptofvN1kzBhw3O4dskWKMjQI+2eFKV0mZe+Uo9Pz7C4qbJeCNjQvNzHnd9zyFpELMOFcsN1NbAIkGzDZ+2bQJPEukm6rB2vapxaSHmNC3eILtdU+3LPIqWkNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760740814; c=relaxed/simple;
	bh=0HegR9daNkosgD9iCJo0B2G1/81wLynrRR6+gZ/j10Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLaLEup1kmKDUeD+LmOiLbFdi6W69jKdFQR0YVgNyjLcH2iRcxUTXIrifCNnuoGqqIdwPwZsSAQ49TSYrL9GF5jUoNN8u1PZ/loU9llnN7VTuffxCwq5tMXr+7KpG2/yKJGGykoofhnIQ1z3FXEIls3iJRiZw+3rSpB8gxhbhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E838ksIe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D74C4CEE7;
	Fri, 17 Oct 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760740813;
	bh=0HegR9daNkosgD9iCJo0B2G1/81wLynrRR6+gZ/j10Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E838ksIeG34YriLkkogKNfQZ8Y1EPk6nGfrhDkbxSxI2dm4pgcuubQLIsTDo01ayb
	 Hl1WS5NTpeUaOTTpNxtyn3HB7Ds28XSExSYc/tGGmP5kouAKq9q/FqOMPQ6kF5ezGE
	 gzQB8M/CCMsZt2JPaNRevh4QtL9c8oZxFQLLbV0jAKVPMkahF6rld7ortskrNmXhZE
	 GauRpGZaM9IHGU4YTAXQoGEBIqGLjU43qGC4xvZPXxtsipjm7GejAyxvU8rrzMHTMj
	 JOA4xMp2sy5ZUGmlEyRID3HO7PhqCt2Gepm7wm26uqH0JsruifOlLBkkerR5uccFDI
	 hq8Fq1jXIUMlA==
Date: Fri, 17 Oct 2025 15:42:07 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Message-ID: <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>

On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> > On 10/7/25 4:03 AM, Alexey Klimov wrote:
> >> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> >> controller device node required for audio subsystem on Qualcomm
> >> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
> >> 
> >> While at this, also add description of lpi_i2s2 pins (active state)
> >> required for audio playback via HDMI/I2S.
> >> 
> >> Cc: Srinivas Kandagatla <srini@kernel.org>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >
> > [...]
> >
> >> +			lpi_i2s2_active: lpi-i2s2-active-state {
> >> +				data-pins {
> >> +					pins = "gpio12";
> >> +					function = "i2s2_data";
> >> +					bias-disable;
> >> +					drive-strength = <8>;
> >> +					output-high;
> >
> > I.. doubt output-high is what you want?
> 
> Why? Or is it because of some in-kernel gpiod?
> 

What does "output-high" mean for a non-gpio function?

Regards,
Bjorn

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sm4250.dtsi#n66
> 
> >> +				};
> >> +
> >> +				sck-pins {
> >> +					pins = "gpio10";
> >> +					function = "i2s2_clk";
> >> +					bias-disable;
> >> +					drive-strength = <8>;
> >> +					output-high;
> >> +				};
> >> +
> >> +				ws-pins {
> >> +					pins = "gpio11";
> >
> > Please re-sort pin entries by the gpio index
> >
> > https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes
> 
> Ok.
> 
> Thanks,
> Alexey.
> 

