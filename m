Return-Path: <linux-gpio+bounces-31077-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAFYFYx2d2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31077-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:13:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF58959A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A24301BC02
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E45433CEB0;
	Mon, 26 Jan 2026 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k779G+EK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1MqDmSj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028F33C183
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436808; cv=none; b=JnMWitHIadIRbWIthmCAxiRX5gQNiPaf1ANyhBifI1boOHJvb/MvK0OUDhbDDxfAX/geI+TiZIcwIbMybYurJPeR8xIpz29ICFKB/l8efuJMk8N8p5c0nBn+3THTffUhpzWaFBniX9WbQ9qvg/fp40rOCFz2f+RbLObKpf4HYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436808; c=relaxed/simple;
	bh=6geHjh/9hsSjWD6hE4Xd1wl22nHSGXv5yRtGUwWnh20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukVogGqv7P7AQwvcPSdItKMEoU6WujM5CuWr226q0hn+dNP43YUSLHAfhHa+W1m5heRb2UfNEsejjHHsRVB35q9TkdNivQ3PAcwizjqJtgN/vX7br4ORYXjS1WIYgEqa/bVWB7e+u8NEqxOdkHUZt+FhiOXMMcNb1R0EaEjz11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k779G+EK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1MqDmSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8Jfju2168691
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEaVzMwy7Oz22VXJ+dYjmA5L
	8/T6Ef+Gyyl/6dzhQsc=; b=k779G+EKbuXwpcMQX+GBw+0C8VCmwJmvmlR8t7MI
	T9NzdjvWEOYmmQsABTnzMDWuANVZ5AqYuA9+duSWmSSDTGochI0L8ocsrtaok2my
	WEPWJcODNJOdkQDaV03zMBBedSblGqSCPJGYJSHbDMjRVy0zdIKCrov/FMPBLDdh
	vl9xJa9ZHcDewITo92lOE1SwNfYd2imJh/ysv+Ow6PiV/AIMrSJxQOSA0SwH9As9
	2/4IDYImCR9UCsNfP95TsAQzFRGsIgodSnSog3NyESUrI7mKG7zHu8dTY09E87CC
	Zn6MNV/2gOn2Wp65LsMSpwEIkxiu2e+WYtqzMXpON6y58w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dms0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:13:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a69b7813so1222883185a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769436805; x=1770041605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEaVzMwy7Oz22VXJ+dYjmA5L8/T6Ef+Gyyl/6dzhQsc=;
        b=B1MqDmSjCiAtj+vpxwEPicWBAf4Cu44aVvt5wRAxqICPHpSL394q/D2/PpPFaFCbLB
         HHqhlaFrKAMoe0O0JenFN8i1yvDnxTsejz8U4cvGGuoYxb5AEEWiwOZ1dWePp+UxrN63
         DsQYjuApjW4mMdiyIlSUGYQ/HVJ1Ggp7bz/TpgRXl72fwtp7hbB88NLDJj6+uRET4QYH
         /Gd1oDmknhgUF+FsPqXsu+f1mj1vWWenKERVm1tjeUxI+y1SACfsSU8qJsXLmHoUvurv
         c5ixJ2W6lT9m9ieBSKtMi57ag2aHUlzLIttIKknU/Qu2oL4RgXm0GZ8bFsgw4V31KSis
         F1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769436805; x=1770041605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEaVzMwy7Oz22VXJ+dYjmA5L8/T6Ef+Gyyl/6dzhQsc=;
        b=onp1c5bGsGIPqic/VQrFfctKZiKraHSCPtMFO3MXt6renVr/GKWU6AKu2oyq9uDtaU
         R0S/ze3uEYmhQ9WLRdFI1gNsNvGO9aA9fK3iu73YsDunyPZo2pTT6cn3oOPCLJ++nDcp
         OOW49kNGLieSDLcKQGo95/7GfbtA+C6KupLuTqgneXexQMYir4WUm0zxKDhNvKzuNkSY
         5OPNFhYkBFmHAdt2dvmH5hZtK+KVcW+B5VffooE6w2yCqFhedxDSMyOOEt3GsnyC1P3L
         wuvdyPHVX+u3P/jQjfD5zoES7Ki7nOfUOMmlkLj02DfNZ0p45AXjL4P40mpMk4+nS0ds
         /sYw==
