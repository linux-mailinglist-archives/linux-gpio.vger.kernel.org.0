Return-Path: <linux-gpio+bounces-38434-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0OG6KbKNL2pCCQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38434-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:29:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD668376A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=miUBOYQM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j8rEvVUp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38434-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38434-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887CC302C0F8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 05:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF43230C160;
	Mon, 15 Jun 2026 05:26:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48863093D8
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501171; cv=none; b=a6cu7/k8lcjqO/OyY4DOU4exgGpxM9hN633mu036mFwZW7+6bXJ+N+efcA9ccyKvOBGhw6/JTSvIMcs9gshBpcaZqdTma0gMhz03EzlLipuIBpaiP9xcjt/Zkaw4KQZeCHfby2msZFR0ZLwQb4T4hL3+tB5aQPEhvFjPlvG5OFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501171; c=relaxed/simple;
	bh=YV7/jO8AWy/iVCyJPFG78t7NVdl+EeHWvWjZzeolsUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpNnuZCcX3Fqq2dZWRw7WOI2Tpj1Y/YtKqE3GUNpheX+CB8YrRrgbNtK/LR+YAzbwl5RBmDipGI8Y+ebXI1+7pLoqJeDlLjTr8hUSJ6T5z6HVHpN6Cm+LBqoCpfFIrcO5YOi848hW8YQeq9NmVM6jB1Oui0PYWU6yTz4KkvAuaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miUBOYQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8rEvVUp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1ie9X2648376
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=; b=miUBOYQMN0YjV6pt
	1swg2BiWxYIXVQTR4hDwb692llrx/97lR3lVKysN1dS8HVP5JWdhMZ6+8u7KfPeF
	0GBRbPWT2jRnb0FDTjzBMBf1ja37Y0ysunqBt2TcZ73Qf+Wle9R8IMYafMc8TxXc
	R3oBTO9S/Uu+UT/Cpqkrnw8bBhLmhCcMrDofq4rMTQLWTSlJQ/dcJVV5VuqE5aBd
	/iL7PkNx4tFqyHmFKLEZWPs2PGE8dwxW0Cp7xDdPULZzO0JfGTyvraDcdm+pgpOm
	BQPuZEAnRy1d+WkM6JvrPG1+r1wbcLAEi/p953Jx1/Uv1n11gP2xK1fonUfWBeCn
	3vfHHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybwjqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:26:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so37974675ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501169; x=1782105969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=j8rEvVUpHEG/GWUMm5okVwo8VWxuYAT+MuoGWosyszmxUpSreAP3QSSdwh1ShcLFBU
         H6+WHcoVUYDtDVtnMgdjOrA7GS5EW+k0q1jhaD7JPWNdB/rDtCYODA49LlegY2OS6aab
         F0nU4CI3k1plP+o476SpMl4ba7/xntnXyigsfTQu5VXppUQ4C1zOP5BmWKDZ8kucDlWH
         h3sPtfgWDt33lI2xDi5yc2BnikU3b7T63GdAz8GYRk6jMuqtZtfPmn49Cd7cHwyiBjTv
         S1BLUpqvIN0bpeaI4DOppB3i2UozFFOOwWbHcWPnMwB7WZFv60kcj3MZV0S7kl45sHah
         vN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501169; x=1782105969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=eXJXxiVsdsAhwXUBShDF86S2jjH9HneplItHqibvKYsaGReBzKzSas8yEcs82KBkmh
         adOn0OFAC5Xbf6RfpDpp1oO/nUu4Kpfc7BKP/TgAZUcfwJsJBv0XAa1rZK/k1tkuASG0
         sgfj7Br5SadyWEbgdxshENUcXqpI9C+TWwWxG5TdibvDrl8SSsjEcOIcAYJfLWvmWQED
         bkoOBD8u36zl2Xzl+IZoj2aJkDASBkp1Ayb4jd2bHlxjvY3THibNMzAVwY1Z1EfJg1aM
         Rek3UAlzbXQKLehMZMXsA/WcmUZWoPZI1vtqarA1afwMaXKYAUUptg8oDxUZwHKo3R3e
         ERFA==
X-Forwarded-Encrypted: i=1; AFNElJ/CsejM2KMYYtkCqcFeHO+bQbENsPu7OjGJryZpyAZ5M+9U77D/+n8EXs3lAvL1SgBTnqvfRP3tj0gB@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOA1CnqtH5XbUl2992+o2M/sDPB5Mh1TrwmHtjzPdJSAU6TU7
	JtR25aSOMyMeBcWaMDrtONRVSsrGvIlqHLHR5F2jkYZXf3ZqOxJoTTHw8gCfj9D278lsR4gPloX
	fawgJiq5wuOu4NE/gulLMNi15A8aOM9BFf93UwFbwos08aEtqHkZugFgG6jjvvlJI
