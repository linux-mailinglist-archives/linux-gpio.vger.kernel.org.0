Return-Path: <linux-gpio+bounces-35095-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKcABc/53GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35095-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:12:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0E3ED229
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C661B306A934
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975A73D47A0;
	Mon, 13 Apr 2026 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvOJjp52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdmqXb+a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F23D522B
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089137; cv=none; b=etRUGL4xHchMG6/PAbbz5nI59nCcZS/BjuTowkY9flVlxX90jWySWDSZASKqwWFAihWr2UIZpBQgLcDu7DL1uWIsQ8EOmravA3hjKQoxoRnmTkrngF2QzQRP+0ZcNsPiQ73LzjybqjS6I2GE6luiWljIzmHrQbleL85sy8LpOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089137; c=relaxed/simple;
	bh=wEdTAfZhA3dRyKgeejvoD2oVmXK92LCOSWr9CbXRIC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jYj8LGH5nrsd5sORzUH6bBQiI+RsNCYD1C9uxOjVVVRv9VnVdrof2Xx0wqPi9iEy9EJhUr0vWiQl0GQEDCzeMp5CYxGy5HbI13RLVAmNNm6JuDp2VHs7oriNYPjfztYL29Ftj5T464mQ4OcunerJtf2yGBXnq/tmBGzGqH2N82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvOJjp52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdmqXb+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDvksG479893
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jw/M6fkhmg0a+f6VUfUMit
	ttuOygKbZKhL1zBRtA9yI=; b=OvOJjp52uEvm5Y5DDLq/CTpd4HC6BFWItJGbu6
	otX9UV6voIlwUO/2sJW7znm2ZwGZ7MTUaq6BVsZen6hZKrSp4Jl38I45LQRlebUf
	IJyMe77todaXzBqoGqP8Etdfe+CRA5khumz2lsIVKxRsX+odFMQu4+CLSnohFAC0
	vh242/Har2Ra+uOuF+C8mb1b1XGYTpfZQKeyvDk62SBTTV/9yTT4dR9VyKHqMaAf
	2HQANFRtrV3VmOV/WSGnQAkUjJQlYfUTZBdcQq8V+L7NoX2yDBrjOSmWnkOvki6k
	Sj+TflhI0mnQpB/i2kPMnicSVD2MIZiGj0uasV4FFmEaTULA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9dk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbd50dee52so10337068a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089132; x=1776693932; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/M6fkhmg0a+f6VUfUMitttuOygKbZKhL1zBRtA9yI=;
        b=HdmqXb+a93h+6NtM8JmwvFBbvdioQd2bVX2XLOFr5+Ps+KohZD2j/SOhcGAeZf/gPg
         eOYR9MlaJLBTo9C8Hl1hJpydmjqD57T+4LZvmR2SVEcuUPmd0PbVPBZaZRob1j1SFoVk
         AMEsRTg7cVaQOSuI2ZAddW4dz26RSulCaAG5Xda4lbUcQvaEyH9eZapjN84Ill50+cqI
         bi+wSY6ieh3gh0pfJO6+vvFjzPDEwINlnGaa9CZKGwft9w1liKhc7wq6mY/lx2Lwylf6
         s4B7yIiyZUknz74BHBp287jki8qS4ERROemR1Pi//7MlEW96UQkOsoQ+ryVB4VsYsM02
         +tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089132; x=1776693932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw/M6fkhmg0a+f6VUfUMitttuOygKbZKhL1zBRtA9yI=;
        b=mk618rliH3VmFqnrg8vz+0E/qzK/kMdJ0aebtZI2wYWutOxODVsGsFnqXB6DYjto13
         6LXsZbs7Jb2WPdICUTDSGDCTgubP2WtY7oMwNdv2brj2/3/4Vxw4L2RemCvBZ1fIIjXI
         sBEj36BuLbcZGpJJPJUcPoo+X89biITMas8ndnznGljsgfwGSO54n7cFqUgFcWo5rsLv
         u/vem4B6l34e4a/7tmAT9ibaUWoulTwQIWB+PWmViPlClQqnHV8fzSnmajBRYVGHYbgP
         +EQCey/Adm1CQ9LH+YndKm65epOY1eTGzVzDFIHfxsbxFZwkijFgUt9Lpwi2q/F3djFG
         7A4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HfNa297UTvi/DKGZxZvqHRBXyiFIzl6KSvdXV+xLUuKXKGILf7jzeLLkE7yoLaBmzw5rWapZp334x@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zVtIXd6k3SF2S9ZRdu3FuyejvGa+Hk/PMtF9ETBZKdrGKtSZ
	STq4Bjot7lF5vnbiOVfIJGuARATJfLTwzPuNCK8ezAZpJXGgHVK7VJInVrmCVrjP1YKOjGdXfDA
	LqV1VnsbdGtOQm67vNQt8DOVBiRn0XzWkmmOR3gzC6Cr5INfRmQ2faJMmE/Q/jIMS
