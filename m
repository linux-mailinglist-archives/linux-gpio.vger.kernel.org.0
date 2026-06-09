Return-Path: <linux-gpio+bounces-38194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s8JBOcA4KGqkAQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:01:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D2662157
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 18:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kxW0fQt2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XBOCJQA8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38194-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38194-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58D9C3045B17
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27AA47DD6C;
	Tue,  9 Jun 2026 15:38:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4743E4AC
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 15:38:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019536; cv=none; b=Bew03gW8SjOpaYrbL3uwe2qYm799s97jdp+76AZvYD/g93xXsSpisYLFjbWfW3af3RnkOaMc4/y7j78l7y347sYxw8fryvGdJfXb1sniei18rh4S33eg8bpahIKVECcYM5GKEnRepfnLv2oEsw7U4XeFcRH/CJsR+j7GnGG0wrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019536; c=relaxed/simple;
	bh=0kct+14mMG1xFdsNVtMmX0y3j/+kU9r5xuCPCGUMWEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA3QpsYCskQfSwpS3hu+KCXvmGBn+NzDa8POkN87gcHBb42FarZG6QY34EG9f+yqx25BB0BiYA+LAAttZzhlwfoQ2lGOmN7GHSZx/IPxRZgL9rEod3Tgb4sWrWUlr1sixv3oNNXOI/pnldmyt+qizB8hOnuH6isWlN3p2y5+tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxW0fQt2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBOCJQA8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cmga82700856
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=; b=kxW0fQt2xsmeD8ZY
	tMdptrcCoLAs/kHbN3BKX8zq6WVGoT/LmX2S3UfaU+7eC1EcSWN0SBSkAP8IvLLn
	IkWEC+LevOXch2zo6FlnDFVKcFUWMuessCZoJezAP7n6pQ7WpP2SoHx4rVgjop5I
	iZwxVcndMGA1lvMZOR8Gyq6IR2mXVK4jlXdYYX+V4sJ513uNycZF9PmVf/sE77Tv
	Tm7s8UD2L3ho4eTBDuJMS4beT59lO5awaL7icYZ8IVoTyexOZLIwZFJZ9ze78pml
	Gz8VnlR8bPLmLsfBiYqCtl3WFLlqrBjKLlJRm8wUOsk8Djd7J7kE9daRcfY5D/FO
	PZdohg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat8jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 15:38:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so2405988137.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019534; x=1781624334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=;
        b=XBOCJQA8VEaoWEWzBnQ4s7SVlm7E2lsZpvYOc/xBcr9yhmNHaZ9D6x0Mqk9xAX687b
         Kei3Pn66r2p+efLZ1OnliAEMxMXOtVPRgxrv1LKxVmO7ZfOdn+54wlY3VPAIcCL/9Ebq
         dULX850UtY3jh9QnPyWcDXZ57Z1RGbrh9J+25+BFwCzFb+M87qvEZwXpW+zPUbZUa04E
         r6dYuwRyEPVsBCTI4Y5WTlcA/5Dd8F9NwMqM/tz6zKyU2i750KAPK4QhoqPHiBqyaFSo
         LkzIgeaA5778mjhidyQ58IVEKz0yTI8L09j7Kq66AyMNdN2CS3jrsUh97919N4k/8Yt0
         o9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019534; x=1781624334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L19mVCbdvcbYdMvBOqT9V47Ow4tHEY/Md1PxHPEGro0=;
        b=UUUkE5ig1/piyb9pFxUgtbEHg90hzdvN4a/s4doLblACy7Jbx3GYG0y6VMsKAs7w+Q
         dgxdpLU/m+pZi71J8hXOgZhxD16YwPAu5ZLpRepXlwwzePakJEM7h4ddqJcqVcL2FWKs
         lrp5pMDN2uxoHv0JoDoxLQHlpeCGsaGFjYF+18KkzrWa3dKeRiYlt3MgdN76ihjPZRza
         iQHzll8KVz43NyQH9WzvQOogv78tSfm2ajzFNcHUaFcELOLC3gnt+adk96g8V8W5aV6w
         edv18Bftc9MJNHpspGgH7FuAqWvzQmzWfhIEw3OSnlkGp+44KHQ529vp7gRL8NbE1kwI
         v0zg==
