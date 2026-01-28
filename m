Return-Path: <linux-gpio+bounces-31247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF80KIQcemlS2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:26:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DDA2BDE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80F15303E765
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D832C299949;
	Wed, 28 Jan 2026 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCXhy1SD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHqQN+Px"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457E27FD7C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610329; cv=none; b=KOf1q9MOOSj0t/Mq/BIjqWjxK8vm2+gctf5guxe/oKpQxzb+aemYJWI0yNjKsZLffcW5gdLTanFNsLfiqp1oLrTxpgh87Z+VZ1/xT0ZEzMpEE7RAoMn8WUNhmLZXiLFsI8Bh0dxbOw/sHMk/cDNPUZ4HUwulUHpqj2G2+VXwpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610329; c=relaxed/simple;
	bh=7V4HQtOkz41OGOFquTkbM425i1iovXA+x8PQcHz4N/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcKE9DXKQdYITWrCCBl4ro+f40apZ/XWNgkL5lMcHkpPPOGfVQZbe3qQhtIjI3nPl6713sXjywMRqbbE73aMZLx6urexbeLoHMMm9wuGBxubyGjirps3k4dAykFr+t4WNo+fuJPMGxTTWl+hv/qk3PzjPCVj8qVDNtWRGJsyxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCXhy1SD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHqQN+Px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91o8m3442316
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5hgkW2bSVd1Mx/8GXAEHEQ6N+Ima9Z/9XSmGYMt1Sg=; b=hCXhy1SDlREu5KTS
	DY0AC2WBr6KGlU3qoDmBl8xd+NwGGUkwyBmn72W9mttx4QSUhIqdsu+mYRODo+RA
	9zbA+YGE2pSnl2oitkNpclRNMuXO7uSs2MwEDUDvZF2brNV3lBm5fCBBvVHWPw10
	iHE3cIXoYgMPfsYyjbCNgZftnz0C8gzuPmnS0U6pk5kDJNzMzGopB4kKjQ/FqBUB
	D2QQpCA1DxOACMG5IE4Degfs+f+JxUf8hOYeL8bYCxHzTNCaoJqHfavINtsOReA9
	ekoJLViQbTHqjalxHtxjj2W5q3ikLkC9Nl9jO0qxmZfm4fi/DSUOmhqg6I9TfYr5
	J7P14g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanaj1d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:25:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so381732885a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769610325; x=1770215125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5hgkW2bSVd1Mx/8GXAEHEQ6N+Ima9Z/9XSmGYMt1Sg=;
        b=KHqQN+PxNGM+bUcsvhi2Kp3e67ff+yhYP+1O1IRx5SxI7rpRzqjLewuJAIhFRhpOQF
         Un8H2k/MyJ0ScT5VJ5I5M1fU6iXMkn5/tu1zb4f5CpFlQYAs6lo75636COJJKrgJBaGA
         AJbA5x+StWWPtSfLZKs34yGiyB81fZiN08/wGtN3NRKxSNnEFWnXpiIpD1270/yx7emH
         7eNLJsp4AulwTZdpzh2k2DPFT8NXAGCHRY6efqmvIMuHU9Tks8T7iVWeTvoN2mL4bFfm
         DmFk7TPaZI+/ds5ql/L3c+mExB+Z6TSA+RBOTXByGkTCaKTlHmQbQ2trkxt8Gt28zpcx
         Mf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769610325; x=1770215125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5hgkW2bSVd1Mx/8GXAEHEQ6N+Ima9Z/9XSmGYMt1Sg=;
        b=h4ZcxtOcfb9+02B7OdIOOwDfKXVh6pO2ONylpWTVB+s2+TOJFV9m8yXbGBdnDT3za+
         U1+jrH8jY0MNtHtbrHSzqxMDbRb9kVdfFaMrq9cZEYaUzU/wc286JVJGrlf/ATC03aUl
         WvamUV0Cx4n3LNfBt4I4iAdPqwTZ8X8fRNrZiK2i9E5heoxvNy1LooT6mOMYSK1puEtJ
         bhJwkWPbrBjMMTZI3DT2pTL/y7mXsoJz+Yecfc0VSfk4dPc5QZ8kDZpxK0Re81bS0xnX
         W14SN4DwmwGU2gyzF/4BNUPdyYTH710PnPjf5vtgjGHmWKFvTVdqIiVwd/bP59BsHM0n
         fIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK6LJw1FYEJ10VZKukpVFo3S1lCxgB03kkpccqMxwh8MyrFTOSi81xIBbMfxzRwPDMKm2/MX0LMZ5l@vger.kernel.org
