Return-Path: <linux-gpio+bounces-29747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DECCC789
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 16:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C55513033593
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD853242BA;
	Thu, 18 Dec 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzhkYQmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIQkYJxg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162633032D
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 15:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071860; cv=none; b=C2TRkBiL9xPfpLDRL4i8WhhgEv/qSHgt2reYcWdhlf1VFEmvpoobZiL6pXd5c1zHx3KAT5/kwVIiGoqqhb36snuHrm9DY24nDBbKSJhNgprs7XTYNUNOv2weubjh9jDonnfc6rqIvNvFFTEsi821LQGUFqjyLAwwugQs/7PPn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071860; c=relaxed/simple;
	bh=E+x586/C13tXja4WjIolS4Er/hqW1wqzGsKAXRBYUyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prqXlhkQIvHEiBxEz86TOUt4/gXrS6qwGC8DzQSv5gyhBOBTtYnbtFN0gqK2wBiIxbpRh/4kw4qcv9zzhlVXGy5CDOH3lKOdvQ2/zrO7e78HkueEjJBXn6LPXWN1s4LxmNHW5SAS5o4kxkxrxVTNMFOenaIh2tCKBe5CqXQtMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzhkYQmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIQkYJxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8umH3527627
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 15:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGfKcZLuhsehMaTte44/cuu2OjXZXifRIPfFhkpftvU=; b=PzhkYQmX+ikfduXu
	UFqkkWYZdExnL2/Yyv2oOXgwifIZlPLYXwmQpC6rwjp8yQYlWFj0JIKntX/SIOh9
	v8LTQKfQoljyFEpQg2ZeMdRkIxFhhxRak0q9yebp9HGwvCjYutkqzIEJvW3Vj2xe
	ab+Isvfn3+JCIaTTZUrko/PYTI+fXB5D/gXNmpztn7XmKrn/oHlgO7lYbuGRBt34
	QDMt6XB0+A/BPt5xiznTHk2T2BgXKG65RkqdDHbTNjyB/4TlWBLz0EP5lwmt/wNb
	1tEN92ABi6Q3Fgh0TZaDemN7rwLPsx3fQYhNbFvjz9QScvP8n5x8RyrC3281SqZv
	3aBXzA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb33xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 15:30:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55fc5f8498dso1161749e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 07:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766071857; x=1766676657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGfKcZLuhsehMaTte44/cuu2OjXZXifRIPfFhkpftvU=;
        b=YIQkYJxgM3XCm2og78HT6e96EzohEZRwr1Y1K2Nx9bE/xYsdICH9Oyj2tE+qo25wKI
         h4Q/zaz5NAwsLokoSZ79AenRTl7en9Q+J6jXZiAXUumOSvgD6VnN28rMf+9UqWrf+ZnU
         Nm+fsqfOHeYJ1MkMj19M98mE0BaQnmZUPoh7YJ6CpbHFui6SLEc3/T0NIaEQl+nL7U4g
         uMSFEiC671cdsWrjwVGge+I923xW1n0356dwpYRa91+maya2caaG7EJcub8Esh9Up10B
         AeTxSl/ncEj6g5DeDY4YxIs0LizCMuMWdRvHbwys0pBmjobvZPDD+tODUWZ5G0Uyhm4c
         E7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071857; x=1766676657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGfKcZLuhsehMaTte44/cuu2OjXZXifRIPfFhkpftvU=;
        b=HMqnqlRBIcrWSgtoXLE1ARZq2stwcyPJ5rvOY05zZ+wa5diicrlTc8RsEQwvIzd/ry
         NdlQLRyEhTemOQ0aTz1/aITwLKZIbv9U3K2aLBkP3u82KK2+4npikUW+N8mDnF0fbisn
         Dy1k1EcXi2n6PdQnHyqhfZe6O7LfhCaKmFMoyhwqW0JcwtVcKm90MXIlrl5mxq1zVF+2
         B5iZ/jj3y19GTnl4sl0QgXFP9ulKxI8xXs6UnNUAz1gUK53RCjFzTWeMR5iONIQj3+2P
         7zLcxP621PUB6XgJS66GlKkGwxTJJcAq18k6xucOeA9EVKLDBbclqbTUnNwthJObFaVe
         U34A==
