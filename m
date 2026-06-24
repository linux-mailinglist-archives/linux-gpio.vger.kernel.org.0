Return-Path: <linux-gpio+bounces-38865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZO79Dm33O2pFgwgAu9opvQ
	(envelope-from <linux-gpio+bounces-38865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 17:27:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CC6BFA38
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 17:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M4wAAY9Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kueFV1hK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38865-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38865-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F4183016483
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 15:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28893D9DCB;
	Wed, 24 Jun 2026 15:22:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881243D9DBF
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314556; cv=none; b=HqS3iwqSn3yw8xGUbr0QXBLLE+drAZL5iRbXJEybuTUUXTt0xNq0bKQUphrcT7Lptf07I3ABWGoJdVoKBktYr4/pA7KoZwHH9XRJ6rKvOW4wfTlDHDurXrRXhG+4ILPrFor7BzFvxGsZa+RhRDMkc4dtdarlfZ996qG75MHIZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314556; c=relaxed/simple;
	bh=nnUwN1JqebvNjrP/2PzZNZC/NU16zQDDiWfZ/RnYRFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tf+xsojIOuqXBRKxZtpftE2xUSu9RsbC5QgChttPbLIRneYNvmOtPgDGq9yE9+HLvaH21HYayzfjWNa+Lwf5ny+eKlZxXYUfTDwisprNDC0xHyzSH4gBP99uerGZPcvUY4Do4RS79NN6p2FXc/8vAsXf4Kvvd1xXVw5wCNi+NV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4wAAY9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kueFV1hK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfFtp3418736
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N5+m933QhAI2az5gqDSRgGda/XO/FIkchrVCVc1brc=; b=M4wAAY9Qie4Ig+aU
	1Z3tuP/TiAYwSOvKtkm4TR11bTyllLnpZC8fObGfU9euIFxGZ9cc/YpHJS7kJAj6
	R/iJ6EWhyyNHwJ0qWv90HlhJ+8Ty308orZR5JC1uJRnF/WrJXOtH/BtejnrLZcB/
	iFk7X7HT2BOW30u42XZdQ+uDhpx93816uYTqOZrQyihf/qdlimRCQvvRf6ecZw4X
	mz39HMQbEJkOSq7ifOwvWO548HljJlxTiaHjzk23NdBw+znesxTl/5Nl9h4x+Zc1
	yjIGwAy/9cXcNxmZ0QpM3cHuMhdQnhnCyXkFGc/DuyaG2Gua7kxHwHzswzI0MveJ
	nP74gQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3tv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 15:22:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96730902709so1974709241.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782314553; x=1782919353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/N5+m933QhAI2az5gqDSRgGda/XO/FIkchrVCVc1brc=;
        b=kueFV1hKQ/5SCEV/MT8ltuYs/q+jXpgaaGiHJyd0/ziirCCbMtY0dHef3usvDthsFl
         ZGRgL6FxT49g7ZDFd3yNVwivbQOJsuLzs5gwOa8HWe97JHJnXwIWcT8/YZI0bnL/1FYQ
         YlI3KUoc+H1ED7aCjti2zPSVZkuKMgwXr3mfr6NcT0YJjgShMrsvfd0jjfSIeIA0kfR2
         WuZ9MrFfYqv1P8XTlHr4ul97et3kl2jUN56TjGHhgt14LaZ4FPzmJGnIrBhDwMrzbmr9
         wiHDN2z69FjJkuUES/e/PtdLJxzR9Zc8UNYqHwFfdcPmBGBBAJWAVlzCBhni3NFZvnQW
         lKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314553; x=1782919353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/N5+m933QhAI2az5gqDSRgGda/XO/FIkchrVCVc1brc=;
        b=EYr5MIJRKfyeZYSQ7BTgCCRnOcgioMPCyT28euH6pprrBhYYXIV061Jh3qH5brSWi8
         CN5iH+npMGXXwB92afTt7+QQFePBW4cT6j49H9g56xOkGrQDi3Zs0E/yRTh84g5wgiSi
         uNXDD7VCWBPQTvn6YHEaJ3oxHCYPSGCYLTkdTIIIBNoH4hfYvbgUyytRwl0KOUyB7Oc/
         kw/uHYtf8gVzZUivsYr6j/akoVsqgqp1EUTyQXWjwaGeRKTqBdOfDK1Mzn4LZR4Njia7
         aB6eYyBMt9jl8g8XwFETI26J09MPy9Kf7sOTNXw2LRZmCGZuD6XssGbUnSfwoNA6HBuK
         thfg==
X-Gm-Message-State: AOJu0YycHi5UBWJ1YQ2GGfgIvnTIpnElh5LRjrrkl862ofHE0+ao71Ar
	AbKm1qjTcgoXVYgtS1hVzoPA25ayFxjpXYyQyqXVPeynP2jnQTsBE5waAIe5VtphXLqjYjDcfR7
	H3HbFEscvPqwSnaVnQ0YraEVBMSTLUNlgRcuepDCqgAcCuEXHi+eaZTdT8Ke7Ml2T
X-Gm-Gg: AfdE7ckxz1pnnERcx3yFq2yEK7tFk2rMzM4Lga78sifdeF47W4Q64Yos1REQQYz4qqE
	ny++38BQjyq7RpQ9Eai6/uSiMgIdRggwxfS7KyskXtFK5fwgBhww7ai00zqj2LsGncD/dpbKReA
	0NFyyBapACh5kl+oDIyeKVJk6Aw3/r3cr6qVB5dsMP/xZJ5eRxk4D2rwUpeuTgwhflP3k9Nk/+E
	e8uaFuOfALNLgA3qDw0Ru+7FJslyc9Sem2DSGVg+UTf/9T2jSnfMbKmd61YkA7atvrHZWCAr2y6
	beFp2aygBKHxg3j1ZlTo4SwUt9W+Whl5iK35Ln3adF3FtQKewDxCPhO/LvZuSzqH0vYcrvO7wT6
	ZYMzQfOqo5D+HgGerdwudb7nljXOAIhDNoZdqF6E=
X-Received: by 2002:a05:6102:818e:20b0:6c9:d9f3:1e20 with SMTP id ada2fe7eead31-72f85be0bd3mr2977377137.15.1782314553702;
        Wed, 24 Jun 2026 08:22:33 -0700 (PDT)
X-Received: by 2002:a05:6102:818e:20b0:6c9:d9f3:1e20 with SMTP id ada2fe7eead31-72f85be0bd3mr2977363137.15.1782314553249;
        Wed, 24 Jun 2026 08:22:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3725:ff19:11a8:a2d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm6876931f8f.24.2026.06.24.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 08:22:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Vincent Fazio <vfazio@xes-inc.com>,
        Kent Gibson <warthog618@gmail.com>, Luca Weiss <luca@lucaweiss.eu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH libgpiod] build: fix dependencies for generated files
