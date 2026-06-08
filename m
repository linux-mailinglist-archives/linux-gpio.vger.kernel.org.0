Return-Path: <linux-gpio+bounces-38103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4DOMaDfJmqumAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB16580E6
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 17:28:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JQGvfYev;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A45CMZSX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38103-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38103-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1BDD30357BF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 15:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975F23CC7CE;
	Mon,  8 Jun 2026 14:48:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2333F374
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:48:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930105; cv=none; b=MdaK7+elQA2Rc6if8p/lNmxqltDlq9k3l7lKpCRT//7puxsZwY0QIpZdbs2s51yNv8RbYOFRywBCSdlSE8G2aY/spQnFvekvkbgVY08PcTGOckUqVZZrBXyfOYLmiHwx1Gp+kLUXennNHEIciNiPn+VywqnD+L7DTGmJvBC3e6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930105; c=relaxed/simple;
	bh=n0srL1bxl8I8dsRgZyqUR+yWo686PKwb7g+vwfSuypU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9q/gQ1N7Lwl+k3sDDHHBJ1PHOb7x9lZ0k4rrucPk3rIQibUWDyYZCbNrlFlM8ETb93nXVAEHnPr4lBSxcjTmWb8d1gThu5/YkedSoKJva/o7ixXKZjg1TL684x9AzjJpb00/d0EEQk9Tt4/Uvcb5uvJoTz/Pwl0c8bNIPVlTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQGvfYev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A45CMZSX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EY0FA3918025
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7poXal/lyYNxBO5LoEtWVVwJlkMbFkQqPQNIALZzRyY=; b=JQGvfYevRxwJen16
	BhfZ9X58sZP5FqsgCjRVhU15OnCksGG/K2b/XwSqUMhx7Gx7D93hXrwlnmJf35UI
	fJt191Ij9OmeTmqos3+O8OUqqfcgvExMaqSAY0nFEpSqoYTSrsw7BuIFkd8ZuTND
	d+u2wqdyaeTP+1sROfpEwvfpY5l4MsICZUQJ7lMpduyJsUtYfV57o3XZIPuu07eI
	wq+xAjnhBInywxOkkWETnTfGSg85XFsuqN9jcuwzBu/KPEQaQ2OKBE8c2UKaquBA
	zuBem+TLEreHIJnYj+kVS7cGDGugym/XvdgqB5HcCuaW3fgRS7AAH5DLPv6sHVeX
	DXd60g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8h9nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:48:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cf9627010bso5147283137.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780930102; x=1781534902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7poXal/lyYNxBO5LoEtWVVwJlkMbFkQqPQNIALZzRyY=;
        b=A45CMZSXF/mZKjePqZyCXXy14JmIEmk87jGWLhQKS/XMf1GTkwfZsgbgXUJdITcWPG
         TMxNco012/tSkri/JbsY2Z9tGhdj199QUiFogPteVVCoQtfNMFrKW0ucRS/Gpjqaw/hU
         eGPGXiJz9jaoXp+kacRtYnr2F+1biu6TvczFpsBHn1B/QKZ5KycetX6ylCScZKkPJFzy
         4vYIKFHtvx5RfQbgErn0J3HGi+KUWBWGuAEAEMJ4nnCOvCU7xClyQym5paDVUhxto/D2
         sKnDHtslYd47HCn7s64LBXFy1bCP3ekaXhxm5OLtzGF4Ac02Ojzh/Tgh0Df1sjCOuuBX
         TUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930102; x=1781534902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7poXal/lyYNxBO5LoEtWVVwJlkMbFkQqPQNIALZzRyY=;
        b=RhR729GX5gFg1nxQVk9shJRJuEKriAUHavsP0B8SdhMe2e+TtQpwxYfUWBYPR4b4/W
         kjG4dOqBDltXjKOAoAtCP/gAhJEs8iGPWCyhE/wWn5RD1gmh1TlAOcNP8SEujm1d//iL
         0q+NvYWP3oOHFymRSIKhPVt2E7gqRauj4gN5KrCMgY4bk50BrfgLW63/oxBIjGFcgLNF
         Z+LhRrJzobvu4F6jiH0x7wxAC85JAuiGcA21N4qVbrRSKmX4cb7T4PT1ieJ2i3qI7B0p
         5wDOOQ0UKoS5el935/x84JtueS8xmaHCO3qcZaTPG/T5E/Tw3j2EabirZW3ZiH+iTVH4
         xpHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KiahfZ9Q/ttugxDuLJaF8ZKCYbDpYPWuhp08A9qmmAbY+9FQk/jwps6jpXpsbD9KYhTDKgyMe42yD@vger.kernel.org
