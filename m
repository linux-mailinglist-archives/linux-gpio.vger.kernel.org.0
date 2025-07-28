Return-Path: <linux-gpio+bounces-23865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B015B13AF1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 15:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3C041742D6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 13:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FA0266573;
	Mon, 28 Jul 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzfTz7oi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6557261C;
	Mon, 28 Jul 2025 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753707770; cv=none; b=cs9YahHlOm0b8Sa7D7hVNvdn1GqXKOEwLoEuZ0qhFhMkytHGsg4EbGuoPyqw8J7tm1TmNEk4ISxA7LQcTFm0yH6G5hfMBPg8oYkGRXqVkodmyejwhvxgMAaD8tddvmEOFyuqDXIQti6Dt/aTdpVhAhaVousvh6b6ky7uMWKuS60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753707770; c=relaxed/simple;
	bh=R1fGAE8YOzEwmxRKgWpof//eBo5lBECXbGbbv/3X41g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0exUCZHZu4oq7VlpOimgDeLojY/EJilxeVKVf3il8FFdxd1kwfC9yfrnsC8cfRg2VUWWexvW8JcabVC5igQ64Pc0JdnG9H/EpPERre67WLrN1UUXnuyLYAyD7XeyoNxtILzzYU8SGP35vEsQvC9gCyX95PhwmhoUowWp76CCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzfTz7oi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFDC4CEE7;
	Mon, 28 Jul 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753707770;
	bh=R1fGAE8YOzEwmxRKgWpof//eBo5lBECXbGbbv/3X41g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OzfTz7oiEhQ3Y0e6IV83aeWKIw6PNBAHpG7HEgH7rxrUGF2Cujl6SW8EKMtBpxUaX
	 9XhExXPihup5v63jBsk29aYaFXAiZnBMdnf7nS/AsACE5yGQ0Pu8Qr/yuch0OobfVV
	 ptpSQJBrePrmCLUhO/AEH5dYKEypIgq5ai2oLkpUY9t+w7iUlCgBIdZsLagdRQTMMr
	 MLmMmFQ4tRzQUZRfB+hXQXI6j07zaKI6gwhLyIagb9YpSuUyN9+mbtJgrEBFi0cup0
	 5uJv30H6hyMP7lEFF/s0W9qiCWqO52YNTOcNj0/uN8+CS3XUZh3UMkr6dX9Ro3I944
	 cVTBK2VTSf1cA==
Message-ID: <4bc486cb-9d94-4bad-ae07-e9a7aeed481a@kernel.org>
Date: Mon, 28 Jul 2025 15:02:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: codecs: wsa883x: Add devm action to safely
 disable regulator on device removal
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250727083117.2415725-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <07faf0cc-a8e6-426d-b397-dfc321a7f3df@kernel.org>
 <aae92260-5169-4af1-97b0-48f364612dca@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aae92260-5169-4af1-97b0-48f364612dca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 14:36, Mohammad Rafi Shaik wrote:
> 
> 
> On 7/27/2025 3:00 PM, Krzysztof Kozlowski wrote:
>> On 27/07/2025 10:31, Mohammad Rafi Shaik wrote:
>>> To prevent potential warnings from _regulator_put() during device
>>
>> Warning is either there or not. Either you fix real, specific issue or
>> not. The code looks correct at first glance, so please describe exactly
>> how these warnings happen or how what is the bug being fixed.
>>
> 
> The current wsa883x codec driver manually enables and disables 
> regulators during probe and remove.
> In patch v3-0003, reset functionality was added using 
> devm_reset_control_get_optional_shared_deasserted() for shared gpios.


There is no such code at this point. Each patch is a separate commit and
must stand on its own. With its own explanation. You cannot say that you
add bugs later, so you need to fix something now.

Describe actual problem here. If there is no problem here, describe why
you are doing this.

> 
> However, during cleanup, this led to a warning:
> "WARNING: CPU: 2 PID: 195 at drivers/regulator/core.c:2450 
> _regulator_put+0x50/0x58"
> 
> This occurs because the regulator is still enabled/released when the 
> devm-managed cleanup path attempts to release it.

So that patch was broken? You just did not properly clean up there?

> 
> To resolve this, remove the manual regulator disable logic and instead 
> register a devm-managed cleanup action using devm_add_action_or_reset(). 
> This ensures proper cleanup and avoids regulator misuse warnings.
> 
> For reference, the wsa884x codec driver already follows this approach by 
> using devm actions for regulator management.
> 
>>> removal, register a devm-managed cleanup action using
>>> devm_add_action_or_reset() to safely disable the regulator
>>> associated with the WSA883x codec, ensuring that the regulator
>>> is properly disabled when the device is removed, even if the
>>
>> Device cannot be removed/unloaded, AFAIK, because of suppressed bind.
>> Regulator is already disabled during error paths, so that part of above
>> sentences is just misleading.
>>
>> How can one trigger the warnings?
>>
> 
> The warning in _regulator_put() can be triggered by applying patch 
> v3-0003, which introduces reset functionality using 
> devm_reset_control_get_optional_shared_deasserted().


There is no such code now. You say "potential warnings" are here.

> 
> Since the existing driver handles regulator enable/disable manually, the 
> devm-managed reset cleanup path may attempt to release regulators that 
> are still enabled, leading to the warning.
> 
> This issue highlights the need to replace manual regulator handling with 
> devm_add_action_or_reset() to ensure proper cleanup and avoid such warnings.
> 
>>
>>> probe fails or the driver is unloaded unexpectedly.
>>
>> How driver can be unloaded unexpectedly?
>>
> 
> "Unloaded" might not be the most accurate term here. What I meant is 
> that the driver’s probe can fail due to an error—such as missing 
> resources or improper regulator handling.


Use standard Linux terms, e.g. probe failure, probe deferral etc.

Best regards,
Krzysztof

