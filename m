Return-Path: <linux-gpio+bounces-33144-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D5PMNZN6sWnLvgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33144-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:22:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D1F26556F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8343300DEEA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E7139DBFC;
	Wed, 11 Mar 2026 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cshuT7wH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgsL01Gl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EAA372B3E
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238926; cv=none; b=qQXjI2u+5K4jHI3gol5HriPpyUd1WERKCo834+/IWgIVES3Eoh4z/YhhwfJpS8qq0DQcdyDQLEbpYa7/DiRAShJtaxWPlYnJF4dhDVNg2hFKi2+649pCSmCVmFjq8Tq2lOsZloq1ij7d+Ik6tvrzKux0T0pN4itU7XOTQlmAKFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238926; c=relaxed/simple;
	bh=BEse+cE9zlBvxfia2wA5EtEVYF9p+DcpUxCB9fBv3og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxiNS2+gmLCVTgRfGOPYLUtLdrjuBRrdR/3sLgF5Qz8BJVQja5ajdzQfXEo2OXU3cJdGHtuRWoJYAzL6dDF3gUwb4PIJf2AX0npfwqRqevjinE9XkygmiiXtvsFR6eD+/jDUDOsZRAdE/1Y1RamaU314GKminaWAYms68YIiLCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cshuT7wH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgsL01Gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BDBoaU2030768
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=; b=cshuT7wHAs3bMZMY
	khk9x6m+qS6xTCEUcOPzaMl56J8Zdf0pDHEm2irMYh1HtIp7rTQxxpHePQb5Li4K
	ByAxA1VA/0AxbB9HODpvwwGNK1yKy5AUSbI1TvrY26L9JsZeVGi3TUkX1ZyDCRso
	X69PDYRu2SZ5upsipdafMIjH6ctabMvTzXCh48ABfbKpx4a0WT+sSrA9BRea9q5V
	gqbUAxJn8VG3wZMKgm2VJZaISGxuQh7ON3JMH+vrV3TYmFaykaLcFQIm5ZIwl/fI
	x9F11o34ENdueJpx2WPiEEEZwu0AXHB2mN+Vf/KbeMbFTj3tCsc0oEthLGqHADJw
	wSNa0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h1hv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8b37d4b2so2146576185a.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773238924; x=1773843724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=;
        b=QgsL01GlPH/oery/yh+j1mCQpFUJ+WXRMZ823Sk32GkAYgGVFIDBQI53fh0Jah4DQ2
         Sr1pDyO1PZBFHNfp6bF+EXaBJkrxGgLSzlTbEQSrdNetK+2bwf58P8tp6R/PcQAJA3/7
         EhYEDA8qzeHoCIxrSDUlUghGSWTj6mbJEZ/4FzAKzolb53L2JLcSBnvp7pwqGhWdUKHS
         TR3GFdK2wY3az2pwY5Me2Grzbu6hOLPTG7q3h5UW+cV8x/Q0naIyIfxpUR0RUkKsnxU2
         BsDrU4IxjAwZqZ7FB+oS4QQHSg4nFeWlEkcbV8LFmCNUXNfwUJKjLR1ka20cTdFY9W/P
         bXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238924; x=1773843724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=;
        b=sHjD/DiSmP0ZO6ma2GDM7tdpTzKbdRV1IixOxEODtwpCherTvADtWqM+qNIAk9+t+H
         JDIfWt19JIK1lBErLOo2pambfp9XEP27Psf1yWt61p9v95YSMwT9j6+xUffqLa+32CYQ
         I8ojiosFM69qd9xnMOVvq0hZ40212blKMqBVd1PMAM0rK1aN34XCcd6L9FCgi6a0///G
         qOZfEBp9jUCsz8QqO+g8GvxCVYK9IdHwJwIIOV4J++2amMNfrQDuEiu8/uBL8oc39hMi
         dqda/5B89+dmO0TuLXFMROtLVeggpOxKUgnGzbAZVdKixo3tXBSj7Nt+/xe9qJ3LlilT
         YfnA==
