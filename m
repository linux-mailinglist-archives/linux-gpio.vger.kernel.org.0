Return-Path: <linux-gpio+bounces-30310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE7D080A6
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D541306190B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AB43559FF;
	Fri,  9 Jan 2026 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NP6Er/Kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFRgjZQY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD453557E2
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949116; cv=none; b=k2gDcCtrOLOovaIcxK8dOn23Bo7WjcXaS7WUiizFoUrBBT7hM0dhdJcQacaqN7oNhfs6lZ0zl8ao83ouQg57N2zSLrMeyoHCDGHpjOMKbQ9tyAB7k99dFRL1FtpckX1xYGifUbLyxzoPSwvRzRPOprxTdx7hN0MJHAr3XWPT6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949116; c=relaxed/simple;
	bh=g4PpAKKypOXotiaBqot/5S8YLMPLMTL7fWB1YbyQ3QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKDExqDyrz1mpeKXljH3y3ovtQlbmdmg51wxEDXLxSREmsvJ9T4gqaYWxCDlhDCJxMjD+fs5eVPw8CpN9qJsTCGktmT54lKglrc7egm4oHVRcXyCTt7irdGGM+g+E9fW3lt5bIiHfmzc3+lnktg+2zGHb0IRmP3slrFEKDugqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NP6Er/Kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFRgjZQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609614EY3142604
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 08:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kl8Av41wljPMDxmDqkWWKoay0fVGFDEo/Z91UyCu7JI=; b=NP6Er/KnjgoODpeb
	1o+a/Mj+Snd4DxBlVETXaK2v7sEtVmX7FhV3cSIPhD9VGly3eVK4+KoZtxn1YOMP
	duv3x5++DapRG5Nkd44SqpcgP9DNtBRvOBZrCc31iXQId6QterZoASknK4zAXjH8
	j7UjVraa3IkL7jOBOViOfFmJL1krwU2uW8K9zRzxkT35abF5sWEJ1g9fwskUTipu
	4Lh2o2xAQH/7O7e7lRZpRzKk9ppwQtEQsKP4yJiec2zhhocoKB+SsAK1vGHTHN1g
	QyXjQy14Lywq0636cP9cuR9YAqe4NjNLLUp/NwyO1U3j8T2yqbgHQdbOw3d+JuTj
	LZLDLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j20uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 08:58:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb0ae16a63so470580185a.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 00:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949106; x=1768553906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl8Av41wljPMDxmDqkWWKoay0fVGFDEo/Z91UyCu7JI=;
        b=DFRgjZQYzUSe4i4AJcb8QKIGni7nOl7dvqr3X6ivr+rCO4jO7OpWgnYpUxFpHi1aFl
         YoNP715ChJZp8CWlin9EXDOG1v638mwwt8iW26BxDjxpf6+kwgyX6DRZDgK7/2wzA1F5
         hQ3xrJUzJJ10uTi5wvyRojDUH8/vGUY2hES6GA+xkiZR8nCsBP85jcVJ8Y8tuEVAafzj
         iSaqOrXmj1PwsmRmekI6Za+7VTJElcasIPK/xQTGly39usbPutfy5VOD3TGCclo39mzh
         BNsWoPRTeSEme5ghrlAbKyP+9sHMWVKQ0G8voqfYkiefkmHz7LGOvLfjkv5aPLP3TybJ
         pK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949106; x=1768553906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kl8Av41wljPMDxmDqkWWKoay0fVGFDEo/Z91UyCu7JI=;
        b=MLjGf7ljtdUJk5ODNJ0rvL/4SJWp3BQWMvS4dxzKpZX14pb9zGKLj6TnP4PG622AS8
         wuHR2j2oS4igJBYBHFGBGAKLpx2x9UDFF4g0k4nbFNfroEIgX0O9M5gGT3fLYBEeIjRy
         oeKTkwYM2DzLQauVkjt8BNi7J7ts5iR4jtfirR8SUaFex8YnEyWB+yrYD1RYByT4a4bb
         yXWOCzuijUjcmIH50BXrTnXZoRO9+zsYtId/a2s+QqGQHPtl8m+qzNE20f5wZgLtmG3S
         Vj5cpXsdRv/QClovNXJ1SKUI/SAUBO4CIXaxZkhanEw6PX5lQWAWfDBSB9igJFOFoRwH
         n6wQ==
