Return-Path: <linux-gpio+bounces-38460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ttDqNnWsL2qSEQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:40:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D411668445B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:40:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=elchfCzA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V7KcPXmW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38460-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38460-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BFD9300290F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C02B3B42ED;
	Mon, 15 Jun 2026 07:40:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A33305682
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509226; cv=none; b=gRTIuisUei24to5AmDBpoKEIUXQB4Ef+ytXLAR0SSDedJiWWXJpK0Xf6z9IY9z2AWJ7pNHSzQUxCL1alugZnlxv/97Oe8mCHkEEH9KACUqulzbrffmQ54dA9gmG62EC6vqsVpupi+X5ii5anOh8JLC0QjlrTKwDS8sS0KTSh/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509226; c=relaxed/simple;
	bh=men/+cR2Q4M3srESMXnHeiGEUKGiaDvJYYjio9ulzQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkJ9bI4GKDCNOLTRt6DZrrP5iNpzeGBwKS2ZH4NPsXXk+3iQxOQumNIlQTS7wR7t7+dqtT1mRKuWEGaySb7y49Gn0rw1JUFY5rw4vwwsMxDlDLaVXQZ/no+mc3HzGTdsdWSu6lclmBrVkiGvlshcwuGFEElmkeT7Y7uauO3fR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elchfCzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7KcPXmW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9ou3692495
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03Q/zqVsJc1Q9p1340vJudg6J3ZF4zMHuM1GVWOTuew=; b=elchfCzAVLkXd+/F
	WlcqT5shWQ91XUy4ClmM0XLRNH3gvth2gYPmqedWVlBC3HrouaOqnnQhDV9ZR2to
	XGsrZcFHg6GV0JxMvRRvPW54Faj658fu9xk0NdPRjcr5PDnIllJuk6uRKuHHdZEi
	65WqzjTTbJWpoNVIx7nhmMwT74fCz9JhWL/RwteHHlAogjnuztigEfZ97MwCeZXq
	0hkQTVuWtNsARVFBAlRMDJ5rZ3VyzPve/rE0P8jeBIt4yPUcuxgQL+OaYoBSzreR
	qIZX0jCXMhpE/aYlv9/sBshyb0m7f0qjguGHVgj9DElzjXrwTxQALQBV5suXXQFz
	5ittwA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6e5kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:40:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccf396f53bso74576016d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781509223; x=1782114023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03Q/zqVsJc1Q9p1340vJudg6J3ZF4zMHuM1GVWOTuew=;
        b=V7KcPXmWg2W/nbtu39fCFAUNxqji0posBCi+KL2FOOAegtsudw4EV5c/tCuCyLzWj1
         AFBO/s4w8uIGSaFiegd9XSIgQC33uLjNFl7hC/fjfR7MFf9wxMi5mPlWFj1vIYlTIilB
         iBSITd4QJpKtIGJJXI3kFMFePDKm4DtNpUht+oQb3DLt1y/8Iq4RZce77C7yhzM5kX1c
         fNFshrAYUuIBTK2U7t7hCDG8vFNqu94st0I2Z2Z6pV6k5lEU6EzDLxea815tE1JfnXwf
         bXs76Uida9PiIoj/oQpmTvh+MyP0YE6hPnPYOr/dCmLdgF8tkc31eGf54+Q6h5P39EIq
         I3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509223; x=1782114023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03Q/zqVsJc1Q9p1340vJudg6J3ZF4zMHuM1GVWOTuew=;
        b=LOUUXzB3PnxY72Hdv6F+7VF2B5rzL/C+pU4M1+K9XtULa4VHu/ngbbB3qrazs8NzJ3
         bMVrhqxIXloExW3ImFxQGo6ajTgHrWi4imI/ohKWMW52BA/q2a5PW2oxfdacBg4mmL5U
         3/FhmpEGmLmNphbj74Tuo6YCcglIDBB2ITcLaaFPnPL/3ndQTACaNTLydpgGniSDmr/Q
         dIe1SDA1uyHNYcWuwVfJ0fWcM1PG9w6jtR0NlG8y2Vr91y9mMU75Sg9WzF6MkRViIaW+
         IoE0Z0bKEqIitdFv4EpnVAjnmCryeFYsao41PhopRzmI+xWPYNGYQxVGlhDHXrINGXfG
         fUSg==
X-Forwarded-Encrypted: i=1; AFNElJ/3wLLOJ7nnkaUB7J5TCh2h5TtzRG1L5TjVg4MIAFK+QE01R7Y8WgG48IUz/q5tpQXmzhh4GYw67Om5@vger.kernel.org
X-Gm-Message-State: AOJu0YyPDfhcljEv7ZoLA7Y+BXenr9y/7tLE2xAUIZU7cOvwKTH3LFZ0
	lfuyeNfrMb3UOWz9GBoA3TCey61OYDMiahxRVlISw6kER5P+68WeJesfoEDB3GKkLT23lbUKkcA
	c5oOxc4qP9NJT/xE/FnSD8d2mHnhfcxuqlf+ZZjqOnTpAMrcBxvfqO5XFGUG/SaeYDR/u+y+vyU
	4=
