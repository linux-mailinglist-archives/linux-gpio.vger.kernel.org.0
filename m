Return-Path: <linux-gpio+bounces-34083-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM/GCPh/wmnqdAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34083-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 13:13:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73008307FC7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 13:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C734B30E2640
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A09B3F7880;
	Tue, 24 Mar 2026 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiiwG5ed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FU07j3OS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F573EFD1B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353906; cv=none; b=L+YD67zRnqqaZ3KyRhgKKrMMBKto+9RA1390QN51QnUB6wjDaBk9Na3cowKpNCvofIro21YTod3m6/5y7LdMnOGUZYiTbdLnADh9Pfo7/Ibu6xZAh35dvuhehSgtDQqa95yO41mCRIa0W9a38lKnXCx3auxy0EntxdlG4je5G2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353906; c=relaxed/simple;
	bh=INmeiGJKMXk+0PJEej2mrgVEmYRHxRGrlBMc5p0a5aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSS7L3tNbA+2Y/v9g+wkKg4SAW95d0KXTmKA4TkMeaPk44aSoLoJ83xy05T+PwP9v23Lx5Ig7wkwWYBw/iwlUB0R6pbotlLhqOGOjPMSU/TRtZLKaN0KoM4SvUXaJDsHip1D90l9/+ugID0BruB7IHIJEUGq50eVicV3mYOQ+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiiwG5ed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FU07j3OS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC4vKp409083
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 12:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5IUEO5PyBIerJfWjfzoqFirzXsSOD9hNzXQV1mXr0E=; b=eiiwG5edacFrpRTZ
	EtFrpYBAz2dzEh8QgxuzMve34/TbRlhIqFNx0EIQC9p4hZ2Sc1R0WIg2sTP6BzrM
	ZMpxlfMwVzsguvbqR5NsG0MiTxuaUDz7gQK9z/PxTLu1TEuNtp0aZM+jWN5B0FTG
	cAEb6aMA1eo/Z0VWzsnyIojgSv0Q7zlmm7vQ+g3Jors7pW4zXq4WIA+Gen1trqxO
	8FKevj/nVzz62rhyId8j2AORT2bDOzfq1W9g4Gu+AsQMotjMluRzjhztxSKw7emf
	qjozK5HoD7x8HTa7uMYLbYLYuYjcsGG4hg2oWm9+adG+aTQzddUtS3YHqtw1B3gb
	YkEiWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexs7ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 12:05:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b064f043adso75412225ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774353836; x=1774958636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5IUEO5PyBIerJfWjfzoqFirzXsSOD9hNzXQV1mXr0E=;
        b=FU07j3OS0SbNW0a7QEOtrOJeGdEIruDFXh+c0y/FIu8wend0BZV/f6m1oR1AErABYO
         UskGWuEYuBqeQyVEZpawhyGxURu7pAp5CBY4nu+ciSOYVSS2Z5xhcfI6SGbBozRPJGcS
         98p5TMrc5OCQYmRiDqMVPbP4WVE0UDIY0wOWqfVGCPYTna6Y/j/ctIkKsYbvDwGVbpCY
         FUxHXzTn1N4NSGQNxBknAH814nerO6wCWvG4Kll7FP4TMLB7BHlB+e6C9b0Wskxx25N6
         z9LQYiXmQ+d1tDCgJflmpmkMCfzeCJ3gIByBfDcCvxi82nqHJlEtio3ATl6fYKn5LFoH
         HU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353836; x=1774958636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5IUEO5PyBIerJfWjfzoqFirzXsSOD9hNzXQV1mXr0E=;
        b=kRmfcsr1A+31pXYa9Q2VoPB8tUXEJKQYj0/4iqbyKuvc9ZNyfX3fZwQAPMcgMPkD8s
         uYaC+qhWoj09ZXcSoiW5w4Efyce18vvUBR7Jig1SCAYPpmqVDYFkGv1FwtczdWYMm05g
         fDs8AwStMhp1ENMRsWFDttq53HVuUSqcNoAj8mWYE2vlgc5S7Sx66euNp5ILJE2kHSd0
         YdLOUV6f99ymukolgI9zgUAn5zLF7jGkG9Aaj2zrdSjiySzDcl9oN+iYlZDp+elMK0Ba
         xQOlhrQfoYvvzsjL7Tq4kWutO3md16PrXf4fmYtM4xBZ9RfDjoNm8c3ALC/IdjuOncea
         MPsA==
