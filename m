Return-Path: <linux-gpio+bounces-30011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E215CEB254
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 04:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CEBE300AFFC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 03:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE73248867;
	Wed, 31 Dec 2025 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6MUjvDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCIytzxn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B145221282
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150055; cv=none; b=uUlghP7ZPfAHTSHmtx0KqMc4mU/ksocKmd1K7cNimeqywvN8mNy0XWXuffKZ14dT2LFIXMLno5nmUtga5SvaLxMFOPgupf2MBhSbSDhJnbecBAt+VT6tvPkluNmqEqHuu+rvJ9Ff4hIUAGygPcJa5gsNbrhQEEbps9C8SEv0alc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150055; c=relaxed/simple;
	bh=P88Oup2V/206TFuPEITBqHQAyorA4xlOSLV2pTxE+8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVN4m9K7M4HMY8idWAxFbulX1D3KvWQA63G2t/gL3zZdKHCX0Ttz+SQLneD///UqkLjj3fhgVw4VkfCbUP2vuI5w+52TImDYJsJ+OuyYPYpdX59GQtRqMM6yvdpEJBeH4oPgSWnV5oprN92Ei19o/jGT9MXy8lIh28NlULm3200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6MUjvDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCIytzxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDQu7o2546886
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 03:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZq1vO+s0UewT/Y/b46qDgPVeoGieEsYyE4WUrw2lTY=; b=E6MUjvDaFEjGA2LI
	rZ3vTYomb8fMV5R2wD9LlXGPCFNv8BC+r9ntzsYL1R5sY3j0NV+Lm2GKKJFy+9HR
	/0uwPmkurM3NdEY/PQF5RC3yh8bWWKZ8qv5PlBm6XpYEIfOvuERmI2kKqvKqTD2o
	jDmMHULBYobDbH22tfn5AW7K7xLNK2O6yZOtZAdnpUKic9x8tuRKU+uQaSFhy2SD
	4FETDBjhuS0kHSP9Uh3YqJvuaCUmEX4jtD/cNBpD/H30164gTbP/ShUN4e8yhByx
	Nll1kHXhbZ14rfD/EPftveCgikAOLiAO5ooQLKIyxVlCZRMxqHrYN9tg0DaJhwMm
	cjAnrQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc739apqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 03:00:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3a4af701so285738526d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 19:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767150052; x=1767754852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZq1vO+s0UewT/Y/b46qDgPVeoGieEsYyE4WUrw2lTY=;
        b=CCIytzxnR5s+mCn/W9O2b0kX5Eh37xg1NwChoX2hBWQ4u09APygOk1MjRzZSGogfGZ
         +tagRXFILWfubRi/UaD2hjSjfSFOk4Y26saluowedxwrPuywrUjXFG+5+J2JojkrWJJw
         aovTpg5VNqfQbbxsCxBF/PFrFhhN0jGTjCGEcaNx6/ItKHVp9+9WWBOMdSvJdkwiasIE
         Vxyoj35GSPROVX5wM+Y74MAMHdS1mbf0oa2S8RMbDbgoxgmx8hwVe5x+72MvHDtteqbc
         03QA7PTLjs4vGxG66XUQ9E+hRRQscJQnQVZMVC9fkzpICwYHjY4SW92PnOjjFLDB/t6Z
         i8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150052; x=1767754852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZq1vO+s0UewT/Y/b46qDgPVeoGieEsYyE4WUrw2lTY=;
        b=mAOzI1VLJNWTW8eVwiSGPPr7blxhaYfIgesolx3AgA7z0UnRk3ipjrzQHXQxC9t/0B
         P0CbHUc9xJv9JshWh4F4fEopD+/ZsKd4RBa0946ERuL5tCxbPCWubUbO+te8eFkKsbs4
         27VxsgyFqu8s/IvOdLV//us7CzDDwrwXmCBLz9Xk2m+hj/6ZyvrIIiZLacjWvF0T+irs
         j3Fg1UyuOxj4wF2eV9LP38zCWU6LXOt4EHbJ3EjTEFfveXkiKbvSytcrRFDFH6r3MUDq
         dILz2nxQhQtbjYkac9W1/ZWa1RMhRchzPGv/vvRo3Jy7JiBWICj+ERuYJO+rX9DRZHOP
         dItg==
X-Forwarded-Encrypted: i=1; AJvYcCUQF5JqBRzC3uOjO8x917PHGQiZrNttL3gFFsEavwJyMRG6pRJY4fjHZ+zm/E/QSM+CqaQrsVl/5AwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy057mBEQtNe7e0S7Y7LXPvmT7pba1IwhT6nemvx2tjXV4toZrt
	RIWtG2PrLXUB6h6wywncppkxLjEnKTV4Vg02/vVs64zQ7Lb2WF2jysXP7RM2FzQHr7nnT5rbFMS
	EKdZEMuprkNa9IFLFGruJybRMpY9SOY+fEg7H4v3HtaRjVR9Cs1COtfoIiB+G3cme