X-Forwarded-Encrypted: i=1; AJvYcCX/bhdycWxtgP2FpPx3whcq40v/Zmnk8tthChqK9pLrK80O0CpbBv6a6PLjKIH/ge9ihLoCCdua0axe@vger.kernel.org
X-Gm-Message-State: AOJu0YynAbOeEKBY8qzVzbNZOHNNJFa5xC1a67mrMzWS9khm/qB1T5AR
	n+VhneKO3pPv29/47Iveq/We/dmFlc6MIiUazMyiszBw7vSoxK+5xacm5tZ/coXtdhTvN6iwwMp
	m70B9wJfyZf9M2ZgWfIFGFfCQlosPiQos+TQ3fnAs4HdRAXF1CIUcKkTw5wfazmvA
X-Gm-Gg: AZuq6aJGeL5+KZh3FBYkK00Uq1I6hllHNKPXGaKld/DwfvacFcRIg0/O938xVoj5vzE
	GjoJvDUhcLFCIdRAxF0/MianRmMgvZKD1RfSCFHs1psaIGf9WoDNXBhyD12RrM3SbHw9AFixQw0
	tUmpi017BZQPsdQ9NJoGgmDfE9AIl2yggSwYzdIvb6H8OSzAJvB0dXghVhjuFLDYq4azYY9H6G3
	dNe/zuFg/2skYghx0nqg8Tf26w/lzh6L4myJoSrriNw07fvAuONhlyQpl9Fw7L5XlBFZTGHCxYg
	8Q6TPA3XpeGvjx8jCzmmP82B9pMtGsUCytDgJpcLfZumkwmqEBt0fl3MUnLdrDWfq1WANmhF6V/
	7AEF1sb3YsEK/u4L+4kqcREQC
X-Received: by 2002:a05:620a:6914:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6f963b964mr543324085a.49.1769436805341;
        Mon, 26 Jan 2026 06:13:25 -0800 (PST)
X-Received: by 2002:a05:620a:6914:b0:8c6:3c47:74cb with SMTP id af79cd13be357-8c6f963b964mr543317485a.49.1769436804661;
        Mon, 26 Jan 2026 06:13:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c8efsm30888230f8f.42.2026.01.26.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:13:23 -0800 (PST)
Date: Mon, 26 Jan 2026 16:13:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abelvesa@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: lpass-lpi: implement .get_direction() for the
 GPIO driver
Message-ID: <njjcltt5zzjzcoucjrbrhyzrqkwdcck25gpnoabx3uoiep3lw3@xctftuapxdai>
References: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126135627.34191-1-bartosz.golaszewski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyMSBTYWx0ZWRfXxABDujac4p+D
 sYATLgg5WWazao1oK6gk3DOn/rZaEkF6F+72VNhkh5NsEUc3dclbexXMbAThCKyOPjsRNgA5AVM
 y9up179atJVIvG7TT/dkZHuIQsd2RpDgoG6hNcUTOFhmCe40ZnfcXRipEpG74xmOSkbMzgdSoW7
 XnNU0+j5DKdmu3t3unYrrpk1S+aQEChTfFw/S5GvUhykG+RqUsgzraQ/VheJbZf4483b4iG8CNs
 31j/1xSDfeItEpQDk9HxCKIEFtFGWU/7CcmUI1vQ87lsTmDmhSJkO8hPGEs154elqQXpSgJRKXX
 c3LZybY30Y7C3YTwtoVwGAXUoUnB0y8BNjVT5LQJFA7JBmethxxD1gj0X1RwTMjKtaGyijfnfQa
 4xbW4+c2/GXUVYKP7XWKlq88beR06JDmNswwBEjJYFAcdu6wCrDU7Hp6SEtVjC0/xQhdET86NyP
 196i4P7WvOvFxbIa3eQ==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69777686 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jvEoDTpiSnUK1vfo43gA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RHv2r2gqFfNKhpQ2MoeaqMWQfMpAs2YC
X-Proofpoint-GUID: RHv2r2gqFfNKhpQ2MoeaqMWQfMpAs2YC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31077-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAEF58959A
X-Rspamd-Action: no action

On 26-01-26 14:56:27, Bartosz Golaszewski wrote:
> GPIO controller driver should typically implement the .get_direction()
> callback as GPIOLIB internals may try to use it to determine the state
> of a pin. Add it for the LPASS LPI driver.
> 
> Reported-by: Abel Vesa <abelvesa@kernel.org>
> Cc: stable@vger.kernel.org
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Tested on Dell XPS13 9345 (x1e80100).

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

