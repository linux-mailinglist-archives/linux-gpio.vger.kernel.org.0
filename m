Return-Path: <linux-gpio+bounces-32027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIvbFywlnGkeAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:00:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B469F1746A7
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8B423061472
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE87A356A38;
	Mon, 23 Feb 2026 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OooqaFEB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6ixZtwS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7085235B62D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840657; cv=none; b=PKt7EA8NZwph6bacr1PZAoJHr49vytIkaRhrbOLcYI7hlnnvgbvF7QyV8Lt9yE3a8t7N6iuQbMXeCmysxQ/DDyP9Q6d9c6Eg4xDIYB8Nc/sc4KS7mC01lAXL0WcKIcNb/fNjN+/6r7qFL47CChlqO7OTmCrxSa0YNJOMvmo45qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840657; c=relaxed/simple;
	bh=8/0MNk7ZjA9XqojPBthVkHIQyp1c0zAQwFpBTE7i9Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dvc1tbgLxjjmtJAgYyrz8PofRAWkC/0kH/C0VsHBNFF57rt7WeRSGsuwzo2F7hdGTYO9Xbn+fm8cGJs/jc5yw84WY2y9vWESSaSvTfRTFTs1Hbp19voMvMBBGheOSUYVl24RSIQKKpXrAEJNuDkFRUI/c7jFWxfqSXB2ihZQLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OooqaFEB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6ixZtwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNvhHC2066016
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/k18AynyVGndrfoXIrP2GR5lkbMqXaM38gjvd9UEuI=; b=OooqaFEBBBIvsdQ9
	+00tglYGcoh+fzCY4rJg9PElmdbFDncBNMct399XqoOEpWF4uSlRCCPynZdWkLD2
	jJrkdBenus086zUoKRAXePTGBmNIJaD/fIAc7CEEqCzi4ChmWpxr3B0zfiD7e4GC
	LvOj2Ym/4GoKE1573r2hgtoaxkC5N0MfbjMt2FNTX0ft0qTcXYV3ee/L2+p6ecOP
	Ev/SYkZOSFFM3j7Ah7zWPgtGgrm+yW8hulZUANgcpLzZTn1MnPVzPv1UJs+KY9Iu
	sLJJAKOs/eLtsufOqqmnMtWVfpZTGrFMHjpzsaeI0xoTyxfrikU1JjLMn50L6q+3
	RJfALA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc916-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso4489904085a.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840653; x=1772445453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/k18AynyVGndrfoXIrP2GR5lkbMqXaM38gjvd9UEuI=;
        b=G6ixZtwSDAOP/P7exeVgXUODvgduavkHz5kD15B3/y38WQiYHpwqQKLouPFlf/jJYc
         qedsG/33U2E56hOSt92KD6q111AmtZ/ikCLimukxZ7Eeg7HaNNY80YXrCo48+hg5fgsK
         Fvro04KNbPU+Tl7YmQvYKJs/FBEXiqlaw18AX2EC4CUZ7GtEXsgUHAWFZCdU767EcO0E
         corRddvY1yLPjg5ZPT8p6wxiwpWuWv/VxZ+VsllbxMTt+vF9Sjav7fBmVJxQx+qyXHCu
         avv8hB3psyHLEV7ssquAlnh/Ce82veo4K0syHgQ4u/6XaK2OrmadcumlJwqlQQ5U+UDJ
         uUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840653; x=1772445453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d/k18AynyVGndrfoXIrP2GR5lkbMqXaM38gjvd9UEuI=;
        b=LQDBxAk6ZkuNIVcv1ZYDAO+wO55WC8KUD0swxzp/SgJx/pv07lsXIuJ1VhEWM1fRan
         KMHWDvPVaG9R6tIxKoRZr00qI9+1B5fddid6f3FTy6JWsr0731WRgyx3YU6ZuZ6GsEIX
         9uo7+Xa+PmZkivq8AayFlNaNWrx8XTFf/ZfgqKlfhbVz0NUEcXz/hzD79iOFU6pzRh6h
         ypzzuAR88zpfcc6/nt7g5MwF5AusjL0JWptB8iXpaYJbPTWWZw5eN7lEylCyAycKtIbP
         GRouweMeoB9eYLVLOtJaawf120hXsVLT0+kCirAbu5MWrWED/tac5hbtB1A9APrdttYO
         kNAQ==
