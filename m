Return-Path: <linux-gpio+bounces-38762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fmWjHU/EN2pgSgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 13:00:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3C6AAA0D
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 13:00:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pAiSB1Tk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bTWJb2zL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38762-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38762-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 364FD300399B
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2026 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F08364E85;
	Sun, 21 Jun 2026 11:00:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639C1FC101
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 11:00:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782039628; cv=none; b=M1PQeaq+tLwXVno4gsjAljtFnKcdC8vitZK5d6rjxBiYePXnqMSXnN1SJnaXtVfpL1brBmqDhFQ1wKjrhuJ7WX2Xqrd1hDU4BWHv1WKADqnINZ8/yNjXwvEccot34q7qVJZrDX1ohZAM1loN28xvJPg7oCGbFSMtagqU7ZTW/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782039628; c=relaxed/simple;
	bh=fguVSGysFew77hKfEUDHYpcKuMdwVzjKCBgXk7HtN+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDrNkBaI2xW9irbJioK1u4/YXBDeQegmccItQ7PHnGsW/I4pWN9e+e4dGXXJcRrENdwJJTBVG7/eDzfZD/YRbW5BSS3zV3/ClMbdIozaEjVN3S9jFVY+idNMeV5sNqK9XfaxbvszcmyEMS32JjZwSnuLNl+r0wozS1RBeRxocYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAiSB1Tk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTWJb2zL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LAK1Bq3174947
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 11:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KP2d0e/Iz4EmIJ1yifJ4lYdXiXwHZNnQCD63uhIsUQ8=; b=pAiSB1TkSF57mp1C
	Mda5hKB1JhuHADPgqFwAh3YkkAil/8FiHGl2RnqYj5QFIy/XJclwFQxjDWod1U56
	l8bwRbud92+BN4cqD5E+Lt1+KSmO3jBBm00Q4z6p3mT5YCAtcBGwwApMwsn4ik7p
	Q4pExX9V2Ry/3Aj2E9+rByQcFQxUf7c3CvjzVkJbWhydmlrwxcan9hEAkWVWyRib
	2fsvAD9rOWMexvxUzHcW+aXoaPH3u0UKE0oQgnO8/Fsjt6Eea6DAzbtuCMK+hTq5
	CzhJShU6b2zTukE706FfL+QxkeHcgJiyGf9+IO5dcfgEClb8/quniI4jqOxPJ+Ye
	PXXAEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32ttv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 11:00:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176d949c58so74884111cf.0
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782039626; x=1782644426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KP2d0e/Iz4EmIJ1yifJ4lYdXiXwHZNnQCD63uhIsUQ8=;
        b=bTWJb2zLZqGvCv/0HaWuAQ42sO12F8l8lnUmbrjOgxmXhXbyoLQk3Kiq7zkDFR3Af/
         DgAgXOMPGqEigItJaDh22exrVIAhVH5lQBc0Tx+BrrLciCJ1ZoGZuhdCzyoLEtbk/obD
         HEil3uPQMDSpZUfZ7luGlsXIYvCUzqs+4ztzqqHnKgmR/BJXpggBpUx2SyX16ZjPNPha
         bkCGtNtjygugA04bJGKbgceCkqJFmVXU/A4yew1Zi/Cnr1MtHaORSS699Puq0iCEaWn3
         i39Svh+JQrUIO2pY6KAVDgNcSlhjJpd6erGqVtnPzo5Gpoz9dfh/lHd2tDjM7dDZCCOB
         pfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782039626; x=1782644426;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP2d0e/Iz4EmIJ1yifJ4lYdXiXwHZNnQCD63uhIsUQ8=;
        b=fzy5Ez4uDLaiBaPy1SA1j39GVyF5w0ixIcYUbwHQjBrRzeNS2JhCI0SKZpbUUfX2vM
         01WIgNJOKEI74wbQVNZUELl8dO3jscCWxssdL98B44N4NTBuJnxL6YcLdp00PlAa0HwS
         Z/o1lqsawrMqQqegxUhXzCeraFzb04zffcMEH7bIudRuXbW/wtdV18lf60Jnun9aVO93
         V2s3g/Aahvgc535FcjVnyc9rjHIIUsz15a/x0FkJrOR9Nr8owTWLVlDhqEebYpAdXbdj
         ullRqJFSz5pPAlsTzPma3jng1Kz4/87NM8441JUzewhn4Uc0vKtogYEHYu4XetvvEg/a
         mJvw==
X-Forwarded-Encrypted: i=1; AFNElJ/QsEYJIDNBlkiohMxJv8nMDfISjt+Yogfb+Y37DoL8pE360jpThGOyDU3IoRpYj+jFk4BMc3+DC5jP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aj1LdaG7YX9aRY1PCB7kppjvQGkXnIdJyxRBa+Qa78LSJA2S
	06rEuhLs5aMMGNVO6O9lbki5WeDwd5cx6OHrI/Ud7zkkbx1GT0xnF+HmLVfcU61Lhr5TJKxlvWs
	isy8FZfCvX5Hd9cXaIMyVE1nQP5vXJHwCcDz1gCPpvyMC+mizGSmUcDTUL5CDE6Ud