X-Gm-Gg: AeBDietRATralZEUuOQJhnxGjNHlru0+n0u8SEPtwGU9MSUcDL2nAKeIgUi1wHVstY9
	voVbyfSKTXLbXUdwUWVig0neD9BpKcjz6pA1sLhQpbqaEdLjQRcl261fsooKR/+F1mehdaQs+/o
	m9VhyYhtfIAJR6iCQdWF6t25MFQimqp3JYi4DW6sJc6TfmpqJO3SPtcKxZDDOoGZfXLiparnJB+
	OVOrDBHfUAVNYwXttgMw2FEebkLLEhu42crG6KhpGLUxngOrpIGJVwt3wNNV4/UlLcq+71CgNcd
	l1GYdiAYdaS0NL8DAUn5kMGBjD33X7/YIylNAyO9NiN2AXo8HwVpP9idpa/1ArxgfvbxowywovD
	cXZedzwtFFBE8KIqoM93DZkPjb/wXbdJ7LohQ0mWpwbKSxk9C853W5DrOaUtRbwW9RTj8Eq2S8a
	VSq7azFYTfrwX2/kh9UN8OSZWXCCZ2KedSPPY=
X-Received: by 2002:a05:6808:d4e:b0:467:13b5:8ae6 with SMTP id 5614622812f47-4789c847f10mr6644069b6e.4.1776089132226;
        Mon, 13 Apr 2026 07:05:32 -0700 (PDT)
X-Received: by 2002:a05:6808:d4e:b0:467:13b5:8ae6 with SMTP id 5614622812f47-4789c847f10mr6644014b6e.4.1776089131622;
        Mon, 13 Apr 2026 07:05:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/21] drm/panel: support Waveshare DSI TOUCH kits
Date: Mon, 13 Apr 2026 17:05:23 +0300
Message-Id: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACP43GkC/32NQQ6CMBBFr0K6tqRTKQRX3sO4KGWQGqHagaoh3
 N2CGxfqZpKX/HlvYoTeIrFdMjGPwZJ1fYTtJmGm1f0Jua0jMylkLjIB/K4DUqs98posH9xoWo5
 QQKGhaUwmWPy8emzsY7Uejm+msTqjGRbVsmgtDc4/12yAZfe/EIALrrAEKCulBWR7R5TeRn0xr
 uvSeNgSCvJDBT9UMqoKZeoKtVGg8i+qeZ5fzy5TjhoBAAA=
X-Change-ID: 20260401-waveshare-dsi-touch-e1717a1ffc40
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4231;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wEdTAfZhA3dRyKgeejvoD2oVmXK92LCOSWr9CbXRIC0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmJKF3OmQH1Pf6JKciyG+7b56afxoPJdlI2
 4/U/TnbN9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1T64CACv/CiSlNnPJd1kNBob5X55JIYxKmStTn8ebkJWcVcKFm/q4MWr+1aVntdfd3BHbhOpxV7
 1MZpSe4DPvW+NZQsKdw11AUkv9D44LRnEeyGMav27neOQfRyQxRJtVwcWzbTlJAtsvxXV2hM0AL
 JRVrxxp/193oCoVZ0uvSqCdc/MZ5yJ5kylKzadx1rekxpEDfLwqWCh9k2/0uVsfSjK8+6m9uKq0
 kok2mECUudNoh6JhXkfWe+zeNvZVbJXOyUypI/yMvHhInUGgNalzT1CA6YwRn1tSFUhM5cwFlbM
 P3yLBgip9HtumdM/8QOg9UjaiLhkufol44Z70Zo++TKCaqiv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX9jyWIKr3MSWN
 ttAXOUhatC+GnnKacc9jcqQiBVf2013WBMEY09NPeVU5RTTY4VDAtlbcpxQRdMhDqNB58E1bJTM
 G4Xe4Gpa/BuO5L/BGshNp/LSboQ5Tc4DieX0hDqKZslhhkZjWaTyeVpZOlx7M5znHCj4WQUdiuX
 v2lQdBGad7ETlFKV6tzsBvgCKv6VTt4gB2TmyGn/CicOwg1MhhoerOmr8F+TByLjQOdrmvtfNo5
 9GzGKD/hzWKk8ltCfiy5pjUqP/h66I+VL43iwa+8GulcS/Un47mE8Mexa4eB0U6hY5h+ybvwM0A
 WCwOUN9lTQd0nNNDlMUjB2sriC3W7m+l9HbPy7MnBxgCzAUJS5tDkAYHdFdzX47WOZVSajmVRJk
 yDbLvoEWnlEDeH102KyHtV9JRDUAUyMPwzaNG/B731HpuzT10DNzFiJzJH887KirGrMh0L35nyO
 G9lAZFfPuC8PAl6xzow==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcf82d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=DTMZbMRqsfAL1qRoJ20A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: TpzqWY7YEwsw0B9EPcFue-u873aayGh5
