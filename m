Return-Path: <linux-gpio+bounces-34774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOA0GnPg1GmZyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:46:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DE3AD21C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D73C3035650
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E993A6B84;
	Tue,  7 Apr 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCIgdh9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9OyqBE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7A3A9002
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558658; cv=none; b=V5S0XEjldCn2/y4szz2mZdVBcIWM4eNHl8nj69n9ALFr4/9dULUmUpebr3zFtI0c2xfeVBrvtvTptXXrRv1UuQ9aO8pd0NU72XiocFSEMwos2Ov/stbY2oth7fzRSj3GW1qgz2P59g42OIPu9Rg4OMmMNzxf51jKyosB3HejAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558658; c=relaxed/simple;
	bh=d0pbvC8FbKhJxaqA6PAMEfPsLcTcK2mqn4YEziMpM/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EInqUvVwR3B3qJ7hfHbK/q0sXvG2YcSIfcprWgTeXPf+OfVVkvfOWqof0DAT4hW90i3j6JvbsKpFhgKzcWBR4ugPzrFp9R++z2aY1dE2j6nagyE/wyUM6ewSMpk86/OFdFb57lQSbPbDbWpHlQ8bAIeGuqlTlOBaCYRSRmMtrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCIgdh9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9OyqBE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gd9o1584423
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=; b=XCIgdh9oFtxN7f1n
	I19F2JvWqML+rxALbWWVYKa5IiAGMYBIRxNKNITPkOKUFHYJT/tPe4xU/qUQoLHm
	VWdKipioX4MB1spbfXtkuVRQC0yGU+dg96sUn1ECEZs3oSZFiGptER4Ir6pPTIYp
	IXrUjkNHCcWczP0XP5FKbRlDqp8xx7gz9NWg8ZtHyjUeYry+COV6tIbb5F8Uv7IF
	qOvEBZcLeqtMCahQBwYkmjU/HdQSppCsrGz83VMxjH7zsje10Yhh1iAzPUXcHi89
	c1fT+xoY1SOB17kLHT68COGckrU9wmheSILI33772cCeW3wPlHoRrStM2MwSmhkR
	BquH0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tb89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:44:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso153591321cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558656; x=1776163456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=;
        b=X9OyqBE+LdYhOYbHGoPqrZK/Kn2qaHHn8sQsOY3GCa4V5WGvh1vECBojgZayAUOuxq
         6Mw89dVmiGGD4C307cQ808NRLXFM033Tn7HRp8ORGRQNmUuPJjp16m6dHb3NRHONYxF0
         s8JK3nGEi2SEbt+lBMHY98k6CTeH69L1V0bzDrPgF43fS1KOjlPwF3jqkYb+L1q4H0Gu
         hmSZGiJz0vrXQs8eAfFpxi8kQxohlEBV0I0tmSBDR/0Wtg3Y50T6a8ysz7jo8++wRbLm
         qYf8Lc+89DIhsjIhnq6pRhDuN0i66515atQlrQnR/CUM1HjsjYFiGiuB4D53cDO/AuGr
         ZaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558656; x=1776163456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTD9t1hqbigzxlJevaxElhmdnO0mTNhhl2ZNJMUVdTo=;
        b=e+/OeS47OVEKA2TaTB7L88POWFO0NvKzDxmI+Byha2QAjqaylkdPCv7Lq67nM+SxaH
         wmhCkeTmk3rDvoycog9LWEqYE01z18wfVbXDXmN/IA/mALJC3e5WDiAhZFY/GREGL4Yw
         UY1A0RIRP+A3k1N90vVRweV1cMNj1hoQpzhhqCc6FJ5hJHsMHdif49e87mPCDTniMSGF
         FN2Tzovsp8RAXlmoeMpts6bQ7MtK3SKFObko7mX6pV8oZXGSZe8bV/4KCuTpC+9FUDRT
         5fNMuMGFHcdlY9h7+0q3/6VO4vyg3G2N3omCytWeKe8NND1VAlRFLHgwv92sK6aB0tNz
         hodw==
