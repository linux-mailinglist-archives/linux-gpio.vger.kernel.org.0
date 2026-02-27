Return-Path: <linux-gpio+bounces-32260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA1MDVldoWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:01:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E039E1B4D9E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E69030C168A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29F3B8BCE;
	Fri, 27 Feb 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hElabSwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIgdz+K2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F041332606
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182746; cv=none; b=rXXYIkqSN9bEhGXo8KNdbhIlCoexf2wsBGArzgdShuHZdyejVtTjGejSju6P5/P1j24275jFQjV583ldE2JLBwdBEG4vcHNCt2x3VvcRsx4yvCCX06fkFsB6wPruqsB0w/5RlOS6nm+BtWoiQJM/TVrsnlBMOWNrf2uWEVRIKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182746; c=relaxed/simple;
	bh=G98gmOObxOvVfrliXuWjViqZ5+uLcOj7RWjlLK8/3hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n5vRrEZtTdz56tHBs+ps39pRzQNvfn4lS+hFEp0PjY+8gE8CtMv8/bD6GhBv6m6YwR1aSV09vnKqYN4H8HzK09Ar8251KC3KqBW6B4cPBTpcXrg5pcC7IpvkjpEvKySSAUzA850QCUxpYZ1rE0DW9wXtw37A3pil+2ZwLF4bDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hElabSwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIgdz+K2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K02s1600697
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNEYVbyKzsC5HWqq4M7gwcHeVw7zLvXgbu7OoAH50mY=; b=hElabSwo32mAuUnt
	9T3NRECmKWVU5UGD96rp6gMU9Vzpbti1xmr9GU0VuuBOeP1pyJl6ihR9oNTBFdpO
	/DPeIEQ20ThP8J7c4HiQ4YryylpeKaVXyoLcrFrj6dcvJXUJ+p7RC8Sl87rI71fY
	bKC7roxGWU7IyJnrRpBL77rL5/U7dGrlZ7HzgMbiTDM80sU9wGsEDcXrrIIHAcYl
	/760N4vM0Yc/eBxtxOCl+ixF56CGq2QV7HlvIDlcwQLBQC4hlqTyYs2hgvGmR6C5
	ZBE4emn9WN1nW/qRIzwlwof2/pANpiEBXVs0wlLqVle6B/ISOcsCfxfmxGiR/nRw
	ZaTCMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99twax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506ab115571so130739251cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772182743; x=1772787543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNEYVbyKzsC5HWqq4M7gwcHeVw7zLvXgbu7OoAH50mY=;
        b=WIgdz+K2bhTMNSKICWMLPBZ6M3onjetR3TjVk4DhzDq9m2D3CwTSbLe8kxvBbbUvaw
         dhhPM+OzWAsMQ2DdwDAEDX/4sAIheK/3FrB9BdMWQDD+IqlJpishx1fabFm8kWa8ggvM
         QvFH7raBj5MUgtFbiElRY6Bl9HWxCxAaXXxmC0YqaMAjOPTYe2uO4Gn04cuaU12KgrpC
         hgVxi1EU8Qbgzl23dP9Fv8Vs3sAR5Hu0+oqSQN/MQuNqe8vpxvdOaPHWpyE1tZ7Sz3Qm
         Ju6J46kA/UdlbODyDyiHLqKKNB0jhcj2FeZqMcDYBtgyfkPK0l+H4gQr9M6SSLFyve+V
         vyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182743; x=1772787543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNEYVbyKzsC5HWqq4M7gwcHeVw7zLvXgbu7OoAH50mY=;
        b=OckFzk/1yh88yuNRcnzHCiyzbjtlDUWRFWPkgbAtR+DDdvKbW1+6+6u71OUNrEOLnl
         EY2BTLVycJBUnw31yA8d6NKLtzMcVD+Zx4eU0flRPD0XB1fFEySUgU1jP4NtHCzp2TXY
         VktwS/ocGHgl6Z6FHlySdr8xDC0kEqAaRPbejhw3h0WFLtdTkixyNSGXKqUujFnE9O0n
         KE7TDrD2TL+62IZK4IidcxayoxqwCGxoXqsoWKw70ZicQzznUIpddIZyx1YlW+ZVnz0X
         9EVlGDfvcB1J+cr/S7A5jFMbojvqW9355GPR3d1xQeuJj6skStD/+x1oglIEM5XCKtB2
         rGcw==
