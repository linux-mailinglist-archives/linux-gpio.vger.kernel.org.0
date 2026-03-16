Return-Path: <linux-gpio+bounces-33513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDSNJUb1t2mfXQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:19:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8F2995FF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 13:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40000302D963
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B05E3947B3;
	Mon, 16 Mar 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM6BIK3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnZpuNm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A323ABB9
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663431; cv=none; b=dRmlFDlcwL+eSEwMm5P2peU6dczea1LDcJyx/1OZyt7v5BDdVv1WuWGUbSkbS0xYVx5M1IgysTsTDI2Ehe2Wc55/PWT8WRNVn+Jt2WfqHhYejPr3FaxjSzGY/sSTHi1YJyHySTP/FkrKQBCPdKIBBT4fwJDPu70SwuM29M1DCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663431; c=relaxed/simple;
	bh=E55bN9iW19XsJWzBcJqKLE6Ogli6gKuGJDKZG9Fzeag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+gxFQzPL12E33msH/+yYMBZS0O0yK/Hj2MuTUEfBKW5YA9RNFYCt6w8B0sdf/tmcyP+XUyAOB+LNwJkkspWw18iDkKvIVhLOGXC6sR+OzWJFMTC2s2MwuMr6t+ViVdIOjVAtpHtOPAkXyPFFn95O9d5TFr84EPgKG+zL+fBrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM6BIK3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnZpuNm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjg8T1282074
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 12:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipatG7a3HYT4bdIPE/LlrD52g+DKPy1sHWyztRHf978=; b=KM6BIK3B4udk7+JD
	n64QxcuJFwNhr+4bjYCrqkYB27NFTraytwGFjQAVAyKiGE3eZSPl7DMEHC0wnn+0
	eUzaV6hkBfD82BjxtKk0x5bPP8l/nb6k1qvq/NxFj3E2IVPpvLbBkam2o3TTJfds
	Owq8b/AssEo3gU0tbBRWXIPj6gvHVx1NcAh0ZliYJcZjIDjTze70BfS9HzG7ETtJ
	P13mHS6tUecrMkSoWP04UaNquv24EEKg0CyLy0k1lL7qqNmZ6Vn7ElRj3A7k9r01
	UskA1qyqyBIHzcVqQg6BTB0t3oNmHh5PAg+DoKz/yF2a3uZOegc2M7ta9HTl7FJU
	kdrSlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5hay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 12:17:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so29647392a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773663428; x=1774268228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipatG7a3HYT4bdIPE/LlrD52g+DKPy1sHWyztRHf978=;
        b=gnZpuNm4G2Vv7Cyx/1vaLrTsb5+ikCrzw5Q/8i87zjiR5pJldwzHLmB4Gtmnd27jJJ
         yI3MY8vukEFS4y+xF1GbvJX4Io8WJ5REjkTqCUlMN4sir+7eLnIrbvDVmUNcxo3DIyZx
         WDcNyvRlpfwohul+Fu0pjWpb2aVGnxeAI1Yl0UIG/7IbKl7uhdEV7xGKER8/hjaJJJkd
         jLiiXjN9h1qitmjP4VweQ/2REDaANnx3K61LMfG+6TketxIXps1UG54I8bZqXn+ZcvBD
         D058h6iEAnqIAxz+jFLiXhW4dFyfWckdVSLnFINh+r5SbqRdHs2mtgVZKGaUCvuMyJ1D
         xAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663428; x=1774268228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipatG7a3HYT4bdIPE/LlrD52g+DKPy1sHWyztRHf978=;
        b=ashQNBRtx/RCua2KDOSvcRylkD4jEK9BA6hmN3bRtpUQw3FFL9Ki7NoJI2l77OqMm7
         M5FYtGQaknxnXbA5DrwXze481P2vA1Nr/JnVvd7upUlC8BDA5fc84oTAMNB3XI0OtrFi
         uBMhd2UycbR+SP20fK6KSQkr2uOtJ1/cKFoo8+t0RayeIvavDeq9V9dP6BY3RZHPQk/o
         LOUdzTCq2lvxIoz6xiP390zFYLfEsGw9NrpyFbG2pwo/L0Cwkg6pUqIA8uDjx0mGYm+J
         hxd39lr4iM0rG6KQMUdvkA49IMT7Lbndm7yUYgzDgkqBvMYlP6O2ey2VqwRyTI1OHqED
         MBow==
