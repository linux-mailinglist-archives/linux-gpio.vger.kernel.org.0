Return-Path: <linux-gpio+bounces-36794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM86LRoCBWoHRgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 00:58:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D81F353BB38
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 00:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0876A3017D36
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 22:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EA43C1F22;
	Wed, 13 May 2026 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEQlIz4s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409537DE85;
	Wed, 13 May 2026 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713109; cv=none; b=U17wIei+Z5rxe8zSum5hukG4GpcC2OKr8cMQ0pU/PYUlxOzhfgWLLX6X+8tkrMoybfrelOU5vOq4aBujv19vnwC0ykgNtEglbPrb3SayeiC6uOsQVojwZALNHRu7Z4BQKqqqRu3KJMyY4D/dydy6NiLLIF1UO2otPe5C5y7TAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713109; c=relaxed/simple;
	bh=zlBTwzflBsH4rSnv5LOQSnlcKftAp1SttekCmDJvCB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaztWgGNOuYw/D0Xq9ExITqLmYiSnOWg09gop30tZS7q9ExFXpSFCw68wUqx4f6tNeY8G6/4A35/PF6FeeDzyFWtfel4kLSveJruX6JhhreOldKxJJYSjMgxRllIf8hVUAdn9cT8QVzMIlGcJM1ZoDCtgbhi/hj94ckFBI0W9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEQlIz4s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3EEC2BCB3;
	Wed, 13 May 2026 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713108;
	bh=zlBTwzflBsH4rSnv5LOQSnlcKftAp1SttekCmDJvCB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEQlIz4sE3Ov596bfrS/6THHTWc1dIuSKdfCnwWMX4Rkt/sIS5F6yD/wHPYtzXvYm
	 PZHIkSTbPtPwLChPgNwWwXK1Imgb8zZ60fUB3gGNO24qpoVA9JrXbzDTbQnNlYdvso
	 j/ZxwGviUdah/3qXAtK6SPkukeCTPcqUSlsKEZGBpmvN3au7p+azyCQ00SJmHYEUKs
	 XqvwO8i0XG+zm8TMjcVXdTZpCzAdDdQnRZBpQrwiC7H/fMsMcQ2r9Rl4lnGD29e626
	 1V92nL68vNSHqxKsTTLwVfgim6JKtswlnW1sbXKbNHPjkDBJL1yVbGQ1ZHZAFKPgN0
	 X3MeupQDqsY1w==
Date: Wed, 13 May 2026 17:58:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, kamal.wadhwa@oss.qualcomm.com,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	David Collins <david.collins@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Document
 PM8010 GPIO support
Message-ID: <177871310477.2257915.8785454607441571091.robh@kernel.org>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-1-3bce9da8d2ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-pm8010_gpio-v1-1-3bce9da8d2ba@oss.qualcomm.com>
X-Rspamd-Queue-Id: D81F353BB38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36794-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 07 May 2026 22:34:07 -0700, Fenglin Wu wrote:
> Update the binding documentation to include the compatible string for
> PM8010 PMIC which has 2 GPIO modules.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


