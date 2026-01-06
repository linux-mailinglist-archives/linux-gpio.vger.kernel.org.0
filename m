Return-Path: <linux-gpio+bounces-30199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515FCF8572
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 13:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F62730216AC
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 12:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1323327BEC;
	Tue,  6 Jan 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHfY6ROv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGh6O+Pk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5423EAB3
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767703011; cv=none; b=pdYVHvuvkqZ+ak8POMNtEFjmMesl4nyE0SR2RMsNHmiHsMt7L2a6Ozaxp0HOS6aR/lR8z+QTsICQVQqqx+Nahy6+KxxnCWsxM5UqhdYgrNbJOFMjSZ22EERULI67sa+MCg/RXkXvUq+8BvgzpPD53VU4HOz5WmhOUvCODgjp47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767703011; c=relaxed/simple;
	bh=nbxSbu3nNELHHaWQFLTKfq0RQnQb8K45axVnhsVUdMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Opsy4S1/fpsHgGNM9H3vDv8M8irnBJ1ZP/rjDsxYV/HLHpKSlNO8Rp7A/ewTbRJEuU83mb7/krQl4WfOKolbcxP+nMxC2Y8Sc62EQYhUTxJIedpQPdGgumXix5yMOgKCB2J3Po0tK3buSjflKH712FW1m6fFg4OLSNfN8vTFaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHfY6ROv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGh6O+Pk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6069W7BM4090701
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 12:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=; b=LHfY6ROv72NXf4Ix
	BM1LBq/DXviimD3ArWildiNn/cqwURog0HoDfMzQRh70ugKImKOKJ7n77m6mxN9k
	LBh/VVg+K2o4CMx/LOF//MsyIgQvAWg0yzt0v9eu4u7/PMe6u0yl3pV4bCsSdW8w
	ZpvBiMSeVEePssN64WYKBmbKfM/yO9iQ+8HAck57Z3JWjY+FcFOaV1FAGIJrRjAB
	VChlXrIrwZwZpFfIarxV9GZC/mGcUTbxWLy9jE5TTM8n7Olxwfnjhz7ROFOCyaFz
	wQnjDvxH9OLP9DYBkcQaEXfg6lMYH+NnvitjQOEkkn4Uigq0xysh/Thz1db1Mslr
	7QhZrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun8ets-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 12:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so21872541cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767703008; x=1768307808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=dGh6O+PkgJq++X6x81u/nrmRrMnkrALVSinxdply6O/qesCS7I/wueMxMOVSRW0MgZ
         vDcPCtVHAVs196WxG0dqDpYQ4AgRnEK7JLdmSKw0/KV1Jw48MXlt1dg0UiBwDU3mj8KW
         IVgk596y8LibwyXhPmAmMDU+vp2v05l8ler1lwOTGgsTx0WdZCnpreqTfX5uA+rIi2L7
         EDSwnaVFlDaPiLH98e2Z60onxSOy53RS9OQVD6F8KpAJoryylwQwy2kA6IEJBG5vkEEQ
         oyNVohNhcg6rE/GKMkMHsKlB6UMpSRXorqwwBBTV2Ew1Ljz3fQHWbqlTBKYfmnRZSnwN
         DLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703008; x=1768307808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=lfv1Zfevwc9+Dnie140ZrQx2yiYs0BszCQC5+rsg3t/Ru08zWo1dLOtHi5Zg/AoKa/
         dbJtKnlgQJ1qejNR9aSCClNwp1asuOO3Sta+dZUA9eVEUf1mUPR9peR421LiICbDDWQr
         DuQWEM1tQWQ6XDIIEtdV59A8ylGvMGIXvbBay0nT65ldJF1yZDNYRQuap1CyMQN9yn+K
         ADwzeM/cfRjCmTFE5stckFem4Rrbb/eTRoe4NmxtXL8zsFZseN+lU5g1P/lLOEdDR4uO
         IG9jgHxmPpeS+q/t4GfXZTmcuwC2VrmamFh617Fg9R3g6JC85YMGIoegPYuXwwhBG8Te
         YN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0rOhOLuVwtnhGivJG+EOhQSHOZPcZzIo9iOXUejryv0dobdSXSo6tE6ZM4nxXURshmwEpo2v+2MPL@vger.kernel.org
