Return-Path: <linux-gpio+bounces-37562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFFuK7ioFmrEoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:18:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863D5E0F58
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0840D30154AA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81D93D6CB6;
	Wed, 27 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aex/DVH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPxkriq/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFD3B5E15
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869873; cv=none; b=Um9f/esS+uqPDdINLjfx+lDXnld4VEcw3RIylzKao7IRFIdfF4EW5Onshk8aXYvbBJNSWOwTBGj/W6xurxmCNKxg4lz0/l8jEk1l3RSPpSNslS8c9eIBI+oF8j0ld9Bf1474onQFH8z/fPwjIbOLNPnwEn5JVLhQ2ZnB2qC2xhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869873; c=relaxed/simple;
	bh=Fc3yvhFubxiHMiXXS4ewmdA8fb+AbChFhfEfh7qFQxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ov8eRsEsvTuAKV9Og06mDeC6mjI8gGbc9rKtC6Y5vCe2ZVJfMJRAignHkH6KqFOqU2jIQpvfEl4rR+hcPpAhLVWwuVVTK0CrWnT1Aea0uU3NRUROFupCUxm3csl3uBdl+MaSGYCgs3iNXr7ehLpQ4Fg6zBiqDYPFxz3y7C4kKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aex/DVH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPxkriq/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8Bt9e795668
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=; b=Aex/DVH7ew19a7yk
	wurAUeH3Z/oh4Bo4Yyb45HQqBXrRxanPWx6IuePC3tMxxxmjX0/uTsjhl51TYbih
	O9XHAL6G6uqKQwmrTtAOk1KRVwGfBUMhQPVuOEJ8MAVU8bhoMZmVN8xzgCZ73n4a
	Ywc5N3YkmJoWZUUlHAkJUYEjGqP+fANeQNQ1kS39Rvx+zps6BrviafLvpFPrwSmw
	TWvNQCeeFjs2+9NgCfTvcPBQFHzQbsVQuWWZqfC1A7SY5Bw2pA9nm7mtYwVfZxXk
	aU+xrOC4fpXWFl9jfpG9eeUuTBMV2lrfcF3RB3j3b6v5f3RLRPyIBvVz3q4VeCQp
	z3twjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqr0wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:17:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516e0846095so74616291cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779869866; x=1780474666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=;
        b=UPxkriq/a0lsd7+um+SXqmAXaEhHUy8BQ38mExI2pOJNom1bXYIw1thI44zY50lC+8
         E3fVKVQjlfd5UppH9DaMzw9oksbKV8roTwje+KHTPX6hJWE8/ZgMlOKpFsbscQaOeTzE
         bVfhrBI2xLMn0QzcWwU+VekRy8IV72rwAadxI0JuTL3nFKJRayFy4LPOD9Zos96hoNVo
         3KeWYD0KYNDO2t+o3f4f92SwWkCYhcmG7VKVEQzUWUFg4e7Mt0qzTbKcI2ibvJuNzYSU
         NY66dSHcrZF9LIR4r3clH4mcZNStykZ+gWPQYElrGItGILpFJQw+2xVqeZkmMoY1fc3M
         12rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869866; x=1780474666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlDTUSZSL9yEYzzXWBCrB8EeTzg12q8rDn+nYTVfQ90=;
        b=D9hPFiO+VWCDO1qURk+65QTdLpSNtOFVXpycIrfexshdJv19Hj5Z/3qWyi5OBeRnk3
         FDGjPHWh/kdOWtqiDeQ+myf6OqkDAsxIjYyNerg2+HMROgpjGjkEfE+It8IijqjtnD/M
         78eML8dbaiozegYnIEIkkXu6++ykiDMlmiR7ct+OUd7y7QndyBHvL5tCpsyF1lO9SloA
         dDOD79XmJT6wN9u4QwbIsw9pmnx3/WvhcJI0jDzRdGV0Lmq0Y8vIpqb5cua4nfi/4TcT
         UIkfOVMplL6JMMcnTcueOWG72FKCFm97kxpIjUxCCi3lQCdwIKjZhxDf8FNkJiNXS+e0
         srMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UWHcJILx/IUSrfTI0MR1GBnjW5xulwrvcinhINL89v4EXmWAWXAY/cYpQ0EM22FQSBun8dlkqtd6K@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsdZv0/YOHmCoBtbKvNIY6Dbv8xd+Uns1md/5xz9w+8QkV6Tv
	IR5/pQHJrSnn/ArQSdavLDp0RJQL6BfRnKN4eLVv0qf2vi33U/gyXunEm7BT81vk46jErXeErEk
	1Mk45Mf+RggzqK72r1BaknkKhsKAXDGam+r1HeMov96GmJxv1BuYv+ZZC7V1rCn99
