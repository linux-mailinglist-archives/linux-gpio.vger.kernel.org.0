Return-Path: <linux-gpio+bounces-37456-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKu+HSFEFGpGLgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37456-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:44:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B795CAA3E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4954E301739B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BCA382F12;
	Mon, 25 May 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYRiWHmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jet+oYbu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C392837FF7F
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713052; cv=none; b=Vh2KxMAg8CwT24zXA4vM/kPgrX2Mr1qzz6dWa5OiusMm7VwhawjDQux199nXaiBRNTMrHBTtTl0KPXdMDk23/KHaqA345hSnOOJk4kzxx3+EZOMu3kPO4zD2KhFzlId9IputPw8I4WtNfs9vBI1v/56itGL1IGxL65nPJqtGxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713052; c=relaxed/simple;
	bh=0l0FUTgfd/bqln04/9dA5OoUSKU/Xb+dFE0/6AzHq48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHa/P1CJE9cRnL+cpunOORAwBlT/otaZSqpPH5REHuB0FutC46FCn2Ul713ZDRyPCtQtifeVYuuaQl8uH1RoatNpRXqy1kc26Yh62PdAnhiyU8MAlRJd9AyX9dZpaiRJlBAqgH8pTi7D2dFDh5jfzFv+/U36shNDwzcJCBH9Yxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYRiWHmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jet+oYbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7F6pV3132975
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 12:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=; b=IYRiWHmS5MllFFAl
	ZgZq6MV8o5XZk5Vxn4j/TPkeQB09lXYfw/e0sXC+pAqb2JwwUtFTaHBXOUdDV2iv
	MY0stX+BHm7G+gSrkyFmZwEGA1R1p5O0TPi1q79QEj30HwFf6G1MTKMDfeS8G+lU
	O+XxDmj2p44S2JXFOuL2KtRkF9NvmTA3UrK8Wuz/gvgX8sp95qBAvjQBmq7yYZhX
	uUwT/ClBOIU49/nfLItUttHvlcsF8cYzOIqeZm5RbLnM4/yIX3sI1XI5jngxK1Rl
	fbtvhCxWu8w8CQE85v0ldz7QeWQoOtppH84UWopmD1bo36m15DxAyVTtKf/TG+QA
	xunlGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6u2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 12:44:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cadbd70eso8317651cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713049; x=1780317849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=;
        b=Jet+oYbuSkDdC5y0FjpjyqbWsemIl18Nvm5yHOi6Y4AWHNsBj7ZtsbiJev/zWlyN8l
         7dqEjUzCmOfZoS0XaXhHaixIktzXfRx3sIwa6vhZnLrmZVoDFaB49VbiZT3jwDUMl6xz
         PAPwa+yDjysGffmUtFFdrZvIU1GfsMOplpiaiL9J1pn/WbMa09dFoBVtbmex6yyZC/o+
         ZqlFAfYX7PxGFrhu0I7t1ooQFmas6il6MfbPh5bdpJRMRQNVlFHaiB0EkYQ4fM6FmpWu
         M4ujdeyi/aNd+pD9dk0/MZtky+mUKmR8ywun9eLiE0/Ot22cw6PmZARk7uzIGq/NEdXO
         l8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713049; x=1780317849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pIyAKElVfmOSXDKpxS/qE0T24eL34OfdEb+4InNyaU=;
        b=hmIrys05VElwo4UsRdccnVFKzrpYNZ2OgJnX/JAidQwwxsaC6x2FHROzGRyhKgZxrg
         p0NhdYnWKAoabP4ckHG0jKHIrR5imyaatx27Hggn9VCh7S/K2WWRLtVraF2xpGXa9tC+
         6e1hg8Z522QJhqqK+05PWeECy/3L1vMXhL2TZ7A6UKNW5Hd+jDQJxEWfdSmEL8Ijqdrs
         6Cii4aOUXTQ9VmoyoK0ppJEos8M8GJtgWI6Ltq83ssn8G+YAiJ6gDHJk/P38FAiZZrHB
         hVImMvJ2FrmxWyR3zWpBaOuBXzSIUwkkYpm8CzIz5n9/fD5u5BYUmtXFTjMeMBB+Ua9h
         AZow==
