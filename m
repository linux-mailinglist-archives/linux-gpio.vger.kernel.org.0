Return-Path: <linux-gpio+bounces-32026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNzbIQclnGkeAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:59:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E108D174696
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BEC13051D07
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D871F35B637;
	Mon, 23 Feb 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COO2tCvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai0oA1Rl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DA352926
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840654; cv=none; b=VUAmvlFgWwhLssNiWnHytUFWUt/TJ3Xl5N2YYN6WscfCScBcaxUpAL7I+L8E8A7QqEAPrnkWMmAnCwm6WxLR+mHjnKQ0QMbeDUsSX09tlq0uOSsKOwmMh2QsNxRzF7tsB6tcYOCIavUAGE33cGLzyh98Gg5Uxjr+iTGVBZdJPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840654; c=relaxed/simple;
	bh=tkEnKlUrQfwde+717XQsqcighT6A7myf6Esv9kkwsnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9Q1YJmV6Do6qzQhNUkDiWhrmLYVPJW/Hxgwrc2oY8Z5GaHbI0ZHBMmdA88Rfe3gq0AqBaoC3STdMmD7lwNuqmBkCFQjQ60dw2Ytla3aJ7MLdXDLIhzuromjdZ9fmFEcLHPtp5G0rz+ljF6EgM9DY/CszWIZLgrMBqnTrKpSDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COO2tCvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai0oA1Rl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9lLRG2554584
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WXEnWWyqN8ihcUxU6eow+IAMN6E7ylX5DXeLYruFo0=; b=COO2tCvPjwPaO6Q/
	T8/rdRnQTb9VL6KndDBgr1NKfhAKoLbzQvcKCLsjz79mVkNoIH4LNTVLJOcCqdn1
	AH8yjzVj6EJ1svEWLI2ahkgThVjFPDjM/j/dZoiNiIYRsM3CCatG5AzIEQbQCpQD
	e1XZz0YImG2xOALIbsKVo3MGi5eIrZwDu5xSqud1OgQIjc9V8R6VEP+MG9GNxEQ5
	r0XrI5GsSxm1jUl1pfOO1YKyd+Sm02M2QNn0V0M4WKRJV5pC2hUp6ZHrneCty8BJ
	8Q+6i3pC0ZIoQnLVi7Hs6pTM/yVMNRrjAX7ZRSbiEYVl4zWy0CCQe76Ozfk6gFvb
	qyvXqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv8px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ff05c73so4151828385a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840652; x=1772445452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WXEnWWyqN8ihcUxU6eow+IAMN6E7ylX5DXeLYruFo0=;
        b=ai0oA1RlYMkkmeVAeRAtTFkraHbWWdEFJWPxHxMbum+tN6gASc79oBO39ErX8J+Ciz
         oJ0xH7ryXX+6Tox6lk6Rb+M6Sfs49xT4xKX0W6LMbwVGt8GzziPL96Ym3HSYPqWbAuO+
         aYeCGIx7aKkF1VfzyFOwO0dE3J0fHtyLm0olIcm3KTLTRvYxfqbS2xUbA/LtwIPaHNCT
         bYzA91dXcVWUSKNzS0UK9qUS/AjoGoSpEKYOxhEOWWVmeCPK0m93XrnrL9DlaYMY9m/Q
         SXZ2eSufsjqmGkOyIK8q7+JN7Y0sb4QhCpOynaMWGBDby2FqAebqU9LgjtDwUGY6Mh9b
         eH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840652; x=1772445452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WXEnWWyqN8ihcUxU6eow+IAMN6E7ylX5DXeLYruFo0=;
        b=gJgc7rRLqgLYUrf0694RVCBHehErBtJllCn5BvD+1GZWfAmOUng/8na5rCQ+25sfL1
         vMcmU1b0DHAQ1m2mtRJIP+HtUzwKQv53VpEjmR9udxpG6GkVv/u8tgjne7ErK5jUyG0N
         o073uAX8sG34cou58VgOK8x5dDNRVG3edicr+zBarvgWxG3Nlx/iJ0yti5i7cIsfW4Ez
         Jb4hW9uggj/HzB/yMy0gmrWgz6Lj0guTb050/rSaU662c3piug0qAv7ATx2Ntcf1WCSW
         cuqLQK0sVOiXXayLHEsJ7dI/K19fiP8nEc8TVC2xiOeC1eHe4kXReTOGZ6Lx6DCigN9R
         QeiA==
