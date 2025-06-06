Return-Path: <linux-gpio+bounces-21071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEFACFB18
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 04:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E86F3ADFED
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 02:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BA51D63F8;
	Fri,  6 Jun 2025 02:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3/KiO/x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D01C700D;
	Fri,  6 Jun 2025 02:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175626; cv=none; b=AkeyjrNdhurY5XqpneTWczM1v3W26iAHL4HQaNqWFtCV0jAaCArA+SjHOM9ER3moSoanrdb1WmHtEoTm9fyDnDP2OREvfTrNoX8ZQe2SCk69rRs0ISKwtCRVrGV042QwU04KULic4PhSEZQHQgDW0QsKLxEusOfh3RGWjz08Baw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175626; c=relaxed/simple;
	bh=7W2i6lbL3UMR3CK9ANla0nqOKQPRknlJntToecOV9QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOxHhOYfVNRmdexkvwVcM/q7qm4i4ouaViEXQuZiu1w57PbAcnQvxZV+TdDMGztkPVL8S3+uhpD9/9lvgfEdO+853L2ry9a8I+zOiTLxzB1HtiVdO7nBS6ew9FEqW7nJRNCWl5owHffo3Nm70/Y2CO/qNrjdH0EjBMFQdNg5Mkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3/KiO/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6ACC4CEE7;
	Fri,  6 Jun 2025 02:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175626;
	bh=7W2i6lbL3UMR3CK9ANla0nqOKQPRknlJntToecOV9QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3/KiO/x3Q9agM6MS94XdZZ8TPa88fMV6mvxtbXmHpkxbbJsRb9WsnhYUHfHK6yA2
	 SeXgD57lfoHDoIioW1UTzhh+1sJx/2esb2Mo13Yx4FypjwyEvsbT/e5OluBF5LwfKr
	 XGOa4L3tcJg9g9mIbRk5LvqrYBw+luXGBCcnq8al0VA9h5uxvV4FEoAklEd1OWjM5H
	 i84KvBPfYkLNbX2NongIxwOtHlecbgaQuiRLnF6f6MeXO/U1ptuWgULcMts7G1l59M
	 CTXvLfQc7650GSFy56M3/ghtZlzCKJzoVQy8ertyofEsbwO+9ESi0w+wjc/PqA185h
	 bmHWGvqi5abZw==
Date: Thu, 5 Jun 2025 21:07:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	imx@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to
 yaml format
Message-ID: <174917562214.3777775.10544409008316605683.robh@kernel.org>
References: <20250602144259.944257-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602144259.944257-1-Frank.Li@nxp.com>


On Mon, 02 Jun 2025 10:42:58 -0400, Frank Li wrote:
> Convert nxp,lpc1850-gpio.txt to yaml format.
> 
> Additional changes:
> - remove interrupt-controller and #interupt-cells from required list to
>   match existed dts files.
> - remove gpio consumer in examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/gpio/nxp,lpc1850-gpio.txt        | 59 --------------
>  .../bindings/gpio/nxp,lpc1850-gpio.yaml       | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc1850-gpio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


