Return-Path: <linux-gpio+bounces-33369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIgGDR0ZtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:03:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C274284734
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 160ED30A9030
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A541939B944;
	Fri, 13 Mar 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnADfsUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62239A072;
	Fri, 13 Mar 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410117; cv=none; b=eTnH/EZ/8eaWWEv7tOsPC212BRy23DKMT/jZyE9giQw+Fimh0cgwahoMcEPABi8BuLjjDvGj7dK+PspzAmPkcLRwMVqWelS852kgbY1IU9iXEEtxzounwb7xPUqzuIKZ1Li759ZN7MkcsmiDZiVVnzXkK/qrfapoZA4xnWn7ND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410117; c=relaxed/simple;
	bh=i3AGf5Cl4JxixU2SwH05GrtCKPGtQgQLPovWbx4b8Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6wk1W4lT453HLtb5Lovk2sysYawtYoB2ti0G2E3VgCyBXiNsb/I2ebMpePS9u50ldFkx4zjN36sEg99CDg3lbbzC1rplAaTAL0GoRCU3MWjs5oM/Uf16EcLY0QS05iWWllJ/MXy6XWVrMAEaNW3ht/E5qYdNn7g+6aR4hpYcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnADfsUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386B4C19421;
	Fri, 13 Mar 2026 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410116;
	bh=i3AGf5Cl4JxixU2SwH05GrtCKPGtQgQLPovWbx4b8Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnADfsUo18OTp3w/nrN7y+zMt+rCrafeZUso/zE9M3ZdSP/+1M2k6Q8Xo/G6ZfRAr
	 eeiBhJKarxWhzGhXYx97+lMKeA/B0F1oIc+HMJvJFAlaH+MSaqo1d1NUsgaUBMjlzp
	 ems2y4eBlfQjYEvVAluegYZf0PMwUjaVgGV5zGSNOyg+hXBhpJmGulIAGiECv+KwG9
	 egaIMXzQDY3svUJtaKiKjdo7X1zEy76HKxgVA0HTF/LFXDtd8LR1XV1UkFJRwtCu4H
	 Ocz6IDUeW3sTfkUkJ4N09Y7bEZB0t16FYxZP2ND/IjY4w+5aViLbUpot07Rg69caK1
	 5d3P66+8mHrhA==
Date: Fri, 13 Mar 2026 14:55:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] dt-bindings: interrupt-controller: qcom,pdc:
 Document reg and QMP
Message-ID: <20260313-hungry-mini-magpie-db50de@quoll>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-2-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-2-760c8593ce50@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-33369-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C274284734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:36PM +0530, Maulik Shah wrote:
> Document PDC reg to configure pass through or secondary controller mode
> for GPIO IRQs.
> Document QMP handle for action concerning global resources.

Don't explain what you did. We can read the diff. Explain WHY you are
doing this.

> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index 5ad68b2c6fc630fb4044c7224e6791d3bf4c2937..00eb9b28170c29c811c17b1f02f1f4f14779752f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -62,6 +62,7 @@ properties:
>      items:
>        - description: PDC base register region
>        - description: Edge or Level config register for SPI interrupts
> +      - description: PDC config for pass through or secondary IRQ mode for GPIOs

I do not understand why all devices have suddenly grown one more MMIO
region, including devices for few years in the market. Nothing in commit
msg helped me to understand that.

Best regards,
Krzysztof


