Return-Path: <linux-gpio+bounces-31745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANCUJ2pWlGnxCwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:52:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365B14B98F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AFCF3027378
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994E333557E;
	Tue, 17 Feb 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZimxVwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYmCz8sK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A63335551
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329103; cv=none; b=Ay4L5pk3fVvzgvUayckE0UInn7YfFGTeavOflxkKC/l8zaS6lyzxzteQvdyAKK45G4DDlM6OdNx0C7Jmyj9h6YM7Wb02EH/4fE5vExn8rY79I5QTyHR49PH6CMZFl8n6hmXPeRItWCilpNQkZIcHTZDBu2BveCNhpf2UmvYYKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329103; c=relaxed/simple;
	bh=fTr5O3C3gyG1GEXD5hRz2rzuUHmMOHtghcbKPoae4ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd7podwsCjrfn7ldn5kHYplylrP2lBWA2pnvh+uyc/41cDvhGP6lq/3V30lwKAldvxi56iotAXkhuXS3GrJ85PNDbnQUCXVg7AYFCwMpc2l1rWYR1PCT3An0jziXEUaNguc/tJAT3Rak3FVMJB6vlQ1SiqFDKk90oR6ZJQWTqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZimxVwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYmCz8sK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB40vS1943469
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RkeoEigFEkq61Hzx1HfUblX/
	RJEa8RLEq/5l5Q8F6ls=; b=ZimxVwtmV0Sj7ARYGVucYVrRXO+xo76ekptgrrWb
	q86uqKyPBPxRwE4Jwdf5j3eav+G1kFKbEwrq8d7jxHDtTSIV72I9CcUYuvcPMQ8e
	4z64NCAZxFZ+ttznkuJ5XlQ76tYA8T6kj5vC2J2NkngKwl49PTZMtoPVRHlwucpQ
	8SRNpCnXXlH0C5fC1aFJDVo0tlibcBUJkBnKwYNiWij9c+KAGtouuUP7Xyr6olmv
	Y9BWd14cXjoFXsj2I6HaMR4V+kWrjiA1QzeuKn+7OVt4wclyYfKRESJphclf+coq
	deDDdPtp5tqsnpDn4Tp+ZYN6QXTt1cNg/OX3XsYGdqL8nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g04w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb37db8b79so4723609385a.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329101; x=1771933901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=HYmCz8sKfZheXAsAsB07EauL9y4XAzAmY8RX9sDl1xYUsBgdEUnFSjhkkXDSbiWB2M
         wjkBIDOZenmhGd0S3qGNuSLcTSymdGklc5rYa8vtPTZoa7C+GvI15FXsvusFr5zsF7RK
         cWYn9MfUQNx6LBzw3M+oDdQFNQ7YOveKah4WVZYbMNYNb9ag9dn1c0W03VMRCOae8fi+
         aYYsr9hcQctsN8WA2yJfvN4l95oGILhQ5z5GEb4DGmStYrqxLut/5M9U5ohCHOF4bAdT
         vunvHYOSS3cfTT61KC7V7gEMBCgZVXApzC16itnHAir9daY/3YI2I5CiFYSzCe7fAp8Y
         Ii4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329101; x=1771933901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=SNqAhUfMTcwa+yYQ3UY6A1ZWkGy0KVp92ihZhwlXWin3U5ujtdAy0rf7Jaj2Mb2WVg
         hQuUUk/op9L9gD3QzKVMOuqMTsCHaK1reMcRXve/Mhhg42Hfs06RE8pgfSnE01dNUTyq
         v0ymOgUEmCSpe/7mA9sxV3mbsUjDrly4yBl1Ip+Yy8/01+o2tmahsudxFAddkGba8wvR
         ImWhu17iTj78/eYx975t/B8xauGWlzsgXdTDghHwlzfhR5HUJLdGBtL1+OA0AwSHAvPb
         S8erRiYjYU/WwIMy56Y2TjEa8p0LLJqKMrMW2RpBJQe91usQ8+Lo4fkSRDjjzMUQ8t2F
         cTDA==