X-Proofpoint-ORIG-GUID: TpzqWY7YEwsw0B9EPcFue-u873aayGh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35095-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DC0E3ED229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fix another typo in the focaltech,ota7290b schema, sorted out voltage
  supplies in the schema and in the driver
- Dropped Ricardo's T-B from bindings patch (Krzysztof)
- In the Waveshare GPIO driver bumped max register to REG_VERSION (Jie
  Gan)
- Add a lanes vs config check in the JD9365 driver (Jie Gan)
- Link to v2: https://patch.msgid.link/20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com

Changes in v2:
- Fixed errors in focaltech,ota7290b and waveshare,dsi-touch-gpio schemas
- Split the JD9365 patch, making the changes more obvious (and
  describing panel classes)
- Cleaned up GPIO driver: moved NUM_GPIOS from the enum, switched to
  guard(), added regmap error handling, dropped
waveshare_gpio_i2c_read() (Bartosz)
- Link to v1: https://patch.msgid.link/20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com

---
Dmitry Baryshkov (21):
      dt-bindings: display/panel: himax,hx83102: describe Waveshare panel
      dt-bindings: display/panel: himax,hx8394: describe Waveshare panel
      dt-bindings: display/panel: jadard,jd9365da-h3: describe Waveshare panel
      dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      dt-bindings: dipslay/panel: describe panels using Focaltech OTA7290B
      drm/of: add helper to count data-lanes on a remote endpoint
      drm/panel: himax-hx83102: support Waveshare 12.3" DSI panel
      drm/panel: himax-hx8394: set prepare_prev_first
      drm/panel: himax-hx8394: simplify hx8394_enable()
      drm/panel: himax-hx8394: support Waveshare DSI panels
      drm/panel: jadard-jd9365da-h3: use drm_connector_helper_get_modes_fixed
      drm/panel: jadard-jd9365da-h3: support variable DSI configuration
      drm/panel: jadard-jd9365da-h3: set prepare_prev_first
      drm/panel: jadard-jd9365da-h3: support Waveshare round DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare WXGA DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare 720p DSI panels
      drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      drm/panel: add devm_drm_panel_add() helper
      drm/panel: add driver for Waveshare 8.8" DSI TOUCH-A panel
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/display/panel/focaltech,ota7290b.yaml |   70 +
 .../bindings/display/panel/himax,hx83102.yaml      |    2 +
 .../bindings/display/panel/himax,hx8394.yaml       |    2 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    2 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |    6 +
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  100 ++
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-waveshare-dsi.c                  |  208 +++
 drivers/gpu/drm/drm_of.c                           |   34 +
 drivers/gpu/drm/drm_panel.c                        |   23 +
 drivers/gpu/drm/panel/Kconfig                      |   13 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-focaltech-ota7290b.c   |  226 +++
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  144 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  279 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  251 +++-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 1577 ++++++++++++++++++--
 include/drm/drm_of.h                               |   13 +
 include/drm/drm_panel.h                            |    1 +
 20 files changed, 2833 insertions(+), 130 deletions(-)
---
base-commit: efcd474ed273ae7da614b30e798651c6d57d3109
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry


