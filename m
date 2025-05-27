Return-Path: <linux-gpio+bounces-20601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5CEAC532E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 18:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49361888F45
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F032C27FD45;
	Tue, 27 May 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxlXVsy4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C487427FB0C
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364127; cv=none; b=mtbdhBwhcexPkhlm+H3SjtgGdRR5A37vZTdJf2fGG50LS1IB5o9MbB7BiJqZunsNZ/gGZbLqQW4NbWBDilslxbxo+HDdKAiMvfXuy5FRoTolf9F27lspxlZ+nPGhmYFcQmZ7tz7A+/7QEyakUdfCZfQFiMv3P2Y2jIJpJ7x4Qus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364127; c=relaxed/simple;
	bh=o6IP1ZSE7iTj86N6LUhJhtCOx5zFOGbL5Y2ity8VNvs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TcqiqCx1e1MH9jGKJnybdKlVz5OyPS7AMaWN8OLE9E2kU232X9Vuxk3kxPAffFF6vvvQJDXpnfbG5veO05WJurIuwUolHc4RxiTEKRshladCrWZR3PY+pjENfQjBVb1HfPN4qgBB5Q2GxSHRZoOVbQ09MM6snKJlFV6VmMijuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxlXVsy4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23348155e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748364124; x=1748968924; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC+Kv6MDihqVMIw1+edFXcpQJgi1ehuY/J0XFAu4/hg=;
        b=OxlXVsy44edlq64sSEGc7JA5szCVGkXupCPcjVt31kSjcrlxI6SwejpaKj0FX3DvWY
         p6roNhIdp6a4y3nqerCKTex/4g8ZiV/btLkd9FcgPxjVtIzKzD0n9l5uVRDVHBpxc5t/
         vBqC4MRniSHRyQpN7Rezxj/wbA0x1/NKv2Atzr7ZpgqvpFsHUD01vsTL8W44I4VTtkLQ
         VITZ2jGWAFnQfStzEA4OACBCnAE4CZQz6CPsmQDD7gnsV6dapMOPSe/Gne1NeaT4TP5u
         /psdeAD/MZZIgWMZtaqsVtrTxOBKXolyGcb4582iitadLeyz6omHAgVtxYiwVwXUhvFL
         Wcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364124; x=1748968924;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gC+Kv6MDihqVMIw1+edFXcpQJgi1ehuY/J0XFAu4/hg=;
        b=OcsNcEMbbha3Xn+2KabSrL+UXzjxqVgdW6iL6QnC2/zwuVd5rCqdZJJr4bZrypK2Ae
         bSWfGNXqgnIW3+2HGqdgag13ev5VxwPBSw8zxKYLbwB8YYjnmf5ZbQXBvz7U4k52laWA
         hmL+CN5PCcBA2zZlCHY/mmXXmvhrwtVwr+NR5VB/dT0nKvPJoouKPWswyC5q6iO+LFP5
         tn4mhLAvR4qREHjzR+vN0Fo8QPgGsQn89Eyfi9V+hyKgn5R9lYitAeJgI3i0SvB34gVZ
         IB8rt4uGR3KGLFgf+eTHGYS03IgKtbC8XLupixebBMa6JOJ2DeMZBkCHpARjdd5pzewO
         gYlg==
X-Forwarded-Encrypted: i=1; AJvYcCVH9SDMvu6ILTIhW7LJ5nD0qjMLA8n7zC/8c9nGpdkhAM0e85CmewJVM5prSM8haT7zXGjT7GJlXezX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DLVaUnADNORFYbN9aBk2htjEusq0VBGd4E3Jh+INOC5zlOrC
	Xo9hWzMUh/05OwTdklF0008gCXHE72IgrmYSAp+J8LS06rQ3czSk5SmvRLqakKuK9iCdZRH+wTG
	i01W1
X-Gm-Gg: ASbGnctZ7nd/E7dwPbF7usJ9cI6tvBzDvfgR3sD9IK/NWXlhbCpGjzxsuI1vgQuTUuY
	LPlHeKtXDgMd2D6ecd0JkaQBjgxSFG7qfPk27vZLWfLeeck+jJ+Yj1mnt4ZcjjuIHxPJxUYvxlS
	UqqXGDIYrCau9MBmlGhbJT1YtVtSdAa3xzSIIrO8Z9UgDjbUlevEWy4FHrzaofLzDBVvcwEDsYm
	khg9tfuFdYEQNqzQ6BaD52XSp8bh8X3TQKNbMIiF812k6ICb5RwcC+yXu9P02jD6f4WzvPmdm5f
	AIpJqhnjeoeKYDSXQiRQSkjS9fJ4fQKvSJTyrgEeWj55zdZ2T7RaNjynww==
X-Google-Smtp-Source: AGHT+IHOCmeAAiPle45FazpuCrAts2+QCHvGJ68DgsGkOFH6AJFdSzOvGZC9JM9TNpY3pT25HAXqLA==
X-Received: by 2002:a05:6000:2282:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a4cb44f91dmr11350352f8f.19.1748364124005;
        Tue, 27 May 2025 09:42:04 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e1fe9430sm2346073f8f.75.2025.05.27.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 17:42:02 +0100
Message-Id: <DA73CTVYS10G.1O0RVVAHTCEGX@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
 <45124768-c10f-42ff-a899-6dd6e988b21c@linaro.org>
In-Reply-To: <45124768-c10f-42ff-a899-6dd6e988b21c@linaro.org>

On Thu May 22, 2025 at 6:49 PM BST, Krzysztof Kozlowski wrote:
> On 22/05/2025 19:40, Alexey Klimov wrote:
>> Add rxmacro compatible for sm6115.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/lpass-rx-macro.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-=
rx-macro.c
>> index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1df=
ef46cdf0ecf3b8c8 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match=
[] =3D {
>>  	{
>>  		.compatible =3D "qcom,sc7280-lpass-rx-macro",
>>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> -
>> +	}, {
>> +		.compatible =3D "qcom,sm6115-lpass-rx-macro",
>> +		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>  	}, {
>>  		.compatible =3D "qcom,sm8250-lpass-rx-macro",
>>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>
> So devices are compatible, thus why do we need this change?

Ok, I'll link it to sm8250-lpass-rx-macro I guess.
Thanks.

Best regards,
Alexey

