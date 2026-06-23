Return-Path: <linux-gpio+bounces-38835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QyAhGQ5IOmoc5QcAu9opvQ
	(envelope-from <linux-gpio+bounces-38835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:47:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25B6B5614
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 10:47:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ADIqg0r0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="IcN1o4/b";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38835-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38835-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 952033046FDE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 08:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E707C3CEBB9;
	Tue, 23 Jun 2026 08:45:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369D3C584E
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204326; cv=none; b=ZPuJx3mVVExpW8rNpzDGQzRTEauvowsAUJ7XrrpjUr5gijtXaO3CXSSSPUQ2damOLpxBmha7EAZevtAYHcFXNnJ6MNGycj7f0IlwZ5XysZrIBdar1kVtC4/MELv34c0n7NvlcYLZuritMmZXI3r2ne3HyBtub40udvKRlBB19OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204326; c=relaxed/simple;
	bh=PEfg9/E5y1UFi3sIEh1+99lXZ/MgRXWyftWSdT02h3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsUR+SDOxEGneBWcKPjVecknk+Gx8swtDhZZLuQNwMikhlFGyOkeFsF+MWts5313RSviSroUWwf7qWjmuE3cNc256qK32IvTf6XNuE8xD3QSxVEGvA3Mune2rZw4jpgPXl4tjFTxSQm0BpRiX8E2eU8FRz0jkGGFXUkdp+9itFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADIqg0r0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcN1o4/b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7kqQM3228495
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=; b=ADIqg0r0UmZFfIA2
	GbpbtZRizks2YNme7bRdSkrW/ikbhz70yXNFFQ4ZvC9+GE6miDx4I9cpVeQkMmv2
	I4gJsIDkLIQqX/Dy7S3+Aoze9l3Y9TM74thAjmQQOEZXaZ5veZCuNMy5fiC+KQDv
	5ylI4NzG8uAyFOpnQZG6NxJEfZHHt8lwg3Ckbj7u5uKN5N+GwNFoGlnLl//PtiZI
	HsytoI6OUx4T2CKXg9bNLgHcTj2i08PtUP3YQNhu0CSxBe9+vFrzPXLzju5mzNfX
	iw44vNFrEsLYpgOkoCeyfYK7sYGAZNxgHciB0o15ImGTZbS9uGuW7WjKHc48wrlT
	mC1YtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29g73u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 08:45:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91574ad681eso823256085a.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204324; x=1782809124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=;
        b=IcN1o4/bSoiSLFIjJax2ewXtxgSGK8StJRhraPLwNBIJRvIZYBaYOfRZpvZevgHIAb
         Ir3jc/RHJNRQi18ncdutsVuWeqij0bRPdkey0tu8dmBMwXoIp5+f73mv/G2Ti6rSd0tC
         Dwwj6+qeBiDOOp7JjhcLyvKFmdTCd/lpajmvK21PT3/X0/usvvqPlr76wDDkAE33KPUn
         l+qHN6+4pn6YGeCd9mBkKeY2kETgV6xdIWCHJC9PtUpWFCAdeMd828DZmDYLaG327rQc
         HOhweYgOouGBaq2dS2JSTJ0W7E/btk/DLYrKKEefiHBtWphmEaC/cJ4KYVKB1wW2Zxyc
         LmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204324; x=1782809124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=;
        b=eqPN8+bjYs27JXM2cEACUAR4QuFuiOd+dPgHn1GuJvOuZ3DmvM2gWbUaLtqDQqUH1V
         OpT7ImWbaa6lmu4DRlswdscZbRP/rxHSX3689P5S4AMuzSsNZpsIaxN6OyvUX4jRwEwi
         NuJ0GbTvA82IkMNyqd6rVhyCCHcH8qDyZmg+NJooI1HWJEVjogcbAgam2rAUEsFfPd3b
         ShDjrQ7RwwYbKOwItc++5PkCDmG+8+Uhl1k282mTBRGgNBa3ROmsgGmcQucbgXMSC8mF
         j177zjLeBS6P+c2XvzGLu36F24v/D0SHfyeiQTFWQbCws8O60Z39srk6fZSwsJ5wmcd4
         aa5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+b+04IwcFBiIqNJX5FE82NXHWERlq/XiHeGYSbedmJNmFSmu88dqzAza5zAzqwWHcNRZRJ7jyS29Xf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4rI9WdmbQIdMD4IFy1CEY1u1HL0l+1N+SnBS36ylqfdl9lzb
	7Oh5Nx7GljCpAf681BETtx95i0D8IfLvUhBbw5vVuWUwRjFBA/GsMUliBTJCoRsfH0FpHnVFmDl
	KaHK6HRj1oX+jbSUR1k7W/fIlrO1Y8NUxYGSEM/W8S/8n6E1eBqlALgm32QxS3CaE
X-Gm-Gg: AfdE7cmR0fpQ2EjhjiRMrDdpzLj+tE6AIByQbcTkU2lf2ngRlzFTP4+3dO/hdEPMXL5
	GPSX84ZAyDQrD/BZeSyqk/mtMZyupFn7JnVkstaZZP2k79o4EKz7KqQX6blnXVvNX+1+dsdRE0F
	Fy2aIZz8AooiNBXvI6381zHl129TH/dc8Plk798x3xxy/P9UDe/bGdgE7wTH/ybXS6M5N9VPqzR
	wyExHNOS7VAJx67Oviibq0wGP/sIKv4ngQ+iaLdr9ncatKLE/Fca1dAQixB8Qq0ApPDRIS3sk8N
	XJM/dAWhKwC2aBItqxcs9wuTNwHi+i0zRE2VJ2mBmo0JI9H/A/rVCXVTuWRUrm1coIbCLm4u3dB
	/4ew42a3CccTUIyL8GwVPZhhnIlxhsQ6dn101V4I=
X-Received: by 2002:a05:620a:4481:b0:915:9051:ba2 with SMTP id af79cd13be357-92092450e6cmr2841998785a.49.1782204323758;
        Tue, 23 Jun 2026 01:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:915:9051:ba2 with SMTP id af79cd13be357-92092450e6cmr2841994985a.49.1782204323304;
        Tue, 23 Jun 2026 01:45:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ac73:5de7:b9d6:d9e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788547sm35622583f8f.18.2026.06.23.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:45:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: do not call pinctrl for GPIO direction
Date: Tue, 23 Jun 2026 10:45:18 +0200
Message-ID: <178220431330.7682.16070388780345614075.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619152439.1239561-1-runyu.xiao@seu.edu.cn>
References: <20260619152439.1239561-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a47a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DckfCgsgHaicydLOKuwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XBatO81Ji-4VepSx2WCHcxqPmxmpSG4X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX1rgyiYlETeu+
 a8HeE27tdRfUSBqxZWlobDEgCNKTF9wHnxQgoVpYcxzSlaJ8R5SdMepy+UefaEEF1QHUVNlWw/f
 SshAckpjr8wL1amNsxagksNXK/5M4T8=
X-Proofpoint-ORIG-GUID: XBatO81Ji-4VepSx2WCHcxqPmxmpSG4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfXwe/vF3C0PSiO
 jPIL5eDBN5OpCF402Q/K0e2GZzUbpbjTc+4d8haZ/Jvdx2RYwBE/8oubA/NQ+fMtej6sxGwMaGv
 jak6YSzrfCe8e2RxnYldnlcKHqAabLu60/JrkVOJffmB9fL6n96DxoK38D9ihCCGhwYGcrPYAMf
 5PPBPsEBdTv2LqucsS+z3w7ewu3RmPefn8J1Og24kO2YQ2tGYBunWN7dcHEogWU+VZqsRY/pzb5
 pXjrWf5SgR9mpYfhLvi2kXMzzwpPJjl3LBkW87x5hc5Py8L2ftcpqATDAKSZlB0Oqjg6jm4A2Qb
 8gdmVBoHWzDzn20ALc3K4t59xi7SZfPDzUGe5OuyZreC5C54OkbIUM9oK8bmjnDp1qWi6k+tSE/
 BJljT/IpB3QZPinF0Aby/7A6CW58RC0wTFkmq7tn10Nidx6jCUO96S5wqxEKIjmNlJNVUuFI78V
 LrS7iEC+CXNimGUCHUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38835-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:runyu.xiao@seu.edu.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF25B6B5614


On Fri, 19 Jun 2026 23:24:39 +0800, Runyu Xiao wrote:
> tegra_gpio_direction_input() and tegra_gpio_direction_output() already
> program the GPIO controller direction registers directly. The additional
> pinctrl_gpio_direction_input/output() calls do not add a Tegra pinctrl
> operation, because the Tegra pinmux ops provide GPIO request/free
> handling but no gpio_set_direction hook.
> 
> The extra call still enters the pinctrl core and takes pctldev->mutex.
> Shared GPIO users can call the direction path while holding their
> per-line spinlock, so this otherwise redundant pinctrl direction call can
> sleep in an atomic context.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra: do not call pinctrl for GPIO direction
      https://git.kernel.org/brgl/c/d3e91a95b2b0fc6336dbf3ec90d831a1654d2720

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

