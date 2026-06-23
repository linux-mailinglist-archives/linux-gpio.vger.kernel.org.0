Return-Path: <linux-gpio+bounces-38843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id choTBgVyOmq79AcAu9opvQ
	(envelope-from <linux-gpio+bounces-38843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 13:46:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28F6B6D60
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 13:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=exUMlBsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BvcnztHI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38843-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38843-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9DA7303F276
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 11:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95D93D5253;
	Tue, 23 Jun 2026 11:46:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8433D47C3
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215167; cv=none; b=gKo0GSGGx0L1sZQlGLpFH2Dw0bm2PgEpb5wPTcnX3bdhDJqNueqr1g6PepNG83h+vwvFyyQUVHatcIPmf6a0HfcutvATp3nJasnbuqFKoPi7ISvE3HL6LYeLN/kfOMfxL5rUkdoZHS5AB5sm2fNbqJkpJsl9Ni3tCrNL/iqHiCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215167; c=relaxed/simple;
	bh=Hso0a6UrliQE5puSOMxPFIsfnb5JdMwIZP9scKQqL2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C70GMaUYzUAq5w/rcf/769ii5TDCLxxObHwd9p0ff3mcdVb4kPy4fWQKiim0G33W/J4bRzGJqPLDMA7wigP7WeEUziiXpXDEg3WpS06CUGVBehP0OTRq4bD4X10bCyud5P2UIiNllvw0jfghnXZFn/ummuV0zMgD4JdCRLQ+ubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exUMlBsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvcnztHI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZ9r4030761
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=; b=exUMlBslb0malfKz
	wCVTsgbL6sHO2bs58FC2dSO2vcOdObXhisMaudGZqA+tvxqLVcxYMqo53yM5ZR3k
	XgaFyf1xh5KgV/PPy3y70NVXa1uNxhmxw94+fRE5kzc861jjNTEkp8qJDvUWoR6K
	rDO5jMbVYXVvf1I3jovyjDvZPXW+MH4biNZK3cbEceK9vZN4EZC304yp8g+n68sx
	TbW5Sgatnbk8GjPZq4FkVYvsrOiIeJJyG9AyJpWJkmjeU+4evg7ol9N4Qb8sRU6Y
	oR5lhUn7boKNCCKY7S/c+dL5/L+QKMpvL32nAU1kri1Ox2Sulta97j8lScjbM9h8
	9+z2Gg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68kq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 11:46:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8de2adc85efso119475516d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215164; x=1782819964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=BvcnztHIDBzosmQ82QmQ2MMbQuqs6E3OokPRoy5EOrmxzSa87gk6eE4UTvN4yFO+3n
         WEStobcZSvMpZLHUzGu7V5CUuRzkqLXyFWP4NBa3+eR0vY+OnXxzZXOzHLZqERqB8tex
         H19TVV+Moc/Kb30M44bJz9D/sLWaRL2lTX+benm6riMk/8nfe/dSCv1qcFy5OwNyaIGm
         SIjKQyVbdNyvNgorDMWffcZd68ipVw8DQ4GDm8XAzVxQu1sAI94/Iv7VVrK9fxlqqW9h
         Uwwp8oN2PjKjsaLp271UfkYJbLJiHCci+1IXVkiRRJSqqchatwBJXtoIzSnkbaoDlX7O
         +qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215164; x=1782819964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=Wwo/35d3K9Nk8A+S6xhgw/O5RLCHvYJwKudLSGYb7wbGG9wEaOM0fXVvN/n8Jl6aav
         Go84revxw4ICJkgoKK8McQ36UCZJIY8UEZHC86+icESbgK2/UJ+3cim0h1O187qmcSQf
         kIkmFjA/fvjlAv/EWqWQy078LtdFBFvSIpoEY5BiHazs4QTKgRS1U8UpWGOLqZjp+hC1
         OHSj+Mma7eWR1VABgQtTevJ7WxCOmlStk9jLi9fDclTmH517s1Jcn4UTdQuQWqLUyz0N
         NXmmcLjOEIkO20IWn86J06/eaafuTfxDZeiPyP+wbNqm++Iecsf0e1YZrHGsc9xrQeu9
         y39g==
X-Forwarded-Encrypted: i=1; AFNElJ9z1T7UI/jLWTRvzAFvv+dQfSylAOSLjUqkDSixv0i+YxU7N5wbYbnnQkQUvhZg89y2ZFgQsKNw5BE0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52cBpONdsKMdEA2Wku8PzQAZAQwDSxuxjM62b8Dpwn8/VIxgJ
	hTIbuiul4YDzt5l13H/ZIugny5+wizqja9hHDA+Eazq1OTNQIhu4n0zAVtNAzaBy0nfRGO0tmVh
	Wsay5nZnMAMr1wj63IrNAelenWp8qKny3+egZrFrVzERI/DTHgshXFJ7bWL3Cp7Ne
X-Gm-Gg: AfdE7cksJ37SrysVQbe3zlFwqpgUB29HLkpipOO34KQCEMSd3P2oGwR4i4eWpxv8T+5
	B/cOWTnfASzhkCIJ+OND9mFHuxKVnogiRKB+7DqdF8pW1+xbX3QJeqx+MoI8GCmdtdPTeeljIGe
	Pesy1cp0v0URNcXU7t89dbilszG9ylLaImE3GPAgf86Fbsv1Do2qZ5s1L7KAr6D/syVnzzpRmY9
	jsEiWNzPPEEXSVUarPk5Bt/s6xLIjqWiwhl/A0CzNCCuJsg91QzUb6m5xQ+7o7n1SIcl1oExHyi
	3ewHnqcaBkHvAaHvFuxv0OXW9r+BBeVBDz3Qx+4uP4yzKYGUPtGZSckZdeE3CKSKQjjCZ+t5iJf
	K7RzdmmoBLGmJIAiRCWowRAqRdSDeFHY1sJXK/AipZ20q4QtadE+LnLOS1RXorW1sxlHr7QWJFw
	==
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405203785a.13.1782215163839;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405194985a.13.1782215163149;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:21db:9254:19d9:645e? ([2a05:6e02:1041:c10:21db:9254:19d9:645e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7ba08sm370702135e9.11.2026.06.23.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:46:02 -0700 (PDT)
Message-ID: <b35abbd7-f06e-4794-91a1-bdaccd63af50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andi Shyti
 <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij
 <linusw@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Marek <jonathan@marek.ca>, Taniya Das <quic_tdas@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanho Park
 <chanho61.park@samsung.com>,
        Sunyeal Hong <sunyeal.hong@samsung.com>,
        Shin Son <shin.son@samsung.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alina Yu
 <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JagLLGOLakB6z0515qa8PUBh8o8UHn9Y
X-Proofpoint-ORIG-GUID: JagLLGOLakB6z0515qa8PUBh8o8UHn9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX9LtVc8vyh+9C
 fziFlOgrrbZbufuPPjbSwsDk6vgqjyrjFXowb4q0yhm9dwYQWZ8x2v0m4IvXs7r6OgmNrHZFamw
 Ydhq0Gf9MN1AQ7iznYSGScPDTWkqpbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX0Ibr60qdDkpQ
 ib7enObgcYvY8/y34PBGK9OtN2Iuxw8s9KoU+7jJ6PujJ0mikifOiGIluOk+SsKv/6pN3KMKVQc
 dJf6dIqPLCHJrkxyUXhgpot/HCTkQ4eE4Uob6WuZVyt7Xq5vPIE0XxPCzv0Ub+Qx+phtaMjstI8
 xD1nlOoN+NkXg85D5y68bUR460mlBVxh2JN4k9cohbStOvmbI061Nlr/1hnZc5qMMj9ts8VOPTp
 0F+fOh3A3TJqYbjS9BPZoz5LjTxKOzPbDpj/4D9L5ogEH+UpsMiLFPc+y+A9jZ2ZIwLKEX7QQHB
 kPfr2TPWWkRa6AxjjDjniAy1ckMdPq/uTBQZIRBJ0cElfwbmXdwQzAf7RlKPzsk/ir1i3YN09kk
 yzs9hpu3EnDAeeMJS7o+YSfja17kGKF6hEpc4FH0gilxWuoRyo0VAo3lY3ePgRsUqFe6B3xFzB+
 /OInqf/uN5zq1N4FPvA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a71fc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=fqWYVyBuAAAA:8
 a=EUspDBNiAAAA:8 a=p1VIHm5NO6eVjb5xVX8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=3EkFFxAVN7Xjp7FSp-fE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38843-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sr
 e@kernel.org,m:javier@dowhile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.i
 nfradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[96];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A28F6B6D60

On 6/22/26 12:16, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Intention for this patch is to go via Rob's tree.
> ---
>   .../devicetree/bindings/arm/qcom-soc.yaml     |  4 ++--
>   .../devicetree/bindings/arm/qcom.yaml         |  4 ++--
>   .../bindings/arm/samsung/samsung-soc.yaml     |  4 ++--
>   .../display/msm/dsi-controller-main.yaml      | 20 +++++++++----------
>   .../display/samsung/samsung,fimd.yaml         |  4 ++--
>   .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
>   .../interconnect/qcom,msm8998-bwmon.yaml      |  2 +-
>   .../interconnect/samsung,exynos-bus.yaml      | 14 ++++++-------
>   .../bindings/leds/qcom,pm8058-led.yaml        |  4 ++--
>   .../bindings/leds/skyworks,aat1290.yaml       |  6 +++---
>   .../bindings/media/cec/cec-gpio.yaml          |  2 +-
>   .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>   .../devicetree/bindings/mux/mux-consumer.yaml |  4 ++--
>   .../bindings/phy/samsung,mipi-video-phy.yaml  |  4 ++--
>   .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
>   .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
>   .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>   .../bindings/power/reset/restart-handler.yaml |  8 ++++----
>   .../bindings/regulator/maxim,max77802.yaml    |  4 ++--
>   .../bindings/regulator/richtek,rtq2208.yaml   |  2 +-
>   .../bindings/serial/qcom,msm-uartdm.yaml      |  2 +-
>   .../devicetree/bindings/slimbus/slimbus.yaml  |  4 ++--
>   .../bindings/soc/qcom/qcom,apr-services.yaml  |  2 +-
>   .../bindings/soc/qcom/qcom,rpmh-rsc.yaml      |  8 ++++----
>   .../bindings/soc/qcom/qcom,wcnss.yaml         |  2 +-
>   .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--
>   .../bindings/sound/qcom,q6asm-dais.yaml       |  2 +-
>   .../thermal/samsung,exynos-thermal.yaml       |  4 ++--

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # thermal


