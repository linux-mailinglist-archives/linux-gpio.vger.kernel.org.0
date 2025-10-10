Return-Path: <linux-gpio+bounces-26975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44CBCCE64
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 14:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E723C3676
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F1E2EF64F;
	Fri, 10 Oct 2025 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRZMrdRV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C42EF662
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099384; cv=none; b=PH/y5x5r6+dyMPIV91nD3UHy27p5OH3Mtk16uwBhvK/c4JesptbfN8bQAVvS73NLE6aZSqwjJxvgPRMhOV4QJz+VAVtb9GX58pvE7fcG/KCp5DSQUSB3X0zLbnuV86AdjOch+6u4K6NiG36GqrEpkd220csW6GaahgWs7tz9taw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099384; c=relaxed/simple;
	bh=m1wtM/Q36F3ke3zT/mN2EGUWRd5HFQIpRI6HpOMa2zE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Qme9sYuVTL7O3tbm885I+QkWCF7/BLO3LnqNzPzMI/E5/Lsoax0uDPjzwogx+graen0DuKxUAoDHq2UtUV2Y7eH4u2QFgOIcIuj8s5EeWNgDYKAvMVs4FsfN15131ZnW94VNhaIyECzsCs+AqCFrmb7hRbsGMjlmAufq86da4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRZMrdRV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e52279279so14246915e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760099379; x=1760704179; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=DRZMrdRV+Z7AOt2j3NT/pgUP4UzEXdxIMgHs7HJiAigBN8Yr//Fyi5ghKZLVI0KMr3
         vhCnf9VSuH+vryIkrv2rC77HULFvgki0QuED2mD4cExxEc4h6sOCOlofOLHEWg46sCRp
         TGl5nPoI67IHz+TmR/v4ARQo5MlUbtD+aWLjOHCWE9BfM5aht7ia+Cg9j819ea6TVC1o
         czF5uB7FK2+9iFgyoVe+MsvdILYnaANCXdbrKZXzaAgXtUAO9QWymKObPF1Mk/xLsMRB
         wI9JFgvUOf5z3i0PDsOlgmoyFA+o00csP/DY6IYojpg99CeZ0QjSoJtdDu3+vZ5UT+GK
         Rwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099379; x=1760704179;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vYMGQwZbrkqXXfmRn4FZdpSz5oqSucZM1pi40huO1ec=;
        b=KoAcf3lc03WEeRI4rQUHCJhWbsKmpHb3B3j38+hhqkm5seWzAtsk+nX2iRy1nSZfDB
         ULO7mM7X9Q9lxIISXy57fUNFk3F18fvMr45J/ceOwmpmsuIEsuZX3FzhNopx8k+d4YuQ
         yWA6tbD4G4wYKSwShk6D/h1rzcNCWjp+U3Tdv665DBpn8c+7RucEXxZ1lYhjnhUm99Gl
         ZhrNjWFnjuuinjQysV1kkLrcrSoaYDBhvqDdlY5w8sXJQzrHPzGIR45p7HJTOmcfprmA
         6Rl2hDwLHH5/KLPi0R64VR0vmSunWe1hV2s/BR0PBQsSgsvlq/SEa/qNmbp2t2lCOXIG
         wbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLlKX+qA9ykP97R3qB5M1DIBAPJYj4O+BSJw4Z74kYArTFOF0EICwhncKLZ61UCMf4xhx1DKleLIuu@vger.kernel.org
X-Gm-Message-State: AOJu0YySbq+LPvnW8kGYdE862A9c/npOxKRXzvS381YEyWmlMFUAPjQR
	eHN1A/7nvaDJBbfKPSsU53gB6ZJNFhLQU/Yz92bBZ0vzOuKWaczI6mpJHYX3hWwXZg8=
X-Gm-Gg: ASbGncvZp6v7u6KjvxbUjMJ5v0N9U2vNlHTQ7wKLltreLeneFTLH9bsYaCxfaz/3+JH
	oPdyR82hH81ULizQa+3TQwzjftujfiNMe1w1EZ/sD9JT70ZeWo7t5XtvATieJDlgPPYteF2ZqGm
	AD4n4qHmnQYD6PjfB8MOFBhuxxeHbHMuQY8h+zVatKlv8PNKMiSgJ+hdE0ZR1jKrT604XuAlK4l
	RE04pBQEwotclNw7bmiSIv2Tk6tDk/HYbdFCo5Ke3r6R0bFHVlOQKo0dmQXxc6M3UFv1p/HBQgj
	uGLhNlB4Umy5LzerOg3yIqDFvDPrLuEUFiAlB+uPvTwKVSZ+bkQ/ShHBNHgdSsFTLSEikCCvThY
	wDpbNp93Oc0jXwg2x7qx0GsvxVNqWKZaCOhSrT5I4LtiP/TOULO0e/WG6sN/+QuAy5weaxhg=
X-Google-Smtp-Source: AGHT+IGoFKx9FL3rwMgBVIjzsX+nvkrUpEkSRitHHR0xBr1fRpbwIRCWVFTLZ13CTdC6I1m0m5CVFw==
X-Received: by 2002:a05:600c:34c2:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46fa9b06d3dmr72900375e9.25.1760099379460;
        Fri, 10 Oct 2025 05:29:39 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3520sm62462795e9.2.2025.10.10.05.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 13:29:38 +0100
Message-Id: <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
X-Mailer: aerc 0.20.1
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
In-Reply-To: <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>

On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>> controller device node required for audio subsystem on Qualcomm
>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>=20
>> While at this, also add description of lpi_i2s2 pins (active state)
>> required for audio playback via HDMI/I2S.
>>=20
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>
> [...]
>
>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>> +				data-pins {
>> +					pins =3D "gpio12";
>> +					function =3D "i2s2_data";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>
> I.. doubt output-high is what you want?

Why? Or is it because of some in-kernel gpiod?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/qcom/sm4250.dtsi#n66

>> +				};
>> +
>> +				sck-pins {
>> +					pins =3D "gpio10";
>> +					function =3D "i2s2_clk";
>> +					bias-disable;
>> +					drive-strength =3D <8>;
>> +					output-high;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio11";
>
> Please re-sort pin entries by the gpio index
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-nodes

Ok.

Thanks,
Alexey.


