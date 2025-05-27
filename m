Return-Path: <linux-gpio+bounces-20600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6918AC5312
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 18:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85DD3B1ACA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 16:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C4827FB2A;
	Tue, 27 May 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sslJajJC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538127B516
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363543; cv=none; b=g6JIWoGQV0zGRZPMcdbvG4FUqfFmvOyVUw7HGTj3Nx1reRbUKoenmQhluWjlUvXSAyWRtdhY7r/F2bSgghjgX1GNP3obHmToR75hqeh76H//Zs3kTLm1wOzADp+MOKmeGH0miQ/J6ejhhJXTyHdIARmUG1liAThkK0hmhfwdTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363543; c=relaxed/simple;
	bh=2sIt4equTxMf7zNksQU/+IeDziUhiC69Jled1PWpUQE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=AGz1piKnE7Z70D1up5Qa7F8gd4AX4i4dNgxY9Ee6WgF/SCl2uI+Ye1loEVZYttBQRMiKUJIeKgwT7/BKYPEq7owxIxLrjTPHVvfEEBuf0/UK4ZL6hxsMOFpjK/ldZ1nrDBTDT4l7D20IMezd1EqgUuODY5xW5DvO0A4IQcTclO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sslJajJC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441ab63a415so42822365e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748363540; x=1748968340; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4ceyXfpbHOb26b8XCYLDg0Adii9j8clPXP8isRHjuk=;
        b=sslJajJCJsXGH1OU5imgef6CxF90BaOM9UBxOexziU1MFTfXryj133Ryw0898TK/oq
         K6wy9zhUouFdvmTDuvYVs3NJx/QJS7ZfQI0IdEaaDZeScpKGI1bM84j5ooCO2Vgpy4jr
         gqJQxDmUG/Ew2SszVOzFv+Y5pChEJxCbqj3YazYSgwpuJLjJlcjiaw++ZChkCRgFKXUR
         HPpa4mxRLNRqm7jZNSaAZnXfAhDMmbPy5wkLniRNPyoYRDx7XBq+tX3e1HpOpn2vfUCh
         RqjrTWNAJN6m70K8L5dKlHE3WbPgJknZJXL5/5RjI3Tmq4jXm+b4e5vqVVogvGQeGVcW
         ppvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748363540; x=1748968340;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4ceyXfpbHOb26b8XCYLDg0Adii9j8clPXP8isRHjuk=;
        b=pZCFatFfVZNSFpDGMKXgpjXTJ1r5yy4XytGBQoSQE7F+qaQxerzRz4ZQ6orNdNQTLL
         wAdA1uv67kpfi+/0PDqQM4bF4Jr9YxSEUTkwq5HfiHzRlblNLK8WZNOs4wcBJzqqTN4T
         CiQbE02VtAYbPJnmZpAdsFodq/eCMBsNzVe6/1e/XgITjpkqFByfZY9mOtDkwWj4F2Oc
         jgmzsqNo1ynxdlXr7GQkxzJv8DsOCvx4kLJMvRxR8RPmoBm5SI/wsV8JIx8o3hFpCY6W
         arpGJz5a1DpRNXwvpljjPNnQuivxblCOE/0LuFwyo3k1kE4aD4eHe+gdF9SQvx0SbkIX
         +doA==
X-Forwarded-Encrypted: i=1; AJvYcCXaHeXGnh4EBlF4mpkGvvW/sh72cu4+X23yFzPCosAXKRGqMf71M1PN95BxaAjXO8HiB0hQd4NNee74@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaHuW3tdc95QN4x77qHM+CI89vxA7yy37LIpErI7qlvH6AMsf
	5sQP1YChTDkPuMKUtdYA+sROhxFpI3vBdqJC1IbltsNMSYxOpDpS1o2G2g3UPpxUG5M=
