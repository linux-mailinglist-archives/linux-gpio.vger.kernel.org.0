Return-Path: <linux-gpio+bounces-37789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB66DAyMHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:53:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E979629F3B
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30E5D30AC030
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAF63438BA;
	Tue,  2 Jun 2026 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGVOMOho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwemgZTp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892D30E835
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385874; cv=none; b=CE+MG3M1vQ5O55J0UwT4aWKwzqOBgTN4jse9advlr+466qlPSFfkadOVkC+zW+lcc7wq2DlE6awM9HHNElwyP9wgWfYv4R86hn4J4lQX2Ei8SZo9Fjv7r2BGzqfkE+MBMrMsKBZ6qznRuv/Rh1T44up1u4ndLNdpwtdE63PEDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385874; c=relaxed/simple;
	bh=7T96GY4vLWoqnk/rZr0YlWtoc4z4LmunVo6IOALGzfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=My/Gnb4bWgH0bXToPhAwopx8kkieTr/i34OppQqGbAG7eJ8EbKgBP3Fvs8ceRkhri49NXXQdzEDwZZ2DP5rEbQmCpklWgx0f+7NmeJix52YjVb5Hx/TCs7hfOnxyV+2AprNiqoSgJ6ZJrV7Wuq/DPx9vzECQHZ2QA9hfQ1S4F8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGVOMOho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwemgZTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524HAxY600130
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 07:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQteL4GymQQi056ljyOeH68uFyWclPYUAElQF/0qOxs=; b=hGVOMOho1dwYQzTZ
	eY3fA3QY0nEI4/NQ2ceITj/RpbTcMy0mUCW4iXBj/9r9pU11aPtQnYPKZpmqrybQ
	1Z6Julvn2psbmop6UW1GwwZsV1HUwOivjZdoNarvwnAdcP1BVL32LOOV+aqdoTXF
	tCtHP3kwSCK2PD4LZ39WnGhetq9EuAqjiMILgonSdfSyX/KaVbN/uzpznnY3XY0E
	MSGecE5yMkf702qHA4l7rInMRBP8SgDeern1oj+yvkDAY+35wPNwIg/TaZU/McrG
	YoDRnt1LrNi5pihpScoxfu/Z4Eb7TTsctpulcnnS8XiIr1VWgBV24HfP0kVKDLjY
	nGxU0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8rccxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:37:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d38bfe83so232635261cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780385870; x=1780990670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQteL4GymQQi056ljyOeH68uFyWclPYUAElQF/0qOxs=;
        b=GwemgZTpBh5mHGwpv6CcUPpOOYu4X2vkSjrKXEk5xBBjQFG5m3Exczd5VqAuM1uO6A
         ajyPV+UQIe/zmuT+auhQr6TZ4vJ0mtUeDh33COTvntSt2OnD83iX+8diAJpC4Evy2DRT
         i43fxfcEXC9QA55SE6h+wOM0jEDCgWiUKOD7ERv+K4Z8AGLtasD+uI/U8DaGGUVxpn49
         uVZKUS6oA7fSa3XeMe2pGDkmIdEQEy2QQvgHxcF5vy2fdjeZCKkXK1wXdRCHrYlPRe5S
         5p5RP+4MOvw9qKJQWU6BDD0NSnwnpQeCuMZcG37lUvmcyZBBJ6j2SQetOJm104wgbMth
         H2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385870; x=1780990670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQteL4GymQQi056ljyOeH68uFyWclPYUAElQF/0qOxs=;
        b=dErUCdxP9Jb7OV9aznkEj0yivWSxQX6hjLkY1lBsZ36ejyFv03QQApUkirwDTa8oo9
         mIjP0VdU4FnsxQngsYPiMuHLAt4jSEPWhFIM296wXjzDWi9mRcgyx3QoKxSUL4omdstu
         us0w+GXmr5y/ZmXKYBRPGkVwxkgVa9UId8qpOxQNi16URN0QLW2t7yT4cd/PhI6uu8ap
         fVugT9h22I+unROqEyQ3YWQIbe0+U2eEnPKLCXUzPRcgoKK6JB0peJzT94LH/uHEqnhj
         C5IibTpq0tyLul5eBYna6WFMiEy60uwuzHZ7jtO2rdY4U1xXUOKv0QJF1xSld/B+apy3
         4zGw==
