Return-Path: <linux-gpio+bounces-39021-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WVxaKHsxPmoPBQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39021-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:59:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658D6CB2F3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:59:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QQ3WcdOp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YHKSW/WN";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39021-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39021-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B8DD306D2BB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B2F3E4C6C;
	Fri, 26 Jun 2026 07:59:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDFD3E3DB8
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460778; cv=none; b=jgReUDyGPP4weX0mH58Wfm4/l8w8cgA2vG5Pes/iwU9I0BN6dOnIGjqQtHa8wr6MTfki09mgG8AwfpEVYQbsI5yv2oabmc/xt1d97D+IFvrf+Xjun559hAJVDWFMpAQ1+f5Moig16e+vCubRaosWZTTU+rmPyL9wYXPTsHwa3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460778; c=relaxed/simple;
	bh=sYODxyt2foDNZT7s5ipSpvmDlkzEZeJUT7Uw64IOTRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Omcd2IHquN+E33qdK0KDrAqkK/8bwIIauc0Vfc9jAtmMSQ787oqZPcdDf/Z60fOZKMrGUbePBYH+7J5etkuOSxditYWf/7hEaPdkoTTAkqw2mMMXKpkR7CSYgJNubTRif0T+HKGt27jMDoG1Yo/wNBOn2OlPw10RIXL/cyEEwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQ3WcdOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHKSW/WN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VNx2047733
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=; b=QQ3WcdOpy8FX1X3C
	ViS9CcO4FgYSgsCf+1zcQjsWxCxf6MSUyV6p9aGq4i5kW0FdTUFCBgpLq5H8pbAb
	v5ZtjlFgBJSgcD5cTzkSR2Cqwf7EPJrTOJt1v1sblWWVDdWlDyA8WEa/C44luVbQ
	VihaGly9is2RSCxRWhwONyTuV1L9z1UX5YWAQDJWroGfertabn5alKfsx4bIcX5g
	r3icvzCKCyPrkyiZe3G1b0Crw0pYaCUBCyygI5MfMUuUuEkjgJsaK8Tv4KxGmA/0
	UQdJzxuCVHE+qRAF5RMcMAA6btGmtwDusc6/7lc3jC3obEkIaWJHmoqKSIillsXS
	Na7hKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukbpt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:59:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so106218785a.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460775; x=1783065575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=YHKSW/WNlMtkn4LUbjgTOhLD+ZGzALz8bqkge5GOrjy2xjdBSXdUesD+rNzgkL+Evv
         sWfrn4ZjK7M7sXAC/Ya5eHWnD7CxgQ7fG5eZmt1B1xH/VwEXTIcZjjXjh3i9icMYy1qK
         rsjxl1Pe7vc7gQm7+q05L21RQvwKOpP3tyUo+jXtBUKi6O6nP/NUp/RoHq3bQPnsvHV3
         txdlm2JRNm4k1eooIiX8GmaJobaCXForBtKiKybV7Ira+p5LmV4wrxy5+FCUf8b/jifa
         7B4Hxv2KskEhnHbMDLDclP+/ObYufFgcKQ1sU3IPlUxaZlFU8dwVEYnLL8K7oEMlchVb
         xUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460775; x=1783065575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=dCh03vyuWI1MAhuyjrRSVPOskLC3JuxMteUVjZErfi0lNka8D7ilVA3c6lKCt+va+b
         kfe1FZ8RKVZtZmwE8Iz7pu817IECDzGN5PDGgoCthzmWWhY2mK7vcpEfjoysAVDQDz0i
         4z/j0VodkKraQm47NMHiecS+98fQPYBnzCi0FEi52qCn70jg4WtusddtR5segstbmzz6
         7CYrXydToMpCLs+UGfpFUee4NvuOTCZlJy4gNoJoP2kSP2VWL24grmVN3/jbLQSR86FT
         VxqrqSpKNObJna6Jr1hnzMeSExNQiz5ZKqDb/drvhaOZSy+T4hC6JQ2m9YkX2WK5uqT4
         T/tw==
