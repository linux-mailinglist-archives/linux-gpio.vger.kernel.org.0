Return-Path: <linux-gpio+bounces-40057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HxnaMx84Vmqh1gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:22:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F015755086
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 15:22:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jeDP1noV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cioL0yS+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40057-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40057-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E87293129D61
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192DF239567;
	Tue, 14 Jul 2026 13:16:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED822B8AB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 13:16:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034984; cv=pass; b=Ofx1BvjqUgtM8onqtETGRGJfWwwKNouXyqa2v0uY0YzQT7Cinn1+sMLYMAXrZKREppq5ovV1snvcRRH3/9K0p53lmSKIesO0vwNaCAs+znI2p4KHxHVA1J75jdrKu6htLL2KVS4fIREmc29KW1IAbCLG0nksHsQ4WFRZyYwnEoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034984; c=relaxed/simple;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6i+vWr56CGWQ3Eho8oGgAwUrw45VcTxRkyEFgDVt9oZwqTFmGNd6O1H5WEZHCIP5W6/9SVT7RzX1WJ7g8ENWN2ULZD6CidSEegchTRdho5cQMaBcSAtnouJwKvbAoDiNes3pO60qkIWoZWa7yrEXpaKBlD6KAnKb650uZZCUrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeDP1noV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cioL0yS+; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3qQr721017
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnur2mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so77221416d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=h70D4SxbJjWDhBA6LUmQVLz5PCDSWKQ1+D3jQ+LOjMlcxZ363RT+9lMwuyA9g4oQmP
         frWo8X/Yx8y0pf3Mk0ajOGvnx59CHJRe1xRptkH2QSipZ1agKfocz9hEi1Co9XyV6hgA
         WRy9MjszDOXciyLqEd0iOhUui6HtGI8hmyARQevOimYdeRQ0/QdQTzKXuTaob2v/9uVU
         zghSYP1ccofZIFgQ3JIGF5hjwr/wx8iCaG8Qhn34XzeEAHKmQy2IzOwswEZC1RejAlVu
         3rH3ODL191Pgwn6TWKe5SAAlBW4tbEOVL9zAtnXKaeztwTc9RwvyK4p+H7OrEvu5uDbJ
         Q0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=kwYJpTFRmOHy0f8PhNFSLYhaTPzc4UNLKYeDsb3/cps=;
        b=DWUUkIz47pOWfYPAqQa+eZWrN5QboAIxGcGJzipttqhl3q6KJVSW4ETFg668QuvxbM
         Sa+eqSPJY2dStJ3SMhYTGKuGQm4hRkliCj7Vx7q2GLjakGgYaiO9fs2D7SGmSMJM0ayQ
         398wGLDvIThy8KEKpE5CXUdNEReFXd7Y9B8wLsDI2Vnvu5wAtOywdSHuzXG1/TSdjWll
         wnA/dbG9Oq/3qYBY5fXqIzwyd5+q5DQwtsoOFEN9WcKd/O6wjehMTJfrHlBS49R7RFUm
         A2gNlW8tanK7giDTuSjbQ0VBX3xZdtfa6bnNKB2evImIt8haKXLh8NE52b5vwVYETnsH
         B6Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=cioL0yS+m7iQ+Un4y9KPRfCvUwbZxC0xQRu+SZmRcgaQHlaMpOuyJETcrk+xsCydJS
         rx/JXZ0vlPSJ46zxZ/moLbkLzEFFO0TXJ979XZx4o6mPym2i9kzroOI5kygxFEe6Bi5R
         LgVxo61fu3nXasj+kizAbtRICOyjFgRCjtp6XrZ7uzeP0UIS813j7bgUxON3fRhe9zGY
         e7doqxvCPS1+FdTC+4IGTzIMO34POO2/rH3keQo332wYpg9bskUCjm7FIcDtJLzWa07O
         /D1x4xq5YKRCc7P8jD/k0p8unDHZTD20lZwtiaqEydbmFKT/XzVNkmPqitS0BB28LQTQ
         x6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=bdnYVYlajeoK50Inv8ttd/W4HthxxUfJjZMe6AsJVxh8eFJzx3ZxQMjwFxrAmvCVxY
         SULvmIYDxFmW94G94fw+S6RrJSDMakyWlo8kI/PtbLF06jz7o5YfPCUuCh2Ta7cgD5/B
         24SxLbnx83ieKkt2sKF0r+HDWEYpkQikhn6vP86gllYlhqf+DCdarOdcWNvNlffXQY+V
         OByBvvHGOFYnbei+6WiW3LGtVi+OHIpJKMZwFeycS6o5wknJu63nJtffQzWoEX0Mzjew
         43Lkcvk8kFQlJNnvfLycjZwI/Pzhti4np1osAae8JEe1/LaVcGbE+FkOu6coWidv6i1G
         p7KA==