X-Forwarded-Encrypted: i=1; AJvYcCW/WmJzZJxZF11MDsDk/4b8p6bpmn9xsKjFqIy6oNwjJwjRI3a/EU7V6Cr/z1FLxWcNTTwgR5JMliu7@vger.kernel.org
X-Gm-Message-State: AOJu0YwohbaUlFrJJkEgT1ZDcOFZVAptl7LcTul6OlW+8LG22OLDs8Q+
	aAcZd4CwwCISE9lGrYBe2vO30xOnAbivi2pgS301LCIfSjTEGvyENU/M/w8/7BOrTINiD3SjJUI
	wKyTV5QfDlk7D5VHCNjFQITWh06yzTtUXk4yhA0CyQrNy5mLn36S4VR4aJftKMFm/
X-Gm-Gg: ATEYQzwGDs8K3LzaJAHQc8d5dgeKAmiAXtpC6aw1kIpgeu+NFzDurE9805fbaDjY29j
	D/3ex2jy5S3Ai14o/nW+5ipB0K55VZUKNuojKyDWAIR3Bkl4LbtvZcJzFpmXbaYllkcTiAZIQm0
	J8J8SHpMvJ5qVo6JqU3fiNxBX1OhFHYV+xc9Y64x3wFEOOsEg1tJSh9PTPzHv5ubUtfSsicEX52
	KS8vn+2ZSMZBiuIgrtevHDe5eK0/qePES3tG9+62jeMGmH2hw6L2PFkcXAyxJ5zhQuIdpAFsOzs
	jrM15khiU6GY1eBPcdKCbSb6MNua5CoUdASz7PJGB+hRWMSB9CKoZ2f/9Heq9VrdgyfiwTUT+Qb
	5TkqBAeQFd/RebSaZVjJPz6ROFiOll3lk/KNH/asneleKwBF4f0qpjw==
X-Received: by 2002:a17:90b:52c3:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-35a21e4ee23mr11585464a91.6.1773663428073;
        Mon, 16 Mar 2026 05:17:08 -0700 (PDT)
X-Received: by 2002:a17:90b:52c3:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-35a21e4ee23mr11585431a91.6.1773663427458;
        Mon, 16 Mar 2026 05:17:07 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm5036680a91.8.2026.03.16.05.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:17:06 -0700 (PDT)
Message-ID: <be9980f3-f036-4260-980f-5d996bc034cb@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 17:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] PCI: Add support for PCIe WAKE# interrupt
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com,
        sherry.sun@nxp.com, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
 <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
 <53uy2vdzc25frf5rpwbybaor5n6jesapl2x7xusnn5zfaqnfy7@udq7ln2a42n5>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <53uy2vdzc25frf5rpwbybaor5n6jesapl2x7xusnn5zfaqnfy7@udq7ln2a42n5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7f4c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=gsM10RqGDrudvkRFLVwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CvaoHmUtJRBSVRs5_apSZYlWpfzlujfi
X-Proofpoint-ORIG-GUID: CvaoHmUtJRBSVRs5_apSZYlWpfzlujfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MyBTYWx0ZWRfX7Nz48ns3OCOe
 TAcGdMQC+jR9KJIcb22nG3VqdhQqGnNq7JDmQAEq6o3bIGVs/xRPp4jP8uXCP0q+tFUNA7huOMB
 lzLEfFpraRsf9EYvrIm0BNrpmjJ+K4ULT9QoZpmR5r27WExKVDyFg28jQnz1gTE//Ms91R+WbaO
 19FT6aPQN6a7/m81cchyIVBH6DunPUH9GC+GDVD7WSmMpEhFP2TMsaw12F3X++zkp/K8CMi/VBZ
 kk02G8M3IJS1/3tiizc4T5YyYLiQ+U7kG4fr2NiHNIBbSRCeSqvOuSS+4DQFLc5WuteJ9Wd3XKz
 2nP3o2fKh7IdWSHeE2GaE6dkW6AvT4arSkWWY7EWI9f/iFlPlg40cmlCS3zgmMpxYd6nkCG3rlK
 L5Bjby5h9RyBeJ/npQBro3wXehGEsKzzeLIbD9h23QI/UfcWaFF3MvVfQzFDm8JrtB5hUEdC6Jg
 fbzHI8fTkf5KxttuITQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-33513-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CA8F2995FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:28 PM, Manivannan Sadhasivam wrote:
> On Fri, Mar 13, 2026 at 12:38:42PM +0530, Krishna Chaitanya Chundru wrote:
>> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
>> two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
>> hardware-only mechanism and is invisible to software (PCIe r7.0,
>> Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
>> the PCI core.
>>
>> According to the PCIe specification, multiple WAKE# signals can exist in
>> a system or each component in the hierarchy could share a single WAKE#
>> signal. In configurations involving a PCIe switch, each downstream port
>> (DSP) of the switch may be connected to a separate WAKE# line, allowing
>> each endpoint to signal WAKE# independently. From figure 5.4 in sec
>> 5.3.3.2, WAKE# can also be terminated at the switch itself. To support
>> this, the WAKE# should be described in the device tree node of the
>> endpoint/bridge. If all endpoints share a single WAKE# line, then each
>> endpoint node should describe the same WAKE# signal or a single WAKE# in
>> the Root Port node.
>>
>> In pci_device_add(), PCI framework will search for the WAKE# in device
>> node, If not found, it searches in its upstream port only if upstream port
>> is Root Port. Once found, register for the wake IRQ in shared mode, as the
>> WAKE# may be shared among multiple endpoints.
>>
>> dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
>> device and requests it, but the PM core keeps the IRQ disabled by default.
>> The IRQ is enabled only when the device is permitted to wake the system,
>> i.e. during system suspend and after runtime suspend, and only when device
>> wakeup is enabled.
>>
>> When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
>> bring the device back to an active power state, such as transitioning from
>> D3cold to D0. Once the device is active and the link is usable, the
>> endpoint may generate a PME, which is then handled by the PCI core through
>> PME polling or the PCIe PME service driver to complete the wakeup of the
>> endpoint.
>>
>> WAKE# is added in dts schema and merged based on below links.
>>
>> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
>> Link: https://github.com/devicetree-org/dt-schema/pull/170
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> No. Linus never gave this tag for *this* patch.
Linus gave this on v5 [1], might be a overlook.

[1] Re: [PATCH v5 2/2] PCI: Add support for PCIe WAKE# interrupt - Linus 
Walleij 
<https://lore.kernel.org/all/CACRpkdY9HsnG=xo=swnMcVha+unmvmxR6e6Ynsj09srM_tPmWA@mail.gmail.com/>

- Krishna Chaitanya.
> - Mani
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c       | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.c      | 10 +++++++
>>   drivers/pci/pci.h      |  2 ++
>>   drivers/pci/probe.c    |  2 ++
>>   drivers/pci/remove.c   |  1 +
>>   include/linux/of_pci.h |  4 +++
>>   include/linux/pci.h    |  2 ++
>>   7 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 9f8eb5df279ed28db7a3b2fd29c65da9975c2efa..b7199d3598b31b62245716c178a5a73565efc89e 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -7,6 +7,7 @@
>>   #define pr_fmt(fmt)	"PCI: OF: " fmt
>>   
>>   #include <linux/cleanup.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/irqdomain.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pci.h>
>> @@ -15,6 +16,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/of_pci.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include "pci.h"
>>   
>>   #ifdef CONFIG_PCI
>> @@ -586,6 +588,78 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>>   	return irq_create_of_mapping(&oirq);
>>   }
>>   EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
>> +
>> +static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
>> +{
>> +	int ret, wake_irq;
>> +
>> +	wake_irq = gpiod_to_irq(wake);
>> +	if (wake_irq < 0) {
>> +		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
>> +		return;
>> +	}
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +
>> +	/*
>> +	 * dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with the
>> +	 * device and requests it, but the PM core keeps it disabled by default.
>> +	 * The IRQ is enabled only when the device is allowed to wake the system
>> +	 * (during system suspend and after runtime suspend), and only if device
>> +	 * wakeup is enabled.
>> +	 *
>> +	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
>> +	 * to bring the device back to an active power state (e.g. from D3cold to D0).
>> +	 * Once the device is active and the link is usable, the endpoint may signal
>> +	 * a PME, which is then handled by the PCI core (either via PME polling or the
>> +	 * PCIe PME service driver) to wakeup particular endpoint.
>> +	 */
>> +	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
>> +						   IRQ_TYPE_EDGE_FALLING);
>> +	if (ret < 0) {
>> +		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
>> +		device_init_wakeup(&pdev->dev, false);
>> +	}
>> +}
>> +
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +	struct device_node *dn = pci_device_to_OF_node(dev);
>> +	struct pci_dev *upstream;
>> +	struct gpio_desc *gpio;
>> +
>> +	if (!dn)
>> +		return;
>> +
>> +	/*
>> +	 * The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
>> +	 * property defined either in the device node or in the Slot node. So first check
>> +	 * for the property in device node and if not available, check in the Slot node.
>> +	 */
>> +	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
>> +				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
>> +	if (IS_ERR(gpio)) {
>> +		upstream = pci_upstream_bridge(dev);
>> +		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
>> +			pci_configure_wake_irq(dev, upstream->wake);
>> +	} else {
>> +		dev->wake = gpio;
>> +		pci_configure_wake_irq(dev, gpio);
>> +	}
>> +}
>> +
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +	struct device_node *dn = pci_device_to_OF_node(dev);
>> +
>> +	if (!dn)
>> +		return;
>> +
>> +	dev_pm_clear_wake_irq(&dev->dev);
>> +	device_init_wakeup(&dev->dev, false);
>> +	gpiod_put(dev->wake);
>> +	dev->wake = NULL;
>> +}
>>   #endif	/* CONFIG_OF_IRQ */
>>   
>>   static int pci_parse_request_of_pci_ranges(struct device *dev,
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 8479c2e1f74f1044416281aba11bf071ea89488a..3d858f36ab48a6daec645574ca9027d9d6f071de 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/lockdep.h>
>>   #include <linux/msi.h>
>>   #include <linux/of.h>
>> +#include <linux/of_pci.h>
>>   #include <linux/pci.h>
>>   #include <linux/pm.h>
>>   #include <linux/slab.h>
>> @@ -1123,6 +1124,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>>   	return acpi_pci_bridge_d3(dev);
>>   }
>>   
>> +void platform_pci_configure_wake(struct pci_dev *dev)
>> +{
>> +	return pci_configure_of_wake_gpio(dev);
>> +}
>> +
>> +void platform_pci_remove_wake(struct pci_dev *dev)
>> +{
>> +	return pci_remove_of_wake_gpio(dev);
>> +}
>>   /**
>>    * pci_update_current_state - Read power state of given device and cache it
>>    * @dev: PCI device to handle.
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 13d998fbacce6698514d92500dfea03cc562cdc2..65ca9551e558d2e3331fab0a968620d6b2a2522a 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
>>   bool pci_bridge_d3_possible(struct pci_dev *dev);
>>   void pci_bridge_d3_update(struct pci_dev *dev);
>>   int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
>> +void platform_pci_configure_wake(struct pci_dev *dev);
>> +void platform_pci_remove_wake(struct pci_dev *dev);
>>   
>>   static inline bool pci_bus_rrs_vendor_id(u32 l)
>>   {
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index bccc7a4bdd794384b7877d453c7989941471c999..372b0d2f4531ea53c0570608306a547101d59e7b 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>>   	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
>>   	pci_tsm_init(dev);
>>   
>> +	platform_pci_configure_wake(dev);
>> +
>>   	pci_npem_create(dev);
>>   
>>   	pci_doe_sysfs_init(dev);
>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>> index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
>> --- a/drivers/pci/remove.c
>> +++ b/drivers/pci/remove.c
>> @@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
>>   	if (pci_dev_test_and_set_removed(dev))
>>   		return;
>>   
>> +	platform_pci_remove_wake(dev);
>>   	pci_doe_sysfs_teardown(dev);
>>   	pci_npem_remove(dev);
>>   
>> diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
>> index 29658c0ee71ff10122760214d04ee2bab01709fd..0efd6e9cb4d3d3beaafb42ea411303139f1150d5 100644
>> --- a/include/linux/of_pci.h
>> +++ b/include/linux/of_pci.h
>> @@ -30,12 +30,16 @@ static inline void of_pci_check_probe_only(void) { }
>>   
>>   #if IS_ENABLED(CONFIG_OF_IRQ)
>>   int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev);
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev);
>>   #else
>>   static inline int
>>   of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>>   {
>>   	return 0;
>>   }
>> +static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
>> +static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
>>   #endif
>>   
>>   #endif
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -586,6 +586,8 @@ struct pci_dev {
>>   	/* These methods index pci_reset_fn_methods[] */
>>   	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
>>   
>> +	struct gpio_desc *wake; /* Holds WAKE# gpio */
>> +
>>   #ifdef CONFIG_PCIE_TPH
>>   	u16		tph_cap;	/* TPH capability offset */
>>   	u8		tph_mode;	/* TPH mode */
>>
>> -- 
>> 2.34.1
>>
>>


