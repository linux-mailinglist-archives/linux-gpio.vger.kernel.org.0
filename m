Return-Path: <linux-gpio+bounces-35643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGNTIWZa8GlQSAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:57:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE347E5A1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3E7301905B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B524F35F5E9;
	Tue, 28 Apr 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpk3zKM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D9346FCF;
	Tue, 28 Apr 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359270; cv=none; b=TSyc+jTTMjLJtpKvECyeKm6BzqSWQ7EMn/AE+FEDNZYvaDn8g6UXbAzE8LsmXpXlNN07l5cIARCtT86xx3G650AkYeS5E20MBSFdlONeJMUde6uvALFFA0+BCcmEWlDFcvUuUsC0H/92whovCGOcwGa5FO6xSVbpAjnL7q0y/qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359270; c=relaxed/simple;
	bh=9SzAMHC1Bk9OFW9wbPXHvFdw+P/zt/O69YFPceKfcfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT3Ur34yhvDl5rlLv/5NECobDNwUC/OqZYThYm54beY+yHujREYgPJaUUco73d6K7uKErjJGLIt57sOWp6hzOC2fWDUcPWThxR84V/nt8iV6V3l00aVkV4vZl9nr09xFlTqlKiGCq8dRu2Se+zhqoWT5pY/yszJLXIOvKF7Ce6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpk3zKM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88870C2BCAF;
	Tue, 28 Apr 2026 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359270;
	bh=9SzAMHC1Bk9OFW9wbPXHvFdw+P/zt/O69YFPceKfcfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpk3zKM/AkZO+upcRlY5QPn0HAWeSGSPjDPVBpIRMEFf7KMJcUN/gMfoc7rhQxtc3
	 WYwefyA2d0OK1NfdNuAHPOiTw7I0zAPyS9l+KSr47Xkcg5XYWaViR237n6P20dh/Vh
	 ZpiE/0uqnEdv2F+UqWgZZGg1SCSr+qECwMJ3UTBDT7cDfaPBPdXWIh3lQX/x5K0nNc
	 9mJbztz0+Gz87EhR08dgPE+EbiEYX9EoTKpp9uCUYPdIRvRHEVQf2Liulv7fnFp4+o
	 nRV/xHlegfGKot4pA+Qs+dgU4GleEUGcj2m65VgrH5CSxkPO5LrskgR0gFUw21Wfid
	 uK0OUjCve/RFA==
Date: Tue, 28 Apr 2026 08:54:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre MINETTE <contact@alex-min.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Message-ID: <20260428-delightful-locust-of-gaiety-bb6e34@quoll>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-1-dcaa9178007b@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427-mainline-send-v1-sending-v2-1-dcaa9178007b@alex-min.fr>
X-Rspamd-Queue-Id: 2AFE347E5A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35643-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 09:34:47PM +0200, Alexandre MINETTE wrote:
> Add the compatible for this Samsung smartphone, codenamed jflte.

s/for this/for the Samsung Galaxy S4 with foo bar SoC, codenamed.../

There are also non-qcom Galaxy S4.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


