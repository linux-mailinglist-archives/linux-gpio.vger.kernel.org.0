Return-Path: <linux-gpio+bounces-34009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ6UBU4SwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:13:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 837342EFCD9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1B8E30333D9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8E3389454;
	Mon, 23 Mar 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4zGu4JC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS4knKdG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224CD38A28F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260416; cv=none; b=CJWHwGcLNC0e2DSJmW2D5fugVAI2KZtBtzou55pkWnAg3Gbw7MsDzLdfTz94PmPNlEW4gAQwb1Vs/IiGesXav2/BF30Ul0FsLKB0k6AuZuYk6JLE0IEyPF6bBUP3lRel+21gToktkJkOm7egRFWI1cZI7A4KuWpyKYGTQ7eB9VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260416; c=relaxed/simple;
	bh=4iDhTjC3oEE253ulFO699ZLqMT2zoi+GyCzp/YTcqDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMNH8BVUUW79+yukVFHpCoT9FgleLt+BdNPwKaAYDhMCxm9vTqDIZUxP0iF7AVuYCHwJYPd7n8dXDma2egHBRD6wktdU8psLq3EAySb/VE29IOQ4Dcm80YSAacpcynVzqyIR/vhqj6A2w8Fy26OClR/58AAGA5sBanfHu88XSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4zGu4JC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS4knKdG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5Dlhw1239142
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbQuiIpZfj2MQrzFcDiA5b4HP02sygc6lfPga1EdW7M=; b=H4zGu4JCG/4bG927
	A+gez1eXOG0Sl5noT435Inn3Xd/GWJbz1xY6osdMlgii+NINlYyc3goZuZ4ZI1er
	i7/0k3z3ipgY+LWLan7h+SaF3FciJjqGGC6oEYsmXhdC8ZvyBq/5v6XKe82nPha7
	14LwRtzHarKheUTpjQUpfEa+iRq7iG6ZmbeiD74r5fS0kO407eOnlDzzvnrjkgw/
	y0aGtRR+/xoKq3YpZ+21F+Hma2ZNhGnD5b4C41MdLBEe2Gv7yPeYmdjUN8E63E+p
	JjmxA+jvWnoQDg6SeSrKpe1T/7l3L2Jwn6I/+8PIsGZeB2tHwfclX7IA1pjTGX2s
	kPcX/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5my2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:06:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so95945431cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260412; x=1774865212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbQuiIpZfj2MQrzFcDiA5b4HP02sygc6lfPga1EdW7M=;
        b=YS4knKdG3I/69YSQmOfy8a1Kn+ErZ8ls+7Bw4QsJXv2wn2XbS6MsJqPlqDQ8JNGrrF
         7ecm5FJw9OJz7LIpbEuX2NBokB0gyoRX0BZrzZSqMWfYng1QCBQH384I5u/L+5+2k9Dw
         sVssWtNc2cXBGWHz/kMNJRijLd6P6CBRsgRXsir5CFBhBWSLLGOVJoAchww09B8rsQiF
         bFmmHqTZskHvR5z4a/ml3M0AFU88D4K3oBVv+c7i9Qd5KN5Y8sl0IusK6fJQfdw7pfn2
         gkblbh4mOqDYoA0v+4nhvroQsaQ5vqQS9r53b5halohU5hFWN1/0bl48haSVpjnrNR3O
         EPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260412; x=1774865212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bbQuiIpZfj2MQrzFcDiA5b4HP02sygc6lfPga1EdW7M=;
        b=hgMvE0HpQpImMgcoDaW4On92SedVHFDIj4S4f+vWBGzmfxmjB7UusKXlGUh4mY7Vsy
         SNw7idiLVLLd6GoF3daETDgL009Xa7Ao5S5Al/oAZUCZHu8OE2xHpeYdsjBH+eLBZrqo
         sCwpksb08pSiWvxerEIVu/JJhXO/fHlVwDA022p5CLlrJVXTzbX+rzi+i425yJH4w2SU
         2mjEXnUYfbFQSxnk15ki51q0KWV41lt0InkOgUOU50lLCUZwf520/rR+qHjoacZv/Ao5
         5rA+qjGZjEklMRT1Klo4GYBiuOpJTiGKyQXKfkubiVArdrPp9Fft6jrlYwQhRnpFRNFD
         HxHA==
