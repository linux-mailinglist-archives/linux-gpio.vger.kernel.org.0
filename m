Return-Path: <linux-gpio+bounces-23618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A007AB0D795
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 12:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A1B1C23556
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 10:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959AB2E173E;
	Tue, 22 Jul 2025 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egWukgoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E062E11BA
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181810; cv=none; b=LraeN0HPBvV4QBm8Mk4MibjgCQHukp/1zu/xbA9EAvK32Y52/q8KwOr/Ro/DjMvqm3AK37iinMRnwcezuLRfznQVMAGN/8KaopvP4LKqqkFwLRTTusoEPUOIkKca34Jgsq0HdoDi2YkrQyfpRj9/KibofHzt48sOu+7wI7a2T/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181810; c=relaxed/simple;
	bh=VmcMpMv1o/xrcqGxrBQh966G5LBlrvi8MJ4jNjqHCfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tr4DYOY41QLxaG486rZX8SKoCQzJdu/SzC/MojWWlFXuKWtrhpNskqlhybuJ/58+S4p7C6I162uFBTcWSkqYfTbM/e7SJD7b0JfSIZJyl6As90lF5WNl9ZbSWmUfoKcPN2P2mkv6HIHuijqULLYOr1ecrlU43mW1nEgEPpIUdig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egWukgoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3PnDq015848
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 10:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7qM0Z+wf2GStDuKTmGsX7zzLsTCMG5C7nE0l4CouW0=; b=egWukgoFgVppj7xX
	iusTxAI5opKABbqQShMnS5QxJtmiE+cepNnCJG8n2YZCxjiTmxuzHbV2/k7xZDRL
	1MOhybQeF1bz7jSSRCPPYVYaaljLZRLtAVUb6z6woTBBNCJ1vz07/9OIOvz5V3tD
	oP3MPTUmvqTYonFhCAlIs933VYDZMAD8dDcII/2xGcQASb+RjU92bBxrZGJLU2xi
	gTt+Dw2J4fTY21dneHK6uSbbelwU2xO7ken5tRtdqCIc7Pj4Ggdj7Zu008MrGKvR
	tC8zbEYL2jZwVORAXrWZBnv9RkQ3MiAei/GeG2E0CijURnhJpcOIMY3FsxdhwHWI
	t4Ar+Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451h0b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 10:56:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2365ab89b52so47865185ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 03:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753181806; x=1753786606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7qM0Z+wf2GStDuKTmGsX7zzLsTCMG5C7nE0l4CouW0=;
        b=cWTk1DFaBGV1dxoCV9hUymMs+YHG1pj3T7nY64N5OMpuY7M7mmL9I4nv4xJqwqY08o
         Subk5IwCC5anQCVufphmaMAlNqb9kyJV7nxslGHbp8lI9HvniEYI0vGSigXdtFdqpZzd
         DsAz7mBQrrvAG+OgRHYsz9HV5ibIx7wYxPbm6b01EdyKahD1/p2r+0wIaLErcYgWsolP
         ZIPgywmmjPCZ0C2euh5fNhbfkOL1FAgKVuNI/QZ+tcQKVxmPwYy+0J5Q6HXGjYqyclk+
         5WLisPnXL54ioHvqGDuYQjAPWVaTNXzB+KMxtvPMAOWTY+LHkMO6NTYTCgm8odhi8mbM
         V1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXFuOqHdhKbzAhbL7Ep1f0QE8JpuO7Iji5FQyrdulpHkOudcguHlNIhHJqp+N4PYXAcZXVnP3sK9bIj@vger.kernel.org
X-Gm-Message-State: AOJu0YyNT/bakbJ9dBtbGPp9hJV9iMXyH79exLvAv5CGRzOJkKga+LH+
	O8DHFaza8bSctzfzheelV/CHh2XR3QsFnOXwb3Y/IHrhjZPNQrUKRuT0IXs7p21n7hm5DC6+Nhi
	R3asxaL3SF29ZORJ/qNNILko7cHgEnIZ+ZzQiMSkd5I1JIU65Il9bSCNKxup1sepb
