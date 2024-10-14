Return-Path: <linux-gpio+bounces-11271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 764BA99C268
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BD041F239D8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A24A13B7BE;
	Mon, 14 Oct 2024 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JkY4DTKG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E9231CA6;
	Mon, 14 Oct 2024 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892906; cv=none; b=pnZFpZeN2i3/aM6kIc5KSeW+XKjhkNIT6Bo9PVb0CItDphp7RhGp1zp5xAA3y9eSP55JkOr64Gjy9jStEGbR5/wTnqBQCoAMlqkp4GT5iF0t0j/41WNfdUX4QQbpBmzrfFtfvNAzkj6LkQYbftSRdSklOBUg2zNwb2P8Nfk/Oso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892906; c=relaxed/simple;
	bh=M6TUkPMLYd41Oi3TQHyP3BZuQAAKZ7vP7NSxtsaWBls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcdaHwSv6CNzOyjePlXsDt53ZzD0/E8cTklBiLALbwQso92W10QTlFzfgQU4wOWvXslTGVwwaH+/dHcEAByfaFb238mUdXi+f0nQ32d6lEsHnzcF+lT1Bf3NJM1myYWbtID+0Qj0UCShLL6efSeHzF1luJGKinEAgClemcZfnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JkY4DTKG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892902;
	bh=M6TUkPMLYd41Oi3TQHyP3BZuQAAKZ7vP7NSxtsaWBls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JkY4DTKGmxpg/SswlfsSk/9mwqCsQO3hTmq9zHkyXCS8Zn0+4LE946fyiB/C7F96i
	 TrXnTbywAcuvn1vyMXm0mNFkTtujEzurxZUzzebpqnAnfixuvGwMLyVzC45MpvJbUY
	 XVPE2qRy6PaGMTfa4WQkxb3oQtmVBtZ3nPSbL9HvY8NkA8VLUS4LP6mK+zG57bHm/D
	 UTaCbwOrIiJVJoZcsKlPCb/b3nJD0YstZghwt1hEZgZElDMpqJvd0/6xrHIEdl/IhP
	 soztR9N6QXtM3ej9fHGMd1L1UG3bxPA8swLvdO49bXoDvQpqp3P84toyUnnEzOCmKW
	 QJTHdqR8RqlnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E54C717E10C2;
	Mon, 14 Oct 2024 10:01:41 +0200 (CEST)
Message-ID: <4c7128aa-11fb-4536-814d-138a4be87a47@collabora.com>
Date: Mon, 14 Oct 2024 10:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

For the sake of consistency and reducing duplication, I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



