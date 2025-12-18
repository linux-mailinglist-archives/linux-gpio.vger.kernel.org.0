Return-Path: <linux-gpio+bounces-29742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8BCCB9BC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 12:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9DCE3016FBA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A9231691C;
	Thu, 18 Dec 2025 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FH3+FWax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwCuBT1/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8FF313538
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057237; cv=none; b=kUNFWswdLvQ64PGBwtAkwB6tgBcqYKAlKseDBf/gOoIYmJCXH9hC0+7C28NOd26BaICfiQnR66JKqhzz5aymbGq39ZmbmGNSh6cmuGumDxe97blJoo/PxUOTVYuDSshI00hg9OLEGXDHPewsgxUxqjnYmU5uFRI0YP7sACEkzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057237; c=relaxed/simple;
	bh=rC0wJ2zUyenNMRwG3GT6Zq+HXEc+k+Obwj7wKkDdSDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZK4RReBs+5N9oOc+yvULlZ/x+Yz5QMz0P8JbrIyzZF8yj7O3i1AUA6xswpK3/b6tdFVpFp+o4rqAJIdCVPS+vfgK2ZzqG19g3h4deejzGikC3hIodDYyHESsStwjDdUEmrgc+8TGybY+QMVPOmIcNy2jIq9y6fgxipW1GzWv10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FH3+FWax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwCuBT1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI97hUq4147950
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 11:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1ObE1QyUxozBVSsG6N2fsImm3cZDE1rsv9IIQeiftU=; b=FH3+FWaxRk+gE13a
	wjiSai/tTIzYqbkgr9A2cuihNzPdEM97Q9jsN6jvh3ZtyiS2nIwZ+EeorjW46heP
	0VQ2WlgYkwAg7qaR9i7p5SZ2e7oXZ5CJBzX8HDcjtbUbo7LaqyAswm8XZoUoE9+W
	UgNzaVf+LQRzk6WXF7Jw5HS000dmJo3rT4zXNTfTI86AMIixoZppMf17svTQWF/y
	aBWWnAnGDXW+eAafs30ve6F0CONP4XqJMzAWQIiJlk7K9HnIGrzmB/cZQBvtmOka
	HZTa182RL2b5Nwn5sUD33vVJ0gXs35w10T3MuAD084eYsVnyvqlDG4cEU75GNuT6
	mozcyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7axuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 11:27:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee16731ceaso9425971cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 03:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766057234; x=1766662034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1ObE1QyUxozBVSsG6N2fsImm3cZDE1rsv9IIQeiftU=;
        b=bwCuBT1/9AdcvrrkineFmgJ5XUZrAKHSTBOU5asJWnuAEG5zI9hLyHELIagNy/a9hL
         zyrh6GyqGU2OEifnZJU+LNezzIthqpBHwIK5KuBWu6fsQDX7Mxwyi6NBf4frpJ2iHM75
         wBJ+MFjAtGv8gq+cEYtv1lbYjjFGt/qU00jha2n4jPoUmQfwjFetUJLZebLUAhKbIF8H
         tjqPYMTPrZhb53K9aIP1qhYYWT1Pai1mqb8U7vGiQ0zjBIyxOBncNlU/fUxTpkRcnJlb
         WIoLI32YJKAuIUEVsJSbj7NTmoyMcsJjoN9/fpdiispd62wMfEKotwNA+DC+1HNYMQe3
         f+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766057234; x=1766662034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1ObE1QyUxozBVSsG6N2fsImm3cZDE1rsv9IIQeiftU=;
        b=lFloSUELOlc8+mNz1bZ4RyibWmINmTRtqPXY1PGiXkHRvc5eAsz4Sh4EODNNjGP+rV
         HBdtsXrcwy+IrIFHmzpcwyKwOGlpmXOyWtrCJ0Wv7kFBUTJU+XPzJ2k9vSvW3gdqWvbA
         KpOg36UB+c524dpPV0rj4CAYP1FnN7or4GN4IYDKInKSXYkhEvM5LlwjKzHaPtYk8C9v
         zYznMa2Aa/h0vDIhi+frPlAL3uzqQqwvQ2WtX20y32ExF6fmYULTZaxdqJIFHGF5IIUn
         XAEmJuV68486gvt9qQd4rShlezDV1IEo/puK5enmTXybJxcRc9PhlWyK/cXrZO0pM5vF
         taCw==
