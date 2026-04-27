Return-Path: <linux-gpio+bounces-35536-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 55JDL3cT72l85wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35536-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 09:42:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6346E80D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 09:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A3C530094E6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 07:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1233803D9;
	Mon, 27 Apr 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfe3Rt4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHV6HurW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F25846A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275762; cv=none; b=MoUH/3x9/+HyBAoHHo5pXuD8Q5AfUMOeCslZlNCtj1fdsvAW7ahj/aOWwsnz3Bayf9wcpZEr9oT9WvXKEihFGSgiKC8xd45jz+Uv9sFRoRBDG91g8qZ1E6o7aulsh7kVlav1C7OwT/l569FRQp6L11IPSrz0dHraGvrQNl9sNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275762; c=relaxed/simple;
	bh=521xntIJ4VSAzLBxvb9/e4y80Wiw+sOEWc4J30d85z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRMzd1NUg//7nxNU1k9bvG8gOADZYEg6PMJxPRmv6jUGEJtDT+yAox3+7+d846OLsEdOzdGWmgr3S+Fpv+JtbQHYcDTChjZQjKl9tEMPkaTt80qP41Ymi6K55cennZ27Gvg4vMS9PyYc4vH8k+Q/o0sqVGnGmw0IZb0NF77LEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfe3Rt4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHV6HurW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNEp931589169
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvPrveeLOrOCIeoGW1aPXkh4KwrY/LqkvLGQ9ResqiY=; b=nfe3Rt4Ya8FbKDqH
	xqtSstoRhGIoEClVqqS8WqPfqVe/xP3Kd+APy+T2bFroNK98/Y/6AWBANBvEnNNw
	sR+awAHCKsQAamnCT7CzYsiXO6rt9BCMOba30ThQb+w/O+MXTThd71F0fSV253wS
	cJ4xfJ/v9/TQ2AwmF8C0RROi8/Z75paqtQswWbdq7Aiw++fSnKLAzwwJ/GLKv3h5
	WYKtWSTnfR81U846Ol2MAQUFTu9Hy8JiB4iJtaVOeglHK8bavBupQGwWcSbL8nZH
	TYZt9cY524wH1BKBMjkzbP/tQjoZMqqUVApbSq9srsDIMPe0gKYt+oF36yyKWTsg
	y5vMLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uty3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:42:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so212928381cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777275759; x=1777880559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvPrveeLOrOCIeoGW1aPXkh4KwrY/LqkvLGQ9ResqiY=;
        b=OHV6HurWwXCylvmtKDtW7S+4PRq1ZivBCMvfld0O8DcsJYufUhUi3issk74rnNiT5a
         GCwYCVev/h+bYJd0dpP3/VbMkbo0ogygFYWMR2krGl9OOzoBaPhZomX/Ou/+mMUXR+O9
         /oBxYCcRI94Cb+h3zqoohMRkO09maQgQc3eb09cmxM0ihxqalNPr5VSnxbVda0/wm9kM
         PgCsJvk5hSZ+vUc5nPED/+pj4jSjmi7JRVm5Gi8VO1OguGDlQzWMYv8CbcFvr7BuPgxo
         Hg2rQWTOnNEZAzIkZ5hfrIshmfWhOrjViMi9TwYM8rCs3/o5okDNDaci0YUJ+wyRBMqR
         Y5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275759; x=1777880559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvPrveeLOrOCIeoGW1aPXkh4KwrY/LqkvLGQ9ResqiY=;
        b=KQ4/PhLcK3fMKQYTI907tiktft7VslbprcyA3FP3ewbs2F5WWctFOv4FHrIQ078HJS
         m90Hjib+uEH8xMUP1VBORxslPVRI9AB0DPs3Et+kKqv1qUbOku4aP337IKytXvgShRsF
         3wBBUFQGr4nubcD7YhYa0gLn3lXjtp59pM4jc59wKSXpbwVvrL4vYyTLVElewS76dv8s
         iQefST02ZVMC60pQmW07MWHm0RUrTJvdzNhcH3fT6HMKguy89U5KGQKrVMbDYKxzo+jY
         6NKn1RSx7TqsaNbEXHHGG5Y8U2brHvQJSh6GfUM9REGZu+yZzPpPBvr8Cq2PcvDH4TQB
         s6VA==
