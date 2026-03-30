Return-Path: <linux-gpio+bounces-34387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HWNNKU0ymnn6QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:30:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E31693572C8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B27A3071B0A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B61F386561;
	Mon, 30 Mar 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSx49QyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2C9Jq6F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226383AC0D4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858966; cv=none; b=fE9G03mBUGhJQBFr+JFuA3z5+la6j+OejXchhEqOxqtA9p4Rtq2+DOXZeHxXrCtj8F1/8QpigJSlcTOLo8J9hGN3XUIWUrxSzuXTIqtWVk6rWJreDfEvwYtGJItUM7uQJ2jzeL+C42b+mlJKoRLG1iyW4bawQW3nxX0R8kMQVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858966; c=relaxed/simple;
	bh=4As5q+gp8wtsEkQIP3vVmMGhUye+W1UL+GjS5utEwyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Okj5LJcOLZcvNiKBR+dABiwgFYp1INQec/qvO2OJp12zO0TpC22nzT3zcZbo/7zIrWD0NR07d0Ai9xPACAD0AQv59KkOC/nrgcBo1U7Z7J0yU13PDYXzssF2+lNQPnj1dO+yjKWXueII1IvpwZbWABIIIPRMa3dpJdcqq1qMKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSx49QyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2C9Jq6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78Uea4162016
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=; b=DSx49QyS/bGRl8mf
	EXV5ICRZZ8YHdUgLrQjBKbmjK2tls88XoNKLDOxhNqv0bDwKIVoELfZMC0xV7Hu5
	1gkbYyKlIuvR6b0oZFF7JgQjgDh+kGVDtjm0q8ivSzux2VK6A+o0tM7rAWqqshKx
	QCf2TD8GRwiWACEHwri8RK1M27lP4qXZ+W4pa9NRPDLDBeteF892+p0621drKyE6
	8JUUVRGZr7gXw6FyGKCqiqxF5DPRKOaYmgOlqiFq54YD/sKATfbe7SPOIOfHCsbt
	Mw+f8gwEoZuhK7m7e7L2Af9a0Rfua5nbIe0ucNwizMMCSxrA+GsMGYcTuYcYPGoX
	WY6QUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhar8hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:22:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so79738321cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858963; x=1775463763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=;
        b=W2C9Jq6FGYeOxH89e8j6o1hSvIAQ+BEyYPh6zI7NBZLXFujk9Xd5jtJ1KsWd0H3+EK
         kqvnnJrHqtVTUb1zLvKCMOYA18gIFP4pmBAzeGP1ary6/ukj1G/sYJd6Kx77brXoT3rC
         A4FVVVg92OIrDlEECLJp6XtiqLKeVAHM8URYaFGTdVGWnRbhOIvyavSfJ1V92HbImvWz
         8bTX6DQ5uRk9Mpm9gXtrL3GtxITqTeaNmAI7sfw2XTpcXmY+31TbfLYPVbI4+03U9eK3
         bZlLowCWmWmirEvoOlFIwD1OcyjsWjR4ydYimj7SdfNqNvEp/uEpjtinoPsqzxA42AVF
         v5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858963; x=1775463763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5XbtVGZdE9feRwHMRQyoeczh+AZTExLyPU75oZjITVk=;
        b=mOorGqYtVFZf1iikxuH7H2+ItgLDzJzkZRENxmPWQex27lMz25d9QY5MAJWFwvZ9wh
         ZBswXzp7MHg0qyzuR96x+g8xr5MoQu10I1NGDasNJvWGz5xqxzksnwLoziRGejFe29X6
         RIcEXi+5FhSFDHqc55pD1nVVJqPUTCzZkDeyFjbsTlCY1sjaOAZCCZp1s/zCGc90kPeB
         S4WnI5Th9sggYVhLUmLjQvbRARwJexCPOiMi8dt1co0ND8Y64MgA860qlnqYPGPVJhga
         MpsnZRkLpSfuY8bdHH4Us5EezGAy+3Fvmk+EeqNJXh+ZLfs6SAeCnC0KCiEBnHABnljs
         q7Ag==
