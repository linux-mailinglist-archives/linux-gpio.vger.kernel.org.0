Return-Path: <linux-gpio+bounces-38360-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yq8CGoxSK2oV6wMAu9opvQ
	(envelope-from <linux-gpio+bounces-38360-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 02:27:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE77F675ECD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 02:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SdysEv1o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RmYZF784;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38360-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38360-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CECCA30B36C2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 00:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C3C28C2A1;
	Fri, 12 Jun 2026 00:27:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E02066DE
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 00:27:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224070; cv=none; b=ekvQ6uyYMqFC24g0kerJPzGL/xi2/CumHZ3D0kFhzPKRn6J7CsqF4ufFvjUA9vw9H5uXwMp10iFJRTZTzRIlD7ZqmjtRD4+cIrzslUokAL67u0uLF2CGDiWmBnOD+5I8vnFYP922ewdWrRUflYBAHEKBQMdcDmFjc6zVpNL9VlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224070; c=relaxed/simple;
	bh=qSRnpf31Y707qGL2cpyccyqtTU/m9o9CXwlp/XvXDNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4Kj0lw1V0XRWd4MZUSqDCagtg0eqcL0xuQi8V0QGfZZSiYQkW5Ids0WjYrvEuXRku6eqGy26uLPVOfAu316CgAe+vj2qy+ZTXz9NUmfxjiXwNqiFf5zgFC6AowAave5jW/p7RP8/+43kKItYHNcwxUJ0hvZPsktiY5dcUSFw0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdysEv1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmYZF784; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSgCo352043
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 00:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kp8V3cr60rRa7DRO2H4H2AfA34L/KJuxlxFE15MefU=; b=SdysEv1oeA7SNtNW
	14ZPn2xMHgyTeRmbvmHSn7j/5SqQpKcLaof0XToXct3t/j9jmV9xDEjApIkAME+f
	Ug6nsR/mxW4TmOlmKlQrw7Mpf8JZc95l1f9CSTK2ZRKGLMIC+HBLfBwtVB+TY0KV
	UzL4GGut101kuUrAgc/mr0/4IWlv8tH5LwDqPHIu7cFRpGmqZ2/X/zEgwUSiNpae
	908586RWeU17dLzrMQBWrqL+q4XSE9U68hN52zEkLQ1W+I9et/sBmf8Mb7S4B61Z
	POyzQuk02kTG0fHAsQfbhXcU4s++uJl4gyw+fTdZz9MVI3BeDp+rEz6W+hDEi5Tn
	au4S3g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014j0bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 00:27:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab036818efso205166e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 17:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224067; x=1781828867; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Kp8V3cr60rRa7DRO2H4H2AfA34L/KJuxlxFE15MefU=;
        b=RmYZF784QLBC46h191A5AgSy/D6pgva1Mie3nIZGxGf6JrzpqoWBgaU68PAov4lqnN
         vP3CvRz2m4piM3gg48tPAQs/E1K+tdh1xegaQQfv/W7SwUjsttjdbNEaNQoxKsjvfrCS
         XbIM0fdu7XvIlNeAJ3To0KJxzSzLs+ubS+9HKEy1/8xo66tTJw/kW8udQEBEjmhCWf3o
         +WeMGFWmtVGN0kBGfbEfqZAJiBsO2S4sGyCQkoXnZwuJbFlJ/BKi9bUW/Yi384ng34JT
         tufoFxK1VDsQLK60yhbmca85A0GKdfl06Vn2HiOzM1Sx0LPIEtGmzmPnDwJEiTzsb9dd
         4GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224067; x=1781828867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Kp8V3cr60rRa7DRO2H4H2AfA34L/KJuxlxFE15MefU=;
        b=EUfGI5920NyzDtqbmEAOnEtT5FJG3Zt04DHVYqsvOzVBk2PrV/6XMFSsM7Hu1Qch6C
         9tz/+zChlFuMHxhU1LILY3yCMxAxBARBdmK1O3MZivN/k/mdvjAr9khqpPwKEgfq9lDt
         NFFUbrPEqx4Wxn987XvcQcLvJZL9gKviarzM7Yw53zhPIunacnplCHNDZxsYWMg8Y5j7
         O1etfrq8EwXTfI1Le4PCbIR2NGZI80/OAYM+4YRyP255A45GhIrhc0LXfv+bxGRf1MtJ
         Ynel3PD4yOE23aFtPct031JcENt4o7tOR0koBpu5YxDjxgAxU1qpilshuz86o8qBQy5l
         4hBg==
X-Forwarded-Encrypted: i=1; AFNElJ9FRoY6Mz94pEKpdlegSNFe/wFyofgrpeSvXgfphS/IvD2rt/J60pD7/Fvh/7GnfUs02Dx+RAvtqEzs@vger.kernel.org
X-Gm-Message-State: AOJu0YxbegdtADZbuxZfXNd2AFH1ANmx0IFbz69oeLxn5riT1RBqnPxj
	PcArTYL39aBiD9/gvYmI3y9DrTk2tmuoErFStSRWjRJ9WwGavuUSImtrdtbGsSXVstgbHXL15vU
	10UpOg37XI3lPN+f6wrWQa4ixinJaAdDR/8VsfWz2kt7ZBwpW4a+K4u9WYFHB2Pov
X-Gm-Gg: Acq92OE8lptZKEvhd4NTGTV+8MEIQdvXW8H7q51edX8xqMqVoF2fiisna64QE0/caNy
	q5jXb05+FWA4Nda5r7Gi61atcD6vI0oQ24AKuehHOAKYcwC0vZobQQsfxySne5RT9pcPnM1qvSD
	uBwoxjBX1MT7f/EviPbNQSwDmGJF8obcE9vgOm8RmtfhXYu7J4RukWhswu8317nOZX5TTbO0kZB
	k3aCnlSwnabsYXK8aeatIJOI85Wb1AMbXiY1mqn9+owg6njMiL7YtyAAu49uO7B0DcW+AxtttcW
	Wqjpicc7lcJCixxPyAygTeR7Xry4IygJpS0B5q0ALOw7NG+bA7WxUjkd5XBknsLSKWtxClgePiP
	CsRqQ8Ev2cujAuijetPH68kC4+o0+6SBzhlhmj/NnPjettERw4khmuhNqIbYPjaCITsplslKVfr
	uEpMW6+uV3MIYxRRjm1IOcT4HdUsFpPeKrCps=
X-Received: by 2002:a05:6102:4187:b0:639:3b08:d64c with SMTP id ada2fe7eead31-71e88c4f8abmr222084137.13.1781224066744;
        Thu, 11 Jun 2026 17:27:46 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:639:3b08:d64c with SMTP id ada2fe7eead31-71e88c4f8abmr222057137.13.1781224066238;
        Thu, 11 Jun 2026 17:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm1596701fa.19.2026.06.11.17.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:27:43 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:27:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Message-ID: <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
X-Proofpoint-GUID: e1LJsQuAyNi1fFq1i1m4AVq5N3n6_k95
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX0dLO7Uurc1en
 uluEQU4uTi0dx/s4z9r0ilbFXzha24VyndJiH7jK4cpAwrA+8+fWKrAg8CNqrAW9uLLLQfd3mtu
 cwVcBdhReIGWliC2fvBoLA4fdFiar84=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b5283 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_iw_OnHlKKMRux40HwQA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX15azEjcMRlIK
 kSTYUHzbSe+fK6yg2L/AfXDPWyck5JFcexAf2tTB+3O0B8Obx2rh1GL3CD7INs9HJptjXpUHgSe
 2TR0tce5BQ2lfaiT6Py2Kq9ev+4GnSTMHhAwrQ6tRm/6IY9G2B62pWMPvwFGoq8gIuCmhFrVXjV
 qKOf7fQ5t1GlAnM3jrIkADuXAC2NnV3BG3CQ5bNSWF10FjCGLGaQfembXgbfbHms7eSrdBHg9pq
 XaCLXB4See7jLlHIQwF+GaaqiKsg7zIA6Qefqgi2KVaitwwMk9cpgw/V9iM2JixBqFwM5wVTsJn
 XBPsUb9Wufvx0Yf1iqLUScO6d2yok8x41Gr9Pza7kfAXI5Z2DyL5CTxFS6uU+czWqP68xPMkYPx
 UV19aApn/cyhfLC4AlGURqVUOM23h8hebVByxRYtpZUvWzl312bpNk9v07IrALmM8cfB4ijXeof
 sPEf+j3fxsFI9BqTojg==
X-Proofpoint-ORIG-GUID: e1LJsQuAyNi1fFq1i1m4AVq5N3n6_k95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38360-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE77F675ECD

On Thu, Jun 11, 2026 at 12:36:43PM +0200, Konrad Dybcio wrote:
> On 6/9/26 3:28 AM, Fenglin Wu wrote:
> > 
> > On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
> >> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
> >>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
> >>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
> >>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
> >>>>>> Currently, the RPMH driver only allows child devices of the RPMH
> >>>>>> controller to issue commands, as it assumes dev->parent points to the
> >>>>>> RSC device.
> >>>>>>
> >>>>>> There is a possibility that certain devices which are not children of
> >>>>>> the RPMH controller want to send commands for special control at the
> >>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
> >>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
> >>>>>> GPIOs. The control of the LS, which is combined with the GPIO
> >>>>>> configuration, is handled by RPMH firmware for sharing the resource
> >>>>>> between different subsystems. From a hardware point of view, the LS
> >>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
> >>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
> >>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
> >>>>>> child device of the SPMI controller, not the RPMH controller.
> >>>>> This replicates the story of the PMIC regulators. There are two drivers,
> >>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
> >>>>> driver targeting only those paired GPIOs (and we don't even need to
> >>>>> represent them as a pair, it might be just one pin).
> >>>> Thanks for the suggestion.
> >>>>
> >>>> I agree that adding a separate, RPMh-based GPIO driver would be more
> >>>> straightforward from RPMh control perspective. It makes the new device
> >>>> as a child of the RSC device then it can naturally use the APIs for RPMh
> >>>> commands. The main challenge here is, we need to make the level-shifter
> >>>> mutually exclusive with other GPIO functions when the GPIO pairs are
> >>>> used in level-shifter function, which means we need to write SPMI
> >>>> commands to disable the associated GPIO modules. I am not sure if AOP
> >>>> already handles this; as far as I know, AOP only manages the
> >>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
> >>>> internally, if the GPIO modules could be controlled along
> >>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
> >>>>
> >>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
> >>> registers, it doesn't disable the associated GPIO modules. Also, I still
> >>> have no idea how could we make the "level-shifter" function to be mutually
> >>> exclusive with other GPIO functions after moved it into a separate driver.
> >>> Do you have further suggestions?
> >> So, for my understanding, we still need to write SPMI registers to
> >> configure the pins and only then AOP can handle the level shifter?
> >>
> >> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
> >> being used by the normal SPMI driver.
> > 
> > More background: "level-shifter" module is actually an independent hardware which is not part of the GPIO module. However, they are sharing the physical pins. Which means, from PMIC chip perspective, these pins can be configured to either a GPIO function or the "level-shifter" function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".
> > 
> > Also, we need to make the GPIO modules are disabled when the "level-shifter" is enabled, to ensure that the "level-shifter" circuitry is not impacted by the GPIO modules internal circuitry. So it is supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI bus when the "level-shifter" is enabled.
> > 
> > That's why we have the requirement to access both RPMh and SPMI bus in the same driver.
> 
> I was thinking about other ways to solve it.. maybe someting like:
> 
> &pmh0101_gpios {
> 	pmh0101_ls_pins1_2: foo-bar {
> 		pins = "gpio1", "gpio2";
> 		// appropriate pinctrl config
> 	};
> };
> 
> &rpmh_rsc {
> 	// should this be a gpio controller? a mux provider?
> 	// is there another class that would better suit this?
> 	rpmh_level_shifter: rpmh-foo-bar {
> 		pinctrl-0 = <&>;
> 		pinctrl-names = "default";
> 	};
> };
> 
> // but where would it make sense to describe?
> // fixed-regulator or something akin to that?
> &some_consumer {
> 	someclass = <&rpmh_level_shifter 1>;
> };
> 
> i.e. the "rpmh level shifter" driver would consume a reference to the
> pins, configure them as necessary (just like any other pinctrl consumer)
> upon request

SGTM.

> 
> Konrad

-- 
With best wishes
Dmitry