X-Gm-Message-State: AOJu0YzRPxIv5CiqJB3HejOSregCkmznFawH49Ri+DksuFrNlXpoVq5/
	9at+nqjj+71Q8zwMRn7IAoINkG7pWsxttWEYXxuMtgT7l9KFwkf8qU4GhHkKxWxolW8cjsGbDzC
	GNQB/Ku92OaxBytheE/kj/YL/yCeAtk/8qXW8h6RntHXuQfPKErRRfQXRoTWaQYEsgr08c71R
X-Gm-Gg: AZuq6aJzw8lFoCR8G7Kq9A/O5O/sNN4mh1ywdWMmlA3oyQwQee/Phsi0vTttmT5jVwV
	/PFGH/146rVykiNyZRvW7o4nozikcbWxL0MR+ngZO1ZNWHXua/yo+SI7rw3hKFII4zSxFy6j6Bc
	H4L5/m5zgCCp7nrDrpc6oOGCrmYkYu8Xv/C07fyw0v1jWgRNwQxBGGrn63jya6xnkNTgP6ofKso
	orten8t0GPUfr/Ghl8KHrAewisTzUKyDRIAy4gdwgix7qb+8KDdhjdXb4TI8NWdvkw171K0Cbyh
	VZpywstZ8GX9toH9iE9pw2eTj3X2aLnqNc/5QDm0E5e534UVOO8Gpxx2mvOC3qvRPjGORpLU6OH
	ARKJbe2YE1xT0OsdoFFT57wW3lnRvEu+rzzp/7QPcZemrDdn//0Y=
X-Received: by 2002:a05:620a:1990:b0:8b2:2066:ffd3 with SMTP id af79cd13be357-8cb8ca93207mr952809685a.81.1771840652928;
        Mon, 23 Feb 2026 01:57:32 -0800 (PST)
X-Received: by 2002:a05:620a:1990:b0:8b2:2066:ffd3 with SMTP id af79cd13be357-8cb8ca93207mr952808385a.81.1771840652512;
        Mon, 23 Feb 2026 01:57:32 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, brgl@kernel.org, linusw@kernel.org,
        Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: cdev: convert lineevent_create() and linereq_create() to FD_PREPARE()
Date: Mon, 23 Feb 2026 10:57:18 +0100
Message-ID: <177184063424.89486.9239119794957207775.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216123709.281444-1-warthog618@gmail.com>
References: <20260216123709.281444-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s-5jP2qldgIq2C6QgvDFsBwRxhLRRRW0
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c248d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=l9SNb3jDiYXYFj9daIUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: s-5jP2qldgIq2C6QgvDFsBwRxhLRRRW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX4xPuEvsNKVZ2
 x2w8vAM4Pr8mdOlxaN56K3Vu5MHNaUoBQ1gWN0Nsy73N+5ELRQd+iuOAwMITEd0ERftoPRqq+Bv
 IpdbWYtBD+fz4kdirhCLBWUxYBLLVdPhvYggDqWDsK0XM0pNKq3V6yIQ9GfaPfwNPUFCTSQKahL
 F/adq3ECMS5bnthh3HUYt0Q9Pk4rFbEE/ovIbyRgarDyjyxFDDrnp4+eDB8okSg08hK86yS10wi
 gKupgjH5Y3zPo5/5wZW+42GssQd6KLl7PT/eD6hA+jC+wvxNe5jYuGRiRIrQpofsvxrZxlJhW+c
 3RuL1qMO+yHh6DkcZ0wBaTTghFYlIWGQ2wosH/jm7aq0mGzBGyIIe9KrNqXsbulCMISacpr01zl
 7grtQSubRIOFGZFODqIPUwhDota0zcokrBwqD3saPjnoTMU9YjGCMXedVc+vdfdg/4V5cCLTCh7
 KLjREiJzF0C7niAMtOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32027-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B469F1746A7
X-Rspamd-Action: no action


On Mon, 16 Feb 2026 20:37:09 +0800, Kent Gibson wrote:
> linehandle_create() was recently converted to use FD_PREPARE() to
> simplify fd creation and cleanup logic.
> Apply the equivalent conversion to lineevent_create() and
> linereq_create().
> 
> 

Applied, thanks!

[1/1] gpio: cdev: convert lineevent_create() and linereq_create() to FD_PREPARE()
      https://git.kernel.org/brgl/c/96c02c906a44bc280ef26e343126dd3349d8cae9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

