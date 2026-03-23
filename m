Return-Path: <linux-gpio+bounces-34004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNBSEbYPwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:02:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB72EF982
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E8703064E98
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C13876AB;
	Mon, 23 Mar 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBDYcwo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CK8/qQM8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFEB388365
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259787; cv=none; b=hvt0nSGwOVnGTLPOz6ht7/88oOZCTn1xAT9rTmxv75820XNLFimeSsfKi17jpRuXOe+Fu51AeFrqMXmEV9GhVOWzhSvNqDofSVxnou8gEm2rbJdy1fNJdhVM5R3KZznaytqH6EuyW1qWRWA1UeowFhivknh5Q6JAg2qPVS8x0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259787; c=relaxed/simple;
	bh=be9bYc8p9EIUnGdjIf69LDNuA5uavvc9sw3zZw5cDiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFEu5TRVVgGH0bpEZdgHu8Bb9B6BqZdQT+wF5dGffqaajBqGk0PFQO4J++N0ruf/B4UBlUZLYG1lhleh+UgyX0Lr5q99kAXbFQuKyaPUXLTsQSIHxwWIukI063Ulwg2W2dmYCI9qXQTYgoUQwBDZw4JN7bLH6k+WoQtUuM9222A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBDYcwo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK8/qQM8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71SuT949420
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0L4WkgdbL0ERVJyI8K4T4Krrj8ZxJ/wrVMo0PWvP3Gc=; b=SBDYcwo8Oz+S2wkK
	Rg+h+BeJmC0oG472ZkXGybeXzvSfoT1l7wLDl6Qhm+TadRzlv9bwpym6jjlrDOIo
	JW5Qe9ABGQTePMXtxDfFwqdxkXc7CXARd1mja6hi8UJyxz4lt1j9bFc+jKzmlqE9
	krbymC6H3qTRKYoPGdBrnv7qMQbPI1TLc9WimmL1S2QXsBVNnhvGU5Tm1SOYBQqk
	hTg7pi9k0UPTHg8oznS3nEI1FiO55vznIaNIqf7eVqHvpK1HIu+LpN22Z3UPvBrD
	ulV4Kr1uZ2NLFhL3u8RJOkTz5IsBrRkSyvS9KBiZ0hEmiz4893VIRuLEfG8Voa0T
	meJjLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcpxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so196077281cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259784; x=1774864584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L4WkgdbL0ERVJyI8K4T4Krrj8ZxJ/wrVMo0PWvP3Gc=;
        b=CK8/qQM85oC/uSk8znWyMDWwVOkv4oIRqJHVTBw0BStrnCqER/NZELFft7dVrYBAg1
         a55q9LOZya4ex6V9TrqaBMoB90am4QIY8hQ6gyDFUZPO7RyKRj0MAhURYvZZLhwYDYF0
         +1SYnjcRH5Di5xpGMYaZSeWhRtbNw/c9LPanDXlBg2jjROLHMqeAtzRZQio6JeSw0Y49
         iDmc1KnRlAIsZLJyqO0+kBbTVZR0JENIyBLnflSlPFmgx8nLApO5MarWNeqO87hAvqNY
         gMRfHP+nlOZigjpawRsxvGY79O2k0dKdY6ihimDoXb1sY4BfjlwoP091PS57p5vIu51P
         h7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259784; x=1774864584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L4WkgdbL0ERVJyI8K4T4Krrj8ZxJ/wrVMo0PWvP3Gc=;
        b=BUF4wl0cAN1eaKD5nXgGCNhz3ecrWbKS50O/eOrhzN6KV8xYoCWXcVtOE6OYuctiJU
         o+d2OgtRk+CCcqtpjczKwdS7kLn0DXggcSOMBuyKEoMeG1AUegmkxuc8RviB3HhOkwaV
         w/8lW0DxXJ4Sc+fD4pnAo6nqcLluasSvFBv7C7t35e+GugBXPTyWWqgafRIOzRMMYAiU
         D2kuXJspjnoLt5L0IfIpqDO/Pl0u5rvwjZi7CRai/s408qjyzd7002h6vUEm/6L9LWsF
         wIOXcRHWqY2B/FJ5kFhyzU305fBdomPjqNm0xpqKLF2P9E4EEgi9DbWJxw/vCT3oGHsN
         mSOg==
