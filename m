Return-Path: <linux-gpio+bounces-32603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLIKEnPUqWmaFwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:07:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3912173D4
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF886302DA30
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB74302146;
	Thu,  5 Mar 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Ax6r6g0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674EA33E7
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737646; cv=none; b=IVmPmWG/PXxOh8estsi13s8EIrFtjqiAyNwmBA5glsZD+wUETgZUJAepwqphTGEfZ+j2c0Hij0B8thOHTGsauc8D9WwPeoUy41jHGI8AV8b2A4VHIC0y4V5bAF6Darl/vZymUgasb5g5gkh+NlHmZzkha5UVu3j6IjyNuL5ieDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737646; c=relaxed/simple;
	bh=1xgdNJzLL8KfMHgFDGI6C4e0TMBhJksValsubgWfixk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XpFeFV81FFgF8B0EalqBrEa9pexwQ+oMBdaEQYkH6tC9I0BciLAzFScueBmyM1bxwnIerEClwkqYwZ/PBo1x/l95ES+7mVUqzAldsy/Ot+JVfESdzTU3ttTDo4zoVlW7N/jVAy20cGshBySpv0KDJZOF5kYp2VZ893cBXDWa87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Ax6r6g0i; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d] (2a02-1812-162c-8f00-19d9-5e35-1cd7-5d5d.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:19d9:5e35:1cd7:5d5d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 8DD7E6F2F22;
	Thu,  5 Mar 2026 19:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1772737184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xgdNJzLL8KfMHgFDGI6C4e0TMBhJksValsubgWfixk=;
	b=Ax6r6g0iV/rvUYOCRsC/mhLUQzCVpWN/FQ8VWFFiaIxc3DdNi3g35U1uIkVVCbDdsUrWqD
	pibW7qa1WA/O5hxYStnru9NVTOUfvVAnwow8AFQw8SnFJT+JBi0T1Q+P074dhz8z/bvaq0
	yyk1EeL5TCjR9y/Hg1/vA1rXTAdlUCb3i+0AD5soRKzrc/PTy5oByElyVdaMLPQ5aMQ9Ba
	5cxUIXXSWPsZvga6hRZ+bDZ4jFq+kS1qAlkLIU1Dlc5oJdnMVsee9krEDVqZm99A9i2YyN
	90mmnockFZ6MtfsKKO40l0k+HCLkbScWbV02cMdvFJ3twrjSzitxZm9ThzaLRA==
Message-ID: <258c5f81d007cc57e361b27c280167c552e01a3f.camel@svanheule.net>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: realtek-otto: add rtl9607
 compatible
From: Sander Vanheule <sander@svanheule.net>
To: Rustam Adilov <adilov@disroot.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski
	 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bert Vermeulen
	 <bert@biot.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Mar 2026 19:59:38 +0100
In-Reply-To: <20260305161106.15999-2-adilov@disroot.org>
References: <20260305161106.15999-1-adilov@disroot.org>
	 <20260305161106.15999-2-adilov@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9C3912173D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32603-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[svanheule.net:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[svanheule.net:dkim,svanheule.net:email,svanheule.net:mid,disroot.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 2026-03-05 at 21:11 +0500, Rustam Adilov wrote:
> Add the "realtek,rtl9607-gpio" compatible for GPIO nodes
> on the RTL9607C SoC series.
>=20
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
> =C2=A0Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l
> b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> index 728099c65824..b18f8f0ca0ae 100644
> --- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> @@ -30,6 +30,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - realtek,rt=
l8390-gpio
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - realtek,rt=
l9300-gpio
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - realtek,rt=
l9310-gpio
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - realtek,rtl9607=
-gpio
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: realtek,otto-gpio
> =C2=A0
> =C2=A0=C2=A0 reg: true

Reviewed-by: Sander Vanheule <sander@svanheule.net>

Best,
Sander

