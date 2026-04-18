Return-Path: <linux-gpio+bounces-35226-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHytGRzo42nPMQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35226-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 22:22:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C72422342
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 22:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CCE8302F7F0
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 20:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E6B2D2381;
	Sat, 18 Apr 2026 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZVvi3Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASlOBai2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B32C0F81
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543767; cv=none; b=XcOFTmTV0LrKG6o84yf2QBPD/xPCBOY8DXDljKeyiw7Kbex0kNMTxzVtDzV2W8EvzCB8lJgp9unkPDWYYCrBrml74A3iC3KSKxPnO+ECDqCsR4uWqlBB8UF6jwMexKHqsoxjhaxgaFiE2CFCWyx7JduLVHzPraPPzCcmWNL61o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543767; c=relaxed/simple;
	bh=fKV/2ufktiWRFzO/z9e2LBLMix7njbSNHisSW9fVXG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/979O7ewE++JY72ed/xEDpXPSLVr206xASOgbDMBQgBFoBglhU9n5icW7t5kD1xxIhDboBceiaGz1+1msI1G3tAzxIM04CvhTioKPyhKLzpafin9aggPsb4mzmsnsoFFzSznW538+1NgxqoSKlrlvNdUhOGshefm8VjUzS06cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZVvi3Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASlOBai2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4V4HV298299
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SP7wbZ1k3opwG5T/nRFldA17
	XysbpbR/EyzGU0JojL0=; b=hZVvi3ZyIwP1A/MGcy5ixVJmjtylou920TDzXkun
	l9DkshZspuDXbrb1HOV+Ror8IU60eVjHlUswvJD0KcmF9mzRT2lCgA/5HsSesOI6
	L2oXEMtOgpM/DlODS7F/Q7KJltPGn7yau1elVuy+1TrXLDFTrxBTP1Ie6xGZIM+s
	DQh7EnbtvbBBDMvkD3529CSIpFnywrCBF7PcmzlhSoMKNe2iamLqE2Baq+eX3dlz
	91hQEhaH5TGakFTW2IC0GAsjpioCJ52FNXux7Rr04idw4Qh2vlBEK3hCpeXYl499
	ZvgjugJuPFza34WcmJC+IP87qgVdOYBwBcwjK/5p0rXNqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr1j27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca172588cso45839446d6.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776543763; x=1777148563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=ASlOBai2eQpiSBwvJHrWiNBtt9CBpRJkN1ggP4ICBsFqSCKrE04fFn+f5QE9p+V8q8
         WAzi0Y8hpYbncqe3L2mU1FXB3CByeJvwQWFOif/a9yTIo2BHPEHe7d5Zt5eY8+ZuJRnS
         rX66G5a+CXrkJq3ZsP7jlB8U+0EebXy9MdzvlaoCXKsv5WnHDFyZobygHFg2VF0DMFt7
         +ZgLQb5DLeRklm5EOPI3fvfqMIBLlK74ZwcQ6mqZFGyvcdSDolP90SgD6ekWAf3Pbjv3
         dClwH2is8AtLqitT2A7WV7J39XQnfSuN2YAcODs6UigG8fcKHHzXD2Xok9IUygpWbyYn
         JTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776543763; x=1777148563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=rB4vWIQiQMaPH+TG0rhMaLVcfBuS7q0i0diyZpEGTMssea5LNVZ/XKDwZmcnrDMC32
         YDJ8MKQNdPIV5QQ9ZHgdlBre23lGlSvoEYGLX7xOLGr/jdC41vwXHM6q+kBYH28CQpLb
         vdxn3r+xxGWTXge3c3QGc3bodPoLSY+oWbnPoytcuxx3Ct9YSBdiWCAdT0vfZ2R6bnqT
         Bgnb0xvji6idZ1r4omn+NuVGBgcIeCRuiB0aHCeirVx9+QciPzmTw7oPCSvldf8l77dJ
         b78uklNN2ylVp+TRa0BAHlO1V2qUyVnLUDSoBPmHBRuLligrB06I9cuqtMZceRyXDmMP
         1Otg==
