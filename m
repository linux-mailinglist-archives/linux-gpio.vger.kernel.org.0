Return-Path: <linux-gpio+bounces-9440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA052965C9E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 816D5B24492
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A61170826;
	Fri, 30 Aug 2024 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ2SE0lf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811513A261;
	Fri, 30 Aug 2024 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009771; cv=none; b=Vz42vGhGr/VLteXGbjcnFA/LRlInlPFC5DF161op+FvfFv0fXUjfwW51fMk0gA3yhJx2X75TUcX0g9pLV3kldC+7yJais8JOX0LsUydw8/4E7ngwg2PEuhOivgWasLas8WME0Sa8a5Lb7BVOHAPjhXIwRAW4u4jgQR4dL16c2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009771; c=relaxed/simple;
	bh=U1bqAG3mG01uRkT1DcKMoWVk4BaVBVRZIzkc4uPCBwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdU502r9OWtQ9LaNW2JjK91ExSaRlaGcUer1ePh4/MSDCCnj7RKpmXudMQvzWT14N5rjg6eCCRC3USP9hYTbS0/fiC7nSVhz+BoA40sdn/WYSxodzGWZxryYsGs8ATJ6d8MWsJ0KQXD18l733n6dDmTDkUkCx/bd6iqAEdSOnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ2SE0lf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC4EC4CEC2;
	Fri, 30 Aug 2024 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725009770;
	bh=U1bqAG3mG01uRkT1DcKMoWVk4BaVBVRZIzkc4uPCBwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQ2SE0lf46cQSaIUjdkUS2PJU0/gEREnHYsQVUiYV7CZPKpUCuwM2GvMrQH0YFOf3
	 Is2vTl9Ht0qhLVZr0MFD7SGbK2ju3kRie9LdWERUxRvCEIAOE/+InnwOAPoPatgUgN
	 FA0uVCiAYKmIn8T8Q9wTSsvDO9v5BX/U1EZOTTfdYf1+xW8gcz1baNxbl5YClcl/QR
	 esPlX66Dy4uAKNvUTLI1XX/nouCI1IDS3PeGv5sAD3e5BKe6aopcx5gcnVGrtIL5XJ
	 IFu0J4J2n3ZyZaI8bczld8rqggSSj526WhBaetxA2SWoPqISNb7EZveod4lofbfq0t
	 6w/VD5YYpIKMA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sjxqS-0000000027U-1b2H;
	Fri, 30 Aug 2024 11:23:04 +0200
Date: Fri, 30 Aug 2024 11:23:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
Message-ID: <ZtGPePhDHXX5nVx_@hovoldconsulting.com>
References: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>

On Fri, Aug 30, 2024 at 11:09:07AM +0200, Stephan Gerhold wrote:
> On X1E80100, GPIO interrupts for wakeup-capable pins have been broken since
> the introduction of the pinctrl driver. This prevents keyboard and touchpad
> from working on most of the X1E laptops. So far we have worked around this
> by manually building a kernel with the "wakeup-parent" removed from the
> pinctrl node in the device tree, but we cannot expect all users to do that.
> 
> Implement a similar workaround in the driver by clearing the wakeirq_map
> for X1E80100. This avoids using the PDC wakeup parent for all GPIOs
> and handles the interrupts directly in the pinctrl driver instead.
> 
> The PDC driver needs additional changes to support X1E80100 properly.
> Adding a workaround separately first allows to land the necessary PDC
> changes through the normal release cycle, while still solving the more
> critical problem with keyboard and touchpad on the current stable kernel
> versions. Bypassing the PDC is enough for now, because we have not yet
> enabled the deep idle states where using the PDC becomes necessary.
> 
> Cc: stable@vger.kernel.org
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

I can confirm that this fixes the keyboard and touchpad interrupts on
the x1e80100 CRD as expected:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

