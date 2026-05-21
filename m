Return-Path: <linux-gpio+bounces-37246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF7YALC9Dmr5BwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:09:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0327E5A0C37
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40DA730028C2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE8F39AD41;
	Thu, 21 May 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDxZDOSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD7cyrRN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4052383993
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350657; cv=none; b=XMTgJ53RSz/1EiLl7NhQCOFUnKJImHCS/Ay90QUO/MUovUFydk7OUfu3R9mNA83SEdhDN9oxFzjoqTQHAMk36LrWXA6OIu3bNSBxl9SahsATHGxnn77WcZawRq/OLgf+c6JYiTZV1dUi26N8D10JgiufUqORwDLeBFcDOujaQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350657; c=relaxed/simple;
	bh=Apec98HYbrL85FvRA4xNCHvlIL/tWxqaWMoNy0MwUhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifIotqO1J+OvRrwn+ZdLEZYR0mHgUI3wzT6ogdsZ81AuGpLJ55uZIRd0p1ZjJl21YpeLcg+wg/HkIPcLmhCKIdDfGYM36GRnh7fTHuwidlzCe0S4l6HnS03IXerWysolqwvibij+qsa24HHGHzbkjONieBodTny8WicFUc7bsJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDxZDOSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD7cyrRN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5WjUr3084892
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhOLAAv/b71ax4wT1BvCUi4byt8qbkCUpg5sAIMyi6g=; b=gDxZDOSBOseCkOve
	L4KvxuK8S/QyA6oumY5UzMEmjbmBwZMhtvajq1zZfm6/hIxouNmA3GpoT9PF1w0R
	VgV6CwfruFAq0eUWxgXp8pesUqD/0B1syb4zNGQtyFgIpUqNp4e3MctZMBm+H3r4
	HJj5KQOmk7f2uBROFCfHiBaHK4NUkVrfQoAVR6QHg9zUFiBWU+dkaLb5817B2rMx
	M5Pfl/F8UexDjkMGzxCOJbMTM4WbQcAEuC544XLDKwq5ORxgqK5XjaHBMJjvtDQH
	kKEwDxYZFPkuCXjRgK1605DP1tZu/tXAk8UI/9pBqJvPa/v4ysikDk8vH6XRa6wm
	G2XPzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4adc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:04:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso81591111cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779350654; x=1779955454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhOLAAv/b71ax4wT1BvCUi4byt8qbkCUpg5sAIMyi6g=;
        b=ZD7cyrRN95j7BhQEXyBFx+I8duoEuZ+efvGvLC8Jml8H9dYL989B6DIU2U2tQUX2GF
         rSziMDNBTbMCHNH9+qOZps914yQJLVoeA9Ls5v6C4CXlGNp/O2Gmv+Z8a9bw60qQi6AI
         1c4FOLCZjgjNE+cUc/+ceeR7zN3CZSJ5P8XK5EbnAXPGzXbXtmHn8QzksHi3YSDfCiEM
         itQgnGGNlD5qbc8lQszJ18Z7TYpnvRLEI5bM0m8ziajtzcUOLQpfk9auzykbaTEpLWuh
         mpTzkSBxeB3F0qUztGvi/TgGWrW+E0CQ1Ie6mTUYKXBdGi7DcT7z/QFIS3NrwWASel3+
         +tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350654; x=1779955454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhOLAAv/b71ax4wT1BvCUi4byt8qbkCUpg5sAIMyi6g=;
        b=QiFjM3bDvsuIANvdwyqUGgB2dfSPJWjrPrtRCJJf1mUGWQ4Qa2KfEaEVscYbJSQOIx
         q4OKu5dkmhDLgHl7qZNj99B8at8VjX90mLRTpNS5QShTdnta6hGwfEW3maiozM6JZzKS
         AnDFOY1DJNQMddy3RaD3hoJl7BjV0pQrhCZmOAvuT8IrWNNjAl42tbyCgzVd2gTurqfR
         D1hfyacdfneMGQhXJxZESOu6dX9kgv+CFZ6OGajZ8Asn9SyqefpA2uCDRUUZKAMHp2Qo
         SzdqxVHBEfdgAi/UXUb3F7RbVSF0f2thhHC1mkGhnkK2YilZEbtylzoBG3m2bHW0xnRZ
         I7CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kIPx7EdB3ztrDS77TptUSx/VT7fn/ZZ+Bggeg7d0gehq3OzSvE3NpYz0ggsqGQTCEswldXEnOjNCl@vger.kernel.org
