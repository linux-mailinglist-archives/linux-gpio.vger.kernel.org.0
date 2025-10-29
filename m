Return-Path: <linux-gpio+bounces-27833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0726C1B136
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 640EF58515C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584313358D8;
	Wed, 29 Oct 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZgGIWy+v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B03358DC;
	Wed, 29 Oct 2025 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744868; cv=none; b=i0W9jSEdxswO/g6KKPF93HerGJ5vMfA2xM9QBy8oxT+D2AlJLr76wsQjYnvaSLNPKYLYi4dAM+d/3ceP7Alisnj9FB3IXJc2bBobGqCfZTiFSkX8HfekLhMiSTnxFzmrFt2oE1qj1t4jYoR4LYm7kuXDZOmlPi9WhQVFiN2FxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744868; c=relaxed/simple;
	bh=CWDyNFI8nMbhJPs0QzY+/FWYQme6m8eY95YiHHBqRnY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kO9BegSv0BH/jDghDEZ1gZLFSgjJL5oTVQBeCLYOEa0ss7X8a0GRK509uy8YogzmXa67ncZEbZASSuChJhJs/Mhetg7yOl+i/b4VgjbocgQSOKdeVlbi7CZODw9X2rJNRtIe5bLxwOQBTBJ+rTjgUNegBt+HGCG/btnv48y3Zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZgGIWy+v; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761744857; x=1762349657; i=markus.elfring@web.de;
	bh=wEAfgf51VOuSgVGks4N/iAKgLhYobDrdtVv3uuxNDL4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZgGIWy+vv6p1ZmkT9eHfENMvcZ9P+rilNYqTUSd/luRHl3KIfIS0y+3UATy6+Z/J
	 Naog2M2/75J0T2oNvJT5VY3CuJe0V/PJ+mMhhTDvuTJmUJjSSUNernhU7eXtmNoBH
	 TQLvG/W0oXmEd1St5Mkik0EFAqTonbt70+5Jcs6yAeET8yBxHoRL0Vb98QC6ogGh8
	 Y0c4qjmxwmlAfNhyQyM/JcOaBoEwz0e6jSPkVJSyc6xOmeQySX9iJsXGxVIHpuejf
	 pWey+8ZTQ2DUZEyXKPCP1wDKZvvuiGNb7UAtSzpas6++KhyhTtndhTpqNFhOBdqoI
	 ZcEknci9DqHYK/J28Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwwJ-1w21Oe1nGP-00duMS; Wed, 29
 Oct 2025 14:34:17 +0100
Message-ID: <89af2621-7688-49ba-8246-22d79a2b8b20@web.de>
Date: Wed, 29 Oct 2025 14:34:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251028030509.835-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] pinctrl: cirrus: Fix fwnode leak in
 cs42l43_pin_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251028030509.835-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+KG9Uzr9X0bRJU4t6VmbQWQqyoE4/O+2dVLUFquqGnKW2pKrwAs
 JwHmCAzvMdmiNkHrVLVGZ9OEOHaN3uHLNFSwlCesd3TS9iVvr/sYV84vPOBWNvWnwa6xZ2H
 Qhw3Lw+J9YqpUkirpXrhdGsMmUECUq/kZWaUaLZQO/1lA0jh3hPYN9v4PtI+lv8/qlfaAPx
 4ygZmlVxC4HMtX7VerJ6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WuQnI244qWI=;QBJ5L4EqQZ4fBrI9ipd5fLHzsut
 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

=E2=80=A6
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
=E2=80=A6
> @@ -563,10 +568,20 @@ static int cs42l43_pin_probe(struct platform_devic=
e *pdev)
>  	priv->gpio_chip.ngpio =3D CS42L43_NUM_GPIOS;
> =20
>  	if (is_of_node(fwnode)) {
=E2=80=A6
> +		child =3D fwnode_get_named_child_node(fwnode, "pinctrl");
> +		if (child) {
> +			ret =3D devm_add_action_or_reset(&pdev->dev,
> +				cs42l43_fwnode_put, child);
> +			if (ret) {
> +				fwnode_handle_put(child);
> +				return ret;
> +			}
=E2=80=A6

I doubt that such a function call is needed in this if branch.
https://elixir.bootlin.com/linux/v6.18-rc3/source/include/linux/device/dev=
res.h#L152-L168

Regards,
Markus

