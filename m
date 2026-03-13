Return-Path: <linux-gpio+bounces-33313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKTuIpu1s2l5aAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:58:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4C27E6A9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA00E303B16E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 06:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDFE36309B;
	Fri, 13 Mar 2026 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL6cErav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agrBEDao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CE34403D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384964; cv=none; b=eJrpYJ1x9t0G1zoBMNpDIVdSN2PVTJBfjAkZpVNqgO52q+VMUrtaFaSmn/p45+jjP9A81wyKYSLwhuhpEA6hty/YeQIC5BmIFahf8E+AkY1CE9kcX45ug/Qt+yNExe0thEYlYtaPNVwFZHvLwyQ3SrT051TKuOWSwgpk+O4NbUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384964; c=relaxed/simple;
	bh=uF95rIddmYlrMzYa9Kf3n/hva62Lji7bAUf8s7PNsYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKX+P8jovE+mp4rD90Pgo1HBX7PSAvgttQvHXfJr2hda8vGNppCRFrbR4HVr4HVy1/yFSGfZEYhucS0/T+25m8zuJPZNgG12riqDMtCYu7h83JVmyuGHvMW3XkhTmOQo33LLxeNvXyWOKOJW/c04nYOFfGV45A8CmOlNb+FzIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL6cErav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agrBEDao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5th8X2018291
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=; b=eL6cEravUWJWbYEV
	VbW+jlgiN3+63IntwGwDr3LN2mB4Vkc0EiP6+MUO2h4/alASxQCagXzp4tiNK7Ya
	9ReVk9MPCCUKIZ1H0G37dqwrJ0HdLa0JwoCCZi3wtIjt7aLPEoq0rcWms4Yc0zQm
	QpkINSixvQ7R6BD59yxF98NFm/5HrQZGu2mpAQSQoCwFd8OTxCYqBgsEGbPvCrz4
	bXMEg+jemy0PRhU11qXhGbNcYqqA6T3KojQtL7AylzjmkRGUDD5uCARFE+i+lRTB
	QlAiig/bcfO0au9Ot2SQJcu1dCuecEnpA1/bqpr+trx1p3clrKlvrwmHC9Tjy5IL
	UpjWbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvwb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:56:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec805eec4so12639165ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384962; x=1773989762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=;
        b=agrBEDaobD8iInpIavWXRC3SR7Mcp/mEaX0Z+fAVLpjqbADsUGspwVjCu3GOcf51M/
         ZmtO95Bb8BKlXjrzWCplT2Up5NMMA6JooevEU/jHnukqOpBpTbqwb8DT7Wj7Uhj7+L1J
         dmSy759NxjcUGckSmQfNdXb9Pz88KcI3KEmTzJ6rX0S8fDmJYYA+9l3T0fXQaf+PEqYE
         P/Exoos4e4a5HNqDYyM1HY+2B0QXdFP8bGtRTxeTrR2Fwep1dq5BVy8SjY6zmW7PBMX2
         oTghkgL9dWhrFkRK78MrH7TnK72ig+XvIZi+HrWCv3nA+FqEouQCWis2pt27GxCOXs2C
         fnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384962; x=1773989762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=;
        b=Pjd78Wnsfi5CbhvhS+ILeigEx6r6/9KO4pIic0iUjR50fC6z3hLjXEzzxqSNZRwjan
         lSokY5uJHEf4UKfsCh7RGc4uLaezFzbj4Mqjxc8cDAFr3SU0fSzUrMi8XbH9Vrep1MQN
         6RuyuSOKXlmbpc1EW1qx1LJ4hTOSIqvUNX1+vkO76GgsV3JBCqW+sP9b4uZYAZUEx6/4
         Kw7ZXOInSYM/XvaEZa5sPbKnDSiUADknOt/iiopk2pMvXESnJB6CitgnD3AIR9S8gC4l
         YYJbtHKHymjZEQYApHUBxSPh30NhCl941+T/skDoQNqqj5IBeI2Fy3ZqxKoI72s6K/g5
         zp8w==