X-Forwarded-Encrypted: i=1; AHgh+RouYSAKDMZ8GeG2TNCrjaMclHTA1mDAsFgA5HqSka4X0E7l8BX6I8slMv2jOoWdsOE4M7S+j5vb7eXW@vger.kernel.org
X-Gm-Message-State: AOJu0YzAUJCEy/o6GteuXXyVjKtrMZafKxsYiXJ/2ZO5L9rYoUL2MYOB
	YzgfBWzoefqG4Y5olceuKaEiOyEYITtTGAXvC9zO05a9UOXJoreJ4/W8rRreEkziVcecd49B2Bg
	EK+xZLcWZvrPiKfv4r5zManYXgZ0vaKs8F+0p8sKx2VLbkhCGWfwnh5E1OmZ+bh/wOLURR728Sv
	deGxZ1oJSavCR0QtComserQnd7wYSk9Q5DQC97p+A=
X-Gm-Gg: AfdE7cl+wWVUAH1OOwCsuCHhpswMOjW1sZPn+CIyGKnLq5JSQQcyLghStxQJfFkZyQg
	15RlakSRQ/iSi4vd6+sUYdgbQvfRHNK5lfgXdB/xOG52V8Yv+wCb8XnRiLk5xulAPIay5MWl1Cb
	aOaDXl3uLCl9P0I/d4MSsNI2NKpIWiMLw2o8nj4EedfRHJTAUeRajfDY+Ue9V4SJtUtE1i
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880186d6.57.1784034979473;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mOd86638qFqUSYtcPje7R3wIULZHFE-F
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfXxK6FLJdDLDGp
 K77p6VExxjZ60XGXfUv2Axucl9xLC/SGcRB8+zO0QkpNhOyscQ2sic1E5xkcvt0OWoibv9Uk8w7
 e+m7kVMvNK+brhpqN5+kl1e09bx7LIRX7/vf0WGy00xilZxZWJLRDq2lcKZVipOtOCGjXg74WrM
 rZJixcY4lygyqD5PSdptSKNLvDDt5tY0TmBmhPZ5StUHZgb3kmZy3/mXge1xz5MHxx6+Mkd5N9o
 kKqgg8ugVBRcYrRDm0qoRoNOPlOU+ibhu+IX+NRXpvWmKJidS7w4l0jy1MY+g4hQLtCKPJ+CboG
 k9SHdYjlQCD99s4Ns/Nb/lGrqUu6WsI/dul9bXpGWta/S0ya3GokSI+wFL+eclrep/oDmvaouj0
 YM46NEMk9Zfj010eDeWqvlnTd+Aeuko+hjVjakRvt0c3bUwRzC58hlOEuuwu/kiBQEvZ6ml/Ugu
 wQRp7WdpRKD8sK5fw4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX+kBTnvWf6vXQ
 uUMJP5Yj7BKuTVCnbVg4hvhF5MMjyLvkMnQZ4c/9kP2vzFRzgsTcytIKE8+78NFMxGlwiINxUVx
 gqKNG8timF0oVyDMTBiEJJYzXyC9Yn8=
X-Proofpoint-GUID: mOd86638qFqUSYtcPje7R3wIULZHFE-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40057-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:vincent.guittot@linaro.org,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:sudeep.holla@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.
 kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,monstr.eu,linaro.org,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F015755086

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe

