Return-Path: <linux-gpio+bounces-38620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6kiC1o7MmqpxAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:14:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 957EF696CAB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:14:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nkSGghOh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UNrqb72H;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38620-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38620-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A456530128F1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD803B27ED;
	Wed, 17 Jun 2026 06:14:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC0396597
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:14:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676887; cv=none; b=uYcVW+3WvtGqfJujFH8NGkYinfYxqHT/d9cAbjvy/apOCXZTctHoP6/sfLrOaaZgNaktHWRFIFNKWLWMBdzQ/iUKsixus0S6i4b/LHXKP9VxtjpYBul+oPTeaxVst3shPGOegYMXXokWaYc2nABP9rJVArj4MTEhBKDr9IlKD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676887; c=relaxed/simple;
	bh=wKiMVLUAx19WyFwzzaZvSnwRtvMmSQM1NdB9qiCTAys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=inNxakAx4YGak0Fgu4rmcaHBKACx+kUf3N99SCNKFvoSFScdAsb3ZAajVP6wbrtqiIwobljtZgf1gCAy7LrlhWh850oeLQEtxmhinbb4UjEvr0MAPZmFYzG0jNu/ihD7JOggIVHjcdupeSaJrXdJpSw9V+pohqrlsdVmAzU3d1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkSGghOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNrqb72H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLUl0v1814349
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nttNcpNb9A29dZe30v6JN5+MR96v4shqqFZOyAtYKY=; b=nkSGghOh7aTJnSbF
	fe6YNpt5XvI8RvTXZQVJ7/jxnt9Fl3hEfqtPdLsQqIlkl+l+Z/rmoWOsQo1YfE45
	0r4r0RExwLLKMx9xCh85hvgKiTssJWJTW0G054/ktsbTm92+xzgW85MdgEb7loN1
	qW1P9IWi1fz9iFY0MVl2ONC6QA7k5qftpIPxokucTTZyFTXp+eFQoKIEXSgRYVgB
	yHD52OIjZMf9KQxzBpEECtChEeo1fJ4a4xjb4V7smMbkyeT0+tvngMfHsH1zOcPi
	onfigCfdroCkLQ4PLbei86fvWRU7qZC7r4897sV3oCg3JxPTJe1F5w9ouEjVFIoV
	0hW8/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbsnqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:14:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc232e16ccso1173856d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781676885; x=1782281685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nttNcpNb9A29dZe30v6JN5+MR96v4shqqFZOyAtYKY=;
        b=UNrqb72HOmAK4X8ssYcXEHYzOCGxfgu2aS6RiQhVV6BuD3uaj+8lrOVd6pu9EITLks
         9pbSBXTJ9v0TkEpm6i69DQ0OdZdW4YqxKci31KAnQ/b1BecGWf0rotnDlNKKBzWnZ16Q
         4egz00go9x6yn03UbO4Rd/+UeC+w1TIt/CFJda0RPAk9Ky+D8FdzZp2+X8198/2xAKLa
         YnhDdkedf3APhFAuHjTSrDa2hZeA7Vls9MFVb+07kdlQZGJdXSOoArOa6G7CKtSgovSP
         4Bqsf/cPG4u6Hc1UnblBozK5G2vhnGKoBcpsznKgCDDTcghfq7zPSs95AQetJ4zZH695
         iGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781676885; x=1782281685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nttNcpNb9A29dZe30v6JN5+MR96v4shqqFZOyAtYKY=;
        b=Br5XzeGYTVQzfkDy8Ts26u55LBFv2/0eOyTOBQD9kxvl6qj1cdFhW4GwRKHyE5/Jja
         rpciv2rx4u5kMHxjwMIAEDSPiF4C2h9TY7rGaNla6rqYEDaraHmjOOsZMGL9IXTNdsAZ
         Pj4O1RHGKIP3POlZirecTOCR8b/wlv7lIfklzrMr/HnVmJ9Fq8CjzlOoJeXQP5qcrYtb
         qysRqVTwWEEAxj50vDyyjdYtvujqHi8bn+AouPNTPZFmuKgfZ4nVfcsdvMOD1wYQ7Lu7
         65SEWnL7EM8hQtFeBCXIUSUuljHQZXFwN8OWXw7/7wX/9oAVR9m/1kMXyQFcs/AsUefV
         5NIw==
X-Forwarded-Encrypted: i=1; AFNElJ+ywMN4YeAXj03wcqVuWguPz9aggyBownK0pQgjg2/fTZug04ghNbo/FcJ/GuyVfSKAqHE6lu0CXz6O@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwENzcVYaNIc0S9WxHekBLfobX3jwiE75eySY4AJTmaND/aKE
	9xqrrZ3cq5jwj4KlmAXKjK4EPfwRxk6LANxSJ0CLLYqj3mpRuQpiSdB2ONiRc3Re/lIeSVmKFcd
	dFAo5uip1hJWrCO8CDWqmlFPMIj3e01vjyyaeosuJpEaMdq0N8CkbZmo3FqeA8VzP
