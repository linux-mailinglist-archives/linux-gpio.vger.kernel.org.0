Return-Path: <linux-gpio+bounces-30007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DCBCEA768
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 19:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6507A302036E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 18:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A362DC350;
	Tue, 30 Dec 2025 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFN3t669";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU5dGHQg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7402DF136
	for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119045; cv=none; b=CMRaWU579GC8SDGR8WL501NgrarWvbVfsuezuneNSkscBhNRhytKSRGSu4W97lIYUJ8zLtSm/dMfqD6geI5X4SMuP858suNF+mVGfq7K4Dft172iBb7Tc5Ba4lJGuToU2IpUszIzhxufDZg5pyrwk6d/RPt0cS/eEsa0F1oZRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119045; c=relaxed/simple;
	bh=7dSnJjUcCK6pOIDtRuQzduIPgkkfk1C5+UmLNM8D2ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hj23m3pPqO314E4PVl9tX2uiDYC/IGBzIG/sWlQYJdV5DQ5l7amKteGDyCvUix8/TWtnL7jExwawAD3l5wYo/a/Q84HqWUDbNMLmGz+1fN661yJCSmYBajoDOuGIrCZWG0QGGxmShBZ81PKSrNcyAdiCGiDGjfkuSqYkIBilORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFN3t669; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU5dGHQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUFL88B899362
	for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TT2JWDxtkvqM/T76/R2j73xa
	lNEA1b2Id5hVcvXGeBo=; b=BFN3t669yfYgCxGKL6W7RM2VSqOnJIf2eAYXt16m
	PcNNXj/pGVXa1sVeupL/ndnJv4I1KU7oPzw9/BgaSRcd+jNDPtP4OHUUgnd+fwuB
	55LN8ZfQAqI2ffRFuuDl9U9Hdpy84QHkNbhBlQtP8NNTQep9iSY1lAjpubbY/SfZ
	EIlp4tnOyNz3MWyFRRPFKug4CA5JiCKJfKH5B9VQdm9nbHCmKERNQjTGI442PCgR
	ewvUInswcab2J1cJYGuAAnVxL42PhLrKJIZPdA5+xHnFXWh8IzjjMy3j6i5k676/
	S20zJ5jW5qwKLtRnaxQpNAngS8uq/fKZbaou8FD2ectOyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky1r4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 18:24:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so255258551cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767119042; x=1767723842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TT2JWDxtkvqM/T76/R2j73xalNEA1b2Id5hVcvXGeBo=;
        b=HU5dGHQgnsM53aP94yNPdcIU4Dfaj+IlJZJ74ZGBtClI6ZU9QXnvT6lqviJSjX2NPr
         HVUZyBeonuFPwV01aTvpKa1vad1Vt2kk1xfCpWdUUVOPTj/PebJW1rLh2RIPe0QLDcEG
         M3H4NaBN6kycTEPLcr38VAlUEQlKTYX2tvvVOyZLa/xMmjOaSIhXiSfO+P+Lo2JH78S6
         JJbZE0B1VBP2L+jophNnZ0ov8G6lYqDPH3pSWaRnREw0i7fV5cZE4G3s5sW7hgX8yEBg
         nXR04vu3aL9ZkO8yYVJH1qIPPycPJYF6js7kMiBJkc9tgkb7hitO/pHmBe67+Chodz2M
         /YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767119042; x=1767723842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT2JWDxtkvqM/T76/R2j73xalNEA1b2Id5hVcvXGeBo=;
        b=JKFx5uSE68Cyoqd/3k95iD9q/sOv7cDnjyOh2qn/qM1FV8q71thX8shN68Ak+cC7LF
         COqZZVjoV1cY8cO2G/fqmj7n9iwdqcbrsKglEWlQ4x1jQLiAGW7gCz23q9WPXqSmtV7C
         nCV1Muffw2cDODxHJWdf81YqFrMi4ByWTrKQHSn61D67pFsODACrXDcF1sfV884jxqp/
         uA0ByfdxLHiAdOtZ+CZQyMK3IXxltG4DxWYensgJL+4NIqS1EO+/T5t1s+ufposUmKqr
         6JXRfWcPhjcbOXiF6A0hVKvXN7K2meYNw9zv3e/frETefZRajtvs3HPwPLtl9JBa7ZAY
         6fBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRTaI4CyB2pUl7vI+/nvjnyxLJXrU4My6fd2cD0F1jf8nt3lB3TihdppZ6Cc00kt3cNFR8kc1+AZkq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7buDQduei/HKjPw7Em9MaPrdhg/S89mg9COQPbvqBAQJACnSu
	lsLJaxGqdky4c0sEZtrPyk3GIgBpu/sAthIkPPe5vHIFghYnX9veL4mbFEQWhobuRknOcztxgBI
	M1ISkufboJ1+7RupALwAxs+CqQeLxxfID3CP3Vgjjzou9xdGcewbPlz0hMLEA6BSF
