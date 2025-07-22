Return-Path: <linux-gpio+bounces-23625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74CB0DEC6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 16:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E2916E1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628121AC44D;
	Tue, 22 Jul 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rNamLTE7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A72E093E
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194583; cv=none; b=XXyBkJNcWWaTydu+Oznbe8lM+n/LtMhitmpl3w1DXZNK9Z5CyQeux5KrLGQjbEN7Sy1Z+Ue4+SkwgzFfI1J1IO9nOQmub7M6Mn+lzQlBV+MllvqDmIsuItdVoNX/uqZE/JhyHhj6m3alEIZLLIHVeiMyNCp04eLH+mBX3uQ+9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194583; c=relaxed/simple;
	bh=eJBssySJGcFKIYVJchM+wWdNFawpVuNYlagTrqAI8XQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CVHW45wopUhH1cGR2R2Ln4b5bUoXe60Q4vi9B/VaUhulqfACvptrZQUGLq1U3B+Y3429TwhGSruF+Wi80zHWJih6/1shT1/a02ObIZUOczG73FotlYCis50IgWV1W/8o66QwgGOSrPqCvLiR1PFwRQL8ghi4bvGt3vdB+iAXuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rNamLTE7; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so1047628866b.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753194579; x=1753799379; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZnozY3BLIkuA8NA4eNUY0Vf/U8jemAXm7Mzb6ICDTM=;
        b=rNamLTE723bJTXI7ZBoxsG7cNlEsJTes3JImaUswENXFlgLnmch4J4c8WvQPXYkKPq
         26Q9qxivCT0AJu8qI8t4DcVHUP7WrYX+yslstetmG1LcTPsNdFwabIVIbK4rAokBcBqq
         u3MoOOkhTxoiKQwbsLrtGTdhiQFJGNKuROOjgjlTWUS2GVS83cgjwVPJMUhoAR9qARRO
         C43Ps6hY1X769nrHdxzOnON/h0W/lDDNsngRZlqQrPmdHmFBuOesxW1bZe5bhjH7lTT6
         l5zUL+O8/iMX3cAFIgWZboHxw/Ac/r4c4apx3wJiSo61HkH58MFhttnf8ykJBnyz26Zo
         I9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194579; x=1753799379;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BZnozY3BLIkuA8NA4eNUY0Vf/U8jemAXm7Mzb6ICDTM=;
        b=L1blASHV1FhMfCumfQi0Rcc3CKxphtSgkaEgWrKDYu6t7xw3JZMRi8aTlAjjqwCzn6
         4VtIa1UUro3wFhmhZPlQEFF9pT1gQremgsgSdKiffJF0Zw/FSmuO5UAkwHuM727qBpG9
         yPScWjYoGI4GpAINn573BFfmNSOz6kjZLlkdpV2MTUXwSn8skE/tZKyT3jrfD92nvSwh
         ucXKqO5unHbEcYUf8W7HQMBcdBrC1T2f2BiBzukp+xhU40vmUyJfX9TaitlnHSEpPrbP
         WZWm982SI/xCC6OM79oAneE2wtBwNQU/ld0gdfwey9rYdp8lqgbfdFFHNeJhz+xQGtrd
         tzJg==
X-Forwarded-Encrypted: i=1; AJvYcCXnJQh4UlM59F+2u2TEYLnBKWYv48XTja6K9hzPALZ5akn1Y5G7Ibh0FrkBCczAI4fbFqutvpj0muum@vger.kernel.org
X-Gm-Message-State: AOJu0YyNrto14MxVf3vcAxXZt14MDJh3jBKs5+1f/LAkj4uPp7myq7if
	GQJtAGIqIrt7iQIpyf56vD0lsaWQsHJAU8quFK/01G66ygO+9rgupQfZe7c/qOAEHwI=
X-Gm-Gg: ASbGnctrJSZyCdu8GSR+KDIk5VVuMmr84tvG2gj8Kjw4FRyMpP2Re68S7kxd/jOvh1Y
	dNdnLjrnGw0wM9pxnXBv1A4w6PIbkT4vBET2XxWH6l58s4sGDzJnTQDhcxWSGiH/qXJVzQEDmQX
	L+Hu7zuiuv322XoPQmA/zhrNfT/AX8gG4MYUOLF/ZYwqNfZjGYRnSnCIKu7YEAVv45Tja6bLyUq
	8loU3kTR0IjCz8u2zHG6hCQV4xAun7yNEWZ8Laf0tMUMhdObe6EL2ZdjjgZPc54D80ZNd/psbQT
	tsUn11T6ESEyjYydXCzxGr2bW/W66n0jRDXst9ELT28WMeX9dKa2nakJt+kB+7enPHOxYy98X2+
	sXhi++Mjdisq5SOcP73RTZ3lVA7IqULwrxbnELhchMkj5XJREi5HuN6zHg/En8AZ5r7g=
X-Google-Smtp-Source: AGHT+IFc0VSLFdvV9Ws91KCXp/O3L8BaZaJSH/na/fmYztuvihQfOOHv47U3zveM369mJJJnN+Pi7g==
X-Received: by 2002:a17:907:9812:b0:ae6:d51a:4ca3 with SMTP id a640c23a62f3a-af153e3379fmr374990166b.25.1753194579181;
        Tue, 22 Jul 2025 07:29:39 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2f1a7sm869524866b.91.2025.07.22.07.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 16:29:38 +0200
Message-Id: <DBINLYI68WWM.398758X1RE3VW@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250711182216.GA974600-robh@kernel.org>
In-Reply-To: <20250711182216.GA974600-robh@kernel.org>

Hi Rob,

On Fri Jul 11, 2025 at 8:22 PM CEST, Rob Herring wrote:
> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>> Document the Top Level Mode Multiplexer on the Milos Platform.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/pinctrl/qcom,milos-tlmm.yaml          | 133 ++++++++++++++=
+++++++
>>  1 file changed, 133 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.y=
aml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..0091204df20a0eca7d0d0e76=
6afcb8d08042b015
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,milos-tlmm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. Milos TLMM block
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in Qualcomm Milos SoC.
>> +
>> +allOf:
>> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,milos-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 84
>> +
>> +  gpio-line-names:
>> +    maxItems: 167
>> +
>> +patternProperties:
>> +  "-state$":
>
>        type: object
>
> Because a boolean "foo-state;" would actually pass without.

While the patch has been applied already, I'm happy to fix this for all
Qualcomm pinctrl schemas, since pretty much all have this issue.

Are you looking for a change like the following for all
60+ pinctrl/qcom,* schemas?

If that's fine, I will prepare the changes and send them soon. Different
sorting of properties, or moving "type: object" just below "-state$":
would also work, not sure what you prefer.

++++++++++++++
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl=
.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
index 38877d8b97ff..1d17abde246b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
@@ -34,6 +34,7 @@ patternProperties:
       - patternProperties:
           "-pins$":
             $ref: "#/$defs/qcom-apq8084-tlmm-state"
+        type: object
         additionalProperties: false
=20
 $defs:
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml=
 b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
index 0091204df20a..e277b884bf5c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
@@ -39,6 +39,7 @@ patternProperties:
       - patternProperties:
           "-pins$":
             $ref: "#/$defs/qcom-milos-tlmm-state"
+        type: object
         additionalProperties: false
=20
 $defs:
++++++++++++++

Regards
Luca

>
> With that,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
>> +    oneOf:
>> +      - $ref: "#/$defs/qcom-milos-tlmm-state"
>> +      - patternProperties:
>> +          "-pins$":
>> +            $ref: "#/$defs/qcom-milos-tlmm-state"
>> +        additionalProperties: false