X-Forwarded-Encrypted: i=1; AJvYcCXFqWHvSJepH6HxQGmnxUfpLo2DO41W217sbDIC9nWoFXArsGAQ6rF+2IQv1KoY43pLBbtfEVgsJBNE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Y2UmuwhhgQvvQD2sDVjCi4VCB7IAQpJgBJNtmtQ8STK2ln4u
	5tyowjOg1AsioC+IJ0LhlmnpjZpBJ584hodetC4YK3nzHC7+BEHtvvQJN/yMTWP3ocvw6CdWUew
	8XXKKFm0tFlBoyJLudV4KTdnu6mgsqj0wgiaBDR7cGv+n8lrQlZELIR0dGfkn/639
X-Gm-Gg: ATEYQzyPQmBQp0v0iv4opwW2WIYakEbS/u/UlqoqaD38lMy/GT3S5tuFbsNvo+Bno9J
	s6xPEEdOuHxB5d+I/CXpXo9Wbxjw68GwRRo+VET+J75Zt3W0ID8esBOWUi8EAEdF8gvf0uLF85a
	htvT6Buc/16myk49W8Y7TD4wXdShnIPv5W4a/vmEoGNwid8LljnCAQwrZNLeixNIYv5Je7FfSxz
	q+P3oF3h9WRfj84luwmwEtnDUxAcri8N+7OBnrVGFIym4R4xlvGERXUYmQ9htKbREPeMWb4sr+I
	R2h5ouhuNkCNKakdDCjtzeo4JDBzVSvCB2Zvj/v1mv7JTHDnEUNC+yCHZyoqGSHZouXLHiEQJEC
	WcIFhMIFFp1Pwq9g0Wh0sgdI3rjyAIudxwmawDa77fti4XIgxXITY7w==
X-Received: by 2002:a17:903:3ba5:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b08277aecamr143665645ad.31.1774353835791;
        Tue, 24 Mar 2026 05:03:55 -0700 (PDT)
X-Received: by 2002:a17:903:3ba5:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b08277aecamr143662045ad.31.1774353830506;
        Tue, 24 Mar 2026 05:03:50 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656f65sm208995095ad.45.2026.03.24.05.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:03:50 -0700 (PDT)
Message-ID: <f97c6dfa-55dc-4792-95d6-4aa1bce3694d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:33:42 +0530
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
 <4n5heks4oymfz75wiajyc5zuzzulmwyfj2couudbi7gi67h2rk@smpnmyhdjkns>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <4n5heks4oymfz75wiajyc5zuzzulmwyfj2couudbi7gi67h2rk@smpnmyhdjkns>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5NiBTYWx0ZWRfX8EgmLEE4HsoX
 AiPhZEXaMwwkizY3KbbtqbBAbRRRRR3VyT1ItNraXM/W/SXVuVHZ44XMxzK7jIUZlEVsQzMe4hu
 L+s2hA1uTpyn9aPv74UJaZKqQGwxiJbqczc8MKN3MPSwTRLT+77usJKF3M5u+0izRCkHVrRWenN
 PJ4Radms13RsE1k44vuIOno0eLr0Z7a7QhkcFo8TkgWAnMLD1Qz6pn5cplNB8fjjU5aNxsca25J
 AENr2gHLBIZk5nWlb+b4EnrBEQsLsbJ6c9bmRjPoV1UCMZtBYRQZ5kXMpk/T5vr8NywsqfRoXXU
 kxn67OOquveU+Un0Dx58/2jqsYlm9Z0wixQ4NZjIw5fOVdXRW506NtwAo9u9F9fXOw82hDnB6BH
 QxX7x1aICvN3OtDeRxJwQ4E3D7isKxSpk81hVbowCqVJPgkMGrP28+u5yFFrU2f25ZATo8T2t0L
 wjl/MnIHKx8J/RI00dw==
X-Proofpoint-GUID: pebWK6XXUEoV0V2kC5v5p2y9EHMX34F2
X-Proofpoint-ORIG-GUID: pebWK6XXUEoV0V2kC5v5p2y9EHMX34F2
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c27ded cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=rFA5VEQNUbPbIC_WhckA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-34083-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73008307FC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 12:56 PM, Manivannan Sadhasivam wrote:
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
> Just set wakeup only if dev_pm_set_dedicated_shared_wake_irq() succeeds.
ack.
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
> Isn't WAKE# a level triggered signal?
Ack. I will change IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW.
>> +	if (ret < 0) {
>> +		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
> s/wake/WAKE#
ack.

- Krishna Chaitanya.
> - Mani
>


