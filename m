Return-Path: <linux-gpio+bounces-31174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAJrDUcOeWmouwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:13:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3199B3D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB785300898C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BCF366809;
	Tue, 27 Jan 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTVTZonw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B843644D2;
	Tue, 27 Jan 2026 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541186; cv=none; b=XiybmK0DfjNLYC7VlQZ98R3G9e67feg0hve86NtMiiUvExMeUjiXBlZ4OPm9ZBD5tqRmGVBcPk4nsTQkb+jdLKz6X00rp63XufoggEfrL+fL7eP4IEGzyeI2RT06Q1Dwfi/lDvcBuRXr1858pNBA4GIoCzw5lRuSAZlbB+lCuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541186; c=relaxed/simple;
	bh=InuBqlKC2ctm0QGwTBm2GvIw3CPSzJ4MKi/Nd81l9l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dmx8lgNBE6Zgj9ioDq1Vi+sj/HN5B1mDx113WLCCmezc5SMOLTSbiTb6hK72+p7MxNOGQsmFw6X/FfD1Vy0Ldwl0CrC7Goyf7ZFTrvogDPyJNgJcFLJ8XFPcjlIRCA6Nb9VXr/DQWA4LyCMtt9qRUmB55d2DOZ8kFVbCrl2Ya/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTVTZonw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97F6C116C6;
	Tue, 27 Jan 2026 19:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769541185;
	bh=InuBqlKC2ctm0QGwTBm2GvIw3CPSzJ4MKi/Nd81l9l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTVTZonwj6xp+egt6BBvhoqngNq6TOmu/36Y8553sm96DsG09wUfjvYQeff7M3qaV
	 5jGK+Rx1I00Dv5Ve38DTU77DTHzyu9JWk+p9mGXXNEbLwX6ovST/G+vARbt4ptc3DL
	 06WVfo4tVYNSa0gHC1queipKw+Ddkfi/4MjW1STr7fyB1I68yrUL19zHHq/2n32ism
	 D0ZUJLfzQue1ivxNrSwwMvQ7zOHbZLXbyO9UXWqQlhYqG2Ug99+oWU5h4FiUzmZm1U
	 7BlvCiIAfPJOM5EWD908FlXHLytzNUqK0fzn3wN23w8w/YBU/NvrPOlOPyZLYilheg
	 TdfqIngfe0ukg==
Date: Tue, 27 Jan 2026 13:13:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Message-ID: <beakcgwwx3nc6e7isgajj2glajveidt6sleunfk3k3jkaeeqsa@fxstyhvzvkwn>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-31174-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 84F3199B3D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:47:35PM +0200, Abel Vesa wrote:
> Add the pinctrl driver, document the bindings and enable the
> driver in defconfig as built-in.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v2:
> - Rebased on next-20260126.
> - Fixed the gpio related properties in the schema, as reported by Bjorn.
> - Fixed the SoC name in the module description in the driver.
> - Dropped the defconfig change patch. Will send one later that includes
>   all basic provides.
> - Link to v1: https://patch.msgid.link/20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com
> 
> ---
> Abel Vesa (2):
>       dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
>       pinctrl: qcom: Add Eliza pinctrl driver
> 
>  .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
>  drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
>  4 files changed, 1697 insertions(+)
> ---
> base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
> change-id: 20260120-eliza-pinctrl-7bb592ad63f1
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

