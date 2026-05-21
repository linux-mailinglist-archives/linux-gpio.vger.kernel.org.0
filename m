Return-Path: <linux-gpio+bounces-37270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IvNBi4AD2pfEAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:53:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956D5A531B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 306543073F66
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA83D6476;
	Thu, 21 May 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF4Z/OTr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KiLfHmFj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912F3D5C26
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367138; cv=none; b=VUzii72OuE2mvR/+Ldxb33J9Mezo4MwBruGGeqO+HfVG9sQz8uIydPoKCetwunkxf4lS7l4nkMX7F2dl4UY/72F2c1j8FnwJ0bKbAO+yiWoGLTijP7mUPj7AM6mNJe18CgrRZetGjPMe5xB8zdtFQ64UKrex4q/lHlBsY96GWOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367138; c=relaxed/simple;
	bh=vmzR/IjYGhKqZRluokNC/4JVf/UGxYB22fxsR6uJT+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oA4FLmUi6UW5q0VzjxCK2RhIKNY5wGRAs0ax9BKJKAla3abrvquAPo62m4OtC0rJVErZCN6KNDTGXA6b7sJ0mFMNhRZmT5jDQm9o4Wi9QtSETYzPFEMQVybUknpzEDRuxzhESPa8NC7F4H8fOQeuWvqiQ7Ii1FHvn0tCWrr+4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF4Z/OTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KiLfHmFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXq89818809
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZxc3UfHhpTLZwI+DoMq/7ulEYDZRjNWawyaBxkSEt4=; b=NF4Z/OTrDi/bxE+a
	yQvENuKduxFYLrm2Z/g2IYMHAOvgeF8eC1xt/WAh4W/NN6jeXd9yaG3ejBUto9RZ
	9d9dHZ0lttf4DoCrkW6GLuO3jsxuZ+Cww1nAv2JuWwG5VDrTwUlLzrDiEGT/Z1HP
	x8gwypIUsrfbmt275/HpM6ZJcuHGvVR5lRHHvjyrP/gAyJj/aQt0y6l/quoHSDbW
	/nGEr2rRBj4rEvWJ+kgJheZxbWQ+QCzeBuvHNzvwooP7o1t9CPqGOpeDGbAkwKuL
	SXASCP6QaBCvhh2uPklWlN65Fep9uwJO4oaF1j7bty0blcZO8kOSO7ofJnlYLCIF
	DtjpHw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkge6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so169693631cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779367135; x=1779971935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZxc3UfHhpTLZwI+DoMq/7ulEYDZRjNWawyaBxkSEt4=;
        b=KiLfHmFjRKCZnpyGeV6pGw4TJ+v5F9Bmy3HnacnTaFGmj5qxJEMiNI6yyLhJCzJMcx
         pxoEFXNMzh5dwzYQve6aEwTtBTsW37ZZYGFHjeIGb3sF40FNB7fI7uwKnhD9XzsDZP5t
         yFIft1OONSfK9uUq/yvvtMbe3kna+1oqPfnq9rsaJH5UGVrPC3hovA4/b/t3wzHnWo31
         c/DPS+37ISOYkloVYgav73fbhBQ5rDes7pjOKf9Ca5PCmksaLZt9IcPXGOnWk8mZZeuq
         JYUwGRYyJiHrqhfVAL1WMeRzp+NY03Y8X+jMfMpLhITCmR9AV4O40MaZKK6LABWec3td
         kyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367135; x=1779971935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZxc3UfHhpTLZwI+DoMq/7ulEYDZRjNWawyaBxkSEt4=;
        b=ARLGTWQKNsTn320PF02wRFUJwb1MV6+456EGX9eYFM93saExXSIP9bdl2SyupDVY7J
         6AjpY/XcLNF6y3MRXw6ZnJyCDi18SZUVjU8IHCpLMxY+PWS/GjaZqbwATQ4wBXExzPgS
         5L/PMvHG56OytQMumnjepnFGgPYjIz6trc7La9MPvJY0ybwf2+Cig9Wn0KRTU/gHu5aX
         QwJzxqSynAZjcoETjS9pg/0NyhFNg3b4wK8WW2goQR0clIxVkmlGUIznUNDQnXNc0tww
         cxxo4opM/K4Xy6dmv+l18E4DFYNubKbydnCZMbi672aLKfTHZ8PqRbkj4vU/2IAXID/g
         DKEg==