X-Gm-Message-State: AOJu0YwNo/r0srq7v/lk+IsQ3ZLRTmUp5jsjso/8QTpMRJtif2C59+iP
	wIDeMIu9Dkg0mKH44JLPTxoGDvjP9dVgKimi2qcZGEbvh6Mv8vujiDUww7PNQa48kBXxDaSxF4Z
	vSZzCh38np5n/qLqI81gbdH9GeeavAMO48VCcPHhCjEIbp8bTlW9Zy0E90fCbQvsY
X-Gm-Gg: Acq92OHSPmOpj4ZsrtEStlvqNjhzm1X1/XqPVOli/NGvYGaADRjP8sn0WsX1UFsYsZN
	3SGw6+xTdKDQEyBrYVG/OxZMoud+hxk0aNCUmdeDf/3gm4A+d3AeX/o7KvlePoqlBjMZWe0e8h7
	5ia45EvmPmMQND4mPJ3rlfkVrL41Sw/1K6GJZPV3zTdiGhFg1BFPMKKtM1b/613cf00kqxun6eI
	mcWUAlhWASuNI/SaB22oUKwle53FwHUMNcx6TqLW1ZHmve6qkSgXPQ065KkU/FYza/WgFlzhZyt
	9jPyN5LO4DboD+d4IwXqB1JwPFWYWJe/DGoRTMTaLa4kMY3hGhItD8tBGTEQMmDmZR0vSduD/p/
	M+LuAPxB25beOZN7F5NOwjbK0DSn3av+4sPuNd3DLtW7FH7SnnqAGQvy3CCuE
X-Received: by 2002:a05:6102:148f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6fef90c8483mr8272233137.14.1780930102408;
        Mon, 08 Jun 2026 07:48:22 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-6fef90c8483mr8272198137.14.1780930101956;
        Mon, 08 Jun 2026 07:48:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm462705665e9.1.2026.06.08.07.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:48:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 16:47:50 +0200
