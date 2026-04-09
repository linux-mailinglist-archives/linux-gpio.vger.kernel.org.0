Return-Path: <linux-gpio+bounces-34926-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOk/OhFl12nvNQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34926-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:36:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFF3C7D2D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A3853013A7A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BF93A4F36;
	Thu,  9 Apr 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC2mJBbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPAPXGD9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF33081BE
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723789; cv=none; b=TCsKLrwQUInMH3kTNicT9dW9yKNTdwGfw7Bx9mv7tXlaHfZCRVrttfHzagh09qYIOVTbK81Yq97T2ncMngQZ/yxqDIaDY1H4J5+FP2/l0gZWeD7Nq/hKiO9ZXjKc8V5y5gS/y+W3qShnG1cABWruXuB1IBWGBWD1p2Wa8qrfUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723789; c=relaxed/simple;
	bh=Y9K7E5i8KxnQMZtVX7CHkn7UT/rMHmmRz4/ssFCiHKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmMlqwCrheb3wLr2yMDHvbUxBqm9kmmBYS9n8NNd/UzIOjeyh5LOLH3SekizLqWGDQgFLPpaOQNt2ZiG02uLYLLIasBv6FVt0q8r8a2njxmnpJioicrnudBAXpNwj7z2swWtC/yEHQIWV1iFFxuLl4VzqZeEWNuNA8M4any8LFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC2mJBbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPAPXGD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CLXr1727432
	for <linux-gpio@vger.kernel.org>; Thu, 9 Apr 2026 08:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=; b=ZC2mJBbTwR9W2owz
	/xcfQqHX5Ax7wsyLh3uJmm7hyZSYTYYIEa0+xD9h97DPpew/YiFq2pEnICulNw7m
	nGezQoMsEqq4pZv6G10qJ1jCY3l4zkrNXQduyDemBNZ9++iEJp2u1cI/qMy1iJ16
	+EdQ7W6i/fBlMzVSmJB82CjFiJpOvxGZFY/vwfGWiEojdNOSdmCctCyqs+HIgSD5
	R5ma8eqetsu0UZNc4Ekzxn8n0eZ42AjaU9xZl9ZZMyMQUAVoRgMZRwhLPoNIV5xT
	OheIt34gKDpRax+0VKj1qdL2HrlDXntnlJFGoT2IA0yDB6/yOwOFFl0C/IVJkUbk
	mD0quA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrtbge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 08:36:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d84b5f73bso31855741cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723786; x=1776328586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=;
        b=BPAPXGD9nQHF6/P78BQpmCpx/8WI74oJoH3KhtgfOBSwYHgD8pbBH+PxNNrLhxSH2h
         m4ODxWXTHZ7ijL94mCjluqoZEJwkQWHSvzrRFaArLklHEEFbas7owA6HWsqUlD9F03dc
         PkwJ33G4OXuecqhwUOYn6RD346h0MwzjsK63KpX3kOEkYYzBVysucCz61QgBD5YSPEeM
         24g20SiGh3IOKIbyApQvyNO47qPomM3f8v7y79NFzJbpITkmei7sgWF8ASeb6OqckOpu
         kSV6fZ8wig/srd+9Q4VxjQP7VzpQjz0YMEssMUYuRHgV+3AD0royV6gYx2vX49s8ka3w
         Fwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723786; x=1776328586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=;
        b=NyO7qpmgEGIC+uGRImvJw1briCjNptbpM760lko1FuSv6J7V4o7xYjzfAC9WDGYYNX
         DI8gK5JXuRw4azXDx7xcMScOgVAVCRhEdxCGrqWmFSjf0JHv2jR+3AybdjTMQZe2Brcz
         OmU+pIvMPldBZZzCx0nKASluAdWbDU5AkSAD/IFFhRkVr2CGZB/e/icKCYuF0RR1Z3Bk
         CnCP6YO/87IlfuUKGR9U0riCeMVUXv8vqJ8dYdX3MKqNa6TyEm/HZnyn9ul/C9XnHv0A
         0Ue88m1ee9u4+H7c6ozeTCIEuRv9iQ30p+xgP0wV7aZW3sAx6fe4LoVtyU8YWOLK80eI
         XdLg==
