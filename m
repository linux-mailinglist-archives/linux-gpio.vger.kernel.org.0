Return-Path: <linux-gpio+bounces-7602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F33539117C6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 02:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3801B224C8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 00:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4803F10FA;
	Fri, 21 Jun 2024 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NcKP2jFD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226C197;
	Fri, 21 Jun 2024 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718930777; cv=none; b=jYbFrT8grW2mczJ/XNrAyyISML+0U7KmWId8JzdVfAP89TypdobQHuZfmBSTGJ82uakpoxwTFfQMyDrStPxcWsn7OOdOLR+EKfBe5r6H/ju5pXF3NzS0ekSf6otcY7Yud3vGKt1o85OvNEGZHfQCpWrxm/rUnfslcl/iVtgOX9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718930777; c=relaxed/simple;
	bh=NHhFREd6gjXx4D1yUDV1fWbFdoKWzxNWEagkznfZcRw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FR5X0BxYzzQboyG9nmXE3PjY3arWm7IeL8TJdA2FBaRM0zbCgbI+0judz89WlG9D0askXSWWsDSJhFT55KvP/x4aGjZTnzsyhXlKCRWSIu/ZmDaW4bcti5C4RVYXYmP7a4pqxIyjbs48V6enFBt2At8Vgzub/VGncuQ4qh9by5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NcKP2jFD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2CAFB200DD;
	Fri, 21 Jun 2024 08:46:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718930767;
	bh=h5dRVJQy35axM2JOoP1ujWmkMFeh76MXxL7uKyuYIiQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NcKP2jFDsy3aMiuCUjlJitK0s9yShifLgb5vm28MeUlTnqmsgIp2/PB/VucMSCcam
	 rahb68dvUNUlRGuJLadUjLmlZyg5/xoUVx5+1fonqn74wt+ZNf6Pv4cC6jg+SbFsG0
	 9tBbVGebycFgyuWCj8qS7N+BEDOXWYM2ZaLNjWxFcmQRnED1f90H7bjWCtby4463L5
	 wYLVxi8+FCcI31bL1vNMRorlVeZUg1cO4UskuRdTP6KT/0dN6oWOM267KRvzkQ25C6
	 bTBAbXaNEcm60jQWPg7NbyZJ+twyZH+VQZrw6MBmjZAMWhhagHHjZqNQbMtlT5xrbC
	 JuOc4S7LikPEA==
Message-ID: <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 add NCSI group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Patrick
 Williams <patrick@stwcx.xyz>, Cosmo Chou <cosmo.chou@quantatw.com>, Potin
 Lai <potin.lai@quantatw.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Jun 2024 10:16:04 +0930
In-Reply-To: <20240620084337.3525690-2-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
	 <20240620084337.3525690-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Potin,

On Thu, 2024-06-20 at 16:43 +0800, Potin Lai wrote:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.
>=20
> Add NCSI group to distinguish the pin group between RMII and NCSI.
>=20
> - RMII pins:
>   - RMIIXRCLKI
>   - RMIIXRXD0
>   - RMIIXRXD1
>   - RMIIXCRSDV
>   - RMIIXRXER
>   - RMIIXRCLKO
>   - RMIIXTXEN
>   - RMIIXTXD0
>   - RMIIXTXD1
>=20
> - NCSI pins:
>   - RMIIXRCLKI
>   - RMIIXRXD0
>   - RMIIXRXD1
>   - RMIIXCRSDV
>   - RMIIXRXER
>   - RMIIXTXEN
>   - RMIIXTXD0
>   - RMIIXTXD1

I think listing all the pins for both groups obscures the fact that
there aren't more changes than removing RMIIXRCLKO.

Can we instead drop these lists and replace

> Add NCSI group to distinguish the pin group between RMII and NCSI.

With:

> Add "NCSI" pin groups that are equivalent to the RMII pin groups,
> but without the RMIIXRCLKO pin

?

>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctr=
l.yaml
> index 00b6974a5ed3d..3f02dc94a7ce2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.ya=
ml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.ya=
ml
> @@ -337,6 +337,8 @@ additionalProperties:
>          - MDIO2
>          - MDIO3
>          - MDIO4
> +        - NCSI3
> +        - NCSI4

Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
well)?

>          - NCTS1
>          - NCTS2
>          - NCTS3

Overall, what I was hoping for with the comment on the earlier patch
was that you would add the discussion in the commit message to the
"description" entry in the binding YAML. Can you please do so? That way
the information is always present for people reading the binding
without them having to look at the binding's change history.

Thanks,

Andrew

