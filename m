Return-Path: <linux-gpio+bounces-39019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1o9NADUwPmqbBAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:54:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD36CB1ED
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:54:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Juk1RPdR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cMAOAImM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39019-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39019-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E2A302DA18
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ED13E00A3;
	Fri, 26 Jun 2026 07:54:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F51E3DDE
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:54:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460458; cv=none; b=Gmfpk4rngoRTV1poOaBma3FfN7lWFg4cYTaeWg1j42MWce1fNP7QeNNNZXk+A2CMUOsIu+eGbKxjCYPTxsjql5F6qfrrqtqgJj7s5v7jtnhm20skhBe2+gDSMv2+oK8/XzvfLUd2rIaPU3O5ssRdvAM8WyLNTrYDSnfUJeXPWT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460458; c=relaxed/simple;
	bh=KWiWonqDn6NuQuc662bPYf6Zfi2Zh/+Ak6cxsK8oyOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ligFAVtENixQGxLyZIn5V6OHXmdMuWYDriM5wsPOO4zVFSF6eNBb2vz0zznfETjO00r1AU8Wz7nEJnFxLGTaMRjbAnqbODZXdPfIEx49K8qSGP6VPVun4ifSfzxfHKmvGhKLYUEKwTuAqrflu0CPKvnv4fMFJj7YCU+KU21wGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Juk1RPdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMAOAImM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VL2q4193000
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=; b=Juk1RPdRP9NfTSa3
	LHDLo09QanJHICW7nNNgBP4gYqhmvvebZQglUavidgHH33KLQxcRnQPg/sy2g8in
	GMy6Lbb6c5wPwDwR13jm+OktHX83hCMZ0/n5emJZZjsTAQzd5M/7TGftSQ8bv7Lj
	UYsw1uO6rnwrMXHgWOETiHhZJoe6FAL6SkscQOrjTixsniDfIVBy/YzpQP42b8oV
	mWv7pg9ASmi7CJ62sXYguicukrCiq+CxLlmBAKISK7GDxmw3lIOCrsk/CdBjZmzh
	W0Wxgp5OfPDvJajxCjd58JBSWXWag2sfDl7kZji3hB806L36fvvfTnChdtaEa1r9
	6IDN8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdse7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92158791d14so97665985a.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460455; x=1783065255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=;
        b=cMAOAImMvDzPhhN511XaZKrzfv1PmXi11NxsKkH0XtKzEkZCQxnTfLPcDnbyflBQ/m
         eG4ugA04iDVwC4nP63r9IIEWuaqItanDCRbitoNtytF0I153WovjEaKnoLxk0p1n3KMS
         x/9+m5UZMkbTS0wH7L525ecEhlexwhaNJ6zw0zhVU1M2cyj3UqciMcYTPL4h3X9UZTT8
         qNVg7qe6agBP/RZMTBHi5XDh9yTkhgvxAu2mSkJKCU1pO1h/UJzkQhSTzv/Ob8rU4qtV
         6XOZxh+QNLw6Lc6otpWI84NPnszetpwBEglNMCmrsFklvCxk+O5pih3ZBeh6h4uAqrQa
         FtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460455; x=1783065255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdCrsB5kraxwFS22WcsgSAW3K81gUc/ZtatyV38hTOA=;
        b=S4byLXHtVkHKF0fkDukqQ3GiQJD5XPZXJeTDzkl202EjnYX+Zg51CIcYYM4aqFf360
         HDhs1Nbq+Fiz9lfmN22xtbxzS5r9he5QNmejV400Q2GljCuhrvwD29iz6S6otd4HcAnm
         aa4+YPs3/j/XiOdbyHfF6jpO3hWMc006BRSOD+LSIlDlxw9H5mNCV3kKzRga2flGkoIj
         SW8df5b2+Fkffzff+80508GqlOVN6VGVtw54pmfNVH1QqS6itkaJLwprTbT9SiguNdPc
         FWrCCghZNPGc+czi6fZOVFhqXzE5T+iGRflBHzt515xuHcyGFI2aPKqzWn+oGlcFKW2z
         AoFg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ader9QbLbn8PyTz6FE6bJRl3Nb6jQ3FtRrn1HtQqP3Qc+XPUxATznTVct04ww/4WauJztkamt++95@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68tkcQkwWWBujHLkc1X8L4pmUmsOaIkV8hlu7cFbnovMQm0e1
	wgwuP6aUHRcFsntkCiUq/LO6rsPcqssj8MHcwT+f+ebvSbn64rKZsijv5YP63j8SgZzw6XJ6z7g
	hSWT42HfjeRwXYXqXhRus9igeUPS0a41JZHgow0rAzg+drtH79hBy+/yvN1HWleha
