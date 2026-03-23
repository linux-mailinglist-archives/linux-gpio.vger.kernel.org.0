Return-Path: <linux-gpio+bounces-33995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DHaMI4AwWlUPgQAu9opvQ
	(envelope-from <linux-gpio+bounces-33995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:57:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE982EE8CF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78E653047377
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C49438553A;
	Mon, 23 Mar 2026 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maEOnMYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDeGI8VO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4D34DCD9
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256089; cv=none; b=QHbIal+95jCAAoMyHLSzPvjNlg/dZ5xDnxOpuad6oJEgyMosksXQq6gBm0RqhnLJ50+ZbvGqIpSViAAl3UppxkBsESBadpsuvyTODiZv/YC68aKbBZPkyVPRVr539frG4LMYnovUhG6SatEzV1AoZSlqRgps2VW/SQgNKSDHYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256089; c=relaxed/simple;
	bh=PRzQRr61raUwroBQbad5GfBm3wtavqSpZnxDFAe4EjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m1kd390891qYE584wirAMgKHUG2K8herGtlxq+ORXWybiRGu0lL/tA3mGRglDTPMcQ/clDR+8oTo+vQ67wWVgc+TlK/ETA7ruycICcVicFFuVLs4iyVG+H7bNNvdS5ZmZ2UjvA5nR9mNVOK7k2GK1Cv/HdAEMBxjVN4tg5Xm4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maEOnMYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDeGI8VO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7YhHe303995
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AX97AW3mwlBZO0tKTmLnuN9612Vr+fBxYBvY7ZVjcMY=; b=maEOnMYysPOMQPg3
	1RsLR6QvbINAfBFMxPKzziI5+CGTp0zoH6nX+1b0S3X0bXH+4TgYVqFuCHDdSf9D
	zvSoEzVKRnTQ1N6jLyyGe0348wBhk37sSw8bdLDdG+DiSVaBdIePsk1L8uq+0Yw1
	pDij0Rn7Rim0Sd1G6mSCN9fgSwa4zD+9+AhouoLD0Q8uPNtZb2BidKPcXT6GWqCd
	NPq+UqGtglbLKyw0Ka0c8mUkE2Q7gNUaFSHqq/72lFFi87R7JUT2YTXpUfCqWs5/
	Svm6J1e9MeaOk0dlj905m2SaqUyK4f1DUzk/tcQuk8zIHpCp2vr1PVictO/GiQnX
	R5LNow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4pyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:54:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b380cd5e3so260749011cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256086; x=1774860886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX97AW3mwlBZO0tKTmLnuN9612Vr+fBxYBvY7ZVjcMY=;
        b=QDeGI8VO70RtjzMupb1NnFSCzJ+LsCf31MzmQYIBfYOL2zspCv5BAHivhz2qMumO2Q
         chgheFtt+Ey4scnL5Dbx7UToQdDMFa+y1GdpbI8yQRLbS0P30hRrqnRjWLZNrqMrdCcg
         RvSQ85/i3g5Ywf8MuO9lHG6iQ+WdlWh6pTkUL8eFBqCXSpwIEvGJj/G6F2Y7kLVbESMu
         0GQkYobRhLjB9+XLOj19cLz8MtjCSOjY5ntQpetp9+kRsJCJu0SzC5BBFnRs1vAmBswC
         ENmd04yNaP4HA0M2Cam6hwKqVMn8JEuN8hFPikHcp6Jf4y6bMxhQ7QHpcmT2H3B6bcGY
         44QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256086; x=1774860886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AX97AW3mwlBZO0tKTmLnuN9612Vr+fBxYBvY7ZVjcMY=;
        b=k29GzYMahAyCW0+TQ3DeI/NOM8yQ9do5VCqVBqdatpsLX0CEu8nB8mkhFGcg+NcB3w
         +Vz+hyJt5mS09f8SDj2cQueS/UFZG1WLQJIWayt+GAFTdy3kQbLBOYUcqmVzqyMsHRWz
         eVQ1u6dB+mFykNpoufuxfly8oxrL4N13dGUIlDLfzRAQZ/sSFGF/fcIlR9hKOnl5qrMU
         J0GQnixfYzu97YQ3CbtCNZq8mj9bpgO2F2CK9ExzPppj9xu0Z31QZmNGopjya41eCWQp
         eKjvelGD62q8RZgYEg4DeJNPS/wX/krymgZmnBvH2q8VLum+GS5kL9h9sl/1RtYP8QAl
         UEVw==
X-Gm-Message-State: AOJu0YwNHax8v+NOCJl/P6oUzwqHJQrzhVOXltjinUI4cpKv3pJs9EG4
	ODvEYJ+skU220Xn4zeDUXKaKlSs+0YTFW41SLv9WWpL8GfBJRBCtj+l1C8l2OvySJq0lhIq3Mcr
	Q+BQSnxzGjapA4BrQQdUUbqs9ThfdrSoP9YM2Qlgs7rKuk+Cu19oCt4WKnJ8VK5Hv
X-Gm-Gg: ATEYQzzaRNrW1k/U10dBJIy4Rcl1yHI7GX+u9jYvmmQlVXEC7KGEhXmyZWgj/y4hV0d
	1VJoE/XqUFAF5oRN+Wp3Mczye52M0uN0Dpx/VEWJ9N+RKCmtBE6jQj6kor40QYXTwXn8PRe0WSP
	lTdFl4qNpcq7OpEOIT6AdSOy9AM6lBIxh1Hog4IEz+wSQDcbRaNM9Le1KiAm4q0h0FzrMo6PFJV
	cqRs9uujwkXY0fPFVp4Kar0vV40bxlT4sgl3e6vzpbGDKrh9jF2YOqxMdWlphj/6oQJ3CC10+td
	N/ZXZC0aPoHN73RN6T0A9WWpS1O6nOm+jNggASE6TK+RWSrn5EddGcFEPI3mLpbzkzaSVYcpB+1
	1uCqBTvJ8jzuVuSdrVvZKOipE5hsDbakTPr4gLu614eq3kZufu9g=
X-Received: by 2002:a05:622a:1aa6:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b375dc433mr182878201cf.65.1774256086544;
        Mon, 23 Mar 2026 01:54:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa6:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b375dc433mr182878001cf.65.1774256086163;
        Mon, 23 Mar 2026 01:54:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm28596835f8f.22.2026.03.23.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: shared: fix devicetree corner cases
Date: Mon, 23 Mar 2026 09:54:43 +0100
Message-ID: <177425608155.7691.4660358568981829090.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
References: <20260318-gpio-shared-xlate-v2-0-0ce34c707e81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xBnihF_0aIKZ2V7fTav4uAeQi5aww01b
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0ffd7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8fnqNPAIW7IwgnIxrG8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfXxBY0QWyksL4D
 l/3N51wMN0n+CNSFlJAddIkXEotzfLhdzzKGa1AH70DtQ+k3gJd07d+9IJfFBU9CE5Z2cvC23fT
 ysQiQY5Cb6XxnN3w5OoKVZv0U1uXJlJyLgLFP1EcsMC9ne2Z071H7qv7RoWtAS1T553HKiUrPWQ
 JjNgVXj7Y04/7LLEW8D5Es42XXUxJ3ARHh3YUBvznzU+WnJw4JgBRRZVMlIfbxIFLeLzH8xHJze
 +Rq6bqzzup6bsoaQHRcgJ4KRo/+2NRk6qq+U5IlNyQal1MYMTReSnJ8dfKBTZNnVnz9bGtbpJjJ
 b9JuyP3/FfC06VYH7oNpVJYfSmY4CXvbG+RrWmpoN2rFlycKA9F8+600nt4Zn2hLefdtJaMm+BT
 2pFiH8Do53JuFFVRXMRxROYjDG0SArxbFGGvP6GelJVVpnPEFmDf89AnpAf9E5d6c86miCrrw5j
 M9Z2SX4OlkeJWGJ3PFQ==
X-Proofpoint-GUID: xBnihF_0aIKZ2V7fTav4uAeQi5aww01b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33995-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3EE982EE8CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 15:00:52 +0100, Bartosz Golaszewski wrote:
> This fixes two issues with shared GPIO management reported by Jon.
> 
> 

Applied, thanks!

[1/2] gpio: shared: call gpio_chip::of_xlate() if set
      https://git.kernel.org/brgl/c/710abda58055ed5eaa8958107633cc12a365c328
[2/2] gpio: shared: handle pins shared by child nodes of devices
      https://git.kernel.org/brgl/c/ec42a3a90ae9ae64b16d01a2e5d32ec0865ca8cf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

