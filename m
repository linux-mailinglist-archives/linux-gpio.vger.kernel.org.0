Return-Path: <linux-gpio+bounces-13652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5369E94BC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090AB16498B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8552C224884;
	Mon,  9 Dec 2024 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nxlcorys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46591221D86;
	Mon,  9 Dec 2024 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748511; cv=none; b=Rkzsue4KjlGErjS8quP6lA6X3znMfS4lhlLmFhwKN6jAU7So0n+yREwNmw3gDS50r5jIxU7/Sn5Icxk40AY+zQ6ufl3gJ8kJNV8zOkkOsqSEoSZRWaxr4nWkC9EoklWEJbg0mqXVW1ob2GzTRLh52YhZXCMtQ05rZbWZI3Z18Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748511; c=relaxed/simple;
	bh=6Esgob/eXCtbOdjh9toU3Ca+CaUbyN17vrQM4nXKqoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTRhiVLKPp0DoCIxImBbFk3ZJ65GGTWWxFVRzEAU4qpsy876hEeH/hg7msipgcMsUCzuxPRcDap6+TLp9tWXAi+MAY84+OO8AF1/VCea3usdGGS1fTlFGM2Fs/Ouz5iI4a2EnpVjKw7JJdkOzchbfPWWJq/L/xy/NTEovXppI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nxlcorys; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733748505;
	bh=6Esgob/eXCtbOdjh9toU3Ca+CaUbyN17vrQM4nXKqoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nxlcorysF3qLOWqSN5xIktWcXP/FYoPk30xXSud8QdoE0/XElsvYF4EtYSC8ACZ08
	 NV12Wd47dRS9nimVC20wluLMLcwRWJGgwbFJt5a3vXTsqMreP1ff3awsKeuvieqMqk
	 dcW+f9d+sPWpZzd8GZ8YnBXpjQEYFPqlVp/sAWLlAetQkSDo1dvhcVZmlIym7n4CYO
	 /GRO/hO8aoUNSVmdVxm9FlQfufzlGpypSg2v32fIIG1bWFXv1S9bwQnw4EfDrjyFVj
	 eAn2f+Ues8EJfdGIGmG2vLIZp2K2YwiIOQqYvJSIJ38cqKP4AO8NJ30rxq2e1o0eRs
	 uy67MYV93uapA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B515617E3750;
	Mon,  9 Dec 2024 13:48:24 +0100 (CET)
Message-ID: <94c80573-b18b-4328-8663-db9d6455fafd@collabora.com>
Date: Mon, 9 Dec 2024 13:48:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] pinctrl: mediatek: add support for
 MTK_PULL_PD_TYPE
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> The MediaTek MT7988 SoC got some pins which only got configurable
> pull-down but unlike previous designs there is no pull-up option.
> Add new type MTK_PULL_PD_TYPE to support configuring such pins.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


