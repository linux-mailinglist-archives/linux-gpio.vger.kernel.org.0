Return-Path: <linux-gpio+bounces-27371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5F5BF66C7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2CC64E2E3D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616782F7AC5;
	Tue, 21 Oct 2025 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpfetL3i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6735505C
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049439; cv=none; b=tJy+qC1A86FOZE6nEnTn7T3BKCTlHinEjoCKtdcpnubTqQFQb0ubWaufGrBN753gjWPiZS8qnBK1imZHYoQ9/Nwt/shbKb5f8Ix+4XWuJo9xNKVjlS+WoH8jtgmF/NstYCNbL3FhAzsVSdr+XeBdL93fbMKNipZKA/oEk1HBaLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049439; c=relaxed/simple;
	bh=0i63VH8uBqPFjrxj4MlK7AOHG0C81DLPaiWpckLgXno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VHEWQAHrDm84ko5UcqSZA0bYil6G9Sw5vO1FDrQiKdqZltuCM1iZ2aI4p9w4qfciVHTTYfAK6PAP1HlbhcbJCmDwsE09B5xSGMmmyQZTEtLyiyjhDc+BmzMyDjbrVUlTpe9ZzEmKxGiumfxMaSCF2ALkA2fsvPXEyEdNSPj1uu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpfetL3i; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-421851bcb25so3255433f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049435; x=1761654235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwpb9YyyFZUXF8WyxeHegw4tIbT3loiYYpCo1rIiT3U=;
        b=kpfetL3i9y5+vSxcTVlo+EklRjv6Ipv0iHcdtuVpEeX2sqe/0m6qjAPS53tGIOZ9dq
         mHENyzFsxP4ixe2nbqK5UtWHNDV6UBl+zSBP+V68jgcVW74Moj0MzBm5gg3AEu5d0a0J
         xzFkvzuZT+m9JOFs/begvRLyXFTmVHbcqf5bWSnkLAhgnTxmVHEhOJzkYEeNC3gN+48m
         jDShgwoADv0/KlwUmoQRJbwnrGcCAEreJ+l8XHKWx6zesIsAy/+pa3eZFS5vNjiBK/xf
         GKJ4jxnucodPzcyrrDzPsy4lBQqIywyFHlKVQj9mcZbxXepyVy0UvSPytN6LrXHvduvs
         WglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049435; x=1761654235;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwpb9YyyFZUXF8WyxeHegw4tIbT3loiYYpCo1rIiT3U=;
        b=uCOMYw79ev0lKMqVmgf+Ytt94iQauNSpaNO7EYp94mcKpSITICE//R28uxsFtalauO
         dNpQuoEz1CjC1JfZG64uz/WFaI2LFNXLvsnXA8rxrgj3CbFAue3/lUWfIKSAjz4f1zk7
         1FG7DA6fS5Xf2PcIFJPcMwjy37MMs2z9m7dqinByEHa/Vo4Yuhancfh8ZPJqurXKLOfq
         qFVNv5PiIUr32wLGpXF6jU9r5C5O2aF7+IlgzJdsI/KULp6zAepPs8yEVJG9r3qvYxAb
         gJVsNZFM6fWwNSc8R0mtrqW5URJizLVMlT0glbQlMquXsK/+u1Qh99kFIdhFxe7ZYVLx
         HN4w==
X-Forwarded-Encrypted: i=1; AJvYcCW/m1in3/5yhSNJnUbauhoEIBb8XJ2GwKimk8q+mETLNeXHq3d/fiUvpDkTig/duZ7kQ7+zjYWDBv8T@vger.kernel.org
X-Gm-Message-State: AOJu0YxsuIrcCKqINBcrLiOzzgiFwlqUBDWWPwTyxzOAb7IhA1JNRw9M
	gRHOTfT2X0q+ZZnyuf7I1p+BIOm9syrfcWRGdCvwblLzcwLm2cMBjQq6T4KGIBQjk+o=
