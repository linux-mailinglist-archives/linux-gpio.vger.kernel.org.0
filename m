Return-Path: <linux-gpio+bounces-38775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8I/jDE7xOGqPkQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:24:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 738616ADAD9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Wu1cR/nu";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FL8m1qD4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38775-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38775-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F6D13002A0D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCC238E8D5;
	Mon, 22 Jun 2026 08:16:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F636EAB1
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:16:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116217; cv=none; b=sjxiot1T+gNs9iFT2fuFzPStgA0dwnac4Mte2z0ppyJ9AT7+7yxB764dPTuWRp7zZjupLhElo3jqirZXgR24BKRcDneHkQohWX2KyE+q7Q4tA/mWpj1Uzeqx/t6sZ412w/wWODG2MXo2ku9+UnwfPsnw/Ak8EvB50XNfAQp31eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116217; c=relaxed/simple;
	bh=Fd9ZsE/EJgvio0AtBkqXCVebL0EZI7cklG0bw5L3ea0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAzI9bncj7ptvxio2DYdnwrJoyXvH3IruakYKucQy3tFrCvA5+FKe53PKvDx6w3saIWdc2A+d+LfDf9VWyuUfz/PEolhUIe2t4jOZRdFngxVtugeaok1pLzV4M4QDHS0IsHH5PCxOhnllVoHbznwwCGCtYIs7k06PoUXbjFTl7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wu1cR/nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FL8m1qD4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59FoZ2427862
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08hG6SgIhBjcYbOi65bL6iJc5x+CU3rUchBZJ2CrgUs=; b=Wu1cR/nu42Ox3VgA
	nc8Rwl/Hk9P05ekVrn/5BIQvlz9x4lYfBVNaptDlDerCrQmRyvhK9vTXntS4UR4R
	WmO2LLsuCNsKGWrgBvIKTcmbt6jRTt/SZYvZekaTQncfLD2+9C+H2xs3WaxvVLt9
	s3bDXjzZrIG5QaF0oQjcqnPKXRLJtDmCWyItXa4rPqn9iUqEarxzJ2SCaX2gIMtx
	0s2UHpcpqNv453p7v94e/aUt7yqIuHmFnNlEpr9YIWSDPPtPymQ1ytp8LcR8U8Tf
	SCP8Vi2kb1qCvQ4AAq9cpMHpuzGmq4o9I6o0xTvMRiI09/muizCHpdu2dKOAOL9S
	wBfVog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsdj17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:16:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915767b341eso359282085a.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782116087; x=1782720887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08hG6SgIhBjcYbOi65bL6iJc5x+CU3rUchBZJ2CrgUs=;
        b=FL8m1qD4Bn5WarxKXem1etGzjqyHcCVDOg27KAdUGXuQGMv0S4GBoCtLePKUziQDWw
         tvSles1NDNrLBUZkWYRac3Z4A6mNphdqh+nLPoYV1Raltvqk8aeD8Xl7EQHJ4a0bk2YB
         UhPLQj0EnKfxndDJzmisG8GdscMf1d2LvoD9Acs7Q54q0sZo9FZQBXeUWbcnwyyXTgQQ
         /JZ0ZqcZ0D7lErEgFGkYqtbSLgb4DWrUW3qZtAvXXar/61ICzlLABNqC5ArULbCIFhUx
         a4/PhVf6v0PGwqtutIlfTCt00W7vCnH0Jt4tUxjj4D2SpCelvaCwuQ5lu3z7B9Sw0aws
         v2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116087; x=1782720887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=08hG6SgIhBjcYbOi65bL6iJc5x+CU3rUchBZJ2CrgUs=;
        b=jNXbOc1FLq1Ve+b+BY39S2Bc8DoD8G9yJUbwvRhWKjm6MbrqvdpGxXJFHl9GOQavco
         ssG1TWHcTSwnN+BMWg1z6fNgdF8bZDQr90do/+pUyL6Pq3diLPqQ22n51bo/8/E0U6FD
         cd9QY9ArLnLfkeIwVJVF3Xu2+fNKxpEOjc63PsMxveexKDk+PlebCrPtAPz7avReXvi/
         +Y7cZ9Hoh3pbO6pJmsMIWdK0MeQa2a6eKn9wAl07bumhiBbiYpaPnhIdB8wfFbIx2Z4c
         Z927GURAnhv51xFSQFmCAduxuLgMfWaaSxsmBVWbXU4qDFPqhcfvj9kRhwa60TBFPUlp
         fALg==
