Return-Path: <linux-gpio+bounces-36648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN/yHBbXAmpXyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:30:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9351BD9E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 943103021BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 07:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7D0441024;
	Tue, 12 May 2026 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aupAqgig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOeXIo5J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6DA47CC94
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571010; cv=none; b=H/U0Mfh9M3wsrfG88eA5bRlnzxsdeyJp0CarjynXxHxvn0qOZFsSNv/GmjObKqtxXrJwniY+4DyjPnIZm/trVGJBjHi8TFJqUDbdsi5ZZwU1mvt2qFX1oYZ5a+V9HSgmaRRtExYK5oJId+WKg0MjwmGekE2uvwlQxAbVneQynLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571010; c=relaxed/simple;
	bh=ZZQ83l3arnRWYB9k1Q9GZ4cbF3YNSe6t3BqCltJZmRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EaTActGDCOZVW8qekw199aVQdlPn0HAJfqkjaZ8SoBst9UngGW85Bnb4xmfz+DA5rqoJchdhVeQ7TPb9z9Je2pNH1PPu21rwY8YhphrG9pcpw3M+LKN6PrL51Nc/z3O5NvfmwqnPIB1IKLDISvlAb+XcaGPya008qNRNqDibYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aupAqgig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOeXIo5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5cR1I2202230
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hZRXeti47IuVB/YXyZ0bLEaDNRlATNAUJ4lnByzJnQ=; b=aupAqgigDaYiFRHf
	SX3wwGSxoUwnCoQzawmDVBEjJMB2tmJmezOGqogkIb6JCEUZ6UU/W94JMSwqFAgm
	AvWbZnkbMfmXibMXLSFDh1gCGiJBdA9b4cm+t3cbXavkrwKF1xW2Hc5AqRFihAkw
	UPQON5xSWnGXfLvGvIKgzOfycuujJ8CoWbkGLQr99CJq6t9Nk9I995fRAg56THCF
	tC00FU11Udrr+yWFTFKwsFLQ0VTh2VzQlMdMBH40ZKyJfCfLfjmlFuLCyXcjgK+R
	CX7QevlCgXrRPv32e8Zx9KJwzTcdLWzdHI+4W3oN2ASgu2NAJKJCOx4d8aHOQv4d
	BxY6JA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyj0bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:30:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so72883291cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778571003; x=1779175803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hZRXeti47IuVB/YXyZ0bLEaDNRlATNAUJ4lnByzJnQ=;
        b=MOeXIo5JYtBr3oSwXO3tEGx/j2n+yWUfAHYsQXKEmKIdEYK/SkrQ5bQJt3ApkXY7TC
         xOwxCiElh9Do8GhSQY/q7ZoHATFqZ1dPca7YQnFsffjI0ZLm3zDUnwi5VOV1Fn4XMCi6
         DadzL+iljmCaBmltpGLHfFHqPd7JFgs5m/QLgfvzSSz/jOU4KxB5g4o+kMoL8f3g1o4m
         +cLwk0LRYmCj4Jxfn2NmAZVEw3aA58sxMOxD6lRyC6an1SAs33QBOArdwfZ0a7pksr45
         eva5cOuF4zwzPWJuyLfwFxoNJraOSmO/jy459yM+NETWrAtS3Yd9XUH95Lrs6m5yYKoc
         930g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571003; x=1779175803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1hZRXeti47IuVB/YXyZ0bLEaDNRlATNAUJ4lnByzJnQ=;
        b=W9pd6ZwOxpXrPdw76So+0Ptj89/wLth79YhhL0UiwEaJ3ZwTGULG+aHumryX3qH5ur
         RFoxEAeAVh4CjTD1z3lgfdT5dkI2FfbhlUjt9I7EJIsoXh68FtecOzRkPHL0puJJ8sJz
         qoAhdm4FQjzhs6nLySWbK95Ps9xwoI1EqaZV607q+/1PBpPEtTiUnQurGl9gGpILCBqA
         ZnbxLtLUufds64+e9GhNO/l724Pvb1J2rLuZC67ICOh1QYPGwYzosjMvvcA9lbnvwcOI
         GaE32Y4Jl0mz/jAaJnvzcqiah6I5MfqlYou0XUnXCQ/ZGevF0KLC2SKBeFvlG+XK8mcS
         3qDg==
