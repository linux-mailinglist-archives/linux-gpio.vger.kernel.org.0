Return-Path: <linux-gpio+bounces-39096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lKUWHl4tQmpy1QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:31:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C62466D784F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nFbug/Tn";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JYdb65nx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39096-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39096-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A4E300333A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAA03F0AA2;
	Mon, 29 Jun 2026 08:27:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3B3E1204
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:27:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721663; cv=none; b=qxME9Fxa9v88DJIyqQ9Ue4sStb3steKQvaLlHVeumoGuXV143GtJoMsQz1rWQivSoXAm5CwGtuibfDNCqh6djX5FAzhq4mKKwmgTRZcDnZXn63pUIR8DMlAwXEAUfH4hJejG980VMMLhiQlKOFAZebf4fb7qFnJQo4WITgHagVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721663; c=relaxed/simple;
	bh=vMQjBfC/OWZBgKjmyU+WQjdsNhMA4u2BaHAA+/UVx5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEh8hBAg1Nz9uYXEjOd9TS7o1f8suoLjbuoMxykp/W9b/dLOR5sV4lzziRGTbQGMgwIpQqg/kzyRV/Qp8py/H6gBVRij7FCpx56qmVihbFQKlJ7Hz72W3zG7APoJVbDf10mLnzNVofWlfaZROwJHJwLSjkr5aCKPdMKKRGZlUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFbug/Tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYdb65nx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dner2188693
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqMB/wKzwY9IgSZT0/cVTkXyIwT9eLN6vwNFsTqwevI=; b=nFbug/Tn5bf1KtJi
	1FZ3vyWEI+yR0qPO6/OfZgHWLFSdzqEoeuBj1NcXrMDZEBz0xUiDA83Zx9CCLvXv
	u0Kbv4+yhUmHGeEYWSWADNNoevlAkMSuH01Cp40PjYJqqwKszJoVEaA35rnoB6+d
	x1mFsHkP757mI+nqK9emIxqurptIrniJoUitL+vBpJloUBdHo80OqxEWBP9YYHUX
	vtO54DFZmL7ZEiYxC8FQ+bcQVC24VkUrFH+7IQaTGSkO3LzBynjm6wzO5MroQXJm
	7bkrhOshKV1tQxPaEa7ADk4gCxuqQMh8Yx5QhcEPOJC8MJoctzqF2B6ZZUvX5mrR
	miJdyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tr9g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:27:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a86f8d945so16187641cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 01:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721660; x=1783326460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqMB/wKzwY9IgSZT0/cVTkXyIwT9eLN6vwNFsTqwevI=;
        b=JYdb65nxwb87cFACgRhAywBNiB/TJsrM5ONpb9HgeBWuEjSyZT1vb6chH2iN6I5D9R
         //9rV0kDcOrgwaN7pHWX5NAXNhLH9BzvwYfJUtYjXiUV6Lm6f/nO7ILhsK5QSEfqfJZN
         8zvEmB/jK6g49Cf614u69XUgi39FUifVjNUXePPRv5OhFdwf25TF+VBdNGBMnaOzRMkW
         DePYTYCAGrF+XTPvfdtWJHrIRqs5GUaqR+PQgDfgIxb3uorpT8h7KBxJ3BGrd9PGc704
         hRPYHPvFnrrpIZe0y0VqKQ31a+RIB7He4v0zz57g7YHwYugZbuwyugwb4HZxNqXFAgKC
         p4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721660; x=1783326460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YqMB/wKzwY9IgSZT0/cVTkXyIwT9eLN6vwNFsTqwevI=;
        b=Z/IFVvqde3q9c1Wq7g5UX1i3LqMEJn0BLgk5sIf3bnAB1ddmtyEYIZJFtkYcz8Yctk
         R8IaTRpzvARzuTRRUTDnk9BA9seYzRbl3xbF87khjeqS2lfQk0DWui8jrDM6u/C3uLOU
         bnEbK3ouilY/ORVkRTGkDojnbQz1Db3veNXWrsrmQQGVNZ3wso9MBu1MvE8+UjprcCkh
         XkrikmQcmjNd7afBs3eyD2TJqOtj0Ada1kymY4iUCrAtHzXnkHOJg+RTQgD7zIr8hWyc
         D2GHr+Je3nWASvNoLPzujpefQAGsmbieofyrQGdsMBcLUWzbwaZAi9RzyX81zf4UzyYW
         /kVQ==
