Return-Path: <linux-gpio+bounces-34413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH9xJD0+ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD85357E75
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AE343034566
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EB33AB27C;
	Mon, 30 Mar 2026 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXRIme+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgHkEB3P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C13AD531
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861504; cv=none; b=GlKXmXbZdAcHXGBt71jfxVngjHCpmlGz0pYIdHIbBSBqjmgZAas/rvlWjQpzGfr/z2hVk6q8IGWibqV5ExS9VdumHv9860BfDYmZpbb5K8sxAtDnl0U5XWaF1o6WjnM5QmWVkE7jGTTaSzsSTasYe5B0wIxfzostzJ9K7/B6l88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861504; c=relaxed/simple;
	bh=/14w15A2tMVIKEHvtwEfMEEICh6grIMpEVdY4VAabG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G50y7GIP+UPiph96tBMn+AVC/unca5HEcBngWwve7Zt1Ho6ZhRmwPw8J/gpMSYxErk70jT9dG0zAFbckWri1FDrutslRUjP+JA3QatQ+lReX79sNVZ4OVCYzrsdsgSsE0ZYYqi4KIJ0TY6geVuS2pwRvRnkWPDxS9tZnwfNTnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXRIme+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgHkEB3P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7BGGf1011921
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzuRJHdWPtFuF45epqCZ37dmKSJPbNfgL/Mp+n9//nc=; b=BXRIme+5TteJAmK5
	JwIqjDY8K6HrkrR30xsdCRmY5JlfKDe4bEIl/1JZoGb0mF4PkFEhz2M8t2s9X2J6
	NIl6O5xaXX4gDvvIKFERNRkHJ45bUjUy4kT9yH/yvSDODX+aGwb8SaCVXX537nbW
	lTgUgmkFLde91Fg8XJHf1UvbUKcca0eDY4ySFc2syQQsBIJvSpwARP5NW22yOsre
	UcCEbmVuC0M+SVypM8yGy0+GaOR+KWiPbiX3HIvzp4a+qAAbGk3lzfZ6kFVJ+v+9
	RZjzFdrssPVg2yflXt8QgKH0blohL0tdeCuqr0We/s+/DNJpB3xrFl6fZVH9FaAN
	srh5+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm5t8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso136512911cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861502; x=1775466302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzuRJHdWPtFuF45epqCZ37dmKSJPbNfgL/Mp+n9//nc=;
        b=RgHkEB3Pp1hC53GUBUCPgOmlipg8LcbGYAMk1l7MGKUIaQp+NT841d1KlFxBUxxt2S
         ywjIBWjrehucEqhG3GCVRPscgvl6ZUxUir9oYANpXafDOkm14iopueP207rpJ+r2H042
         QIuxiyJneI0xY7wPYETLxbuV1W+ptd+vxZwnd8N7VIUYXZ0+78wGV0xycIouxghXgi1Q
         FOWJMC7EXQN+PDRLHk/0ei4tbWT3I+bvZedTsJT1UIwKRats4xQUqnZDJx2+1iS/Z13e
         /eW5c7H5PW54wyAC2CeER3WErQwVJE+BNWVkeHiKIuj2zMnZ4iTAw7+100xMMXFlv0sH
         Zb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861502; x=1775466302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BzuRJHdWPtFuF45epqCZ37dmKSJPbNfgL/Mp+n9//nc=;
        b=CeiwR4g3+VkQpZxZT/cKdGlCrBnUOhUhSu+v3ANnICrtj98mNWlqFxllZk1qm23IAa
         z7OG3octoZWzEJ25GwJAZkhdI+rEBId4ps/Nj2So/vpbKP2wi/EnbOZDNHznsxEs9Jgi
         JeIijojnF+d91nbgIsLqWSokrYSto0yiJiUnfkMVY5vGpsmITDgWppN6H6JPFICSuFjq
         m1furOqHwzXWavVCc0hroG6dDRJAeon/Xv8PVuYKx8hS09eNIS/dfnUNaucoXOHPmdp+
         S41L2a/uw5m/hF//2oYj+qMTtTPgNLjvCL/5WabrIuaG+5lrqS2VMzi0eNq/pCLJoMhq
         jHlA==
