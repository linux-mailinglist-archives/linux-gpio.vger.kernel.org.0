Return-Path: <linux-gpio+bounces-35775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCAxGXG58WlVkAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:55:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E94490D39
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABFFD3037EDC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689F93A3E88;
	Wed, 29 Apr 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLxqZgZ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6zI2+EZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086773815C6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449054; cv=none; b=W8Wf/Oa5styRnA5hMXbAc9/pLJp3IaciEEz7tQIlcOist2KduC2W77KZtCGHEX95pFww3Ib1ef2KAV3Ro7vfvmwuw7//5bsRHHS7jCwCOjWqa2xEb+1y9/z/dUHbxu9vXapk4ffTyG7lB1e90rL+GUf2OJWAnBzcOoSuTQbBej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449054; c=relaxed/simple;
	bh=uDvFrluLDoDGr1CumA2Lt9iHg9L3RWOr+dueZdtmDtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLGpgw3ayrYZyx8V5bZG/JLXzkbRcIpFEtksMmGg+ntWBLff4iAuTmnPVSCYcemfpr55a2JGZpNxBV9TguhSDnvwdkcID7+XIdGEXAy2o1LoJNRyAHxAuBlMwuo9Ir1UObEtAYgiwvesifhIZybAiDS9ahX3viU+O40+SmtqxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLxqZgZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6zI2+EZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6F25d1282820
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaXzXUz663aDb0GQ2R2HdjHiCywQ5RzXHjLk9BGW3C0=; b=SLxqZgZ+RthPKixF
	dQH0cGp8/kjin/47t30ItsCC86pHs4lQA/t5+5b2K9xdLSmfDzaKHXKCTWK5bly0
	FhPhvnhGX8K7U995iks11e/vm7aulz0WOQYrbWypG/ZJkC+q5B1o71Y+irAQvcBE
	60n58psNJGK1msn+4Efj81aXDkfqd2wAawaH3m1EM0Cg5nhmLyapfQ+Hfy3xegBy
	TVTdClt7RP6G9SDhUcoZ39gh7RsaRrQuoA2V2lQ1uxtVgMWHvFJPMIMjut7nX4xD
	WbNFAbqPbjNkAc0RbYeGWobDBu9+xusOr5Auw80VkT7FXGrriAs24xNERL1wuYYP
	QqwJSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80cxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:50:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b02af4345fso129247826d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777449051; x=1778053851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaXzXUz663aDb0GQ2R2HdjHiCywQ5RzXHjLk9BGW3C0=;
        b=C6zI2+EZ5F4VKdr3DzVNcRPzuoeTygf3QLyYTT/9xdo2xsQ7EInw7tubmevdqZdwGd
         fvhKH9jv3F5zH6kRVzNiHbadIJpHuBTqaRBR6+v7awZvymIZzlkY87bUPpo9gCA/ksAZ
         uaUj5+Uy5+u+BBWn5nUvOTnaK7KCeGfyEZMjmVh2c2J9zYs9UwruSc0KZzRzXoZlLHxZ
         tbkGotXQu/dMCAPnqb4FGp9Jk80lXi9l697HhaGA6Sx1VPIEqjWEEyzQuS31qtSjLgkv
         sKfp3YGU2+lHBBbe+Mctr265AIFn5LEDQ36Dh1gVYjadjN2RdImQMC9Yb061Loc8FLuc
         JqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449051; x=1778053851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JaXzXUz663aDb0GQ2R2HdjHiCywQ5RzXHjLk9BGW3C0=;
        b=FZGSiWChFSXAlyTP2OgY14PXXzac62EXEnRrVd2FvwYfO/zRAzaifTiWn6+O2CO3wA
         MqZm33beTSe1mDJLJAJ31Ym0xlDP3U0WPitkKGGshrSrDiS+/vXqQ2IbenAf6e1ic/ON
         h5c3qW7ns0exs9E+ZEtDgnDF2o+WPD/UNZabl7JwpbTrTPAUmu37ROoS5It7JQI8VvHw
         HrX1cc5DmYKZ2FwkOn1tffFQTidZBNLx5b3oVySTk5NI2rk2Q+QrJJC/fvAQT5n3vtT4
         p2KuvXxBebOhU/9TBqCQ5k3WQw49KchwwpuMq6/8SrKs4SqXY/f3LkKejK+l78+LK/bz
         jdLg==