X-Gm-Gg: AY/fxX5sDmlByYUETdjYdBytaLg7CISYnyDjy1rOmnqdxi5/uPHa+OOlTxpweBoTshS
	XtML/fDoOn028YpA/x9JGIiRK2JDlouJnSNnxdNShxvxTYgAXn7i6TaBZbwcTw/H+RCjAtEum44
	A46l2g1Znl1dOD/zx4IXzXUJr7BUQqAD7NjbPmwAo4IRk83hIa8KHgoHQthbQ0ETumJKXgej9mm
	vIaDG5fyJPj9HwP2VpyENvn/RGtQPdYB3EvCorKqfintD8/G1mWywS+waERVxHG9/k7LGZerjhp
	wo65m92JXztcG4tnQYB0K35tUHDDbF1RjNgO99fsl5pB8vfgURvT5fSaUFqH4JPjis0cMsfZUpH
	wn0RfaauRe9rRzDj3y8I5Ois+HikEA1r89i2Qg9zwQLrkbfzAn8263dRtz6MsBnfhLcUwNs63DW
	cFbJ9YN4PdP0Vv
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id 6a1803df08f44-88d82de98ecmr550983996d6.31.1767150052018;
        Tue, 30 Dec 2025 19:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZEnXlnFdFmANR+rVpyhtPVBcgcOgSm85V9POoHbOawN9U11ydPaBgby0L/QU9qnFY/+XXyQ==
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id 6a1803df08f44-88d82de98ecmr550983376d6.31.1767150051542;
        Tue, 30 Dec 2025 19:00:51 -0800 (PST)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186170b4sm10936687e87.51.2025.12.30.19.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 19:00:49 -0800 (PST)
Message-ID: <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 05:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
 <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
 <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IYNjpdO7HuLbCP4zO1_xJSTwzKtbwUSn
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695491e5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TnZdVe0PMZAKthhqzTQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAyNCBTYWx0ZWRfX6kp2V9cYN7XM
 7Exqbsk2dWsYrPS7iXDT+APyxFVp3JSfwkRGrTc7dYS+qE4kvZPYBZ0LyHz3GXARef3p5NYUCdQ
 NrpU2LIf3WeaBkDJWyuEuxWr+1z/KemJBDEd2rvquq2B/fkgsyoXLDc9IvwkmLn1JVnbIPujpuj
 NsOldB1XAJhoOam5MmTHu3tQoSaDfqPWjwdcGRe1gqBezVVeLtq1d7oSL1qeV2/zvB7ONcLWLr9
 Dcj8I1an5+FAGkEPrOZPmN7MVzQYItFzfkstXvwnDrs4/dfnGS6s6gyoqG64wekYr9+45CHV9VM
 UIwyF/XCjOjkbX4ImN4kL2Y2Xs7ECls92+J3hXY0T95h97qB68TP9tgr8IvEzVVr+2C2drEg9hd
 BLFa1vi4t+hTDs1EZ5q5UIOf8+SSWEsxTAeOe9I7sAWXqunNLK5QH/l2ucbsXJ8VYKYFcRjKwSN
 32TNf89ibfL1Xg71SIg==
X-Proofpoint-ORIG-GUID: IYNjpdO7HuLbCP4zO1_xJSTwzKtbwUSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310024

On 31/12/2025 05:00, Praveen Talari wrote:
> Hi Dmitry,
> 
> On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
>> On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
>>> The GENI serial driver currently handles power resource management
>>> through calls to the statically defined geni_serial_resources_on() and
>>> geni_serial_resources_off() functions. This approach reduces modularity
>>> and limits support for platforms with diverse power management
>>> mechanisms, including resource managed by firmware.
>>>
>>> Improve modularity and enable better integration with platform-specific
>>> power management, introduce support for runtime PM. Use
>>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>>> qcom_geni_serial_pm() callback to control resource power state
>>> transitions based on UART power state changes.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>
>> This breaks BT support on the Qualcomm RB2 platform. With this patch
>> applied, I'm getting the following:
>>
>> root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
>> [    0.000000] Kernel command line:  ignore_loglevel 
>> console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait 
>> systemd.mask=pd-mapper.service --   
>> androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 
>> androidboot.baseband=apq 
>> msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
>> [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>> base_baud = 0) is a MSM
>> [    4.099410] serial serial0: tty port ttyHS1 registered
>> [    4.131200] Bluetooth: hci0: setting up wcn399x
>> [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>> base_baud = 0) is a MSM
>> [    4.229099] printk: legacy console [ttyMSM0] enabled
>> [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
>> [    6.514347] Bluetooth: hci0: Reading QCA version information failed 
>> (-110)
>> [    6.559933] Bluetooth: hci0: Retry BT power ON:0
>> [    8.016330] systemd[1]: Created slice Slice /system/getty.
>> [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
>> [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
>> [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
>> [    8.962447] Bluetooth: hci0: Reading QCA version information failed 
>> (-110)
>> [    8.976917] Bluetooth: hci0: Retry BT power ON:1
>> [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
>> [   11.302340] Bluetooth: hci0: Reading QCA version information failed 
>> (-110)
>> [   11.309534] Bluetooth: hci0: Retry BT power ON:2
>> [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
>> [   13.665814] Bluetooth: hci0: Reading QCA version information failed 
>> (-110)
> 
> Sure, will check and update.
> 
> If possible, can you share what is DT filename for RB2.

qrb4210-rb2.dts

> 
> Earlier I had validated on RB1 and Kodiak.
> 
> Thanks,
> Praveen
> 
>>
>> After reverting the next and this patches, BT is back to normal:
>>
>> [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>> base_baud = 0) is a MSM
>> [    4.082426] serial serial0: tty port ttyHS1 registered
>> [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>> base_baud = 0) is a MSM
>> [    4.108647] Bluetooth: hci0: setting up wcn399x
>> [    4.125371] printk: legacy console [ttyMSM0] enabled
>> [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
>> [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
>> [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
>> [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
>> [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
>> [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
>> [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
>> [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
>> [    7.993368] systemd[1]: Created slice Slice /system/getty.
>> [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
>> [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
>>
>>


-- 
With best wishes
Dmitry

