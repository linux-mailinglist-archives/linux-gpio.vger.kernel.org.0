Return-Path: <linux-gpio+bounces-15363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FECA27FDE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 01:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A0251887A0C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 00:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6754E2B9A8;
	Wed,  5 Feb 2025 00:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="G5V0byMa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A28240849;
	Wed,  5 Feb 2025 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713661; cv=none; b=nZyXjvUCBYTJ20/uI+oV3TZRj7mAKJxZ2+z+55YhGz5s3ajtzCR9/m3vSKqoNGjtHIVgDGb+D90fdjnCnsrzxQQ16FYTa4m8m8KBK7D9DNelKxHki8WSkhf+st1EA3b+tURfowWkOahf0ovmr9gbyoLq9NURaKx7qJdVPnqnMh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713661; c=relaxed/simple;
	bh=GWQWzYt8utmoJ+vGnEmbU1n9a9uX+2dxeh0p6epdA/g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UF2GPJbGk5H39E2TZjFo3dL4qcmWHCjihvCfOz3JZKX9ipkzr155swIOjQZCI94e0JXEgt/ijSTbRQ4qSEn8t265eY+dUfLoSEfXH6t6t2h/OHxXfBjbL3WYqXbROsS+EC8arcebkKedNIfN5n7MN5l13zsxJdyCd7k4T+HMhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=G5V0byMa; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713657;
	bh=GWQWzYt8utmoJ+vGnEmbU1n9a9uX+2dxeh0p6epdA/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G5V0byMamZKCiKzf3lArq4TYeY5xEWC8oOt2fXx/T04duFwgkWOGBbfVgQcbMEZzZ
	 ehkem+9oG4eutuRSWau/YSE9SkJCh1rQ88Zey+Eb9cX0nTpHYDwpSKxkCNJrynFyAN
	 VCE7DcFnp+8JO0OXy0CFmvPzc6Q/jSdFqjIdEYvPiExZXmyPrTUHI25vrocZJoeRJl
	 AUU57qZK5Jx6FzqmErxeDMKftT7YaM1cBJ1Fjjx/i7JNMKCn5Xx60vDAG90IjA1XfA
	 jt9FaxFYR+p18EJ1dFp0WFLxoaRfWYtaCVzBdm+vGHPyiL4kXPdaNKeSGchkbAdtY+
	 FD0cpUz4eeelA==
Received: from [192.168.68.112] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 992C37104E;
	Wed,  5 Feb 2025 08:00:55 +0800 (AWST)
Message-ID: <fd92f75620e48957c2875cdcfd1285c33d3176e6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 1/9] dt-bindings: ipmi: Add binding for IPMB device
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org
Cc: andrew@lunn.ch, brgl@bgdev.pl, linus.walleij@linaro.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, 
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 05 Feb 2025 10:30:53 +1030
In-Reply-To: <20250204194115.3899174-2-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
	 <20250204194115.3899174-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Corey,

On Tue, 2025-02-04 at 13:41 -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0.../devicetree/bindings/ipmi/ipmb-dev.yaml=C2=A0=C2=A0=C2=A0 | 56
> +++++++++++++++++++
> =C2=A01 file changed, 56 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-
> dev.yaml

Would you like to take this through the IPMI tree? Otherwise I'm happy
to take it through the BMC tree with your ack.

Andrew