X-Forwarded-Encrypted: i=1; AJvYcCWchmOow18B0yZbOBeRQzkxZ3ZtlAnE4jOAEQ3/n0EVQiwixz9Oi0mClxKrEVwphpSW4md/HoHYlrd+@vger.kernel.org
X-Gm-Message-State: AOJu0YxNx89MFl0NENZtYDXDZKO3lI4Fxoa2Q2+sRfGViYAOwh8I+Llw
	FHuqMC0E6n8f1j2un+tKsDSKskjbkNeZI98/1YhBZaf1dJhrIPrcS/2qZXan3BQJZrWNU1CzkLv
	4R35RPum1vSPUIXKf4e3LaNUU0D/MH7oIBv61NL7Uu+RPX3J8XkKRfj32jKJRmVG1
X-Gm-Gg: ATEYQzzMdEH8h6OPAmY2SqWVfA9ZpSZGi+36yJG9xSk5Ks5CtsRUPzw086DFan1Wa3f
	8PJczUCR2fPwCIKrrte4A3CksyEu0xTzdttwKX4ezZ/EFuDsGFV7Nv/1On4mBlYUUdRgcm5GO5/
	tS1+IyhHwQR69LKS388AhclFgOqDSkjZP7mDQ9uAHfj+8CWIMuOG9ihzVepviFnDLblzFjqIwsT
	9UuQwCDG/CbBKTG8tcXITTSRYZs1+PH9VVLQ6TyGLX769jRfU5tOjvBmtpt+ER1Cp4WSA65UWYP
	qnzQ/PHSgMdFd1OnRqPNPEM8i1ckXwHndF6tqKjYtvt/Jo8dM91qT2Nv0BTGFVUAFT8W/VArWw3
	BJqW40nOfDiBRsALtpgDqP8wzG3uqEyN8LTVr4SaoLiXBYC/KiK1J3/UcrkQfcYX8DA==
X-Received: by 2002:a17:903:2b04:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2aeceb0daeemr10380305ad.47.1773384961687;
        Thu, 12 Mar 2026 23:56:01 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2aeceb0daeemr10380035ad.47.1773384961198;
        Thu, 12 Mar 2026 23:56:01 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed9cdsm11279715ad.60.2026.03.12.23.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:56:00 -0700 (PDT)
Message-ID: <0a8996ac-a9ea-4c47-ae44-246d8ec93b4c@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:25:54 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3b502 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TA_BZAN9T5C4Y3A0SdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aU2hea5DyQ_9siR4Im2CRZUfwibxXmZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfX2A0NaskjxHXE
 FgdWT6uWQcc+DcZMAGheqNYfKTGWMULNbR+OSz2GjusheFZNJBeP7biguaDxmXBRg3PQnKmkh1i
 SyXwreiv0OzpDCYisWXxffBqIkSy9P05L4E3T7UEtu8lNCyRmHX0LOsRJE0W/RF0WOAn4riKjQV
 F2WePxawtVYy4RPnqMiD21uGWEvRQLT5/gSRo3w2FSSvVsxJdTcb4YXlZd5xxidGL6B8txq5A4J
 rEOQWRQzCSnsmvGFTJy+DTHb1dxamGpD/mDDgGmw0mDssqmh7u1iPDqHtxemxxYAERP2QV12N7p
 G8JoK+Rz6C5s9FK1IiBz4tcG5A20F951S37a/nJMIDE4WU5Ex1ndnyViit8Zpbs51MW2k7an8L0
 K8cjMr5fH8IXmqFdjAod/aiuoetav0doIEru40Kydvjm2iD8I/srUSoKqFkk6C1aJDZptZ+q+Sq
 t28TxalS8uFYhy8bQhA==
X-Proofpoint-ORIG-GUID: aU2hea5DyQ_9siR4Im2CRZUfwibxXmZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33313-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AF4C27E6A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/11/2026 6:31 PM, Linus Walleij wrote:
> Hi Kathiravan,
>
> thanks for your patches!
>
> On Wed, Mar 11, 2026 at 10:45 AM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>>        dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
>>        pinctrl: qcom: Introduce IPQ5210 TLMM driver
> Can you send these two separately?
>
> It seems I can just apply them to the pinctrl tree after review,
> no dependency on the other patches, right?


Thanks, Linus. Dmitry has reviewed the driver. Should I wait for the DT 
maintainers to review the binding, and once it is reviewed, send it 
separately, or would you prefer that I send it now?


>
> Yours,
> Linus Walleij

