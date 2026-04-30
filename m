Return-Path: <linux-gpio+bounces-35865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIIPGg0s82mwxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:16:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8C4A0A5E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B278630347B1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289953FB7F4;
	Thu, 30 Apr 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsF9TxgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379D3ACA65;
	Thu, 30 Apr 2026 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543932; cv=none; b=BYoYHqaSovj/fGgzQE9Anj7V1oYKV4eaHF2MRvf2t0XfgdCk9YclcLvsNnjLmpoJSFD0vOsTdeOvAqU9PpIi9kHWm3kFMAIpoOmRqSHlNixQcZix0qOmo/t14A6OIitI2XZKSftJ1E1bHN6bHzWpE+jjEkmUPGeGsPtGdM1AXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543932; c=relaxed/simple;
	bh=rzHdmnYTUdONY66bBJjqqsOWqkMIUbSR7F6vgZuhok0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0EHpRSuVCWyOKXY+TdvijHv98wJFYVtGZNyPR/Q2zicIC4VqMiRTTR38Ez0WjbBzY1GwTaxmZqBkQEhqw16f2+nHr6RIndEYSenojO8T1yNohGZuaeJGYF2Cj8e8gx/oX3p/WEhGP/HXe9usY9kG+CPKr1akhgGul1fFO/NgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsF9TxgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E7BC2BCB3;
	Thu, 30 Apr 2026 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543932;
	bh=rzHdmnYTUdONY66bBJjqqsOWqkMIUbSR7F6vgZuhok0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsF9TxgLrJfH7gWzTKDNkbm9Mnaiq6QQGL7MKjIY31Qt4BfIhnxJXYxit6JBpTz/p
	 F1v9GlyONXAw7OeTbWv1174rUpO5jpMfTft4xcD8X4e74lFXqsgnAxno1iCwEMXAis
	 HpMaWUPcB3U6HDib/tiZEK+9hgfRjwUsSc9PNmGUgS3szIJaMs2RRSJRZsPtOGgUOp
	 cP9Sl4+rLq2buTEvKh6NOusVBwTD9v/rJpwS0V0C2VxEw6piAyeG4tMzJ/df1RqDxs
	 /JBJ1uHDLxvOBUpb2ETCBJvrMbHtUx2y6kVrHCm/BZQDt95t+6zmjHw6yFL8o/A6zt
	 OUDiVS3E0tKPw==
Date: Thu, 30 Apr 2026 12:12:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top
 Level Mode Multiplexer
Message-ID: <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
X-Rspamd-Queue-Id: 28E8C4A0A5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35865-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 06:41:56PM +0530, Komal Bajaj wrote:
> +properties:
> +  compatible:
> +    const: qcom,shikra-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 83
> +
> +  gpio-line-names:
> +    maxItems: 165

Further pattern said you have 166 GPIOs.

Best regards,
Krzysztof


