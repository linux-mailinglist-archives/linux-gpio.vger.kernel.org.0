Return-Path: <linux-gpio+bounces-18142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D85A77895
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11973AB0E9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B41F03DE;
	Tue,  1 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ClBtXlKm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9D1EFF8E;
	Tue,  1 Apr 2025 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502522; cv=none; b=bEsIWKyymJgEAyvIzOSZH6iEZHhZkXnfNsO/DW93cDweReRhM1l0UAxho03EiOBQ6mtVPdssaMQlB/AshA6CX3zX1Uv9fFvR9VaLeR2zbirBquopqbZ8lOG0KHo//GAFaMWi4JAdImHFwF9RR6fVLppFIt/8AH8QdCjijhiXSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502522; c=relaxed/simple;
	bh=YNKYSoFFfw8mSjMXUIZ9YbaKgm4LIAPrCqBt23vx3+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2abwhrYM7oKekCRpG60459vxdWJZYjghEbClWpkZ5e9EKyfyKK2B/8mx920CRODqKlCntWoa6XZOQK3NuCJaqkOjyUcK97ziRKHQKYEX29eWvuRUVl8Ojfs5fyLvqoN5qDytmHqALNacgYQLvu4UFfH0l6F9YzBSUtf9P8NDxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ClBtXlKm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502518;
	bh=YNKYSoFFfw8mSjMXUIZ9YbaKgm4LIAPrCqBt23vx3+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ClBtXlKmMWL5rsjXFYSoLJ8MMFrcdKAO5qcWS0V8q8JSaE65NUYufu1p2PhVW3maA
	 MMA993qbIFlpwHTYxyNp0ouZSwl8wGBqhEAVqyB4uW9zueNYAgkANqDn2YlOVg+LEI
	 EH2Fo5u9kVzQl6YjMJROAX9+Cf31lhfwCzb1pVzND+0St3tN9kI9rIth/spBQp9K5w
	 M8oBmrrOlY0n5mCvoPAabSr0qYces6c0B8vxyAyjiE/sePXxsxzo8FE1ViVLbXGSEN
	 /WOMMlQeh1rMqD73k9H7qiPXMMn90rA4hdYT+ILg2Yq4/efF1NGfHl6ZixNvxDYcWd
	 jslTdDrOgIr+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 405DD17E0FAF;
	Tue,  1 Apr 2025 12:15:17 +0200 (CEST)
Message-ID: <afbc0fec-186e-4faa-9cb8-8673811ff9a6@collabora.com>
Date: Tue, 1 Apr 2025 12:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


