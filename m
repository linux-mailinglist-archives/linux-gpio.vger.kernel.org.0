Return-Path: <linux-gpio+bounces-39028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuC8CWBNPmoHDAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:58:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA036CBE12
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:58:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jeJdYHYx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cYtf70ID;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39028-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39028-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B07C3009B12
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0543EB0ED;
	Fri, 26 Jun 2026 09:58:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7DE3EA953
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467932; cv=none; b=PKEraY37XN/W8VRYcSehe1JRauhmurG1WefyTGcrGD7iDnc+kkpjT2mngHsEeoBOg//rGxcBjzl6urNS7miI+0jZTB0hbWp24/rBJ7fFMwpuu9p5AdJydkixeUTjXckbnEauGTKrw91IImJtc0bUHhvIJIbwkMJXbSqdpq8t/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467932; c=relaxed/simple;
	bh=yvdRv1MsOqIwlE+RqK4klHYuUqXfJMnO7D5cOcm7Pts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYJ4Cc28OlQzBfQjtww+GGWyqTpeQUh/6feTGTkrdFWxGQZ9OA/vHUkiHfoRDd9bfdmDn6H0k90p9llSlfdRoAHTmt2WNwZ3I4uBaSYoJskIBjNAv2ISBBgBITuWSPscBbbzwI556Np1cEZtQbYE5LUBzHzkZqfkDxdrY6rZmtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeJdYHYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYtf70ID; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VNnR047748
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H6Pzd2bidowDwp/e2yGrSZQr0drmjf+ujBtRGtoLEvQ=; b=jeJdYHYxpUXtWqdN
	Rtw3/LhjMiegkbKx+eTn9f0sd3S9tY2IDUgN/ENLSJdJ0P6tzoRruPqgLwWMBgYT
	lVGr2JHIqvx9LvrZsWX2MptMYXv7r2T0xQyHhHm9kE6LvM7zG5hpkR5/PHH44vvy
	y+RcFX+25EPVVC7araoPsr7zjrysg5MePJNc9VigjxtQg6cl73CTOoLwgypruZuv
	rlpjWE2AtbP+i5DVfzkmBjJ3M3RjRvIa3b7EJTs5cMHNhwUxvxVgqv+pxiIcpoae
	Tyyu2S/PVYaxlRzymRyLBbQoZE1EzTNmIk1ZICDStIb/Kl9Gb1ezBMxZ8/ZmsoOX
	pfsF6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukc4tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ad11e2197so50963985a.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782467929; x=1783072729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6Pzd2bidowDwp/e2yGrSZQr0drmjf+ujBtRGtoLEvQ=;
        b=cYtf70IDGHS3zflsZ1blfwk1hFfhjU/NlvmEioz3tn4P8jtBLhHYk3IH7py4/Dzt0J
         kXFPjASX7ytdkYnJuLvheg1FUGp3PmUNzIU1ntRiCQ2C/ktgtz7MFu5YIMC39WtWQAQj
         frQUI+LDS337QNPIgHJCdcY/M72RgFvfL7xHM6SZVLAQWo0W8nlo7INPwHaqi3kLe9gg
         yB8CVGqtZ3r7GW7ZOaY9y4EetvhSHz5JORB3z8ApWCVSRBH7E7xPs2rQC1iW/VavbtTV
         9oyo0P+6xcWrkbyKVqLG5RFJAkq5402UUjXZampIlqgZ74Mr4o+xFFIZ/tW8ZrvuhN6K
         4tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782467929; x=1783072729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6Pzd2bidowDwp/e2yGrSZQr0drmjf+ujBtRGtoLEvQ=;
        b=apgJ1rJxbUWDOQtYyIR94Vb/tWo/Hs3w8ElOxYVtQoXyGagjgNPI4iNbsupzCzTfVS
         eoHqTExoe7R8yYtl1awiWhjtdn63quqDkY55XK9yEhB/pzAtQXLI1idesLAFpnO0/kLX
         SvfgQCa/mjTLo6RXSK3LfgIyCRmgUxtFX7eEY3AmNeI2PNvhGskdjxR0Ut6+e5B6f/II
         v2oJG1fFoN7Ykx+GRnzh864TUtlSOCF2VHSk8mnrOlmfA6kdLRaFYq+88eUHwT2FnCxR
         P1l5LamsD0VWBwkZWyF3PY3/bF0/QplRNrDE5OIFlGg9t9upOnCV8fa4lLIwzYE/Gb4T
         MQUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oAr+PmG6YqJvHo+QPKPmCrlZ3StcQbizvZU9NBMJy3WnXpipXTvkYfV6/mWB/c6uomaC5j6TfOQV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50BWiHgRpkSiPL7eJlzkjb7S/R6TUu6Q7qkGa6lh51C1izCXP
	d2f5w9NpcqapvZpJsaA3spIVFpU98sy/Te5s+M6lTBBFQ9opGKIIu7XUx2zHRws8rFCBzRUveFK
	T+DaD9zZUlZklJJPsftNII9uk8/niQ+dvhI1xWgj9y/L/C/XDPQiRWqrMwdcz19xb
