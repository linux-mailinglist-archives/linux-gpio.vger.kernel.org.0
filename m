Return-Path: <linux-gpio+bounces-39231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KyGdCfPQQ2rYjAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:21:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FF6E55E8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I0UQOzQr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkyvSnRQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39231-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39231-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3CFA31482BC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E7A419306;
	Tue, 30 Jun 2026 14:16:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AB4192FF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828973; cv=none; b=K8YS8G1vhx9UMpabiD1JFajtz1xZl68IHx5VqIWknNGdhU3cLpaENSkjp5vJhinjClHmQK3lt/bl07btXPFzvVw28wZ+8/hajLtSj0o77Ad/Gn39ao2ytM8gTWCRa4335IAdxoUUcy3YArTMi8iMH3F6BOy+EiCmk/f6agM93a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828973; c=relaxed/simple;
	bh=PP+eO0GGVrkcXxcUDViMSrIOmtbm8bbCSnGTZe+XxBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bdc7SSwt63QpW6An8axVYYk3oqKt8mhdFDyyzqwGyBZouVCJJxnL38E0ezrb3ZcnQr62vDiJjqjZb676FOHuHTCcTDkX5jKJpsS4TgrQ+HtGMAuBAef4gKSLIV0W9jhl4m+XOc93QcF/F037q+Zkrk50+0oLbD7MgM8l2+T5/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0UQOzQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkyvSnRQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFW12216847
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=; b=I0UQOzQrj/5+tiUR
	IXqiuGbzL1tq5aXjesymfjoRrRtSocVxHeRXyRgIHaBgR9he59OC5IgR1ROId2UC
	saxIrwqQVwfF9lubVPosAxgHFclWWYa0pioApX2+wUgraDQW7E3c8J6pbjXbb1vp
	OkcNzg28sR7hOeQFDvIcgRVcMZsSQI8AR8DvT65llTVkAM0VZxh9P9f8U0KLzLgg
	baruQP+dlhAw/zjhUdTueBtlxxXfDpLDTxXC4S5jYPT7c+Hre7rdBcqToq6fOE3l
	S+azbq4DEEdyFdHNJ2Kqq6GhsuurE58b2PVlhCtR9ft9JjpwAXg7cnJqF6IR/hx7
	SIi0mA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfk3h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:16:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so1428340137.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828971; x=1783433771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=EkyvSnRQYevkzZWEmJLzuoIDfNzxW1jQVwO9fg8b3GlzhrGmt+cxw5kSKJK/lRGJK1
         ItHEAEpSvvNu49GYazTUlwwlUyZueaXmNHnnzfdyG5spsnpmP86eeLLLnG7S/LeCnSJB
         GpJQyidZr0zI0yOtaGOYzEcR+Vy3vb60mKZKS1U3IYmYt7zKO3uN5QwbhjoapO1D1UI9
         Tg7zgjjcwZ7sjYr/PU6w9/n8x3WaC/zoMLonUrWW+akasSs43ueMDUdVhkf9eIpihyqQ
         gpQb1NuYTtzqdtkMPszceYbjBpoKzljXQL/7BjrFXxVV5XCMCZg+fZ+rNhvg4BUHMr1C
         8Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828971; x=1783433771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=cYtMB24CV2NXHBnHApHGvbEhGHEbk3/oewEz7W6j8MvSfzaKIpxP2/UJ4+MS6NL8xJ
         GbwEBf2DOhGHMy8J3s3cXqIdV4+kbP8JK/MJXz3Tvc4p+p15ihSLYrVdFCLovYn/IcTy
         taGiyLQj/zzKXgdDkDJAShbRiY8lXA/rZEQAgPjnBb5WBh5chHJV+ntm4PFrP56bmTRw
         3vojENhs6JWMv943ao3zLil4RXcHUuUlbHLF7GHrnhygMPy3z7d6wUAwj8DLGmJchJa1
         EvEgDLNI6itG0A8fMF4eEGTGXZiLPIQ2aMxEIiNbJpQfonJlF5+a94yJpyyGz/QhP8tQ
         sHKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCfOzA9FmBAUAiZGFiYuv2WXrTlpwEK3zdkh6sWex4SJR828t12XKxhvVaZ8D0lbEZD3CaSRmXrjof@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QT5yO1Qcp3VGyFiHgK0fGgXrtFZ2FmkWG16nbWLJVRtFuXQ1
	cFGE6GSx4ruXV4MAO7ga7dPtH4me53HIvhb16bq0WD7bsqq09+BxSfMm6o0/PC/fxIb+3NRroGO
	AloQfp/OQFlkf7MqMJlbhimPlL6L8a9wSakkCcYciYvGjPTT4Q1/t+vOhIF641y8H