X-Gm-Gg: AfdE7cl5q4JoTt5ilj19g/zGXryljlH5b4fs36el+/65W4UR+4BuMM5FlWhiYDx0Hz6
	qNI2lYMT28T88F5tRvHVoD0au8GUw1VRbrQ1NkS1GVy6s7pT48Yx7SdSTuhh13CKw2SeJeXzTck
	6i7GsCU+4tr718RKUIeHP7wxEDSUwqufxj0HP8OT2UdVBvW3g5iVtbjKn5PchypNiMlAwlqNFiE
	qUrDcontgwuCNvDlxgqCaQUo1/cYjm+sxh763ikuouBj7tYMtecPApjyB2745i/KQ23vMbsKjDX
	pPNHYrvWasJ/3S2IaQ8vKPD/5+GSOFm6G8lOEeemgNjGEDbeYMZiRSZEERgsuEq1csDGp0QVDZS
	j1M/o/DfhgwaXpmbQDJZQahLvXHb76ReCeG3TZ2I=
X-Received: by 2002:a05:620a:1b8b:b0:922:9cd7:897f with SMTP id af79cd13be357-9293b477292mr892439385a.4.1782460455060;
        Fri, 26 Jun 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8b:b0:922:9cd7:897f with SMTP id af79cd13be357-9293b477292mr892437585a.4.1782460454595;
        Fri, 26 Jun 2026 00:54:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690100c7sm62053745e9.12.2026.06.26.00.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:54:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marco Scardovi <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heiko Stuebner <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: rockchip: Fix generic IRQ chip leak and modernize resource mapping
Date: Fri, 26 Jun 2026 09:54:11 +0200
Message-ID: <178246044597.6231.3111036547946708998.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e3028 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bUU0xQWC7lQednYWYacA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX8Tlj47z2eUE9
 xlYPE/J3nmxGRldIRw0A0iSFQ9Rd3ZMNsgLRzTTpwfdfSTUZyJLnmt67uqQOweuDMfyITqX8nRy
 ID/be9MEoUv4CjXB5h09ywd5rdXoAsD02E9zYG03r5mfFACar5sXXrsz1fKC9Ix5a9+cWm93QWB
 cPY+N7WT5bPyW4PhNQJv/D/F1IESHk+mjhvyJjQr4dch4dvTTI6/XfSS/JOLxl6qJDrs6Lfz1iO
 ne1AfXYzkivzaD19Q5fI8IaDG8DXzzhpQXSV4yVc3tTTZ+PP0MRHevqG9giWu/ESSfpNTgYQkrC
 XAf7HrbNoFa/x3PPPM9GPPlxFLsEv4M5KhShUTYakrmUXr60cHaJvR6J8ujx+Pex6OSXW/w2W98
 e/jZIBfhMfyCU8GAN8Zuf/Bml1VlUDvBfDWHwVqSiRkoGzTBKAIYHZKTUITLdpItCrlv/P9INHb
 +W/n1hzmCDJviS4Jr6Q==
X-Proofpoint-ORIG-GUID: R7cVp2KvtVNDjGlfTZ1STE9YYMlBJpwe
X-Proofpoint-GUID: R7cVp2KvtVNDjGlfTZ1STE9YYMlBJpwe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX9/YvPz7T7TI8
 ZyCf0beIgC1PI8WLvYYs8ixVNm9FwBPflHy9K2rjmT6hXoewcJ/kbr0adBgPGSO826r4Kunfg3P
 Bqy7pLWR6Phi6W9gVvlf8v4rfgfmS28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39019-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:scardracs@disroot.org,m:bartosz.golaszewski@oss.qualcomm.com,m:heiko@sntech.de,m:jay.xu@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66CD36CB1ED


On Mon, 08 Jun 2026 01:05:01 +0200, Marco Scardovi wrote:
> This series fixes a generic IRQ chip leak in the gpio-rockchip driver
> and performs two small cleanups to use standard platform device helper APIs.
> 
> Patch 1 fixes a leak caused by generic IRQ chips not being removed before
> IRQ domain teardown.
> 
> Patch 2 converts register mapping to use devm_platform_ioremap_resource().
> 
> [...]

Applied, thanks!

[2/3] gpio: rockchip: use devm_platform_ioremap_resource() to map registers
      https://git.kernel.org/brgl/c/c03c6a086d188dc5b52e7db2b2991ecead9bb669
[3/3] gpio: rockchip: use platform_get_irq() to retrieve interrupt
      https://git.kernel.org/brgl/c/c2e26f2408226de7464ba4cdcd86827e0a000db9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

