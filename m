Return-Path: <linux-gpio+bounces-39106-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gwwLILROQmoa4gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39106-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:53:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF86D9141
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:53:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zwc9TR1K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MOlst00D;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39106-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39106-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA743023533
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C896363C7F;
	Mon, 29 Jun 2026 10:52:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0574C352C52
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730359; cv=none; b=BOVIZBTN+QtHTFhj0+Df5UAcarRlhNIf87HpILXIaBhCNbGZiSAQXyj6zmoKzdAFhIf5XZLOGlHdG+rL3Ax9lYpOXrTWGdD3dA7dWM/rX4myieSXqkOcWY9lBoxfKzxbLYDxhJnBdufoS7Nx60StpnMxUG3TCUwBZrHTY/xSLYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730359; c=relaxed/simple;
	bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTIp/Dw7x4IB8vsBZXz7T6N4RL/6Kd6Nn3rX5AiFGM3hXQwsN7JzDV9F3OHCwugn8AY/mVfzIceI5vpdMl/rYnLv1Vqo54yEGUEc2lF1J36W+iXMT/1dnpzobY+3f10Y9w512KPUb2qdgDh9dhCYgCzrt2/jCSfbeb8TAJ/A0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwc9TR1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOlst00D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT2NH2646894
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U11R+DW1K0DvlVpS/+RfSj
	VuIxy07bAzTDI4+2onV5U=; b=Zwc9TR1KYTjrB4eY3ZST77cmoPtscEwvcdFIdU
	RnGt1rEurBsFXaFKisBuIxdad3VhV7rhcZ1sZBlyvi16jqfS0AKcKXTHaU4hXwKb
	232cJC9+iWgi1A7CuzAXuh6wIm0nPO6YrP5PjgH5fGfp4abkk0q9iLVUViyqs7Jd
	1YUUqyaIOAsVxc2UEyqZ2VYZMKqX5hAQbvEfSBjZkAimAdU+TM6mWleQpNChjYGr
	xa1C4eOZimtIZy5tdsVWRbAjCj8APw+IFfQM1qxZPQuNTMwd1WFyGseKe6TWute8
	fuU+Q2Pb4w14DXsiNUubKyRm2tiAcB1zqojxdF7/gYLdaxRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trvyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:52:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so498985085a.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730356; x=1783335156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=MOlst00DsTu8WIaShlxdGb5pRn2EF5Xdr7TK6rrT9rjRk14m4C7EEs11ATgBEOV/BL
         lRt67sNZLP/ZXAqvFU7xdc+5kw+tT0eZeHAJQaJ0mrOxKaWgvtkA7z31QPq5dD/rf0M3
         F1HeRImn2+5b/SWPzH2Ww4w3pmUJ3l1TUFWFPb/DaOaQBtEY6pfApx5583IJ/bu6M0xL
         9K34AXIJ9Clq0MTvoJJ5MZilckpKB8natWxSXMPRKYBa7Ti8ORROs5uyfRKIHvikX1Il
         jXlPvPsSUA+ETwJXJiPe8aSVGrZTaB5MntSzD20TnwavuzDOptztX04XYHzuSk0NLK0q
         RcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730356; x=1783335156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=SeRbAt9zbGwA2MTfljhtHBFhr+7yuvsQw7K6w3zEbr2VggAzfERfqmM2okF/+eMq1/
         Gi1LUvnom3wXUsZAjg+d2teU9epByyJxqmJvx0oa1hn/ckNHqffrWI1g9jo2ZOgOXahM
         yCQF1HWTAkhpBdGM5/RyilrWg/lyojSDN22ou86bR1FOSfWkC63vygdVvhSpBExiHeP+
         mF6wVb17l/m0XA2mIjvNACZJRxQK4Lsly/pFp9rRvrEO7hvwcERzm1M3e11BjIWilJUo
         mUG325tWK7uvqAD9M7qF7rszGJMfenZ7LnLaxXsDZVx08JX0GCTQZ8qS9abT2azo2N1H
         36+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8l1R07zdywvN8bVvwx3wH28HdKxcBbxldmJoe6vSWVq7UZTP4VK0GJKQx+DeMq4pkrVC0Bkp7YNOGP@vger.kernel.org
X-Gm-Message-State: AOJu0YySdAa8sOuNSpKP70rh8bVhU5JWZ+j41EhDF41jY98Kw8ALbt/a
	SygE2YQGmLDbQerMSFpV35nmizIT7co2mmEuJyNx4Fy9T4nkQfwvNwRhan1Z6WI5j/6i0d4M/hn
	RUUgGXN4dIRYPT6W9Z4WSi4Dy5KIjq//wnCNBahXfEydZNqHqouk7sO0gUOAM1jkC