X-Gm-Message-State: AOJu0YyGqk3Dh32rKk+4WeHBcJVCRQxg/AH9vI0PxdPQT6X+AlDl4PeT
	Gnxa1WhTlrTcExeY4Pqti48jpVbJclFgQWc8Qmhvj3539FILbKR9JZutLGKU8m7p+aOpS8sJ033
	2fnwm0xsWBzfGxA9w4RAFYcB0SX9Oprn/8YkGt+xHlN1yuixEENAK52gNeUIMVmhOlfH/udP2
X-Gm-Gg: AY/fxX7hWVzSmLmGFD/nuC6oLLnhxeT/p9c254KOFTdgu8U6M/uGHyiRsknt4pwiZvw
	Zjp7iWeUHO2BvBBrGWn2muq39x3yD0hQRXj1MF1m9gd4p19wrFQdPyAX55vjWouVdcH1dhUkOYF
	mVsUhXbi81DScKgjIV2hFfRebB8BPCRv1PEtgzg+ezOJsOPwDRLCdgJs4m3eHIdas0Y1N93G/9e
	yJ7kxDmkmmnelddGLiZStFZtdoSmUA4gQHtKUvdzG4fos9SeeejpfyJGh81kqQtAveDGt/8pSj1
	0aISWVARMK6LDRn7eDelvyFSbEDJB0TokXTTmVO1ARwjMPNYzhV+17I9Sdzh+BORJbH2TbfIqlX
	FoqgrDGbbZ7KnXyxZtksfsej9hH0MYIadgHB5OD4=
X-Received: by 2002:a05:6122:298c:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-55fed649ac0mr6918686e0c.15.1766071856996;
        Thu, 18 Dec 2025 07:30:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfpjZTIVoMLtcT8mWHvfyIhwe+SGP0yRXkn5DULEwqAGqOqp5nPft1dV1MJ2VTRb6S+YqhdQ==
X-Received: by 2002:a05:6122:298c:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-55fed649ac0mr6918634e0c.15.1766071856467;
        Thu, 18 Dec 2025 07:30:56 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3fcd:522c:c7f7:20f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm49275935e9.6.2025.12.18.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:30:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: realtek-otto: use unsigned long
Date: Thu, 18 Dec 2025 16:30:53 +0100
Message-ID: <176607184664.36611.17945693461141384831.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217202331.9449-1-rosenp@gmail.com>
References: <20251217202331.9449-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _CXZW2nNO2rt87p3K1AUkYL5CUCxp86G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyOSBTYWx0ZWRfX9+VXZnaEf2aN
 beER/lVoBos1MMPWqDagXT/2NNVVlOpWeC1PzRBty53gFGHTkE2SHnidq/ZtZq+Hd2e1hOi7o8V
 ni5aJLV1QtfPKjBuTecUivrZ+yWoWy590BIq/m8iNjYKT5yLqD+qjD+5In18Qf2fpVij7zuiXAd
 0HLROD8YB9xYlP4IomSRZrsrKHB4yGDB+52/xYGniMeY2ZbMAqLoyXKqX/JPLWRUvpAkiNsP93+
 lD7LSwfznXJoLu4CcMmlqWa20uY+LZCDXgyUCpuLI/+rxbRkXvg5gQzF8zQRbsAjCOhyV+aRtyK
 1UFELPcrdtJZUukepYFKxoVxBBMEz2UB3nZYfytZVbkya6QUP/uUQSL68Z842qqCfX+Wz4ef8+U
 kSk48YYFFJNl7c0pc+So2VfwvFnmDg==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=69441e31 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BHFCS8whhx05CEQK0HAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: _CXZW2nNO2rt87p3K1AUkYL5CUCxp86G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180129


On Wed, 17 Dec 2025 12:23:31 -0800, Rosen Penev wrote:
> Fixes compilation on 64-bit platforms as pointers need a larger type.
> 
> Change device_get_match_data to of variant. The data is obtained through
> OF anyway.
> 
> 

Applied, thanks!

[1/1] gpio: realtek-otto: use unsigned long
      commit: 47d8cb678081d12704d52ed42b625e96f38470e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

