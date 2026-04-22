Return-Path: <linux-gpio+bounces-35342-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IlHKDKR6GlWMgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35342-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:13:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46356443CB4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B8BD3060AD0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487A03C1418;
	Wed, 22 Apr 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE/eWKIY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958D20B22;
	Wed, 22 Apr 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848978; cv=none; b=G+3QxXAilc0XfYKHIQlvcn4nZaP7WCewKzD8WpbZ+RVZ/darbx6OM+qZ2njeGN2HaT0d5bt9LThCnkRKsbszeD5hF/MGdniLJVdaz94w67fXdtuoL5FCfb3UuKPzhOn4PxafeUPtyVXLJmNPCv0gbg+ZwBtcR9lBL58fDdwWwBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848978; c=relaxed/simple;
	bh=XVtIkTfxYNmRXgHwpA7tahW4Gz/8wVEXdcyNuwSnIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbsvkKwbV4XeMfqAnbdTWeyn1MWR6bZ6jJjy4VlEdeMIBqRz0q0vigeDJQXzm5AtXQFmuGF34hjK2q70jcAz9RILFMM2dQpFFUONwIp5y81t4XWfOKV7c8jk+K34RCMrzoyhj5wWPl4NZyJLhEzald/yDXtBDinVp6bnzHAdX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE/eWKIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6BEC2BCB3;
	Wed, 22 Apr 2026 09:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776848977;
	bh=XVtIkTfxYNmRXgHwpA7tahW4Gz/8wVEXdcyNuwSnIdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE/eWKIY9wrIHFPzpUuH7vsAnYnyK3liloCGtqqWe42qD4zSPZ1ijuRS+msU36Vov
	 805WecvTG9AW8kLwF4cVYfxxaQEF09DT8h422uaeVjuXLwWHfGkeJHwhZvHzVim5m+
	 7lI92/WU4XdlilYTnNcNQr0XwwJRxXfDJXXZNqRaMqg725NmYFE9x2lnCHjWQrXRDm
	 n0LeUd9CzOItp7/N7GU6b6sjPkow10muzC+xUtBKj+nqp3B5WdzRBHQZaXV0DVOcT5
	 8S0jv2w2P0MAAveFHJEU1c3lk3aW8vn54PHElH62klGxxTvv86PWD+G3Xy44e6qxai
	 OpWcz6nWpi1yw==
Date: Wed, 22 Apr 2026 11:09:35 +0200
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
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 1/8] dt-bindings: arm: qcom: Add Samsung Galaxy S4
Message-ID: <20260422-vegan-intelligent-saluki-ed76bd@quoll>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-1-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-1-bcb0857724de@alex-min.fr>
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
	TAGGED_FROM(0.00)[bounces-35342-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alex-min.fr:email]
X-Rspamd-Queue-Id: 46356443CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:07AM +0200, Alexandre MINETTE wrote:
> Add the compatible for this Samsung smartphone, codenamed jflte.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index b4943123d2e4..2ec9f8be9609 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -40,6 +40,7 @@ properties:
>                - asus,nexus7-flo
>                - lg,nexus4-mako
>                - sony,xperia-yuga
> +              - samsung,jflte

Keep alphabetical order.

Best regards,
Krzysztof


