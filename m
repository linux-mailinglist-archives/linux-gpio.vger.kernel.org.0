Return-Path: <linux-gpio+bounces-34463-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMWFNB+Iy2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34463-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:38:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF19366466
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 262DD301DBBE
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 08:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473E73E3D93;
	Tue, 31 Mar 2026 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozc6h+QE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvNa4TQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017233BE649
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946332; cv=none; b=ftvJq5uqfPGbcD6zgDNBm9hi8/HVyEcfRSSUrv7hu/FhLcaWAV83kLbU8wPUMH+3K3xWakTz5CmDhPUjLbmnpDPDym6rbyQEgxezg+wc5Gbx7cvgxB813mAiA/nf4anCM+Zpm6xPv1FQZc3G0b/nvqwp2Xy0QS50D6wNRufg4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946332; c=relaxed/simple;
	bh=FVx93lCevswcq5l+R2VU0JgE3r8sIXsyEhbVA5OTcdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nKoJlZq53uDechuZqBd+uGryJrxk9rj7GDRW2BD6NNNwRsxmb/y5p1PI+zNfuVf2gifcqDyZewDPGdWsr5iuSaPo98lNy4PAbuymvIOaLj08JFT/rBNKOhkChUa1adu8F140uhUEloytNwqDPwORGu2q0FThIhOlOldLEmirJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozc6h+QE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvNa4TQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6hr7U2391977
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=; b=ozc6h+QEkhv0Ihjr
	KymCYxrNd3mu81usiTPqN5xHUKuSZP7zd5JXvkC1XNtb0K0GuGzK8Ir1WDoqciHj
	vgcL1JIjSNPkLrfdQpJN69b7V3CbLdUAdeMOWKcXFRvaxIEOqUnLSYOhZoJlIqA3
	A0t/65M0QJ20Ig0ezOuTv4HjzNZzRBCvPNRzEh4o7E/tDlMkspKbKe1Xywqw5Tpn
	krKf8t8XApl6gqEQhTm1nkaGIQej3JOvqAGEQL5mUrCaBxguiw6fOWnfpzkWuoXb
	WKrtQ4DAtn++i9umFwbKKxuUHcdXWgWIGIPPr3uLHflPFLxC7KSd6MQ+SbJuMpoC
	/CkwhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kmfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8dc8b434so161436185a.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774946329; x=1775551129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=;
        b=bvNa4TQhcYYbjquCb+Yu6bT7+87+8xHLTTPR3ECElVtMdnhklMtAGS881b3aHi2Lvk
         kkrl4rtkF29jLkv8IxGbmsFgIUX2oHb2FzhiSaMokGf0OZ1Q6TDZ3TRavMOXGDLMjVJN
         yNy1w4iLwILLpTqHuGsYRP1IyWKDzxjNmJnTtnCpqejhe61ILppTAdGQacq7TyZRAER0
         DoKo5AA3y7DXdvmCennTBlCdK6SZwwP3oJJd0gGnODgMiNTjaxjdo7Qjl+ytOriQkHAy
         qdhSYDlQb82E7hWZD/Hkfx6nyypD5DDZIa03f3W/DGvfcRyweJAyREeIPIHugi4MRS+v
         DCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946329; x=1775551129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=;
        b=IajwPUMa98TEFmHe03RVm1PDcbVKeIS2v7xBCOdkWFmEizex4uESM937WD+X1yU79W
         UMuzXoAP7rr47xWSdxGkMFwZNDp8ktGbLgwfeFdnwGU5fUU6JaXd681fZzOWyj41WK16
         wBYEpuF6B0RH54xrsYWwUTLSIAI4pLCYJkxkzj5ml1OU2dAqqPEyVYhsqS8twxvu7m14
         0pQw9P/mMTH96HM4Y5fsq3vqdESVqxDkO+C7HlIVr9ALPwahmVaAImSblSsozwp0xjWz
         auZ2gy3nRkuGNGTVwkdrsqOq/BpbhjXZr2Fnujwd+4EmpeYo+wlEI36raX7Zs6jcli15
         34fA==
