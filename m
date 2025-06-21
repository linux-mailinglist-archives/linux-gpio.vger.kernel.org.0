Return-Path: <linux-gpio+bounces-21954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F3AE2B2D
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 20:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05B03B8121
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 18:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AF414D283;
	Sat, 21 Jun 2025 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="wc0XkzZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0ED25CC54
	for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530233; cv=none; b=l9eMvHgMXTXT5BceT/XyD7hGXpr0JqWDTFHFp78PHXtvEZTd9+vS1cj2iBWjN0n510JC95HgcMI6v6XkTGnWbH7QJIWwou6CWDv3dejjLow1B+/7bwDkItn9sDV9hD8kv2W2CT5BIWtymFxgcWH95BtSI/yQLlwXIuZMHTDAHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530233; c=relaxed/simple;
	bh=1kjbQRNV+kdyvYht69OR8em0lP5E1kwbQKM7tLaAM+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGXm8KHtHUUHNpc4NXz/V6o/GqMtk8GrJILqrJvsyyLtw3k0JDpqAjZNoQSjWeWLSztiLt3knkyETG24ncxlIz/pNrKqz//pnuRYEH2yuZvTs3cuDh9Ra4AMB9EIfIz550OJVelmPqWVtWL8vUaqPxQ12+Memhlmqnctgb/06Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=wc0XkzZP; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750530231;
 bh=c8Cm6OZTP4F2j2Q9XkN9rRSITxGowWMls2fh3eRV5qw=;
 b=wc0XkzZP/s1qyashxOWz8Oo1eFp+hmgbWgrMOmfIJtJrqDH4FAL8GoAddxuk0diQseXZqHvb3
 4o9wStPmcgNOQbm2U4X2TJqS0hk6XDq9p1T74aLCRSSKHQ/UylcvgLzvsDYP3jZLFdmkP58309A
 hI0K7tLzbiA7YnVdQeN9ShLr3KMlGH9mwmUQu6lci/0HpJKbJ4q/ZPXfL4VjCmtZwVwHsCb9yln
 76OO57ZYap5Dh2dlnciotMAKF4An/+5UCYYcCNv69z28y6ixZNDonHyQMWW2lObXWjMc1fdfG9p
 jU0k36P9oOPY2Bhw1V9zSmcZhMUJutKZL6hRY5JpBcqQ==
X-Forward-Email-ID: 6856f8a805da1d979e438ca6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <40a8e390-64bc-4822-ab53-8f2b65c0b1fb@kwiboo.se>
Date: Sat, 21 Jun 2025 20:23:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] dt-bindings: gpio: rockchip: Allow use of a
 power-domain
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-7-jonas@kwiboo.se>
 <20250527193439.GA1101149-robh@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250527193439.GA1101149-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rob,

On 2025-05-27 21:34, Rob Herring wrote:
> On Sun, May 18, 2025 at 10:06:53PM +0000, Jonas Karlman wrote:
>> The GPIO controllers in most Rockchip SoCs are part or power domains
>> that are always powered on, i.e. PD_BUS or PD_PMU.
> 
> Are these described in DT, so this is valid to add for all SoCs?

PD_BUS and PD_PMU for prior generation Rockchip SoCs has typically not
been fully described in device tree. Probably because they always needs
to be powered on or missing documentation.

> 
>> On RK3528 the GPIO controllers are spread out among the PD_RKVENC, PD_VO
>> and PD_VPU power domains.
> 
> So should be required for RK3528?

One of the five GPIO controllers on RK3528 is part of a power domain not
being described in the device tree. And without having access to any TRM
or other documentation it probably wont be. So requiring for RK3528 is
not fully possible, and for GPIO controllers in other Rockchip SoCs the
power-domain could theoretically be described in device tree.

Regards,
Jonas

> 
>>
>> Add support to describe power-domains for the GPIO controllers.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> index d76987ce8e50..bdd83f42615c 100644
>> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> @@ -41,6 +41,9 @@ properties:
>>    "#interrupt-cells":
>>      const: 2
>>  
>> +  power-domains:
>> +    maxItems: 1
>> +
>>  patternProperties:
>>    "^.+-hog(-[0-9]+)?$":
>>      type: object
>> -- 
>> 2.49.0
>>


