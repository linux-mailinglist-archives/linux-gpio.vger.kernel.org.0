Return-Path: <linux-gpio+bounces-30946-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC7NCopfcmnbjAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30946-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:34:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F105D6B63E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F4733089D3B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C803D806D;
	Thu, 22 Jan 2026 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+NVTcEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6A344DB4;
	Thu, 22 Jan 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099874; cv=none; b=VodfCsFVKfw+Q9tWmKfkq+B50yoC/HeLc9NIcej+OthjjcFaTKtS+uNSiWv6hukguZrRy55/xbOrurZ8/LixVZgZNiLutaDvFUL9NT9jCZhDnTTB4uKr44F7gAFmogtYdtMPZ3SbVvlIFo4wrar9rIcGzuUPJEZ6xEuzfTS2teM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099874; c=relaxed/simple;
	bh=w1LYDYW51F2ISpaORHR8Ql0YyjJzm/3wGhKNlRf9l2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIY9SAmyt/fFl/+kYXzl+dzWOSRTcxridZovPRbuFOhASZyOCinYV6xwB3Lm3iEqxX16i5ZTcNuXf6VYXU6qL+Y+24vIs9P5RTaRkpHOL88nBAU0H6mQX7qlv5qK1Ej04e93ZdCAf/LZh0Mxc3ekWH5lKWt54Zc12LZBMdUEFyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+NVTcEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952CCC116C6;
	Thu, 22 Jan 2026 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769099871;
	bh=w1LYDYW51F2ISpaORHR8Ql0YyjJzm/3wGhKNlRf9l2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+NVTcEP6AKnolrE1CYMeYNPVHJp46Dyr0EJStO/q6V4GoiwCADXuz0GTzwOmJF8y
	 DuhbG8z7K3XwG89hRzYbvomvkL9MpP1P+TNIqEWlhr5+nHcWS99lAsv0Dmd0vVEV++
	 oFnVq8YFyiwUvRy3/4M1YhVPgirhV5WOjZ+DGhf/8kB4qEgJ9+4I3R8OF6JOT0KRVo
	 qAQKEvMGs5u3qX9QXYiEv2dCNclaW1+nyXJRZd0PSjXxO65mhr4PNiziP9s9pQNwIo
	 RatX+f7jfrjTy5WmKUH0IVKgqD2636OAxgnKx9UgYF5YcRcGg8Px/FqWNO09gVrjVf
	 K/xJOHau9ZXQw==
Date: Thu, 22 Jan 2026 16:37:44 +0000
From: Lee Jones <lee@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11
 PMIC drivers
Message-ID: <20260122163744.GM3831112@google.com>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
 <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30946-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F105D6B63E
X-Rspamd-Action: no action

On Thu, 22 Jan 2026, Lee Jones wrote:

> On Thu, 22 Jan 2026 15:43:27 +0000, André Draszik wrote:
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> > 
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [04/20] dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
>         commit: c19ccbf37758f90064f7b1e32ec291954d97b426
> [05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
>         commit: ac1068790221a421e7bc4dacadfe8d39d6bec3a9
> [06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
>         commit: d0cd9ded4bdef73303e65abbeae47b00b7288059
> [08/20] mfd: sec: s2mpg10: reorder regulators for better probe performance
>         commit: 40b82c61c044e5ae7bbd532e841bd01507028c33
> [09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
>         commit: 8e6c6e8ef5e241385eff14d4c8b8e45d5e762e84

Note to self: ib-mfd-for-regulator-firmware-6.20

-- 
Lee Jones [李琼斯]

