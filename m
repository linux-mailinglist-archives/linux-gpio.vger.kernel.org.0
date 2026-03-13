Return-Path: <linux-gpio+bounces-33371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HTNAZoZtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:05:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC252847D1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2120B304198A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB5D38D687;
	Fri, 13 Mar 2026 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egCCOVNc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400439D6F7;
	Fri, 13 Mar 2026 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410177; cv=none; b=masQjKUgbcjgyYoZwzFbgosasIZvFKvK8js0XmlpRU68wEbUGzxsX0j7eBfU6w/Z7hKAmyLz0dPgzD7GLTyUfjiknywBqXjEO5wj6H6PyrykBb1u5g2323HXZGS6VzEvs7akZVu96QBvT35LhVHOoq8ldz2T4EApxdAwC4JhVRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410177; c=relaxed/simple;
	bh=AfUuvMmUPh7+rCPHo8vBeqM7WKY9Juqcu4mjMPVhq74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWX3KbMCVIiKeC9k0lC85zQLaxeR0gEfhrOq4c0B+TEwOsMJ4fK8NcjBoh1Oa/GBJCxqX9NahpuI9x0lTH62qGgNUWeEdbekfKlh98Pma46AbTPg6sXpYQp5/WjFkzSxBlHLxLgGbwPk9kKubHU+cJj6168fzrw4nOVoXJcZOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egCCOVNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9059FC19421;
	Fri, 13 Mar 2026 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410177;
	bh=AfUuvMmUPh7+rCPHo8vBeqM7WKY9Juqcu4mjMPVhq74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egCCOVNcX9FEnu7FetIYFGgJL4sZ/SKKInD7m2z0qhXUiFPazoEcqPD9vNlfv6jHH
	 wUgWV325YrqrZAKcu3T82SyuV+Ai+IgR9jK9n0gERIfh5m9Jz0ht7wSUf54W/S+A6X
	 q+8GJW0T6lwwvPfnM3TEresU4SIx4HLah4WFR5i+oVFkq5rOn24ASHD5himKJ/VQ7w
	 efiSv+WfZWq96vrwVJJnQQe1l9ZTfbkJA8pDLYc82vq2h209FcLAjemB1BIkkcw3hd
	 rmaEJ9FN2iUao9llOKDOJSDpYf1dpcScSEUEmrRd9Lyl8652lhPEWPoH9PnWbUmC/y
	 G6Qk2cu/rukiw==
Date: Fri, 13 Mar 2026 14:56:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <20260313-nippy-seahorse-of-security-b1b6f6@quoll>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-33371-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 9BC252847D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> Interconnect from SCM device are optional and were added to get
> additional performance benefit. These nodes however delays the
> SCM firmware device probe due to dependency on interconnect and

So fix drivers.

> results in NULL pointer dereference for the users of SCM device
> driver APIs, such as PDC driver.
> 
> Remove them from the scm device to unblock the user.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -308,8 +308,7 @@ eud_in: endpoint {
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			/* TODO: add interconnects */

NAK, interconnects were there already. So after applying your patch I
can just revert it immediately solving the TODO.

Best regards,
Krzysztof