X-Gm-Message-State: AOJu0Yyy3BJaXFNzzrgJaxw7pEumUxi5PuUawydbc60t+cHlp0URJXGr
	DDlk/daEA4Uufl/Kd4M2btnHM1kgZgcpGDb2TITDPxMHxrYEqEvoefTendUBQ/VrOrjMeAzXvWN
	nIKsSINIX2/T1hCOtJPXM6SzLxEiaxE7q+IfibZUSruLEnbarVDt/FzPwuj9avvs2zIXHv54r
X-Gm-Gg: ATEYQzwDlR6F7A/F1i7cL8ag/GbKlSNEelAuV8WBnwEqTSfXFdwPKy6Z72KUcYW9eAP
	7kibbvrvxnYzPb6yPPHFqh9ablTMxbpoUybJxyIxrEn/6MjmqQivPrgIguxJ2E5xX/KQyjuvRnv
	JBcQ2nS5ZoPtqpEIAYEHINn+KDzJfRWLbjPB88T3WHOmWQVK/cH7qcizDpktwUMc9S5rYQMobBe
	0qkiXujwcCY2wIxdH4/EmdDbmPDQ2RwYfonOzVIXmtZkUCtDff0o629nNneQHYHC+AGZ1CUJ+uI
	JOYq25PuOZZOmGRY6hwGmkdUEFtkXKAXJIUPuQvAWkr1JNvegr/1T/JyZHKCGsV9GQX+JHpaW5h
	Tf2JB2s9+Z2yykXGZvsanb94hZoR0bN9A3YrLM9m1+Y5UWnElAw8=
X-Received: by 2002:a05:622a:8d17:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b3ef98021mr115749751cf.26.1774259784466;
        Mon, 23 Mar 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50b3ef98021mr115749651cf.26.1774259784077;
        Mon, 23 Mar 2026 02:56:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3688967a12.13.2026.03.23.02.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:56:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] gpio: dwapb: reduce allocation to single kzalloc
Date: Mon, 23 Mar 2026 10:56:19 +0100
Message-ID: <177425976891.21144.17113953246213685933.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320005338.30355-1-rosenp@gmail.com>
References: <20260320005338.30355-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10e49 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ek9T_fdv5d9Sg3W4T1sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: E3MHs2mUU8hWnUYNQnoiZjPGqYE5CAgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX6dYkhQ2U+8/g
 cnJ2cvJxTLg5Z+mBJ1910du4wXp/h2U4OKPxJUgS3LmzM+EIf0ygT6W/gTJTyBDCB0gb6pJcv4Z
 bDbdl4klix9ZJ7xvNsvjAw7pId+jPsBoEvArrs6HnlhTFqcGRTMTwoCN13AI//PcEU8x7RA1FLG
 xGxcW13Rxc/LIkkuki+zPG1PJRRh82ar8FIxsWAIZ/AVtYXvXMSIUBo5F4xfhk79t11RTNex6FI
 MjBg6HLfLsZrRcaMJFIjiNwohHQ3dSjNKLOomsp3H5wcZVk1cjApmo6/4TuoANvemOjuaH38BTn
 PXBqXadyx3PIIVw+GFww7I2yEW75u3M/S0Qo0g2waLErUO0ZMhffPDcY/sPfRhbqQs+DoDiFV43
 Y+z8IV3TqhIczFMG3Qels7ElJo0M67IZfQtNDUrFVwMhf7Sommlg7K55UWjxQOlHCDTRdxxu57x
 jr7Z3xtYe+vQZ/7sDCw==
X-Proofpoint-GUID: E3MHs2mUU8hWnUYNQnoiZjPGqYE5CAgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34004-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3AB72EF982
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 19 Mar 2026 17:53:38 -0700, Rosen Penev wrote:
> Instead of kzalloc + kcalloc, Combine the two using a flexible array
> member.
> 
> Allows using __counted_by for extra runtime analysis. Move counting
> variable to right after allocation as required by __counted_by.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: dwapb: reduce allocation to single kzalloc
      https://git.kernel.org/brgl/c/9a5bf2f53b76b1619c602f9e751fe4c0e64713ca

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