Subject: [PATCH libgpiod 2/5] core: edge-event: return 0 when zero events
 are requested
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-more-pre-2-3-fixes-v1-2-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0srL1bxl8I8dsRgZyqUR+yWo686PKwb7g+vwfSuypU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqJtYphM+IaoZUQf/x9bHcfm0S9rqlAu/cgeBya
 0YVD1vAMq2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaibWKQAKCRAFnS7L/zaE
 w5AnEACWfojaik89XGWTePR3/bO04MrpzU81hG7m63+Wofs9PAD+ZmuGk7XXtR0qVLgYeBP5qB3
 fpHXI7ZVqq3ZqCJLmxAgsjxBPNEqo9IyKSnj73BDPwS+D9wS6HcJsyyiGeGvHhBgIp0h3GaYelL
 bgMIIaWIhTcgekZ1Kynf0l3oPfVvQGdFoXFDE65utjLcMiWIestDhS2+M+/YGMr15q4AFWnKMTg
 M/LRnFzbZrgKQIRmcL9LdGPcJsSUOrW3p7LIrxViEfuicXWFn2MavZqG3OiwEoS4hwIarm8n+vv
 HAbyWgW1LLM8bLrVbJXk7fzj8ju0WLPyPVGHGggfqI2T1oe2Y969HcNT/mdhPbMOCDSc7mJCw45
 eGqhp/UIeOPPmRy9gzGniWaWJVO8nGzqXUiHDyx28vjPoE1FNJiom0clrO8HL6c4eCcLQQ0tF3q
 KYF+9kilo2CbMHePSe7txL6j0RA48oAdaWPl+gjur8fyWIisHtf0KFkEILXk9eMp8JawB8iuGz0
 Bws9hIEp3cj2ANxV1fWxFBnT77ikwPph3oFpRoTJ6nHt1diJ5DIpa2D+iS0hpKpOffWY/4g8TNQ
 3PjtJRrs7JZGEMFJscQIJds13be+QnxTrqJpGbq5vSr+/WHXVUPFYv/pC2P/NqMcoSDOAdkHQJ7
 DFqsxVLa3+w0zjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE0MSBTYWx0ZWRfX0crUIKktG93J
 9W8AA9PKGczCjx9IdID8XJmHe5+hxtXX00U245Ga8h1PV7Rouym7mcabgkb++QY4eW2V75LVsfA
 e/WXnrvCVCJjxUjWKDbWPfTlBF+65IQSO+j/IPU7nnbhFRxFYfQnuOSevlDyvcdJnJBTWtSklbh
 NnHZaXy49RgJg5AgUARyHCXWUQjFpKEhNIC5dP1saWiNV8wbSWopO5K4NUFKBLkV62Kp5rvD1sM
 FzciYBznSFRC83zDZEkQwFArzeSbQoQ40Jj4tnDs9V32DbhD3V9GOZn/cp19KRUXkcd4Y8ETWPF
 Uoal3QnZhyaVngwumMfVu6fDgKy/7d7cuK+MGNrNRlel/+otYibTFiUC6t4nYapZtv0sPJgPGmJ
 ivNq89q8efKc8hH6diYCZgpJ1tp8kfkSnc0OzhyG0PuhMx27EadmFhnKwRUnb4GkSp/UihzFIbO
 0DPY4hBpxDSIg1h8PCw==
X-Proofpoint-ORIG-GUID: E20RZMsGzz3jTWWRX6LjKcp5W4MqD9SH
X-Proofpoint-GUID: E20RZMsGzz3jTWWRX6LjKcp5W4MqD9SH
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26d637 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oJcjrG6XGBdKmj5y9ZIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38103-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACEB16580E6

gpiod_edge_event_buffer_read_fd() is documented to read at most
max_events events and to return the number of events read. When called
with max_events == 0 it nonetheless issued a read() for 0 bytes, which
returns 0, and the subsequent short-read check
((unsigned int)rd < sizeof(*event_data)) then treated this as an I/O
error, setting errno to EIO and returning -1.

Requesting zero events is not an error - it is a no-op that reads
nothing. Handle it explicitly by clearing num_events and returning 0
before attempting the read.

Add a test case verifying the behavior.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Opus 4.8
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/edge-event.c         |  5 +++++
 tests/tests-edge-event.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/lib/edge-event.c b/lib/edge-event.c
index 8ec355fd59a280936ae348dfb6e418189f865153..be46dcecedd7ccc8dfd1d285724db7e38c2e64a2 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -184,6 +184,11 @@ int gpiod_edge_event_buffer_read_fd(int fd,
 	if (max_events > buffer->capacity)
 		max_events = buffer->capacity;
 
+	if (max_events == 0) {
+		buffer->num_events = 0;
+		return 0;
+	}
+
 	rd = read(fd, buffer->event_data,
 		  max_events * sizeof(*buffer->event_data));
 	if (rd < 0) {
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 6389455763ed4ee2215de6409d1b042169776902..6c7ce20ff81605e53a7e929f5591b9a3b43650ed 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -613,6 +613,41 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 	gpiod_test_return_if_failed();
 }
 
+GPIOD_TEST_CASE(reading_zero_events_is_a_noop)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+	g_usleep(500);
+
+	ret = gpiod_line_request_read_edge_events(request, buffer, 0);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 0);
+}
+
 GPIOD_TEST_CASE(null_buffer)
 {
 	static const guint offset = 2;

-- 
2.47.3