X-Forwarded-Encrypted: i=1; AFNElJ++Wll5BZyDN1/TpEZLD4XXFEHic24Gnfp7d13CJxeWjIb0cattdUS3wODB+Yl3Ja94lVKI3gUvp3NK@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8Y1Ef6ttZf0ZqXkPLU6MyeC9aQG2hTt1nmPKn54yaFsTpLzX
	Sqecx/Jlq4+tv/Qyj1OOkf5q6f4Ta4XnO87baq2d+9lxPpkB1HsiYJPeaUyF3nRdcFmQ5j44rBP
	VpVNwXVxmVLlHW5pfsS/pnFl5IAcLrrhCcKqXwXLSHwdLCNLTQeGmMJ5imXvyOoek
X-Gm-Gg: AeBDievrgAue2ymHHHtX6TAf9Fiq3h2prSNFa+4s02/ROQB79uCF11LUUmujpNb0cVZ
	qeVW3onV8qN2SVT5oQZ6DKoCqLXHKW2X1Mx4vJ2hXAfTMvDBjuKj4tFPnq1h1QoDR681DQ0DkYD
	DN3DP3hin8qJtNrfz9FnC+lS8YCu/KId4OTqcRpb0LEwdiCBFiBvYITT2ED2EiJuckEHaPxF+7d
	fBrFofnYf8KG6dCBf1k1fQQOdWtOn9tsfiGodyweUPXN9PAwZyGVZt/qoU1Ez0RadMUg9woAiSP
	ZwAVjXUk8gbS+gw4LodCVJPjBeTEvbdfHYolVYKsAnLKvacCoBuw264JxEdkKFen4fyawPpyA+H
	72luTSPyYF8Wrf2lTiB0b4v92kMP3ERSoYeXJrQgeQy24Ez8vCbzXxXi36EFzWoxfec1/VUzlOJ
	/QB5zT2BojAvaU2rNHfS5Te0DTIH/8bz4uzezhSoWGGeIErw==
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133451076d6.21.1776543763454;
        Sat, 18 Apr 2026 13:22:43 -0700 (PDT)
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133450716d6.21.1776543762968;
        Sat, 18 Apr 2026 13:22:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0adsm1600693e87.11.2026.04.18.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 13:22:40 -0700 (PDT)
Date: Sat, 18 Apr 2026 23:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
Message-ID: <q5q7q4wvecgxsrfxjvkrjuonweb3ptq2cgky3peqbrgmbajmx2@6iyhe36qp4sa>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDIwNSBTYWx0ZWRfX9JnXOQprvpHE
 N1A63rIVAY04Rsvr1jxLfX1RoyNMcGyLCM23dk1/YWoH/Cu6xMm9SKezx0pBNNU9h3GPyk2K8Ki
 uG2qxnKpA/Ez/njgiV5tGEoMetswMvN69j9TQ6+WK9Cso3J6Fkl0vPmTEK43oozLZFaDVWQb6il
 kBVW2lQ/eT6wuoQM9XeP6QHM8fENDLfX0mjzowHSamHBxcYOWR06pCoBMYG5PGHuG/6Fv6uIpS4
 ESBQU86nlhXLQr7Cj042eOHfUPOy+HlYjarmVQu6Hu4Tq3M1tuokyCpiOeUOBCrBf4vdZlYsQyA
 rxcsJC36+65p54FszDfHNP+9ZFmgQhtah2zomoCcCY1qz7hvTymY2c9GLYi3zISsYN3PKyL/14Q
 i/0MT0iHG2ONcg8e/87iZv2+b1f6lFVlGwyEjoZMepEyJQzHidzwMhl2xUvoyaSFtxkyL0Btgq4
 XbxLdSz2mkB2jRM3itg==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e3e814 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: af6jrtXhTtZFb5F-xSExcBfx-v3AaEbu
X-Proofpoint-GUID: af6jrtXhTtZFb5F-xSExcBfx-v3AaEbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_06,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180205
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35226-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25C72422342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:59:25PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |   9 +
>  drivers/pinctrl/qcom/Makefile          |   1 +
>  drivers/pinctrl/qcom/pinctrl-ipq9650.c | 762 +++++++++++++++++++++++++++++++++
>  3 files changed, 772 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

