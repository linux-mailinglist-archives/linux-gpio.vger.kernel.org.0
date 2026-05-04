Return-Path: <linux-gpio+bounces-36016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKb+BmNP+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:48:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA94B99B4
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54C383016026
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D977A303CAB;
	Mon,  4 May 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnDb2ID4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K24E820X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E33112C0
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880914; cv=none; b=nAVqZ+u4zaYX+4+DAU3kJO2nlyLWE7KhvJV56qPmKckka2cu8lwX7H5DGu25rrrjsfv3uUB9eWBLHcARDNyuWJ9kYMKrLHT7m75uCiU9DQBVXjlOLrEuAVMOc4dDEQeeKhKh7qmJtGA9nNlGoMRNUdIep5gsM+jEBipOJ876F5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880914; c=relaxed/simple;
	bh=5flTLNo7t6OVEOwF4f1LTAgGlDfWBYCGe7FNyk+qDsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDlB6jVnCeYQJwgMEYyXvUG40eDkxDLvlf5jn1CsEli8TAbRYTljWXGAfxBlycVtPD3JZbzg6xtaHdHL6gatSVOWK/DU+aphDTPtBXUDFa2hIhuSbJhmnWinRNUpwKVedDmpWebc8pC0ckG2Jtm5bdewA6+FFtNVD6VTGPYLiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnDb2ID4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K24E820X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DBkk4174218
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjyFKNamhl2YRgozU4m+NE99eK2Dsbk6otucrO0Xe6g=; b=KnDb2ID4V8GRD9WT
	qqSi50zfq9YUkjgEBqu7ch1JOCsT+8TFDyzWURplg/q/NBQyUmoD+P8IFLY+1X4o
	TpJSEqzlEUuX2p6y39VOf66o4BIrXgfNzrn6afqd8cb8vXhbTpFJv1245y+SLHHS
	d+26dezmm9JXPECS++WxnYUmg0zLaqZ0pizuNF0qyCe00igST69wG/ao+Wj2V7wO
	jS1spTG8AFtQBgzsMzJaicUThgIqHCeiC4d6GCs7twja+A00b8RwwFar5To3Z1/g
	v9HqeQDLzYWz0DBnFkF/Ra61ZjI5xiO3D34SbE7Lg16lJCgRndRfJLGZvUkP9t/I
	fhhQPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cpga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:48:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso51277791cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880912; x=1778485712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjyFKNamhl2YRgozU4m+NE99eK2Dsbk6otucrO0Xe6g=;
        b=K24E820XnYqnIVuz1CH8VGB61zwgeDH1GomTnzirpU+tcKCZrkzpMqUJTpQdkjG+c+
         b4FSaG9Tx8c/KowlQSqFUNiokJDylktxW3p0h2W5ea6o9fxp32EV80h2qflGUY7mARoa
         bw6qM9jmtd1/gRE2ns8G7BCGA3+wtBJs9BZNoQ3yhX8wtjPQnu+VN3gJ9iUHfrPwa8uk
         LB8SbpVqMqdKQAGheSNLtEXcKvRyjyk+xKx2fQuGiOZz849Ee8E5z2IXdAoR2V8oQtGp
         yIUjriSPv8OmgjIrQlgmcCiAucN6xNcSyNzmwF9OXCuiT22tdp+ZeQ9nPohg+4KhGfDx
         rJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880912; x=1778485712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjyFKNamhl2YRgozU4m+NE99eK2Dsbk6otucrO0Xe6g=;
        b=khH+7vsXwvRbBVNMkdj6rbII9a/wMf1AZYyQ/b/dHB8eCYq5gTsEVcYiPxnSSKGBQY
         Q+92wQ+P6vdCpSbwQoig6n52qdYX82AJiadLqZv+FZqmoX4AXPLqpY298Tm8xsqevcNK
         biSYPt53jyvwHMek142UJ42StqDCVPJsEcYQnOCR9/2sLqoKXsKVEtnKt1JmGRtjBtRI
         S+GVv4dzR3M23BLasUigFbw3M6GrW5IMxpFA7w4vZJsCTr8cnrciXi9in828v8MmPrHB
         jDOI5O8Ir+ky3J4/RMzCPo0zKjF26ofhhTJaGQu8WEBk9UckONHH9REXw9r2M9pzNeRW
         HQew==