X-Gm-Message-State: AOJu0YxeaGK1D/GljP1CSy+6H70FMZwhBgP2wHcDUiGgrXwbJ/OhNJPi
	dD27pQQCIr8P517nQo7IUOghnsGHaqeOHCOULgfLBsWbZv25KD8c7WAQ2e1FzEE+dYYZ4hWVR/C
	TN/35HKe+Niv3fWqfSq9Wfe/3n/+4HrYOZUmlT1vz9VXcs7ij3Nk+jGQQl/KTIdss
X-Gm-Gg: AZuq6aKGbquHI5YwSx4s65yeAMA/y4GFQWVMuNdg2Y/iVD3kEKds869ojgeo+6rnAz3
	Vw/86mrV7uXGp3ci3FEueI4eRvFM6RrcGYtbHkCpjqwge3Ux/Vm0mMIqbbqCqZxQX5rRLj+/CYh
	Yy+bqVWVqE3Dniv1Sd6CSpJ3GOJuRBYXgjHb3DXELJMi7IVrbpgcuQa3M7gtpf0EhEAuP6dGlvV
	ZZexTrQUyhLeung9tivo44rRL+B8V4hd8EZbQIcGjZzs07CsXEF19HV5HfzUW7qkDF32vD4ICaA
	E1IAn6LYZSekyYrqu9iV92f369oE47meV9n83Or4Qm+EOuxqrKzyGubmPN9I8ENKcEfv5lxki1h
	zncgTPg84Kt7Mpj9ksUE6aeZ5df5Rmeax5kKr8g==
X-Received: by 2002:a05:620a:1a90:b0:8c6:a628:8608 with SMTP id af79cd13be357-8c70b8215dbmr626349185a.6.1769610324785;
        Wed, 28 Jan 2026 06:25:24 -0800 (PST)
X-Received: by 2002:a05:620a:1a90:b0:8c6:a628:8608 with SMTP id af79cd13be357-8c70b8215dbmr626345885a.6.1769610324311;
        Wed, 28 Jan 2026 06:25:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:944b:d841:b24c:3a72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce5ec6bsm75827575e9.15.2026.01.28.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:25:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/1] gpiolib: acpi: Fix potential out-of-boundary left shift
Date: Wed, 28 Jan 2026 15:25:22 +0100
Message-ID: <176961025524.87868.1711246943742090995.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128095918.4157491-1-andriy.shevchenko@linux.intel.com>
References: <20260128095918.4157491-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r2AAyOMLMKfUQyC4_97S5RAQeXtBhm1r
X-Proofpoint-ORIG-GUID: r2AAyOMLMKfUQyC4_97S5RAQeXtBhm1r
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=697a1c56 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PYnRuAIEoPxac9fn36YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExOSBTYWx0ZWRfX5cnD+YycLUdS
 bQ4lBfKcdGJv6k3shu+IcoCZF1TRqDjhSEjZk5YIZsn0UNchYaByeGrX23Vc40YqQeR2TGDj+Qq
 sRoM5HWhGHX+x9Y9dAdvIQM+qEsK0MY0/jgcG2kwKhsgA7kpJ3hxRx9rVELDtnmujGXNcrCuAZO
 q+/qJYq63VRDgseNGFlkAlV77I2fLhh3futyVUu6djLWWAJHHXe6ELa23Jft4ql/ZKZlZ8B/8X7
 vbTGzavOBnlp6HNJkiEWqRNoWQsyUjX/gEN1DsgRVD1dvnuRAtWyNUE6z9CMruAlWcPJUO3X+sx
 vWQt/xjKj5QiPOkUc4cc/YK87Lb4ovA1bK1M6v0XAmRoImZDrIeWDzTJUUoPgRyWayY8rLhSr1P
 qE2KobXxRoOdB5LTO5hNj1jSf3GK0vlKAb/3KDO9mhRC0CNvaxh13Z1hCtkHIkXGznUxm9IN0Cb
 ZmyKw9YskPkPSMU0DGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31247-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A4DDA2BDE
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 10:58:54 +0100, Andy Shevchenko wrote:
> GPIO Address Space handler gets a pointer to the in or out value.
> This value is supposed to be at least 64-bit, but it's not limited
> to be exactly 64-bit. When ACPI tables are being parsed, for
> the bigger Connection():s ACPICA creates a Buffer instead of regular
> Integer object. The Buffer exists as long as Namespace holds
> the certain Connection(). Hence we can access the necessary bits
> without worrying. On the other hand, the left shift, used in
> the code, is limited by 31 (on 32-bit platforms) and otherwise
> considered to be Undefined Behaviour. Also the code uses only
> the first 64-bit word for the value, and anything bigger than 63
> will be also subject to UB. Fix all this by modifying the code
> to correctly set or clear the respective bit in the bitmap constructed
> of 64-bit words.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Fix potential out-of-boundary left shift
      https://git.kernel.org/brgl/c/e64d1cb21a1c6ecd51bc1c94c83f6fc656f7c94d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

