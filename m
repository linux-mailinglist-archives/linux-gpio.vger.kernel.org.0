Return-Path: <linux-gpio+bounces-9920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73A971DE7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 17:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89611C23553
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 15:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C155239FF2;
	Mon,  9 Sep 2024 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHZeBpzQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B811CD15;
	Mon,  9 Sep 2024 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725895188; cv=none; b=WcbmVnCj6sl4/9yrQivmynG+zatYMKR6L1sJehwkz3xCNJWnlR6O3JYaUw7ZCIJKzv9WO28/vVltSfYZH8PbTvKwMxOKiVOmDNY1EeaS3wMiBbpI+VPehgP/zm2TS1xPmyXfsCuTUDHaYCLzkg7ho9ZBLESYC6DgC3KgY0l9Gyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725895188; c=relaxed/simple;
	bh=0Yabc6xpRJUS12FvNtKkdFAvYIHbRc3U7Ycls1vFNiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SghGPQc08NwNExGL+smsNihGcwd8fp9WaWbl0GWm6Bp5RPDlwnzHUpBwrO/1x1505wPmccS3TAqSvJnH483+b0xlY4UKaVSpQn0mKNUo+5QoYp29raVa2roPglB7wBLJd1jBfK0IVBO3OC5Q0d6dIlcOMQMoCf0Hrf+RZvShgyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHZeBpzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A5C4CEC5;
	Mon,  9 Sep 2024 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725895188;
	bh=0Yabc6xpRJUS12FvNtKkdFAvYIHbRc3U7Ycls1vFNiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHZeBpzQE/96+ztQSFOswVfcOnpxQftdlKzWiLeWsEmqE60yFstmllM9gMsdYcm9R
	 kUHC9Lef6JhJ6fE29hz5Q4e0lz9+G69ZwDaFXcJHA36oarnB7hFka6t2E8c6PEuUEO
	 Az1sPb4y+dtr6bxHI/2xPbdMcvhJasrIQF4HpuuSLNCielo07675i8QVZF7nGYPO4a
	 GSPQdVTF1MYk/qc8WLycI2Q89Fx1Sks9ZgoodGkG61OLwrgbrZLul/VGB0NsqeQlJV
	 ezFwtpWWjhJ1j0aDpHWxRutu8yUPau1OIHi/wkEj7tvcVo5+xemqKVRBVn5R+7cF8Y
	 oWmvopDH4g9vw==
Date: Mon, 9 Sep 2024 10:19:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
Message-ID: <172589518611.173458.7161248280300898961.robh@kernel.org>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
 <20240906110113.3154327-2-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906110113.3154327-2-sai.krishna.potthuri@amd.com>


On Fri, 06 Sep 2024 16:31:11 +0530, Sai Krishna Potthuri wrote:
> Add Xilinx Versal compatible string and corresponding groups, function and
> pins properties to support pin controller features on Versal platform.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/pinctrl/xlnx,versal-pinctrl.yaml | 278 ++++++++++++++++++
>  1 file changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


