Return-Path: <linux-gpio+bounces-29677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7FCC6DA7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5F3B309FB1A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C82341059;
	Wed, 17 Dec 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0d8LlGZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYu6871e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094F341060
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964109; cv=none; b=MPtKv48I83tfFCbxurQ7+BSg+0K0AxOoJpbtCOcyLlsAVdJycc3GPLwBnM8chF+G6f8lHlG/yE0byXGTqDIQRz8OVQsmcJt5SvqUaHSAQSauTKugOaKzFyo9LVSeiktZ8jAOhZan1i4lZWe7SInLzvwaVcgAlsy28zBrKaREuKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964109; c=relaxed/simple;
	bh=TcgZFT/j0lxCd8iOqu9lGtbM8FU15LinQ2eTOMKFftw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFjXHzvcmOz972yi6dbGO1jUeqM0sS2lNtauD+HxksC04q2mUXtrvKeMYTXPI8OLHtDhIxV4InycfzX5zAr3bEeUY5kQNHT6/CNc1VJUi6jjhnnZDmuBdyP0mKsFfgyQA4Ofc/gemb1VdMfP/TLoyVFOQFXIU1lxOng7Wx1MMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0d8LlGZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYu6871e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3okPA1564942
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26F1lpwtjrO/7doSkG6cgISYnzMVjzNJueJMo19vCbI=; b=o0d8LlGZfzVwsbRH
	ZY+mCxF71APhxPGw5tFXYHya7z6gm+pkTOsMA9ExJGEOaw8b/X5PfOepcVK48TfE
	MwCjUnXD6YhHEhRHmqNhZectGj2wc1tgqSOzfrEUnbF4Ddi/bx5uwkv/dnx55QQr
	Ehu6dBbXuVSt7R4WITwNUkhM1DHwjZeJdPBW/8UWnqmQFKIFa5HOj4E7msbs1J2e
	y11lkR0v/prvy95cQGmhgRVe0eWuM71it+qTAa4OUUW4miamkzJszClAKMIG7o54
	8PaBGVPtrBqORDtEhJNFYFSZ3fIQDBeUFiKBtNMxmnJSHWC9xggQ4xU+ZOWFbty0
	Wt3b6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj129y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:35:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee04f4c632so101070131cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964107; x=1766568907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26F1lpwtjrO/7doSkG6cgISYnzMVjzNJueJMo19vCbI=;
        b=RYu6871e1q63HqnnL078DeVI/Hgpxo44jO2DJYL1hFNBuGhXGSkEqgMotDXJJx/Nbl
         WqfTJqmryzeWe2d1jLBs2PP+5OwyRzwwGqcbiH7mF5YvVzrU1a3zmEejT3TYuE6TaLa1
         dAvMwmPXWXGDlNPf337AO0fuPn31trtflQIVb4Sd2iyW0BlDY3TwGVqLVH+ZCSL9/ph0
         wBhP5HVzWKJ1nz2OuUj1rbVGvEKc9NQt1dBQVyEpz38Ymqmzg+h2MMFzNQDI/h/Vni1+
         IfCeh66rx8cDSwmaQHRkzFyUwuqF/bwtV8S4ZHGlm4IdtPTnp9jJRwZr/rHrWe24jk9J
         UJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964107; x=1766568907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26F1lpwtjrO/7doSkG6cgISYnzMVjzNJueJMo19vCbI=;
        b=eLNpY+8A6Fq8ebsEB8ZunxbNQmfSeTRfWi6EWgdJInfujSCOa7+tfFBraDIMMiasgv
         l8mECrGSuqYeNj6XjW7WE7YV8cVE6H0cWzbGc8POeEU3HSE6EHd/ZEJsEHom03Cso7W/
         XxaInEiUDNAT5qEtla9+NRYGacbwTQOGtigYhXI8aiPGOCJ1UjvN5CF1d4UJhbenxdW+
         B1XNQSX9NT2M7VXvA22zXJ5XE4otckGF1k01tkOrTBVkpSPAqwsjyM2PyZnyGYEF0K03
         Z+5d2C2Latj+TUrDDsX8hx+V1lzpyngVmXdtL0eyiWfeW8IOLNw8WwK4If7WHBvWGZiL
         H+SQ==