X-Gm-Gg: AfdE7clD0lasMsbrozsvpkhFT4tOcnrwGCJHfePDME15XAkHVRInzXguBCgWDxTtltd
	TOQp33Sckq2lKvQzHz8huahnGmdSSrq7YLMOzNHWXxGpHFRy31LhHGcDRBWljE17Knpry/QOvid
	dSlfoL2sx4EAOuN9/xvF1TZ9mxjsD8UaIHQU30YGmIajzKHGJU1XdV9ElAYecWCDT1bMsxbWZy2
	T7DkZ24MXgQPaWcmt3WJ7udVs2izGubj5feMokCG5/3dYO8+LzOsf48fbaeRARahfkg8jCgQCEe
	vfov05NDCa2vvdmqo30pXFFjYxChRzOPAcU/MUEklM42KKw4spHhvg0T/ws02IGONm7gck4BDSv
	FatYq6+1PhcejhmXBhEFT3LPWBwtE24bbNNO1N+c=
X-Received: by 2002:a05:620a:1b91:b0:914:afc1:c66d with SMTP id af79cd13be357-9293b284447mr902996985a.11.1782467929383;
        Fri, 26 Jun 2026 02:58:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1b91:b0:914:afc1:c66d with SMTP id af79cd13be357-9293b284447mr902995185a.11.1782467929016;
        Fri, 26 Jun 2026 02:58:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9f2esm59110605e9.5.2026.06.26.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:58:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Jason Cooper <jason@lakedaemon.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: mvebu: fail probe if gpiochip registration fails
Date: Fri, 26 Jun 2026 11:58:43 +0200
Message-ID: <178246790738.13732.15506881520951210932.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624131645.86884-1-pengpeng@iscas.ac.cn>
References: <20260624131645.86884-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e4d5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N0JLJXM9r2QbmFFrkLkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: J0eeOOne8uTd24NjWD1C13_MbB2sLcEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3OSBTYWx0ZWRfX9tGBehswCuud
 m7zMUl+peEZ/5SMVeZ7FhRn+SuFAyyQNzqwo1WLV89oKxEpOokKn+p6FYHQY+prZd4ntwOPaAWv
 3wc0HOnuA4Yj9x+ZGZHOMVOUxFk38eIMCd1PkFIlQQN03GlQZ1o0Sqr0PViCWTPeOLvG5zKPIUG
 ewWHNtlJijs6kOSpikGQfomJxpndqVCOoyQ7boPID+Frh5lxbyZyvrM6plZJKUS7pAo1laYA1Yl
 2LMnZPlEPTVgOhZZOWi6ImifCUyTh6qOc0hlI472TBQItftRrur1NxhBEd21jhdhcNnXbDGyJEo
 uj35mIAZ4u+4ie/G+XIw3MvKGATD4BwK5D7k9+yWKIEoCMcYCEUhgRM217Gb10Sx1jgmwDzuBiR
 Rq7PsleSEQcdYrxmRcsp89oZHIXZ7Zn4qDUve5TU9miKjCR/hft7LAwd7BxwFU2SFv/U2BtP64k
 sPvGO5LgSN/SW/ZSgGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3OSBTYWx0ZWRfX08YQ8Lp1wu4X
 cZZw4KCJ1Z84TfT4kHTpTtcNPBtSz6LgOkMbTJwsViVhO3HKMsuTdUDhupKpFVNxjBm04CpNbty
 ys3U1DxErGRzB85h7pBYwDvLjLq6HEo=
X-Proofpoint-ORIG-GUID: J0eeOOne8uTd24NjWD1C13_MbB2sLcEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39028-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:arnd@arndb.de,m:thomas.petazzoni@free-electrons.com,m:jason@lakedaemon.net,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DA036CBE12


On Wed, 24 Jun 2026 21:16:45 +0800, Pengpeng Hou wrote:
> mvebu_gpio_probe() registers the GPIO chip with
> devm_gpiochip_add_data() but ignores the return value. If registration
> fails, probe continues and leaves later code operating on a GPIO chip
> that was never published to gpiolib.
> 
> Return the registration error so the device fails probe cleanly.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: fail probe if gpiochip registration fails
      https://git.kernel.org/brgl/c/479e91fc92416a4d54d2b3150aa1e4550d9cc759

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

