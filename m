Return-Path: <linux-gpio+bounces-30497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA49AD19D05
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 300FB306B04C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B0036BCE6;
	Tue, 13 Jan 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fny22VuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxHPUVPL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA37279DC8
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317154; cv=none; b=G3EAb7xjIACBSt1cNNG8ue8ihhi1AN4fMQ0qmlXkZZVYrgGOilXOsGtUE+iJVm8jt5/wQ3RqW7MvQIfWlf574eEVX9xXl5jYi42CfyPyrDZsbbn5yYiFrK2UGU+7tmZUFT5t2uycDMv4dth8h6O8Cths7GWrHZFadAMxlIr7L1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317154; c=relaxed/simple;
	bh=K/b/k9wVDrPRdCb3X+4NMZWJIQF0SD1HwX4N5jOlBA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4QgNcPEi8fkI3KGOkBZXNorNyPiUIBaaxROHviy/+S+t0kyk4sw1UqObN+MMQ1LVHSXGhVh9gEtown0iZXk6Qg8HN4jQsQkkzai/wUEyBjktIzPej/bsQ7MiuD9Okp8v3U0Vgv2b4dj/ZkS08lC5QBM4UMpNVPD/ovbbjWywhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fny22VuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxHPUVPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBreGa2865810
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 15:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKia6b2tobpd6hXKg/OrcjG3xLaeMZML2xg1mAiSI14=; b=fny22VuIEmQM7zUN
	fEKnOn5BHfHp5gaUOj07N2nDC67WXl3OIKtNQgk1IZTtcp1GRfvsOlKJ9MWIU57H
	RxCAbujPAeULnVGHSlg4mf6WfTDfkfRceSPn3t2XHMpkFY+lAtGftHdMDVchLO/R
	2TGIRDGAooElZ3GL7iWhOoIdNwzfRdDklGfREoH5b6Gb45yz0Z0N5Nm6IXv+r3c5
	ZD7Dli06H6qtxiSHG6LNZlhQQJW10Fn0bbt5eT3wfidXiAbioRt0KWViJ3bF+QGM
	3ZHjt6yqv5/U+UyCg5+hCO5Cw7geCCcMQGHGiasWfZltcx99krhcYmONlwwG45GK
	r3Yqyw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh9v69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 15:12:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f59bf206dso10161568241.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 07:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768317151; x=1768921951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKia6b2tobpd6hXKg/OrcjG3xLaeMZML2xg1mAiSI14=;
        b=TxHPUVPLkhu6t/Cqvy66w38Zr75Loh679Qmw46JrKaJVRh6qwirUtDefZXOw+eHk4r
         CVeCGbJmUbv3LaXlExV4uEblgQEQ0ZGhIIUVIwMwMeAJwF2wsxuMYXYZ8TWgQp9wJ28Q
         JjIKkOVl2/LKAu4gX1cqV9Pl+z0oWyrVDBuB8zArL3P3HeWzYGpWkFgo2m1j2+kuxQvf
         SlzwUCbSEWQZQrsjUDsVkgzKZtFV8ezLbTSfuhUuBXF6WehimQUAW0zKPU+4+Gv2ppx/
         mSzRU5lf52MkT3W379qIbTgWrYanPdAlbcGdMy1Td+eDd0T264AHpuLtL71r0cuHkZ0Z
         Y0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317151; x=1768921951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKia6b2tobpd6hXKg/OrcjG3xLaeMZML2xg1mAiSI14=;
        b=QpcF3rWsG0mk5DhZXvXRSMqvX4DJKNPPZEQeWpzti9WlZlo4BQ2chjsGZV5SS8Rmdw
         o3ELoxtn6xDecZeEJ6Kbcjwak7IIZlwd9sp8LmoiCx0gdNYocjFbnhdH/lO9+79S+k6V
         n0FgUJmLvtNQK3J6W98uzbRc55smnNy4NZvjvINz2X53Qz8V1TSC+huMAO0Ezld87XSC
         KhawK/cjYJeP0qEq4mwD37dueQRcxWiMdNXJENK2c17utAhW68YmzVSOQdPIBZAknSvY
         kI5wlsH7FZjoPbt36dxBxa5FXieOAn9JfkrPlE9SwZhc8ELCmY4sE1GovULDeq9C/ibl
         5g8A==
