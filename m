Return-Path: <linux-gpio+bounces-38182-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CE7dM8AVKGqy9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38182-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:31:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B580660948
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 15:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kMFXdbLt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iTePdh9t;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38182-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38182-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DB3630325A9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 13:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB90B3839A2;
	Tue,  9 Jun 2026 13:27:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF52C3257
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 13:27:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011667; cv=none; b=ns0tBxndHouurYwtde1GpgFHyYrpbr0wHQOCpbZd6ZwKAXAyL8hBGjFSraPS8L06zHjCai1zlGb3WLkoNHz/t+eNwDNDM0PHqNwVZ964uuvEwyRfx8F59yet0rKgUb1pgsPyq+rThFhEJ0iso/tIzgrAMyWA/US7jkpqPe5Ouz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011667; c=relaxed/simple;
	bh=nhc7KCz+OiYOb+UWgD3CZUOWb1ZWdh52MnddLfgT8QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHRApScvtfZV3+69BlubZyi8Qu8HDe2Q1cS1lQZ89lbCAlnSACBWRK7uAF4J9ZLFJ/nIti8AtGu3ztODLzHUkoCDraln0CWvgNNXRaEfmxtC1VQRZSs9gO7k4VObaklmrd9nWe4KdB+0AHZ4lryJsG0mOMIXhKXFkRSmqdc5NMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMFXdbLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTePdh9t; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnIin2668342
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 13:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=; b=kMFXdbLtYgXrT8sa
	NNtgbEqztvNikKrbSGT4KgTpkyEE377r12AZdx4Q4gsQ9HCCXamDs/AG84QjJu4V
	6xFT0nHSDSUy+vLhhmbsAaqM59S6nPCvKzPpxEqBObgMAtQmIxBs6CYwVTy9+f5C
	wAo/JWM0xpQkpr4C7y0l++x+aBadls/np1Uy3PWugi1p1IM9APCulfnJScl8VXyc
	Tpp4Zrvv2xXlXlu7RZ92dZScnEzC0Yvc1BUkPrFIbIhqt9X9c8GRw1zn+yDFDLvU
	ZHwg9QaVcws50w/cW1x2iH5rCiJIPJB5vcEDMfwwWKVR0HQoCQGJMf+rHbT/uBlO
	CU74GA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25smnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 13:27:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768e1d798so14182471cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011664; x=1781616464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=iTePdh9tlDtOHRYalu3pLZSDBKWbOqAiWVAc2XCvx7zaKbEIoRoMG3QpsMVYgNNYKL
         wUIYXmT68mINlil9dJOR4/Nn1OljEuv478z8RMj63sG/PmEC1ZTiySNvVuVzotVX5bBY
         0M0pMwZAbYUReEgT3Kcj2595liYE6YhtpsiVcmiiApdXlwvn6a5rxYFYZKyFPO+VfWbj
         WgrTdZ3Z4tzTtxDjXecWUMstVqH4YNPaq1ONCf+JsTSvTTiP9gZuno3p7Q0y7DbZGqUx
         136kvnonI76QVefg+mrufGeYnNCfY+GGkltsMXl2zo9Vio4ZNkdnhWUK1voA/0sEIGes
         hTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011664; x=1781616464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgnLV2/w2XT7HKp712UjzXN1qIRKgOYZl9HRj+d3eUM=;
        b=ovKUUPeHoZ+OuFFcZI8aCr9rMLYhIEvVsZWzDaKy9+x5Zwzes8oXuF+taYsD1QMQBd
         h8giBP4CbxaBndKC4avm0xVbg3ep9obYGEVYag0aTv2k7eYtbiZ0psNaWrGje9qzCiq6
         0Ts70DPuFVsg/1ISQ2o4YPE7B0zMMYipCYcG2rFB2VIfT/QqbhyG3aAqmGM78Z1kM8DJ
         K/mSXF+tfiVoMZS6pva/etPPVZZ0A0hPy8WVoGeXMC77SFryo0814FaqhSkNYcV2Qr5Q
         xSz4OchANqAzThvUUZf373ADYSYQ7JHHIJ7DQ4jYBkP5AegeHbK0KhS9DyzM+dtSbPb4
         uhZg==
