Return-Path: <linux-gpio+bounces-33983-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIzUGVm7v2kA8AMAu9opvQ
	(envelope-from <linux-gpio+bounces-33983-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 10:50:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C175F2E8BEB
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 10:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47FB7301225F
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFDD3246FE;
	Sun, 22 Mar 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsRQemKQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA89199FAC;
	Sun, 22 Mar 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774172970; cv=none; b=dOYdIxO+Mp4n0/gPiDwjgx1vLEtInYwLMwykXmKjdkA7hAIMkOzkOvCjQBa5FHlIpxry7X4DgzoWmfhKiey199fKXew9FnJM/w0w1ZB9NWfdMJMfswQnHBcMwhuQs8uyYdISkSFXq6GYEzNgri3EdFM3Bg6snRNViFW1GrzwiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774172970; c=relaxed/simple;
	bh=XwnzFYOOx8j8S7nVTfFcmKvWbgopX6eCt94tmTwPYOA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aSqqxUcICXDr2VsigofTEeHc0DpIbRmyyxseoNFlOUEfNWpMj7XBWiZ2057zkJpczNFTUXhGz8t75PaFdrdBUqKzZaxsDs68rlltv/azpR9rthu5QKCVxJBMQTjrIPXTsFLHEYmBx7lR4/o7upQ5bnZOVjXqa8k4lXyhsEiCSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsRQemKQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ADAC19424;
	Sun, 22 Mar 2026 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774172969;
	bh=XwnzFYOOx8j8S7nVTfFcmKvWbgopX6eCt94tmTwPYOA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ZsRQemKQldQxCCKyP6kD9r7hWU1lvtsayUPxRtK4o2IwjP13SAZeGQs3SVhrHmSF7
	 d7xzTycQcCWGgJtsh4IHAm6w9k10GK2sNzHlXDnKEmP8BTju9PRmftfgJGYULGuu8L
	 6yOOcRgqCKyfZjIIzcdcSq7nHvrrTUQ3/m0IwP8ZDebhK9xncdbJojt1zCGGuuxHYc
	 A88hKsXZnGu2voVfDkt86nInKOlg0Lia4sdTAra3NZW3VUDBgZw/bArljjSCmRHaFV
	 srgxe5UNxLnuzofBfFgjLKz5tcyXtWAHmPV9Lzh2FklJW/UjTSTS5b+MKf5j4zvyJ1
	 vVN5GAI5XGLiA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 6/7] gpio: dt-bindings: Add bindings for pinctrl
 based generic gpio driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, 
 AKASHI Takahiro <akashi.tkhro@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.og>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 arm-scmi@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
 Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
 Michal Simek <michal.simek@amd.com>
In-Reply-To: <047c75a48d76a0f11f9fcd156ace3b5fdaab10ed.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
 <047c75a48d76a0f11f9fcd156ace3b5fdaab10ed.1774087290.git.dan.carpenter@linaro.org>
Date: Sun, 22 Mar 2026 10:49:16 +0100
Message-Id: <177417295617.11360.5679383620327581996.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049; i=krzk@kernel.org;
 h=from:subject:message-id; bh=XwnzFYOOx8j8S7nVTfFcmKvWbgopX6eCt94tmTwPYOA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpv7siShBrfknlq/vAIILHsJalw3Z1NyOPfBFRF
 qkhKp4GdnKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCab+7IgAKCRDBN2bmhouD
 1yfvEACCbrnJBWvOrwxG2Ltg07KBw0rNoraE0O5Jnwhkl93IBcrjzspEYIoJh/hiUxmsYWzQz2x
 a98QFQHloIKljhIKQSwEOTFpsPhDdI1zYTW3Crpvp+JX5CQvXCjIc4gpNdtsouSAYl9Ay9a9Y7T
 8rs2lb+cXkS3r4w4UO7niY4KKT/HrsvT+UTq2XEiwMasJQWqotFrRBkJReE/Rg5MiLmvn/HvvOq
 F0Z5PojmLQKObE7fR+JVvqVay/boiopl6JZzVLLXxjY9wD5z4MjQjHlKXO+PNXe9skcgSGXApqp
 kqoU+xNUqi4Ruv+zCBrKMYYJxUCMTeVXyTCrprfOzxgqgbrzMe9AjGHHpvcTgXAIWQx3YoL+9W8
 l3Th8f1n1fsiMIHO00IK6v+dQI4mkRBRo8RcFLGs6bnuSNmOtpyNTavZIDAVCVNiAYcjdKNEPx5
 U2P4UYG6+ZLsah/1sZ6tK6KQUegf76By7mwnULT7e7MGz0i3VL9t27eHSUd3CskEj5rxhcysaU+
 vwab4wt9DlGqGfeFHWj0i5x5f0j3+X+LskFqrAWYmhF4x9imp6+pwQZvK4EZEoedUuvFse+/MwL
 gam3uFFTjhvZjvFzRWG2vTLvS9MieS4/l24dGisYejbd7K/dJ6tiXqvYMMn+GwsAvp/+SlnKi1q
 SFQIrasqDd6UW7A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33983-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.og,vger.kernel.org,intel.com,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: C175F2E8BEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 13:13:57 +0300, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> Traditionally, firmware will provide a GPIO interface or a pin control
> interface.  However, the SCMI protocol provides a generic pin control
> interface and the GPIO support is built on top of that using the normal
> pin control interfaces.  Potentially other firmware will adopt a
> similar generic approach in the future.
> 
> Document how to configure the GPIO device.
> 
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Subject still did not improve. Drop driver.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

>
>
> diff --git a/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> new file mode 100644
> index 000000000000..9d20b5f23cdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/pin-control-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pin control based generic GPIO controller
> +
> +description:
> +  The pin control-based GPIO will facilitate a pin controller's ability
> +  to drive electric lines high/low and other generic properties of a
> +  pin controller to perform general-purpose one-bit binary I/O.
> +
> +maintainers:
> +  - Dan Carpenter <dan.carpenter@linaro.og>

Typo, org.

Rest looks good, so with subject fix and above:


Best regards,
Krzysztof

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

-- 
Krzysztof Kozlowski <krzk@kernel.org>

