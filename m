Return-Path: <linux-gpio+bounces-32721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI8XIJ8frGlXlQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 13:52:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68E22BC92
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 13:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E9CE3024C9B
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 12:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5E739E167;
	Sat,  7 Mar 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyLd1gk2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF939C64A;
	Sat,  7 Mar 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772887920; cv=none; b=QSScoaTxZIiwrjz/Xdhcl270nY+LsugtU7fCRATaJlUxFl/QII6kElrTGk9jD/F+8pTzPt0CM1FbQDbSYTuYOxcJnLZEmrzMU0T1FfzHXVMj78d48XjBWThogWrVTlF9XYb9qKT0InIsunVfmluu8a+Y5TtqoCOrP3rb9Hw+ZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772887920; c=relaxed/simple;
	bh=d/WZmS/jGQFo2oynjtVtCDYfFONQIOxP/6Kxpn9q9rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXFDL99nBNbkRtn+Co7SzwpeRsfBbIh1N+6UdgDFaXwBv5D58kv7+LTeudzkgjicegqMDPZMyZ/kJGG+AhpjFZ/4c2VTW+/d9Y9Knwb5kG3CUljDiQcoSJr9K1j77Ez7ap9o1XXPwgy+pGVjY20L/raq4HJAplJ7LxrKzQEnLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyLd1gk2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA746C2BC86;
	Sat,  7 Mar 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772887920;
	bh=d/WZmS/jGQFo2oynjtVtCDYfFONQIOxP/6Kxpn9q9rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyLd1gk2G7AgRX+tHUPjl8pOGW3VWz8v+q8cMc5Q+FBjxt2/znpJYZeXhdkk6pj2l
	 vNne6JdEavw/XvdRyUqZ9Lor7ho8Ahqnwe4epOuX2LiOuCku9zCLig1GOV8qvS4gbZ
	 xwiMpEl4bisydDiyf3UubEra0Z4pV5Ys59Fd7vxQJ4zayDN6xtuHuOeWzGT6X/fCUy
	 mxu9o5lAHXxh14vHwb9Uve65DdVgIk3cw3YJx2vJhE1bMgpBWsiJ6oox/14IDim9ak
	 3XBJ3+ZI09FJXttxqm6RqA/Z1/8iM81QxWBNEfyfCTrCf5UINvk/PSgPQZjIuqaQ64
	 gEo+sfg5xjffA==
Date: Sat, 7 Mar 2026 13:51:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 07/14] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Message-ID: <20260307-astonishing-helpful-grouse-b7e968@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-8-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-8-eleanor.lin@realtek.com>
X-Rspamd-Queue-Id: 0B68E22BC92
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
	TAGGED_FROM(0.00)[bounces-32721-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:52:37PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
> 
> Add a generic pin configuration property "input-voltage-microvolt" to
> specify the input voltage level of a pin in microvolts.

Why?

> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index a916d0fc79a9..da182c8a1d00 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -162,6 +162,10 @@ properties:
>        this affects the expected delay in ps before latching a value to
>        an output pin.
>  
> +  input-voltage-microvolt:
> +    description: Specifies the input voltage level of the pin in microvolts.
> +      This defines the reference for VIH/VIL.

What is VIH/VIL? Why generic binding would define the voltage of pins
for pin control?

This patch misses actual background why you are doing it and what sort
of common/typical pinctrl setup you describe.

Best regards,
Krzysztof


