Return-Path: <linux-gpio+bounces-17469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C892EA5D284
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 23:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F00189CF6D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 22:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81860265608;
	Tue, 11 Mar 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/ZlKnUe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01C264FBF;
	Tue, 11 Mar 2025 22:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731987; cv=none; b=nyw9ykhMkxZ6Czt9XQSq3x9rhC1TfbfFLNYzzZZF1hKVivWn+9GZ0D3Tp6vNkZ1M5GngcCiF1AMWSqAU6GWkJ/tgIDyxSjUdQQDXZBRGNu8VWaOrZqGI5F5VzFm4p4s3RY9Qzi5Bo+ERycP/UAEFQ+GzqvNMOFwvUU1LMEnGvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731987; c=relaxed/simple;
	bh=y/s1wHtwOdLkh+VUyBF9E+beDzVumNiYYUBEmQs7FJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVZpa1l/hhF4eiaKVXKFnVe2Eb0mhu/3PhZ+dv9H4DxjyBlKyaWXBwTW9EkmWTxKic24jKAxMKGFY5LDmKEB2n2e2YutbzKl6Khonih93FHnOf3JPmILvZLbnpfVPsdA8z5ujWyKyIFLi5bMIQY/4lYZvmQ/OPOLZm7vwPQ1hkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/ZlKnUe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso188630f8f.0;
        Tue, 11 Mar 2025 15:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731983; x=1742336783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQVMT0SYg7MWzDSI+5t//19e57L1PwaokMNGGmBaDBc=;
        b=f/ZlKnUeA1GWexLCdumAF7L9rOj92WjOu8ghriyiqwvZNpw9++DPjYBbv/sH8sceoE
         7xdY6m0PK2pZCiuFgHO0HPVMw1LuVgEcF2wKC6JR/zLkXVv3voGap5KJv6RlumWQqZ1p
         g/x5TEuJEz8YV1goFfK+5wEj3dksT/olu0K0hcS24DMjtRP34VzkkAJ1vU59HkXN1T5c
         hrUTZtgufKLmVP8ZakMBKqfwZvCVg7uTiYlPufZ6jA+i76dOjAkSu4yJ1pGAfxjVg8tT
         1nurR06RuWtLPvnOQurtxQSlTUVEc/cHVFneKH3rBgJ5bwfONmBYrng/5C4NVYWtzrVv
         6JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731983; x=1742336783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQVMT0SYg7MWzDSI+5t//19e57L1PwaokMNGGmBaDBc=;
        b=gch7ptvXMki4eLs9UDveycPJ5c1gr/fQ2v/Us+SHRcoMvr9jS4sLClt+dwhq4L7aNi
         WYOLSol5mS5l1pVcIplhhjFdpifKHElmN7xvt3VTHFN97EsD7dLftHiA88ptdUjudNjd
         PwbZlOrlNYavUgJ3224tcfD6IKGy4KtJ51+kASaHfpkMKR8N/+Rp/EjfmIQQ7rL51hiv
         1VckVeRp22T90NFh74at4KsSw9r4xGWdk0QlWlXuqihCdoTkYZAlxh+CbAF9A/nKOZak
         H/Tx7y28mTiEx/YWQ0pGlIWuXekF6H/2nk3utzyK4/JVZTRIwIaPXGQC10qhCl2Bsgmy
         1gxA==
X-Forwarded-Encrypted: i=1; AJvYcCV/mtImgjRIV3kiBRUwnVWfSnLKL9Ao8dzmvRjeUILRT+eAzxlnZA+xOza+j9Y/p026p/5FxzS2oEHR@vger.kernel.org, AJvYcCXHmO+yBt76KZDnKV/cgKK5laz8lKGGyJ2A+tDjbEo7ekSXRBv2AVPoUjJOriasJELKp8aLsGJ0Hmx5XA==@vger.kernel.org, AJvYcCXQdSKOU7IsNbwY82fC/RShLtvAefdeKmByhTU4r/0vEXhpWI3h5dO4f3uDZpBdtALlGZWJr7PamSFGkhvK@vger.kernel.org, AJvYcCXewKyijZ3WqorFNHiDApVdaquzi7/KMaT0CdHH1OEPr6wbKCKWIS5fi/rewIpneQsYcpQB9RjB6dj/Pbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTVOq3fOxrF30A60V19ZEU+jPnpRbncImmhNnTrLk4U0KzY5q
	OhJV+pYFWxxN23OPUNcSKs0x8t2SnT9Hv1B41id7LQrvUoknPQNK
