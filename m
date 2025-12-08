Return-Path: <linux-gpio+bounces-29394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E59CAE2CA
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 21:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90E13304C286
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 20:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756B72E8B94;
	Mon,  8 Dec 2025 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="HyWhzDTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A0231A55;
	Mon,  8 Dec 2025 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765226962; cv=none; b=uLDQXA79tnFUixnMCKxBA9VgBoPqZfgvESl15IpsoLj7suZVCPqYkZMN932ZqP8mgRUXF/TGBwGQo6A5srgbNtRP43m6fP0x51JlD/1PP7hh2Zukc/vO8zH1YblqpXL5/GLcqAU5lBStgQHKQUXOdSFw/gSDkj2YESUS22Z2VFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765226962; c=relaxed/simple;
	bh=e+fFu2MdeHsUlyFQOUVeOgFYYMMaZGZ18DAtl6FoP0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqnDbzmRPM4zjfgx5X9X8JpA7f1zyr6UKKzwOTh/rBC5W4oz07GyFkMlaUfphdY1800dsX5AqduhWkaOZkv91zaUp69rPJuWNgFaA2MGOFIRiehbLgWdAJyIIDDmhsVBhBHO8I1P0GMP8SFac8SF2AZIuszO7vq4yM58ewtWE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=HyWhzDTt; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <daniel@gibson.sh>)
	id 1vSiAO-00Eku1-29; Mon, 08 Dec 2025 21:49:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gibson.sh;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=U7ZnXGxKhhwonAbIYoP4Tqgk8CKODIyRTD+Tp0bmyzc=; b=HyWhzDTtmrAA78y5i3OdbtChpH
	CgHlgZCFe4oZh1E34H+h5l5lbkNz4oldEis4vsKojWCKNKK8xSQ973/MNeUB6/jDG4ZPwOJGJHEBG
	0CPOKMBuHhEcB3NVAg6gCEdcGdLDlScpvaa5eABzkNGoS7gK4Ap2Y3zTObalYCksJqi8seoZ5tbo2
	cB9qAV4N54BKTFJ9BXKVdBWfs5lMabo5Z9sjEzjL6RN6Wmj4XYa2yAWV2ReTs4/MN13J8hNWuVWTX
	F0B1QAUmmZs8xwrpFLLc2ZLhSbaUdVyrT0v9AkNOBCWpf4mJqPrgYbt2DTYydW1nSC99p3/vgruEu
	m2djTlpw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <daniel@gibson.sh>)
	id 1vSiAM-0000cK-4Z; Mon, 08 Dec 2025 21:49:06 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1104311)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSiAC-00An5I-7t; Mon, 08 Dec 2025 21:48:56 +0100
Message-ID: <22ae55db-261d-4bb7-a83c-12fd00fa5527@gibson.sh>
Date: Mon, 8 Dec 2025 21:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
 <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
 <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
From: Daniel Gibson <daniel@gibson.sh>
Content-Language: de-DE
In-Reply-To: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/8/25 05:48, Bartosz Golaszewski wrote:
> 
> Thanks for bringing it to my attention, you're probably right and thats's
> just an unintentional omission on my part. Do you want to send a patch that
> will fix it or do you prefer me to do it?
> 
> Bart

Thanks for the quick reply!

I'd prefer if you do it, I'm not too familiar with the kernel workflow.

Cheers,
Daniel