X-Forwarded-Encrypted: i=1; AJvYcCWF6OxIne94j7GnWFFpVVv3U4p70osZhoP2afAANT0QnJ4cS95SYysq42f0hgC7iQaAylQcZwLmz+MD@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqmyiWmpxRlcTo1AIxk+IikkCG6gNfmXi5bKvIdRU/OhDCDUq
	K9cVQe05q8ohGbEBpNFXcnAcLMuGHxKx+b9KzK/Cjx8wKf2wzTb5LZl5Deqcp6UJzwhose1gNsT
	vXWeTOyU3YAlUS1dHbzLzYp5LlM0d26kt/EZGP0MMjfcjEN1sd7YgRnQhZO7zVBvh
X-Gm-Gg: AeBDiev8w9cjmia4TAFOkCno5t/up2Pky9b/fY25r74GrF6jFzeP12G5rj81yGsfc5m
	AskgrV57fCCVtRfRAPvmTkNOFLcQDM3MR3xni0ZXp5O/SGBhIpyxE1MBynANNbiqMToNYAkZt62
	Qj/y3c1eH02vsnjS/W7p4LmKl6boSDah0y0vRLnd95UoIT5bcNCXW6B+4++wx109TiPVSxgtppx
	ghlRGclcBLLOFIKpn5XeyIka0dlop+40Ypuw4cokhzJsEJfoMf57XaFrQgG+Y5j0czc0GgjPoAk
	eAeF/qnMVK4o20MQYsTY6IzYuttrTLY5/CzAXt+hB39pcAFtbkt4i385cIWWND0+wh0knOtph+N
	EdQ2+XYXEK5QUUtItnEdH5LNTmFTZWYPhLRKow0o1E2NvEAdFslw=
X-Received: by 2002:a05:622a:248e:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50dc21ce255mr34961151cf.24.1775723786223;
        Thu, 09 Apr 2026 01:36:26 -0700 (PDT)
X-Received: by 2002:a05:622a:248e:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50dc21ce255mr34961011cf.24.1775723785786;
        Thu, 09 Apr 2026 01:36:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:25ad:5d40:fb11:35a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cfa75ae2sm67976645e9.14.2026.04.09.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:36:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com,
        Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: fix irq_release_resources calling enable instead of disable
Date: Thu,  9 Apr 2026 10:36:23 +0200
Message-ID: <177572378022.62056.4431173020007463184.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407210247.1737938-1-samasth.norway.ananda@oracle.com>
References: <20260407210247.1737938-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfXz0DxFuTG8ZCO
 2/c/1sXThmxwSJmEUsqNgC7X5w3QmLJBQsMEUwsYHBVE8tBcy6Jt+Wg3JMWGPHHC2Q/yMYe0oiR
 t6umD2sYv9icQUn+aVYSMEt/1AiD2YrpOMorzSJ4p1gYTW5iiRv5HSIKF5pYGU+8b+sd8x6S52P
 dsfc2QoP4tZ5OQwonRqO/x4eeX7u1Q9mnYwBbsJsba+732ZhmvWHo9PWNg87kIwG94Gr+thFAf1
 lNvR4VtKRu9TuvSO3WVctr45IYb+o5dILx08OCqgaExAH0npS0ZJG3Q93FMGCnd9bCl6d5dMk5F
 vkECtZn2Bf4zl5vqox4/lB1HmTvBAyI+D/od4BrAZDjOQEpbnejyfAcv9it80qWfcMKM8cH6qr2
 iGeD9KYWJRhXRTEUDNfWG0JnSCl10zVg02ojVXTIyaxlDoW2OEaU41YbxtTtGhFA6EnrdV4Shq0
 3376Phj1Szsu7BJPxXQ==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d7650a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=knViAHviYLxJDNZdbiIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VoU_DXwhmRg6eXnzMO--4GQ18TcFjjAm
X-Proofpoint-ORIG-GUID: VoU_DXwhmRg6eXnzMO--4GQ18TcFjjAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34926-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43CFF3C7D2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 14:02:47 -0700, Samasth Norway Ananda wrote:
> tegra_gpio_irq_release_resources() erroneously calls tegra_gpio_enable()
> instead of tegra_gpio_disable(). When IRQ resources are released, the
> GPIO configuration bit (CNF) should be cleared to deconfigure the pin as
> a GPIO. Leaving it enabled wastes power and can cause unexpected behavior
> if the pin is later reused for an alternate function via pinctrl.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra: fix irq_release_resources calling enable instead of disable
      https://git.kernel.org/brgl/c/1561d96f5f55c1bca9ff047ace5813f4f244eea6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