X-Forwarded-Encrypted: i=1; AJvYcCXjK2lLjf7G4gU8vvk9IuyxgjRXhWCVL2QxvV8gujLF2Fz0uw0twOPHm1C1UlVGUu1zaO1xH1917lRX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2U3wa8F6whzGu44dF7og5L1MaCW/W4Lyx/HxygaB/G8uikjgH
	JKPYHI8ft406bW5xesMSVMvcJRzFhGuho1pSRW/yXmqsVicxBmuu8DiAgX6zSBdhIP8bsMBovyV
	pgyCt3WgQ8ZykbmPUWwueRnMNPwHCPUzI6dk21KUgHDDmyjP5vGvCMGssxDYzNAX9
X-Gm-Gg: ATEYQzwiRXNC7GK6Ap3NZsuYH8MLe0IWpF+i3AQ1FPqIB2i4+XjE/qEW+9d2aNBknYM
	uPnsUGmLL+kPFmxTyyaYXF7+IfA9Up6SmeAgXVYlb40o4WLgUaWqKZn5u+EY1AD7EGCzeZK2Udw
	qN5f4Xfie65GZug1AI+OpOf3o/21+LdO38j4OifTq6mvovXWMoneHLYcIKpZwC3CAxVPtNAaOdd
	Eet+XbPx+CTg2I3GTUcyWNaM85r/nKSd4d6fq+T3w/d8u9SJrNU5MKEemWg3Pcm3AgmxwgKBVml
	eYnriinZ0/2Q9zi6wTNGt6Ozl/8BVbHwrMSAR1PKqZdpQ989NnQ1MoZ5GB2hXEgCTkXIxz1X3ju
	ZzwKDAyP3RuFIjL3EAwozfqgeG5uc8vg6HCaoHlYDnHQHFbQGO+NqE8MG0xmoGSpsmZFGWDaRjQ
	nKyLs=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr160828391cf.5.1774946329297;
        Tue, 31 Mar 2026 01:38:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr160828171cf.5.1774946328912;
        Tue, 31 Mar 2026 01:38:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24145sm367561366b.2.2026.03.31.01.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:38:48 -0700 (PDT)
Message-ID: <0747adc1-0d6f-475d-8217-9d1f1a2c413c@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330164707.87441-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4MSBTYWx0ZWRfXxPgnHS0FddSm
 pCCSJHSzoBun/g6UAQlQllIUYkjAtk1kb3Z/9bLSmCpbBT35VAk2T11mtL/+MeRpQ5pQVcLydiY
 xJ0UWUochPi5snrLql3JcKWJXRz6T2ZQaWymaIVvRwuTyytd/X1exA3diikVGohfczgpvI7yEDh
 v8ISBz2O5mgB1etu4LkjD/bMhJTJy39cH2i3jjlhNMA2x6Iz9vhODV1o5Zveyg8g2/boKfkFbfs
 d6fnvnxQ8KY/q07EPP1tvldhRoYd490KAS679t4ZL+jLOTN1Wan0QxghOS/xd2hRamWujsy23Br
 kW9Bf1r5Da9Yd8K58OmGGpSa4fGm2cuxl52WvLB/1EPMt/O1hXj48peNlZn8l0Bp+qmFx6bJi2L
 XUxmcALOg2SGEZ5edAYOJmpYcnYqykPYx6YCv20GlJKmyKsr4ij6ko4zkK0HnR5FbIEEADUIeFj
 hLgDghs+NMwb8F4VMPA==
X-Proofpoint-GUID: oio-k3F1qe8Ba-VNDx1JYaOzqnT5zohY
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb881a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fuxX-muTBhbXr6ZgZ98A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: oio-k3F1qe8Ba-VNDx1JYaOzqnT5zohY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34463-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEF19366466
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 6:47 PM, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Technically this'd be best squashed with patch 4, as without this one
applied your phone stops booting, but it's up to you

Konrad