X-Forwarded-Encrypted: i=1; AFNElJ9272sWqWB7qnjWXKRTDoA5oeSFMm6/TClWVAJe3/K8nCYGP+2X2EEOG814uSSPnTk7blvCZNFC2nda@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkw0f+JiywoNZ6EcoBHru8KKCmHE01Q3MbI8FHQ5r03kWHJ8J9
	Orb/QeT+oOGX1DAeY8y0cOjzGDM1o4w5nziGKnXvjZv+JisTPK9FXpzHqa/HUxpI9GsPD/k67nG
	OpfCuNopa0GczIxrdeGEkxCTlSFA1nAcWUojhQ15ofeWfFbZcKe0gVcoWsQgcZcrL
X-Gm-Gg: AeBDieuvqPAcOxqHcG8qQs1AQc3gpDTgjONbK9+cCeXKioztmt9LFBI3YWeskuvoqKo
	hmB6YigrJ8n42mQvs7YqOl9L6MtVCQEiKJPUaCDfVJqcO1s2qk11KHpFnlvEK+y+eY3lctHG8R+
	/KersuMqVwPYJ5q4NCOkmxOfa4yDDr17yZNZwk5xJ/WZT/v/h2rpO9pCJUbNilUopavQv8cbpeW
	ULdgnOspYg94PkCj+NBKT6nLmv9mhwtKasxMdpY5t/4uzLkTiflRoHuRlGo4ZokG7PYegQ54Yui
	TwCCUFrEzCW7D2SXcpX40e/O6L2cTz3M/8GJa6EzRmbaCsh/ARssmnw9tM09GG0jAbxPEEVjg5s
	PWcs0rrURiNbGDKgsoBo48fRH1Ld9vwMJRmVXEU7kbjdRv3PGIj9s+jKCgHU0
X-Received: by 2002:a05:622a:18a0:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-50fb1e6b4d6mr369599691cf.26.1777275759430;
        Mon, 27 Apr 2026 00:42:39 -0700 (PDT)
X-Received: by 2002:a05:622a:18a0:b0:50f:b1e6:a8f6 with SMTP id d75a77b69052e-50fb1e6b4d6mr369599481cf.26.1777275758964;
        Mon, 27 Apr 2026 00:42:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10019bsm795474865e9.4.2026.04.27.00.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:42:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: ep93xx: use handle_bad_irq() as default IRQ handler
Date: Mon, 27 Apr 2026 09:42:36 +0200
Message-ID: <177727575343.5136.6617625725051380745.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
References: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dQEQUD4tmXf3lLCkTUk7MM1QN7yib1Lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4MSBTYWx0ZWRfX2zS6RMwnCuSv
 K/URVVMFGzFM51gpmh0QXoqG9V5cCLe9xDDl3yMgC3kBdd9f7523DO7THFLEB+8YPqyIn7bMDXb
 ORv9Ff6VvCOCZLAahwM+rXPOvGEzrz8Er24yo2W/aAHDgMpMKugbnZinaJJqepYc/fOvZfjjAIJ
 1JoYeccLpgB+nyA1tCmnbNvP61biZCOQPCBHw8EUPVFOqwp0/AQvxyrbzkt62Ee0VPxcmK59Fks
 bQPhInBFoB2A0Nk4X35zfqzvl8dgtoP8Zf1cusuVZdZN5n56moJxw3RmXdYueruVYHGudffVlWQ
 4Vfjff/uBt1vpGpw1tX1wVno0tv8lDQwVM8sXFXtx82o8If5gbMKmCnYIAkRuWIy2sabjrVfNYs
 i/UU55c4Uq35fLWQGpfl3C+Uq+qHZXAZrSsuD0BOZLt0VsbASTQ27bBIfQA+YZEwe2gzpk+OZL3
 yMeUiGgc+W0H/VPCGkg==
X-Proofpoint-ORIG-GUID: dQEQUD4tmXf3lLCkTUk7MM1QN7yib1Lm
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef1370 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4EtkAswEdITEZunPyqQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270081
X-Rspamd-Queue-Id: 30C6346E80D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35536-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Fri, 24 Apr 2026 14:59:20 +0300, Mohamed Ayman wrote:
> Replace the temporary fallback handle_simple_irq with handle_bad_irq
> now that the driver operates with a proper hierarchical IRQ setup.
> This ensures unexpected or unmapped interrupts are clearly flagged
> instead of being silently handled.
> 
> 

Applied, thanks!

[1/1] gpio: ep93xx: use handle_bad_irq() as default IRQ handler
      https://git.kernel.org/brgl/c/42509588db15100732f236b6a007f384dde3833f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