X-Gm-Message-State: AOJu0YwbDdlaUDWh/l/9yjBl9V/8rdCO8QbK6AdMKTyXyVAqxAqmxkYs
	QVe4OShxaKYNVQ/F2IJr6ZKrdIsatysLmFsb8CNQzPv0SPsoh/5FMVm0qrNWHDB0gVNroXNp8rF
	hFciKkB3+4HCjr+a7PM0/YMfANUGRH8i4Gg2nsB0Bt0ZRd/R5Fei8ux4V69u/l3mEXE4DoHm/
X-Gm-Gg: AY/fxX4HK9T0XWriInIXlxW8r56BmIjFt4dNv0jk3tG/KkhXA4rnghs4B6uT6lKmSqR
	bcZSOigcZ8AgwvW3EhcA6eNlNyjB2puVdeyP0sbiEBF3tAaDA9KlgRUnEVQ8n86EcIbhpXMpcnj
	CVIjDBLwMONEB5F0MPmBuCJsKL/Pwfhq2QeHBc98ekyHqX1/5lxtjDDI/evaZJxsR7Dmlf4biIg
	qD05d0n2CJmjjrcsUvt1THXZp6co0OmKh+J6afDADAQaxpYHupQBnjI3crOS983QgOsFIVo0HNo
	OZSTKkZLNRfzr8EHIV6z3+jfc2SAlHMuubj6J9aHm5D9ImeUX8tqtdTZKSw8uT7T+EL+DYKm1he
	LKFsFbZWdWMfJf9hnYRVOZCJem3kUrAGnOEa4gw==
X-Received: by 2002:a05:622a:92:b0:4ee:18c0:54dc with SMTP id d75a77b69052e-4f1d04a5583mr267935851cf.26.1766057234421;
        Thu, 18 Dec 2025 03:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDEdthvEiPbr5oozHJp4XuYxYPhrLP6E+gKLlegNHHrmh2dNZsiP3snjcNg/oB+KVSME31DQ==
X-Received: by 2002:a05:622a:92:b0:4ee:18c0:54dc with SMTP id d75a77b69052e-4f1d04a5583mr267935691cf.26.1766057233980;
        Thu, 18 Dec 2025 03:27:13 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f231:224c:1d69:c0c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244998a64sm4380506f8f.33.2025.12.18.03.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:27:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: compare the "undefined" swnode by its address, not name
Date: Thu, 18 Dec 2025 12:27:11 +0100
Message-ID: <176605722909.59758.15745157789443891085.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uzLVQM5M5qx67UoTTiBbTrk7O8JymG13
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=6943e513 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yiCsVvNatFuNo99BfHcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uzLVQM5M5qx67UoTTiBbTrk7O8JymG13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NCBTYWx0ZWRfX3YrOGpDazD/T
 k/+JLiowetJh0VGnCi8VWKJylporCZmszwwlDe42dLiP3wFrSIRpXpYsdtdJr8Jk3ws9hWKRMad
 rjcLet3GrHuIIPdiGWpa8UAMaDsGL8hiXxhts5jcLjfqSv9dX4fPKfm6TAMkMjHGLnHXp9EkON+
 TKJic1JtXM5Vq6TiBMil5ptUytU/SOafl63CRlx+fIiS2bbuqJi0u7vEUYlskRsJNIPqJnouKkD
 hc58r6XiM8mVBcixX+wyWMjz27tx4IPtcT7cZQ+d0q8qzgwm3aTOlDNyUF/s3X/zo+nTOTTn2zB
 0vyLBqXtJkID5qcPZDYPc6lrSq5e+lEa/CnryW3qps52Fg9X2FWVAJV8nZCS3y/ADsdWv05L5ut
 apUsjdUQ/21eMR9tfh9NR/RoNrLtCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180094


On Mon, 15 Dec 2025 16:46:24 +0100, Bartosz Golaszewski wrote:
> We know the address of the underlying remote software node referenced by
> the GPIO property (if it is a software node). We don't need to compare
> its name, we can compare its address which is more precise anyway.
> 
> 

Applied, thanks!

[1/1] gpio: swnode: compare the "undefined" swnode by its address, not name
      commit: 6774a66d0e103d0e3e4c0f37dbd61946ec83edf0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

