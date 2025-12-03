Return-Path: <linux-gpio+bounces-29228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8BC9EEBF
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 12:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 75DBB342F6B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 11:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A4E2F6162;
	Wed,  3 Dec 2025 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKnRGWe4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEbCx436"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84262F60CA
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763114; cv=none; b=s2jY6XEBMWXX2rmQ34oTKMkQkIT0PJUOimliuCiSiaJjAunffF7xa6Rbub8SnA5aCTVgQbWlf/DKqE4KUrHkEju0WV7aRhjYoJ85Mtd8/outNqNc81AE1q/NbqIEsdW6HgcmmEC/3GJq5R9Mug01gI5kG3mA2ikd9RsuI6MSK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763114; c=relaxed/simple;
	bh=5jP/VoSZDt33rH4mt3opkl/iHLG9cq8qb7Kq39ZlC+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIpJP0aXeZeEaRZuxegk7Eb46hZtEGW22t1K1FTLj/XvL0SgwOQlTeepDyJhDM1g63pAJv/A6h/3njuQh59YlnjAAZOO2TAwf9fAjzB8br3p6pVf4wcv3p9k6Ua5z8sJugoHNc+2ampPVL2bMVjiZJR9UKSj5bKuZctYwb2tUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKnRGWe4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEbCx436; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3BRtl51975059
	for <linux-gpio@vger.kernel.org>; Wed, 3 Dec 2025 11:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfekKWOcnXl22GCjZ970uFotDObnPAyy1AV6r7CNFzk=; b=dKnRGWe4sUw4keQ5
	w0LbrILjsWlf3ZDujtckq7xtVA+HzbYMaeHaimKU+8iAYVW2WRxYTWyOr1GEiBoy
	J5FQPGl594irpObrPybiPDqAyyDUBkDYlooXzykarEvwrlTl5zYo3kk+UeYO8zf0
	uK++9OVabClundyCFTKMWRf25v9cO6DFBfI7IFEySORnjD705+PhaijjwSTqlOmQ
	/zjlcqo9D3mC0+eYmrhsOGpYSCFBdxGhACk5zTrh3IJyc/HPpxrt8vb/rXuHgxwK
	l9bP4cboOEU7qEEQD6oZpWaXy1S+GAayox4hAMpK8y3OGCAbOWrmnPvmQ0ZSCIJR
	48cvhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmbtg26e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 11:58:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1277549985a.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 03:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764763111; x=1765367911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfekKWOcnXl22GCjZ970uFotDObnPAyy1AV6r7CNFzk=;
        b=cEbCx436RVtQJGULq+YqNdAzV2ap8Vw8wTuoU+P4770ml9PfrEXepyD4zlX0zt0W0F
         JqChCyLio2fSWhQgqpmjH69TB106W7BT8THqETbf67eVM9vX/VlZq/hlFQAt0QaefQ+F
         wr62ionMDOKvTFplWhWDy5bUlIC7cFM7ZAr3R6iC/QpofeJU/Pl49TtnDqZ/paKWbVnN
         6AE7bS0aOptINZQR+P4MXDEqjeS2TZfVRCImuwD9cKkdsI8SVbJi4zpev7vyg1SHZdLO
         jKIoJOvZFbU8JFz1xbnOoXVYKCF8EwW2ZJ3ApsEiNgNc8XQ8y5MqBz4y3LBGiTem6Z8g
         e09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763111; x=1765367911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IfekKWOcnXl22GCjZ970uFotDObnPAyy1AV6r7CNFzk=;
        b=ncZs+BtiIlxFD+drgLa/WPUbJtcjY2Xn3uGYNZMCmQIBj+1fRP7azpvpMOL/guVAQ8
         57mewVukeR/GeO57I1Xx/sk6htI2Dlm6uKfNIs5yRPvmPyjWctp4/v7AqmRIGB9c+Aoy
         hMzrjwth+gBw53dDU5bpdI35RhNVp4fk+UBJ9/yvcxneQkJMCk4GPVPnN5lCjCqfpG+m
         4eogO4HGYKkhgPphI4C1kTnCMGhp8X00Eizgzvzwi9g6fn67Cm+Xoxw7dLgD+SfaZiKp
         5mTp64rOvCFyoSTDr05lhBBbz2NLmNBYlIA1W8V8JrBf11r0hlSLCMrqP2TkQ2utcpY6
         PpLw==
