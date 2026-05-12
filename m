Return-Path: <linux-gpio+bounces-36676-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEJlKQdDA2qP2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36676-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:11:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6D5235BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85B813062F38
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 14:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6652E3AFAF4;
	Tue, 12 May 2026 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byNxjpVe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF33AB49A;
	Tue, 12 May 2026 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595954; cv=none; b=P8Ch1Ipj/NcFacRS21gFbxCeqwf2/+1R6vAsANzaORpR9tAI1t+agpnRPxCSx0W2C5uGj7OW7q/zuCpv/iCbSFS2JVVpnlKxY8S+L28Q1B70m7iHcm5FQuXfF0e8pk7RhrBGBeNtM7eYRK5A9XWwJlPpcK/5XaNBvQCAGQV34ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595954; c=relaxed/simple;
	bh=wzHx8U3YU/VosQrKhU0dd/6zx1HBC6wt+nZjKdR/Wz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKmjTHgI68ZAcBZ3RFHmrTi2avy+FAIu6HBE79d644/1BagGTtoc20PIxHhQVvl+rRtuhu3toKJFBgm0SeUbYei2U5Cy50wRtDyJeqQ9XXWD0b6gYL7/SG3xV64pQM5ui6Ah8aBiMiARUcm0yNjW1yXnH1dHuglYsxGUAYDIHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byNxjpVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A095FC2BCB0;
	Tue, 12 May 2026 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778595953;
	bh=wzHx8U3YU/VosQrKhU0dd/6zx1HBC6wt+nZjKdR/Wz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byNxjpVekJys5eNoSvbc82GjaPtRMPRF59hytuculE24GTqZ7sdMmuzQhbTBiWUW5
	 Ge3jMvfWby2RTnXLPuv9kPvmvRtbYB4E9UbqnWKC6XamV6fsq2G4uf0eW9VlHWobG3
	 +auJPsrmNC6FhcuInoUmi/HhZ51Pt3caPtorh4/1OWACcBLHqbR7x7J2iScllUGmIE
	 NqZqZiC5Et+qOXvpfSMhGcSBVm+T5QatM8vZF6btWYSUVrzD9qqJA9JU5JCEx+2/2v
	 aaIRuiSkPonA/ergOXvA2OZ687gMDtA7MhMfYILrNwGB17Pc2eiKRk5m2p9M96SPdM
	 TFCmSZQqhytpw==
Date: Tue, 12 May 2026 09:25:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Message-ID: <agM4ZM5Xe10OGzDy@baldur>
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9CE6D5235BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36676-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 06:55:42PM +0530, Komal Bajaj wrote:
> Add the pinctrl driver, document the bindings and enable the
> driver in defconfig as default.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v4:
> - Remove eGPIO fields not supported on Shikra: drop .egpio_func, .egpio_enable
>   and .egpio_present from the PINGROUP macro and shikra_tlmm (sashiko-bot)
> - Link to v3: https://lore.kernel.org/r/20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com
> 
> Changes in v3:
> - Move MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match) immediately after
>   the of_device_id table definition (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com
> 
> Changes in v2:
> - Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
> - Remove unused UFS_RESET macro (Maulik Shah)
> - Add spaces inside braces in shikra_mpm_map (Maulik Shah)
> - Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
> - Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com
> 
> ---
> Komal Bajaj (2):
>       dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
>       pinctrl: qcom: Add Shikra pinctrl driver
> 
>  .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
>  drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-shikra.c              | 1253 ++++++++++++++++++++
>  4 files changed, 1388 insertions(+)
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
> prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
> prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
> prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d
> 
> Best regards,
> -- 
> Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 