X-Forwarded-Encrypted: i=1; AFNElJ87vyS0pjfwaA8apQyrlz4HzkiuG4g3Ksnop0Q1aq+Oz7vSp9xkF+Ld7c7NkPZa8EQoiIAoM4/XEzgO@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKFGq2ismmdO2C+RoSp2Es71mStMOmj1JXjWhEYVwlMxe5MSV
	NvTS+8JcofkZooMhfipRAm1hXFOYPGumjQ2CNxnetwbDdllNnGxgoJm89kt555aTKTDKeZpCW1J
	BMsS86xiDV6Biatx0mE/UNywxiCwiIt9OS2TGx0vagT2QztzXwjGxHZ9nV78cmPvm
X-Gm-Gg: Acq92OFaK5ru6LKsst99G0Ndf7bcJGw65GCLG67U0TkbzR7xRLx66TgmLVdnOt9A8hB
	BnWwG3ZVAlsPff0r6H959jR1bVVhG9DWTBr51+qun8Lo3iqeL3JFETdWbaVUyYxHUxIoRQPRbNd
	M8YNJpFTutPmZNtulRVcl7YSpp15VLrjD5TIQo+23A+rJ3OvGvv5wZnLvLdxrkk2WzfmlCedx2B
	4IcPvrphtXIBtXjy4MH1uXv/qT5WElQE1UZWQ5hLJ174EFAEUHmXH5+xnvj0IY3n0ZC2XFEJGzI
	504bOunEbXgIXJNOhttCQaXbC45DnGTJdBBbcbrjouxVt3KNfqvDPJmuT0VCnjTi4b1nh3ya0Xw
	6o8mNc/MOIS0k1he0PIubMIpeNKp04xfkbLN+8mJVonl1s7jtBol5P0T5
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190603431cf.6.1781011663513;
        Tue, 09 Jun 2026 06:27:43 -0700 (PDT)
X-Received: by 2002:ac8:5d0f:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51795b90308mr190602771cf.6.1781011662748;
        Tue, 09 Jun 2026 06:27:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1058581866b.55.2026.06.09.06.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:27:41 -0700 (PDT)
Message-ID: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lmM6_8Ygu6t0LfGGVJtYayh85WWaE1jx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfXzNdjrjxD0Pcj
 UWNIYOZ+Dapqtlo6biG8p/qPh8wZ/TQHryf/W/5ahWy0qXeZQ9fOylMt5b3yw6qqegjOAvSdFGi
 pruXuRs1hiihmAQTwf1s2RSzRTLzAaNQJI6YcinVA3GSbR12SbcOJulcMJsQ5HP0jcuUK7ZS4VM
 RQVLngZXReJyXIL1Kso4OcvHqCFX8xTrByAFsjoYHZ/fPLKfG8FZ3vFrF9m4HQ4gW1MAJXen1kM
 TS74oHF/rFNErBPIapdkBtdt+7iIm8skpg1y2Ue+j2s+PuINQHW+s4sOpYHUFpYKp8SBtcOq3dP
 zWyGHae15XCcNoBrDkRrhgFHTbsbzyOBLcsJmwvrZcp+1SUrP0zEips1sIIYlquAnq09d9nFX12
 gqtkWd3aGga8Bbbrqci98ZHErc5lFdvTkxaNqHP1Fxyjzcz6Ki/p7GgMOjvXK+1vKDCZ6ML4HZO
 mE+jn/KxXgEF6yQdpxw==
X-Proofpoint-GUID: lmM6_8Ygu6t0LfGGVJtYayh85WWaE1jx
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a2814d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZVpGCM6XPQlVWg26268A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38182-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B580660948

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
> 
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60

With the changes split into separate commits for each platform:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

