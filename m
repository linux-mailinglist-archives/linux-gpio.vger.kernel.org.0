Return-Path: <linux-gpio+bounces-37249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SADxFl3HDmrsCAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:50:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BFF5A176F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 10:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F58A30494F9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 08:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407E2380FE5;
	Thu, 21 May 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pk8c94Ni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioqtMrxR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF632E36F8
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353274; cv=none; b=TQlt/YsjZKIQmNU3A2QEMEz6pN8iUDW0FVd3zGUYUKjsohFPYx8GOSFbYcqP0DHCtsD94X+UfK3fFPwg/3Di7sdZsUxQ2oNWYcrjlx0jMKsmbsK/BoP8TGJ0/lgMV8NTyhFM5674NNvU27uskmJJejsjAUENIJHeCO2kU7r7DE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353274; c=relaxed/simple;
	bh=E8DFODlJLJ+y3VSSXotPZr4NsjZCHB3Ts21MsBOSvss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ka8QcstXXX+evzr/ANr0Oh/UMpM+wI17Mu/9hJW7djNaBtxY4d8zAKD8RK6u9LKQojPsR3CZ2yAHbMWtzOQc+/+5qIbDSyOP9S0wa1SAnZWJe4bKksDCXcTsDrCtYmVvLFhSRdFMf+SNmB25l4PtSRUBl2YjTON9fYhrHPs5g9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pk8c94Ni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioqtMrxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L72jcY3050028
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=; b=Pk8c94NiStWS7FME
	Sw1hbP7ugy8wv4Kjgx6VKPG+xWOUnXFA7PCO+UfSkyupCIs9HP8JIUt0Tkle78bj
	y1bZ7J3uZb1oHnOpAqZqNtqIt/0OtifolrgJQQBtlxvDsQIz/b1M4NOzz1iwZ0W7
	3bZFr0tpMEwNFTdyA32oj7kjVORwNM1BcH4SxLDys9cfBvYlA+bhrpYGsbYRy7Hk
	8ZyGlqMQJagk4tE5Xjs7qgei4CWp6a3Fz/CaRD6uv1dTyvxUzIIz45EAlCI8eFoJ
	3myBYMvSkhaMw3V8fcQDklFhbrDLeYLlagEhlYhlyLjG6vK2U2rTWoYt2gVc0RqS
	dg+xIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrdv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:47:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e423a05c8so161008741cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353271; x=1779958071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=;
        b=ioqtMrxRM90dKeZt5HjkZcBhqcfvyaJoJ+LSiB3GNlKFRZexQt8qH8ehlMH1aqveUp
         sjWiBaSEUAYaWLkoV87VGknKl8UcwIWq3sb37y5uC01GA3HLK2yYCfB1gWGnTfCjQyYc
         qM0GAATgZW5Uu7hgyD5XDDP4wrdHZ8CDQPpGJlBZdDIHltAxMfEMEUBUWqmbrtnYLdYI
         0OhYaMqXqPVOVaR8onc0zbXPtNO2/1DstsB4kUGXjfp07J2fQ+7/NvYgG0GEFGi5Xyjo
         cZ+jZW2WI+0loNQKrJ/7KXbnZnyi12zS8uUQ8d96N3kh3gslaDZOFnJv2c7Q2GfmdQ0G
         5c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353271; x=1779958071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=;
        b=T7ip5iCvjRwwgMpRaHCKmryTyhrwUZb8HChdt6V+aRPz0p9kyTvCJfhKXGZKZwuXj5
         ohKzkm1x/loHr5kKZvnoLUpdIzREFkLUTTYo0ZlNUwnP3j7MxrZChPWA5WrODIRV5R5z
         ZR86PZ8d76ggUJAaIN4o+NrDOp7Wjss38+qg/HndN5VJq40VmThr5qmTWnBhhGEg29nx
         usJVNM6/ObgUuceoLJWfOdYMAgP8DrfVn6/4+5k4ZBVIo2F1A+mofZlF6S8GycqYZHjB
         wB7njsNIq/1cDFaPfBUKFjkS2LDxN5cwQx66B0We9rShl+bhcvAQpdPUWKtc9iozZQMT
         ip4A==