X-Gm-Gg: AfdE7cmaJSzGTU1JLgXObiJlyg/IHSrqy/VBXl+FpUgXmtnXPM4K7IzEO+5wuja3FlN
	2LutGfCWxK0RAW9swKHsizz6Y1jIehFfSCZ6n8k9hyLIl/Aelt3AU33GzBV+7tNRrqg9f1DmOpR
	XJO/xa86nnZjR1yUQIDOU2kPoyV/aqdMCUiAZO4Ke9WT9GA2ynZegrTV2QuO6YRv8i/A1IzSY5q
	Kzs/Uja5gDl2dzz+akILAPo9IHoJ25dw3iQAdA0BG95VYKvdkFEQzpkbysncb74RHhf8zpfZsJw
	qR6D+BCqcaiJJg7MKjZPgcv42lK188ZKNWZudBE8BPP2nJAYM6jVydHDus3o6MBcZ3Son9yfrw7
	pE6Uafcxps72r1TEcIBD1qXdjAY2dTu7Q4+yYIuM=
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324383137.1.1782828970611;
        Tue, 30 Jun 2026 07:16:10 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324135137.1.1782828968537;
        Tue, 30 Jun 2026 07:16:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bf712sm34105425e9.2.2026.06.30.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:16:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
Date: Tue, 30 Jun 2026 16:16:05 +0200
Message-ID: <178282896299.21974.11820844634980571758.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IcxotRv01u1_0KZP3ePp8OD3KpPEUSVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX7aBTgoZExExr
 ptRsm/+P9urEvT0fv7qGkd4pDNVXqX2oRWk1nwxxzXSC7g8MVcUViyqzu0ymBc5/sc33DsgyG18
 RbPG8jPPc7KB8XWHNARZtCnEB9BAtfpn4t/WKiyKIhTGdifL+hh4IF8H+7PYXIU+S06N7cThuJz
 xxeArvqyUtZ2M/AstkYKp3VniMeVfLjm938h24nhuIYJG7AXWBLLr2kE40vQB0kEeJm2YDiBtp+
 tP+k3hCoenjv1tk5Ka9h41YJK0mPliGKHUGbfvZwtPE2IPiQbmcnsa75xOa87aqZvWHN7Jlmcfg
 6gFlczRa0XCwVZCXPH7vZpnMH2+/yQbyEYA9hxLtl780r2stvGwq47AqxJeyjdbafIc2jgEksO+
 mv7tbWn8Er4WfGTZQtLhK20HL9u28Ld5aeldr3UKB3B27IPVOwKLkzR/enjedwOBtM1xW4v0yy4
 tDcCMqG8ABlGetaLsag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX4E6ZX+7hQlxD
 firAHRBS6+f7yOHrcH2Emhzp1PJAzLH++OCUppegiIBYYkmvlYBmb/oAtUVMFuJZ02ubNX6R1Gx
 zFiljVcZh4V7PwXszDusQOdEVN4r5lI=
X-Proofpoint-GUID: IcxotRv01u1_0KZP3ePp8OD3KpPEUSVk
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43cfab cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=no4Ac7NHiWzU62rghnMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39231-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fenglin.wu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661:received,205.220.168.131:received,209.85.217.71:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 941FF6E55E8


On Wed, 10 Jun 2026 00:05:45 -0700, Fenglin Wu wrote:
> 


Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      https://git.kernel.org/brgl/c/32bd01532af59cf0cc6994e2794e0aaa9af5bc8d
[2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
      https://git.kernel.org/brgl/c/8a762912365d4e7402fb8942934681acd0a3bcd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