Date: Wed, 24 Jun 2026 17:22:27 +0200
Message-ID: <178231454442.43560.8462881189221249613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623-dbus-meson-deps-v1-1-b37604ecce3f@oss.qualcomm.com>
References: <20260623-dbus-meson-deps-v1-1-b37604ecce3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyOCBTYWx0ZWRfX5Erfm9CDSgbN
 ugnDDFMUGf7UMIdqXX/FkdmXtw/C5kO9IapIt0aluCPkU4Icg9/Bxo+7rNpVnSVGUH9DucZu+X6
 CT+Xc+oIxvr2AOB/VL1uLg1HP/ImSEk=
X-Proofpoint-ORIG-GUID: w-poitvEqfH0P7sTBIW8rQ_zZhgID0pi
X-Proofpoint-GUID: w-poitvEqfH0P7sTBIW8rQ_zZhgID0pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyOCBTYWx0ZWRfX5C/2482j/EIJ
 6ugUcWtRQ99W2TTbk2vSBGU97D285hUuwjmiaSi/uQ35PiuL/T62nLZXISiMXp2WVPrw7fGxrpJ
 DbWDJiMY/SlIZiQvZxr5aItHrhSyeC4c7Wn+b6CJInStCUTMNngu1C3IlFV4epO6pui922Lvabf
 dyTiphRzvlSB9+OlFmeIJ2QXF+/NxXV2bkhTNfbCDONEed+il9EnPlJyNEot65c8bnQmcJkz4Es
 GnIB+N+rUj/VMUikraSaY6eziKwPsSCIyua65JNk5MjKhJeQqIedK5wQsE31W9DNrRtL8CHuzTm
 QXjvR+kaFTsXQs9hccUaC33yEsnaH2gkKyB3hVQTl0ofc5s7zV13tO2PvPq8pqFikz9HZIr6uQP
 bb4BkOckcnEgNi9g/qk2Pr9bYaG9dxbO7WOaNKeXKMvtl6pBtlIRx6Kh8Dxyn5w8iQ+B7bNMdL1
 t5KK0vF00tG1Xnd0qdQ==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bf63a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mRLzglvP6wtJaaZapj8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38865-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:vfazio@xes-inc.com,m:warthog618@gmail.com,m:luca@lucaweiss.eu,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,xes-inc.com,gmail.com,lucaweiss.eu,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F8CC6BFA38


On Tue, 23 Jun 2026 13:40:17 +0200, Bartosz Golaszewski wrote:
> Depending on the timing, we may try to build generated files that don't
> exist yet. Generated .c and .h files need to be included in the sources
> of the dependencies that need them so that they get generated before we
> try to build them. Fix issues observed in dbus and GLib bindings.
> 
> 

Applied, thanks!

[1/1] build: fix dependencies for generated files
      https://git.kernel.org/brgl/c/7d7b07738885d051a28bdfb5025c8eb73cdf23f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