X-Forwarded-Encrypted: i=1; AFNElJ+TJDd8I0x/62IeRQix9OP3o7dUid2WwFAFWvSb2fCAcZ4Txn36t3/qtkZ/myxaGPgtoRKb1OjQN0Mw@vger.kernel.org
X-Gm-Message-State: AOJu0YzFyOBzoYYIBwmGvtJTLRGl3P04+IE/ov0uwW7wN53jMI9hEgEb
	D4vAmb8Owa6sefGtUGD+M2U/byb1/gh75Xt2HTz4CeIs74TBmNzllBUxPT5lesMWOidnqL3au52
	Ic5/sZodrJak3TH+RfDnTOtATKDcqI0FQpJJVINiJxG3ABU1P6NAq61NXdQaxdlRc
X-Gm-Gg: AeBDiet2kfvEuNppKGrg+I4x88glV/PPZGSSXr2CUKdWKlboiOLe7tXR4qvaR/0LEpF
	6Euo3t+ZG67XrUrv6WSyaRR7zvku7E4Sul6FL2R3Xcy0aFukoO5Lofgj3ejr18NgeWs9SCp/7Uf
	e6vwlNjTYd03FlKXIPsr0qXdXzN3grdxcRgKAxnkOHPEhazAFFgQHm6CJXDz34wAj8MFDgoqjc1
	X9I3w/PJaSwz02YYBCrdCOi6GZeTlVn0V/lDhaN7Qev79fk05+jkhAoSnJJNEQnOIj3Yyn6rzuJ
	/oziPvj6zLNfJfh/kwiJHjci2w0goLyRzwml6hru1hPQdQDLla7j+I85l359K8fw7tb7M86py/z
	PPbz8fxXMNNfYhDk4G2HcnsgEmj+5OKlG+ZA2s2EX5Ka5QPa4e4BuCk021vt2
X-Received: by 2002:a05:622a:5c08:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-5104be6e8damr125801571cf.13.1777880911719;
        Mon, 04 May 2026 00:48:31 -0700 (PDT)
X-Received: by 2002:a05:622a:5c08:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-5104be6e8damr125801411cf.13.1777880911239;
        Mon, 04 May 2026 00:48:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a516:9647:7dcc:c214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aaad6sm21119551f8f.28.2026.05.04.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:48:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mun Yew Tham <mun.yew.tham@intel.com>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] gpio: Use generic MMIO GPIO some more
Date: Mon,  4 May 2026 09:48:28 +0200
Message-ID: <177787999234.5206.3385187650055017560.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
References: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3EfFg-nKf700al9j3mc54a_YC3sx2G8p
X-Proofpoint-ORIG-GUID: 3EfFg-nKf700al9j3mc54a_YC3sx2G8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MyBTYWx0ZWRfX9xv2tBzSgn94
 S8/ku2wNewD9PdkkX7r91z717askxD1uvSAC7kSr3KodrISuP3z2mK0L2eZREWwZnUFqZf5dAvT
 B4E4biKO+kHUalxojET++Fo0c7FPdLtIuaaCwTqR39G6CssKWPdS158Me6Y9ktBymMorcPzJ0DG
 EaL9BJ3cAbWC3NX+iATF3jcraycpnqG1xWqA/+krAcN4qSIPNT7eBkmrs/NE5uF+C1al3m5I3AP
 9tT9ydjANHm1v4ddiDs8nDDtd3FptDMwNhBcVt7RPFP5kLcoTCwWxtGxDoHl2ftv/gHa0lzs6Hc
 4CdTNjxb9QflmQgEgsdW2yrlupcEglk15S2AgluvifpPivGWkh59sm2kuhgt3s5NX2GWaJIYn27
 9g6ftbHlUhKH9i1SIB0lk0FTp9MCUxSUe7ATuyBdL6g0JD3jpES3EylUlYqWUT6eSWxR1E706JX
 4XN3flsnE6FhTCGyobQ==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f84f50 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=U4GybYI3qZbNskGGaCwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040083
X-Rspamd-Queue-Id: 82AA94B99B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36016-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Mon, 27 Apr 2026 10:47:56 +0200, Linus Walleij wrote:
> I found that the Altera driver is easy to convert to
> use GPIO MMIO.
> 
> Only compile tested, I do not have this device.
> 
> 

Applied, thanks!

[1/3] gpio: devres: Use devres parent if undefined
      https://git.kernel.org/brgl/c/575d985581e9ef7a175b61d63c824e5dd1d47987
[2/3] gpio: altera: User gc helper variable
      https://git.kernel.org/brgl/c/9278928e0fc75b6b7d6fb85774c1966bed2bc365
[3/3] gpio: altera: Use generic MMIO GPIO
      https://git.kernel.org/brgl/c/6458c5db0d1515914a98eb1e833305a0b5b75175

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

