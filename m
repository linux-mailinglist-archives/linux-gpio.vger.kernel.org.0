Return-Path: <linux-gpio+bounces-28014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CCC30917
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9FA24F7345
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262302D6E48;
	Tue,  4 Nov 2025 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PAi+h2Ej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81B29BDBF;
	Tue,  4 Nov 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252996; cv=none; b=MVDBIrbdXtW97y6PHc6/6IByJuxM8k5o5JKB5afQACOnOCd2A1qKgeA2UNbzN/Klp/+SFNq9XX5n99RCT3e1pCUdJ5txcvt9D/bwH6vkzg81Z/j6Tc2q1b9meYpPGDgJbXP41mrxbLlWb8xTdrU4a4tUI/J5JsE/oF8zpXQurus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252996; c=relaxed/simple;
	bh=XjgsfMkrLaZXeX2KsYSs/abzxMl8bXYbsXOSIwq34Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6VZ5zQlcmmUQnQvmn+GOmBKdDtQFRIYIPYKPMBpZK5YMT3pdAC/tE2FVGpHdlfOvqooddTti4TTWJtpBhC309cA0SwpjGAfu0fdhYLH0FpYtNBNEWf90R5IBb7Rk21zGLTaTzk4QUK6mleFV4GGUj2nNoQ5vYzzu5ehqF2kOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PAi+h2Ej; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XjgsfMkrLaZXeX2KsYSs/abzxMl8bXYbsXOSIwq34Qk=; b=PAi+h2Ejyq4PpTkpTOO9TwDrvk
	hkAhoy2Oz8VEBgy1YcJ7fqmqV6aPcONiQ70PhnC9z+f6W7MdFesbfVJCoRBJzXKVP7RpayOo4qyZB
	qzdazj0fw5USxNsk3fwetilyjkhAY+nuTW1JTnEFsM909zdVYuIFGDzltIiYZQKNDNEFsEfWozAkc
	6kj9jiyMuegVsPBHePsQlTieq/91B2JZSZFdgxHr7LMUvtA+cos9iPGTIvvrDIgAHH8CCYekQOrm+
	uZ4AX5utJy6ylo6frILGyuZLFUScACdr71z7QHjzWBX+1lyFQPJxrxMCmZy8v9CBNq8pJWyB49n/6
	jS3jrGJA==;
Received: from i53875aae.versanet.de ([83.135.90.174] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGEVG-000405-Au; Tue, 04 Nov 2025 11:43:06 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: Add rk3506 pinctrl support
Date: Tue, 04 Nov 2025 11:43:03 +0100
Message-ID: <3705122.LM0AJKV5NW@diego>
In-Reply-To: <20251104021223.2375116-2-ye.zhang@rock-chips.com>
References:
 <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 4. November 2025, 03:12:21 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Ye Zhang:
> Add the compatible string for the rk3506 SoC.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