X-Forwarded-Encrypted: i=1; AFNElJ/fcOQ6hsg08ze7k2UJ+BHTNmTaSxdGsmqZufDHEnRKfKoAbnZMTIA2axbHJPH0SKMdvb39Futl8F1v@vger.kernel.org
X-Gm-Message-State: AOJu0YyWB7j+JynIv8WMndCTo70yADToth6BxmzjcHblKgXdArjLxzyz
	5jnMx2YaVO+6aFtyCI/TlDrp+EPkB/UAG8og0d7DP39/Lkok5tkbWJquIZMniyBgSxQwXm+cThU
	hkok39AGsOsLQ5S+Ss8gW9c3SZa3T2RMDifSR/DRnDzxH2jCeB13+SvgCANSVtO8o
X-Gm-Gg: AfdE7ckvZxnK5SD37iThDhc0LHtj6A81dyHcZmRM34nyEKMFz8Rih/+jDA03bjYOloL
	e7LTF2RcQJOYMVJyN/Kw1IBM4GGUqiqAIkpFMRqpuULxO5QQ+Ntji/tazKgjPJpmVZpG1fsAiuo
	E+rhPlNgtqo4jhT2qhNQWMw5Aq3nsfHOm2s2d3+7Oox2bEsFOIde64wPEb8E2BGI+CCQRY6mEeQ
	i8TDbQnFSWYZ6zCBruyOSysb/VxLs9J1zzdRCZcL5LTFEmVeJ1Lrgms0AfZD2h5EOsZQnBTjjuh
	6VwUNv8/gmaWey2G/NtI80QywnNgpo+4sB0GZe+JNqWQ6rrKH6jHaQrt3tD+pNg4r8RF+c2F49G
	U6sQqkM+0nW2RkZBQUaF2oFhTCkGy2UXv/gURa8c=
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919784585a.54.1782460775382;
        Fri, 26 Jun 2026 00:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919780985a.54.1782460774858;
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm54432355e9.4.2026.06.26.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, afaerber@suse.com, mwalle@kernel.org,
        andriy.shevchenko@intel.com, tychang@realtek.com,
        Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com,
        stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Fri, 26 Jun 2026 09:59:29 +0200
Message-ID: <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622092335.1166876-1-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e3168 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gmxu7H2YFhVDB807_QQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cV8WociqzdxDhTJAgvXh7L0zVEqpYjfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX3H0XrBh0X6k7
 vZtekVcCa95h+bqUJ51VCbd54QrFrp59ZHE3tMTR/2hwVd2CLBrr+SjvrIR1S1jWOr8gbF+fnRH
 mSbYYFWJDSkcoLDkTTb3qBTGcmannK2ZWPJXwCL/1X5jpCI/gZYMYhoYUUlHxOwPKTHikJMLxOX
 I+YamA0Bnm1VBhkwhANUGn5tp1a7dA2lPgiKKNGDCbWtHPncuIDx45awSDMSC0tS98cCR8gNUJm
 yPaXtD/pqz/jJw22eovvFFKqprIWopmOsr2gcuqMNacT2Qk/WmP3T/76yLdCwrb9zu4MIEZA4UG
 8uqolVIgtUSCOlyKeFYzaCXoDE9uOrPCTr3nExosOcDALspRrGTbBygzyLtTPa2MRdPWKYmOo+j
 NTBGYfirY5fiW6EbrQuCsHp8QiEuH5x1cPBxExghINBp80XM3LiJsETQtFkP3CZ1SmkZ+jv+1KJ
 o+YmLD3iKiccIjCrH0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfXzp64jMJ6G7fX
 Zi5Ujc7e1IQ8p/4oG1M4GvhP/E6KvVbhr9qmrAOJa3/M86aknll/xAKzNXkt29qX3MVZuhfv/JT
 PMHe89sJuCE+MVSFxal8xwMJLECydi0=
X-Proofpoint-ORIG-GUID: cV8WociqzdxDhTJAgvXh7L0zVEqpYjfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39021-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:eleanor.lin@realtek.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2658D6CB2F3


On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
> This series adds GPIO support for the Realtek DHC RTD1625 SoC.
> 
> Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
> the RTD1625 features a per-pin register architecture where each GPIO line
> is managed by its own dedicated 32-bit control register. This distinct
> hardware design requires a new, separate driver.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
      https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
[2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
      https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
[3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
      https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

