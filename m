Return-Path: <linux-gpio+bounces-20597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B506AAC5268
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 17:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FDE9E04AA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64BB27CCC7;
	Tue, 27 May 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9+bMXgB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92427BF6E
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361366; cv=none; b=MSJCtTLeSnaME08IXn7Ty1ZKFW2d/hY6pcPiCJ2Wa2fkmJzyMnts8zk57vofReU6yp76gd5eFxC/jCgvvZ3EjzJPwsiMhlznt63ZfQtfhv+IORwx6+3iZSp6i+JRRC3ufiK2+ROZzCYLLPWSjPSTFa7+ruBPxPd+zLfdYNJKbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361366; c=relaxed/simple;
	bh=1EN/qo7phDn1lEOJKo1bEU9nZpbFRZxjY4LQ8qzGqFI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oBXuAO8IS7rAES2Dz2vpsOaSRK2BdRaMd6AOlbK9Azqla7nAcbKP5yJej9oWzfS4JCeB3rKUiYQ6SNJBA1GueFRgbPl/J9uAnrWuWdbPyKB9IFvxhFBYQXWlR8ECU+OwenrT0gNIon+d08Uf7yF3huPGME08BveFd95GD9rurnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9+bMXgB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so29668225e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748361361; x=1748966161; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUOHpXno4FKjbaz+Vq7mO6g3BDL4JOg348p7rmPIkO0=;
        b=D9+bMXgBs7Whru0LXz2r8gO7XmJknG9G4OyDwi7ccJ1O7tl45N6R2SM7BXlixt0hbN
         p+wdfVF4mcWYrxKOqKhvj5QneCwW0HGgbkSstk3ZSOqrISIK3XRYzvLmmnzRQcbjjRHH
         roaC8DMpMmT2XxdheJluYHIFNAblObzopbfDiKrdzVWHIiWy5kg4klQ/FvzPd7IprvWV
         s2anymuNGOFM8TWZP+3Tj9DyWDwW26vmtZaLmJotryTT3NJunu2hHKQ+jEqerXwKSf8o
         Tkr6cB1LTmEUnzw3ZhBFOi+plBdu6UPT4yuFFT53IWUA0E191w2W7eIfDOyxRRBEzWMR
         B2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361361; x=1748966161;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUOHpXno4FKjbaz+Vq7mO6g3BDL4JOg348p7rmPIkO0=;
        b=N3ZApe4rCpHMdTxvcU1aD51gEROAMTjA0ixGXP9Po7xN/2/IIwjiUjfsfWf+9dzQU9
         bjj1TnMhIHWsWkOnvNIYDhZ4QTafb3PJ25/qmWzuYzP0jsHVWzhkCnhSnWi79C+TKlYA
         m2hsCG/742h73gy45lKwj618Ubwi9uyKM1APlddPe1MSffzMKvR402cqIPTWG7EZh8tE
         s+5B/bW3xGzL0BV80YLl6pkeCVgBxvt3oYE6YObB+KxpxoulKzpRd8vDnmNV3fzKbWdW
         shxxniq1WtpF4jKwEoGysxsMPQv0Yk4/a5KE/2XMoKpDrmweDqdO12mbfsEl11qYOjIU
         HJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXekYnFykvgT4+XtTWHxKgMtgNHQu6h5ny8Kim/seCq4pOxVq/aV1cifn4PKuLgxKzhtwjrRooDvsj9@vger.kernel.org
X-Gm-Message-State: AOJu0YzolQlR8AyAqpI4xWsG8VHaVwrngm9DUevDA/E7JAVq1zhPXbKu
	7M+JMjpsJlbk9lfScC5DUQHRiWwBmuDYh2znXRLwEQ6E3LfL53ESP9Jva84zEwUXiqM=
X-Gm-Gg: ASbGncs7ZshhNbt9rp4KzNeqJZwE0WpSmGTPkclIjrlF4J0cRACM4FWctxg/lmXDl3R
	p/hlgCW0EirQVKpGFYFopkBlBl4p/kaFYYj5q7yk4ZBHp6y52021Ojamd+/65enc0OP9ER7Wm48
	CJ590s9PCVuIhkeaUfCjKFOHlp8quj6YsdjkjFzPxAudTG3tsV1C5dEOjzJ7E4J9m06z0Toud8i
	XWwer064HTqLSDkga4xPcNXIYXFucIH901kAz8/zOAymEZyZ7y8uQSSyGojrIfHTNVogTQta7hD
	I0XpN5Z3o0HfoanhH7/arqsTa1mYESy/yckzyjZCA+K+swzcWz8Dqg/mDvco2KucK1ik
X-Google-Smtp-Source: AGHT+IGWpBubqNiiMJO9C0pBAekzBnLwiPK9uY689/6fUTlai3/xs++Qb/ljE1+USh/yGxcE4+gWhA==
X-Received: by 2002:a05:600c:6296:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-44c91ad6b46mr120335515e9.8.1748361360729;
        Tue, 27 May 2025 08:56:00 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ab8sm270595235e9.13.2025.05.27.08.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 16:55:59 +0100
Message-Id: <DA72DKCKVX7T.269HYJZNIABOB@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
 <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
In-Reply-To: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>

On Thu May 22, 2025 at 7:13 PM BST, Konrad Dybcio wrote:
> On 5/22/25 7:41 PM, Alexey Klimov wrote:
>> One WSA881X amplifier is connected on QRB4210 RB2 board
>> hence only mono speaker is supported. This amplifier is set
>> to work in analog mode only. Also add required powerdown
>> pin/gpio.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 +++++++++++++++++++++++++=
+
>>  1 file changed, 26 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/=
dts/qcom/qrb4210-rb2.dts
>> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108=
be96aad99acba21d 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> @@ -270,6 +270,24 @@ zap-shader {
>>  	};
>>  };
>> =20
>> +&i2c1 {
>> +	clock-frequency =3D <400000>;
>> +	status =3D "okay";
>> +
>> +	wsa881x: amplifier@f {
>> +		compatible =3D "qcom,wsa8815";
>> +		reg =3D <0x0f>;
>> +		pinctrl-0 =3D <&wsa_en_active>;
>> +		pinctrl-names =3D "default";
>> +		clocks =3D <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>;
>> +		powerdown-gpios =3D <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
>> +		mclk-gpios =3D <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
>> +		sound-name-prefix =3D "SpkrMono";
>> +		#sound-dai-cells =3D <0>;
>> +		#thermal-sensor-cells =3D <0>;
>> +	};
>> +};
>> +
>>  &i2c2_gpio {
>>  	clock-frequency =3D <400000>;
>>  	status =3D "okay";
>> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>>  		drive-strength =3D <16>;
>>  		output-high;
>>  	};
>> +
>> +	wsa_en_active: wsa-en-active-state {
>> +		pins =3D "gpio106";
>
> Are there two separate enable pins? Or is the powerdown-gpio something
> else?

No, should be only one. I think 106 on tlmm is wired into 16 on lpass tlmm.
We need to assign gpio function to such pins, aren't we?

Best regards,
Alexey