X-Gm-Message-State: AOJu0YwSF8hyeSl9/imeYpBvrSKMI5TIvSitQ8LHMsnNHkBDeLph9UVp
	y0EzxGsU7qPCB/H9VLZFwMMBNeTfZI391TXSDcaaGt1jals4WvCutahDzXagRYwpvKUojG7Vp/T
	JO4iafObhozbH3v0DkJLt4iBvJ9pSGY91wHpmOjHSN3SdhvpwKQf/YzzfUNEpCYPW
X-Gm-Gg: Acq92OH6HfysGMT4W172ztBlcNjxCHRmNVB0hazqiX4Q/t3OSFnxsy2EBcr4rp7gdwU
	sljXuKXAlUDGHeubsrip3esq6CHKFRrdkX2SbjgRX2SiiD75KcJ7w7MCoU02iUBnJ6NwqxpUsf9
	X/HLrRh4muUTiIWUBB9FoG0Bo32VWF1pIv5yjN3Twaumux7ISN80AMVcwtpmPSVFhDEx544vYd4
	61P5h5E/rnEchr2GgT5CS/smWWnLTRbVdH0ok34XE+tswQPdNlAVweWHzH5i9xKZCsNOhDMj+om
	i5xsaScvKXS0XcjAKCsy8qy2BHlUSXt0aB1i6uHBw+hH46MbceJzMgHvt+vRbtU/03wnARg45Z2
	HYgaW1vjQJChr6z5NmgDo2MmZpwVzg1rbZzrZb+54CUxOUSzYTw==
X-Received: by 2002:a05:622a:4d95:b0:50e:62ba:3ff7 with SMTP id d75a77b69052e-516c5507428mr24711291cf.26.1779350654177;
        Thu, 21 May 2026 01:04:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4d95:b0:50e:62ba:3ff7 with SMTP id d75a77b69052e-516c5507428mr24710881cf.26.1779350653642;
        Thu, 21 May 2026 01:04:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490388f1d2csm7712265e9.0.2026.05.21.01.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:04:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@bgdev.pl, Stepan Ionichev <sozdayvek@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        andy@kernel.org, hcazarim@yahoo.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: propagate regulator_enable() error from resume
Date: Thu, 21 May 2026 10:04:10 +0200
Message-ID: <177935064630.6760.7388346997242206801.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520110504.13969-1-sozdayvek@gmail.com>
References: <20260520110504.13969-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ebc7e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=neQ1n2kbAGRVx_UCpeMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kadiuzbT71o7wkUgyhDVBIT8Q_dZGlK_
X-Proofpoint-ORIG-GUID: kadiuzbT71o7wkUgyhDVBIT8Q_dZGlK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3OCBTYWx0ZWRfXz8CxopN2tC+l
 QcviZThvVnKguybwT1kRuAh3HLJ1jjovPYo2chJjjTCGKuSgjBDmh8FmVpyRpToUPPYJdgtmt0R
 IT6kKgPjPWoVbyTwmDc9qXpt49Gq39zictF6kZJtICJfhClbcbwMIgF78x+1GaMISL8n3dKnPW9
 cpuRs3njrRSVtkVJXDloD+O/WLaSW8dTVcRqw58OHNZBARDPqXipFpLBO8sQI/JI1rvAH7ltMfX
 6cM8w3l5sKvzWZf941lf5KZHrn27IzRu/PhRTIuuGac0QPJPuFh3sXPYP88jYvxTkUb7pVvG9It
 Tn6nAYMoumhnZw7AE/oBAagzN3rMByoLJXP2TXH+CTPXkDls+4DGFiC5CGWtjymfgBYAxwJovSe
 rZDKFyyl4VIrV6dL7DEEfTGyMEk0Gh9mQl/wV4UbmKGYwpNZkYdZM62lGDNc6o+QEcv5vIb8N4L
 aaIMho3CF3wEy4XoKUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,yahoo.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37246-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bgdev.pl,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0327E5A0C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 16:05:04 +0500, Stepan Ionichev wrote:
> pca953x_resume() returns 0 when regulator_enable() fails, dropping
> the real error code and masking the failure as a successful resume.
> The caller then proceeds as if the chip is powered, while the
> regulator is in fact disabled.
> 
> Return ret so PM core sees the actual failure.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: propagate regulator_enable() error from resume
      https://git.kernel.org/brgl/c/be460cedb67ab803c1bebceac19b1d44acb85d30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