X-Gm-Gg: AY/fxX5XZUTdAhTjlus62mNDpqP3ZGNE83xc8r5jbdhR+2jmaIzqEHjS5Pn6ujPVMmb
	nVQUPHMceVSBDkoNNhxQGZubc5/B0vCMspopWSGRDfF+AJlaD4+pdQ/FMtqqmwrHFj8xhvHQD33
	YyCNuhwDOeRjYmwzoD6Iho98CzoCe8pgO4algMADlkhiEDZVK6oGloBIQYuyzMLbfJswxZqHae7
	+xudd4qroYnJk82LFIdh4U5WrMElmrcQuU5b4LVLpIgrtYU0Njce2jYwCwGvX2EtjkL41FRWeoh
	XhlbCG/gs6/VWTdGOX4UDd9aB/4818h0VxVhIRL36u3HqthUKyz40wGNEf6PHRqz2OGTjI9vem6
	4DvCfZVku0dAfQzJ9tHkplvQYj3OHCjf8hKJKUWPPZreUWcxpZlok0mXvyd2IvRetBPyId1e/3u
	nM0UTc3PALzT0hn7p6Y4DVBxE=
X-Received: by 2002:a05:622a:5c97:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f4abd02fbfmr551872191cf.24.1767119041533;
        Tue, 30 Dec 2025 10:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+8+6OKflSK6Bubom6ehfUe13lAPzkU4EdfXt11HYBrzMJq9StVBQ88bK7FXswxDWqNtD12Q==
X-Received: by 2002:a05:622a:5c97:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f4abd02fbfmr551871511cf.24.1767119040950;
        Tue, 30 Dec 2025 10:24:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620305sm10337496e87.79.2025.12.30.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:24:00 -0800 (PST)
Date: Tue, 30 Dec 2025 20:23:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2NSBTYWx0ZWRfX/DIb/DLJgbdd
 vEWKjfU4zZ07ial3A6wwAgkENGSzEOvMXrCPaPeu4Hial36GQZMtia4MifS3wWqriG9yQKWLxd1
 i33vLma2O2HalrMFeMyXVqlFOB7bvSOOXhO2fnU2k2S/wPeJoIZcGu2xIxmSWTSrLO/JRZJs+H6
 FfZRRL7WEdrzzBU6iiLE2EGjGwdAUtJWm2x/YqT2Sz/Wyx3YO2M3FqTSc68lV6Z1UVJ4zPzSE6y
 lEtTtRllNIH5T4iR+dLKGALFXrjnNhUoMyC//NDHa63VhAvNlXANsmARnisa7hHPH9+3SLkMQf1
 aOU+WcaaV0hTFkc8OuaCuppV0zMXgQYo5FILs1PznAFAs3qiF2p/ornVT/TSiiqgZBWsJccF62U
 WUh9/EylVglkuI8TEtIFAGHujM57Bx+OOULq6uhr9HVoRDuFdrJe8bJ1rbtk/Q9DlKoE5Nh9O1x
 gUTA9c/fz0qFDLaIijw==
X-Proofpoint-ORIG-GUID: uBo04R0JtAcubwcmtCwmX8hvbmt-woj3
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695418c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Fr_lItdLrazyPUTGiqEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uBo04R0JtAcubwcmtCwmX8hvbmt-woj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300165

On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
> The GENI serial driver currently handles power resource management
> through calls to the statically defined geni_serial_resources_on() and
> geni_serial_resources_off() functions. This approach reduces modularity
> and limits support for platforms with diverse power management
> mechanisms, including resource managed by firmware.
> 
> Improve modularity and enable better integration with platform-specific
> power management, introduce support for runtime PM. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> qcom_geni_serial_pm() callback to control resource power state
> transitions based on UART power state changes.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

This breaks BT support on the Qualcomm RB2 platform. With this patch
applied, I'm getting the following:

root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
[    0.000000] Kernel command line:  ignore_loglevel console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait systemd.mask=pd-mapper.service --   androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 androidboot.baseband=apq msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
[    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
[    4.099410] serial serial0: tty port ttyHS1 registered
[    4.131200] Bluetooth: hci0: setting up wcn399x
[    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
[    4.229099] printk: legacy console [ttyMSM0] enabled
[    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
[    6.514347] Bluetooth: hci0: Reading QCA version information failed (-110)
[    6.559933] Bluetooth: hci0: Retry BT power ON:0
[    8.016330] systemd[1]: Created slice Slice /system/getty.
[    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
[    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
[    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
[    8.962447] Bluetooth: hci0: Reading QCA version information failed (-110)
[    8.976917] Bluetooth: hci0: Retry BT power ON:1
[   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
[   11.302340] Bluetooth: hci0: Reading QCA version information failed (-110)
[   11.309534] Bluetooth: hci0: Retry BT power ON:2
[   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
[   13.665814] Bluetooth: hci0: Reading QCA version information failed (-110)

After reverting the next and this patches, BT is back to normal:

[    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
[    4.082426] serial serial0: tty port ttyHS1 registered
[    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
[    4.108647] Bluetooth: hci0: setting up wcn399x
[    4.125371] printk: legacy console [ttyMSM0] enabled
[    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
[    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
[    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
[    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
[    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
[    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
[    5.671740] Bluetooth: hci0: QCA setup on UART is completed
[    7.993368] systemd[1]: Created slice Slice /system/getty.
[    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
[    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...


-- 
With best wishes
Dmitry