X-Gm-Message-State: AOJu0YxQQNKUoSQd2K2eAYjkJ7idvybs47BJ8pcR8bzMRJtGuHXY8Y6D
	xJ2i2hRhYCU+sx7/3TnEzQTmY+bL2Vj0vEJR0FTMl0AH2Fma0aMu1RyKRkkcvrRXWVI33taAqu0
	s2i/nEBo31jjrIlThuW3QTOFmreM+EBed5SHlmR+Iol4Q3IasA6qGFa3HVZ6N3ReIzA7yjQsc
X-Gm-Gg: AY/fxX6QSXqIBSzFzeJeAMAXlPcsg1kdBikTrE8/gIDrykmOOuxY/1uNSGijGwJD7jJ
	FQvVJaWhiL/kaH599nWzl/xw1oYwp0ySKkViKPQsUSgOsqvpK7zL3nWIhnvpo8kMfouQapW2UbR
	OEadlntpSAxAT1g4YvkeUcc8LF4fX9M1tiT4snxu4mTSG2gCC6vSLX3Bo1JZFYUKH6Bl29V1O0S
	e994QLU5dCk7xoEoVEoKxRZ2wqTynm8DcPOd4W/N8CD7P8ukJDf8W5E9qBaNRPJnm6qDCB6ntHI
	0+glPnRdWSWLM9cCO4D6HKyxgxhYIYJXFBu0QyNUEepgZlGPXRDctg3nXHayyC0lIgTl5hjNqpi
	r2v+0DA9BPWXE+0rQ9UB24Ye6QKONs9iEAvGOHLk=
X-Received: by 2002:a05:620a:4402:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8c3893fbe16mr1173510285a.80.1767949106218;
        Fri, 09 Jan 2026 00:58:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGhabIItqj1HzT116pneGpy8aKhe/2mck3gBEaOCNvKLI0FxGoWVDDj5VsakDPetJGTfXmSg==
X-Received: by 2002:a05:620a:4402:b0:8ad:5014:53e3 with SMTP id af79cd13be357-8c3893fbe16mr1173508485a.80.1767949105789;
        Fri, 09 Jan 2026 00:58:25 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:968f:1fff:f626:2f33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm21286189f8f.33.2026.01.09.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:58:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] gpio: line-mux: remove bits already handled by GPIO core
Date: Fri,  9 Jan 2026 09:58:24 +0100
Message-ID: <176794910167.13325.15708221411277997837.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107085833.17338-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260107085833.17338-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MyBTYWx0ZWRfX0f3MXGpFjH2A
 N7J6v5bJksyf0CLQgn/vwetY9fYGQ+qMISBJ8r+VoljzxJ7jwAilehGSJMg+ASvwR5faoC8q4rF
 9aDrRp7j/2kKU2gd1s8YKWms/aTahMHkHf6ue6a8WdFDeTJOYvqNb2R+xEwZlBVBpiacxCAKESE
 YqLWSo5JW/wMf6aN2bU4BtFiqpIQWot6Y2UYBd/zYsyvqMKbljV6BJ2VPqLmmxyfhTOHaEomvRd
 QL//30cosTJVvdo+0+tNwgp3fHDYFIG1iENoYUxhKV8Cx7ipE9hNirFP5GB9otkV8tYDCNlJDzm
 BLWgOCqaeM5q4XdYfCh8kzfJaR+s3kACXHZdjBsZzzgVU+XuO67nT+l5ZT6zujJOdFY7BFFrvLd
 me9bVhhdrymTVQh90RBlhsgyGV78iYNixoyWQhjhPZm5eqR4uLav6uRntM2deY+rLJIM/5HHvp8
 G6TIcFB+hFZ53m2GuwQ==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960c332 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rRmdOOBq4RcqKiZGhBAA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VwAfYODwwGpC7xv9tQ6LVetzQuxBDfXK
X-Proofpoint-ORIG-GUID: VwAfYODwwGpC7xv9tQ6LVetzQuxBDfXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090063


On Wed, 07 Jan 2026 09:58:33 +0100, Bartosz Golaszewski wrote:
> GPIO core already handles checking the offset against the number of
> GPIOs as well as missing any of the GPIO chip callbacks. Remove the
> unnecessary bits.
> 
> Also, the offset check was off-by-one as reported by Dan.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: line-mux: remove bits already handled by GPIO core
      commit: e034e058897a12bc856f8b22d1796964c742f732

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

