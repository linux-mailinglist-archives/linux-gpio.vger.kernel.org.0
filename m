Return-Path: <linux-gpio+bounces-25671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33876B457FE
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 14:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84C67C8519
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58E34DCD2;
	Fri,  5 Sep 2025 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yrk2MU6b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1A32C301
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076054; cv=none; b=UCpKjR1dRP17UuKfu3hRiAxWgTg3QOwt+/mAvt3qkpKuqz+gB/WP/4rnKdXB6PTlr48T/7PtUF2NJ8fV35y+ruYjHfrq12dF0zBDKBTIEf+9uT36/vAgG5GztEG4hPyCgzY8Uq0EmpFoDXfl0OcXusL5C2W46BVHKMOhOy5p0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076054; c=relaxed/simple;
	bh=RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptZzUygdh7ck3h4lp1o5gziEy5bOe5gDGWAEYIeaGGFP49eeQvLU+Uf8OAP3ptWy3CQZN7lG9qGLl9PYyGgY3RhslBzKBd01m1yVqdlEuYklPhW58/9b4DynvY5zxq1oFF0zHGFLy0O/mwVgUGxSNHKVDCfxxtOaQJf+EDWEbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yrk2MU6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58574E8g008089
	for <linux-gpio@vger.kernel.org>; Fri, 5 Sep 2025 12:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=; b=Yrk2MU6biv7gcNOl
	dkOKktv5V14eoWw9FdK0pOkhfEqLFuX7WIcDIU9fjNeKTcKAHgIb3eGLRYIY+a5x
	foIbnY+zxbT6ldQesjFPyIftRKGfafC9eW+Ym5t1gUJleQNreJ0Q+6862MnJUYdN
	u/V01tJOrqBEFUE4N0SQMRiJawdklu14kIHgPe/Ui5A1BU5l2qo3U7bjp7BzXek/
	u0sPinUXpmUEPW9KvkMJ4w/P8rh3ks3OeARDuDhonAmMKcWGE0MuIv0ith7lXIfl
	E1XKzFJStNLQ8YWDFFmkZmfj5dvy2HbfAdEX0cELQ0/fIwNQ5RGgqJmjGQhj0llQ
	8NdvxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmju3cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 12:40:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso9596961cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076051; x=1757680851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCvW+v+WM4Nm5wMAGPraUo2CrUGI6VSVlbDrWsaLXAY=;
        b=LfMzMV+BGpnMwbiXD/cow3jwx+SVA0h3XlWqaDMJ9AyFBnvhaQB2EAvVVuQEj5OJq+
         lOCwrc0a3aInxaNImUpYznczKaLtMPpMZ2ru8BykKBam6FP+IYjep1EZap2BYchQKLzU
         IeGoOSXM4UXwKR0JgemHqJvctBZ4CK3qM3dgNmbp5jnZY/yEGPfjDREzrP2birmqE3a9
         hrc5/1sCo8hreLo+5Q9ebHRMbd1D64v3Miu9Ew45a6lMDhke+RTMVlhLFAPMP9w3DIGm
         P6zS6Mk9UcTK7zsSPtJCSIZIAyAgj/8Hut1xV40ZN9/xQzoMqKGvMPZz0+fRALmtmq+a
         hHMg==
X-Forwarded-Encrypted: i=1; AJvYcCW9hw4mhrctdnR9v1hjhEQNjARSbAciZk1Sxv9qDly+sGN5soWR7wjhV3Njfro8Rzxglk0ROdajmvG9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyve4Vmn4UClboTqbXvB4dQ3MPYzoee3Y6Xs1s/FBVB4k3TKOCW
	g4duL8c+O/IkXI5NFVWyqnKCVvWJkGV20rt7og2Idklxn+r32N8j+QwV9EwdjdvKEjJANdhdJni
	infw0WPK8Zqbayqe7XKzmh6UP3ctTliUuX5I6lxs7aZPzcLZ2y+cjCRAzSd0/KorT
X-Gm-Gg: ASbGncs/pqC+Q3fu2GqdpMNGA+E6F6jHgju4vd8lKYvVT3CaxEHhDHAl39UoRfshags
	1X4yUgUcnG4BYzavJQXC1sqyPMPhVqph2AyrEU7mm36Q0+kFldWE/Nxgno8obX0rinhQs6mUq0q
	ZfY98DxPsC5lsKZneVYWqS97Bfh2KlBQ0CswCBhLtHUqp8np7r5iEsmOY/IDhKAYcKwEIxmga0Z
	MeYQvjPoBGrNSFN2tJbuw0O4yAkp/mfp+4FfLwX/snJImCOc4MYSCbZN/mlNLP3asfB8U6AZHve
	BMxQZlZvlyHaLWNrLJrgjeo+6E/M7RFo1owXfnL0O2i2GQ3/2gIE4ln2ODLCzvk3Vkyg1fpD3SQ
	xE/tuF/HRsCqPU+ogzGSaUg==
X-Received: by 2002:ac8:5a48:0:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5eeb8a299mr9780831cf.5.1757076050551;
        Fri, 05 Sep 2025 05:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhwQd/eQ/Fwu0ttahhKY21yFepGgyDfwsgnKKPIe1LttWQUPiyRGUF7MyOygLic0H9YbExGg==
X-Received: by 2002:ac8:5a48:0:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5eeb8a299mr9780531cf.5.1757076050011;
        Fri, 05 Sep 2025 05:40:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a27sm16591905a12.10.2025.09.05.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:40:49 -0700 (PDT)
Message-ID: <daa84fc7-b191-470a-933a-b41b8713d1d6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8250: Add egpio support
To: Sean Parker <sean.parker@viasat.com>, andersson@kernel.org,
        linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904170613.68855-1-sean.parker@viasat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904170613.68855-1-sean.parker@viasat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bada53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o8bG7SlRqXj42srI09MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: eeMBhmi20SqdibW1lebIHRQ7hwxNEVfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3f1NBbXqlpwx
 9jUgPihBcqpEAYViSjU0goAJzLj7wWg00Kaj2xtwPMWLOQZvGf8x5Ks4wptQAw32bzM8ueGOiju
 mR8sVJ8oyL8TJPhqhPeB/cynZNSoY4I5rlBk4d4zXYIzL1iCvn7E6pJ87HNUTlIorNHyQhopvak
 5jASorwRTCiWDFqrbFQjNZXGJsy3Hh2jhPK7fxs50uJP903l1b7Cz8XtNu4Q/KXt02YqfyxfDaf
 bGLXDTXPOOJ7XDlxOuk42CAyuf1us0CMlgGZRqiW90gO39YCVf9Yf63gzkkeWGtsKWnghn2wa2S
 3cjdMU4YxHAny7OnpxgVbQPnk0lpp7rn10L0Txgy/n7bf9XI84Yzqz5rq11Ag4S66rJkDrBlf+l
 5US8l+PZ
X-Proofpoint-ORIG-GUID: eeMBhmi20SqdibW1lebIHRQ7hwxNEVfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On 9/4/25 7:04 PM, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 180 (34 GPIOs) to be used as normal GPIOs.

* -179 (in line with the code)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