X-Gm-Message-State: AOJu0Yya1xd6spO/iBft2vPa+FHt3Smx8hwDGbNEr2Vpc80+drZkloZ7
	oicY44/GprUnkPhbVoHExJBC9kiaYsbP4NkKpajCk3jmZir/WqveP9pWieLpyl28g8brbZDnkLO
	yLe8K++3xymHkCCzjQF6xUHvNO2OKjDoiuGLqv44UvdfW3TEVbU1Z1Mr94r4pAG5AKCK2UUXf
X-Gm-Gg: Acq92OFOfRDemyys9On3iP4QH1LJMDo/Z+lUCIT0OJsEKgdhJkq7ZKAHS6WT4e6glGY
	lUbZge4BxTDG1DnvQu6kZxJUp46SK8DW+qWhF9/tjzd9NZCRXzHB5i2IlFFXACPe/xry0sYbSeG
	jZEO+WkrgG/dRW1peZ9b3TCLexeKMcYwH/FvI/U9cYcfZqFh1w/+vEkefQLdeI8g1WI0OTsAdIQ
	vQ/XgaTylSsm/fczn+6LBweDtKMTw1krYHHKa1fHI0e0pYs3cidFDY04646xr4o6ZtW7BbIVWXz
	/jatKKmtrXBADtceh3xpdtz2oM6vYZxZ8n1eVFC3MeTGMTzhnp5TTYpbO97NVODRtUyJAyeis1G
	3054iA6jspv7UyLo33Qux326E8xAfawyRgXSmSwb9mcqkFLpVrA==
X-Received: by 2002:a05:622a:8d15:b0:516:cfb9:2845 with SMTP id d75a77b69052e-516cfb94417mr5710961cf.46.1779367135456;
        Thu, 21 May 2026 05:38:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8d15:b0:516:cfb9:2845 with SMTP id d75a77b69052e-516cfb94417mr5710441cf.46.1779367134933;
        Thu, 21 May 2026 05:38:54 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c4f9e0sm20508815e9.2.2026.05.21.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:38:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Koichiro Den <koichiro.den@canonical.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: aggregator: remove the software node when deactivating the aggregator
Date: Thu, 21 May 2026 14:38:45 +0200
Message-ID: <177936712379.27233.4365325675717344559.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520121631.33976-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260520121631.33976-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX2bATYipJJPqO
 6AfJW0vPV3mdfyHzoek1+3gexJ1GF+3BvWbP6pK1gYxrVqxutaQbHvGd8c4Pf/RwPhPUnBm/jGq
 T4sfwn8yf6h3sagydTwQYpbaP+JZmCBJIoft0yN//2ANNeC1X6gwPAtPwi25qxKICKRyEgOLpw9
 dDk7VZrdfk63Ud2W5UmeLL3HhcD4JyFmvaCGVAw7wzSWW+QK5gRGxuZ0aIVquxEPcMVoye48yfi
 NH/OyOakWkpfriqadNNgPvE9OzoKxJ77PxCXeu5HMKU+Z4AccGhP4KNrMDZN1WSTRRm2Zkxc5nB
 BWLygEWODx0SEK16WeqwFFik0Z2xDtCFUeG7GIU0XJfZT7avuIBRDQioke14hbDavosw3UlvS+9
 smMcJbANxcLBkIhmtDtY9wQJLbonQmhYoVf4IFX7EG9nndB4kZ/UQk13bn5QOogG1dF6fNr4QjR
 Sa9lQXe4rjXst0manJA==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0efce0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=weMMdRFkRvNKt_yxdFQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Qh_SkATuqqwPB_4cUWbPRkeXJeHX58pp
X-Proofpoint-ORIG-GUID: Qh_SkATuqqwPB_4cUWbPRkeXJeHX58pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37270-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1956D5A531B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 14:16:31 +0200, Bartosz Golaszewski wrote:
> The dynamic software node we create for the aggregator platform device
> when using configfs is leaked when the device is deactivated. Destroy it
> as the last step in the tear-down path.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: remove the software node when deactivating the aggregator
      https://git.kernel.org/brgl/c/61fef83f239ecace1cce716135762a2d9b7b1fc6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

