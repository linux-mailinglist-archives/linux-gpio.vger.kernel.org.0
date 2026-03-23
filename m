Return-Path: <linux-gpio+bounces-34005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEMiHmEOwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:56:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4692EF7CF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72588300DF43
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1351D388385;
	Mon, 23 Mar 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORjHQ8aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXefMuhX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DE3876B8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259788; cv=none; b=LpUM2tDsLwYb52QW/VtV7SZarC69rl7J4GgketU6mniClIHOXSeRQfVcRmMalkOOXHdXlldkGQlAYeKJBS7OVx8BC0bxKq0/vzvzWWNyrasx/Q94kkNZ5xjOiEES/2hqfa7gUFLZepW8ZOKeM/a3YXnmTlUgOl/79d1zKwxxA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259788; c=relaxed/simple;
	bh=jZd1elVC2jwr1sG4IjCESKA4jXTEcio3gFjTMjPuVxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uz+kU+MxcFpssBmL+GGoist56l25lCyEGQoQ5aEc7ujwbK4ccsU/Qycaq6hpCGTZk/WaqzDUbwxlEgAsWTOOXRQMuzlK5PFa6Q90iAE6fJ9MW8z1jc5oH4xIiIZfglb3uJK40Y9KB5MCbM5yNZCHJM34P7YU29U00HEBx2/53AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORjHQ8aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXefMuhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73JIs3452104
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=; b=ORjHQ8ajLR4jVPrU
	Y0LhdWi+fwYbnrjYkp7tuXLLS2KivJXuP+mWaL2nkDxoey4qNMYq8Ztfelda+O7n
	p7vN6SvWxJFsvIRenSHwByvvIXiy2w2guy5CsNEsvyX74fFcF9p4xAc6CPabcgPR
	5SpT3U6THEc6qhvARViwnsh0k3weT9MfavtjRJanepFLio4CJ3UiFXPAuT73/vM6
	8Z57pEumqXGlQXZH5kaT31TZzy3ZPCSChMskYhNxKmiIYfjrQJ7ebRf5ErZOfS3I
	Q9eSU7+bRiQ/eIHf0R3foDiTAdlUdRmr+LCDplWyHgn41fi4CKahmPwfqUZumpsu
	TC7PYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jrs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so7140791cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259786; x=1774864586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=SXefMuhXqUIulKgDKgvVRrsmh6mgTNE2H8LSXaAWlqd8R6ZXxIGgun7T02cEHnMBMh
         OLoNSc+bRQz7otV7FhJmoV4JdYdbgpapO3Z1tJ78CSVVeuwPNlHZtmE8qQp1FYpWBHf5
         bgsQ/znXawJqrY8UBgJJmTXAPI0v+zNgSbtu0TL8t7HcFLEBcxauDHnnOQ1kqzOonp6x
         C29SFVDWrdQpmTqXeihGMKnAtoXQkyCTACGz97XGTRkxHfvgm5h0tSI2rv/otMQ+f43P
         KcSvTrKQcpoD/ll47qfDWsSoGoOXUJiCuu1p6Zl6Llv1L4rkMrU4MQPFL/gxJuUPyk33
         rn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259786; x=1774864586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=RIal1VA4yIZj1sSxImSUuLw4UDScnPHHwjL+CLUclVoCE3uV7BhaCg/xinkN/77A1G
         yLM1VQ4+CBN8TlycosePK6S/pztf2ezBqhc0kaP94rhmueb7j2Pu3cmi02z/OWRnv+Cc
         3+iRTM0g/xrOHuN3KkXUqQfFm1Wmqre4gQrl/E38Pil12PhL/45/Iyx4DH8pIQFr5eLt
         oIJ4kYW0oPNWi+v6XbcD0gmxKKDZlWg0tnWr2GBglpy7Fr4IA8WFS+aSCi/hhIx0FIhs
         TsIwVea68mSq2UhvsuVzWr3h04PONdiLMN6nHECrpgt6XGoHSLzPzDnxN7wZXQ4dSn0E
         /QnQ==
X-Gm-Message-State: AOJu0Yz/FrnXTeFa/kR7AbSfJSPVOjIVxo8dasi9yoj5eKyx/L85kxgl
	pfj8FCM2AUX28N9MsIW/2CBJrJGqHIY/VaBiDETkBYKuwNkyDb9DtFgpH4gP5/XbjIpFyO4sqtm
	nRzN+Sp8o/tIdJZtmwX8giXqrg+lauW0BHNWNL3/Rg9dqB1NcZOaAWANcSCBwFXmavJWiPlcA
X-Gm-Gg: ATEYQzz6onn1OjxMjbrFhTTMgARKcevDvh6SmkCh+k8lc/97mFRv0UsUpIMcXDlCaIU
	f9YOYcF093B7TUi3gm6YMA8q7CLbw4nVLa6J5nwJSFrJ5QEdkvnYGZHQn4KxJ69Xh0bbWQOYr+A
	Zw/2xxiT5n5fyDpVNkuVyNadb8PFYmnZCdSS9p1eJXO8i3eeDqirCSNf0HXO/Re6414fCe2lJ7b
	cOHENH6HM8G87eKQ/VdoRnA5O5DfzbO6dc9YLDPystEdu+LvxJgDE3l5Ij01Z89tGuZDVKLaqku
	VX99TyqrEreHoyX7cAnNA6HFYcGQUNlU1f9tgtGx794Z2sJhgfELYI8ANScZeWU6GjBj+8QdxHi
	8E2FeoNJV55vw7wx5HwiX9mgZrxWpT3spmTejtVr2uVXha9y1ODY=
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184411cf.32.1774259786208;
        Mon, 23 Mar 2026 02:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184201cf.32.1774259785772;
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3688967a12.13.2026.03.23.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Mon, 23 Mar 2026 10:56:20 +0100
Message-ID: <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX1lvOLMtyVf9H
 ISAB9HYYRfz4GYDjnadYgHV2BwTVBLiDqOpMXhN7VN8e9tbI984+rYTahoN03TZXlURp642DSpE
 Bl/SJCdRI1c3Out2FEJZDmUM5cTl3GlrWY7eZXdi5NMEFhVjCMv5wOqiqQtBKGiKAzPyPGxUkhX
 r9GNs9IHu1uABPh/gp2GmKTFPCYDHvYd37iNciZrxBHzDUcmiLNBh6eAq8k7b7GJlSOPTHBLpMo
 NN62h5p2dp+/ADv5bNUh30FTQ0xIHmQEEzEKvVRp/tD5Cw55bslTWoIffJWQAJPmS3zUQcHOTMU
 E61cL8Lr5iS4Kt4nx2m88Zg3gdTugnS2XKRKx5h0u7lCrPxXaB2HDlh5Nq326nPkV7+MSqYmI1n
 2VEOm8xfSGWIvbMhAonZLvbQbNQXudTaT3LukUnzZrFVcfDE4P7jZJVE8xwxj4F8qTKyYo+toR3
 bYx9O2mC5Jjig1ZADtw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c10e4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=cqmKwl5xsonCTfQwjNEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: _Wy5nvhTCJM503mLj4d2Z2wjbUnQOg4F
X-Proofpoint-GUID: _Wy5nvhTCJM503mLj4d2Z2wjbUnQOg4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34005-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B4692EF7CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
      https://git.kernel.org/brgl/c/ececb46fc947705f22cc8c1f9182224e7ec4bb97

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