X-Gm-Message-State: AOJu0Yw9ZLZgyHpgGdGAyQj60s43OuQ9XRDbqYYWt2wenGfp630OMkY5
	1LcPvw58dLAq/N/5C0IaIVw2Smi9dzjlYaT0kyqwzJSP4/N6h1nLQ+uIw3DEdmKPHIYD5HuSG58
	vn4o4BV7DDWBr40lRml+1ziyUxPHzBk/lklCbVFezIktu9z1NkncLXTV3gNev5ktwG+6R2P6T
X-Gm-Gg: AY/fxX72FM9bFy99mvl5kNQjlxHlju/A0lKPnZbLaa5IxUMTF97WUn49CJNXiD4f3ub
	gOYZDZk05LK7mtsrCXwI06qid9e4aXSrkYve6NHxZBtyNuRXF00skcZ1ueq+jTB8BQwaKdouEMf
	74eqQ9+b2ymFncVLTyLmvA2gZmN3h9ZkOmccIPbkMs3M/Q7IIEuYykfRmsdT/VF6LnNcSecepkL
	qlkQmoIbj2tuD6c/+bZMuDu2kdZDipxuqCqWkgajD1SX1E2vNbue0odweQdZSXUmK8r84evCsy3
	xY6wI0bK9zv9Fifcy4q95oKiujTZXKpFrRo4KJFT/IfS8sE7nDZdWJlkI+3KF18gxe6Ocgud2BX
	R0Sa3i/gAnhd0vHoqlOTjk+mgN8CTIdua25w=
X-Received: by 2002:ac8:5781:0:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f1d05d663cmr244158091cf.44.1765964106724;
        Wed, 17 Dec 2025 01:35:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbp5SJ1HSM4nK1pzKRZMD0AreyqYHi70PxyQSpaD3kFae6bwdagrgvQgBRAUMzaLAzhZaTsQ==
X-Received: by 2002:ac8:5781:0:b0:4ee:1ff0:3799 with SMTP id d75a77b69052e-4f1d05d663cmr244157901cf.44.1765964106304;
        Wed, 17 Dec 2025 01:35:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1cb6a8sm28866625e9.2.2025.12.17.01.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:35:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: realtek-otto: compile fixes
Date: Wed, 17 Dec 2025 10:35:04 +0100
Message-ID: <176596410180.8174.18399563310683257193.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217063229.38175-1-rosenp@gmail.com>
References: <20251217063229.38175-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX6ghgQGisULkx
 wbeMZf2V6Ou2g5m/WCdr4YcGmVJSnE7gHGnUK/Rq5EZ06gaUvtvYA1tg795ptFAUHtoFEygv2bD
 3jdTcENnGW/t8hsL+U6U8Z0M8hXL66nFdkPEUPmPMzbbOMFiWtzAlUvPRMegERPlAuXmDA0m/20
 RdcpuTqlDv7EFLxCb5dD27XTUYhz0mEYMxO2TGG3nZwQRnPy+cEH0i0N8/nqbv/QO0uvd/9Srxq
 +z7Rc3NraRg18SNHzRNGUP/opp0TpMlHIOYLC9azHUSBE/sZIjlYqRgtqlSlQU8a3rv3ZsRe9kc
 3lkRvpSSogeNJywjv4vhjZ49wcdMk0bIZIVhUppOB3LPKMzfW+GTKXWFPSjM3dtsn9VwtRG4NZL
 FesoY8tVFq0K/UU7L1dzNJtIBfK7ug==
X-Proofpoint-ORIG-GUID: T4o_pL-hZzwd7hFvKGeFF74ERLNZ4abf
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942794b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6bl9AGNAMsivcjQJzBgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: T4o_pL-hZzwd7hFvKGeFF74ERLNZ4abf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170075


On Tue, 16 Dec 2025 22:32:26 -0800, Rosen Penev wrote:
> Fixes compilation on 32-bit. Also small OF change.
> 
> Rosen Penev (3):
>   gpio: realtek-otto: use kernel_ulong_t
>   gpio: realtek-otto: add COMPILE_TEST
>   gpio: realtek-otto: use of instead of device handlers
> 
> [...]

Applied, thanks!

[2/3] gpio: realtek-otto: add COMPILE_TEST
      commit: 3203d8f573af87d8c967d36e8d5016ef306ff078

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

