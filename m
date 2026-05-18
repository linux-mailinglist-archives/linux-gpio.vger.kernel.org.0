Return-Path: <linux-gpio+bounces-37016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B4/IvjGCmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:59:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4056847C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 574D13018F43
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BB53CE4AD;
	Mon, 18 May 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnplKjz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPQTvwKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF613CD8BD
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090473; cv=none; b=NS4elz0w+a31cNs72apRTarB1GZMVD0p9T+kWxqPWWvQhx+xt8gk7WVQkdOqg8G+wMqUdKA9h58KpKGknt4jzbWhDpnm44fgIlFHEIk2FGcibRTWPa6F50Fkx4nwguUhqmxKN3ntPBr14Nb6K96MB5MHD4Xgc/KCl+5hFptvGm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090473; c=relaxed/simple;
	bh=tQ5Rulns5TTwJdftnLFWdVkob5vr1S97Lahq6J75enk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHeuZjF+bZPR6oh2NGPQ+IHy3t70Ef11TfdtUj4gvxwcc3DTfkTE+b+/N+reiu2bwTqmtCS4tmhT9VpiDwuPh57ldT2onP89mEWecdjXl1ruqvJcl7TILQMubjmKc2nJupxpDD5KFxvdo3r5jzny0A5HZCrBtDkcWM1JVSEO3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnplKjz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPQTvwKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I1tKmU1697510
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XK0JcD/1JDv3Wd3x8VjOs3nMalz5dBJNA3rR2LQB8w0=; b=WnplKjz+vbDSfXeQ
	wxkKmyX0gyOwFwCFlaszIA9H2dAYE5dlzGTY2XseasraHtg5IRGUq3sv0p/GV+NT
	JSHl4Btoknf45l5DdtdBltP9xkXgL/cPsBJBkj1XP6dLBBOqxW4D+eHPfD50jfmS
	X5/9rC6tAvU26dcLHG9QKFtnl6XSv0JeGdW279QhLgaXiuGYBl3nmZmT67K469QX
	Ch3zrkeSNk9cEjmDgfV7ooo8UyYkRn2SENbyO6G7FNBz1odfyVUJ+6SXPGNzd4MI
	uSI6Fls1ngpb7TeqZhmndEKD+2O4XBsSqxS2xVd+NRwtFzpu1fQWjIxXdudWvtVV
	sEQKDQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g59dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:47:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8c9e99fcd15so67665976d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779090468; x=1779695268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK0JcD/1JDv3Wd3x8VjOs3nMalz5dBJNA3rR2LQB8w0=;
        b=aPQTvwKCUH4Ol4qHmL92Knsxw8LcZ4PIUPdxlKrYfGMOZgFtmzE2x0V2itzKOsXuPE
         CslJWWwvaEYjVedv1mWX9KgSbaAOoLLhb7nYnJDGnviNeBKtKIQUpxuK3JCPl62zXMpm
         zHbyglKq/KZwWAp8/rkDSuGfuxjTGrY+N0AfdAXv/a48G5sh8/W+EGKQDJKqFlJnqlQl
         8rPN2Hk6BQJjIqwivM88EKhGhCLOYAINE0E1pVx426oJkJmekXRZriXNc5E/EPI6Bz+0
         VqgjGuAlrV2IknRLH/1VvNStUXNVVEYHZwC37jGNz22IuydYBggMJembUk/2e89w4L+j
         TaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090468; x=1779695268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XK0JcD/1JDv3Wd3x8VjOs3nMalz5dBJNA3rR2LQB8w0=;
        b=l5Jp0bLFn4PIFTPU0WuoThRnEFm/U6Fd9lLm9XJAOoQVeKuZ///ID9nF3OSEJs1qsq
         iqzgQJdTgxf4wI4fqscIkaTU1cpccEVR3z/9ZGHE5AGetjGYPApkU2Op1jAEcaGFkKfK
         7HbWFkG0uHgo0Ng/HukzQP6PjlIHFFoJHE7P1NmhtwcH9PkAUHwSKgVVoUMGjNcc5fuJ
         PKSP7UBdf4KfiDAlRx7rhhFHdeRDV3LvaQU9QqdxryXRillaj3svQkczapnTqi8Wj7C4
         TDz+XduCx3K2vQvnCIiMxrmq6oLYaOM74NWPt96j49ZIjyXu9IHg2wBnq1p0XwzYoTLE
         ki7w==
