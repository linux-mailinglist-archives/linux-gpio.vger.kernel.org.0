Return-Path: <linux-gpio+bounces-869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82A80109D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A56C281B9A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65BF4D10B;
	Fri,  1 Dec 2023 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr/5f5Ne"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967312D634;
	Fri,  1 Dec 2023 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030EEC433C8;
	Fri,  1 Dec 2023 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449785;
	bh=g0hUWXr8fHBF5LwtM2iV9DHeqn7uI/hSTUcU8M5jINU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hr/5f5Ne90EKG/RivDinI9FUJrZflIYvW3jITrzd6O2RcfkXYA9UfliyWhvhrLo0B
	 cbbPcY6QULpXuIqFoWKPC+2IFa36C/w1S3rnJdiyTYN/81XtIg/2XNTwBW4ydobYsK
	 LhnusVk7zGhVkzgPpoJsKjejWGOa9aHW3yDI0jMEKTtDYV5lrARypLuoTRUw51dXzG
	 mmDjWG1W4o/r/tRoaDgg/0Dk04MvpNMLkuyOpVLWkbBMtt/I0Jq0lsx22weJZg5KjE
	 0Dkh+MJNDIzYIxhi+yzEZIOpqAmgEuaD7KTtOywb+6qk9z4F+tH/E2oP4q7KEdYquY
	 tn8VwnSHiQqvg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r96p2-0003LO-1g;
	Fri, 01 Dec 2023 17:57:01 +0100
Date: Fri, 1 Dec 2023 17:57:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: clean up example
Message-ID: <ZWoQXHnQbJuoxmw0@hovoldconsulting.com>
References: <20231130172834.12653-1-johan+linaro@kernel.org>
 <20231201144320.GA977713-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201144320.GA977713-robh@kernel.org>

On Fri, Dec 01, 2023 at 08:43:20AM -0600, Rob Herring wrote:
> On Thu, Nov 30, 2023 at 06:28:34PM +0100, Johan Hovold wrote:
> > The Multi-Purpose Pin controller block is part of an SPMI PMIC (which in
> > turns sits on an SPMI bus) and uses a single value for the register
> > property that corresponds to its base address.
> > 
> > Clean up the example by adding a parent PMIC node with proper
> > '#address-cells' and '#size-cells' properties, dropping the incorrect
> > second register value, adding some newline separators and increasing the
> > indentation to four spaces.
> 
> This is fine, but I prefer these MFDs have 1 complete example rather 
> than piecemeal examples for each child device.

Yeah, this is not ideal. The closest thing we've got are the examples
in:

	Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

Are you suggesting eventually dropping the examples from the child node
bindings and adding (several) complete examples in the parent one?

I guess there would need to be more than one if you want to cover all
the various child nodes with real examples.

Johan

