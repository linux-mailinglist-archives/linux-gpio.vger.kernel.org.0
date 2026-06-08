Return-Path: <linux-gpio+bounces-38097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ho0fNbHVJmqwlQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:46:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5465778B
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ALhObsds;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VitA6UZt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38097-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38097-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A246131FFE33
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05B42571DD;
	Mon,  8 Jun 2026 14:34:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F031715D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:34:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929248; cv=none; b=g0sGK4g0MoTwMO74IvXEtTZO6gJgAvkga6typvW36V2SwMw/gGXozYIpbQFNkhXg+W4WUV2eDV7tHmYI10H8eA/2RgU2rCPjB9DCN6Na9Jf364XxpfFuLIdwSIG1RM8Nsg2x2pVZ1pm16RiTKV52WB8WkwTbEQpiQCLkOumWjDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929248; c=relaxed/simple;
	bh=HICjEAI3Tm7BNqWXudkFtyGf51WH72GKISnCodWRr6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhyp8ES8c2vxsPLP8QQtYJs94IWMAvlVKGAx8gwEMlJEqOJe2T4ozwXTN8+clylRadHgWWPT7Tlh5+e1oCkHW4I1kcG73izViZyuQc9MyhP8mEIyhrYdsAJfKasxQ3X5ZJ3//5+Ws3WfeVLCaB4z/xm5izXuA67DhWgsewKI5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALhObsds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VitA6UZt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXquN3935788
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 14:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTRqsUqLEE+vouSJRSX/JmzFcO5phBHCScSOE9NZgJw=; b=ALhObsdscfbEPzdK
	mqUNuuZSZdAzPIgXFrqLUL9g6OavW8zwzJbKRiS7ET6jClyLo65bgwY31QP6fH/1
	9w4ojcGw159fNeTcIXL9XJ1SyUS+fpND61bJaaPMlaRck+qZsOttCbkdYxemcctn
	L0DBOf5/lxxfnaGT+qKPfNLClonQZo4J0ZqWV0JJvAdBMoZxdb83x7E8pGi2DAgB
	7v4HjYv+ru/LoXpsImaGQxZ3tRgAJOnufGo3DV6Dhy7S8zA0Xipj1FMtBYTVPPKN
	/aZsx4viwQ1G2pclltyQ3g5/rX6kHhYxh3DvuA/N2svIZyon30ND6tPCxOCUC3Gl
	KT3rnA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee0cqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 14:34:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6ce6f8465a9so5235925137.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929246; x=1781534046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTRqsUqLEE+vouSJRSX/JmzFcO5phBHCScSOE9NZgJw=;
        b=VitA6UZtP5hz80F551bXsTSsFgmyXhnrBH4b1KFnQYcJGhiJIbh0RgSzej1nKGUs5r
         cpnETVTMZW05j9F5Tm0SiCqfgB+b2xgruvzRpApeLXRgSBQZdXj8OP2cF0gPbSZ8HN1B
         GLvgLJSgGMnG1yMqi79uneDzv+FM5xNRqeOWOoaehjVWct5YNsy6v+b+DFu8vIh7kbbe
         rBquluQSvt/GknZ5ypooSqYBG8QTeNfjSWtvJAOrZTs3VnLF2QLSp0menxgnyLnTlTdR
         SUDj22YgPl5JD6sPRU5ty/2AdOQ5c/zkXI20Yk89oAPzZrHGuhQEP5ioKbzF8ox/50hl
         UWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929246; x=1781534046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FTRqsUqLEE+vouSJRSX/JmzFcO5phBHCScSOE9NZgJw=;
        b=QG4A40dS2O5J6Tv5qoWC05vBdHsy24DpkY9WRN+1RAKJgs65wwVq504vDds1an2RDX
         osuCRMx6zL2BRVF2+bCJz3YDSqjY5aPLLHqK9JU9nKpMbp/zG2QDT7M42t3uln4h08UF
         ipGWfwTrld8OcyWxrRPLVXJFA9OEpsJjdWE0Uw/R8lSrTXhr6IdvXsPaBkM0az1W3Iej
         8UugNxbCpUJNTsVmfo3bBkvpFMIjtB8tbHcmrIpzyJXO5RFOcvgV+Qorc8djML/1FFWx
         zlEq2EhVs8fV9qf/2Kep/j93aOpFDI5muTw7EhQXEV744IFr2zDKjNXn0cT+STGEpUTK
         fwEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Msl98qDyEhdz0O7hxhJ4boFAWXdPSP5QtvzhyIMEkBxnd5Jo5aBszqCIjcO9ALlODRhREIZQ5JZNb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsd6AqHke2IKYjNsbobRDbgACO9kYubYo7PWAFikUpKeWVuZB7
	9z+WJXTajGRjSexiYAtRvoYmaNcETC8eIVZhlg99BquFvp3zZmC07ZJ+MG1NwLD1OByMROIXfvw
	vb3U6QfQ4MMUblIY5DiPbFWEMxim09IMAgxN+KPBOiM+Hxu7wGv7YNNO8ksvRTR3O