X-Forwarded-Encrypted: i=1; AJvYcCWi0fujy8+VlCwT+787WtHdokYVLGyg8yhDjg5sQyZypcyjSyJhR9/d8mqOSBS803pBmbnJ29AeA5qi@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIk5QVc92a7/nf2Q74h+7/N0XWn/D5EFtZ9MLYKFf2FCPyt3D
	yBJEBXEjnBEV/tTCYhX/x3D1vCuAVKRZ/02I77RlEDi8os0kMc/9pFgPkQdIcuOIWefzSKo07Sf
	yX/vajbAxLmE2HTAmnDg7pHja+ATI+OIhKpmHX1+XI7hgX7Wi+NgeNNu2en+MnuwP
X-Gm-Gg: AZuq6aIlVhipi9jvhLt9hGpGGq6EL/u/D08bzQMPYPuLwMj97II58aGWjBZ/5QVcfKy
	AtNNDDF5bV9wpootAbSvnm2/Qml+z8U/+jv5MlB7pbAJOoVzZ5gkDLBwbMJdK8YdHl8SUulOxsT
	7ik809RqDNn+VVvx7EHQ1ckpw/juY6PbQ3BHo0OaWwAKMkBNnRpM/mODKOVumupq1RFgYydPzBe
	lb8Eniwu/KE7mOcZztmxWWelD2ObOUteirlDqISOF28Pu7NlZB/LoC+1iIxTyKd+ClPZAayj2JP
	lD4qf3TPs5g0DjzogIlFy2RcjDBf22KtItTZAMK3vIVfiBkBZVFixLsTsE4kzXDFbyw2Jj9Mb58
	xROzmlcoKEogkIbu2E+dMVyAZON6ild/dcSr7BuWR1LSzsIS0LNs=
X-Received: by 2002:a05:620a:472c:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8cb8ca15e84mr1021073485a.33.1771840651684;
        Mon, 23 Feb 2026 01:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8cb8ca15e84mr1021072385a.33.1771840651290;
        Mon, 23 Feb 2026 01:57:31 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: replace snprintf("%s") with strscpy
Date: Mon, 23 Feb 2026 10:57:17 +0100
Message-ID: <177184063430.89486.14492373165756029544.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260222170327.281576-2-thorsten.blum@linux.dev>
References: <20260222170327.281576-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX69tcJciIKcDm
 Bc1izmuWaiQFtYfjGOUwgF1wDnQgnJPVhe0zH3BubyWAbxjjrrcx5+zsUfUBCC224xpCV9gwVM2
 hiQIsMdpsFtUPJaiBKO+0gDR79rkAUQd6pXHeRrXsc+FWJbaV+CD9Cs2Tj+gCsumYOlVDuTkGSb
 nFQ2Xga8+oZ8/r+w1IkpwKOY2cfnXn1RIB+T5rUlWv81dLbtyY4vULt81erO7BDIBDVkulzyfk9
 cNP2OqVei7dqv3cPUUZ7F8kkb/UZcb/w4kJussZq4fUYHzChzygi0E0+xpPKx7LA5wrNk9aB+PG
 iXnym8R4RrQUnObruq3J2ABKenXjcno3CDZ7sMoasxMqa9kS86TOgSaMDHFgW/a7X4qNDJNmQ+b
 J3yNYxJZXqKvhlwlBMWXYw436DHHVxQVjZq6v+QzX8PeYu67dGc2d3KRr3qbkwOXWRf+Omd31A+
 yJ9jS7h3Z8yP5XhWsZA==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c248c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9KI_1_GaV_NRc9ivTfoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6iQjgXTFxLyY4niB2CD8IVKbfBrgjkfT
X-Proofpoint-ORIG-GUID: 6iQjgXTFxLyY4niB2CD8IVKbfBrgjkfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32026-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E108D174696
X-Rspamd-Action: no action


On Sun, 22 Feb 2026 18:03:27 +0100, Thorsten Blum wrote:
> Replace snprintf("%s", ...) with strscpy() for direct string copying.
> 
> 

Applied, thanks!

[1/1] gpiolib: replace snprintf("%s") with strscpy
      https://git.kernel.org/brgl/c/e8fc8588d06cf46cd7df622886e5a4be57442b65

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

