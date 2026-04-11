Return-Path: <linux-gpio+bounces-35053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHSgB2ZX2mn/0QgAu9opvQ
	(envelope-from <linux-gpio+bounces-35053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 16:15:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CA3E0461
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 16:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED9C6301F1B2
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB32DC792;
	Sat, 11 Apr 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfHU50fY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DE52D73A1;
	Sat, 11 Apr 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916128; cv=none; b=jlgFPyPJpn8kSKNR8x2Kj90l0WsXTZgOY9rql+dD7o8q8A470UTxsN1pnx16XDWV+cp5srlUkwz1yXON2J19tlrThWJfZfx5kGQDbc4PzhRXWT4rjEcVEFbxjpc/14nNQuFk4aZBbGTpCMgMCdt2/b2KqaH1zKHNohYFKngC9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916128; c=relaxed/simple;
	bh=HifjkcugVN1bUR9aUlAaCwwsoa3LDIAOA2z2Ky7FFFU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rBCPmxelIeeBxxgsslCTNeJsFrMcbAzxqEDCDCIrLauDkbmJgZHcdbn0xa+X4r7xfw6Qlw45lOMUNvSObzVHLQhD0aUOnW5hY88AiM/+PF2NkAqTJzfBHvBUau2H9+puL7Rj117pFrP9uk3ukwKfS1fudCJmgeKJ+1/CdxsI22w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfHU50fY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5576CC4CEF7;
	Sat, 11 Apr 2026 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916127;
	bh=HifjkcugVN1bUR9aUlAaCwwsoa3LDIAOA2z2Ky7FFFU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lfHU50fYbMJVnv5moMPuvMFtO2ZbntH9O+ewCs5yyesb/p8nrUXixKYEIAUYN9P7Z
	 j547ednK4t31ex6305byYUhlFuEc+W0XU9IsjIbLU8SIUkkyu73ohUGtFQchYLevDy
	 SHHMn932dZyV2lOfhshssweJDAga297XOaR9ps20oy8JbNBu/TWzVLgnRtqmTDvfEe
	 GyZBks3pvlkPhUpX+3E+7MftcJUQkpgbRfx1r8NQ2cE//FkRiDGnOn7iVb5JKLB3k0
	 +eWrYssGh0RvMLK8RtpikZqNpQ4+9G7sXD7g3a/iBW41hB0bPgQa8K3KA3zXSCOygS
	 UWLXuhdQAUGOQ==
Date: Sat, 11 Apr 2026 09:02:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Ondrej Jirman <megi@xff.cz>, Maxime Ripard <mripard@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
Message-Id: <177591612547.2802023.3418602345377561200.robh@kernel.org>
Subject: Re: [PATCH v2 05/21] dt-bindings: dipslay/panel: describe panels
 using Focaltech OTA7290B
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35053-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[huaqin.corp-partner.google.com,xff.cz,kernel.org,redhat.com,linaro.org,gmail.com,lists.freedesktop.org,suse.de,edgeble.ai,ffwll.ch,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.746];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 6F0CA3E0461
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 11 Apr 2026 15:10:25 +0300, Dmitry Baryshkov wrote:
> Add schema for the panels using Focaltech OTA7290B controller. For now
> there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['waveshare,8.8-dsi-touch-a']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