X-Gm-Message-State: AOJu0YwmrOmEJ8G3tbrBp7oEPSBZBj1poeqXztffvfpBmv7Er6ikxBtG
	RsoJKpv6K9b5x4cUcpeDrS+oAVGnG0Eqcnb5DYyAlaIaWun0dpqEhYSlJET61YHQxrH9KzaJZGb
	TMg2VCPgR6wI6tEqZsfUzEel5ARz2HcaEs7b7XyaxNwEt8mlCKLRCxqotfzk2uYxp
X-Gm-Gg: AY/fxX6hoHdik6uFv5uwmnlfJeyKp0d+800EM6UoRteDc4JNU5pwSVHuV9dA3AhBg2N
	7hL9wx6But/TEBwNiluJ2a9GY5HLd037v1+zQOb35zmrW1g3CvDaCP7WKlxZvoQqkLZQlL4uVgX
	QXhDRtm42j5w884sfHbBdE54TBUBGwt5TfkPN599sPJswpiDYbpeYH2q61MATq+XB8y8Qxy0yU3
	nMWPrKLTINoz95F8W0n0O3ZXunbwi7YmyGYH3ZcmXlHsTXb9RMbF8kMOk6eSY/A1bdUcy/laDgD
	MuB8ly/x8PaGcb5ZgAKamQDB6PepqbKMEvH2mfpE6/9QcsB1pcKuto38ol2y8ZpvMXRZactf/cH
	krADDLAnLL6c1U4XL/BlNi0Llqh4V9aEjaebcNsk=
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669241cf.1.1767703008380;
        Tue, 06 Jan 2026 04:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3OlX/lVZ9eRQ3aOxiW51OeVVVBJf12PTSv0Qtj2HDqO8JCJLlFXFtDil0tgcdGIzjsiK6SA==
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669031cf.1.1767703007978;
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f686sm40728415e9.3.2026.01.06.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Tue,  6 Jan 2026 13:36:45 +0100
Message-ID: <176770300365.41755.2635230320486109502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEwOSBTYWx0ZWRfX3Qzpli3tniUZ
 pzo3JAggTZ62LcD79yT4nXKWNn8jpOLDnE4tQHYXYC4Kd+wqdUBS7iFx4A9CWhA3HS8Z5VvV1l3
 3DLFPNFeAiWW0V/TQ5NLDcToEangGePU8yhGDOFF26zHZJM4D1IeDh9f5QvPaYhc8wig3kqR0Ju
 JjYCxvKsrMmseotj3kbEdJlDwgu1eZuHaruxIbuIK/4qP4JAVBEmggCg8lJNXLjFd2dPCKGf3zx
 Plb67PeIn/TQWMnIKEfhzlZa1ZFXruAN5kpEOWOLBq3VaYPKmPjxdx4xAmSIhUKEfNZ3q+0E/nM
 Fs8diDdYYfKoMa7KrQ27GlGditsNN9vl9uvY3nbynXayZD4gxMsOiw9DREbCSza9FdLt+W2wcoU
 6ZPS4AWlR+fruYqh+Y2ZiSsuU102bQXjjdN1q6L74abNI35hkFSIFXFzM5i+HTPnWqpz4XTNNwb
 GUv9CBxxguHsxdeVFNA==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d01e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aIeBnXaUYv87OnBSPw0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sKcKINF9W3OSWGlvNAUuREKRY152Hg0R
X-Proofpoint-ORIG-GUID: sKcKINF9W3OSWGlvNAUuREKRY152Hg0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060109


On Tue, 06 Jan 2026 11:09:31 +0800, Yixun Lan wrote:
> Introduce gpio support for SpacemiT K3 SoC, the gpio controller
> changes its register layout and bank offset, while mostly shares
> other IP logic, so adjust the driver to support this.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      commit: 48033e4c677be4e3f131df454d44a5d1fb1b334f
[2/2] gpio: spacemit: Add GPIO support for K3 SoC
      commit: da64eb51595bc6073b2fb69c2a3859bba93ed75a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