X-Forwarded-Encrypted: i=1; AFNElJ8VEPFjfwzIgKCqYcHwKJUJkjUo22gR03XXfcUKxyfSv6I0nlLuNRVR4gp/nnsLjx7Zv36hxbriHiYr@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzHsSJb5cgUXLkGcReAGLRQo8jrQ+GMvoyq9hic0w8zVNSEom
	x6VmdjscH7HxxbSNyzjasS9AElpJMYR8+8YtzTWzoQGaikgoIrT5jXhHS1J/IhcqxQLz+xP1F2p
	S54TWZ8xOyhlRtOnW8vc9KtJ8N8daGbilAvVj4ksKrylki2zeo3aR/zD2/6uLZUHJ1KoJfZwv
X-Gm-Gg: Acq92OFVFra5wTzzNss0iJ9wsunVfvkRRpJvjalKybqaGKqlLZq+j9xDKf78LXLBp7+
	eMIYuaDyARgEqG/T5sMYA48XEn/ZfY/1ivKfkb0v8ShcOoRNYixNtApPLFZ3V49NnCmOrojxU5P
	5x0zAGmeuYGEs5x86RxjLEboGyfwbnmTaQ9dRfJQ3JLIBXf2RhocByNmiM8wvdKlQWfaREpDlBb
	0ZS2nX0Lfn+a5iD5UG6rEjgSMgHXG1HMURwIdjemG6PaIyImnNsr+5/3aXP/ajcBVDuZzaoMhqb
	ynRmk463gM4t6CsUcAfIffSvewu4kUcZQIGdX9yVp40EVGrySIWIWxYMzMYHbRklHdfuxmV5ONF
	bKrplb7suFkEfe6NwoEFBAlJH0o5mtzCV9Dl4qpupPQelAwoV2g==
X-Received: by 2002:a05:622a:4e94:b0:50d:b164:5e40 with SMTP id d75a77b69052e-5165a1eb73fmr173081491cf.37.1779090468183;
        Mon, 18 May 2026 00:47:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4e94:b0:50d:b164:5e40 with SMTP id d75a77b69052e-5165a1eb73fmr173081251cf.37.1779090467759;
        Mon, 18 May 2026 00:47:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b896:d8f9:d8fc:730a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b9efsm111061945e9.5.2026.05.18.00.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:47:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Initialize i2c_device_id arrays using member names
Date: Mon, 18 May 2026 09:47:45 +0200
Message-ID: <177909044656.4685.10308837875925010657.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512152125.924433-2-u.kleine-koenig@baylibre.com>
References: <20260512152125.924433-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3MyBTYWx0ZWRfX8310lH6e1Ivc
 ZzDC1NmzVP2e+FzAUyTaell2AxGzO1Nt7HDi0515UL80/fPrQxUGeLOfebrSNRhXCD2lUSiqayR
 gc98fbeH19J+J9azWpA6Mff2Z2BY3VWtZ9ytks6wwybWvjyDDLS6dhLlhY8gz7oVdFDhtJbqKFW
 wmrvvvsI62Qy1J1yAMTYPS8dsMIN26UKNoMz3e65JmG4261FKirosv6Ar3NjyYSFcf9f9IGmjJO
 M4BHYXk5djEbrxEx5qzR5WLLEOrxMuxrwz+uNzP2eDLTlPHCKU/j1fSQodV4fp44zUWLzHTBkWK
 rwrfRI41UGq8O+0npvX2KX3dgW+TJDGwy/qs5XzC+siaHalQt/kg9zg+gjXVxXZyKszCzjoQKZr
 1l9V6AxBvco8hzlmyNcJB4hfxUEhRVG0sLI3VTMRaLTY5Mx+cKfABgrLTmjCvTcXepmHNfdVnbA
 x3wJgeHmYXaALvOyW7g==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ac425 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s3NzsQVzbAGIezRmCTQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: bGmBizlRL0XU6VbTh9RPaHR2sQ3sJkby
X-Proofpoint-ORIG-GUID: bGmBizlRL0XU6VbTh9RPaHR2sQ3sJkby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180073
X-Rspamd-Queue-Id: B8D4056847C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37016-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 12 May 2026 17:21:25 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> [...]

Applied, thanks!

[1/1] gpio: Initialize i2c_device_id arrays using member names
      https://git.kernel.org/brgl/c/553e26a45e0e66698c1e0043b705933102ac3edc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