X-Gm-Gg: ASbGncsQoOREE0Q6SkjxtpYm/BQKPXu77NECQ6vreG1GqecUIje4QkMTyy+GCDaRktF
	YSYJIxCFeHoVLgR65NE/xFNkur9vJdXdcIOhHQp0kTM4QjH9fER2e+LVI3aw5NYiQSXvzffM//b
	U2MXp83+JLf+PsMeTIFpCk9Eb8wfQcRL7Qqa9ARo9TVuLTTkxR48+V5Iaq338Z1S5rJcsOKKrjP
	3QCfxmA7S/DF8wu+V3VgG4XfjoA34Zabtes+wymVFO9FnNN4fblo+sZPXZ2cJnxCMBVvxdMCLrI
	RP+erHlCQNv0khY4niPBStYbb5Jj96LW/8rrRFhPBpxO0/SeByo=
X-Google-Smtp-Source: AGHT+IGRf3+rxXg9y5r2+u9zmmrMjmX28RK97Boc7y5I6WN3NsKiYYv7R2o+DZaG/J3zfHe+qJasNg==
X-Received: by 2002:a5d:6d87:0:b0:391:65c:1b05 with SMTP id ffacd0b85a97d-3926c5a5dfamr6122321f8f.11.1741731983075;
        Tue, 11 Mar 2025 15:26:23 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba8a9sm19294599f8f.9.2025.03.11.15.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 15:26:21 -0700 (PDT)
Message-ID: <80456f67-1742-4b54-98dd-0985f95c376e@gmail.com>
Date: Wed, 12 Mar 2025 00:26:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/16] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
To: Rob Herring <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-12-demonsingur@gmail.com>
 <20250311190711.GA3985355-robh@kernel.org>
Content-Language: en-US
From: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250311190711.GA3985355-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/25 9:07 PM, Rob Herring wrote:
> On Sun, Mar 09, 2025 at 10:48:03AM +0200, Cosmin Tanislav wrote:
>> The MAX9296A deserializer converts single or dual serial inputs to MIPI
>> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
>> in the forward direction and 187.5Mbps in the reverse direction.
>> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
>> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
>> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
>> GMSL1 links. The serial inputs operate independently, allowing videos
>> with different timings and resolutions to be received on each input.
>>
>> MAX96716A supports both tunnel and pixel mode.
>> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../bindings/media/i2c/maxim,max9296a.yaml    | 281 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 287 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>> new file mode 100644
>> index 000000000000..97731549d161
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>> @@ -0,0 +1,281 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2024 Collabora Ltd.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
>> +
>> +maintainers:
>> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
>> +
>> +description:
> 
> Needs '>' token as you have paragraphs.
> 
>> +  The MAX9296A deserializer converts single or dual serial inputs to
>> +  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
>> +  or 6Gbps in the forward direction and 187.5Mbps in the reverse
>> +  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
>> +  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
>> +  serializers with GMSL1 backward compatibility. The MAX9296A supports
>> +  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
>> +  allowing videos with different timings and resolutions to be received
>> +  on each input.
>> +
>> +  MAX96716A supports both tunnel and pixel mode.
>> +  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max9296a
>> +      - maxim,max96716a
>> +      - maxim,max96792a
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  powerdown-gpios:
>> +    maxItems: 1
>> +    description: Specifier for the GPIO connected to the PWDNB pin.
>> +
>> +  port0-poc-supply:
>> +    description: Regulator providing Power over Coax for GMSL port 0
>> +
>> +  port1-poc-supply:
>> +    description: Regulator providing Power over Coax for GMSL port 1
>> +
>> +  i2c-mux:
>> +    $ref: /schemas/i2c/i2c-mux.yaml#
>> +    unevaluatedProperties: false
>> +    patternProperties:
>> +      '^i2c@[0-1]$':
>> +        $ref: /schemas/i2c/i2c-controller.yaml#
>> +        unevaluatedProperties: false
>> +        properties:
>> +          reg:
>> +            items:
>> +              minimum: 0
>> +              maximum: 1
>> +
>> +  i2c-alias-pool:
>> +    maxItems: 2
>> +
>> +  i2c-atr:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    patternProperties:
>> +      '^i2c@[0-1]$':
>> +        $ref: /schemas/i2c/i2c-controller.yaml#
>> +        unevaluatedProperties: false
>> +        properties:
>> +          reg:
>> +            items:
>> +              minimum: 0
>> +              maximum: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    patternProperties:
>> +      '^port@[0-1]$':
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        unevaluatedProperties: false
>> +        description: GMSL Input
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
> 
> What properties are you using from here?
> 
> None actually because /schemas/graph.yaml#/properties/port won't allow
> any.
> 