X-Gm-Gg: Acq92OEFUsUL9QgR01M+sEAcB/8VwobY6Cem098htuInAPTejC0j+UW9hwbqFGKtKxZ
	CfQQIG39fmSuXSmkN5I+dtCAEYQ2UMjLXqjos8Xq86d0ca/EKzF2582CmoBdeBEdd4N2U1uSUB5
	YbmyYyWhNr7acRbFQCvzfc4cy29drQ1kYpFkMeKiFtb6TinNlJdUYNeYwpYbKh3WdvXkQUhphDw
	XOePcVr2iuBJM12BYHCuGKRce/Z7xlBO4mkY9FEkbnOe4uiNe75NlRMzyxT2Hcl++PVy03zxBbB
	UaO2uKiJH2aC2x8WeGn4YeVpMczH4uQ6w7u9xCdapaKsZ6V4RV8BLfJDAKFyDN+UJaAuTsDB7su
	ngDoWgBBSx07tWMC/+lrJfrojh2zHgrvggBsGkaQ91RU9fVb7ANo=
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075825ad.27.1781501169142;
        Sun, 14 Jun 2026 22:26:09 -0700 (PDT)
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075585ad.27.1781501168704;
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e59e1sm87808245ad.17.2026.06.14.22.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Message-ID: <94b8d0e4-1f9a-4905-b26e-1db10a07f271@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:56:02 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aLizyv_oAUHX7-_EXWJYy17uDWRIjVFF
X-Proofpoint-ORIG-GUID: aLizyv_oAUHX7-_EXWJYy17uDWRIjVFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX/t6c1jCchOAl
 SUXNF7sZCCVhGRhDrKRiilANhpxYPoAk4ywL3qy6xo0CCx1hRIoTfq6GxQnE6jDzjeLer4MQ9Gb
 N4UrO7xxTAoK/dEI32Wa+8RF39XzRgM=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2f8cf1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vVwBTKN7el7THSwTgNcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX+GpKEpilMJMc
 yMhntVcIOrvE0uRrU+6yd/Up979zIkH4ogfCNBltzI/+9YXudQAP27gkwb9jZCmeBKIG2s120nT
 WO5L8EuOHd2i7cspiKw3h9mSIZyLWeqNQZjiUCyJykEL0EjHc2HX2wXDZ7+w2F9okBB0ucwJeOv
 bgIaThe+2oscnn8ccJwnVHk9lCGAOIA4Y7POUbbvK/eVXOEAmiid2QcGpp6VsKn/sn5TM+f3bof
 +OAsm9w9r5KUikLeKbaaqHdWJyqcBIKtiFZXcgOn50n/MGErJ9o9XYGfg3XELsxkbUKQaYXk9lJ
 xD8Vc7lUAijCrRv6bRCDQq+vzs4NnCX7l6zlu6s3EIjuY0OI7COvMNvhX2k1/UexSlUHetQyQ4s
 NaozYUx+Pt+pM3PzfOsCYod7nzYJhZiobomyoVQpsgVgDWJgGmV8qdbeCOAYKQBnUif1T78IHHR
 ELsFU3HiH7DbMVtPjGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38434-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09DD668376A



On 6/11/2026 4:11 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> There are two modes PDC irqchip can work in
>>         - pass through mode
>>         - secondary controller mode
>>
>> Secondary mode is supported depending on SoC using PDC HW Version v3.0
>> or higher.
> 
> [...]
> 
>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>> change-id: 20260522-hamoa_pdc-1517acc2dcd4
>> prerequisite-message-id: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
>> prerequisite-patch-id: 152df6e30f70eb1b45909ce2793bc4277554b7ff
>> prerequisite-patch-id: 118bd4216e0386e7214133f53153684947fa8dd3
>> prerequisite-patch-id: 1f2f272d8ad1f7930d462e6349bc49de815e1ba1
>> prerequisite-patch-id: 3754ffdf536206353f74953fd6d39804ff7787d4
> 
> This does depend on the changes you made on the driver, but not on
> the 30 bundled DT changes - let's just point to the actual dependencies
> 
> Konrad

Yes, i let b4 handle it and it added all 30 changes since the dependent series had both both driver / DT changes.
Will remove this dependency as driver part of the dependency series is already merged in.

Thanks,
Maulik