X-Gm-Message-State: AOJu0YxuczcAOHz5yWHYISPmwroMuqofCcmGCQ9qpnMCvR/yw6teEdNX
	l7RfpYIVCxbS2Xypkhjf7PrjS2H1S/LVYRaA7l2opoF4AcOUON26xqqUBsO+g39dyacsQL9RGrT
	z396Ybs7l87tCRmb8TwtMiLp/88pEkkZwuTt2ngALivilVwJgDqFr53r+SWN8sMKJNmgPDcyy
X-Gm-Gg: ATEYQzz9li0UGh463OMQ+fi0REyuoXjDv4HqPRWKw3xB1ExsEnctROkH/tcVFdvppCS
	iawocB8Mvj4VzLvkXvnbjBYWzIPty0zcOftiwluSaeRRpuT9HNChCAQ50P41mxAbACFZhg7kaEa
	03yPFo1XjM8oLbMAIoMYoS2lKEipAilX28ELlXs9oV//wtWGiMfaMHFuc/8o8HLR7i0OOfI28rF
	QwWlHwxBch9nTSBwKgRD/qaXDG7e3K/z9hi6rmLi6lV7X3cRC0VH8Eg/MvQwP7p8HkOk/mUNGWj
	VvR//w8caT3uoDNUrbaQnW2vB+7hPTomZWrOM7XlosEoLmXXEeF2TUm2SNLjKKDKCu0tKdU+aKG
	MuR+/9eA6VBXh30gYiAm2eFfE7CoGJTfJXtMzCOt1zQWF+5XFoEM=
X-Received: by 2002:a05:622a:5912:b0:509:68c:634d with SMTP id d75a77b69052e-50ba3808d44mr159690661cf.10.1774858963647;
        Mon, 30 Mar 2026 01:22:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:509:68c:634d with SMTP id d75a77b69052e-50ba3808d44mr159690491cf.10.1774858963221;
        Mon, 30 Mar 2026 01:22:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm70617695e9.0.2026.03.30.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:22:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jamie Gibbons <jamie.gibbons@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fix microchip #interrupt-cells
Date: Mon, 30 Mar 2026 10:22:40 +0200
Message-ID: <177485895691.8756.6036629232287740555.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326-wise-gumdrop-49217723a72a@spud>
References: <20260326-wise-gumdrop-49217723a72a@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX6ZgytMmjmjmr
 17Lt5b8CCyucFqaRNXgCNigJ/2vGjMRGx3XLFbTsKK3XdMIbOmRtLa31y1mRhxilaxtY4PwqEOz
 KC6w2I/dLL/AMSZ3Aq/DThcAn5CzjilmUMcCyfKkQWNnu9SZ871URjSd7CmAmgP9nnD3695nSD2
 EYUjl6Lhx4+plsJQQDKwaoKuPLj2LjenNEJcviT1JXW3SlYL5Jqlg9Pbxx1hns1dg9LneXbzNTs
 52OPVzH4C94Si8dZhOknsavvWbcur0exZaa6Lf1KcFby8KbeYBEljs7mY9X5xAuTqPPgdH5Rm4Q
 VRY4W8lPuaD/ybSlBAFT29lmckG+rJy+AWYP9R806tzY9Vcqbds5pMiG3fHzkU4nx64Oo8w/S/1
 K/IvNQKCbOI19kWpJJno/ETGbsHfJQPFg5rFdlvpGwoGQImq12vNFPFIogs6kH3Eoy9aanoOpBZ
 rZECqyIE9MOn++Ux/nA==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca32d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5Kf4PmCHR9txB2KUHaIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Lshb7acWvQgPlBCFKu0m95k8EMofWUpy
X-Proofpoint-GUID: Lshb7acWvQgPlBCFKu0m95k8EMofWUpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34387-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E31693572C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 26 Mar 2026 17:02:34 +0000, Conor Dooley wrote:
> The GPIO controller on PolarFire SoC supports more than one type of
> interrupt and needs two interrupt cells.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fix microchip #interrupt-cells
      https://git.kernel.org/brgl/c/6b5ef8c88854b343b733b574ea8754c9dab61f41

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

