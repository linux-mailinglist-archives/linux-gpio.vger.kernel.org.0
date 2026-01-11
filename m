Return-Path: <linux-gpio+bounces-30415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BED100B7
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 23:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E29803010D40
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 22:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9067D2877ED;
	Sun, 11 Jan 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEaD5sMS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45701223336;
	Sun, 11 Jan 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768169849; cv=none; b=uwAPM78mSgH+L+pwuVZKoBiA/EzpUFGaJSPlU82ypm1m6lNTtvLClr1yhxwSTcCX6K6HkpStqjTvB68lfXFTS4O0QXOwWhj5QUPjOH7XaluoKMqfJZ8CCQlmfXHoLSB45JUSS0VbTffKpM+4KpAawirIj76/T2xyyHf2ymq5OkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768169849; c=relaxed/simple;
	bh=HFLeW/vQfxRwcse0UIhkONJ7hnsbKhsrcLUlRf4DUq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiQDqfAVsgCFuhXQU4rbDdLoQM7nzd8dabjX5krDlCAd8YAXWvYBocfmnQ1Ss4NCf+aLqJqyTL5kJUZ3zWu1qO8uzvdTkcUU5eSS9TpvNKtdX92Ezr/fHsaPmF4+NYUnjjvFJRFXZIZPXEL9Z8UDZIuBVGhho6UxOECjM5rT1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEaD5sMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286EAC16AAE;
	Sun, 11 Jan 2026 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768169848;
	bh=HFLeW/vQfxRwcse0UIhkONJ7hnsbKhsrcLUlRf4DUq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEaD5sMSwJO4QJ7OgjeLfpjHFCWIPJf74sDoVp0oG+DNQ9zYDhByYJqwHtVs6Ycfy
	 G498QHUvej7cZaj0yMrWOdT6mRxgawZz3BI7gPzvyeUdX+dblNQ7rVF7WxxFhQ9hs9
	 TjbO0gAxvnrLx9Epc6+QwbhHerP52FriUo5t6gNEgeDsO0uEhZ4+yio76jNiss+Qwp
	 eiuQZ68x0rh+7AvIpDUM0Ja5mJXFUi4U3/WLmDsasqcSfTnRI31J+R1DjCbjyomH1/
	 8wEZL3FdNfrjbBHREWRBdbWhoXzgD6jGBROsoULPiVq34WLWYNjWu16LGl7ileUsUJ
	 aWeVkEmVTYbdA==
Message-ID: <b0da2a50-2b4a-40e7-ae0f-3f1100ca2adb@kernel.org>
Date: Sun, 11 Jan 2026 23:17:24 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: apple: Use unsigned int instead of unsigned
To: Linus Walleij <linusw@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
 <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.01.26 21:29, Linus Walleij wrote:
> It is discouraged to use the ambiguous "unsigned" type, use
> explicit unsigned int in the driver.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven



