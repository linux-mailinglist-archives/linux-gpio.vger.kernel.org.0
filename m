Return-Path: <linux-gpio+bounces-31213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIzwFObZeWlI0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:41:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A68DF9EF20
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7545C300E5FA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A681F327C0F;
	Wed, 28 Jan 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gH+SyO1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCV6oT4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A21330B3A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593315; cv=none; b=O8CUeLfG3dwfTXZ37wRPUD0aqA5K7pvoRJN9/FG46Df2dazl8+ZghNHZunIxLQ5yxrorKEevtcYvS+Flfel+ayrpGGnIRtMKpcZDVxB4UP0In8wLjTJSOM+SjIgTUGpcUsbRRQVTLT0OTwrZkvVwNyH4MHXMPEz9CQpSIHXTryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593315; c=relaxed/simple;
	bh=OFVKmxOPOSe4dwXY9+Q/mahXqXR9bxpSOVH3z95Rrkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtT1huvLHVpbnQ7pyXpL9JQNOW+pxJjT9GKgLeiBaA3qokCwDdfOSaO3E6OCqwcT/E1yXTUWBYV8Q3Ijqa7hT8eCJBPaKMctTdbGFhDJF8nEsmxYjy0oAJsfpU7XLjsWaHXvpHfWtDvs6qeSqct4XzEwh25wQRp/d901HrrQKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gH+SyO1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCV6oT4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S93KBd3255385
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=; b=gH+SyO1eAPIg1Dys
	TTYgivMQJlYaU5DhyZ3kyCdqalNDxSAgvF7rdN84KxOIekidaPKJPPTZtXBaqNUY
	4TawC+o2SMTZ68uJg28jX6CjFJtrn9PZNk7JfL6VJ8a3k+EYbjum7ibGgkuqVtBz
	vHWkeRE7tNKOOkqdsIYI2QihIEIQoF/msdFfsA4PvwQ7wS4U56QBnapHLvP5YdrR
	B4yCiQO5jOnluox9IQNSpXXw5z1hnrpVWPdbA5XICsPRqDm0zb1jLA0BNDv0fDWP
	0vGmoEywqCUG60E0wECqHYS5NRzMRcu/uxkEfrH1+Hs/+hkt7Z3S4zQ3ygD4qA7P
	HSZTKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk0jyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:41:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so331581085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769593312; x=1770198112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=DCV6oT4Om+D205NziMcBMwz5W/4+IEKSB5by++uE+gKeUp1A3WMjGCfHLlNGtcLMAI
         6dT4bfJzxEGDOh1lsKZwcgkqwocs47K+vefVff515t5PBmMrgSsNJN36dXnfpwz31RVv
         yCo5FQY2QdEbI8kiS15aSmhO6xtqQH4smIkSyUeAR1PvyOaCOiDfMVaDVxGDoFh7Xfzu
         +egVEXeKX4IMJwyqjMGpXcQvepqJ7GQB1sQo3d54jQcMYKuOBTISjJxHOinixkYy2BYh
         KO+/PuCBJ5YyGKSrOdKd5SBuwYdLVaj8HjsznfYPHH0MFbv80SPAUQl8IwzYZdJ3qO9d
         7u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593312; x=1770198112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85LiEtbp+zi+7uf3UPx9/LEQW4aYkFFdpd5AsmHIyDE=;
        b=KElyD3XMVeGJU3oN7bBv1Y4f0DjhvsVRCR5xO4c+fDOzlz8Z6o3WzA/phSUHUC1DT5
         ZyX5nA3G6BgimBHhCzRMdKn0WhLRX7pOgZLw0PZcu6dAgZaJgxiUJ32ZUuMKkXVUwYY1
         SVO7jYSWSsxCW25XcbhZvHkHYMZs4fxLFu7m9w2LWBCBe61iCicZ/xJtrieZu45BuKlX
         z8R4riaTCZj8M6CP08wp0XhFGjXdl+C6NZIyydY1LgFni24dHQ6KJmP6Xd3GNNHZXAwb
         WWXlu8iAY5MIuQ866mp9oNj25tJoi1RDZyaf4hWRL+t6pcPmrI78l87/oraAAXyD0DuK
         48YA==
X-Forwarded-Encrypted: i=1; AJvYcCVqRkKI78xKVQptArIVCWZ8kvPK/kfNRC0VD6onCSdqV//5N1VFWJ/zBdkh/nTlKJ+f8ixByQ0pSm95@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3b06KaDhTplxDOX2ycBv0+BtpUV90buk7QCuxIRN248JVdxi+
	SfBTGU1s98UmCQPlUnZqRurkHmO+WmoeITXBzOT5ZSh80r/vAetttpGSteTzCTl4ihTznc/5frV
	dnewyBLyXPiV+fBw4zelFphQbnVcAvH/EIfxyazj0OkLHeEBG7vyhRTVM2qgkKpw5YRi7cKG5
X-Gm-Gg: AZuq6aLNXq7OPZXH8wABjLJREJ2VgWaNqZB73AHmDZtnC3c3j69JibchSyLDyR1SFIT
	0n4VfzHB3iGHWRIhXYzvD6B5JGDmQQXTrAsx19jVtH/XsTF23oEnzM22nyWkpP6SUGx2rXnP/hP
	SBLp+J8RspF2p4KR5zo0ZlddqY2fa4KaESSabawU5FWvepGP0CjcUdBEzGp8MVVl4LXq63Ez/AB
	081LD1GlfBHmcHiFna70KF3N9Et4ncq8QwMqiV404kB9HTCOiXydNs2O58vNQN4jHLIzVglvpAj
	WvRqGRV4Sk3IDccyFb3kUrhx1Cf9e3bLW3rNFwJOqv5VAQ+5ZwdW7Uvrsc9UmU38E3Jj8xLB5G6
	wIO02EoBDRJuxRKe/IY9jfeokbKEig5Xn88HCAqc=
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555901185a.15.1769593312445;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a734:2c00 with SMTP id af79cd13be357-8c70b82272amr555899785a.15.1769593312025;
        Wed, 28 Jan 2026 01:41:52 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm5410095f8f.21.2026.01.28.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:41:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
Date: Wed, 28 Jan 2026 10:41:49 +0100
Message-ID: <176959330536.12707.18374071693115296433.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
References: <20260127-gpio-spacemit-k1-pdr-v1-1-bb868a517dbc@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NyBTYWx0ZWRfX/p7tBBRq/SbK
 bzzblxEFfrOQ8kg8iHS5+1Mpnbm1wVBSYUzE1hEGiYmROHSqdLoM5qQkrQWPBcBPvCIuMyhS+Ex
 rsh4eN1vo4QYG3iJQudLusEaUUBPYmOcIX+2gGBIj6F+uiDjkpQ7SUrb4tlehjv3PmdR/GhtigI
 MT+XXHwRKcKXQQAp0kxEWiuzhyZdzUiyY5OkhjLgHlgMB28/A3LQee2yrRVq14rNTgq0KUYdu2r
 HIV1EIZylYpinDQQQ4tVZOyPndQGiGlVD3vkFJ2tfmwL0KC8IpfH2clyed8M9IM4k3YgEe2tqF+
 /VgNFC0NXa6fX93a5v3Ng3vuizcvR18Zfyw9az+N52SDK4msLna4sXlzSB81wfSZhLMuWXCxc3L
 f7girJ3fGoNwRP+MuWBKdQGmRp6cIhlgv2D3zosG1iKt4j/4oZrbyulafDzxMD23Kr/sE6/d/bA
 hz4jGsLn74Os8QMWspA==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=6979d9e1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDi01W8oxqZMKvcAlA8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FTeKpte1X-MhaFIbZ5F1G9xiSBEx25bJ
X-Proofpoint-ORIG-GUID: FTeKpte1X-MhaFIbZ5F1G9xiSBEx25bJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31213-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A68DF9EF20
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 10:58:49 +0800, Vivian Wang wrote:
> On the SpacemiT GPIO controller, the direction control register PDR is
> readable and writable [1]. Therefore, implement direction control by
> using PDR as dirout, and don't mark it as unreadable.
> 
> The original implementation, using SDR as dirout and CDR as dirin, is
> not actually a supported configuration by gpio-mmio. The hardware
> supports changing the direction of some pins atomically by writing a
> value with the corresponding bits set to SDR (set as output) or to CDR
> (set as input). However, gpio-mmio does not actually handle this.
> 
> [...]

Applied, thanks!

[1/1] gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR
      https://git.kernel.org/brgl/c/aa7e37fd770bafaaf856ab77735296955b93e377

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