X-Forwarded-Encrypted: i=1; AJvYcCXwIQE5XAhTBHtChfGNvPUTuy6XX7ZfzBzLHsYWSyoBZXiWsgrFGhElI2oEmSvqtu2C1nWfmgiQyQNl@vger.kernel.org
X-Gm-Message-State: AOJu0YxUjZBv57tig3cjpsTNYKX9XKuBJrvaZiIYlKG/N6seKfzCrJ8V
	vTXZK1A2C/MWJ+gbC5O2FawnEhBzxwSZOEDV6x0U7KUz+Um5E363sZyHABPyuLUAsiGJ6aFvlqh
	si2lezsk0sSV+1+/NUnD7PzR4MmxU0uyFX35t7/uHFTeoaCbBtpEH4fJ72deM37jf
X-Gm-Gg: ASbGnctKgliPBVEt0klKM+RVptzx039gWOxV18pnxYyiqnwFS/MpCrU6eKadPtSwwKr
	o3q2gWqCzaq/EZFj3nGnyS5y6v06eCTbxLTXYHh2jmqrmcYlO5AJdRbTgFUQZ6IqT2HAAh9Tjjp
	wNsd7mRTWFGnHlnygn9LbcxWDcFR9V2+eTRlOJlDuXSDGw2+86UXBX3k2gMaomQOAA8oF//uhn0
	n0meHsNyfpfk0l8LWWG7+MBMLVoCzDvDpUDbStJLbjkGGIQOr63vcCMsFXc+BpJcBvCs/NOMmpu
	pM1Y6gQ/tL3o4mT+iq9fcSRc1LswmVqX7Le3VQA64Ds18oTXDe0tte+o6077GaQ2V9JUwA/wyZx
	krCgAB7VAdEyJp8e3WQ==
X-Received: by 2002:a05:620a:31a5:b0:8a6:ee41:1b48 with SMTP id af79cd13be357-8b5e554d6ecmr236479985a.26.1764763111088;
        Wed, 03 Dec 2025 03:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM8UZEKof7wEOrvF5xLwbZL2Oue+XMwDaxe8wa8MERhVKJlu11ZCYmZxdR+n5HdHwMPzOybw==
X-Received: by 2002:a05:620a:31a5:b0:8a6:ee41:1b48 with SMTP id af79cd13be357-8b5e554d6ecmr236478585a.26.1764763110665;
        Wed, 03 Dec 2025 03:58:30 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:4927:87f9:56d:9fc7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b14ad9dsm15137745e9.12.2025.12.03.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:58:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mmio: fix bad guard conversion
Date: Wed,  3 Dec 2025 12:58:25 +0100
Message-ID: <176476307020.41909.9434264246302736639.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203105206.24453-1-johan@kernel.org>
References: <20251203105206.24453-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNBXzVFo c=1 sm=1 tr=0 ts=693025e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4cMv-MQmE-Oz9utJXtAA:9 a=QEXdDO2ut3YA:10
 a=QYH75iMubAgA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NQHu91Dt6RkTmFNiej051eeZCvS9EPMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5NSBTYWx0ZWRfX2uvhFRJYJ+Yl
 7TawJu/UtsZSgtbnmSRsHTzRu0eIi298F+YuY4oEAtxH+edTJ132pDgQZdsmL4NpkwQyYhcEHw3
 BqKydKB/rx+TOtBqSLtcH/KS6KRwkaEc+3LsGq/VS9kiTR01rwWCe36BZ0XqnguMLqp6pQ2gDjg
 cvqr2Zw3pad1Is43yEu/Qb5E7c/ilJaf0re6bOH8RV72NjP5TASn2nmMuTJNpoPjNmvMtmuYVEq
 1uBzgwpyn05ycO5MwXhrt6uDkvyna1wwrEpoJjabXW0s+1C1+roiOrHNPUrBRAlfAUKvGDi/GVg
 CMg9onyTcWG4fQtB0lFPqHS+TfcYlIbytb9tv2Z5ync2Ri7kdB1wGK+qq5lp2F37Jl7+UP2BD8s
 5fNsIWnYCAwLmGRqEKDIh8CqLZcemA==
X-Proofpoint-ORIG-GUID: NQHu91Dt6RkTmFNiej051eeZCvS9EPMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030095


On Wed, 03 Dec 2025 11:52:06 +0100, Johan Hovold wrote:
> A recent spinlock guard conversion consistently used the wrong guard so
> that interrupts are no longer disabled while holding the chip lock
> (which can cause deadlocks).
> 
> 

Eek! Sorry for that. Queued for merge window fixes.

[1/1] gpio: mmio: fix bad guard conversion
      https://git.kernel.org/brgl/linux/c/7d80e248e8fc4c70f8feac4989f3666878039565

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

