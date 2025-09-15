Return-Path: <linux-gpio+bounces-26151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B78B5716D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 09:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9796F16410C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1702D593B;
	Mon, 15 Sep 2025 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qCkLz9h6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAB2C027F;
	Mon, 15 Sep 2025 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921257; cv=none; b=eeePzZm5MiCTXVKodE9I+QPgN213YqfKG3L+KZQ4WZwRxFQF1igzvg30uZZFx1NAD3IWNBRCtuicJP8UEaiMpI/8hNDS6AB/MEqVeTAqnompFAg45CHQJI0f51NuQZ6UwTk5pTdAyrTS+MnyY4HZqvxYVbC0CjbVOrx3viikUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921257; c=relaxed/simple;
	bh=M9uRHBVQjbcQZwFaS3SR7Cc0Lfk9UitjiDDfq0gdR4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSHv8S7M50ARL0EGAmddT359NlyCWqlZnUWIgW4ZEW95xE8afSSpMlewqRzFr5EB9hGSgn4xmlQ3vjmdTqAQu60P40gHf/dFjkfIZj0ai/CRhbouXxSCWLfJuPw56wRmhEJsrCi8AiYdh8VzOIczsRsrxxw12tTXBSyBwEt163s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qCkLz9h6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921253;
	bh=M9uRHBVQjbcQZwFaS3SR7Cc0Lfk9UitjiDDfq0gdR4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qCkLz9h6x77R1URoPthisXQeCpycq4VF8ofNdhfw/bTD5AyyAMz4JQTkXuIMfH6D3
	 CIEgArtS1E9nb24BeMtukQnXG0JEa+ce1MF5b/K1bKXZrXNVw6iLGjITKA75CDWOPi
	 715+SWZwIAoZ7p4BUPzJQtOIr5lK6/OlQMTS84EWs2uhfMIMsA28bcBfyxPbzeLvJ5
	 oL1S9uT8LdUTdWWd03u4RQWl7YaS4OqMtTQa/84ooNBZKJRYNwstCkNR85GCXCV5JI
	 +9/sxNqUyjMaTWZL+99exOF6h5iuJI2U9ARuw+aVkRx08V1/Dg+UOeKql+ui+mdltN
	 0CmM0i7PkoywQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E415E17E0AC3;
	Mon, 15 Sep 2025 09:27:32 +0200 (CEST)
Message-ID: <1186197a-8c72-4055-9096-79b469055b1e@collabora.com>
Date: Mon, 15 Sep 2025 09:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pinctrl: mediatek: Add support for MT6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-3-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-3-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/09/25 16:52, Igor Belwon ha scritto:
> Add driver support for the pin controller found in the MediaTek
> Dimensity 7300 (MT6878) SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



