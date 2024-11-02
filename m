Return-Path: <linux-gpio+bounces-12479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA19B9D4F
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 06:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8051C22AFB
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 05:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1114A0A3;
	Sat,  2 Nov 2024 05:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="D2NrWu4h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB42C125;
	Sat,  2 Nov 2024 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730525203; cv=none; b=INLcuu33yrpSx3l3vIkMbBS0qIRF8r5cTPrFlJv+2zX3TePZQA9EprgIxFkxDm+TnvJw58TvZlLSlOEFupLQ/m5vDQIjFvi5h25ewTTLHjinkNKmMaSfC+l7+luePW86COxwNkPMAmui+/pgUgwSrKkph/kr4ZBnC/DBs4qSHYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730525203; c=relaxed/simple;
	bh=KjNwzMV5yvgyY1Ft01pRLLi2SK3O5QpnitB0cGzkzlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtrGCxRkAFANZCcIsrEZN7Q0OMfkjm2knarkMmrZMt9LLNmV/MgrZe0HJRb8B68+UqYOuS/VlYIkzLweKLKndwkeJoTNm2klJWDWFpqnnKET0krjyfcHbX7Ib2RQsALnDKFqWqbmNIXDcGLTWedZssQVAl1ZzAYtWXHYw3C00Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=D2NrWu4h; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [192.168.1.107] (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 68B7E88C05;
	Sat,  2 Nov 2024 06:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730525193;
	bh=aMBU2qOGn7N5XNfPAceGpX7c3ieAUrfe/STrbX+Z488=;
	h=Date:Subject:To:Cc:References:From:Reply-To:In-Reply-To:From;
	b=D2NrWu4htWk6G82mMXPh8UXqSbeaxwqR4dopgzwHnoe75elXhJGI/5BfVn+i2i/MO
	 OXi0K87SbgioOxWv495Nsg5kxmzcjl5lho03tjzJdClwRAAWwvh61yurQfhUmn7Mmd
	 NYw64zfgpUUaZ55vHxC3ZUUDQOzGl2e7d0yIOCcXZKbvmoYbhgIKzoxfVY9c/X+TvI
	 A/zrO+rntpr0cgU+QS6XQxwwOKrLda7ozRn834aVex/7bgTPLFoVGoae3bMh9ST3li
	 rPYljYsA5TXG2bY6krRAzPHtE6a6CSDm7H8XmkGa3gxc6QuRuS1xJ3ayWa7I/TD5b2
	 kqZfDFKNNlXMA==
Message-ID: <644ae184-1fef-fa42-06de-e1086b7b14bb@denx.de>
Date: Sat, 2 Nov 2024 06:24:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sx150xq: allow gpio line
 naming
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-3-hs@denx.de>
 <639d6ab8-688a-437c-adb9-9dea1fbd0c51@kernel.org>
From: Heiko Schocher <hs@denx.de>
Reply-To: hs@denx.de
In-Reply-To: <639d6ab8-688a-437c-adb9-9dea1fbd0c51@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Hello Krzysztof,

On 31.10.24 19:14, Krzysztof Kozlowski wrote:
> On 31/10/2024 16:12, Heiko Schocher wrote:
>> Adding gpio-line-names property works fine for this
>> device node, but dtb check drops warning:
>>
>> 'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
>> from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#
>>
>> Allow to add property gpio-line-names for this devices.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>>
>> ---
>> checkpatch shows
>> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>> 'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
> 
> No worries, this can be ignored. Warning messages can pass the limit (up
> to some point).

Fine, thanks!

>> Ignored, as it is a make output, which helps to understand the
>> reason for adding this patch.
>>
>> Changes in v2:
>> patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2
>>
>>   .../devicetree/bindings/pinctrl/semtech,sx1501q.yaml          | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
>> index 4214d7311f6b..fd0936545bb8 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
>> @@ -26,6 +26,10 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  gpio-line-names:
>> +    minItems: 1
> 
> I think gpio-line-names should always match the actual number of GPIOs
> for given device. Do you have here devices with 1 gpio? This could be
> further constrained in if:then sections.

I have the device with "sx150x_16_pins", see drivers/pinctrl/pinctrl-sx150x.c

I started with minItems, because I thought it is okay to allow
less names... (as I did in patch 3/3) but see now, that other drivers have
minItems = maxItems.

So I think I should add to my patch the following part:

hs@threadripper:linux  [aristainetos3-dts-v3] $ git diff
diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml 
b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index fd0936545bb8..0872ee1c6fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -91,6 +91,45 @@ required:

  allOf:
    - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1501q
+              - semtech,sx1504q
+              - semtech,sx1507q
+    then:
+       properties:
+          gpio-line-names:
+              minItems: 5
+              maxItems: 5
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1502q
+              - semtech,sx1505q
+              - semtech,sx1508q
+    then:
+       properties:
+          gpio-line-names:
+              minItems: 9
+              maxItems: 9
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1503q
+              - semtech,sx1506q
+              - semtech,sx1509q
+    then:
+       properties:
+          gpio-line-names:
+              minItems: 17
+              maxItems: 17
    - if:
        not:
          properties:

With that, dtb checks than claim (as expected) for my 3/3 patch
from this seris:
"""
imx8mp-aristainetos3-proton2s.dtb: pinctrl@3f: gpio-line-names: ['RELAY0', 'RELAY1', 'RELAY2', 
'HEATER', 'FAN', 'SPARE', 'CLEAR', 'FAULT'] is too short
"""

So, I adapt that too in a next version of the patchset, if above
change is okay... is it?

Thanks for your review!

bye,
Heiko
-- 
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

