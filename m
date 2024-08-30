Return-Path: <linux-gpio+bounces-9421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFA965695
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 06:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1CB1285911
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 04:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9574413BAC2;
	Fri, 30 Aug 2024 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfmyuBcr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A338F9C;
	Fri, 30 Aug 2024 04:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724993668; cv=none; b=pa6OIcJqwAqi5Xjyn1mCGzra1FhDO9pR+xHofScxlk8W7kAzS0LA8ZAmDrQRUHlAkt4+6XZxUwS1qk2v17eJ+imFmBgKBuGP3/+g88CNj5jAWc+2aYsnnY54bqyzPuxMYxJc4DLAy7sbruQMKlgepdDzH+in7pspTKPJ98P9ZBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724993668; c=relaxed/simple;
	bh=nSo4wqOI2ey9H1S3qaG+6woJF9Ph01cDpyQNSucVvIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkkUuGsii91RKvW5R34kEVwKYmv6dfGRV96/8uwBoxw42fJRx3Z9Mkh/mp5Aj1/UAJ5cGYIo4Hm4RstEIimn7li4TSSiQrCLPAjUHoi8QEP8t8NTPq9QO2OE8D5tEkTOV2p9B7SHhSAi0F2i+asPrfai8p6/OXfRSPPYSzBUTGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfmyuBcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7BBC4CEC4;
	Fri, 30 Aug 2024 04:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724993667;
	bh=nSo4wqOI2ey9H1S3qaG+6woJF9Ph01cDpyQNSucVvIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfmyuBcrCbnXzOGEogLSSvAjFHFCwZ4uQ6oQX7VGY8ty4KL8tQJvWNbuxdgoNclYN
	 QVED++vzoLM7+vPigQaXPMHsUffF1ydpDF/TAVTtV3Fa1Ixz2lS6aI0jBsKkCt8STB
	 TtuHt/a5i1pjnUYmRxaTGvR/spwRdgFEMntCs7Ejz4sTO0Mp4phdAdO4Zyl6WKjzmP
	 bQbD7+A35i13EYy/wJ+7NpVGyPtakclSL37K/OKQ6NMQrvFk1PdaiCPxttjo+K6cxk
	 /5T1UBpkJXJgmhLszU19BfonTP3OG7/T5oIjEBTq4pF3HamvLXrNeZ1HkiwEvj2osM
	 9dN5PrF6Y3gQw==
Message-ID: <f4450d92-1cea-4051-8906-ace6cd4165a7@kernel.org>
Date: Fri, 30 Aug 2024 13:54:25 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: k210: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER"
 <linux-riscv@lists.infradead.org>,
 "open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER"
 <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: opensource.kernel@vivo.com
References: <20240829064938.20114-1-wangjianzheng@vivo.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240829064938.20114-1-wangjianzheng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/24 3:49 PM, Wang Jianzheng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