X-Gm-Gg: Acq92OGi0tUt96dnGRRXnsFA/4S5sCOufy6vaxF0SgRuleQ0beDcCZMqA19oEJH9AZq
	0Ar3XN18ANnPNnzlYSxmuGzDjkH6bPZmgs7Rn38mQaIyD0gaECLRGY/x2gDTXw7Nt1xKH0rb6xP
	43kAq8R0Rd4noG8DlOpPpjnFygkb0uytGcwpIp5ZGyihy+iiqgeq5dyR+l+AseCj/Pduxexawot
	W+w+w+CGIlWfyGorlnp5+fZFbm4uNQ/j/uNhxwod5z/x/HSxUF8l1QcIY7tv8ckjos1I6AL9EDp
	fhjmIC56ly4DV84Ks0NnQHRTJAXTjnSOONwsH6E/RE2uc56fAm8UQKl+KneITcOp8gZer6UXmKA
	oZgq5fozPg1p+rVfdt5BgUVitxEdnSgYdfBhUmb/eQcrbfx9fOQ==
X-Received: by 2002:a05:6214:234a:b0:89c:8353:1fa0 with SMTP id 6a1803df08f44-8d3140de609mr175773416d6.4.1781509223298;
        Mon, 15 Jun 2026 00:40:23 -0700 (PDT)
X-Received: by 2002:a05:6214:234a:b0:89c:8353:1fa0 with SMTP id 6a1803df08f44-8d3140de609mr175773086d6.4.1781509222879;
        Mon, 15 Jun 2026 00:40:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d677:3f6f:b288:3b60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420179sm416605466b.8.2026.06.15.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:40:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 0/5] treewide: more AI-assisted pre-v2.3 fixes
Date: Mon, 15 Jun 2026 09:40:20 +0200
Message-ID: <178150921699.4314.16223616358854802961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
References: <20260608-more-pre-2-3-fixes-v1-0-577a5ba426a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfX8Tad84GOWl/n
 eEfr/NauTQgCMIUpFkbXrGOon7CjTON9nDmhDQbV2QRiTEj5vEehEjGcATsC7dMGxhtgdWsay6p
 JlnD3qsRnpz8BLDeM22PFXGLPxbFjAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfXxhgdFB12IIPY
 7Me7kjrDsJ+j/G5WNZwVcFRGStI65HNiEkxj9xytUiCxDTgh9beeA5f7dkP8/UnmeMAjpYWcyfM
 m3Io+4JNZGN7VA7jogYwfHSKaM01ZUpGdvEQxfT7CzUrCb5tBQJER9tQ2hHUh57kk/qnqMWxMfk
 eqxd/u4Mi7QW2E+Gr82S3J8mo3SV44cTm7CG51J50+ezwgF4qW4LVSAXsVrx5/aBuTzTAv+Pvz1
 GYGCoTU5d27/ly414ujZSyL4YYhk8wbfx13cQlWOY5JjHCjtPAY2XpZvM8SWwvjF5nnsDZ67t37
 rQwvvJZI4wKJmdSqux7uyimkEbRN2SOS/XeKeCBSVAgHqZwbTMJCjdL4c994Lw/3ANI/8obBvDM
 K0cJeuf0TmjCoEMXwvuilTmq1HMsU0koalgyU2Cubp0sYP2okUDfSlE/bYfdg0zyXZwhtQC09Dx
 dh8Q5Oliis+TMxd0EvA==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fac67 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GwKukf5GLx0DWUYz7sgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: K9I388TNl2M83YKe1ADr6CFIisW2GQvH
X-Proofpoint-ORIG-GUID: K9I388TNl2M83YKe1ADr6CFIisW2GQvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38460-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D411668445B


On Mon, 08 Jun 2026 16:47:48 +0200, Bartosz Golaszewski wrote:
> I got access to the more recent Claude Opus v4.8 model and it found even
> more issues so here's another round of fixes.
> 
> 

Applied, thanks!

[1/5] core: line-config: use gpiod_line_settings_free() to release settings
      https://git.kernel.org/brgl/c/65b5ed66e476194698a6e162b3d5a4c0bf6ce7e7
[2/5] core: edge-event: return 0 when zero events are requested
      https://git.kernel.org/brgl/c/32db8215a8ea987977e79f6cc9b5b4bdf1ee05b9
[3/5] tools: gpionotify: don't watch lines on the wrong chip
      https://git.kernel.org/brgl/c/696ffc986bff5556becf369532e28583fb865414
[4/5] tools: reject trailing garbage in parse_period()
      https://git.kernel.org/brgl/c/c43a6cc5a5f2d9af118213d95e5b8a26e642a2d6
[5/5] tools: gpioset: store interactive sleep period in a long long
      https://git.kernel.org/brgl/c/2de4e60262a63f73b3e43e98081e84434984ccff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

