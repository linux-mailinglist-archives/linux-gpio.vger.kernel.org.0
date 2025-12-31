Return-Path: <linux-gpio+bounces-30013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD341CEB508
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 06:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 743A9301E1A1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 05:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0723101A6;
	Wed, 31 Dec 2025 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y84VpmM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoR86WTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17630FF03
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767160285; cv=none; b=B8pJUmP/sqMX1Ne96vgxXHLZyzywepbhGmgkXnhphYqjG+N41FOgK8/0QnpeDLH8saRocG7gnHI+ILg88hd3BwQZiL8rFGWn/4qjIFhHxLFjTxkSE16GXskBo/ix516Rg48NVHWFJeLBzWHEewthMGW2mr9spoKWXdB4kaSw97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767160285; c=relaxed/simple;
	bh=hNUc66KYmzNDHPT8SqKUItmFE1YMMDH/P/ZygNmOpHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktK4/Nv18e+QSkIoE7OoiQGpKWJBpWXRiyeLHBqI5s0QdU9/vXxAJ0nJJJUFVJMKlsc0k2X9/24KAXovnr3QwxqaqSCgX7xSy6bc4QTJ1fCslia8bbNNYIhubmAKjuywvsu3yl8b9hqh9cO3oZze38Mp3tWEfWlTlfOrVcFvP40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y84VpmM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoR86WTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV18Yem2004587
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 05:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1D1WI01HlWUlaBhDxLjuNMuNuC+Y9y55bVeztJwMQI=; b=Y84VpmM8usfQpKZw
	UMp0RqQfDytX20JxVyZCvbXCb2Db4ncE2aZ04VHDDwb46qAY3dg9ir2/etdCpEun
	X9jdLYSUkkVghDLuaA9a2CDd6xviKbGrGNK3PO+w7/H42ldlrw6q2o/OL7AgB5M6
	kq+qZRKe6sa7QMSEk4ueXi7jnTWki/ECUQA0uXB57ZvVesN8ZdnU+vGudRTckEfn
	gpOvXAn76DEKQpUa8q6Z2NsDTgj5s4Iqg5pXIBEc58WB99jhxS86852swNRnIhB/
	Kc/zDrr4GqIn9t9dk+YgRfFtGmt+VJiIvozwpZc+IS4XRDnm+i+2i2Koos3kuGz5
	jG9DCQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7462ya5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2025 05:51:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88fcbe2e351so172067346d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 21:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767160282; x=1767765082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1D1WI01HlWUlaBhDxLjuNMuNuC+Y9y55bVeztJwMQI=;
        b=JoR86WTQNnmDigv3AJs0rir2WwQj2llqRuUeHW746SPNvtUmm8vkaEHe+Wf3275mwx
         2mH1qAPnHR8TZIYEyOXdnQFgJrsDFe5QU6S2xr4IhCEmE129Up9xyt9ptjyUiwUSYAzz
         QpyakToLE5sPTcZO27k6T0UUr+wle+ja7yoG4Q6z1myUVFLtNOt1LwUQrx+nUZnFKAIH
         jy3XN0vG0V1sA4epox37Jnk99JwPxN8RiuO8/dBbQOtlSQU7MhZ+D8lLFU9Nf5UcgTS6
         d/L5/cZ5OKBGpqFVq94aSm7+kGP5koEK/5NK9qSZiZ5RcNJw8Q+vz/heu4YRXJRZyyzV
         YSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767160282; x=1767765082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1D1WI01HlWUlaBhDxLjuNMuNuC+Y9y55bVeztJwMQI=;
        b=uByVud+1E0iPOuzB/mzO7vavXbCaepug38xL7uoTXDsX+HAOcaDYbApSDAxJ73oir/
         bgWHJuqbzJ1wV1Bl8lK9QSLFDzIcsb3yEB1M0k6iCuD32PL9mfvq6y/CNx6cUJw7tegS
         vBACsTUpZQxt3oI5XoMCNniqhw41BPTcPdKTp7Z0cVF1/M6xhouIvShT+3qhEZ5VZJSi
         Sr0je+lUi4VvAQZbvFvJ2fknu7Tw2smALK1xQ6CNOhfQ9GtlWrNFyooa983v8yBhrPiX
         No624aI+uw2WvYeU2YZrakdrgm7N6szmc+GWcc38eZiGDKam9o4BgTAN8s/s5IN61C2j
         aM+w==