X-Gm-Gg: AfdE7cn5IYqJ7iHca8uvM/SYM9cGq0zw2aWkzg64Fkd6SyH45yE57dsEry401TJSowE
	8f61qEfvDJV+mI09XoLSwJD2p5Fj2qu9zck5Zn+DXfDMmFbQdGgnmAKFnOzJvgGxJXPE6vqbWsE
	N6P5+ndOrso3U/SwoABW6g5d0zrhZdGJOBYAysA1+bkktkpVPO+xV8w2cJSasZG5fcx5LGLfumB
	WSMAL5mZuc0MIuN1xgUj896VjG8ZyPbINDBad3y5JntocNh4pEdy4Cps45ih0DFySHEwlqB2UY/
	TF7cNuFOPLco99pWh3qRTL+swlkoLE4VCWjD6DhTS9e/YshA5p9DC9HOjOQBM0M8pPFZSUcVMid
	81dPhk7D5d9NKnpalqKPLrKGS9SYU++nJD9cXHNDABz0dRelcHF/dPyUItSDTcEM+1DvYKrESHM
	R9C2aLxCasWcle6AnzCzU+NpcU3UWcFwX5bRDk31IsLev5CBjQxO1q1N/6cpK7J+4Yb3wtBpE5A
	vf3Sw==
X-Received: by 2002:a05:620a:29c6:b0:914:7e9a:2716 with SMTP id af79cd13be357-920d46198e3mr1486992685a.38.1782039625833;
        Sun, 21 Jun 2026 04:00:25 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:914:7e9a:2716 with SMTP id af79cd13be357-920d46198e3mr1486977885a.38.1782039625054;
        Sun, 21 Jun 2026 04:00:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b84f362sm1521464a12.10.2026.06.21.04.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 04:00:23 -0700 (PDT)
Message-ID: <9237988a-2f5a-4c4e-8586-12899957bfea@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 13:00:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
To: Marco Scardovi <scardracs@disroot.org>, bnatikar@amd.com,
        Armin Wolf <W_Armin@gmx.de>
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
        westeri@kernel.org
References: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
 <20260617185318.11237-1-scardracs@disroot.org>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260617185318.11237-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oKywL0pGYv-CuRKYOa6UECCGvnFldpyY
X-Proofpoint-ORIG-GUID: oKywL0pGYv-CuRKYOa6UECCGvnFldpyY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDExMSBTYWx0ZWRfX/2IKZMHAw/io
 iFisnW8YCVYB9v4uG1mT01E98XCAgPjUquJIvydD8K5krrOFqNdxrlyEAHvu4t60YdLZqtu4gJW
 JJk4UJo3GkGeI+PuufjmEvYqm7El5sw=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a37c44b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=nMmVnbrQdPhwzN1N7zMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDExMSBTYWx0ZWRfXzFNCuOThJipb
 9g4wv5cQRSEqnqsizvBapGTa2sH7IfYby/X058Lse6l72bFuILOOEdhrIENoZHlsxSp6P9t7A1v
 FwdG2lgxHxUIcnDIR8O/lGFC7RlqRIRnhDk1A/bMVkI3jHkzmQOlrbHFewESJuFeY8xLl92vH3z
 CxVR0otOR6U2tSmjbyH+A1iIOzN3DF3w+IZf9gd6JOxJja1ZsmEglo+Rau8a8tfE+08jLaeW4+P
 fh/uFJaPcehOVLwnBUcm8AiMy0KnLhZA8SpjAIqePp5OAlESG41ivUUyw+q/HGQBDokGdHQDAhE
 VoU6S8/irEwi09DAUX67ks/UXGn8v9MJXTBrUzn7I2fsLlVmIvcAnB31TavWYLZ+hsW3l0quD+q
 xDp04wKAgukA6CH7He+phB64/qJ7l7nuQG27Vmcfm7qGedyfUTmqI+WBRSduYpRm7qfE913IpY9
 HOYwqR/wNpmr3omReEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38762-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:bnatikar@amd.com,m:W_Armin@gmx.de,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[disroot.org,amd.com,gmx.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBB3C6AAA0D

Hi Marco,

On 17-Jun-26 20:50, Marco Scardovi wrote:
> Hi Basavaraj,
> 
> Thank you for your review: this is the v2 with the rewording as requested.
> 
> Changes in v2:
> - Reworded the commit message and the code comment to explain the actual
>   boot-time replay mechanism as suggested by Basavaraj.
> - Explicitly noted that the touchpad itself is driven by i2c-hid and functions
>   normally, and that the ACPI event handler is preserved for post-boot events.
> - Rebased against linux-next-20260616
> 
> Marco Scardovi (1):
>   gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series

Have you tried adding this patch to your kernel instead of adding a quirk? :

https://lore.kernel.org/linux-gpio/20260429025247.1372984-1-mario.limonciello@amd.com/

This modifies the code which does an initial sync of edge-run ACPI GPIO
interrupt event handlers to match Windows and to skip it in certain
circumstances.

If that does not help, we should wait for Armin to get a chance to check
your DSDT to see if the magic _DSM which inverts the polarity check for
the initial sync run is there.

By matching what Windows this we can hopefully fix this for a whole bunch
of devices rather then having to rely on per model quirks.

Regards,

Hans