So these lines should be removed.

         unevaluatedProperties: false
         properties:
           endpoint:
             $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
             description:
               Endpoint for GMSL2-Link port.

Should I submit patches to do the same for the maxim,max96714.yaml file?

I basically copied these bindings from there and adapted them, and those
bindings seem to have the same issue.

> 
>> +            unevaluatedProperties: false
>> +            description: Endpoint for GMSL2-Link port.
>> +
>> +      '^port@[2-3]$':
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: CSI-2 Output port
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              lane-polarities:
>> +                minItems: 1
>> +                maxItems: 5
>> +
>> +              link-frequencies:
>> +                maxItems: 1
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +    anyOf:
>> +      - required:
>> +          - port@2
>> +      - required:
>> +          - port@3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-atr.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - maxim,max9296a
>> +              - maxim,max96792a
>> +    then:
>> +      not:
>> +        required: [i2c-mux]
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - maxim,max96716a
>> +    then:
>> +      not:
>> +        required: [i2c-atr]
>> +
>> +dependentRequired:
>> +  i2c-atr: [i2c-alias-pool]
>> +  i2c-alias-pool: [i2c-atr]
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        deserializer@28 {
>> +            compatible = "maxim,max9296a";
>> +            reg = <0x28>;
>> +            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
>> +
>> +            i2c-alias-pool = <0x40 0x41>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    des_gmsl_in_0: endpoint {
>> +                        remote-endpoint = <&ser_0_gmsl_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    des_gmsl_in_1: endpoint {
>> +                        remote-endpoint = <&ser_1_gmsl_out>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +                    des_csi_out: endpoint {
>> +                        data-lanes = <1 2 3 4>;
>> +                        link-frequencies = /bits/ 64 <400000000>;
>> +                        remote-endpoint = <&csi_in>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            i2c-atr {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                i2c@0 {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +                    reg = <0>;
>> +
>> +                    serializer@40 {
>> +                        compatible = "maxim,max96717";
>> +                        reg = <0x40>;
>> +                        gpio-controller;
>> +                        #gpio-cells = <2>;
>> +                        #clock-cells = <0>;
>> +
>> +                        ports {
>> +                            #address-cells = <1>;
>> +                            #size-cells = <0>;
>> +
>> +                            port@0 {
>> +                                reg = <0>;
>> +                                ser_0_csi_in: endpoint {
>> +                                    data-lanes = <1 2>;
>> +                                    remote-endpoint = <&sensor_0_out>;
>> +                                };
>> +                            };
>> +
>> +                            port@1 {
>> +                                reg = <1>;
>> +                                ser_0_gmsl_out: endpoint {
>> +                                    remote-endpoint = <&des_gmsl_in_0>;
>> +                                };
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +
>> +                i2c@1 {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +                    reg = <1>;
>> +
>> +                    serializer@40 {
>> +                        compatible = "maxim,max96717";
>> +                        reg = <0x40>;
>> +                        gpio-controller;
>> +                        #gpio-cells = <2>;
>> +                        #clock-cells = <0>;
>> +
>> +                        ports {
>> +                            #address-cells = <1>;
>> +                            #size-cells = <0>;
>> +
>> +                            port@0 {
>> +                                reg = <0>;
>> +                                ser_1_csi_in: endpoint {
>> +                                    data-lanes = <1 2>;
>> +                                    remote-endpoint = <&sensor_1_out>;
>> +                                };
>> +                            };
>> +
>> +                            port@1 {
>> +                                reg = <1>;
>> +                                ser_1_gmsl_out: endpoint {
>> +                                    remote-endpoint = <&des_gmsl_in_1>;
>> +                                };
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index abf3afc95fc9..c1e01668e81a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14220,6 +14220,12 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>>   F:	drivers/iio/proximity/mb1232.c
>>   
>> +MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS
>> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
>> +
>>   MAXIM MAX11205 DRIVER
>>   M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
>>   L:	linux-iio@vger.kernel.org
>> -- 
>> 2.48.1
>>


