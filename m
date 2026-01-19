Return-Path: <linux-gpio+bounces-30737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF654D3AB96
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7806301784A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 14:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7A037B3FD;
	Mon, 19 Jan 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBkLyTHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0d2pPYM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BC435A93C
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768832497; cv=none; b=gT2yiy9zB6bnYqLM2WqTALfAN/FnUvNuMeTKz+pyORHV9cJwLd1K/a0obTp1F58j7bvgSdXyWROyEtMfI0jnbeGJiLhqkh6Vy7Fs589uwC7nyrwLNHySIwAscHJRgCLc3xKdShfvBPoHPIEJqRwYmOyPKaDGwcATu2lsahRxce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768832497; c=relaxed/simple;
	bh=8agNwjJ4zy4m6BRUaQNXinFIwq7siSR4+wJAzG4qWxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xv5nAlYRSZUI7WNGu27I0yIM/Ykg/JxNyf3lwlHA+zqQVBi2vT9Ej9+JRKmgjGw9SZ4ZbxHgrxLo3r4jvg5Kq6VK6HxTNpz+bmXRJ5pQVdSKpCqlCdi8hELhRypJHejokCOb85kaZiDFKZ/eVWedOQrm/5s0lo7S4kZPFGH7YJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBkLyTHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0d2pPYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JDdAIZ1347376
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 14:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=; b=MBkLyTHu7KHdVtED
	SgDcrkk5UUan1MrpVDRaT0Hms5z6vq9gbyBcN4LId7jUIF8bDB/rs30a3Gq3xblc
	bs5UK6F2UArgkILogkapp0gL7Thoch2tvUuc4/W1BfNa1ZI+X/wHYHMVXjY5aNxG
	1F081JymlmZx3BgTb93925rQhXZZwjGaJocsBqo5Om9cafW4lDEewc51dm1UfyK7
	wgyZFVR9z98IvALAodPN96IN6dxmZ73ztmF/6fZWZE69W1Hfee2NgT55OwOzOmX+
	PS5x8Yb9rqtVum6jW0KrGkdTHlTr/PJ9g9DjV+e9/efbZWns3PEBt6As7oILNqyp
	/jiESw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdg3kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 14:21:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2a3a614b5so1062318085a.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 06:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768832494; x=1769437294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=;
        b=V0d2pPYMb0sYAYzfXBSqxRn/yy8r4aEqDjBNVG11GzIUR70WLD+D2KLHfefpY3nmUk
         0Vo9rif0cPZLzep4A76c0ghpdDRtHjR1M5ESEhJisalhTRpnxw7iR+Ys6v0ANslDM9g+
         e1+zsJMAPCD17VdQHFqxu8jRxi/qnab9NBvrO0lkQ+uCMnJTrHf5p2zrm7AozcJr5FM3
         GCjfsoa/8JywXa2iuQbcvQnhI8hgA1eA2zNRbFtungWteo/ZlpGcnGnODPBZEQa+63UZ
         kduKjwGX86Y3/c6+9jD/GWD1CLv94LDzszun+7T40iAsOQjGHDAxWTzcNhStC/eV2the
         ffTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832494; x=1769437294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUD17svob3ckgQw9sTfdTLObVRKIRVlmGErtozciMyI=;
        b=QT+H/fdFfwagQ2HGi544rPCiCTaVhpUh2ZCUAoI8VjdhO1kaj5XbKaWqGTf8UUhekK
         nEbCXzwZDTLXbj9xNrfrehNXzWCuXNJv/H5Kws/3qsNpT1HeAGZE4XiqkAdFVaEHr5DO
         U6Rqi3wYl4/gwKRdZWGiHIg1FkjTJzVoedvXFxPGKR9zN2DP9DyeO2XlLkGVBBSbyGuA
         hdfkJP6C/E2g7YYxCc1uFgXcR5306I1Dn1blOCjsFOnnlys2kUWxOfJu8p9tilraC1V3
         sRTSPox6FR1Spl947KvngvYe+gXFyQuL4YbldHyXHYnUpdmoUwDqcodo5f+7p9+g/kz9
         qgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4HZ9O6oGq1M1rFCmzTKRYd4FvM61ZRosG2GFuFyw0RqCEam+amxf2KtYXcNkIG7AnF6iww/RLagBK@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpAWeehFkbRDnCwQXK7l4SKXSC6JWpwtbFxJWNsSwVmDiegEv
	1+HqFAxfeA1DpzyAQNYf/amnNSHFGYHHarLlCpMQbQteEPsglTXHS40FAiOj+ZRJy7vV0Pp01KE
	dm4CAqCxhVHtKJgURuYkG9NFC5Hx57dzYaGIMbUihucRmSQo/mMMavHqUhfynARio
