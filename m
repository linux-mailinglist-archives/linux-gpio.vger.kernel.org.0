Return-Path: <linux-gpio+bounces-17075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5FA4ECE0
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 20:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0463BF6AA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 18:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C95D280CD4;
	Tue,  4 Mar 2025 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="KqEYbZrk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2127EC90
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112007; cv=none; b=YUzPV4xWEIPFC+tISDKVecZn7CMh4maW8kuyGHtpyMK66EY5y64gCOjJUjI8NyFIm+lNPYxmhBy5LkC8qRMTka4Ho9PFTzoC0Rp7p2FPMfkPzu+XInvHUbdoBYGI8MpAe00YB87h+hxM7cVFXaXS5V8HcGVrP1g8kcnK30q9Ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112007; c=relaxed/simple;
	bh=ypPytUNQebnWYDRP7fpFEAJF942EcMHF5lireOs6gk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsKNBKkbnFurYB/oavhQ+UrwxQMhOd4h0SkPKlCKdV6DWmLNqE3Xm7kRYMfL0DoHuQtvbDJ6YDJe4pv7MxZqfzI+ApVb/on96oyheX2pZ8jvDywOAZRHjnjCAj8uu9vfvnr6YiHnDAjOY1qXI7zT7ktZB7iXkHpAyc8fxVhU7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=KqEYbZrk; arc=none smtp.client-ip=121.127.44.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741111998;
 bh=xjqXCgfra637s+rpk4UdFAWQVXX9B5blSLtqx3MNrXQ=;
 b=KqEYbZrkYoM2a8EOqYL75O4oNNU42Kt0WKaWvm7j2fCvgIPr74ds292+aIPClYWBAVZvSQxMv
 subtPZ3tfDvUPKez4iqIOcww3Poe7DOQLndRCjjwbYUcYFvCqZUUTLMJKJHqpdHfU0ExX0QcZut
 vKE0VZr4uXpH+gV1mI/7CD9/XcQrgjXYbCY0rK4fTIBKAo2IjjQa2P1RcxwDiJHJBHPMpXzN+aM
 ve9G/NOw2zrATDFkenq7mHgD4WRolVhoY8I+9sGZC+J9LkNi9yg2WI++0Bmpl8geUFcDoLN4Gok
 QLNfjNB7QcPIE+BmI1xfUqAmN1VOroxMoO5viz/pgzQA==
X-Forward-Email-ID: 67c742bb2e5baeec949f6b1e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
Date: Tue, 4 Mar 2025 19:13:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user
 button on Radxa E20C
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heiko,

On 2025-03-04 13:02, Heiko Stuebner wrote:
> 
> On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
>> The Radxa E20C has three gpio leds and one gpio button.
>>
>> This series adds dt-binding, driver support, DT node in SoC .dtsi and
>> gpio-keys and gpio-leds nodes in board DT to support the leds and user
>> button.
>>
>> This series builds on top of the "rockchip: Add support for maskrom
>> button on Radxa E20C" series [1].
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
>       commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
> [4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
>       commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
> [5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
>       commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac
> 
> Patches 6+7 depend on the parallel saradc support series and thus
> do not apply - and need too much rework to safely apply.

Do you want me to rebase/reorder and send an updated version with
remaining patches? Look like the iio saradc patches [2] is pending apply
so maybe not needed?

[2] https://lore.kernel.org/all/20250304144648.29f376f9@jic23-huawei/

Regards,
Jonas

> 
> 
> Best regards,


