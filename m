Return-Path: <linux-gpio+bounces-30435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4DBD114A3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA76830E453A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68F33431E4;
	Mon, 12 Jan 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYON1Rwq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0mUs1Ys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9234167B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207279; cv=none; b=HrtISlD6721+AElPqJkHC+Vs93grPN8tCXOCnwq9yFSym3DFiErsy2a4MQFYnBr//3xYgCcgVSU60mZJ25WLDMDD2uArsw8FrFabW/+m1nwnEPZlf9uqYh4WwQuSo8g6jAr7k5AwSqvpGzR0D2EOddIE4AM5hnIp/TMKRTm9OWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207279; c=relaxed/simple;
	bh=7aBQj/jMhzGawSGKf678xXkuEdrj2P3ky73p+WQTuBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkJvMnQfsHUGPzXadJ+L/7s9Cjj6yyNw5RC2+yYA95mcL9pvIYKSKdNi17zpJc1glKealEVhXstELd3UpgrLTnlQm0tZ9N6YEZpaNbdmhSgke5RTy8bu9p3U8QWAZzWtqAD/gEQjglJinyi+t+VxUChSi5Ky8f823hlEti/ZlXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYON1Rwq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0mUs1Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C82Wx93734260
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJ4FFFSRm1s91oC7oRkhzKomImhGecqctsmg7PvYMc4=; b=eYON1RwqDZoioIGV
	uF589rBc8KMgX7V69wfXJaozs7Wecg81qAq0wTt7DgJGoPDGNTttuLCHc33gFkXR
	T+iVYtqCmL4VIFVNzg5a2f6iNikdBQQuKOQR+2wb6dwQ9hiM6hZE18dxdLPfJ2GC
	j98j/RGAOqGDoagInGdKyUZf3pFGy6qOEVu8NH7C7VZm48WYIEI4W5IRASj5WAr0
	i4q3O/7l/PKZFVOZRkIGpn2gRvzOfbbVqDuhjqAY1SeGaD2pRheyBSp180mmVl44
	4ETuOWGUkub2VX8Abp4KJCykCeDL2tuZ739qWnOUKe9MmLjwB4rNUH5gQ4BnAieR
	FEGZoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusm87r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 08:41:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2dbd36752so1609310485a.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768207275; x=1768812075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ4FFFSRm1s91oC7oRkhzKomImhGecqctsmg7PvYMc4=;
        b=c0mUs1YsDCjo1yZM3U7PnAMUnU7cZq14KfeXwpI00L89zB6GYGm8WeoIoxlstml4h4
         hjCBva76T5mREyB1EN1k8Eyi1cXJTKFb65yWgKE2yvCVVUa0NamAmx8DSOe744tDU5rP
         LLEIgwmnMTGNHcbl6rCr5bkFwZx5yi2EtX8qYJ9Z3CJ34l0FxXhsgOeFIIliZjSkwV4V
         +6MqpXmBOONYuBaJINYKHHfMyrdm1RFDM7al/V4SNpw4rs/eneMW2qkvMkb0pwiY12n8
         ko34stwzuYLa2g2i7NLfZof5l2lj3ZxEHl+VUNNBi6g+h2P+wJYbHfJeBJ14xL/rxRIU
         ubXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207275; x=1768812075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJ4FFFSRm1s91oC7oRkhzKomImhGecqctsmg7PvYMc4=;
        b=ogO9bOnoBtpn/o1pTsGzA0cDoQJOOPbrU48+11yCnBWy8LrxUhOjSXwGN1G0THpO9l
         B02WV+sPRAVR7JN7CQot6SmQJEl2/KBB1mWMT6QfKfVyutWqZoj2y6pLmtIlT+XAqrCQ
         e1Y1ftSd2giwMwXEHUsLmRZ+Mw7xyLAwxFNe2blE38ixET6/p/p0nTW7y+T2raBSu0lK
         QZFRX467YOFHs5PQwFUjmAa4pDiOR0cixcXq8LjHFKjubi8wty9vUWJubGAgUUPmka21
         9q02cW1GXfOdJzyBb7LA3MwFy0EjKb16M/JmQmd02HZPknlKdB+8oBJwqYgKO0EnBMNY
         h6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Dz+zWJC8aJVYcej/h7TUHsa+4Uzy4hNF+pwyM2q0M7ak3VgigNzHKKyY2ihB9YE74REsJYMegz+l@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwEJxhJ/PpVgSo5QQZZqV9lgJAYfFnpM+QXzQOQoCrwetjrw1
	wi0Km7PxPXYXbBLcCz/TQXO7720FeQ4oD9HolNx/mdQYpOA77/7oGVrIemQ9+q3xGNjvo+pN5IZ
	t9gyFMo40/I1RX57DrbgPb8WymH+LNFBtOMmqkoJHXmhV6yXDnL5+HXFgOvR5HEjA