X-Forwarded-Encrypted: i=1; AJvYcCXm9a7OJfprzTaqOjg1mBHXG9hc0TDgnzMs1C2GkLzRIEUstuXMuVdusuHzURBlipmpK/X0s9YkqeZ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yza2olaaqL/9mAyjl+zbd2JhfqSCZ6cFE6U+vkAxPlSNz68q4lO
	VML4u56KA1z1kO0I3D9ksjmb3B98ZQUetJnUbztnSc7xC4f1bLJShnLOWtgoT//KzinNlwwhf1h
	M4Bq+6MIN90D1VXOSzIRcK0WIOPATeyXOTItDC6xx06PI/vfWhAyaO7pzbfUAscXT
X-Gm-Gg: AZuq6aJ9gBCOScfmLv0EE6zTWedYez5aER/7ITrAZvrlNGE3UFJJ+hSYvQMlJ9askYJ
	5kMSQE8HP+KB51bjf0oaCvLX+/igEuMNeycuur387x2+tzw5EcUN1FY9ITcCHrSg7U2NMz2iWJB
	Mf0ahfqSPDQvQdAhb60i3WQ+bfoQvBLtk7YxZfHUuo0gi1XfdoP1D0wuBY7zfz6e+6ZY/o/GsVf
	+mzTQwtzTHy0Jyedy2pfq153xhdCiZFfMiudOzIGRfAS97OGUnr/I0+TI/NdTXW+vUyKe4QXoH/
	3U+uYwkcxPCSROr5CcGjNJkAHDSJUoZ498PphxSkuFtw2qdrA0vXObTEjReu9uvVYeHRWCL1aRZ
	Fy06nYkRaV3qTC8rQXmd6fK4LHNuw0vU/ig4a
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339160285a.56.1771329100542;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339157685a.56.1771329100065;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a3f835sm104875305e9.25.2026.02.17.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:51:39 -0800 (PST)
Date: Tue, 17 Feb 2026 13:51:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 4/8] pinctrl: qcom: sm8750: Expose reference clocks
Message-ID: <h42urqeyp3njwuekzer3zag5nv56z3tdvckssd7tepsr76ozwk@2uwt7yqamkmj>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX0zCnuZdWBidY
 tZQXuXKHB6JEGwzo4hshGDwwpqhzjRX1Ymm759zFVediI4IV59JD1SV18wwOaKd2pVKLYQ/OYo3
 mMx0D/e+DwdhlP8KUv+JCTVI27AQMXfWmwItGV6vBu/L+HsLNWBEb0Y/hK3bft71H1bnJrEfcu+
 CXnpBarfTuPmhy70e1U+AJ1zDD8JJ5UkR8PrP7nfEyBuSPU3y0dd1BoJy2sg0moJfK5bUBQ86/p
 op23N01HhCMe/JOclC27IxR666Mz60IlB7zYfwcQYrlU7IZerQrQzM6yWP5WTc09ReuC5jnvjYf
 PDvZZsZnjqQ7Dnww6Qel2UvXF8+b2SsW3rIfhezURESEEpfBjTuzMjfQi9rj0wLXlSzgKcBh4HE
 m3gzE+cwHjvY5nZMldHzd4vdTqUkcXp5/x3eoS5YivgsSU1wuXKTKQy21tCZqnmEMh7VZNk6xV3
 PWadXbffJlEamDCs37A==
X-Proofpoint-ORIG-GUID: cRbVsrFpvl7gce-mHudQWG2apToeqGQb
X-Proofpoint-GUID: cRbVsrFpvl7gce-mHudQWG2apToeqGQb
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994564d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kBfrMkYwO43iJOCXJAkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31745-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6365B14B98F
X-Rspamd-Action: no action

On 26-02-02 15:57:36, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The gating toggles were moved to the TLMM register space on this
> platform. They lived inside TCSR a generation prior and are back there
> again a generation after.
> 
> Expose them, so that they can be consumed by other blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

