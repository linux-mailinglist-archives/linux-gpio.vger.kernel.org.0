Return-Path: <linux-gpio+bounces-11272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3E99C272
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 934E1B20DBE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA49149E17;
	Mon, 14 Oct 2024 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ENZfHS7C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F304231CA6;
	Mon, 14 Oct 2024 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892963; cv=none; b=HoNkhkkUOtForOqPD62ADB+9NQ80eV3RpZwHRty7ViQ0V2+2Lk6NjObZZ1bD/QWXErom9JTHN4mqVA5b5RIPoWGisJoNRTI0gNe5/VgFFh4g8Wk//hz4kyxtzRe0aZEZN49QuV84GlQH++QTtCHExf5HRElfKWFqzGjl7Yyje7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892963; c=relaxed/simple;
	bh=TiyIYQOnUmjYuNLI/piusrRlbrSO+PoMNRcujoAwCIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeUuDOCh6dvyNsxaDc2aHOtOggGZx0VjtlVvK2+RBPesD61AZW8emwY4cJ9wQ55b/gYud7b1R0eZdUZtR05JWAe+1bPcuQnsnJOGGVrzXK7EzaLwO28Uv2SI9mAGrGA3UtsQxfu24C9sYl2c6CJSVnOKGhyESiZXPg9NofGpRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ENZfHS7C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892959;
	bh=TiyIYQOnUmjYuNLI/piusrRlbrSO+PoMNRcujoAwCIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ENZfHS7CkT3hcy98SxB90vy6qSep8i3IKBeBixNCiGea4ebJxxEUahkGGjpg5Pk4l
	 We35a32Fi7vZxgzKZ6w/de2LWn1G1MoY3Oaki9vqPYxYHjnI8UtJAZ3OWNPLlMelgw
	 ND5TLo9zXSpyeEOBIQ5YBc61WAjsatRSxgAyl2Jc8THNmJF8JSD7sNq1lw7aXQ82rT
	 elwrvdV7EpvcOzk+7FNtOc8n30pBdCgeLu1dtOUgSbbBpTRCOdQ5kIUoUfHuM0L49f
	 HfwjOk2VIWyYszgj2YxDoShPpQwHE0buIQTJKFOFw2nc4bXamZfPmzas5wMyH6u5Zl
	 mshpveiFzvGoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 342A217E10C2;
	Mon, 14 Oct 2024 10:02:39 +0200 (CEST)
Message-ID: <ea864524-0828-47b3-aa10-aa80ad993ac2@collabora.com>
Date: Mon, 14 Oct 2024 10:02:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add
 MT6795
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



