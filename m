Return-Path: <linux-gpio+bounces-33355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPsnEdgPtGnQggAAu9opvQ
	(envelope-from <linux-gpio+bounces-33355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:23:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93003283BDB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DCDE32C52C5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D783D330B3B;
	Fri, 13 Mar 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gyx8AkzW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F02D63F8;
	Fri, 13 Mar 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407996; cv=none; b=EbKBP001MfQLgGAuQLeTElOE1UGrH557J1OMEk7WLPZLWNMpBKXzXbreklyU5mEUc/KKEitq6+61n5OBm/yNdLriO9CsS7n5tWbCCL18uXltMuTMnzxGucugBMv10ki1C75VAj+LXDlToZCNlq1bQ7RJ8XxXg+KCn38KSn3J5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407996; c=relaxed/simple;
	bh=jYpTtPxX10L7D7+tEXOdOG5rXH+lwybcE9CEM6ljdUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAURVdkwICvZHIKDGqOm5P3IDMGeeDQoGHRvXt6M9UVKaOcyRMwxTGMocH6m6UnfOwhibKMz7g8KXgQUvfgFpyfU+CCdkrn5I9BWMhCeEOMiLJGPYf+tUdnUUABTjd2EOBftntPhfm8jl+OBV4ephgas+1xK1Bc/9RyTiVjdJDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gyx8AkzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEE6C19421;
	Fri, 13 Mar 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773407996;
	bh=jYpTtPxX10L7D7+tEXOdOG5rXH+lwybcE9CEM6ljdUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gyx8AkzWLDZ4AFjRhRj/VmdSA8yF040cWjNhoVwwuD/jvH7hBh+GjCTosQcSrT/fQ
	 +Vt9rWh6e6TVq2ER0/kgdHRflhwaPhY5buk/26+hbHg9p2ZwOCGBs6uqf+eVKQ83Hv
	 hOGlAtBphNiqPV224+XVAS5qRrBrSrWeOKfReWR3ZqOPia9mINTHoYuSc9zO/6/JBK
	 OblRHktLqhnIzFSMVnX4uBv4ZPE0Vmt6mTMxjOit+kSOQUYiKBYH2n1IaKAS5wS8/0
	 UBzvNYbC4e8no85Y8CD+oWBSj+yRi6uwN9jflNqPFfoFnjCSLAYH0UnNnf7ft09z0B
	 IU1SIDfL8tkTA==
Date: Fri, 13 Mar 2026 14:19:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
Message-ID: <20260313-cinnamon-corgi-of-novelty-ce7fbd@quoll>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33355-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 93003283BDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:48PM +0530, Kathiravan Thirumoorthy wrote:
> The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