X-Gm-Gg: ASbGncvENLPK2Sw28Yi8vSCCFz9bj7Ui5HYCRymVPotGRDMlv3Ha9HfGEGJKc9Gg8zH
	1F2qK83is47WX3dDSQY1FB4F7bkuF77aOQLhYKHo9GYEpdKGLeA5ggQ5s3dGc8mQ+m8DHRfkhZc
	ExJswklvrMrmLGj/aW14GnM3O2zbKClozKUNhx2DphwwGdgVJ13HZ9Kes6wSSJPBs8RSoqV0p/c
	ZCL9Jd/xXeMHB3KgpQ87Sl1LNXFnfiZD6XcdOmY9czPD+xgLLY88bB+1hzvhNIANdcZ13iSQQIC
	aHKxGTi9sBsStfdfI7u3wxb0R3PXt7dmnDU/qF1FOKtdIR0O/1FMWHWbbQ==
X-Google-Smtp-Source: AGHT+IEmErbjqw+229GOiiiNp1gk2yeXCVD0vFAogvu/2yFKvfiLTxs0BLJ5USyClF4cC7YxbXHYeQ==
X-Received: by 2002:a05:600c:6286:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-44c932f9428mr116536725e9.23.1748363540016;
        Tue, 27 May 2025 09:32:20 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94d1sm270586605e9.34.2025.05.27.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 17:32:18 +0100
Message-Id: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
In-Reply-To: <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>

On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
> On 22/05/2025 19:40, Alexey Klimov wrote:
>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>> are required to support audio playback and audio capture on sm6115 and
>> its derivatives.
>>=20
>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Just keep one CC.

Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
email here?

>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Missing SoB.

IIRC I took Konrad's changes but at this point I don't remember how much wa=
s changed.
So I need to switch to Konrad's owned completely or somehow indicate using =
tags
that it is initial Konrad's work.

Konrad, what's your preference here?

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 132 ++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 132 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/=
qcom/sm6115.dtsi
>> index c8865779173eca65f9e94535b5339f590d4b1410..045887ae215b0965ffc098fd=
31fd18ac1ad90b7b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> @@ -2689,6 +2689,138 @@ funnel_apss1_in: endpoint {
>>  			};
>>  		};
>
>
>
> ...
>
>> +		swr0: soundwire@a740000 {
>> +			compatible =3D "qcom,soundwire-v1.6.0";
>> +			reg =3D <0x0 0x0a740000 0x0 0x2000>;
>> +			interrupts =3D <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&txmacro>;
>> +			clock-names =3D "iface";
>> +
>> +			resets =3D <&lpasscc 0>;
>> +			reset-names =3D "swr_audio_cgcr";
>> +
>> +			label =3D "VA_TX";
>> +			qcom,din-ports =3D <3>;
>> +			qcom,dout-ports =3D <0>;
>> +
>> +			qcom,ports-sinterval-low =3D	/bits/ 8 <0x03 0x03 0x03>;
>> +			qcom,ports-offset1 =3D		/bits/ 8 <0x01 0x02 0x01>;
>> +			qcom,ports-offset2 =3D		/bits/ 8 <0x00 0x00 0x00>;
>> +			qcom,ports-hstart =3D		/bits/ 8 <0xff 0xff 0xff>;
>> +			qcom,ports-hstop =3D		/bits/ 8 <0xff 0xff 0xff>;
>> +			qcom,ports-word-length =3D	/bits/ 8 <0xff 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =3D	/bits/ 8 <0xff 0xff 0xff>;
>> +			qcom,ports-block-group-count =3D	/bits/ 8 <0xff 0xff 0xff>;
>> +			qcom,ports-lane-control =3D	/bits/ 8 <0x00 0x00 0x00>;
>> +
>> +			#sound-dai-cells =3D <1>;
>> +			#address-cells =3D <2>;
>> +			#size-cells =3D <0>;
>
> Why this not is not disabled? That's a bus. Each bus node makes no sense
> on its own without the actual devices, thus it is always disabled in the
> SoC file. Just take a look at other DTSI.

Because I didn't know that. Ok, I'll add disable status to these.

>> +		};
>> +
>> +		lpasscc: clock-controller@a7ec000 {
>> +			compatible =3D "qcom,sm6115-lpasscc";
>> +			reg =3D <0x0 0x0a7ec000 0x0 0x1000>;
>> +			#reset-cells =3D <1>;
>> +		};
>> +
>>  		remoteproc_adsp: remoteproc@a400000 {
>
> Looks like not ordered by unit address.

Ok, I need to sort it then and check other parts to see if they are sorted =
or not.


