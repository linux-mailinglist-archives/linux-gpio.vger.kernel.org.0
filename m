Return-Path: <linux-gpio+bounces-13644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9659E92D1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915C928339C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF74221D96;
	Mon,  9 Dec 2024 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SeoqxUCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF9F221D8B;
	Mon,  9 Dec 2024 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745142; cv=none; b=DBvGYdDk8iDzIiHJiBsX3HSJ7mE971kGMEihkNCmJcPkbUl0mKndfSo4DfxJcuqoay62CdJ/qr81OGiIeyEP4bCWXVFknmtdgCYm/PxC9YitZ9FfwTZaXt+l+MfTkxdDy36VoCoQiWeUHDiYhSLEN5FmjgCEW85binlOBM2R6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745142; c=relaxed/simple;
	bh=ia2lJ8ngWHko8cdWKYZn7u0ZWT2fK6djjWGkMsKBvFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XK9mB+liIF3ZaFsrDe2FUSLuxy+VTYbj0J1ebEoNFWKqxVPvdRrkn+HDyPEZTOZIdoYaQPVsle41c/IXzn/VZeWA72frZMAvXjXHDu5K1R3anSJifEYE8ejv3MCEXuQPgFTE096C0Zg2cSt6Yq9esXNl39FnBCIkhVn5J2xxSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SeoqxUCy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745139;
	bh=ia2lJ8ngWHko8cdWKYZn7u0ZWT2fK6djjWGkMsKBvFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SeoqxUCyZKwT2ZlSe0EV7MkOJLTvYSFPsaGQ3o/Dy29gI5A67jbt6HnSsdf3pTnsu
	 uPMScXXMd1UzSvmXEvazXIEh3HLciN4sTXaBg9cuI8+U6ygSOpPhmGTlIcaxEbTMLV
	 zhZW8GARDec23DEmDUphOFtfax2oxJg5FqX50qM0VibPgOQGp9fqpBYjhqPshYdQsx
	 mUQbsWSlo9dRa/IRoAsgNrZT+ggjNcuHAjZodRYkO+vNpoS6OBfqQ5l3EwjcC7lx+5
	 A9bdlYibFF9TS5ErV8Gjbq8BfNlnbEialpbmlW2VerRanYDMRPyOVrj9q7NCXjncxb
	 sKCWKUmwsDRUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5298317E36AF;
	Mon,  9 Dec 2024 12:52:18 +0100 (CET)
Message-ID: <dc445076-269e-4600-98f3-52158f73baac@collabora.com>
Date: Mon, 9 Dec 2024 12:52:17 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: mediatek: mt7988: add pinctrl support
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988a pinctrl node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