X-Gm-Message-State: AOJu0YxXDV0KsY9k4XIuReKkbOZFx1uw7o0CbuXs4a4jMQhs7BP1KNHz
	7NdYCopBzO0gxGCIlsjuYd51S0wuotQDRS611GG5I99jkS7UCMQzMeyVIETcmfftOgnW843XJG1
	n8lFAFPaiWd/y95CpLKKBysx5Rye547i3Jb7l2oQGDPGhYTza9Q/MsP/HXRy2Q/3M
X-Gm-Gg: AfdE7cm+oxH96jR//mbn270H4HZNRk1EnbVhhCb6UdSxVeZIWyxcnF6crCXcjzKteRE
	OT2c5CMJPdihvGUzzVVKQXWSkJQBEo40DP/im5kXPdUM9Q/TllsKSr868XtmHCVjI5tqPSRwPp9
	/P3QTQo/ljHXJt3J+I4SBrPmsNfVNPkPDFFVllfND3AhaQTPFCxe7lK/KLOn7d4qACO5vmHRoZi
	QxhkTTv7TmAWvrpRtc2kRISxkaWU+hD1vIFJ/7WkYsucWG2oZNNrtasW0ml9IrZwZw9F+VJpBC2
	KBuvgYVEe8v5YG2OxSAg6MosDpP/YCM7OyhJYtFtbQiGT127ZRyI7cY+9pfeHG1bFk9UHqERmOd
	shVkbuocHqujox4A+lAHWDQE+8OtZl2qgYL0Df4k=
X-Received: by 2002:a05:622a:38d:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51bf23b9434mr59375371cf.8.1782721660305;
        Mon, 29 Jun 2026 01:27:40 -0700 (PDT)
X-Received: by 2002:a05:622a:38d:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-51bf23b9434mr59375271cf.8.1782721659946;
        Mon, 29 Jun 2026 01:27:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b5e39fccsm10256745e9.1.2026.06.29.01.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:27:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: kunit: add test cases for software node hogs
Date: Mon, 29 Jun 2026 10:27:37 +0200
Message-ID: <178272165481.7578.1690490654683189623.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
References: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfXwQ7F814UfluX
 Z/JeRcYomwuYWogyq6Syf22Fa2f3JET9eQynDcpU0dfscWLoTBHFBtoFYjpdo8l/xD7ORwnNjkl
 eXM8CCEkOMrhtOfrtV/pgJWHooec3PzR1XChwjr3V/eq0P3htf4L0+Mu4U6Q6pamKu5nBu8u3G3
 3RrUMNMc5Gbq1louG32QBxzB+IO724yRfxUuUmDPhp2LsZFaglh/kgVWP1eZP9WheL0h8gs3ADE
 kX6ThlfRb+i5Fu/ww3Hv4/0QbTPq4NVoAqAuVRz73tJlT4hH27f9gZd5xeI6PqTrqE3HONYEjje
 N3zLPe7RPdTZS2ZsXeN9AuxGu6wcYkjnwj+Nm4BT9b27I6CMMk/3/ygLhY2lmIQkKOfZD3G/dp7
 27hXgujSCA8l7wedfLRMvabxzd80GXaF1FVOsEKzUY+vUw9ZkPej+gXpVtusuqWcU1eppdM2lym
 Vxveeo67ceDk57QcH6g==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a422c7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ub2zVgbGV4pip65LcfAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX52fj6+9WmNYf
 I+3PyhX85Fe8j16rZ5vR//v/9mmfEFJMUxB5a/aS2wH+BwAE6YLZY52FbGjeJan6ETqZMZHi6d0
 jY63fc6JD6VUdy1JLDEZoxEOyH84IdM=
X-Proofpoint-ORIG-GUID: wsOgsmWjVfhvtYG_H3V4c_F9GuR08eaJ
X-Proofpoint-GUID: wsOgsmWjVfhvtYG_H3V4c_F9GuR08eaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39096-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C62466D784F


On Wed, 10 Jun 2026 15:29:16 +0200, Bartosz Golaszewski wrote:
> This series adds test cases for software node based GPIO hogs and also
> contains a small code shrink in existing tests.
> 
> 

Applied, thanks!

[1/2] gpio: kunit: shrink initialization code
      https://git.kernel.org/brgl/c/069547f9d8f817d5d0ba7a8276b0ddefd22222ee
[2/2] gpio: kunit: add test cases for software node hogs
      https://git.kernel.org/brgl/c/a05cfd98c5eca766a4a127bde6278095fc367442

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