X-Gm-Message-State: AOJu0YwFkjQNG18HHcaCJxBEyOvdORCSsxbPLeSXNk+sjdl4ihae4W0p
	ICmwj5PU29Y+CEGy73sehLhooXV/nbDw+ZI/6EWpc0b9C+7hyJ7fIxtb+DArUkpKq4O+DYnxJX5
	S72lzMZQhdkFTkIWWhBN2RA2ul76g51Kx3+DplRfRx8GEKQPaFJFB8VT2WpekTNRc
X-Gm-Gg: AY/fxX7KqmTgaVNoCfmVUwK47xVYVLY0QJ1OLoEfEw6LLE0yPSgjfhm571U6V2hZylK
	cYERpS2Y/68hXIPW9229V9bvJInbMOuL0NbV5D9XugpeIRN39zT7C1DOSQWo61WfQob3G/DEcRX
	18+cmkiYuLoRv18g7qhqyQsrT0I2nXzeTx+U2K6pOO1m3/rICIwJJft6sYGEOoZWmORf+2FWPmL
	YP/VsqMJ96DtmM5T6ZK5nMA/DPTrtYk/cmhBNa0IEk38Pqkl6ijpqE+dmfnjNlewnbLTkYN529p
	kqAWgrjvUfEjuj1OygQp7RqOsxWxZWoT2rugYX3JUbzfobVt/4MHDZetJrX0iWIip0DgPDK06U3
	iS5ht/M7SqINrZ+ptEfQNlR9Ltn3sLIC7+bahKjY=
X-Received: by 2002:a05:6102:26c6:b0:5ef:a164:ebec with SMTP id ada2fe7eead31-5efa164ece8mr5047670137.25.1768317149948;
        Tue, 13 Jan 2026 07:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqLIsWza6MMDIbfVX0uXs4LH4Y6SFrmjmaGcP4gTYLSkTFOTd06fLj5D196dPa3hxzaY4FUA==
X-Received: by 2002:a05:6102:26c6:b0:5ef:a164:ebec with SMTP id ada2fe7eead31-5efa164ece8mr5047613137.25.1768317148096;
        Tue, 13 Jan 2026 07:12:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bff4:6cab:7ac1:4ace])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8701e1d467sm873515366b.70.2026.01.13.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:12:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Vincent Fazio <vfazio@xes-inc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Pierre Gramme <pgramme@gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: add missing Py_None reference increment
Date: Tue, 13 Jan 2026 16:12:24 +0100
Message-ID: <176831714278.87572.6595922957920780251.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113092852.42573-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260113092852.42573-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOCBTYWx0ZWRfXyztVaSBImEd/
 D4FvQidU0gLmajs9MwTr1zgB6LfuxyvML8WsMCPaG2ffwRfJbPkDgn5p5Kiz80OoOiiljY2/Gsx
 2/OvlCq6jvBHp6daYgI4Do5zELYTaKla5f3iMTWVgOhsQp5HOQ/NPgBK+JAoe9gMqAMe3pvv4qc
 tXIJa/AfTiBCuWc37hylh4044Riq8mNNkxrCfZP9xQubzV/zXVqdeJ/sxeWt+zJB/Y8RQgMjXZ5
 dOOR6TdzFWsKANPTVsYgyXwfiPKZQwspowQI9E/0aKs7Y8sddyS+btnwytOQ4w0DsuvH3FQygMX
 vi3k/hyh4SiAIZnV1Mp3XfkRYWjpnyFYJIB0iVXXv/Vl2Y8ugv1zyryr2kx1CDuVBw7HeGZjqAo
 v6l9UP8RjbirQEvzWEa05MWCbDqQi5Sq5Lxnmnw+sJmUdeSOUZw0c4z1X6Jp12BXTJjEkon/b45
 M7Y5M5sQVp1X3rpZkQQ==
X-Proofpoint-GUID: hiJA3Ghk_YDykC-Xcuvms_liy2Yq89yl
X-Proofpoint-ORIG-GUID: hiJA3Ghk_YDykC-Xcuvms_liy2Yq89yl
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=696660e0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NLRfuka0KPNuh8cMbTIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130128


On Tue, 13 Jan 2026 10:28:52 +0100, Bartosz Golaszewski wrote:
> For lines with no name, chip_get_line_name() returns Py_None but does
> not increment its reference count. Do it enough times and the following
> error will occur with cpython before v3.12:
> 
>   Fatal Python error: none_dealloc: deallocating None: bug likely caused by a refcount error in a C extension
> 
> Add the missing Py_INCREF(). It's safe to do even on python >= v3.12 as
> Py_INCREF() has no effect on immortal objects in more recent versions.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: add missing Py_None reference increment
      commit: 8a3058296d95c55f42578463e231693887fccbad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

