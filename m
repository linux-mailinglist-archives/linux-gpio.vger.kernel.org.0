Return-Path: <linux-gpio+bounces-34346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K2EFl/gx2mXeAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 15:06:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4734E9FC
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 15:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 163A6302E0E7
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 14:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180582E888A;
	Sat, 28 Mar 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+tXVDO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDABC18787A;
	Sat, 28 Mar 2026 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706777; cv=none; b=tztrvrn6DBSvERk02yFEis0NFmyYLg8uYfpG3FcstUaZRN2TRl79okE9nOEoydgb07fsN3jjyGORTt3vhRmUmMActVNiXPkBcJt1S8vXiLREE0EJkcYJQL4m4xojuA+N97y1HE5pQ+uc+PKb9CUtAnF5r675XM4VvOgoomv70+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706777; c=relaxed/simple;
	bh=r3AsAHaiY+EIeo9O20nkbuc6gADfEl6qhiOCW5IA9Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7/UnUgYMpQqAM61MfrbuS1mzeqMTXerxk8AJyaJPXKGkxceX9tUAlSiHNHT3UX+sof/OYHQSF39mdP2nH1RDNJBceS7WXyNsDppEuMN8hFeIzeX2Xr3QNQAhQwQLSGt0uqENvBP34S45Qb2Au8LoggrpEsBFTBpYglcxIZZA04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+tXVDO7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD36C4CEF7;
	Sat, 28 Mar 2026 14:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706777;
	bh=r3AsAHaiY+EIeo9O20nkbuc6gADfEl6qhiOCW5IA9Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+tXVDO7QppCVEIDirfP+cz8d3B3lDZqzuBwLYFg+V0A4nUHUZnhxTLQq5b2lRHlO
	 JMC77OkDBSk2Ap0W8lqMBkRGF2v8Pk/tjOlrRMAayoK9LR/C5y7gumTtanQTBcU1tf
	 mfAY6cIsUd0liaGtG4p3EKJRqY3NvJt/RQSY6S6NupUr/3ZEb09jBDV0Ydujj7Lssx
	 NhTCmg40nhb9RCFy2f0gd6foVn1OiZr+0H7YkcksTKfUy+OozjS/x2Qc+H5tQvy5/3
	 WXMu+kKCqLvPfuRSk8cR0ew1+Qk2XpFsdYDWhkL3d6PRYNMxUBkUQshEmBkwb0iYZ5
	 FxSqZNXBFAfqw==
Date: Sat, 28 Mar 2026 15:06:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved
 GPIOs property
Message-ID: <20260328-laughing-cute-whippet-c83b56@quoll>
References: <20260328021036.85945-1-mailingradian@gmail.com>
 <20260328021036.85945-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328021036.85945-2-mailingradian@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34346-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B3B4734E9FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:10:32PM -0400, Richard Acayan wrote:
> There can be reserved GPIOs on the LPASS LPI pin controller to possibly
> control sensors. Add the property for reserved GPIOs so they can be
> avoided appropriately.
> 
> Adapted from the same entry in qcom,tlmm-common.yaml.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