X-Gm-Gg: ASbGncu3oUyi1Vx9RyPh6jiQ/Il2UCkYKQ9/wUCB0BDQrAqrqnITJV0/jbjCWeNtMHf
	uMs4Cy3cpOLFFoyqjUdspNQEWUu9A00G3mr3MkpDb/jcE1ltfJNMgVGjXaULuQc24vN1G87yjDa
	fMymr1MRkH/KDhpyriszLgbmDlEZvLJDxp6rKlsTqFrBkH1qgpg9NpxBumNrxzHG1qnNaEP570W
	XDaniuloh6TlMI2WYPWxV/TBcRliZ0UvCg6rACtt79fDroFT4aefpso4sf8PWUOsJaMv4HON19p
	BzADzRCI1xh5RuH1kyMT+ux+E3o0dqV2q/1rC78wS27Q6Mc0tGY3LLjyyLBYo9uF95ZpoZSoksg
	1cbE=
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr252315505ad.44.1753181806154;
        Tue, 22 Jul 2025 03:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUt6A7hh/EP89XTAOzcg/lK9W717hw7dFv37fh4cCUg4RhbdxPMNKnk9K5jOdZTIMUErJkMw==
X-Received: by 2002:a17:903:3d0d:b0:234:f4da:7eed with SMTP id d9443c01a7336-23e3b84f72emr252315085ad.44.1753181805624;
        Tue, 22 Jul 2025 03:56:45 -0700 (PDT)
Received: from [10.219.49.237] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60e9b4sm74000165ad.56.2025.07.22.03.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:56:45 -0700 (PDT)
Message-ID: <d614d8e3-963d-4d34-9b15-1544c7a22cf0@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:26:38 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250721-hairy-aardwolf-of-enterprise-bbc99f@kuoka>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250721-hairy-aardwolf-of-enterprise-bbc99f@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f6e6f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=i4jCgTYSAnVeQ-bZYmQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JeR0_BwyQhrPgqmtegn6gQ9sHd-ltB1O
X-Proofpoint-GUID: JeR0_BwyQhrPgqmtegn6gQ9sHd-ltB1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MCBTYWx0ZWRfX+uM2v165r78e
 YEruO9dUWBxz4UANcS1zrx5DYjYn+PI+XYazCj6nSdMFOAOpsZdltKNtSuCKEvvaFv/+1mDYwGo
 ORmT1dP7ZDb7HGGvDkTiFPSSVDbJ09ek0dpAwT3gMtrVAnqwnqd/weo+Cm4/rNkEvubwJ/xBPGa
 xDj52Wm/NPL0wrhqW8gDrVkIGSDlUp8hPkB7OucwH/EVOINFkcz1CstgcDh0uZUhJuAfFXUKo50
 Bu41OVjOXP1+TMXRry6PtiJevmK3culyb0bz5ufpp8y00IsQYbMR99OQF+uqfkMmpuxqiyeE6ML
 9bho+gbx4JIraX5WL4lCTyeTbFUBvv6zN+3YFhEDmakjiZuM1mckPQrd9+W4jX0b5Z4jW0HF/qv
 qAUXY9KVbqzD0wuC9X3BS1b4BwxkajycXgldgkXjQn+dohgy1Kf3hDztmoVzGxCU1nWuxinF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220090



On 7/21/2025 1:53 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 18, 2025 at 04:16:28PM +0530, Mohammad Rafi Shaik wrote:
>> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
>> WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
>> To handle such cases, use the reset controller framework along
>> with the "reset-gpio" driver.
>>
>> Register devm action to safely disable the regulator on device removal
>> to prevents a potential release warning from _regulator_put().
> 
> It is not possible to remove the device - suppress bind attrs. How did
> you trigger that?
> 
Ack,

I encountered the warning as regulator was being released unexpectedly,
triggering _regulator_put() warnings. While the device itself isn't 
removed, Registering the devm action ensures safe cleanup without 
triggering warnings.

Please check the below logs.

I could use some suggestions for this issue. please help with some 
suggestions how i can approve this design.

Thanks,
Rafi.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/wsa883x.c | 93 +++++++++++++++++++++++++++++---------
>>   1 file changed, 71 insertions(+), 22 deletions(-)
> 
> ...
> 
>>   static int wsa883x_probe(struct sdw_slave *pdev,
>>   			 const struct sdw_device_id *id)
>>   {
>> @@ -1566,13 +1615,18 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>>   
>> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
>> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>> -	if (IS_ERR(wsa883x->sd_n)) {
>> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
>> -				    "Shutdown Control GPIO not found\n");
>> -		goto err;
>> -	}
>> +	ret = wsa883x_get_reset(dev, wsa883x);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Register devm action to safely disable the regulator on device removal.
>> +	 * This prevents a potential release warning from _regulator_put().
>> +	 */
>> +	ret = devm_add_action_or_reset(dev, wsa883x_regulator_disable,
>> +				       wsa883x);
> 
> If removal is possible (but then explain in commit msg how), then this
> should be separate commit with fixes and cc-stable, because you are
> fixing actual bug - lack of regulator release on unbind.
> 
Ack,

