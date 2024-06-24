Return-Path: <linux-gpio+bounces-7628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5A913FA6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 03:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D22281744
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 01:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922B817D2;
	Mon, 24 Jun 2024 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZJ4FGTve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD7523A;
	Mon, 24 Jun 2024 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719191210; cv=none; b=AVIR0sj9B3dx4QKAFmCOTK7aVB0jC8hc01gLvWGvC5r7QriceyMdR7Rs6FbvmQaaVOao96wmoyjTMxAURkA+VhwqVJ3zuBg1N+vRWdgYto79i0FQkC31EryUQUZ0ck02NFX9vhxI7R0vgbHJVHWH6oVCtWIUMs+jW9W83wSGMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719191210; c=relaxed/simple;
	bh=jlTWNNpPBkqDJMgVmEpn+lRal2l8q2vjsXcxXLiz80Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JPR5Eknl+VIYrjdZhplZFKgAqZP605Bo8U85SzRk0JRbpoFCMyrvqenMSPz7pucbxQ5FqI6NKmuELfKJ1FCnD3epNWNjxC38wGGuuxNSBAPr06p9TMsXBYbUPs0NqxAI4npYk6erAN20sfIWCYcO7bt+WHnkzxOSyjmA4FkqsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZJ4FGTve; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F10782009F;
	Mon, 24 Jun 2024 09:06:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719191206;
	bh=jlTWNNpPBkqDJMgVmEpn+lRal2l8q2vjsXcxXLiz80Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZJ4FGTvecotQ/ky7gjkY4bsp32P0bk+MHJWZFpN+EvCinfCB1okyGHo+SSxsotwrQ
	 pR10oTTsSvq59DLEHx2TGu/QCNVD5uZKcrzYae1cCYE5fLFBg2OA01vYzws4KiWxqS
	 Y2/a2vAlnVULSMnLI7Kiu+AZcijwtbq54Fb44aHpw5FM5Tn8RafBWuxA8V+u15Gb65
	 WpWus9TDOjwyGwWWdYAd2fdLbFNZInsetO3CE2wF7MQ9Rc3DemZzpI+6ICfRjqLbX5
	 G6BgCiDG0WrXP00nIvqT8WdkyQYFd7LcTpC2I47qk6KW5JN8LECFL697kA2DqSeZlf
	 Ej0LTpXYi2ziQ==
Message-ID: <dba36e40c132561d9474f6742f3a18782f4d3983.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 add NCSI groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Patrick
 Williams <patrick@stwcx.xyz>, Cosmo Chou <cosmo.chou@quantatw.com>, Potin
 Lai <potin.lai@quantatw.com>
Date: Mon, 24 Jun 2024 10:36:45 +0930
In-Reply-To: <20240621093142.698529-2-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
	 <20240621093142.698529-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-06-21 at 17:31 +0800, Potin Lai wrote:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.
>=20
> Add "NCSI" pin groups that are equivalent to the RMII pin groups, but
> without the RMIIXRCLKO pin.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