X-Forwarded-Encrypted: i=1; AFNElJ9Cl1Y1SsVXxuQWzpobTxPht3KqNJg5e0jnMjSiMxxixJ0Du7BDDb8zdqYv9HQhQbICgO5mAW9miRjf@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbJ0yDkfDNMhdX5KyMtBsQcS3v9h1q3LqQ1qr9TPvrfVX83ml
	+bLtRJDG8nIKDcz58q2cuxuk71Gdb6gsO41QWrFjyKrhI2+LLraCLq7oQ6aKLk+/BbjU5ze9jcz
	FPQHstDksaaKHawnVf/1dI/mOLokvO4E0QkMx0g2FCktJh1r6jEuPHXBCGIL1IT+J
X-Gm-Gg: AeBDies/wliZ9SUzF2fCh434B4MsaIeKUdKVqQ7Kn6A0AGl1zvFD4RWacf8lDIMAH0F
	t/Oggu3ACzx5I2kyOWsyyujmYkIXqWYmD2eClzZuIoIweQIgTUq5+rJupHnNTu7P+VIdsQK7xIu
	+ajDgzXXv4nzfxO/mCAl8AxShWxz24JMzeQO/1G9JTwynAh64DWtD3tKF+/ugp/EJgvxeWEUSS4
	ml6HY00rnW0TF/NkTGzazS8vTXGPezVCmo4ywSm349ybi5qXJcEX0CssMspTwxs7OsNbyeYkBVS
	iyI5BHjjsIlxiG5SkP0240ivEsIYhRP/VadRUbsDgyYfGQaYaf/3ksMkX2wo0GpvSpF+JkE2Hfc
	EXawqzmCulUkI5leOijMGds6g2IFaGXunf6GyCWI5QKG3rISGvyVUTc4cpHYb
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5100e125f80mr91208911cf.18.1777449051205;
        Wed, 29 Apr 2026 00:50:51 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5100e125f80mr91208741cf.18.1777449050819;
        Wed, 29 Apr 2026 00:50:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:668a:d11c:cbb3:a94f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ecasm3918051f8f.14.2026.04.29.00.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:50:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Maxwell Doose <m32285159@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: sim: Replace sprintf() with sysfs_emit()
Date: Wed, 29 Apr 2026 09:50:48 +0200
Message-ID: <177744903886.12633.3965286589243118427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428113439.9783-1-m32285159@gmail.com>
References: <20260428113439.9783-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vqXY3UIJLYut1CkdjNJTgzux8yq0aSP7
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1b85b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hDvYjlUNnL32N1frkQIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: vqXY3UIJLYut1CkdjNJTgzux8yq0aSP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NyBTYWx0ZWRfX0LFys73/YQpF
 OdfTjXtYYmhSMQi0Ms6udjwtzIu1DhRUBAu/8mdSIdpw2PApx6DC4/JYDVyeeZ7lgW9jnJ4KYGQ
 j5pIiiPdsvxj5F/oKhtm6blz/w1uKL7yD96TcgcpTAQFfYOacQYU1v3pG29KvPlGZh261yKQc95
 gAHC0qX+UQnLJj0PnI3Qd5MUUWctVRmFUJGy+hXVcn4dBYpD5RZmQ+KTFov96DYblh4EWMzh0JJ
 stzgvnS4BCDcNLUyBAWYYVBTMogpjScUi5RGjb7YBu8EAPA9qAG3jX9DO5dchqf/WRJ5w4DcJ6d
 TQw54GCVQBlahPTfcqJEbbHR6+FA25nF0dzh0YxJbQFtQFX/NbzjE6tUNylqdP5U9J8C3yEGI6L
 7ij/djR6Vc1d18j+La6sbLd/9JZQyV1pnjqSrA91ea5ailqddn93wG7H2zeDXQl/zV0rjJ5SKoQ
 m72hzT4t8ezgLkXiaLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290077
X-Rspamd-Queue-Id: B5E94490D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35775-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Tue, 28 Apr 2026 06:34:39 -0500, Maxwell Doose wrote:
> Replace sprintf() function calls with sysfs_emit() in the configfs show
> callbacks. This will help harden the driver and will bring the driver
> up-to-date with more modern functions.
> 
> 

Applied, thanks!

[1/1] gpio: sim: Replace sprintf() with sysfs_emit()
      https://git.kernel.org/brgl/c/be22c0f7f2d573addcdf3a92f8aaef7a45a8c133

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

