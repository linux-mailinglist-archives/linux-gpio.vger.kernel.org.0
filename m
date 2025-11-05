Return-Path: <linux-gpio+bounces-28112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A9C35AA9
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 13:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D57C734E401
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 12:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662F2313295;
	Wed,  5 Nov 2025 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bcdgeY+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7231576C;
	Wed,  5 Nov 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346070; cv=none; b=cUBpDsAZV3UgUy26t7G2kBfmPQlntqZG+RmwB/9N9xjdhmeBtlSydhSzuiulwDUKNoK/FoX92ze2km+D7yFTVRKPxcsDF34h22ctupBcFiv3C3f9q6aWktrdDf3QDxkil1cj+JwDiZrQywWZ8+SmFVvNsPbu0upq7dAKuSX83jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346070; c=relaxed/simple;
	bh=UMSS8SlF1ZpDPeqH+yFQO3jA5s+oh4KLe88rrJ2+bxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAxlmf6RL011RIdG4vxjlNzc+tctOsi9S2ACA0XeY8b9WlKhvKn6RfcgchiCf+2igcRRrdGQIuIUTvOmjuDkYyPKx3t9mETDLDycUCu76TrKag1cRazMmq711JLJqUZ6kZsD11wYJdSZ1NKlrLKRJ/KTa2lEaE9FmrUpTPYSAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bcdgeY+X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762346066;
	bh=UMSS8SlF1ZpDPeqH+yFQO3jA5s+oh4KLe88rrJ2+bxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bcdgeY+X4d42ju21u9ouguNkx+sAkHLrFdtoOdfrYifMeiAFNJNA1XNxUP43b6UJX
	 tlnlwWUse3ZMbACKuxaIGdtxNA9U8mlsauR/zeUhnL8jnSD5LHKh0aeM0Uc1rqfetj
	 i6iH/18EbR5lbJV//sVViA8M1qIhGET0vhxUKymPAvlD9W/vpuNxlWVZbB8AbmyDuZ
	 eZwuAXiEBfaI0/pPTZJeDa5GEkO6DZQMUw49uLj38zJiL6GqmusBfUMKR4+6o4/Wra
	 PQZuE3/jEsZKgR9JL//jqNWFiVdB4ESp3bHcC60rFFsiW3tDmrTN45DJfhqIKWwKGA
	 /uYcSaKHjDyEQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBBC517E0B46;
	Wed,  5 Nov 2025 13:34:25 +0100 (CET)
Message-ID: <0e4d55b5-92c2-4b59-8b58-419187e99a25@collabora.com>
Date: Wed, 5 Nov 2025 13:34:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251027132817.212534-1-linux@fw-web.de>
 <20251027132817.212534-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251027132817.212534-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/10/25 14:28, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>