X-Forwarded-Encrypted: i=1; AFNElJ8RqDLHrtf1/xUtXX6fCPT3CCKtpP7DK0oXYXeuoBQkCg9q0ibHN7Lwhk5XldVKqffBs8Rtx63mYHkH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6PettcEs4gCu19h7uYoHKShaTX68VAc0mi5sTa2MT0Ss58oP
	VG6bnVt+ocZ0dzi3+O9XsCaoiVgElKxr+70ToY7AyZx/SWmy7kiH8KEir4SevRDDPK7zBeGmHza
	cW7MueH0kuUhyHYDTjK8vvbIehCgUfaQJ3ayq0J173euDs2+de+zS1bPZYUOa8H3a9AxaM4kC
X-Gm-Gg: Acq92OEep4RygxEqWJONAr7mN2R4hsuShRXym4tsa8/S16ZXN+lATjygTUSW9TWbkzo
	Sv3BqcviHNa8c0mc61qhRIM8bfx9msqOJxpN34cxuudOdf+XHLTe3C9aKtwlyqbQFY7K5F/Bk5B
	Vb5mSIMb1QGs/dhMpM0F4FMtn9x5Az8hfJEDSIARYNWEog09A89jZu1cwIhCOTXve36UrWllfZo
	QUrRJ7Lkkf4r9bmFmqEYk1nNy9f3HWqLzLS+VmTkP/uu0PhahNIM+XVpR54C/a1FMYkpSA+nxom
	taJw5x76DVyC9dw40AhGQXQL2JCKcQNi3cy+9vqFbn4loK8leyEMUhS9lKorDowx+gAB/IHHEWD
	LhMXV1bc5j9dTm6Zvfgfzam2B2nzBhRyV/11UJVctHetaarb90BoQGKwDpomJ
X-Received: by 2002:ac8:5a93:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-516c55d240dmr20382741cf.23.1779353269572;
        Thu, 21 May 2026 01:47:49 -0700 (PDT)
X-Received: by 2002:ac8:5a93:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-516c55d240dmr20382641cf.23.1779353269178;
        Thu, 21 May 2026 01:47:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92dbfdsm1092093f8f.18.2026.05.21.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:47:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suneel Garapati <suneelg@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: tegra186: Enable GTE for Tegra264
Date: Thu, 21 May 2026 10:47:46 +0200
Message-ID: <177935326423.17476.15579318210410721861.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521012031.2003914-1-suneelg@nvidia.com>
References: <20260521012031.2003914-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX15i1cpHyyrmI
 Vo0FQ9pd5LNRlW+Dku4r+5Fn/zWQumoYDw8TP8KgTxOkjgHlhINgJcFh/CiR9MdPxIu+a2h4LwH
 OGqI67w/s1dbnjUbXkVPnpHwFr4Wc78DWncUY7k1DW4B1wXyL7JLCxlOKAS0edbUKAvfFOzI1rP
 J97wTjfouOPm3rtG3HahvRHUR8woi6yRZ19aKcJbvQqSqQJi9kAlhS3cutadxPDBeqqyZdW2Y3E
 bb+yTz2ObNFx4AE2clygspZ/vOpmXf6rE0ije/hd57y2SahRMK/YxCcnIAVh2HQ13PoVlyFcRhn
 WTmD8xD5IEcG92tE2hnpW+ER3wRBcfc4ZXs8bnnCDE0zqZCekNjq4N01eoQ5HoatTmqk/dFFZl9
 rCPDBHzJJfzdI1micNjiPn0AqL0QAn994yRx58LmB1b3XSEmYjBl2+HmDmz+TO0/l3voS5zrLla
 75dXpLbJ29u4WPsZ5MQ==
X-Proofpoint-ORIG-GUID: BnWPjM_upWFpKYZd2OTofv5QInH02v84
X-Proofpoint-GUID: BnWPjM_upWFpKYZd2OTofv5QInH02v84
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ec6b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XCSH8kJi7rWScvbx_esA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37249-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 00BFF5A176F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 01:20:30 +0000, Suneel Garapati wrote:
> Set has_gte flag to enable GTE for Tegra264 AON pins.
> 
> 

Applied, thanks!

[1/1] gpio: tegra186: Enable GTE for Tegra264
      https://git.kernel.org/brgl/c/822878aa1737c6c9573e05c5cd501b679cf5ea1c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