X-Gm-Message-State: AOJu0YywrkI25464g+KHKdfo3YJ6oiE14qIaiEhdc/bGddxMJUOTW35r
	6oHaCMUJXiHqoHwOarrLC10SoOXPAkr0DAWjC0WXyQ/40moxIJIXOLX8MOehbvDC2ziCWsCgzFF
	0niEw7I/g+K8mGqbWmaMWIrLyqzPBdRyyp1gh2yUlVpMBVr/YDue81UbSbe9yNLKwlHkm7Yh6
X-Gm-Gg: ATEYQzzOimEa3Tsbw6aGsucKeoK6w9EK/3GC8RY19/fpQ3AM3MmY9CUYeY20QrroyXq
	39Hnya320+yqGW5zDh9ku2cZZrRECgVApGCmK2H5KuntwvhSue4BTF8T7vzx9fRb1l46OzWbHDI
	58OlXVtoXZX5x7aEGxe6iUsE2MFZbg2pLhzyttV09UUoSz2bmX/GqTa3Aet2duWOGgMtpxXsM8E
	AO1SQRn27vHzRBMm9KNtEotmd1/U0Up1hT85MtjIrnDi1S0Tu/WGt044uVikncny7PnHxmzufjw
	O7Dto2BsViIPESI1WcM+ZfuucYjH0R5oprNOG5BxY1ov94S9lRzDyRSkjJBe48/xAZCiCyNmBBR
	wx+aeOFjv0B4VsQilAhADsEL3xiqCnTBwBcVNCXFZ2n9DpSQiR64=
X-Received: by 2002:a05:620a:7012:b0:8ca:90de:43f7 with SMTP id af79cd13be357-8cbc8e1a4fdmr252071485a.74.1772182742707;
        Fri, 27 Feb 2026 00:59:02 -0800 (PST)
X-Received: by 2002:a05:620a:7012:b0:8ca:90de:43f7 with SMTP id af79cd13be357-8cbc8e1a4fdmr252069985a.74.1772182742258;
        Fri, 27 Feb 2026 00:59:02 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm224129855e9.5.2026.02.27.00.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:59:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: introduce a header for symbols shared by suppliers and consumers
Date: Fri, 27 Feb 2026 09:58:56 +0100
Message-ID: <177218264417.8055.3015742451270629147.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a15cd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rb7HAe4w-9HltEwxO8gA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: OmuyKiEbADgMjllwnnm3IzG_6UU0om3X
X-Proofpoint-ORIG-GUID: OmuyKiEbADgMjllwnnm3IzG_6UU0om3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3NyBTYWx0ZWRfXxzcs9YKfPgpm
 OD6gVZsMJTV6ucAkGPtT91iQKbtjsozbjLO+ljw12e+3Eoq/gzGjfCC0J+EOd3d3a6Sof2D2QOV
 ofcBSayAM8IFd17mltItGauPmaE0l49TgYGcOkAPXX0pAqWDkSJnrAtDJEUGO3tZ8D4kSFIlHui
 Csd7A7TiMmnUmdJ5pcPmonelSnMroTS6qoFaINuzPwsvGekYSzQB4OPiwbXW3EiuJTVykdFGlix
 s8dbd0OzYA8e+s9/+iJPSYRkcN2fghhKNx7pl6iAhZemeN8/KAautEJg706it45Hvv/nIt1iydA
 p4XhNrvbVM8AZDhUMoagRrGrpictozLRpJ89VTJwmGJoRuZihxoNPUrI8gmctrnMayxjfocTC4x
 rAx7n7KrL/38GOjKLPbfqbjeY5/tKGpxe81Gnc/pNLCDwYTZwlxO11foqVnO4OB+5zyy4auTAL5
 qi0s00JwM1y/aR2+tmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32260-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E039E1B4D9E
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 18:20:06 +0100, Bartosz Golaszewski wrote:
> GPIO_LINE_DIRECTION_IN/OUT definitions are used both in supplier (GPIO
> controller drivers) as well as consumer code. In order to not force the
> consumers to include gpio/driver.h or - even worse - to redefine these
> values, create a new header file - gpio/defs.h - and move them over
> there. Include this header from both gpio/consumer.h and gpio/driver.h.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: introduce a header for symbols shared by suppliers and consumers
      https://git.kernel.org/brgl/c/fa4a3a95139e7293c1333a33bd7b19e7261e3bd0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

