Return-Path: <linux-gpio+bounces-34411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA/cBTo+ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CD357E6C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51EE8302DA14
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8054E3AEF57;
	Mon, 30 Mar 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+CzMx8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBgCkPlK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F735AC3E
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861501; cv=none; b=pZrZK+l7sIRoBKjZNfdOsUnFAikqfB0KjAFmGSk27lV4elSZv3WqRLR6AJzVllIC35l97QdbyStz6ll59k5hAvVvfccZIL+jSB4IAlEB+Skn/lUcqCDpbF8mYKkloKZQdECx4/rbrY6PQGPUwIYULE3eXZRyXoR4y5f7RNi28Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861501; c=relaxed/simple;
	bh=ECu7pzYbuJEhl5iB1AKA48hvEzXsX1R1KNQyMV+gPBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMHR4Wx7RzMrLW1IrXrHjcLVB454xSCFoyfd6/V+ueEnxEBxoSh38FY2DWjgrWkIDfdqF5l5qK0kPauPXJlly6hMzJq+iIWDKi1tOqhbDyJgxwTbuZN6bR+RKod8DblNOggpEsmLIqv9E5KXgQlSCZ/RozSewC/H/OT6Q/AzGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+CzMx8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBgCkPlK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78VBT4162066
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Noj4tXSOnS+f1oNVyHTcmWYrypBXXXYodFwpfsm0VI=; b=K+CzMx8UPrG/CYYw
	EK1amOkE58amB00SbBnrven+QOWwghyPIrmx/y1z6jEf6GQvIfm+tFbohC7qH9kO
	W0DVTslwHMwZ23UEMUaFCIJaKgZwKBbvT1/4+aAVYBBnj/qX/vAXWTEive1GgIBE
	nDfbNueofHQPqm5UADWn5uOuZQ7rEcTixN8hD4hVQS1U8JvXhj95Wu//x1Us6uFz
	hdN74hQLCASfr0OXFjyyOvjmY793F3cM1Gq041aebcX76R49dOnSe8P/7Eo+cE1d
	yk2N/xxBaDjR5r0mi/zpIwm+WP5G0nZlfJtskWHCLPLOpjFGl03fqme04xucSDsx
	A5/TYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhare6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:04:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso126829091cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861498; x=1775466298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Noj4tXSOnS+f1oNVyHTcmWYrypBXXXYodFwpfsm0VI=;
        b=jBgCkPlKjK3dOTqwhtb1PLJZOgCMTReGcMuwzXVFadHhcLgcgdPDN0za5SWWOS+9Er
         EGybBFi1cGOmt7XJTvTJ1i9F1uFe3XcoLd84iReyL57EYzvSmA6yohb+bURML0kDST85
         h/W/UnY64LOmt8n9g4sANqv7i6wNg65M8dSQgLFg7J1ZaLmC7VPZvvSI4drxaqnLCfbY
         dhFRVyuN2YtL0CkDzRv2FdQ+8GGCVU0nkBDL7jiupbsqEYN1IaDYL1X3MekWgbslEaYq
         u0b0RPpCweFFON1yW8EYvrSAteI1cXgblZfKGGcHgYhAFmfR/W7tNXduYM8oS0WoyhiE
         SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861498; x=1775466298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Noj4tXSOnS+f1oNVyHTcmWYrypBXXXYodFwpfsm0VI=;
        b=CmlTo3XX1655gM6NUe+/GI6suuuVNr+qBzYNi2GYbQUUf1FDMczagZ9jkAHKHWJ+uy
         gDVXDs6iSAtWNCv+4A7MNcR+xwKC6LJa0d5M9AolV6VgVEfUywEa/d6/gZTEkyX4rDXn
         zw2XAoCVWHp+aVuFvtCxYjGHOgfrVXyeArt6WktQItv5MR/3AGICyDoH+D8Q0ke1j3OJ
         ZWbs2uZOLSiOP5CNOe3KQRNXFlSXFAvtwtuNfMVeRMt+zgT9VD/tZLr4K5I6p7Vw3gQ7
         vx+I8QB8uizumIEiTxWy42ryYcQ8PP9R77Y+Mr4tKfEDlNPOkOpjEjP75ztNs1fdybtG
         tEOQ==