X-Gm-Gg: AfdE7cn2Lzft3/q7HkFByv2kG3bO5XJSG6mbXHKNKs7g4gciM1b0N4nGtk7SlpXJo3f
	Umy6i0HrD4Mft/IwLfEath2tIyzl6Xz5zTrXan0cBHfu+8bxznImVvaFIK7FTrdOCGba1qabQzi
	HVbXZsq5WxcoyQDPFKYyWKSNktbYtgA6TbsXq2MPTPIIGrRe/4On7LtPgXy0RJiuSFw2d0t9Big
	iB0nL7nSLsP2GKPEhNXNY/BXNQRRr554I1VhBmDJUeYSpXSZ40IauqXr+88ppMFautzbaDSvVTv
	1SG4bxgOioO95yCNEXK1xvAUMTRt1fRnI6oT5csjI7sltojwHY+wwVXD7elRyBs4KEmBhRji2u7
	nwcHQYUV0W1OKAqQsNsJNjlpwk/K+dmsfXx1kiNBW
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126705685a.9.1782730356121;
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126703285a.9.1782730355526;
        Mon, 29 Jun 2026 03:52:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/5] software node: provide support for fw_devlink
Date: Mon, 29 Jun 2026 12:52:05 +0200
Message-Id: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVOQmoC/x3MwQpAQBCA4VfRnE0tseFV5MDMYKKl3UJt3t3m+
 B3+P0IQrxKgyyJ4uTTo4RKKPANaR7cIKidDaUprrGkx3O5gwflGlmtXtyExNUyV1DRVkLrTy6z
 P/+yH9/0AxskT72MAAAA=
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5hKkNN5givpV9eUSYn3bslTOtY9JHZk779k
 FSEh9H3gnuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJOYQAKCRAFnS7L/zaE
 wwiLEACBhoG1xU4psmdAS0pn+KXVz6t4DQGfGc+hRVTlE4wHh/cmWZ+z/mxF3gi41HRvkLarDvx
 8WA4Zuz2FvKz75IdPfqXvaN79NMGM0SdMmqxSAgxSmGmF/fYHU/ij9vIt9RcikytbUzR/3VKx52
 UVa3Ke5KUu1gAxdNKEnJB9OUpmhXCE6YPgfUR7G0ijjpEupO2ELYISJr6Mq0ofFC8JXwUTKPCk0
 sle2LpF+Q7P1/t+vmVz7TgBhy7Ei43tAl5LKh3nx2ptZx0OC/iT+mFlpKpDPWIkK8Lh4qTHGob4
 LHRXGYexb+brcd7KndwaIc0H0p3CsPn0XzY2X/Y4aNUYGfVoYZsTs2GQTTeePXcr4mrZQgw0QMg
 tQsxXj4z+LOx2sfE/bPLMCFSJ2menXFs7dUEF+zQ6tm0f3Gr+HRoX8fLcYa/bSqjzFWSFXUVIXq
 iB97XsOkmOyfDx9l9rtoQa5kkbTsDwDYamGnqEZhHwCe3ZHloSDscaTHe2CUwPqKM0X6o3Ax7BK
 oFp28nVLHXVi0bCO3OvOe5kYQe54XEm+8yPS2y6kuRpiqtxl7EV4uTUJfpXAZj1lRpvBQ4eDiQb
 zTY2wriaigxtCGiX5mR0XS1NWyC/wFHJoVGq7+8CMPg5qZeRrIYpK/X42TC1kYXiGLDB3z/Aopz
 BaMx9qR4Kq2lXQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX4sbsJUKR4bkr
 wjoAoenvyu7Q6DZosjwofx1s5vvgxeTAhc0JAjMihSDo9/OdwozhAYndjpAc7cR7g19w/vkgcOy
 ln7yEIpQIbbGxd8muUqvA/CAr7CdfK3yXCmd8nkpuHp2/zTzhPHCIfbgNQ7hK2Iyn3AJCaEikYf
 TkLdSWTIyZHTPamRY5lzHbW2p8UQVsWFGAgudw9ydQCjxNSdY6EaCXkHgfMrr/AgedIecnPsISY
 YbywHMg3ZzWZVZZ+vfoAe9B8+sJ/WmaAwHhOPxq5TQkXGonw0HfKlElqWQK44GsmHlK61ob3LJW
 Xdu6kBfxFLQCgg+jWLJRl0HqcS39LMX2N1IBEf6sXnqJMvVsNbhozCAN9TYo83GKALPuTOpxuld
 MxNBYx1v1nkkbVbRUS0e8s1wpj8vX44XcRy0jBJaF5Hhrmuk4EmuiLZuSc53iSy91UCk5kYwNDP
 hdIUX66KZEGO5+VZKHQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424e75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LOQarlIh65NSffUShZEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXxEtWBH+juUnl
 gerzjJLjA56lFo4I7igTqqt2LKovQXRecRlOlmkrX6IOoyAsfpPITm2qTtmwhctmjam7IBml2qb
 QcFhHjqAalMUB+6mA0RQM6L3gzZgVCU=
X-Proofpoint-ORIG-GUID: lKFZBrDpO7WiUhZCvBA4xGT0wuH-4xkp
X-Proofpoint-GUID: lKFZBrDpO7WiUhZCvBA4xGT0wuH-4xkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39106-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1AF86D9141

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   3 +
 drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 272 +++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 833 insertions(+), 7 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