X-Forwarded-Encrypted: i=1; AJvYcCXDQUjP2QsvIL2Ft0oTdgSE11tcFHtA2Y3VnrYRVXoVFsV4HPM6fnkHrylXSWZ0pUmuAjSTzH1Bswgl@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsqokHg0YwZqITC/1qTKSSMNMUEhtavqZ08Pq9ChpsOHZM2ND
	mS1/D271a6bCeWbP8I0d4kS7uZGXToCuDdug3FlDgr/2RbpX8IA8XoFYmhmViUnfUMowbZB0iAr
	vEZF+jAmZ4M+AfZx3qYNk8oRt52c+lnaYaSfgi5L4sm0pEQyhdGf/JUtDodOpVXoQ
X-Gm-Gg: AY/fxX4xdWH8beSFmpvhF5JR+YxIWYJNSYjNcNfAxVkyFDN785+uJ7ei4MsyQOoBhth
	Z2zCAqfVaOw8s9w5h7BZCvO25RbuaiiJLF2L6nHr9zrTJoTxlRlO0uKT/0iB4qJRomlJg9MN4zs
	/zgCzsEHCRlLXD/l+VwSdDn8HekNIUUctWxnsU2M57vKoeSWIHOUDcv7NFuI5OWUPSMe4kOXt2t
	Dk/XDy1onE1NPx1NOdCWcHI6zTvc43RwF7Av92XpmVbX6OZ6zoO4ErgKyXRbjuM3yq/X49sSjhY
	tjdcKVuZov2Siclkbez6jtfdvE0QGQlK3lL2ncIQjCnUVnvIfvvsH0bchrbpylOp6Uc9+JqENW5
	JL5zRgiSMAt+g4dfNTfCqjmH1gOI00Qn0Mv4OGOVOU+ZAGGnSTGrT+XKEygzzlfk/CcVJI46/sU
	VviKMWGxSle0YH
X-Received: by 2002:a05:6214:451d:b0:70f:b03d:2e85 with SMTP id 6a1803df08f44-88d83a7a462mr512987516d6.24.1767160281662;
        Tue, 30 Dec 2025 21:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDVSrWGjW6xKNkyVl0qN5PqwhywtxIUqWcyoHqIgPA5BF+PZbHWgx7U74OxIHPHe9jOV0m0A==
X-Received: by 2002:a05:6214:451d:b0:70f:b03d:2e85 with SMTP id 6a1803df08f44-88d83a7a462mr512987156d6.24.1767160281226;
        Tue, 30 Dec 2025 21:51:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5eb2sm10526002e87.1.2025.12.30.21.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 21:51:19 -0800 (PST)
Message-ID: <8a51bb87-ce81-4adc-92b3-9a077f124ff8@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 07:51:18 +0200
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
 <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
 <793dafa1-43bb-49c4-9e05-cfb597ba39c6@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <793dafa1-43bb-49c4-9e05-cfb597ba39c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6954b9da cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GBWqcSOinP7OtOi6gIQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: m5YbFhhcQhUAHaExOdQXYaIF_JjZNldW
X-Proofpoint-ORIG-GUID: m5YbFhhcQhUAHaExOdQXYaIF_JjZNldW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA0OSBTYWx0ZWRfX9dVJJ2KHWJjc
 0Mq4a3Mw/nHX7zCa1iXD9sbGH5Cp6G6rMZ4B06D+n25jY+K8zZzozVKUBsgIEoR5+JFFnwET88w
 d9oBffghczcU4iWgDbEtMTpsSVHD/7yuS9RywyAs5tInwfZzvVnsOl1zaRPYM53A3lDNjFeV7J7
 1/i/MOuBMppLyWvPw5ihvQCeltKeo/oRopg3cK35Xs6FHdwmzpL4S8pNYbKQJ/MMyVqp7YT5tWV
 YcnENtaUcWNjjQTDrMnT+6wccD4zMnTvTrv/PFEEXtLZNr+qxvHZ4pbo2ovCj0/pZEtSjhsf2i9
 /Chu8rkTyKtzsop0WfLfokIVS+SGK+T3d821oZYwWMuKF4pJE65PPxVlbkoG2IuCwM4n98fSP33
 F22nXTyV+/m37D6CPCTEJ6pnjANR9MVUsX0KntFJ9pSWXoi62YGy+pTle7KhoIa0w5fMeUl3Oc0
 Kw1wMNNjLfN6YqtWozw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310049

