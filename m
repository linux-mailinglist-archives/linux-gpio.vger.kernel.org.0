Return-Path: <linux-gpio+bounces-39237-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EZ+/LZ7UQ2objwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39237-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:37:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B46E57F7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PSMbJiqU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yxn3kRI7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39237-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39237-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C186E3010616
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2E8425CD9;
	Tue, 30 Jun 2026 14:37:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A6305E3B
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830236; cv=none; b=Rnl3b9IxQTPhdbB349ade9YX/TQexUXaeKT7R+Qn4DjTwtELI/Ds2B66UQdqqnARrNqtR4iFuaqiX3osIeeTbDh3QNsyU1pVkWvgOtGI688WOIEuACYjiAMRx8qwQYQjSBAr6dzaE6R3MN4K6fBmsqU0KwC/uhpfsfOkRCnHWAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830236; c=relaxed/simple;
	bh=v+SldEmoaM1jaU4MDKDykKwvs2xjKjzQcYckvKAS7eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6SExd7yKJsAASx2Duq9SLBQn2eNiuhISbpbIAn44NYISFjcZy5x/xoyYCZM5CoUmDblhvGQL4ozecMI5+9jm+mhbx2LygyksBxR8SfbSHSKwiUB4RU380O/5NMFdprygpMvMkaknDJLzT8sGKIGChwfqei5kOgyHwJIjQuJKUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSMbJiqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yxn3kRI7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFZl2216847
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFQ+XhI8OMJjZGacL3WiTLqVwyJsc8mEnum39ppMDt8=; b=PSMbJiqU9w3xTqAt
	/YsH4ey53K7Fnd/TryZleRjxSvsVsLHu5qU+Xr4ZHa1BmHpoQSyo+ANTpaI4Ix3j
	xPrDzXS92cbSzK+5NfwZhgn+boootgL6smwyOes1fLsIoF66zBl99gMo7A8mFeDe
	OBn0lSnzpAIqo5Clc1+HOdf1lktOWcLDPZuYBiU1AexxeQploRgfQOy0yfPdMxOs
	77Us6YbWzloZxewA7nt655imlJ2d1NGEL3DSXq88PcO0G+/KYuAOYXcICvXbRIcN
	+uVUBZZN+xA8jR2MR8XxZMWY1fyDa9Zsf7Sxj+8R9995qveqVmBFfDxuzZvSgyfV
	R0Uvhw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfk6jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:37:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-967973f71fcso2410902241.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830233; x=1783435033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFQ+XhI8OMJjZGacL3WiTLqVwyJsc8mEnum39ppMDt8=;
        b=Yxn3kRI74B7OJESAZrXKG9iNfibOms8j0X5SpDuAqVkSzGSYAg0w15uX3FX8TFDV62
         zPVI0/5j9ct7tqdz+nmOmFrQiYU+lnkyoQf67C9ihCaTS1+vbv6PWAB4wH7wOs83STWq
         4q7JXeGS5ZVFNIEDD+nra6PYFL2aC4tK/eoHTLJ934Zv9iq0ou0QaIMn7XUhsQQUNIQX
         Me+FsnsterhJeF+goyBFYGY4uuB0wpEI4i4ytaxzy+VGdALETwLAYw48dATwIyes4LGV
         q8hckgGdbF2X+tVyZJpUImgaA9mtkAU4B+U4nWkFDUuIF5JKweDZc9mJD6XFGu7NCYca
         jcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830233; x=1783435033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFQ+XhI8OMJjZGacL3WiTLqVwyJsc8mEnum39ppMDt8=;
        b=CSxxTHXYVo5ev6z+HhapL1NTsS7jwBti7Rn043BT/Wu983S8nKsQAv0xqdrt9P2dmZ
         ZVDHGi2/tJmDD8vtHQY21vRcl4d8wHKJ6lXNqoO8zjUtAfp5I9qsvg//CLBr6Fc4BIHn
         tUKOYuEeMPOk/uqubcZLEfRE6BqiNfvssgcrwRFePVspT8jt6dTHuZ3iFIqwTI641jvS
         tXCoq9XDXc1Tsww2qzvU7O4khTQb8mXck21gR3gh3y6+xMoliZ6zTycNHDe1k7yYZHlc
         aahiHHdIEd3SFB5oVtWyY3YXGN8T9O6FH6l7E0yoFVZxeOvc8rAnFXux/PQY68LngGdk
         jp2g==