X-Gm-Gg: Acq92OHLHc1WSuWxiohfppGjcmzI5gk8bX1hNf6kgEJPDbl5248J3Ykw/SbyRyj7+pv
	GJYDGhtgGQ7bfeSJwwTAPVI+KyamCgYfC959+gfmLhplQZlblIwwi4+Pn7BiuAoX3n8yn04xCva
	DKwVg1d+QKoaS1GkkcUU4hM674kPIj8MNuhjz/bXYAGzLD1uZIQCyTiljWVYlznVJZ+9L23leH1
	gdq3zEC99+1tPzq+gQUG3eDeb/7tUY+xnRkup5FZh5YZXOX1WAYrAtso6simXH3UO6ED0wwoh+3
	zSMjeRf0irsMjtnmcKbzP2sTcF6Q0a5u/tbW5AlMiYqet4QRpPzbWPxDyGc/yXGnMowaor4Oj+r
	vF9ufC8P9F/wtVOUmw0DnNKF3H+/wfc2CEKC374NgzvKSH3mBttqeEeHU7y5N4Yp4cV+RLEdcTA
	bpPzNn4/3FFCDf0zX9A2HeP/bhLo2txzG9olc3pI8=
X-Received: by 2002:a05:622a:8588:b0:50f:de06:45e2 with SMTP id d75a77b69052e-516d436f402mr240966641cf.31.1779869866423;
        Wed, 27 May 2026 01:17:46 -0700 (PDT)
X-Received: by 2002:a05:622a:8588:b0:50f:de06:45e2 with SMTP id d75a77b69052e-516d436f402mr240966461cf.31.1779869865924;
        Wed, 27 May 2026 01:17:45 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm403458845e9.13.2026.05.27.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:17:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        heiko@sntech.de, linusw@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Wed, 27 May 2026 10:17:42 +0200
Message-ID: <177986985872.16795.8547602828633072606.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526171050.12785-1-scardracs@disroot.org>
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com> <20260526171050.12785-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3OSBTYWx0ZWRfX/qrZonWrJ5ey
 qrWkAeOqL2pAkxYUr2S0DYLYGRLmQqIgvOQ8Q/+J39ySEAeuGupkfAVkKfHyjuZgcP+AnhPL8kq
 PEvf3lR68QA0Xs1ePDt24kTb8tAwQleAUvaNUCdnTjNz/dBBaC0WsJYTKzozLBjHtd2Qjast26w
 Q3MKEpjrWXijD143ly7dOlqE3otSBW06YrcT4nj7IufU84F+riImlaZRbJ8sliFcfWHnzM7AzYO
 VPHgMyRaGY87B5OrHljEweqQA6R27fHcLbr5t620j0EirGloeaFK8Dw6jRwhF7+6qTn4ccYbIe1
 bTv+Q60julYPaUq3szMZzTN7tJ2ywWGezbRicq6bN52ebHMAxh5MrDui5QYAkCeSSWqZl0UDhjj
 oqoKNU4jHwBmgrB5P70TswxQTaFX5VTGJn3hRTE/wnpu+pivfIkhn157HU+i8AzgUG9Yad0Lq5g
 RBCwWPrxsdz0OL7nGMw==
X-Proofpoint-GUID: 1JK27Xh6UJ-cJD4Er-HFkF21Wj1TkRGx
X-Proofpoint-ORIG-GUID: 1JK27Xh6UJ-cJD4Er-HFkF21Wj1TkRGx
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16a8ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-TlZYsTrXPYVLYuQEvMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37562-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2863D5E0F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 26 May 2026 19:02:44 +0200, Marco Scardovi wrote:
> thank you for the review on the first version of this series.
> 
> TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
>        and they don't expose a separate debounce clock in hardware.
> 
> Regarding your question: existing DTBs currently do not provide clock-names
> for these GPIO nodes and instead rely on positional clock ordering.
> 
> [...]

Applied, thanks!

[1/2] gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
      https://git.kernel.org/brgl/c/d4573b270d934c35eb77fc348866384fcb4e8eeb
[2/2] gpio: rockchip: teardown bugs and resource leaks
      https://git.kernel.org/brgl/c/9c95f4b920e15c183ebbb15b0a011ba32fcb6d59

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