X-Gm-Message-State: AOJu0YzcPOBa9yoKh+NUcz2xkpgiVXGyU/+JoyWnPPXYHNuM5xpANeak
	dUiVdiqz13UVJTSfotPPzvRU1diyuZJB4r1RN2sVbfD03F22xOcXCfFtO3sVJ6qpJ1mSpupVSMI
	Mqf7oqNlEzwbNGqXs5WonuWbbTOZFnuZGnnBPCeW0aBs3ecgiY2yjDTjxaR3Y3mS+
X-Gm-Gg: Acq92OEyPh1egUrMzaG6bPcF+92bC3JLaN+wDUHrEgVSrBfxOo4VU6AbN96YRvjTpa4
	Y+NEslM3DDvYTLj37yVZQAXp5yrYynJnn7FeuV8RJr+YwOSLbHXxvqtO14fsBUsFm5QuKsdHDZm
	gqQGTaOUP+5JjxEOZXG+ECcdvigleQnyniS85lPIhyFLsFm2h3YbfHDj3ZwBA9b6iOgkbyXBVNY
	C6P9tDOH7qUc2StwUBFQtcfnQ76s8OHigD5/xfpzmoJMx21EDsLZgD8d+NBtCllv+QQtmuH0+uE
	BTQWgyzzDPxrC/MJdtgOYFUV+gRFObWCznZK8CHYXfLUuRZt/t4XM3AnFFfotbYme/UPUEBdQFZ
	wo1gG/10hjiAX0nSSSnAYj34sokZFarMtBew5u7dHqwtN1ugIzQ+mGGEnWfuU7w==
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr12061855137.28.1781019533765;
        Tue, 09 Jun 2026 08:38:53 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-6ff07fd12f7mr12061808137.28.1781019533379;
        Tue, 09 Jun 2026 08:38:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm64850259f8f.1.2026.06.09.08.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:38:52 -0700 (PDT)
Message-ID: <419c7510-3410-4a2e-b3b7-181e796aadfe@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on
 ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E7_HSaKLBRiq0YkYs9Y-q2kU4n-EY4cZ
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a28338e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bXYH841EKscq992ZkzwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfXxUlKPB8Sc3vh
 lsrihFsKTF8ERoS6KWIzMqE8Bw3Jyl3Oz192n/uk8xJdwXVLmHnqPMPsBh8lnBHJ3CNh6ab/wgf
 bqtO0oLLZ9VM87agR/d+8siZon3iYK/n0Aokjvug3jPNxOtyu80QLI6y2GZnV0g/BiZvUhvVBLr
 guQLhg5u9bQZOMlLjCxFKXkdWlCQjxWXxQDagxW6c5Dzd4bFw2Dbc71unIr9sFaRSAUzD/yfUSS
 DQEA67dCCbPfnuKl4PXwhbc0aQLZ24PlE/5BSPf0jdrJi3slZOstDWIcli1QBVvtL7abK+waHT9
 JMzXGz1UKdidJ2Cy3I4fYr3Ss9V6SHvDxY0xULU0TkrNge6SeCJtN1d9TKg53o7mske9Ms3lbyp
 vveT733Sl0hT0/pN82X3xyfXRDJiBAwxUlbJV4vMxreHm39zRt9Ej0zabSl9wb84wU8KBeP/1xi
 Kwdlgk2+c7sjvYaPM2A==
X-Proofpoint-GUID: E7_HSaKLBRiq0YkYs9Y-q2kU4n-EY4cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38194-lists,linux-gpio=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 199D2662157

On 09/06/2026 17:08, Geert Uytterhoeven wrote:
> The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> asking the user about this driver when configuring a kernel without
> NVIDIA Tegra SoC support.
> 
> Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index c7507193044f4af3..eea7ec9688b6460b 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
>  
>  config PINCTRL_TEGRA238
>  	tristate "NVIDIA Tegra238 pinctrl driver"

It's the only user-selectable driver now, so this could be unified as well.

Anyway, the change is correct:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof

