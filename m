Return-Path: <linux-gpio+bounces-35223-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ9ECEPV4mm++wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35223-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 02:50:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCE841F818
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 02:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EAC1301370E
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 00:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6C724501D;
	Sat, 18 Apr 2026 00:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJZ5fNIR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F016175A91;
	Sat, 18 Apr 2026 00:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776472770; cv=none; b=UiWdwCoy8vKkCpHDxy+5vHWsZj+WtQRDQgpPaIkdsuWJFK42IORsFBHU4/bq0c8BJftydyvoIGSwydCBUHmjdYJv0/Hoc//wGy31zMnQ61labGH0fKIlaH2xoTCDfoqz6OKBxNZuVTJM6nBjXWk0TUjSTvpOBrkHNLIEeIzGMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776472770; c=relaxed/simple;
	bh=b372NDYq44UfFAC/z9eXlIkHcS6zAx5W1MVX5qnMiz0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=V8/W2tsBroCjOAX/jslM7pTuokLzfsrgwaNcIhFGq+q4fwKO2bx1SLiKwo1+jJ0oxr8XWL2sYcrO2U0Kq+0brI5kwwSiVtjHbVuppWhiG+aPTlzzNs6u9iZ1xGXO8RmTpXwy+IeIj5mYHt83MArJ/pH1mcPWJMyTmFmn4jaTMvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJZ5fNIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADC6C19425;
	Sat, 18 Apr 2026 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776472770;
	bh=b372NDYq44UfFAC/z9eXlIkHcS6zAx5W1MVX5qnMiz0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YJZ5fNIRUVbFQ+U1e9W8Ny09u7NrW0y/Rx0HQPIXjW5RXz7a7IQCbWE6Jcn08VwZV
	 elrrU+4oZwBCxBff51WVi8SYHd23IY2mSAGkZIVJrqsogMbX96v6aQ4gzTt2sTqsFn
	 eOHvvRRHL6wpYtpu63esRqoxDGX8m+DEn17LtcdDTRHNpwSVdRwZRIkx3JNpqS9dP7
	 00ifdYHQTGyTA3NDw2vrk6JP6DGU7rPBTd1z53F1D4ChBho4w7k4uHrgE44tS7RATw
	 DsWRAEjyU4HfEJrFP/+iSFvn3i4zVjsoPyIEddlKOFrLBnKs/MWlTOhCBgz12kNUCO
	 9eYkmbBPFx0DQ==
Date: Fri, 17 Apr 2026 19:39:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Ondrej Jirman <megi@xff.cz>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Liam Girdwood <lgirdwood@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
 <20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com>
Message-Id: <177647276773.3416847.5121391765535033685.robh@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: gpio: describe Waveshare GPIO
 controller
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35223-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,microchip.com,ffwll.ch,vger.kernel.org,kernel.org,redhat.com,edgeble.ai,linux.intel.com,linaro.org,huaqin.corp-partner.google.com,oss.qualcomm.com,xff.cz,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.762];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 7DCE841F818
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 18 Apr 2026 02:16:22 +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight.
> 
> Add bindings for these GPIO controllers. As overall integration might be
> not very obvious (and it differs significantly from the bindings used by
> the original drivers), provide complete example with the on-board
> regulators and the DSI panel.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: panel@0 (waveshare,8.0-dsi-touch-a): compatible:0: 'waveshare,8.0-dsi-touch-a' is not one of ['anbernic,rg-ds-display-bottom', 'anbernic,rg-ds-display-top', 'chongzhou,cz101b4001', 'kingdisplay,kd101ne3-40ti', 'melfas,lmfbx101117480', 'radxa,display-10hd-ad001', 'radxa,display-8hd-ad002', 'taiguanck,xti05101-01a']
	from schema $id: http://devicetree.org/schemas/display/panel/jadard,jd9365da-h3.yaml
Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['waveshare,8.0-dsi-touch-a', 'jadard,jd9365da-h3']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


