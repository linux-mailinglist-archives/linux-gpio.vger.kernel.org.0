Return-Path: <linux-gpio+bounces-30833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJSsLZE8cGmgXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:40:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4894FEAC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5598CA2D495
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 02:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DB33246F5;
	Wed, 21 Jan 2026 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zsc44AFd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D6304BBD;
	Wed, 21 Jan 2026 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768963137; cv=none; b=XNVr0msRZgpKwoJdFqsbFiTWlL79T8SplgVi8k8XIarnny3DeUp2ycm5wl3iltuHgQHg6l/QrqNbEoe07mkx2i28Pn/GqJ+xukpjE0MVXabMcR1Z8pa+EaflBRt5Vodueei2CnW4q9/7hsNEZFwzFjwyEHtiLD8RB7AaTtSVGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768963137; c=relaxed/simple;
	bh=foy09YRZdpfh+UcvVsh4GRT12EVN+LC1837tCHo1aB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbgiu2fdhdH8yjuBGjYUjEo8tKX+edQe3nNJuZrq7rXquwxRKtkUxaR1HQT5tmH/ZdK/Q2eFsriIqpsiapq5UI0Ho/m45lcDVnKojMJ9GFdYuFAp0LaZSfAICXdeBUrkd+YN3fh7hJoLuVV9dLC7vKPW38lGiz7+IdFSofRCQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zsc44AFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD04C16AAE;
	Wed, 21 Jan 2026 02:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963137;
	bh=foy09YRZdpfh+UcvVsh4GRT12EVN+LC1837tCHo1aB0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zsc44AFdV6aDzxB8ptj2ODzyAk7zE3+OCht8aqOT44hN5GbKU+JeVpIbIrn2g/GN8
	 4/fLK+lG8MCcwcUWkqCxxClmt4EX2qoraqPd/JAeH1SlBV9HKWW+58XoYxQRkGK02U
	 /016TPWTUAhYJzlFkKtl3gm4wDQNZMMX+hJtuoOIESP6Wan3HxnFcZ1Hy8BjAFDHjd
	 GEdyz6rTKNlkUZs0XDFRNsIzU0BoVZ44kHTR3qmB3Ph/PObQMuPxJA5kyq75BLCExQ
	 C66UzmFDFHMukn8rFhja+D6XJ2RQZoTOSMedQitO2/WKhsPfJOS6nM2nEMQ/cIseuz
	 7fh0vyKP4VmCg==
Date: Tue, 20 Jan 2026 18:38:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 linusw@kernel.org, olivia@selenic.com, richard.genoud@bootlin.com,
 radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org,
 richardcochran@gmail.com, horatiu.vultur@microchip.com,
 Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org,
 kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 luka.perkov@sartura.hr
Subject: Re: [PATCH v5 10/11] dt-bindings: net: sparx5: do not require phys
 when RGMII is used
Message-ID: <20260120183854.7d081aec@kernel.org>
In-Reply-To: <20260115114021.111324-11-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
	<20260115114021.111324-11-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,gondor.apana.org.au,davemloft.net,lunn.ch,google.com,redhat.com,selenic.com,upb.ro,linuxfoundation.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,sartura.hr];
	TAGGED_FROM(0.00)[bounces-30833-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CB4894FEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 12:37:35 +0100 Robert Marko wrote:
> LAN969x has 2 dedicated RGMII ports, so regular SERDES lanes are not used
> for RGMII.
> 
> So, lets not require phys to be defined when any of the rgmii phy-modes are
> set.

Applied, thanks!

