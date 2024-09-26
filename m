Return-Path: <linux-gpio+bounces-10470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF698788A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 19:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0B5BB25A76
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 17:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D833F1581F3;
	Thu, 26 Sep 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR1exI49"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C00C3FF1;
	Thu, 26 Sep 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727372639; cv=none; b=UwX5Hwx74hSW4TBL8PDUNJWdXYZqJ3csX7bp33ic0voiUcMd5zQsvI4Xrjj4YXM/PERLwapvEGElAHtxGN5gcr2iIaxkHkVo9n5NHgx/NnyngjCjTY7zqrvjOQ94/Gj8oR4hfMRj5SrzXCFagkxUsz5hQEx3/QWXqVe1YLnZlWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727372639; c=relaxed/simple;
	bh=nSJMx1a3h0ylmepdIO+5mpI1+TXEC1yBnwRtqqbSKog=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=uAfIV7aGmmmTwrZQR8/hP70PrySlrE694suMyq42neax+H3cYzzA8XOgOEdBCkF62KjszMP3q+E1Rt+aAQu13uMMhC/4mUMAIUJtxaY80cz/yErTZkWe0XfkKQaY+JIF9QDavrdfyUi/u6IinKQKEyS+V23XsLn7Gi7jtPb6pNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR1exI49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C91C4CEC5;
	Thu, 26 Sep 2024 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727372639;
	bh=nSJMx1a3h0ylmepdIO+5mpI1+TXEC1yBnwRtqqbSKog=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TR1exI49vooulKRvJ3WH61RfLu4XXJY31khci3K/pY1pVXQ2B5s5umfCDOdyR8FXv
	 l+y/0mD1wxdA7p3Tj/lJgLDOQb+zizpRBGTPrOwTj2/naItEvR98SKllUHOKxVX4u3
	 60dIvEhBbvt+ekP2pA8ZScgaOF94F0MkPnybmkevBMojBpb01bM4knqk9o3ZtidviM
	 YI8vGltAP2AUMJYcdR4xLPL0ZFhYuUvWFy4OXA2376A3A96cHTm9Bk1v5aanMKZUSh
	 IpvbWaJsGkMn/S1HuofkVbQCu5qEnryOZwOFToG8tuP0s5U60Z7h5xXwB7K5cO+d5z
	 4EeqxWVU2TKiA==
Date: Thu, 26 Sep 2024 12:43:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Matthias Brugger <mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
 Enric Balletbo <eballetb@redhat.com>, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
Message-Id: <172737263813.2649710.12417820280324530724.robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs


On Thu, 26 Sep 2024 17:31:19 +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> 
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