X-Gm-Message-State: AOJu0YwLuKf/Wgpu7fhOsZyLg7UOH35w12fO8u3C/kOaRAVmQ50qas6G
	RwsHCge7M40qyXhhLQPu8Ia8tgwc2nFOVQXh8uxhhXeAYzkCOvHBOX5XPr1VtDZ17wzL+35viWd
	S4SHIFUm0N7q/61H8Bde1bawqwEcmNp4GYbLTixH/YGtfSrUyJEF3ds65t+W1djC/8JCqgtiFMs
	8=
X-Gm-Gg: AfdE7cnntTv08WqiG+b2VZ1npL+MtNoXqJ7bFU1EhYf8sWRsCOCc2uSDhJBXPM/kn5a
	dv1xg64K6k+INh/a/+kT5XOc/AyUIN+SW2HJmee+Cs0eqkvgE30hjgiT5CGo8G3c0m06mEYDkVN
	6bTUACPW/g/b/aenO4rrlZRoXhGkIlq3rYp8sUGUkjRIh0SES3B3ZvOJKj8ggvCkJqCSoQXnsms
	oG3fQkS5ILo4wuFRhuOPN54XvlWGAM0PdcsUVG3rb+ab1gSZcDfaXhnDYnam2dRbYLRJ3VDYAaQ
	fXKWSVV81XS6xdH0+sVqe4xn9eQz/L2T1e46JMtFQn6SLKAGyL0gj3uxnEGwcKZDJidUuG7ChPz
	RbgKsUZ+MWYCkfw8ssLKZKAa6YQEGBsgXzMhWk40=
X-Received: by 2002:a05:6102:5615:b0:739:18ea:565f with SMTP id ada2fe7eead31-73cb8c6efdemr403038137.21.1782830233325;
        Tue, 30 Jun 2026 07:37:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5615:b0:739:18ea:565f with SMTP id ada2fe7eead31-73cb8c6efdemr403005137.21.1782830232851;
        Tue, 30 Jun 2026 07:37:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d0496csm68139895e9.10.2026.06.30.07.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains and other cleanups
Date: Tue, 30 Jun 2026 16:37:09 +0200
Message-ID: <178283020836.36519.12213594335592775087.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8ofb9qXMtsyeV78U_9vGiFDjh1_u0Ru2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfXzquROq9Y1A0T
 9wfrGS9O6dcflWTQQRD2f+5kJ+r4Dhs9x709C5Cktl4XvG6GRPEpQBez4eDPWA9n1GnDfzv9hY9
 iMSoHUllog3XJoeekMdD8nZ98gcNV4BlPZMfqnKvgjz0mikkMDhqH00LB45A6Zc2sEu8t9nfwIi
 IqBFzr5T/kYPIrJ4oDYdFdunV+8CK5rcqhMcDeSiY6q+Bvrl5rytunsNw4jgymns2ZaHg40a0OC
 NrPYYY0q3jeUHqCXtVSI7YR3KwxWyQc7KggOZng7/u7Fzun5hYLvsJNDEyYzR/4I5T8SFo0cvnM
 JHf6gphKzAU+78Iz0dC5vhZ31axED0UsLmJEyb69sHw38PnEJPrXzDv4Kao/BxskJuWVKvBQKgU
 VSxgVjpg8G1HIggsaoPpjEmBAeh/CdNlNnHlfWG9COYanK+wEmw0Bd6yCtR4kNYM/ldeyeJDgIp
 Md6OZJz4Pl9ikGq5CkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX/vm+sTmZu9bz
 fXMgA7XoZvDJf4EIoD3Grh9NedOC8afLIjbldoy6dbNpVqdUq7xcrfJa7ifYJ7TvtovZ2Roc0tx
 eqmjw4HaQ8ztyThNxbGmvj+CHG+QI8Y=
X-Proofpoint-GUID: 8ofb9qXMtsyeV78U_9vGiFDjh1_u0Ru2
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43d49a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KLu7tvSqfL87IkgZ-RwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39237-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:sergio.paracuellos@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 553B46E57F7


On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
> This patchset covers some sashiko complains reported at some point when IRQ
> mapping was being fixed for this driver [0].
> 
> I have included 'Fixes' tag and CC to stable for patches 13 since patch 4 is
> just a cleanup for naming.
> 
> Thanks in advance for your time.
> 
> [...]

Applied, thanks!

[1/4] gpio: mt7621: avoid corruption of shared interrupt trigger state
      https://git.kernel.org/brgl/c/1781172526d1092323af443fa03f00e6de560401
[2/4] gpio: mt7621: more robust management of IRQ domain teardown
      https://git.kernel.org/brgl/c/839738536adabae1a7e98ed3fc332ce9cc991d27
[3/4] gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips
      https://git.kernel.org/brgl/c/0e024f58291dfcb28d98c512002e1a80fad69798

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

