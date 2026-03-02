Return-Path: <linux-gpio+bounces-32386-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEHQH4NkpWn0/QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32386-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:20:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EBC1D6573
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDB853033886
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D893A0B10;
	Mon,  2 Mar 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvhvdtzP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045239B964
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446496; cv=none; b=VBrdqMsE9ot8qZlfCuVeraXev9AFeD+Vy1mGew4hJWJfbEd8iXXSUPn/hrLNCX5tVI/Mki+vCwU9Jkkmit1yAeei4K6uyiFJYFICx7HxRPI3rDZnzt11smDfqcL+890mRGROXVEnpxsT+5Iyk7OAuyLzo9yjEt6FC5sV8umfvcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446496; c=relaxed/simple;
	bh=yL9eUJXHi4REduqyWswfkgW16JkoDI/iPoZz8fNv0BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOQWh961saoUVM4+kddmk1/gjsgUFa7zUdpdYFQq5ZTX1CestnUcZpt39NsVLdBzIuTH12J37UnpunPHlX48ZpgYC4szCB8MYdl6Td3nIuGercB4PGElB4lUZxN/hO3XNNCH2BFE1GU828JeAYvd3Tva1lQVnihpt7snL9HRLoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvhvdtzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F085BC2BCAF
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446496;
	bh=yL9eUJXHi4REduqyWswfkgW16JkoDI/iPoZz8fNv0BE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lvhvdtzP0FEiKCUc4jExgViUpuhyJK6fzcxJAobspM/IAfx8U/hdb8EI27FH9fgf2
	 PE4w+rwuRgU0pBjeeieyZdzdxhkbkAC5vm79R8zpAqht+v5plHLlCrzVvdaUUdS9z0
	 Jm/YZ7ij9CEUdL9z1D9BLqZxWkr/KLemt3XXFxpT+Xy3UVbmkUtby2cWwBLUdequUV
	 QOtoe/BfbyPdM7ZnWXVV/P3Od8kOOMHGAAoH6nr80DDYmI0oe6EcWQxbRgSn0LAN2w
	 ogKEsoO4WCdCStkJBdKra0nx+qvFCQ/wK8TfGnXI1cwhDfVMVn3QbUtR9ZWDoaR62L
	 Mf6SyJe74W7Nw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64c9f7576d4so2947532d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 02:14:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdbB7LafjmZKOJ2VN+sU9G/I5QlURHsl8r4vZUi1j8dpJufTLMFNg/EBlblRxmbrl3OaxbuVHheAlZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/utHDPi3OTdpT+ahJ4ezgvMRN3Gt1wozN75fXTTn79v55u+3m
	inRygb2VYGMtkiP9KiOpOUBiTv0uCQrILXxYwP+fsuWIyYE0QV5GBBYOC2yBSnJRNEkUtR8oeaF
	bNCAtd/ctPvceAxZzrGuLk0YKwFw/5rY=
X-Received: by 2002:a53:ee42:0:b0:641:f5bc:69a4 with SMTP id
 956f58d0204a3-64cc236a35amr7180230d50.82.1772446495327; Mon, 02 Mar 2026
 02:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
In-Reply-To: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:14:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkiuGxDbMr=w+ADcwvhr9a8h+ryE1cmrnWw9L4kE4Op0w@mail.gmail.com>
X-Gm-Features: AaiRm50-e86imS0v4p4bAzBL_z2ShkagB8FlB4mx63CF_zWh3_u5uWJJFfQZkZU
Message-ID: <CAD++jLkiuGxDbMr=w+ADcwvhr9a8h+ryE1cmrnWw9L4kE4Op0w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: add
 missing items keyword
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bootlin.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32386-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.53.232:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.961];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 09EBC1D6573
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 3:16=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> Even though the type of the 'groups' property of a pinmux node is
> specified as string-array in pinmux-node.yaml, but trying to use
> multiple strings causes dtbs_check warnings.
>
> For example, checking the following dts ...
>
>   $ cat arch/arm64/boot/dts/marvell/armada-3720-test.dts
>   /dts-v1/;
>
>   #include "armada-372x.dtsi"
>
>   &pinctrl_nb {
>           pwm-gpio-pins {
>                   groups =3D "pwm0", "pwm1", "pwm2", "pwm3";
>                   function =3D "gpio";
>           };
>   };
>
> ... results in this warning:
>
>   arch/arm64/boot/dts/marvell/armada-3720-test.dtb: pinctrl@13800 (marvel=
l,armada3710-nb-pinctrl): pwm-gpio-pins:groups: ['pwm0', 'pwm1', 'pwm2', 'p=
wm3'] is too long
>           from schema $id: http://devicetree.org/schemas/pinctrl/marvell,=
armada3710-xb-pinctrl.yaml
>
> Add the missing 'items' keyword to the schema to allow using multiple
> strings without such warnings. Also adjust the indentation of the next
> statements accordingly.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Patch applied!

Yours,
Linus Walleij