X-Forwarded-Encrypted: i=1; AFNElJ8AZDt+kVKBmYVnLb1lNveHbMaBCSFSwzZH8NGJzdOrync8HetXfKqEBmi0gf9LTZ8o+pFnj3ej3or8@vger.kernel.org
X-Gm-Message-State: AOJu0YzfwTA5HFd6UneoJ8k2QkEIB36IhOaRU9nlP30N0Ev7b2dPqLvU
	iwXZYS5Gd0fSH0xBPcUDWRJVl5ZJPxEMwzaYLU1c/E3jjr16C2MQ0BqbPT+LNM7eKth3YgPT139
	oQmZ5sTyvQpZlDfrURYB38GzhDiMPCLOV81vCChCZEFlkLF4SClCQK+/DZGLw87zvBlRiukjl
X-Gm-Gg: Acq92OG2vfKvsEOmAfetdVF/v/7PY2r1N+Mf2o3wq9S6i7NAGtYt0ovX+jhCHOM/efq
	ied69Fw/EyDDxXzA0f76XxB0yR6PhIMmx15xzF9KVZ4IXNf1BAc7mz6FIgg8Fu1MzMYoLdwT/jv
	dMUeSmzcpsqo56jKxeS6Laz9eq1UD7eb+Ll+IRuH8+T2EYaru79QbES8r9wZd3rdVC+iquzbTHD
	kahYLy1ETFEr35TSn83AloKkaVcmqaoFK7EiuBqLnAhqdnqtj5AF+M7lEeOfHmHHbBDvAN07fGq
	OFREkiz8ft6iCatKwgaokJnGmR8iDTlL4/QFnpeEzxz3/O6OPuW59LD83FDxDqdepX1zxSn8NWa
	pYc+WLK+o/9gOy9M3LLyC7ksw5mPc5pQO/3RbMdt+OmSw1d5OubLPRXRCp8WATC8twS9ttbM0MN
	4ao6CZB8nlSIG3LQ==
X-Received: by 2002:ac8:5d8c:0:b0:516:f4f7:3315 with SMTP id d75a77b69052e-5173a9c2419mr198402861cf.57.1780385869892;
        Tue, 02 Jun 2026 00:37:49 -0700 (PDT)
X-Received: by 2002:ac8:5d8c:0:b0:516:f4f7:3315 with SMTP id d75a77b69052e-5173a9c2419mr198402651cf.57.1780385869503;
        Tue, 02 Jun 2026 00:37:49 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm45994245e9.6.2026.06.02.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:37:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:37:19 +0200
Subject: [PATCH 8/9] bindings: rust: avoid potential panic in
 gpiochip_devices()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pre-2-3-fixes-v1-8-9432002bce8e@oss.qualcomm.com>