X-Gm-Gg: ASbGncvLv++RpQ4VDyyd0TabuTELfIKQl+xq07Dg2Uw6zikQJgLXvIXZ/8ly+DR0Wuy
	mwzVWYi+CdINTCn+i2YHqv68wI9zoa7TC4JALl/qhbLjvvwX/7aE9yJgPAWYWtR1awpTwC4DnhB
	NsTpdBg/T7/7DPLfdGemhpXxbYSiBO2wQVPKGyn+dgOB3H/sMcdmlElM8ryd05mBYwLDVswvDbF
	8K6wXBkx/IFMMX6DKSQ0Mp/a3C0NPSK/AuKP/nck6A2pnBcBxQzGeb516mRINT02YJzQcTtULAx
	xmB28m+Lk/Oa+HmgKBI7pJhH8XLSnfI2XWV/XRpsQL+CRKo9U0XMypYx59WBxTddsafzNqGWy/D
	HmXdij+UqUI3ZUO/IDUwrJW/ltwP/kzkif+fj7cbGUiy3So/n4R7YFAq/5XovM0sBDicJqC9CHM
	QBW+1JQcPq29HbwolI82LwaY7IW67Ttr8ds9n1D0naZEIJw4KL4LsoofFxDhFyIqQ=
X-Google-Smtp-Source: AGHT+IEX51mJgBcn/f0BCgcwHrkOSIPklu9sgYsPDZKLHpXaY6DgRpO964Q9+hSG2bVdYmcIHMByWw==
X-Received: by 2002:a05:6000:2287:b0:426:ff4f:39d7 with SMTP id ffacd0b85a97d-42704d9447dmr10933793f8f.34.1761049435321;
        Tue, 21 Oct 2025 05:23:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f3bd:d8ee:df79:53d5? ([2a01:e0a:3d9:2080:f3bd:d8ee:df79:53d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5bab52sm19901012f8f.22.2025.10.21.05.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:23:54 -0700 (PDT)
Message-ID: <263b86c9-61da-4d5e-af3d-4b9105112d82@linaro.org>
Date: Tue, 21 Oct 2025 14:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
 <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <6ebddeb4-b33f-4392-b5da-56501b38fd6d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 9/5/25 05:19, Xianwei Zhao wrote:
> Hi Neil,
>     Could you please take some time to review this submission?

Could you rebase on v6.18-rc1 ?

Thanks,
Neil

> 
> On 2025/4/3 16:33, Xianwei Zhao via B4 Relay wrote:
>> [ EXTERNAL EMAIL ]
>>
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add pinctrl device to support Amlogic A5.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> index 32ed1776891b..844302db2133 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include "amlogic-a4-common.dtsi"
>> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>>   / {
>>          cpus {
>> @@ -50,6 +51,95 @@ pwrc: power-controller {
>>   };
>>
>>   &apb {
>> +       periphs_pinctrl: pinctrl@4000 {
>> +               compatible = "amlogic,pinctrl-a5",
>> +                            "amlogic,pinctrl-a4";
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
>> +
>> +               gpioz: gpio@c0 {
>> +                       reg = <0x0 0xc0 0x0 0x40>,
>> +                             <0x0 0x18 0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
>> +               };
>> +
>> +               gpiox: gpio@100 {
>> +                       reg = <0x0 0x100 0x0 0x40>,
>> +                             <0x0 0xc   0x0 0xc>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
>> +               };
>> +
>> +               gpiot: gpio@140 {
>> +                       reg = <0x0 0x140 0x0 0x40>,
>> +                             <0x0 0x2c  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
>> +               };
>> +
>> +               gpiod: gpio@180 {
>> +                       reg = <0x0 0x180 0x0 0x40>,
>> +                             <0x0 0x40  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
>> +               };
>> +
>> +               gpioe: gpio@1c0 {
>> +                       reg = <0x0 0x1c0 0x0 0x40>,
>> +                             <0x0 0x48  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
>> +               };
>> +
>> +               gpioc: gpio@200 {
>> +                       reg = <0x0 0x200 0x0 0x40>,
>> +                             <0x0 0x24  0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
>> +               };
>> +
>> +               gpiob: gpio@240 {
>> +                       reg = <0x0 0x240 0x0 0x40>,
>> +                             <0x0 0x0   0x0 0x8>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
>> +               };
>> +
>> +               gpioh: gpio@280 {
>> +                       reg = <0x0 0x280 0x0 0x40>,
>> +                             <0x0 0x4c  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
>> +               };
>> +
>> +               gpio_test_n: gpio@2c0 {
>> +                       reg = <0x0 0x2c0 0x0 0x40>,
>> +                             <0x0 0x3c  0x0 0x4>;
>> +                       reg-names = "gpio", "mux";
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
>> +               };
>> +       };
>> +
>>          gpio_intc: interrupt-controller@4080 {
>>                  compatible = "amlogic,a5-gpio-intc",
>>                               "amlogic,meson-gpio-intc";
>>
>> -- 
>> 2.37.1
>>
>>