X-Gm-Message-State: AOJu0Yw5oi78QGUDzMNGHkbuPV8s8B1Hxu/fEytFhguCN2yqZj5FixdG
	DZ0cpjVxz2pWGcayAyRxhpLXBGDx7BqYd+Svl+gNMuAd+nHPTImro11Xsa66egg9fujP/C9QCgo
	eksyjzRkweIkSG6jVO83dpL27fgtVDEFNkI7HnKPc1/35aaS3B0nK+NRcddGS7+8unFlSOrb8
X-Gm-Gg: ATEYQzyHn4utmRpHKP8FI5WdAEtHKi6DbkbAX3RsfgwnOP+rrDDvHTlbQXJzfeq5P9s
	Rd5/4JsJIbv+tzE0Lfq9fwBQvW6atb2Cp+7egQYvVt3ILPSmQv6hbfGrMPZZ27FGbYWtPhPuKmx
	DXbDC7TjIwcoCu5/8FmCbbASEfZ3OISD+VN74uwpREjJkAUXW6HWgGt2YLsUyn1GqttQd1yZ+0Z
	5g6hHHQPBHUml40cUWj1fDkowhz72Sig5CiUVBhvPD77BlPJawUbRY+skCjOv1kUxr1BCWwix2e
	ioCRYIC/+htJ+vbzayk+lYI1rOCC+fGlEcGdmx51ZFMVC5hw/y4VQaxjc5QlsjgWA4UFDvhs2yN
	PEJ8RoDTDlUOZVYmI6741qzcaU9hEvUBC5phuF58CGsHZKSqudvw=
X-Received: by 2002:ac8:5a49:0:b0:509:2677:68f7 with SMTP id d75a77b69052e-50ba380a897mr155850971cf.5.1774861498289;
        Mon, 30 Mar 2026 02:04:58 -0700 (PDT)
X-Received: by 2002:ac8:5a49:0:b0:509:2677:68f7 with SMTP id d75a77b69052e-50ba380a897mr155850771cf.5.1774861497781;
        Mon, 30 Mar 2026 02:04:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm208018795e9.2.2026.03.30.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:04:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: drop python 3.9 support
Date: Mon, 30 Mar 2026 11:04:51 +0200
Message-ID: <177486148866.45175.15553289863452067887.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329182832.39824-1-vfazio@gmail.com>
References: <20260329182832.39824-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX6Hnobfc+4m98
 68cFTyFlJc4mqOoG5ryKfeBWUhs4wlmjOZUsycwviOrclGXSQENaiea6D1eGBcIGcTAbqdnI7vd
 9GMB/zwu/VVHPOOWSieSyaqyLV2SDRCyRLULar4zi+N449vN/P9MeQYpkUkJDMoSqLa/jK/ljiE
 9JyrrensgJGB1+UFXTA6rMhz9k3pbF3V4ATbhpDYkonCjV/+J+e2edwt3jFwmS1wOlg4RP0V0X4
 dcJtOrNH0+ItBQ3aUcW/tPiEUuLYQhGF2jk5RQTUzEvLG6b1GRMA84WxqUDxMV7wSoZhdGmg3wn
 04N4d6IWrLDYtfcviSYK0UH7AXiFFfmA4tm6wqr2A8Z/wMjUO3UNuY/9+s5UzE2iWRXhpAghzSg
 WUFTG6H5LyDfWOZoHgKbAMza+qfiCLEUImhEok/MNm3exFC5gKrjh6/JLKb5XtZOdrWT1ozYDcP
 WeN3iCdY54Ax31eCY2w==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca3cba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iK9jpj_bgAqMRJrFj6sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bXrxDZO4K0dgQEinR5GzsAiGZhaNu1zC
X-Proofpoint-GUID: bXrxDZO4K0dgQEinR5GzsAiGZhaNu1zC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34411-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 882CD357E6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 29 Mar 2026 13:28:32 -0500, Vincent Fazio wrote:
> * Update pyproject.toml to require Python 3.10+ for runtime
> * Update mypy's target version to 3.10 syntax
> * Drop ruff's target version as it's inferred by the project's
>   requires-python value
> * Remove the linter settings that ignored UP007 & UP0045
> * Update type annotations to conform to active linter rules
> 
> [...]

Applied, thanks!

[1/1] bindings: python: drop python 3.9 support
      https://git.kernel.org/brgl/c/950ff3d1b3009bdaa6c1acc76b8a5c8a50687bec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