References: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
In-Reply-To: <20260602-pre-2-3-fixes-v1-0-9432002bce8e@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7T96GY4vLWoqnk/rZr0YlWtoc4z4LmunVo6IOALGzfg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqHog+CDHdsTH8+HiY74n6bchnv59e/4+u0WWDV
 +nZPPtg+Y6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCah6IPgAKCRAFnS7L/zaE
 w2+cEACfe8gSL9E0raHuG/qT96Ge5wTr4yOzASEptjq99eHUhaA0rgnECjUIexgdLbTKXgjUCK8
 GLroL70Cg2vOOj52ROazwiqjZVUCkaOK8/BP32JbA1onkrBKACZTPVFeORLCMTC+EWgCvTLhIFC
 UyuhsEkzavXqVSwyX2NBjP7G2LuZqni0BM0/rfOkUjm/Nr+R0I+NWubTPvkHINUt+NXS/AJLBuZ
 zEQdfEBUL3M88r4QzGmQKgamQwnKzfIHpT4qDLcAbKaQTDXHN7Qj5q6h5gtJVMkf91U2eeyKGgX
 eI7oZfeNzb6WGPjVHq635wiOh0v/4jBCsDFS6C2Op8/N+JOR8KPwsi4yFbmM6d5Vwgtx85zuedm
 7veKELZ4QnsHL4rEYAbSGeMqm3kr6ta7OJi79ssCvH0hUrL40oHvmjudx6IJDZHAEHOKW7/Dkxe
 0UDIDKdoNB4vgF+rQNj1v6E+wQkauDwG1TJ9EqTBpK2V45KEEUTDWyO95qRI1H8vHWEY/aiyUXw
 E52x/cQBJMsQ2Ywm/uVEVSshW17V15TFByEppVF1edjBtZmvFFOWIdPIHFbKqIStsDS+6YR0qha
 tzxB9KL1BTiuqnwIJ60xTnUQhmQaz74s0Z4XHUYQedF4v+A/8ZVKtrymbcJkWSlD4/c1vcDZwK/
 +I7ZcR4quoUdlhg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1e884e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Mtn3F3aGPLR69FP4vvEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3g9K_upsAzigLbijEe2eUDYre461sOSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MCBTYWx0ZWRfX8B8yNt/7iZyW
 PITVj8JV19/8rkGocbZB7Xzx0Ha+hOG79vefnG34qjoT+0S5qahwP7s83NMVjkxhXJp7y+yyqsw
 GPcJutIs30D7RBph9z5CbDXIIl5Rs929C2q6tX8SZafzcMnumKcYmttnNyNPhfxy2MRVUrLOTjC
 Kr66hVcBTxP7SgTQ3W+GMpj82y3KqWbJavYk7OcWyzeP2vmt8ZqpFYoa/2eMXNnuaV24+TAeUQV
 hKHY47SCV0QrB3PE+LHo7dg8zLNBJ1pYJSzR4mXRpTHd7ifiv7bLVt1HYhLsW3ZgBUZApPWnz13
 cL14N+2TqmX+2k0ew9UtBl+wfwauryoqW9H5mmYFUn7AaL+TnN79C5MORu9VFjljsPPDdEQoQFG
 5BicUR6qupBbyb+VypOtpntsqa61AaFh+EhKL+Au8ucRvlMs8CmyZ+r/lvGFZVSdolXbIAIggZP
 7s+6nnL2o5N8F1tMYoQ==
X-Proofpoint-ORIG-GUID: 3g9K_upsAzigLbijEe2eUDYre461sOSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37789-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E979629F3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

chip::Info::partial_cmp() returns None when either chip name cannot be
decoded as UTF-8. Passing that None straight to unwrap() in
gpiochip_devices() would panic at runtime. Use unwrap_or(Ordering::Equal)
so that chips with undecodable names are treated as equal rather than
causing a panic.

Fixes: 91f9373c6558 ("bindings: rust: Add libgpiod crate")
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/rust/libgpiod/src/lib.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index aacc82e79dc77f9563d90adaf5fcffeb86ce690b..22a3b87975318713d0fffd5a3e4fed214e984044 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -12,6 +12,7 @@
 //! The API is logically split into several parts such as: GPIO chip & line
 //! operators, GPIO events handling etc.
 
+use std::cmp::Ordering;
 use std::ffi::CStr;
 use std::fs;
 use std::os::raw::c_char;
@@ -491,7 +492,7 @@ pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
         }
     }
 
-    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap());
+    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(Ordering::Equal));
     devices.dedup_by(|a, b| a.1.eq(&b.1));
 
     Ok(devices.into_iter().map(|a| a.0).collect())

-- 
2.47.3