On 31/12/2025 07:49, Praveen Talari wrote:
> Hi Dmitry,
> 
> On 12/31/2025 8:30 AM, Dmitry Baryshkov wrote:
>> On 31/12/2025 05:00, Praveen Talari wrote:
>>> Hi Dmitry,
>>>
>>> On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
>>>>> The GENI serial driver currently handles power resource management
>>>>> through calls to the statically defined geni_serial_resources_on() and
>>>>> geni_serial_resources_off() functions. This approach reduces 
>>>>> modularity
>>>>> and limits support for platforms with diverse power management
>>>>> mechanisms, including resource managed by firmware.
>>>>>
>>>>> Improve modularity and enable better integration with platform- 
>>>>> specific
>>>>> power management, introduce support for runtime PM. Use
>>>>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>>>>> qcom_geni_serial_pm() callback to control resource power state
>>>>> transitions based on UART power state changes.
>>>>>
>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>> This breaks BT support on the Qualcomm RB2 platform. With this patch
>>>> applied, I'm getting the following:
>>>>
>>>> root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
>>>> [    0.000000] Kernel command line:  ignore_loglevel 
>>>> console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait 
>>>> systemd.mask=pd-mapper.service -- 
>>>> androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 
>>>> androidboot.baseband=apq 
>>>> msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
>>>> [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>>> base_baud = 0) is a MSM
>>>> [    4.099410] serial serial0: tty port ttyHS1 registered
>>>> [    4.131200] Bluetooth: hci0: setting up wcn399x
>>>> [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>>>> base_baud = 0) is a MSM
>>>> [    4.229099] printk: legacy console [ttyMSM0] enabled
>>>> [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
>>>> [    6.514347] Bluetooth: hci0: Reading QCA version information 
>>>> failed (-110)
>>>> [    6.559933] Bluetooth: hci0: Retry BT power ON:0
>>>> [    8.016330] systemd[1]: Created slice Slice /system/getty.
>>>> [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
>>>> [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
>>>> [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
>>>> [    8.962447] Bluetooth: hci0: Reading QCA version information 
>>>> failed (-110)
>>>> [    8.976917] Bluetooth: hci0: Retry BT power ON:1
>>>> [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
>>>> [   11.302340] Bluetooth: hci0: Reading QCA version information 
>>>> failed (-110)
>>>> [   11.309534] Bluetooth: hci0: Retry BT power ON:2
>>>> [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
>>>> [   13.665814] Bluetooth: hci0: Reading QCA version information 
>>>> failed (-110)
>>>
>>> Sure, will check and update.
>>>
>>> If possible, can you share what is DT filename for RB2.
>>
>> qrb4210-rb2.dts
> 
> Can you please try below change on target since i didn't get target yet?

Yes, I have this patch too. It didn't help.

> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/ 
> dts/qcom/qrb4210-rb2.dts
> index 0cd36c54632f..5f8613150bdd 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
> 
>   &uart3 {
>          interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> -                             <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> +                             <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
>          pinctrl-0 = <&uart3_default>;
>          pinctrl-1 = <&uart3_sleep>;
>          pinctrl-names = "default", "sleep";
> 
> Thanks,
> Praveen Talari
> 
>>
>>>
>>> Earlier I had validated on RB1 and Kodiak.
>>>
>>> Thanks,
>>> Praveen
>>>
>>>>
>>>> After reverting the next and this patches, BT is back to normal:
>>>>
>>>> [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>>> base_baud = 0) is a MSM
>>>> [    4.082426] serial serial0: tty port ttyHS1 registered
>>>> [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, 
>>>> base_baud = 0) is a MSM
>>>> [    4.108647] Bluetooth: hci0: setting up wcn399x
>>>> [    4.125371] printk: legacy console [ttyMSM0] enabled
>>>> [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
>>>> [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
>>>> [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
>>>> [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
>>>> [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
>>>> [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
>>>> [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
>>>> [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
>>>> [    7.993368] systemd[1]: Created slice Slice /system/getty.
>>>> [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
>>>> [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
>>>>
>>>>
>>
>>
> 


-- 
With best wishes
Dmitry

