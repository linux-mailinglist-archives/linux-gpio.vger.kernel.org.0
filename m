Return-Path: <linux-gpio+bounces-33466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFwVADnKt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:15:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60159296CF7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43075304A154
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932BD385534;
	Mon, 16 Mar 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo0HdiFF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFrWC8F7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BF3859E1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652299; cv=none; b=lG4BrSToJEhsM4+iwRWFNAN00i+prR1pGzPq1GhJWvFL/fXLOY0nz8rBQPUhZLxrM2U+2rek8g1tOYRriY8EXhpssRB/e66Ps2TbGnx4m6hBuIAILOv8oAMoiF2zLEA52Ws4dqxFmgAydgdS2EyXrfq7+mdIf1rQAf5nc4e5arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652299; c=relaxed/simple;
	bh=aUMVAwH0mOKSmuHNmCaUpCyM7XRSqhjq4ZDdYT/2mOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngYukrNx8qkWXPOu7D19oQbYek6CvUD1ptme1Q+et2hPD08AxUgERZAQHHLd7r+18ugN7UN/so3vmpqCE76J+AKSUxLa+hs6CyKqJoz/MzN+v77CErJsz5VW4r+JsPoUi8Se5ZL4giB2rEubreiUE6Xrf895xwBGqIupr/78/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo0HdiFF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFrWC8F7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64nX01724882
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CvDcs3GJL8W4dP7vK+RTbGgQ9jdaNz6Z9EuAya/JZ8=; b=Qo0HdiFFWE+ARSYX
	iRDqQ+09kulRea3sca86UGMdCxwFZHxNNJRNsOWYVmkQO9zj3MzzMfyg0HWEZqNb
	0XVmTKSxlZVZqeGcLMRx/6Kd3D/JOWQdt0P3Y20fIKZ+8WyNw9e/QGn/uf9nIptP
	ero1/wMOz2cs3AIbitbTG4glcRRKAwQm1n3TEgnJrPrTBfOBj1PlkePKYnsIC+JN
	GdlUHwdlsFdBd03+D27j1LwUhLiYv+Qybt0Ck+V+fTs6TLShFi/pI7Mc/vMxrlik
	I3YKhp74vM4cQaGJfsSjT0OZW9Mm59jMVO+1K9tSIGCrw/niCKPoWLMPhrFdFR3U
	14kAsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udmuv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so2670633985a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652297; x=1774257097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CvDcs3GJL8W4dP7vK+RTbGgQ9jdaNz6Z9EuAya/JZ8=;
        b=aFrWC8F7lIiq+ydBJKwo1wOmDG+gzGYhB41oidtIl+hBtYe6hY+Idg8+jS74pPeGm+
         V3v8H/QlxbkSloc2X3OXuiCbFIs9Y1a6kN6h/xobJHTOpLyWYCalUS5ZN5y5YhBdgT21
         aXEBVbr9bMHZRIw3OhwFgGrqJqEoMFWFImc7oIZHDSWYIDbZ18Q4duDK79ZU9fLR6zKz
         7SfRx3PYVhjyE3PZUDpcAewFD+CviYaabIrQsy8jXB/fbPl1MypixRfJvi8sWGtx7aKs
         KWkxvVqxYt/QWQv/lhyQItJ0KplxoNGdGyKRWyGR9eC7WO08zd3Fcx1MI7bgtJJuY4V/
         TF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652297; x=1774257097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CvDcs3GJL8W4dP7vK+RTbGgQ9jdaNz6Z9EuAya/JZ8=;
        b=XNs+ZeumWNi91VKj1souTLfjiOWa8Mb5LCxwgN1jxuEp1myvqc9xtDEOzlzfalXAlH
         rRUFwLUFE+eovubDU98iYyxrMX+DpVo9xd5UWVWYHSBkTxAG/FiZl+8KNCcQRhEqzn83
         4jn5Gb0EK9TdLXn/jO7hGxBgH4ZyI4fP320zYw3GaCpE6i8sDVapjSqXZIPTa1K9i++w
         asc/cYzKstjXiRbN7zpFvAYcmozkSvTB8oGhoDq30eKkKpkXtIAXvrvlGMy1VZ/jD29y
         3DMcPvFOYEjkUbSFCTloJGouzIjWXqDBjONyj0O8UkoHY8EHAQy+SIZxTr6lhE187DY7
         qFYg==