X-Gm-Gg: Acq92OGpAebixiEwU699q815AwzMRGnbCcJHa7YzmDa20chn65otbI+NIU4vS6bOB9e
	UVrrOVa+AKL50LnuVDEh9MBvakqIyr2kBmLHNMddtXn8JnCAA00UfyeH1TgILXavV3gwklVyFeO
	q3gCDlYXboq++D677LiGJMLRdKzSt/V5YmeOWYDcSMZVSLkc+10VoeaA7jmZKK6M1N1ezCZ8Usq
	1fkqLTECvQR40r2N9I5eC3Y98QuA0lJjL56h36wxFYSCyNWoiNDCL9gSBBOx9QSjqAOOKK2UJe4
	5hbTqFv3RLvnPMXbI7w75xW8n+deefRGhnfejt3Pfxrv6DNQwUF8+vgw+RYOXlk+/NsWDE/FUnk
	PQdXIi6eMJq677NN100EZ1TBeJDPTB9uI5QADEqE=
X-Received: by 2002:a05:620a:1a1d:b0:916:191f:5052 with SMTP id af79cd13be357-91d8e1a4e11mr483533885a.53.1781676884788;
        Tue, 16 Jun 2026 23:14:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:916:191f:5052 with SMTP id af79cd13be357-91d8e1a4e11mr483530985a.53.1781676884305;
        Tue, 16 Jun 2026 23:14:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm50411388f8f.21.2026.06.16.23.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:14:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] gpiolib: acpi: Add robust bounds-checking and safe address handling
Date: Wed, 17 Jun 2026 08:14:41 +0200
Message-ID: <178167687856.3656.4948917542366798856.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610154204.110379-1-scardracs@disroot.org>
References: <20260610154204.110379-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Na7KqjNmwdc-3cKB5NGhlFKz9UmOgQu6
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a323b55 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6ulFtW-IaP1gNaq5q34A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA1NiBTYWx0ZWRfX9Mn/d+W2TPsg
 hzYzZwl/dY6cexVI8Ra3P+3lwuPen7JA5/DSl4FqmRu/6bIJvBNwPurjScupAXJ3pxPAo1fTCrj
 A5BUsvUSlfDlw/FGaxX2CdkE1i+QG4U=
X-Proofpoint-ORIG-GUID: Na7KqjNmwdc-3cKB5NGhlFKz9UmOgQu6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA1NiBTYWx0ZWRfXxadSlOSr61nW
 0m7gCA69EJeNYqLQoBo0X+Ryz3/bpyFdHskJ0bFClpiKfjZddDkCmHtyg3Jz3vfuLaO8rVH+MP6
 X8/mt8v+SdmIGAzXJK8GfIZct4EilB1X/RMJRGD2JEOxO7O3GObamscoO2etuid6b6JqlXJNbvv
 r+RRP8TB2AewKlwnNF8F2wIk+JQr3LKjot7Rg1ddkxFsE3X7WVBBsPpHXLItbxXhN+PBheRE0Py
 pHX3lgJvCikAcRTUjfn1hK6w8bm9aNC9uxLG/Wru1cpAvDwT2l/z+1LEAClny4+tGq15/dWkyix
 XYZzreI5xyfipzrFhlrpgrJfUgeAKsZwLcXYuMH5tVEKCVMPb/ZvG6SwrTAkx1OR+hshMZFE/3F
 4W6WfzI+8CSXJNbGBnC9Nsrj6bZU12HQAVXGaq3cQj0o5M+8AxsxNfzX4efDqyDafyyrIYAayYO
 p48nK3NDfd4PBHzWsjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38620-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:scardracs@disroot.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 957EF696CAB


On Wed, 10 Jun 2026 17:42:02 +0200, Marco Scardovi wrote:
> The series adds explicit bounds checking for GPIO pin accesses and
> ensures safe handling of ACPI addresses in OperationRegion handlers,
> without referring to truncation or wrap-around behavior, which does
> not apply.
> 
> Changes in v6:
> - Rebased onto next-20260609.
> - Corrected commit messages to describe bounds checking and
>   safe ACPI GPIO address handling.
> - Removed references to truncation or wrap-around behavior.
> - No code changes compared to v5.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
      https://git.kernel.org/brgl/c/dece79032f529d2c9fdbf63a9f2fc32244722775
[2/2] gpiolib: acpi: Prevent out-of-bounds pin access in OperationRegion handler
      https://git.kernel.org/brgl/c/ae9f812df3149729643d27d2af488c112f62af9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