X-Forwarded-Encrypted: i=1; AJvYcCXYoCN3v3CUwN0p9Ug+nRL3ZY3Tkl5/73OS4uOWYyRYj2sr+GDqi4BoUAVcy6G7vM/EdE7oZWHmxzmh@vger.kernel.org
X-Gm-Message-State: AOJu0YxpA6UZXOIeMdBM2tteHR3wSsocoYBIHTw7VUTFx1SYOxdQYWEm
	Vn0Xq1tNyzslN5vglXEaO5+ozmZmSWSeyQrZ14iVxHoiU0wRJ4lNXfli9pdPYatX8YDemGxTE90
	4izUBzy5f5+/4tgNJcnGVC/9IRHy7fV3O+2e1uBeFFVUN9wQS4CgTWonuN/BKXor1
X-Gm-Gg: ATEYQzx6vqNXVxHSrKbhmIbB3MYiymLlMzYv870x2MvMtRiiOwt6RHIeaR110gnlLKr
	x495grCuLR6HeFJuoe7i0OzG5lRBhdaHE+wkUc73mmoJlSv4qU5iuT/XnrUdPFB8PHoTbLXZD6u
	kHCdT39V1U2tFRXcv4fV4QXv5zLw3KGl8ob4OcwtmE1WWzdQKbFaXHNRVOpPBMDAoaZD3Qt8fvg
	rz0nACfHaqwhJ3ZpBAzZB+07RrbAottyDdknXbSu4wLZU/K9hKt3bigCG1CsPjKJWzpFh5R4LFE
	/KgLJCQSKlXSd07IPsaXHO7amv+0Mcr+ayHHJiyWQ/UsmfwYYDCyBc9guRdGs8nIUslzCRruY9N
	kh2b6KudgO0hG/zD/PfexUxKTedCzBfl1nitGkFK4+l6LkDs7rFE=
X-Received: by 2002:a05:622a:1920:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b375d42e9mr190887031cf.66.1774260412574;
        Mon, 23 Mar 2026 03:06:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1920:b0:50b:3443:e216 with SMTP id d75a77b69052e-50b375d42e9mr190886771cf.66.1774260412195;
        Mon, 23 Mar 2026 03:06:52 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm100561895e9.0.2026.03.23.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:06:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: qixis-fpga: Fix error handling for devm_regmap_init_mmio()
Date: Mon, 23 Mar 2026 11:06:49 +0100
Message-ID: <177426040553.22339.7249164751635452493.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320-qixis-v1-1-a8efc22e8945@gmail.com>
References: <20260320-qixis-v1-1-a8efc22e8945@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c110bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7Gp-KvnkOeZR7p80lf4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IU5fj2nkc1rO9P-Xmsy0uioGYDxa_47f
X-Proofpoint-ORIG-GUID: IU5fj2nkc1rO9P-Xmsy0uioGYDxa_47f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OCBTYWx0ZWRfX7yvwzTf5Y2iy
 wn9tA7fgSwggKfpWfRLPwQ+LcaIdKq83Vfx54mgdq1shvcmvY/zax4sUKS0xesIvBQ+yUsohYnM
 nI4K1cwCUECp2TuENMIdyM22kQ4RWVnRBMedszX48Yed4UDIZbw1U8vfn2oZpJ28ah60M7qj1RO
 BjJgKlf2/1sLqQY/uNmPMW1HrVhdRY5h7w3HTNPJiJIZ+5j505Va2osZ3trXDzBHPfgTkFqYGs1
 iBcpvpdU2iO4VBun6DMhDVYYVAi9uJ3Gbr8gmlWjBrauOv06MP4S3gEQm2XxJlGlQANv5kjsqDI
 mshcj/orY7hQSCOed+zQsLkEX33evtjqbAuZh1wVmxA3CiwB7SmZfWNDt2iPDx5Whbbm/Z65USR
 lnbbmV7f/JsDxl2Pc8/ZVVbWPVrhlhNryZIwB5UH/v3o7eFTZfq4Dn0Ad7HAaFkoUQfx2mU2I5g
 sw/estjcm8p5GNNi6fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34009-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 837342EFCD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 20 Mar 2026 22:56:38 +0800, Felix Gu wrote:
> devm_regmap_init_mmio() returns an ERR_PTR() on failure, not NULL.
> The original code checked for NULL which would never trigger on error,
> potentially leading to an invalid pointer dereference.
> Use IS_ERR() and PTR_ERR() to properly handle the error case.
> 
> 

Applied, thanks!

[1/1] gpio: qixis-fpga: Fix error handling for devm_regmap_init_mmio()
      https://git.kernel.org/brgl/c/8de4e0f44c638c66cdc5eeb4d5ab9acd61c31e4f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