X-Gm-Message-State: AOJu0Yy3ARaH1Xi2kh0nV3loj0Hr8O6Z1z4LVGnPgvYdQLNZZbQozwlk
	seoz/3tk20BXmmu1vk+jvNCiInP8mSw+OOgT5WEBmJlu46CC/oEbxmNK9XIt/6DUKhkeQ5wvqVx
	m9WYX3/Rp6OmSGwRYK21P+/dZHfELmC09+B3FSbSPI2SaWWhSYYV6ostLqBtf3VvxBCFk6BZW
X-Gm-Gg: ATEYQzzN3Kd57MQP2coe/L9yVM3gBKIBgcm8FKl/K1AkeeeGWVxDVZnFgd6CTk/Pjnf
	MgcIyqoQv4n69wuQUtJHTaUoBk5IEFUpRxAVGR7Q7ikpEEE+bmerUpQDciAnOgPKnRbuEneOoyZ
	aZYbYAPD7t3SVmsiWGthkGBFbjtXEdLGLebseVER3cr8rLsRJKxgo3vg4EFWkmKCN37emrIaKtG
	JXTvMiDSzfxO3u89at1U/66v3Wp+VIYkelxzv68ZwAaynpdWTdmw1uKeCJZS8oEajjAE4hWv/K2
	hk85wSJqTJq0lnrwqSIJmTS51yp7cXB4jkFR466vpIFHCEwsQBqjtASQzFbIJ8Hlp3YOPu/SIST
	XPtLw5vIEpj5yPIUJlc3gyAp17cHvBwrcc7ouC5GnZkHdQ7OVlbg=
X-Received: by 2002:a05:622a:1e85:b0:4ee:17e9:999a with SMTP id d75a77b69052e-50ba38b180bmr164894821cf.33.1774861501708;
        Mon, 30 Mar 2026 02:05:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1e85:b0:4ee:17e9:999a with SMTP id d75a77b69052e-50ba38b180bmr164894261cf.33.1774861501056;
        Mon, 30 Mar 2026 02:05:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm208018795e9.2.2026.03.30.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:05:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: update .gitignore
Date: Mon, 30 Mar 2026 11:04:53 +0200
Message-ID: <177486148866.45175.17195158471499896279.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328153819.57025-1-vfazio@gmail.com>
References: <20260328153819.57025-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bRd_MVS5GYaXdULgpzJhppu_Vsz3Fzyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX7GJR0qZUNu+u
 +3QF71AFSkQ3K1HWNIr6Z5OoR9FkGpdKIHQdEfyH9AoorxwVOy+bDKOwVOCZNBmYCtqRkw/mTRO
 6/OwTzfPmhmJuXttj+K9FNihZs4OwUQJRK8YDlKk/vrgYO+OgWVYQ41skzcbZ75q0bwPNJL61Q5
 fnz4tVUamIzlsraW5ehhHd7Do2tRysdbtjQNBqTzqlsJ9sSAzGpsC0XL+U/gfHluDZ/R6xhuBph
 j6uquONL80NKzlLHXxf1WrXBsMTofPC9p4aFSY5wRPM8l+m570LXw03aSSBfq4xc7q94SgajAjD
 ynz0B3AZ8VUGPA3rdWGOeiUnC1izSTrpaUlTge40wF50LOWb0MOLsIpxtMIjpSe0KIQbkse3xUk
 bF96TiPlY9Hw7ZiF3U4938GIxcVUXMac2FUONacqMpV+nX6FXoEsQlNhnD2xYNNxZKdYLxfkwZh
 IhrMvwxC5TSABcnIq6g==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca3cbe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eAmOWf_IhDTYdsiU0aIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: bRd_MVS5GYaXdULgpzJhppu_Vsz3Fzyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34413-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDD85357E75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 28 Mar 2026 10:38:19 -0500, Vincent Fazio wrote:
> Update gitignore to ignore common cache directories used by linters as
> well as common virtual environment patterns.
> 
> 

Applied, thanks!

[1/1] bindings: python: update .gitignore
      https://git.kernel.org/brgl/c/ccc3f91f37c022dcffcd69480f3408ea1576a24b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