X-Forwarded-Encrypted: i=1; AFNElJ+Ca0JR2HLP/eST4aNo9gnm1WsQw9XcfseU+56YMAxsp5KmPYx5HEfl7zDRsUsryim33ZFO1sgAul+p@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcwKw5LSKgdX5la+5at+QaRnY3wXv0p8ORLORrfOSdZTiyg4M
	OzcOcZAcPZjv6/2ulrA2dMlG9A9VfsMDWrOfaDDoi/RbnB6IV4O7zEttSC8sTQo/4cny6KTT+/E
	GpeT/FY8D7VWjm5lQm4xW3fiMx+QZN8LKIZ8gWlqmQeYbJPuM36q3+59gFCDJClyW
X-Gm-Gg: Acq92OESo3j6swhlRCZh2NbdSkNLda9AyH58sEYLzN8qffa7ZuOWm7r9xh02jxM9w3Q
	awEZUVv2I+Dif0jyJox6bOAKZHxgBCXDxxgNyZBi+bqohpmc88sWNer1LhGYMwQzUWZVuajhyqb
	pVqTJG8dNQRoff9+uCoc4MA2UI6vI+bjKXxYOxn6PAW0AutAcyzqq1cO8JhPZzFWQN1yUppzMq7
	iSXdHRfAiSmNiDpmu2bhXHaxWqMDbe0oWXywuC0OUXeFys64WX66rJsNOnQALyYEBYuThKYsUG5
	3dn2D0fVJH7D6Nj2rrnH2WaHPb533sWQbUph3QbmtloetjTnpcZ/lkPziGv4Qsp/e0NuyW62Ez8
	mIvr4vEmlagKEeyDA+NfeieFaZdGYvhrLjUp6NajTPlXM7w==
X-Received: by 2002:a05:622a:a6c4:b0:50b:5286:f756 with SMTP id d75a77b69052e-516d4631a28mr105769041cf.6.1779713049205;
        Mon, 25 May 2026 05:44:09 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c4:b0:50b:5286:f756 with SMTP id d75a77b69052e-516d4631a28mr105768701cf.6.1779713048589;
        Mon, 25 May 2026 05:44:08 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d98asm394663366b.9.2026.05.25.05.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:44:07 -0700 (PDT)
Message-ID: <438196f5-677c-4797-8315-27767afd1cb1@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm6115: Add egpio support
To: Stanislav Zaikin <zstaseg@gmail.com>, andersson@kernel.org,
        linusw@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522141149.1425711-1-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522141149.1425711-1-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k2AdTBNOuyeYDQsXAaxnXZ0O89s1kMod
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a14441a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=D2ltqR5BaqNGB7-Ic-UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: k2AdTBNOuyeYDQsXAaxnXZ0O89s1kMod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMSBTYWx0ZWRfX+jE9C63ROUs9
 uthAhL6oSEAIzK+bHT06GmjjVkxI0vnOS5Q+8Etm3H+Ar4LRV2BMZngmJaz7S+JxJhwUfI+2ZTY
 HMVkgSrDM5JNH206GbEFgHNlm1d1VZSuD5LFA+61nO/Gguxca4PMA1FWczbfl3Wqj3hLJF36DBs
 Q/L+WDeItBQPp58mDhbmnoX1H6v6rlp4zHsRP3QSiwrPX8SmI9Vj9302VC/UsKuCpGA9HcW5Zpg
 JUa+qcITm00EdeURLDuanSvPOEKAsiDxggr5lfxu1/wrKcossWjFSWnTsDlyZTFYaNmNFPWlWiS
 W8hPCqNXfrxUNNrcqgGZDqhanPrYLilTo8A1PaKc/zwGHkPkuJAejl9aGO7IWjmqVKgdhcHsCv/
 ZjN1jH4LiGLdEDXzspc3L/hTxhdT2jfDfOt7PtnNfh9rUWkrf7P8L5svjZtbYOs3/0SH0K3Zqly
 GnQikokOudrREcgOmyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37456-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0B795CAA3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 4:11 PM, Stanislav Zaikin wrote:
> This mirrors the egpio support added to sc7280/sm8450/sm8250/etc. This change
> is necessary for GPIOs 98-112 (15 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