X-Forwarded-Encrypted: i=1; AFNElJ+DBR5wFEtRBxuxjg5guR8SC6yPb0aT+3ibNtFllBAA+JBd2UbcVx7y5y4LHjQENddFrGgEBvofxwz4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JMcswI+qGztTLbwh+/XCAWkR2iOm8YKjayAtXeLcFlQLRxlF
	bbGtuqZBAknQEvScGb0+S3/3hUqL+Pkw8pgsP3I/vGjYiNFBlmiCqhJZeu2B9Y1OyD1ItN80CUB
	9wHH1Oi7G7D0+wiIEROUVvCZcjHGaVB1O8Dt8QUESqNhRAyswQZLivHc3SE/8qxsK
X-Gm-Gg: AfdE7clSlb8G8DtLUnPtk+ESNPmgS+c2Rvz4/Y2Lj6uT+jGxBS9CFf5B6YX0sBo+iVN
	EhsOPDDmuUHfae8S6ZtRuBZHr67vjzsnDGb+cxRu9C4HM+UpvRnWMHk8+zgjn7XMz+XKKewoTlo
	B22jNVAJFnax1M1zcX1hZKPmfbqq4BdqcVa54oSp3d7ANQaTCpVU/wJlJJ51eyuTH7JVxWP5miX
	UOlXsq6YFLa0F7n9Jg4gfVu+DSFtyiOlshLKkVQOERFPJKdp7bYwWQofNt8+nwbC8QDUMn6vRXp
	SBaJnotyptv2ES8f+wmlyKrFAX9grxobdZc46E+ZqXD/dVkj4ihi9FbJaYDM1T0SYbZrclSlNtQ
	0jFJu7WhrG73Xan5bNsU2urGYJwFmB1OMmkO9vNQ=
X-Received: by 2002:a05:620a:8005:b0:915:f664:2568 with SMTP id af79cd13be357-9208d6ed316mr2048326485a.50.1782116086937;
        Mon, 22 Jun 2026 01:14:46 -0700 (PDT)
X-Received: by 2002:a05:620a:8005:b0:915:f664:2568 with SMTP id af79cd13be357-9208d6ed316mr2048324485a.50.1782116086390;
        Mon, 22 Jun 2026 01:14:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4f01sm25241929f8f.9.2026.06.22.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:14:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Igor Putko <igorpetindev@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpio: tb10x: W=1 warning fix and style cleanups
Date: Mon, 22 Jun 2026 10:14:42 +0200
Message-ID: <178211605573.11653.1160089780538593398.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618155626.18751-1-igorpetindev@gmail.com>
References: <20260618155626.18751-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _wACU1kciVkw9obPqeMvOOC2H8ScpdQF
X-Proofpoint-ORIG-GUID: _wACU1kciVkw9obPqeMvOOC2H8ScpdQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MCBTYWx0ZWRfX0vxzYDwzHs0o
 mFyOOYzETFqiqQwor4U3qrM6z6dAshaK5Tm97HcJ3Lf5OIIdcijAL+uYzd9MseR9VMTD38cpCup
 ez4x0TDFrfNnZLlklk/owBFVRLwGGh5ETVeJQKK+5AijdcyDCLqnXx6OzkHzzejKEk/wshrgIzr
 NxclTIL6An5gqsZuFTl2a628a9g67VXMnMxf0Kw5B4t9v4kgAJA09nDYhS4YVO/yXAZb+/B8m8k
 xRfCRLwGfGuDW3NdAp0IKA/LxwzfhjvMFcffpyM1aXyBZS05sEAirjTCrgKKBmpb8AgTBHgFiwn
 z/AphEMRgqM8RYpS1zzKRnQ0Wb/yEugLQBejN6f2AkYHKJEmCfK0MooSduLrlEgHQ0iH1YOjCk/
 Fkoj1RecECymohMxEkG/xWAJ145TsHU4PSArN4Q9npRHSvw5UetsmC0doJAf2nIewuF5sY0+2IB
 B99oUkKP2ixPdoQ9/gA==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38ef74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Um6D0ZJm5dEpkXDSItUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MCBTYWx0ZWRfX3Y7hFxypit+S
 dgRyw+Hkw1wSbEHnDKu+OMPNIeeNdGd6SI5a6Q4E+dIkxZ3pq0+wib0TvoFYEKPJTZp/QFEVT3H
 1nUrWjntBjnHTq1dXl5xKG2/JM8jyXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38775-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:igorpetindev@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,checkpatch.pl:url];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 738616ADAD9


On Thu, 18 Jun 2026 18:56:23 +0300, Igor Putko wrote:
> This series fixes a kernel-doc warning in the tb10x GPIO driver
> and addresses two minor checkpatch.pl coding style issues.
> 
> Patch 1 fixes the kernel-doc structure formatting.
> Patch 2 replaces bare unsigned with unsigned int.
> Patch 3 removes unnecessary braces from a single-statement block.
> 
> [...]

Applied, thanks!

[1/3] gpio: tb10x: fix struct tb10x_gpio kernel-doc
      https://git.kernel.org/brgl/c/9068c631d5af20000d873e4f299fa0bac4e294d9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