X-Gm-Gg: AY/fxX4OQhqAR7r/agMSX8cO3R6kukUkOPEhNqLquzF/u42C9R4HFVxu9yyf2zrP0A8
	uPfGqqIi6L07W98eIWfqmMfG3NCve6ipWzn2hUXJMjfLENgxLiYp+apTTgZKJpSoCScB+5Aj5Ap
	oQrz74efFHJe0qlRrMuish3xdAEPPlTveLjAZm4eyaWTcjOQvM6lFWgBFZ6tepmCCgrpTmSJf32
	fSwJob1zHGIWHIvAdy13qWE47JXmmLiYnrSUcek00INZ061FR/haGHdkcODwPhcx1Kl+bxq/uDA
	bdoPByoer28rgYn992U2eIPwRJY4rxp1RXBajUXbe2NaadsYsutllgI73lt2LVT+Vea+3+HwKhi
	vMN4TkqG51gtqyciBQPtXCZh/iBoCtYC6ZIJCfkc=
X-Received: by 2002:a05:620a:25d0:b0:862:f354:ec3b with SMTP id af79cd13be357-8c3893ff9aamr2221026385a.61.1768207274889;
        Mon, 12 Jan 2026 00:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpIB0Nu6G9tcXP0kK5MqKdpL6VsoQakC6bMnD5gG5TpOAu3nC4jNl92D/xV2Xe5dWjcUAyJw==
X-Received: by 2002:a05:620a:25d0:b0:862:f354:ec3b with SMTP id af79cd13be357-8c3893ff9aamr2221025285a.61.1768207274466;
        Mon, 12 Jan 2026 00:41:14 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a056:e497:8fff:6413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm37279608f8f.5.2026.01.12.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:41:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
Date: Mon, 12 Jan 2026 09:41:09 +0100
Message-ID: <176820726230.8044.12485983822915028914.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6N-eBqii6sp01xVJuS56FLl_n905s8Wg
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6964b3ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IARmVmzn1eo3tEFrmJgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6N-eBqii6sp01xVJuS56FLl_n905s8Wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NyBTYWx0ZWRfX9K38QmKgBFl2
 cmRvaKZ//ei2rHdBjDXg9KUEWiekZGNIpXT+FwDG1XBiCk56ztkRJdNbTbjzoVnWY0LYvPhyxXc
 A5jp5k/rOs0jrLLMD5CSZPUv15rd1I3QnglNLiS0tfP+1AlgUF2hCw79T3Hah99jZlYrOTC6q+H
 SXZlEeSmrUDtMYKvmctNVjB1h66O45ME8XHu+JrWYO6WJyQyplzaRhsbGo7VKhZV3VGjV/Fo3ad
 MWwv2iOHFoaXDtklusCfmwxNg5R4GOYfxXLI1XpIX8MBNwg84KF1YpyDUtyQ21r4JECYseJz37b
 U+LqYFO9bBzFbEAp6EoJetlKrH5JwoQHK4H4fwolVWiofOTmEpaXrWQkPWr/uOrlEnt/JMvtRcF
 3aOSPyvO8MSmwV89/P322jVgOox0cXAEdz/NYtkSBLkTIoKMjcR+ZUz/Va+zzWsV471swHgdHy8
 HxE5WRbKF9LpSWZBekA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120067


On Fri, 09 Jan 2026 14:08:32 +0100, Bartosz Golaszewski wrote:
> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even for fixed-direction controllers.
> 
> GPIO core will even emit a warning if the callback is missing, when
> users try to read the direction of a pin.
> 
> Implement .get_direction() for gpio-davinci.
> 
> [...]

Applied, thanks!

[1/1] gpio: davinci: implement .get_direction()
      commit: c18790018799155e58d5a11c6697f9c398bf8b60

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

