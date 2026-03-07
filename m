Return-Path: <linux-gpio+bounces-32730-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKz4M+pGrGmjoQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32730-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:40:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E422C798
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B3ED3019145
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 15:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44439B4B7;
	Sat,  7 Mar 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK16Q7fS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2827F00A;
	Sat,  7 Mar 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898020; cv=none; b=uwPo/rmKKxMOPNtb+I0v3+fXSbJwzgTqGCBkCk4b+nhsHrrNXof/SRZjZC5jf1bq/IiqgviUbQeFWmi6juK58drSRomjUSRc6A4ysub8tNd5qvRKFZEg5X+dTUZszKhhf2Z69SSl0BwghaKzTzshP1MIdEknDm87ppyw12tsog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898020; c=relaxed/simple;
	bh=TcSYv2XE6FUur22QZ09nXgAgT1e6E+bpWaICLXeg+Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnHHXgLZpipFeFBjo16oumx05k8aCmzT3DZa8WpJeW1RE6ZsZSLMKrICEqFOXJAKiFZL9TFPZxZ6zPn/c4FPAyo/pBXBP1hVSLT0dGNrvEg9B6ebuEXNJGVzJJ1JeY79xacdQsNGLjX1ZVo4OtGSk/IA6iO/i+j5VhZpzBK9wR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK16Q7fS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08ECC19422;
	Sat,  7 Mar 2026 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772898020;
	bh=TcSYv2XE6FUur22QZ09nXgAgT1e6E+bpWaICLXeg+Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vK16Q7fSVC74GK2sJr4Lq8icmaS37X3sHrhJytgUpUg+7CGl+sOJIGeJx9nKw3/+6
	 N0WPz+OYC8MQ1FiMnikpjynVClc7IMfaD6YPMAYbIKi20/krw7UkEZWlswH0HNr7Z7
	 RAa3iACvo0mwT2L95GrU/zmzK6/WLIlceVaUrnCi4+J4LJa0R4vZaoLCbzJsOhJ9NX
	 a3ffVqvph3PKAdCckmz7561pd0bErlkPJ0CCxHBdpNc9UlokBCNJ6HkRbBBfoywou1
	 YsX3AX9q4O+yHxBQoWEmk8QODixUQCfTsCQ0yTf7yXgSqajAuU1EalgE5E/iGH5NOq
	 rrzrVAH4gRb5Q==
Date: Sat, 7 Mar 2026 16:40:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
Message-ID: <20260307-loud-bull-of-revolution-4cd0f3@quoll>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
X-Rspamd-Queue-Id: 4F7E422C798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32730-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:22:15PM +0100, Luca Weiss wrote:
> Add bindings for pin controller in Milos Low Power Audio SubSystem
> (LPASS).

Subject - "Milos LPASS pinctrl" or "Milos LPASS LPI pinctrl". The LPASS
is crucial.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