X-Gm-Message-State: AOJu0Ywq8dx6aGtTR8QF4E9YTglB+AaYCQfyf8IoZvYWMIhHjVLKhqgu
	4eDj2yJZrxwCwnBpDYMTCKocQo+ij0zaa52BVgLZD7v1pzO3vxltxKgDtPFkIFKUjoS9040yCBu
	2m7mN46yQ622J8G8nPo6bBhkG0+xVZh9gtykkdT/T0TDFScK49kW1CPM7wLzUX9xGEcXx9aHV
X-Gm-Gg: Acq92OG4rD286loVhhvPxN7hjMLKsRnYSHUe7Q1g7bTquiex9iSR889WjBXGDxDYNVv
	A6l0D0jENSF7L6NtVlzhxqEeRWinMWSx+vZE0D1X1JlvtHlaC+FioV8o+sg9z+rkSu2w1hoxasq
	T+YW3gohfwALI/2VSIJcCM+wbwPh7gMjlWocY1XhM7cMQAevZ56lEqXn5GJWQqUbo+lngFKPRy7
	MTKhOhTtQYRjB8mtzAl9oJCMQ4S3u6EEj04uiM09T4epfD8loEH0SKpyYXaL/071XWNzBJj0UIc
	Ei4YnSlMnG6B/Ewum4wU6DlII4I4GV+rflqnQbZBh4+Dp2GP5F+B2YauoChW80FcfQuvVgxEfSp
	eCBvmzOhvy9DFJAWYAE1UkJZgX0mXQBJoevrsbN/lMcsUnBC+OA==
X-Received: by 2002:a05:622a:4d0:b0:50e:5ca9:d263 with SMTP id d75a77b69052e-514d1c8506emr26246421cf.16.1778571003297;
        Tue, 12 May 2026 00:30:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0:b0:50e:5ca9:d263 with SMTP id d75a77b69052e-514d1c8506emr26246081cf.16.1778571002811;
        Tue, 12 May 2026 00:30:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f429fdfsm11225745e9.15.2026.05.12.00.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:30:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] bindings: python: don't decref objects on PyList_SetItem() failure
Date: Tue, 12 May 2026 09:30:00 +0200
Message-ID: <177857099789.4205.14921947117262194451.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511111538.60844-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260511111538.60844-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA3MSBTYWx0ZWRfXyDhk+X8NE0Vf
 i8BODFxcWJ7mHeC9356uE/QG3EY8vSDOew4x5BZunVubpL6ax6vl527a4GTjkSzm0i2Bez/t4nX
 7GuO0rMGhD3rd479JvMl/2hkOZvCP+B7aRLMVWG31YA1pMIFgv56kffwU58o3W0m5YMcKCMi9Wr
 9mT3u2GuFYUHJPwn7biYeOyfWgj+VJI/xIJBEanP/S9VYzprd21TfA0V/zV1JFMWpCO2qT7mroK
 ZAdl9I6IdNEf5dz6D+TkK/E1VRX0gpSFCG6trxCW7Bz0kRUpsyh17mz/DWLUFRSE0TTS7wYm/bw
 /rDMxB27p4Ya7uuAnwQTwSk4mNpFx65HyuNRSfahVOaQvC2EIRhcxX91ED/pYFNuE5ZR7R3UdJv
 lwShX4LyuvQtLxdlzhwBMtkQ90WLdUdr3QoJ87133e06reBTiaxdjMDLDMECALn3P312MuAYzIt
 S9sTwq32yjDtIWhoDgA==
X-Proofpoint-GUID: S23YoBkbDlykFWFxQsJyNnVZ7-_UYG0q
X-Proofpoint-ORIG-GUID: S23YoBkbDlykFWFxQsJyNnVZ7-_UYG0q
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02d6fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EVjSpEH2PMAFD8wLcCMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120071
X-Rspamd-Queue-Id: F0A9351BD9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36648-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 11 May 2026 13:15:37 +0200, Bartosz Golaszewski wrote:
> PyList_SetItem() steals the reference to the object we want to add
> regardless of whether it succeeds or fails. Don't decrease the reference
> count of the object we failed to add in error path.
> 
> 

Applied, thanks!

[1/1] bindings: python: don't decref objects on PyList_SetItem() failure
      https://git.kernel.org/brgl/c/a7b443f2c7c9c3d9f7a8218568cfaad7bd6fe1cb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