X-Gm-Gg: Acq92OFYgAgf/tp4OK1nKWwyPc55kghOFeswO/S++hgKqeXIf4JmoUelAWjxLYM65mj
	71uNYg5ykJvfRg3Xts4iR1l+RVDy3an6Tg4maLt6z8IF0AgmL/kMTPaQNVhhsF9Vy6sr6og45ou
	h9SMG+9j531r30rHvMlOMzDarPYZxYiPrd39dHucxYlteWtK7VnBSDhkMh40ZTv3Dt4uelyGH1C
	RUJw/HOa/Et3ZEwTwhsmFx8RkVDPJiKfld31PIQN3o3RU8k85H6oyWbZfU/tKtJPJfcjNHBnN/1
	flBJwcQ33sp7JIASvkEol+Ax+aK5eqJMZFfpYaYunaZlvJX/y5kotPJGXpS0EtYzGsMifLUMjcH
	PHXLr53hrVPhCH3KC21Og6BYKYYNSYtaItmw0exzMlkWBt+0R3H2jnOsUWlM=
X-Received: by 2002:a05:6102:6b0a:b0:631:3bbb:f25f with SMTP id ada2fe7eead31-6ff084a696bmr7968961137.15.1780929245718;
        Mon, 08 Jun 2026 07:34:05 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:631:3bbb:f25f with SMTP id ada2fe7eead31-6ff084a696bmr7968900137.15.1780929245306;
        Mon, 08 Jun 2026 07:34:05 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f345209sm54329559f8f.17.2026.06.08.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:34:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, baruch@tkos.co.il,
        Yun Zhou <yun.zhou@windriver.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mvebu: fix NULL pointer dereference in suspend/resume
Date: Mon,  8 Jun 2026 16:34:02 +0200
Message-ID: <178092923957.166394.3852613439518971880.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608084334.2960803-1-yun.zhou@windriver.com>
References: <20260608084334.2960803-1-yun.zhou@windriver.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzOCBTYWx0ZWRfX9pf6d+i1HHrl
 QHhKyCF1+07HYc0Lr3M6oa6zOVPf9oTZEoB8o6+I1NH/DtkLH98QMoBIlwyKJBXpyvBgWHTn7CC
 MoyAJK4YrzA5I57F+O0bgnApQOEZtWi+Md2w7BxYzBinwcrWwaVkUmi7Awy0BtIP+bGSxy3kcsq
 PUXRnFOU5BWY3si5WJanlooFy7J3tKlvA3/omMCR+DdW2gQMXiktSHZQohR9AY6qFZXetSeXhlP
 EE4UzKugq2TmEvmQajc4ZfKq8boCkOYwCIQVXK5N/sbUxdFwx6hfxhx4wXC8gdlXvLCSbknwMOC
 it1X2g1MovhlH0J/EXpdBdwHDhY0rZXoYdcz5/+ut7povJ8l9k+/ngtY5gslZ0vzX8ZwyNh3ooT
 eRL3uOsYoxhnha1FgGLVvWJYYLETZRlUDNp1tV2MgmDgEda58WKOV3dT5HmLRWegrq+3afj2Wys
 yFYEOIjVvTClltM5F1g==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26d2de cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jCUUfEsfLSDAbScJ5OIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: TRQLhnfk-0kJdwivE-ltu9iXsFPW9nmS
X-Proofpoint-ORIG-GUID: TRQLhnfk-0kJdwivE-ltu9iXsFPW9nmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080138
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
	TAGGED_FROM(0.00)[bounces-38097-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:baruch@tkos.co.il,m:yun.zhou@windriver.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48B5465778B


On Mon, 08 Jun 2026 16:43:34 +0800, Yun Zhou wrote:
> mvebu_pwm_suspend() and mvebu_pwm_resume() are called for all GPIO
> banks during suspend/resume, but not all banks have PWM functionality.
> GPIO banks without PWM have mvchip->mvpwm set to NULL.
> 
> Calling mvebu_pwm_suspend() with mvpwm == NULL causes a NULL pointer
> dereference when it tries to access mvpwm->blink_select.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: fix NULL pointer dereference in suspend/resume
      https://git.kernel.org/brgl/c/8c784f357364a5424ce1e45d193b0900bbc88fd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

