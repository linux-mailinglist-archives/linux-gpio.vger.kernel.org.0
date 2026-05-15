Return-Path: <linux-gpio+bounces-36897-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCELHkDkBmoJowIAu9opvQ
	(envelope-from <linux-gpio+bounces-36897-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:15:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462F54C327
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 475FF3051711
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CA642B72C;
	Fri, 15 May 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTx3goVq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD4410D0C;
	Fri, 15 May 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836030; cv=none; b=ulCS1q+TRZ5V7e3XopWio17ZeCnGU2ktjloomTiTv9eEjeJ1Fkt8ZqLl7gxwr4Nddkaw8TpIV4JBdT3i8ARmhdS+dDImgLB2VRtZozGT7GaqQf9z4VBNYcXBJFHP7TjVPJW/9K/vLUvaiQ/CLyYKriR1zJC3dXQCJ8dvHiRzbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836030; c=relaxed/simple;
	bh=NuyZau/oriy27secHkfqF9rN+3Eq5v2xlm64aaw/hdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNPegv9A+sF1dhyQGWCWTmEg0cBsLKffOCOoDJ0F7JXAap5etfkIrQSMoFhbMbMeNFJkrTn9GzAqeNw8dilroDwVj6nvHeM9k5C/FCkTXcnJthJRc9j4w6tA61BbfQiS35Ir/v6YitN5V4TBJqCLFRhfb+pK7yFPvt8Df+h8yKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTx3goVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49453C2BCB0;
	Fri, 15 May 2026 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836029;
	bh=NuyZau/oriy27secHkfqF9rN+3Eq5v2xlm64aaw/hdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTx3goVq5LbUdUQ0U5ZSa6QaOA84fM+6/bPZPL4VtFDfDDMN4M6c4wNi9/xpmijaB
	 p1qj60XU+qrngzgaUa7ZcRqk74lZ0ymJm757tLAwiIeb5WKQ6v/0HmGo8SoEtx4OCQ
	 b8E62kS+W5quWySawxGrZLHlVZZmsJ8ZTUphUYxEDa/qpAjhYKQWXISRxO+7WIW9i8
	 cHghoOAqrwidbGAiiNzvi3tgc/5m8pa+wZ9kbWrf/BCo0sS5UNF/D4KHCa2sMbNRd+
	 l2tZ81UBEeoQnlMPnYBCYQ2Rswe0L0lkCAw7ca7pzmSGk4BhM6jAsoXO7DqhT5LJOz
	 Nqe4QwOUSGoJQ==
Date: Fri, 15 May 2026 11:07:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Merge
 QUP1_SE4 lane functions
Message-ID: <20260515-ochre-coucal-of-refinement-ed33c1@quoll>
References: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
 <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-1-1babc6118829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-1-1babc6118829@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2462F54C327
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36897-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:41:07AM +0300, Abel Vesa wrote:
> QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs. The
> previous split added one function name per lane. Since these are usually
> configured in pairs in devicetree, it makes more sense to have them
> grouped.
> 
> So replace the per-lane names with names for the two selectable pairs,

Diff is not the easiest to read, so would be useful to mention here
"per-lane qup1_se4_l[0-3] ..."

> qup1_se4_01 and qup1_se4_23.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


