Return-Path: <linux-gpio+bounces-28953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D40C79A94
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 14:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A23322E22C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF4634EF15;
	Fri, 21 Nov 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9el9yOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FBE34D90E;
	Fri, 21 Nov 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732699; cv=none; b=SHSl1OX07xNlm9YbWKr7oHIXR15AGnowvsQjX381jAHG3UcFLQD6hrTeV1cuSwqzhIQXyKpPwHQkXVSAClf9bL5vSgZHwh+89xlqyDp8XELwj3sJbdJl4GViHa/HqFavGjckxoeLKzsm463AviSfspckiJnuTNLHfGjGMlJcurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732699; c=relaxed/simple;
	bh=315KQt8BfXDy9EkmurrYqnpr3MLjmoZQRU/4PbKRhhM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lSAQxtWO1towFJZANHfDS3bUe/gzcWctHoMVYCjOhTsURbsKfHNeVSl+PvsHiLccDZ4H+XBprvwyYWh1Fc4JugIkbx2FNCZVdIj3lrgCnKZnX6P2HTFBjzMiwYq2wwOYiCu+M+47pbEEgGCnjXQLQ5bFn2M091P75s0p/DrL69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9el9yOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54CEC116C6;
	Fri, 21 Nov 2025 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732699;
	bh=315KQt8BfXDy9EkmurrYqnpr3MLjmoZQRU/4PbKRhhM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C9el9yOE9oIRomnfh5SmchF2obOxXYAlvnaOMbJSxk7Nbearx/MGUjQXlVXOk8lvU
	 WIo0/Iq3yQP5PRLAzrhULtjCPy8ZzhAQrRN1Hqb68wr1FEnLMA+0CZuUnkFSMvJeMJ
	 PzwYP6cD97NYm113edJ8Qo+crMZdyFHLBH1IHWdTxzczwjSXhnAINzzsfdJsT1MQwo
	 yXozTSzyXkF1bB4RgaIB/Qd2n1bN/AQwGxaOpU8vY/bE9JkWax6R/CqRTW8gIcZ6+w
	 dsYk/2fjlCZIjJzvkf18w/XLaeLUavj7D1EgdyWmRorzO2ruSeZ9idhQLVFh72rCrj
	 9QjFSdif5YATw==
Date: Fri, 21 Nov 2025 07:44:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
In-Reply-To: <20251121115750.20119-2-antoniu.miclaus@analog.com>
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
 <20251121115750.20119-2-antoniu.miclaus@analog.com>
Message-Id: <176373269741.263545.10849918874919174841.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mux: gpio-mux: add support for
 ADG1712


On Fri, 21 Nov 2025 11:57:31 +0000, Antoniu Miclaus wrote:
> Add support for the Analog Devices ADG1712 quad SPST switch to the
> existing GPIO multiplexer bindings. The ADG1712 contains four
> independent single-pole/single-throw (SPST) switches, each controlled
> by a dedicated GPIO pin.
> 
> Unlike traditional multiplexers that use GPIOs as binary-encoded
> selectors, the ADG1712 treats each GPIO as a direct switch controller.
> The mux state represents the combination of all four switches, with
> values from 0-15 corresponding to different switch combinations.
> 
> For example, state 5 (binary 0101) represents:
> - SW1: ON (GPIO0 = 1)
> - SW2: OFF (GPIO1 = 0)
> - SW3: ON (GPIO2 = 1)
> - SW4: OFF (GPIO3 = 0)
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
>  .../devicetree/bindings/mux/gpio-mux.yaml     | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mux/gpio-mux.example.dtb: switch-controller (adi,adg1712): $nodename:0: 'switch-controller' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251121115750.20119-2-antoniu.miclaus@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


