Return-Path: <linux-gpio+bounces-13643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 007879E92CD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A606282490
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C052206A5;
	Mon,  9 Dec 2024 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QSMsmfGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526CE216E29;
	Mon,  9 Dec 2024 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745129; cv=none; b=gkguXOYrH+qh+UHcP680rKBgDMQf0Ov71Fq/ohhyv/6f1R+JTHOGDvQyjgDOgH4tk+nQ6fZtNbwHesKGSqokkd1+3Y5bw9WgNCVjPWKw8FzGLhZ48AQYWHQ8m/inccDOVGAJ3IR/q2Y4M+vcRzRosL5BPNw0Sch7vGG1rf4sv3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745129; c=relaxed/simple;
	bh=gldmvddonv2YixS8/zmRKGr/mcQNNsmS+EIsTUQK8WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fffav54HbuqHQgNbsVXY/v6I+OAZoS9VAB82gpn6yzLsgS1tBSnAobUkYSTwk+ZbhdGrLgmgHYFmWh+weDaj7PwjOLNqgW9scO/tFYIETh5GBaPiBDY/6kf2WKuXZpvBhLzaj3IPjVqFRj57cQrTDiRwHnW5GaCjvQj/8xrfjyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QSMsmfGm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745125;
	bh=gldmvddonv2YixS8/zmRKGr/mcQNNsmS+EIsTUQK8WY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSMsmfGmovu3kup2pPPL1Setx5vKeDNvPLk1Yq1HhsMoHcDFNGVxoIag6X4QfmCxi
	 nYTVBJPZN7y9vcsLmU5Rw+nYQ1pV67NeU7w4gnM0tz8iX/eLMvIDKt+ktj/J45Fjzp
	 Z7nkax3k8tHkdPw6RO86aTXgyHB0SVLSW7brFTqEKIktX97rRfcy/hW6FwXmVpUt9V
	 cPKDAPp/Y7YZHmNGvL2NbhtYhnG7ayOizB4bxGOQ5G3tDpEGSV5pOzAQe1W1prVtIw
	 lGr+7rOQWkPF3jMDQnTSK8pDJVSBeMo30+zmX4tCNXQKExsRwufEiifZ0eQ+G0MHhQ
	 w8Au9n/vXrzJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC79317E36AF;
	Mon,  9 Dec 2024 12:52:04 +0100 (CET)
Message-ID: <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
Date: Mon, 9 Dec 2024 12:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: mediatek: mt7988: add pinctrl subnodes
 for bpi-r4
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add board specidic pinctrl configurations on Bananapi R4.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Can you change the title as suggested in the review for the other series?
So that we stay consistent.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