X-Forwarded-Encrypted: i=1; AJvYcCUwclxtPW+gHwR+Hwn343XZjzH5ncvId7Qd/tYmNDGcgmk8ZdDaXPF0aL2nh27cWSsBI7YQIOwxgAEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0fnz4c3ERjy2TkED1Z3TM4vEOggaEyqmnxbk0pPxm50dhkLI
	tdkpVAQZXfU+SJEU8LNXW0ImIDme9YsyPGugURYlflPXS2Aet51y+kZhmycs+AXuyiZdu3szpWa
	OTpxKktOGTrsTrNPtu+3lffHJzNSsOFvE62ZJg1xRgL2KRGe76kj1WSvKI6Dw/4kx
X-Gm-Gg: ATEYQzwqJDgulPXsqxyZjHsAC9wwovF5rerIBAdiTp/xB6nEYNj1/2TxV8DH3ajlWlw
	tbvQZ8PQYIZ8yLGp9sn81Gj7N/mn19MzJgBE4zToNxZt3AE7tCRbdOY5mGCIdXzwJ1r12PeoMWI
	HdAEx/MMrglu/RHx6gu/vX7IUlh1VKn35ANsiUy3RfOmL+J1+1VksriuWuVa5G8YX9Odr3p1HHj
	huW1N86YXgOETsSz+YVnm4e463ZRRygF95WYZ7jHSgXD+kSm2Z/6dSC59DZlS2fFc4ZgszQPCpg
	eWCLuPzm1q2Iac8p/8OlZE5kjlZqegfX7Xre/8DsCQ97uiZH9VF04gebN3WBHDBHE2MHNkkMl/W
	xlGvVisEvyw9/IaE2mPzXcIWBP93PINNYuXPQAw/cip6RrwFnmX8=
X-Received: by 2002:a05:620a:468f:b0:8cd:a071:9aac with SMTP id af79cd13be357-8cda19f395cmr343231985a.24.1773238924096;
        Wed, 11 Mar 2026 07:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:8cd:a071:9aac with SMTP id af79cd13be357-8cda19f395cmr343226185a.24.1773238923609;
        Wed, 11 Mar 2026 07:22:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14ac0dsm57656966b.43.2026.03.11.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:22:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: (subset) [PATCH v3 0/8] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Wed, 11 Mar 2026 15:21:59 +0100
Message-ID: <177323891652.11261.5778359438358477174.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309134920.1918294-1-o.rempel@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyMCBTYWx0ZWRfXxQMYChoSiDlp
 2VG+8WhxuAp+H0yVWY26SisZeiFYmDwi3P/RSaG+gtvWuH/3Uenaqbc/BLIkI35HBSKmY0BTXti
 2892/8+509hoxzgJPjAxiLMASr/maDljkC4e1zmBCNF3Vh4LMZFA1zFQ1aLmTguQ3mr3tvpP46O
 hvfUcSnUQy+lwOuw+0/57h/7oGOnx7H3kN57qZypWA7R5waQXIthkSi+1R/sP3xWleX3ZbKYT0I
 BVHeBgagsSMFsCJp+WeFLyGpTQIznX407p4G1MIwQ7nb7v06UPdpgBYFrHq9CSJ+3FtYay+LFKs
 G6ONwzdxZh4Tz4cnDbj5kt+uFrInCKkRYNi1mkCN2SIgfZ/RsfdwF2ibKsmAxaaX+f4Vz2sw8bA
 GH2e2N2QHea1I7JvurSL+/DgGOnQsCEBYRA659sEdqmGcJD3yUwXp/tESXaTzSQgKOgkogQRDTH
 Bji8S7Ur5fBGQwpdwVA==
X-Proofpoint-ORIG-GUID: NcnSd8GJQAEICD_tCpRRiiYIEQRDLhX5
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b17a8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7B33ad9EORelKyuzWjYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NcnSd8GJQAEICD_tCpRRiiYIEQRDLhX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110120
X-Rspamd-Queue-Id: 51D1F26556F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33144-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 09 Mar 2026 14:49:11 +0100, Oleksij Rempel wrote:
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>   linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>   the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>   fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>   temperature, VBATP) to an external ADC.
> 
> [...]

Applied, thanks!

[4/7] gpio: gpiolib: fix allocation order in hierarchical IRQ domains
      https://git.kernel.org/brgl/c/a23463beb3d52815e5f8e61998f5c94f13274544

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

