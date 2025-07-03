Return-Path: <linux-gpio+bounces-22691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6CAF6BD8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32C01BC30F9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEA529A310;
	Thu,  3 Jul 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XM0FUQvu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048329A9C3
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528677; cv=none; b=iONMg0Pc3Vh0bkxo+78MdhhTt/ISpLIoFrJn9tCXNscgUwGrCr3MUJqjnKg8QhBwz5Ft5BzbpaJzmxiLm4/0/IysUSYjmknBpIxESw1pZQ39iC0Ii4Rv/WgUb5t+5ihCDxRF4TVrpfWCIuW+ASMcwqCu5i3mopxCo57KFUkN+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528677; c=relaxed/simple;
	bh=uvVRyhXXQdTqyi6qD5hNeOYfV22QucTwchUcnBUrknA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ub63dJEuyUuLedf+63B0WCaCSvIKNL+BgX32z+YAancOGLyCZmFj2snSzxWW7jRIxKvWRlTRH74iWEGfnZNComominVoTNwtTdvi75dly/XuhH+1xEH5Nhvz9nNnr027JR+CqjFQCpmSNnHLhOeOiPk4oYIjlzIi4Isb+Wbtz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XM0FUQvu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1318487566b.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751528673; x=1752133473; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehl5KtGOpHzky0HjBHJk4xPR2pkTI+t/MI0XeErvFsM=;
        b=XM0FUQvui1fZXO1V75GtBInPHIvw1/vf2VzdMjiepb6PPuJQH3r68sjH0V+gnoK+gk
         7tQIN21Z67DsutrxybfciKqJ1rFuZ1rlck654G1yqApIUn9sb635YhiN6Vyg4XJ5Livh
         X3K9KsXAJNYLPgbVqnsWRzBldzuxqm9+eamRmk2o5q1Cr0J5pjkqJPPHqdnOp7EuVVoG
         NJZVrOz8X4nt/kfkFi/KKxmyuML0GN/ogvQ57WLJ+MjgUh2PMbFD2ehx/htFdt86oCWq
         nf3HeTMhKCGgJ1zNPO5PurogHhRQqYKX8Rv44UPuLeiX3yqBZHOeTBIzJnk6RM5I4YjX
         qRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528673; x=1752133473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehl5KtGOpHzky0HjBHJk4xPR2pkTI+t/MI0XeErvFsM=;
        b=iEiNaOMEuvglcTPpx/aSgy9w+QaXugnueWCZPrxRxJXHErTvz25L5hKYBUcrlbUMHE
         ryGqhr7yxMBrx+5wk0vy4VhI1uWok0KyUDX8wvCHHEk93LF1O84FPXL+CPlFJnJ2SORK
         mIA4fWlqDIznGTqtUTwf3CZWtiHXAaBPkKO+UXd9zta7q6pc7zZw2QqMd9yGuhsSN3t5
         KV/XVqleCR9WCzFuVniNxyIH4AQ9WAv5NbBnk9q0lzq9Kc4pOdbhu3/4w5mjkVb04V8x
         PhpWsB+YBQ7T6Ystfoey+czQiL8Xfb+MDb8SeeKGzT6XBmIOSprYyNl+ajvV+iIJnKgh
         qpWA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbxE932OhF4R+kqzAlkwiiK+/70wYQp3xubmt4mKHnOs0CCBFmedA1qXQbcSKVYpjj/tVB/TnGkte@vger.kernel.org
X-Gm-Message-State: AOJu0YyuT0exPOA/vFakGFFgQVhC364zJeeKR5pMu0ybCKJd/MX1xGcy
	xjmrFjYMzHiXweQc92o0W3pqNhkqQ76fp6unhQlL8xoJCj58RttHGqvMkJkJDcnk4Xk=
X-Gm-Gg: ASbGncvszUnG8yjysrXEiX+Shh5iMdt4WVZ+IAhaIEisBTVzvzq2SC1RBv7rMkq7GEU
	H+LmVQHDKhOgMUso3iIuiA/HuN3xbLpqAJ2UEZgdoNndo7drTUJQbzzvdc3SFZ8siL6AfL6h6vA
	QKaRzmP8UlpjmlQ8J7v8E8gNPgqbHVgxpsjlG2rc+zylQk3va7Di0oiCFLC8IpY3uwJvY5Xm5j7
	2fYuaFrCwdpwDBnIVsbcvBQY9UBxIVMa79igXCQOzYiCyE+Z9tT51Kja4Vrs8W/S8s3MvHSi9W9
	KrdjIOYiKRleglwqQlpiH0oVYV1UX0rYFPKWWsZ9tC1BSN2j/yqIF8OyrjZvf06pr1fvVIvURUn
	sq/PT2n83B70UDb4fIB6jnEqFaYJ6ASc=
X-Google-Smtp-Source: AGHT+IGLNZcinQlfIyw3lAwbWdmloxbfyjW3HhG1I1bCNhAbESegDou4m/JgC6K6XblVy3HyEzMmUA==
X-Received: by 2002:a17:907:60d3:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-ae3c2c3f3b7mr616343366b.42.1751528673290;
        Thu, 03 Jul 2025 00:44:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363a172sm1202442566b.8.2025.07.03.00.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 09:44:32 +0200
Message-Id: <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
In-Reply-To: <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>

On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
>> Document the Top Level Mode Multiplexer on the Milos Platform.
>
> What is Milos platform? Does it have some sort of model number how we
> usually expect? Wasn't this SM7325 or similar?
>
> The problem with such new naming that it awfully sounds like family
> names, so just expand the name and explain it.

Please go argue with Bjorn/Konrad about this, wasn't my idea.

https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualc=
omm.com/
https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@=
oss.qualcomm.com/

Regards
Luca

>
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
>
> Before you start adding such 'milos' all over the code, you need to
> update the rule for compatible naming. I don't know how thus I would not
> recomment the switch from obvious model number to non-obvious cryptic
> alias.
>
> Best regards,
> Krzysztof