The Reason to introduced this change in same patch,

without devm_add_action_or_reset(dev, wsa883x_regulator_disable, wsa883x);

if i try to enable ->devm_reset_control_get_optional_shared_deasserted()

seeing below crash logs.  _regulator_put() release warning.

logs
-----
[   10.679294][   T90] ------------[ cut here ]------------
[   10.684772][   T90] WARNING: CPU: 1 PID: 90 at 
/drivers/regulator/core.c:2450 _regulator_put+0x50/0x60
[   10.694344][   T90] Modules linked in: snd_soc_hdmi_codec 
phy_qcom_edp venus_dec venus_enc videobuf2_dma_contig rpmsg_ctrl 
qrtr_smd fastrpc rpmsg_char videobuf2_memops qcom_pd_mapper nb7vpq904m 
msm lontium_lt9611uxc ucsi_glink typec_ucsi pmic_glink_altmode 
qcom_battmgr aux_hpd_bridge ath11k_ahb ath11k hci_uart rtc_pm8xxx btqca 
coresight_stm bluetooth qcom_pon stm_core venus_core pwrseq_qcom_wcn 
drm_exec mac80211 ocmem v4l2_mem2mem gpu_sched videobuf2_v4l2 videodev 
nvmem_qcom_spmi_sdam qcom_spmi_adc_tm5 snd_soc_sc8280xp 
drm_display_helper qcom_vadc_common snd_soc_qcom_sdw coresight_tmc 
snd_soc_qcom_common videobuf2_common qcom_stats coresight_etm4x 
qcom_q6v5_pas phy_qcom_qmp_combo usb_f_qdss mc drm_dp_aux_bus 
ecdh_generic qcom_pil_info qcom_q6v5 ecc coresight_replicator aux_bridge 
coresight_csr qcom_sysmon coresight_funnel pwrseq_core gpi typec 
i2c_qcom_geni qcom_common coresight icc_bwmon llcc_qcom qcom_glink_smem 
qcrypto pinctrl_sc7280_lpass_lpi mdt_loader snd_soc_lpass_wsa_macro 
sha256_generic pinctrl_lpass_lpi
[   10.694524][   T90]  snd_soc_lpass_va_macro display_connector 
snd_soc_lpass_macro_common authenc drm_kms_helper libdes qrtr libarc4 
icc_osm_l3 qcom_rng pmic_glink cfg80211 rfkill drm fuse ipv6
[   10.804083][   T90] CPU: 1 UID: 0 PID: 90 Comm: kworker/u32:4 Not 
tainted 6.14.0 #1
[   10.811959][   T90] Hardware name: Qualcomm Technologies, Inc. 
Robotics RB3gen2 (DT)
[   10.819920][   T90] Workqueue: events_unbound deferred_probe_work_func
[   10.826643][   T90] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT 
-SSBS BTYPE=--)
[   10.834510][   T90] pc : _regulator_put+0x50/0x60
[   10.839362][   T90] lr : regulator_put+0x30/0x48
[   10.844118][   T90] sp : ffff8000809e3670
[   10.848244][   T90] x29: ffff8000809e3670 x28: 0000000000000000 x27: 
ffff70941a04a080
[   10.856300][   T90] x26: 0000000000000000 x25: ffffbfa860a9bee8 x24: 
ffffbfa860e79cb0
[   10.864354][   T90] x23: ffff709406e62640 x22: ffff709418668808 x21: 
ffff8000809e3710
[   10.872409][   T90] x20: ffff709415e81840 x19: ffffbfa86119b680 x18: 
00000000ffffffff
[   10.880462][   T90] x17: ffffbfa86013d058 x16: ffffbfa8601cbac4 x15: 
ffff709419a70b48
[   10.888517][   T90] x14: 0000000000000000 x13: ffff709400032b10 x12: 
0000000000000000
[   10.896573][   T90] x11: 0000000000000000 x10: ffffbfa85fdbcc60 x9 : 
ffffbfa85fdbc7e0
[   10.904627][   T90] x8 : ffff709418668ab0 x7 : ffff709418668ab0 x6 : 
ffff709418668ab0
[   10.912676][   T90] x5 : ffff709418668ab0 x4 : ffff709418668ab0 x3 : 
ffff709415e807c0
[   10.920727][   T90] x2 : ffff709406e62640 x1 : 0000000000000001 x0 : 
ffff709415e81840
[   10.928781][   T90] Call trace:
[   10.932024][   T90]  _regulator_put+0x50/0x60 (P)
[   10.936877][   T90]  regulator_put+0x30/0x48
-----------

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof
> 


