Return-Path: <linux-gpio+bounces-23576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7795B0BEAD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 10:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE833B9AD0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD9A286D52;
	Mon, 21 Jul 2025 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcihLUuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D67285068;
	Mon, 21 Jul 2025 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753085966; cv=none; b=gwrJQqyGGY13HYaNhZDv6dsIKCyLIU4PlyYU7K1xeU7jo+fUdg53TL0+HRjDraDky4RS3PtjFWCpQuJAfdT1wf5QfVWpsHHSHK3u5UpzBhnfDvkum33yh6dSnavvTXlfCgFtTgCBguiFHRaSsTPwNqj+0Zd5MeFghkCgfBUfwKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753085966; c=relaxed/simple;
	bh=uEB0HtD55uZd7rEhL/zvPezmMEb4PcqPNChda79sX/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKycc6buwRVAu7YSjHgctKQY4iA2KgoZTT4dp2745y4+XVhxHVjnki9WNuMzsX5Z8GjSnGWaJCJIeMyaqlwdA8/NCQpmQYhl7S5h8bE+l2LEzr56/Pb1jTpadzmBzFgZa3caVgdwKnjM3rBLITtrJFc8EkOawrm5tA3+l4Znb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcihLUuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D588C4CEF1;
	Mon, 21 Jul 2025 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753085965;
	bh=uEB0HtD55uZd7rEhL/zvPezmMEb4PcqPNChda79sX/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcihLUuNxprB7aVI87hJ70Aq89aNIFkCBA5Xod+cxuVDOeA5BT1DMmlVmg44Mt0D7
	 iNx95HJ121pWyOUpiDH/nn0baxboJIxpnnFTSKiv/R5tiW8BOSdidC5qdw2lmmpK9x
	 5mx3GlZmm1boMS/N4pcHkZ/Fe01krAXdzqugtHtWZtuX0LlVfdgPIk/02lVvTPpGNZ
	 fwWBCZTXCA2opGSlY2+5DsuJcIE8UsqH5hc3tbgTn618iOS+Rv2dujqztZvuDrpDsi
	 GOi7UkOfFkux++E6spsVkyIR94Z+TmZD2zduV+fkw8IfSVSMSBrFc0bvRRee+t6c39
	 ljhZaj4WJC6ug==
Date: Mon, 21 Jul 2025 10:19:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios
 for shared line
Message-ID: <20250721-teal-vole-of-finesse-82debf@kuoka>
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250718104628.3732645-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718104628.3732645-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 04:16:27PM +0530, Mohammad Rafi Shaik wrote:
> On Qualcomm platforms such as QCS6490-RB3Gen2, the WSA883x speaker
> amplifiers share the SD_N GPIO line between two speakers, thus
> requires coordinated control when asserting the GPIO. Linux supports
> shared GPIO handling via the "reset-gpios" property, which can be
> used to specify either the powerdown or reset GPIOs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,wsa883x.yaml       | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