X-Gm-Gg: AY/fxX6SJa2y53nEuCnjBJ7Pvej5iBtK742HiCY6ez24fRGaf9kyVSKb0ut3AFBEdfI
	EkpOR+5ds9x7pwlllmoc4DnA4Zotaen6d82/fvRVV3OSE+8v7K4N7mGmiFFLaFETXUIAP8XlMwI
	ymqJgMtL4ksVHfqcTdWo576JPVjBpKsAIQxGYMBVNqFjbVuymZL0DBcutLNNJHUsigulAo746Ub
	OCa5Me+mPNbKPKABl/eD031+nZjg9KFdTBPpX9sUJ9IDcw3xOnVfOO4zYoT9ihHtIWpIV1RYgV0
	dRFVFfSX42nqQ8D9behWscfiyNqKvORXmDuD4uRvl43KpO71+2SVOMK0FkMrDfZXBZXFczoEW0U
	6crjDTZ4aFpF3kr6lHvHysqsSfNa77qf3MuuP
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1960801685a.42.1768832494320;
        Mon, 19 Jan 2026 06:21:34 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1960795585a.42.1768832493696;
        Mon, 19 Jan 2026 06:21:33 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8691:997:57af:f0e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm232136445e9.10.2026.01.19.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:21:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: (subset) [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF prevention
Date: Mon, 19 Jan 2026 15:21:30 +0100
Message-ID: <176883238369.34730.6318990234727983164.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116081036.352286-1-tzungbi@kernel.org>
References: <20260116081036.352286-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696e3def cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9vGuVDj-4svxC1PVwDYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sm_KBsaPSaO2mC3Z0BxwyVgJ-taSABgi
X-Proofpoint-ORIG-GUID: sm_KBsaPSaO2mC3Z0BxwyVgJ-taSABgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyMCBTYWx0ZWRfX2QBbvFN+MxWC
 oq+rZuyQJ0dUgk0jIiukbQ+9RnryQSmhtKzYURWEvBehOH3hQ6kvirLk6RukU5hJ7mfS3QNexKT
 +zllsuHzx5PUETgL53NqFg3mtoXBss4Tn0cAaPh/hEPgwhThAPSJIXO/pMB3+vhLlLhwZ3fDjqv
 JN/2foDTHDO593k0R6gaXbxjLpOlFs8gs3S/abpXZUTY6dDNw6mC1KgGJ3uye505sVYEfGHB93N
 geormHh9pSshCbh0WWmZnh7Qz40/eYBH5XBEYkdXtbRUi3oojBhberp/sjxQ8KBlXxqxCaUwE9d
 Vu/7RhOvjRf0qB2iqIHCGXqcfTdwZb+1O7IPuMRbKeISIiU+jtBrF24bydNnP5JOZmIR5bmmJqy
 Zb8z/mIgVd8pzn+8RDcWUDYAa6W42tFtfjkRpZKwgM/33CI3bfuytYqPo/tS1ZSzO8F6fW6zhyi
 ZFxBVu/QB/Mi2e9hnOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190120


On Fri, 16 Jan 2026 08:10:13 +0000, Tzung-Bi Shih wrote:
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
> 
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no change in behavior.
> 
> [...]

Tzung-Bi: I queued these two for fixes. Please resend patch 04/23 separately
so that I can queue it for v6.19 as well. 01/23 and 03/23 risk impacting a
very fragile path in GPIOLIB so any changes to it will have to wait until
v7.0-rc1 to give it a lot of time in next.

[02/23] gpiolib: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
        commit: be037ec1785d76351037103ce6baddd3299606ee
[05/23] gpiolib: cdev: Correct return code on memory allocation failure
        commit: c7843298bf973d4bc7f4346140661e117186decc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

