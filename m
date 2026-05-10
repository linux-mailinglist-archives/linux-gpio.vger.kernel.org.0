Return-Path: <linux-gpio+bounces-36494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOfFEz7EAGrlMQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 19:45:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB65057BA
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 19:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEB5D300BC8E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 17:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ADE23D291;
	Sun, 10 May 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckd9x7ni"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909AC26AE5;
	Sun, 10 May 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435127; cv=none; b=VOZlKpf+gwNd3nId+ldRni0RDm/qxpSOy9F0ZrThnrLi1OmyY9+dIDWVLEBhc7LYLbFBXDsJ+xk/VYOVoldXHrb1kZJk7rXitfGMMF8qPJbz6vzncoufMLT808stgK2n18EDJbDOtFORhW0LKqkrATC08UuqGzpHsP0owjAtPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435127; c=relaxed/simple;
	bh=B6E9No4SCVSJAl8E5S1LCZYcTRmsUulHW5gm8aNmWtA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uG6qcCx5rDKBBi2Q8g7GSEzHi5a3o4LNIn9EeyVLHlo6yUUN4xIQl70N1a+0Zm2Zkl+wKzB08EBYAKjjcSIz11uQCQybKcIQdlptsxCgSLf3U1M9cHknCmk9Fit7bkSIo/9SP6KqP4GwCdBdj4FgC6qf7dVDP1Avs1cXBIUcmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckd9x7ni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B4C2BCB8;
	Sun, 10 May 2026 17:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778435127;
	bh=B6E9No4SCVSJAl8E5S1LCZYcTRmsUulHW5gm8aNmWtA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ckd9x7niuqivZoMQktLwlPFgFlVGpR21eJV8ttNJJ8kH9/g2nI3r50SDXOcnP8ju2
	 F0zijok0SZTGVYn9x8k+sM/gh0/fG4wUuXiFnJoTZ2Mp8HVqOQJ1FWg1dcjY1OmarT
	 bovWJCYXRfw9mbMASEoXMpbf9Z1WZ20d5D5FlSkdTt3LSX+okpwi1PRhwjUcbR3wzC
	 rejMKRzFcVCYIEbIF5uJF057iHTBGRym5n72OYc/MTI8DCRVOMTeZ/CDwqTPPsxJnV
	 GY+oyBrUtlGvB3ESh+/wC2VO+CKKSDWbeWFIPL3zD/WfFCMKpXBHytH0xlMepwJSc9
	 7rt0nD9pXTXuA==
Date: Sun, 10 May 2026 12:45:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 CTCaer <ctcaer@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 devicetree@vger.kernel.org
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
In-Reply-To: <20260510-bm92t-v1-2-dff3c9d22426@gmail.com>
References: <20260510-bm92t-v1-0-dff3c9d22426@gmail.com>
 <20260510-bm92t-v1-2-dff3c9d22426@gmail.com>
Message-Id: <177843512403.3129177.1242304266533062844.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller
X-Rspamd-Queue-Id: EDBB65057BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36494-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,linuxfoundation.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sun, 10 May 2026 23:08:55 +0700, Alexandre Hamamdjian wrote:
> Add the device-tree binding documentation for the Rohm BM92TXX family
> of USB Type-C and Power Delivery controllers. The device is controlled
> over I2C and signals state changes through a dedicated interrupt line.
> 
> Document the rohm,* properties consumed by the driver: the optional
> VCONN-enable GPIO, the DisplayPort alternate-mode toggles
> (rohm,dp-disable, rohm,dp-alerts-enable, rohm,dp-signal-toggle-on-resume,
> rohm,dp-lanes), the suspend/dock tunables (rohm,led-static-on-suspend,
> rohm,dock-power-limit-disable) and the four
> rohm,pd-{5,9,12,15}v-current-limit-ma per-PDO charging current limits.
> A graph port is required to link the controller to a USB role switch
> consumer.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>  .../devicetree/bindings/usb/rohm,bm92t.yaml        | 128 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 129 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-5v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-9v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-12v-current-limit-ma: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml: rohm,pd-15v-current-limit-ma: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260510-bm92t-v1-2-dff3c9d22426@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


