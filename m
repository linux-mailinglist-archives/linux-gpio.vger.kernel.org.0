Return-Path: <linux-gpio+bounces-36111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPa/DKiT+Wm/9wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 08:52:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE24C7585
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 08:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D40E6301D322
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 06:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140B73CEB8E;
	Tue,  5 May 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqOfxz0F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64783C1985;
	Tue,  5 May 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963938; cv=none; b=k0JrA4/Dw7y8Y+QR8KoMYsrEeRtOJNwpCRcy3opzvb0gLKl8Q9VLDy0vseVsAXRw6MzfdpdaKl2f9v2xOJ2/bQrtzPgzU4DHM33ph2OxASuEAvTgnLX/Ql21HiN8K+y/nTWyyG5M9FC1LyzwnzsqHWrsTQA4bGlF+4I2ANCkzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963938; c=relaxed/simple;
	bh=zOL/0K1FBvyQMex+LGh8M+wwatwTFe/uvvd9bnxgPpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duz3j7pFBffEWfVf6DQ58A4ls5KcVS9bcrzBX+MFLnUN6vxEW+V3HlIcdTlV3bFxvjLCsWgir2IucFDon7AC/vlZ0nI7EVwf2ZQGBQay6TgUuqVLbLstPI2UzXDc5fXxjtnZose2XHMcEwgJMtLZ9Cv0ZxKl9niI4K4tm0AAVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqOfxz0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6A8C2BCB4;
	Tue,  5 May 2026 06:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963938;
	bh=zOL/0K1FBvyQMex+LGh8M+wwatwTFe/uvvd9bnxgPpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqOfxz0Fz8aYqks0js7hRngME7icV5PjqIfkeYWFUW8wZVS0I/rRjeobedfC8jiBz
	 buuplhPWRXXKQ6AdVS/c8NB4qbrITUYTv99n7QSVDN0Osa2uqSJbBb/DSvFTdu2zfG
	 vRrpjhbw9Ecprnkls/b6PK7ANGb8hbRjn+E36VcZ6uF/g/s4QndZEKjl+VYF8BfDTj
	 ZmDJeo6qZNceKmafKoanBwGRYUqTk0FYwTJvVxA6pvnyL80MKxeJAQ/42AJdoUqAKP
	 Tkhf4UXm59XQeS93AKihT/qQ5PzkO6wYs4eVJBYPonH291HwwTK2/rILlxFkjimVee
	 +LIHfd8bIvp3Q==
Date: Tue, 5 May 2026 08:52:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
Message-ID: <20260505-warm-attractive-pigeon-1cbd82@quoll>
References: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504064936.2754570-1-swati.agarwal@oss.qualcomm.com>
X-Rspamd-Queue-Id: CBEE24C7585
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36111-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 12:19:36PM +0530, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,ipq4019-pinctrl.yaml and qcom,sdm845-pinctrl.yaml are not SOC specific
> and applies to all TLMM controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> schema duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v3:
> Move the gpio-hog patternProperties for qcom,ipq4019-pinctrl.yaml to
> qcom,tlmm-common.yaml.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