X-Forwarded-Encrypted: i=1; AJvYcCXkU37jOGMmR7RHu8+uScZ4/Wsce4O0U87aR35ZxBcot4aleCwEAO8I0EneQS0C080gGpZ/0TDXtqcT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8D0TRwU0OGPYDq5v4fBnmGGftTcjMGI8YvYgsiFdaI1MfU/Mz
	/I91/1+fbR0TROL6MGK76A4X/YTQ2E42sPiZClhAVPjvkNxAIkg7RVns0YBsjWci8e+K1nKzZBf
	fUFIPqGoKzcg2l6Ks66Zj2ifNI8lOmd+YihHWS3dywc8p2lTRL/4x/mIfX2ou67m+
X-Gm-Gg: ATEYQzyxXs7b3bSpeFVxeIjKoLc0++b4gHtHac3sEoRnUowREg+7ebQ36iZL1oZFcJt
	q5s762zNcSlmMa94T96QbcXb4pchtSD/tkngZiim3lEp+V+NcTDVe9CtQnVJTnATrQFrtaGhmdA
	Lb/O6GpxNHLCQj4I06dSn7e1dBe226lFno+VgkAAEXYnzUHS0blooJgsdgnxw8WBrKRVs4GguPW
	U5qX9JpFBmVC2xcfKFccWUWVtCg3a7Wb92nUfCqSEx5o+9uiFc9n+U48DmtPsOtBmApNH7UtcOX
	lZi2gmCKwEEJxewoy0ZfXWIjRwyeS+DDvDuoyeZEitMnpUj5ceJgy5vgME31OU20xb8pbLISzrh
	VTVVggPKY5q/WLSPWQBsuNRZxF5SEtweDaIMCvHS5PrkawpsYonc=
X-Received: by 2002:a05:620a:29c5:b0:8cd:93b7:ebda with SMTP id af79cd13be357-8cdb5b25f07mr1518685985a.49.1773652296660;
        Mon, 16 Mar 2026 02:11:36 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:8cd:93b7:ebda with SMTP id af79cd13be357-8cdb5b25f07mr1518683785a.49.1773652296273;
        Mon, 16 Mar 2026 02:11:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, Matthijs Kooijman <matthijs@stdin.nl>
Subject: Re: [PATCH] gpiolib: Update gpiochip_find_base_unlocked() kerneldoc
Date: Mon, 16 Mar 2026 10:11:21 +0100
Message-ID: <177365228185.54363.10529079324683570621.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311-gpio-discourage-dynamic-v1-1-c8b68fc84203@kernel.org>
References: <20260311-gpio-discourage-dynamic-v1-1-c8b68fc84203@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7c949 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hW0YRZ0zdb1i0R2AItEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: j4O9aFVWdytkQsBkW1XvDy_6M5scw0Jl
X-Proofpoint-ORIG-GUID: j4O9aFVWdytkQsBkW1XvDy_6M5scw0Jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfXy/XzyT/Ttv/5
 gIl90bPPf/faQ+L3JJHGtJ+SWP4SQsRHiodppVkVQyxNsM2nG/AzOsHo36RgIdRw893UFShqRJ/
 QW9oodSav8UW14tHSUmtnQrSjsMlPRJ91mb7uIk6veJodyjZg5gyrwZGxYDtTfaAmfhtDDavGpe
 Ds1ybhC0BeCyTcvAAb0+MHR9qZR9+D8es/Pbjy0+K58RsBR19LPBlFAJV4/TP0oGbLBe2NGQsaX
 auV8Gu33OBdvt+smbGsEVKWSsHezP/vpF+y0Asey89ZV4uggHFKamBdfqxyatnCGM2sfoqY0yqk
 cRNZvl6J6hbDBoh+C7SCK9jb3dApb+8ZNy/PSOdByThrODgEgiq4OfLewi867t9pdqPO8YlO28Z
 YBt5Nme3hMVQvaULfvEVIJ3nAkq8L4AjOvdSBz7jzttvSggOMpAZVo2bzQGNc5vXs8NJQi3ke4O
 UPCcW5iYfxHj4XaieFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33466-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60159296CF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 10:42:14 +0100, Linus Walleij wrote:
> This function albeit static was lacking a kerneldoc, and the
> function returns a dangerous number for internal use so make
> that clear in the kerneldoc.
> 
> 

Applied, thanks!

[1/1] gpiolib: Update gpiochip_find_base_unlocked() kerneldoc
      https://git.kernel.org/brgl/c/803e822b0089211367d8d368a163b1dea077159d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