X-Forwarded-Encrypted: i=1; AJvYcCX1cSxrs2LtTDgGqLh2aIKpMWnazMMVU3/8KCCCaKO7szojo8ytPum8r/1oSY1IYl3g+9L5R151oELx@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLfvKn/Xxs7i8xKCFjDIgTGMmJ12O3h6/CNXjsFGWoM7S9ndy
	Ry79Z+AE2tJIXl30dAeNIMh4pFVnEorbvr9UevlgwB7Yg9FULe5qpKk5VqcVnex/po/NJ1MHb0G
	Msc1OtlOTDY6S2tO+1mE2/udos87RwEp1J+T2VMf892thaT2OIUX2165LRqGCe751
X-Gm-Gg: AeBDievwqxAlC8gZH0UHrdzXLOGyBBF9bnSatIyVdjKC+MZt7/2QkkxSYy6VDqMqovQ
	BLHe2kOEFI7J2GVo2vp8Ia+AEfGC7aOpjYls2qru+lvS0HXqdbHeXq4JQ7CquQgLmSPmYaZF0tw
	TcJqFegvT/g0YysIFe36nOCuN+JXm+WD5MQDjxSF7xlL57INm5m56fO/Bkw3tjkq9fPuGg7JkGv
	7x1On9S0USSDCJeyNJcj/dOKTWFH3vfEL6b+BKFNcvEm5xCiAWjIH3Wea+KprbMco5sz932v6T+
	MbcIyLiahttWNtRAFnFXNA0Bu0o/m7wbOADcpbLioXmA/KvtZspYPP4B8jjOsmlSG49qDfkcKid
	mFXdUJjdWYGTbed7LJxnIzgw+r7DN7f7uUfRBMryZJnX/WQlszg==
X-Received: by 2002:a05:622a:1103:b0:509:1045:efd0 with SMTP id d75a77b69052e-50d62a82b33mr246737581cf.33.1775558655690;
        Tue, 07 Apr 2026 03:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1103:b0:509:1045:efd0 with SMTP id d75a77b69052e-50d62a82b33mr246737201cf.33.1775558655192;
        Tue, 07 Apr 2026 03:44:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm64902885e9.3.2026.04.07.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:44:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au, Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: fix unsigned long int declaration
Date: Tue,  7 Apr 2026 12:44:05 +0200
Message-ID: <177555863870.54615.7184296575672654167.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
References: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e000 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_L-z-rN-aJSQ1DoVdMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX9Uttxl1nwHhl
 U+qtVT+9OG69hFOFECcz4Sz574cfsbBbDu9fPhhyHXPYomOBDzNsR8/BU5960cpM1EMAbSWqqey
 D1KCHRyfVfy8RVNL5LZGEvcC62zS6/GplWUmdosBLCVIhpLLJEbwd4SYqNUKK8VMPJ+T9RsDw9f
 9W0+ifB09vQRSLG/ZPgoRBZzLuvBQafu+4IlTP/ZUGg99UO5B7VPEbWPyyHGO8R5v7CQMyXObHs
 xGiIGFl9Mku9ta8TZJaNuM8NMAGcMHZi3iz/7di3reMSsT6NylVcI+KGxqWI+gjCjw+IYmNoZPY
 KQzwEAtLECpam9SVlbGgqyMBrJD85fJYRDVTbD4dECMoZ3qHNAPefw3dAIpGQZnjHo8w6co49ET
 GGVsudz96WT6/TdWIZzvYk0hyI7yDOuTob/w66XER8khENQcVPCMgiswS1VurTW8dcRuo6MOQkD
 3ZB0cbHZQ8LRwWR85cw==
X-Proofpoint-GUID: wJCYsHDe2PSOmWgMnls2VwZ9b8iEEmtm
X-Proofpoint-ORIG-GUID: wJCYsHDe2PSOmWgMnls2VwZ9b8iEEmtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34774-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 179DE3AD21C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 05 Apr 2026 22:48:03 +0800, Chen Jung Ku wrote:
> Replace "unsigned long int" with "unsigned long"
> to follow Linux kernel coding style.
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: aspeed: fix unsigned long int declaration
      https://git.kernel.org/brgl/c/50f1c48b155b74528b0b251b8c4e097fddd5ab46

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

