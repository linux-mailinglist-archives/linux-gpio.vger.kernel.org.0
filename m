Return-Path: <linux-gpio+bounces-26152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADCBB57170
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 09:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AA1016627B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 07:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400962D5A13;
	Mon, 15 Sep 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XYbdN0x5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F32D29D9;
	Mon, 15 Sep 2025 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921258; cv=none; b=PDhenz1e+hSZlPu1aruLr8LzY0Ywq2/k2BoYcKjs9880g+QMzBsCGBj8lExYltGisJHhjrviUSM/wsG4MPWddo/GE0tnJ/aJip2NCf+oUcE1hAMWD/3Kx7HIt+XRoVXjT9BySMSdDBmH1ApZy2GxYHYe7epOt47e0/nKE3uMBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921258; c=relaxed/simple;
	bh=acYdBQRMn1GotwBcF1WuY0UzMn2r5EOA0u50gZ+ILks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXX57hwXnWEMPiyt6oeV1yQJfFdOFI8z44jh0/QVGNt2uI1pmnOpFm7dHJqe4cAU6qllxHZa87JnTeuw63qez1O3LQ/l/ufimNm2LJp53FGZxnhzQ115/L8KfwDaaAfhzQoSIvGoXzdjYAUkvG74dfzDedjaFyvlxl6XVaoE6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XYbdN0x5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921254;
	bh=acYdBQRMn1GotwBcF1WuY0UzMn2r5EOA0u50gZ+ILks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XYbdN0x5UgXIEjRUD4CIwbR4JQt62M3ErbIYsir8u0tF/yIli7gjz6ECseABqJNef
	 jlm14tKEbU1G7YGavrNzKMlu5jNMZnUacosLi8i3oLWGewTJbGkPamfN0capXrXbXR
	 5mgFrL25bDhc6OHb9vEfSzJy4FvNm6YaYcZNF894apqamfW/OwHPF3HcMxo60H2Nos
	 vVgn2n9LkgSF6OvYysoA7W9C0unYDYMTwJNHrX9wfc9xauTHDzV9238z+8MIrIji5e
	 S6V2mkoX+FH1ZTGpVCrJHdWCiXDOnSOnRNOyAcxIj+4vAJxuav3HrmuD4RoFbR6eGI
	 bnlMbVyC/ABAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA3B217E0FC7;
	Mon, 15 Sep 2025 09:27:33 +0200 (CEST)
Message-ID: <4cfe7595-9eb1-4b9b-b4dc-0803731d03b7@collabora.com>
Date: Mon, 15 Sep 2025 09:27:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] pinctrl: mediatek: Add debounce times for MT6878
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-2-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-2-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/09/25 16:52, Igor Belwon ha scritto:
> MT6878 uses different debounce times than other SoCs. Add them to the
> EINT driver.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



