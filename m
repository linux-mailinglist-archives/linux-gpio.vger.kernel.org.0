Return-Path: <linux-gpio+bounces-36117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJteN0C3+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:24:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8F4C990B
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65069300BBA6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3609231E82B;
	Tue,  5 May 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udXdvFWz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B131714B;
	Tue,  5 May 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973052; cv=none; b=f0TEVPqSGM7ijgNtT9MhGqjUe/Occo+nhTqSqRb5YWxqzupxlt4nNY/5NANTP9AuY8BgF0Q0tPObL2y1EzVOhHZHCw9keco1PPeUYswM6XQyAK1x3c3D9tVuqYhzghzAHfZvQRDXni4hG3/hgAF7pgIb/Dn1YyaBDR2QGazydWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973052; c=relaxed/simple;
	bh=3SrJ3Y2OZeVig+hB+QVCtgmxYn2iYlFfYELljNOSEGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnsfawhKctK0v5ku+4YWqgGogELs5NCzqA2RdYe6OTzpfGvq+sv/o5eaKr3T3+R7gZYfQAgLAJaIhdKJWAA3713vaGP1GOcyJCQVSTvUaey/03SFf6gWXip8ZxCGdvexOrIG2oVJDyik2ABiRzP4DVahN+vs7mDFthrY/PF6FN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udXdvFWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D5DC2BCB4;
	Tue,  5 May 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973051;
	bh=3SrJ3Y2OZeVig+hB+QVCtgmxYn2iYlFfYELljNOSEGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udXdvFWzP8LaZ8N34gmcWLAlzbwMRYrD+G1a/lTDVlNy45XHdG0utSkPF2E+wfrIR
	 TRYNXHyxVflc52NFjn8+nSVLVhY94mwaetnkI30EKHTMgs1fXdLf6lmke/7gXvyNa0
	 yyJMxHFYGGz4MX0IG8zHFJPCuNyJAPU2b++Sd0ZghIixVOjZTIIalpCMDqXDa2vGl2
	 gF/ewa6D8Wx9gYR+JKp47tYbRwlpSSmsmyCFfqahTntgIBQ/DewJPIbvdrbpqJ9tKS
	 gciF4RFGX4P4HWXbL9+CVgxsjvp9RgHHNTYhPp1sZbsMf53FGWn0dkcQrk9NoT/ypT
	 V59V8QZ9LsROg==
Date: Tue, 5 May 2026 11:24:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Shikra pinctrl driver
Message-ID: <20260505-groovy-loyal-bee-0cf72a@quoll>
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
 <20260504-shikra-pinctrl-v2-2-14e9dcc2d685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-shikra-pinctrl-v2-2-14e9dcc2d685@oss.qualcomm.com>
X-Rspamd-Queue-Id: 88C8F4C990B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36117-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]

On Mon, May 04, 2026 at 04:18:43PM +0530, Komal Bajaj wrote:
> +static void __exit shikra_tlmm_exit(void)
> +{
> +	platform_driver_unregister(&shikra_tlmm_driver);
> +}
> +module_exit(shikra_tlmm_exit);
> +
> +MODULE_DESCRIPTION("QTI Shikra TLMM driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match);

This is NEVER placed separately from the table.

> 
> -- 
> 2.34.1
> 

