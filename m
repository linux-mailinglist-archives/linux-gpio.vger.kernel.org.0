Return-Path: <linux-gpio+bounces-31869-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPCUIfY6l2l2vwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31869-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:31:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0213160B1E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ED0C300C369
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095BB34D3A9;
	Thu, 19 Feb 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6AQaImf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A08lDLlJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42B34C815
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518700; cv=none; b=gS/Srg8uyS1cxMGEsB2R4wcwHVU2Ac06d5SCk7yBHu/v6KE+mk6BSROzbkI6k7UJsDY7ZTI9g/VeXBN2e0vLjhz7madJAYWD1HRyTku/KN0gyR86ULA92JHh9O/23XzRHzp5wgpimHaomfG2UuvcBDnhkyOj/zye/BN+qCoXNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518700; c=relaxed/simple;
	bh=OXvGlh3LIuun63LtKHZFwnc5q1f3s01eombZh07coZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sDRKMzGA1ha5namRnc476zSaoken+I52+OSBXKN3UntBB0+TPU64uy48cVtUt9826KWEVqkINf28fZ3dfv7R9/yM+z4qmLlUEEL+ESsbVzYn+SEEpNLdKM8s8Xea1I18aXysMJcsGBBVdVTGoZZbuKdRjTm0GupcZXRpLdzbsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6AQaImf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A08lDLlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAOFde1288554
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UPNrrdpFAF3GiC0Pp5ubRA
	BSGdCCD0jkzyTmumsM1Zo=; b=T6AQaImf/3DtAjIskcRzGba5Z3x1nLO9XgBArE
	PBxA20FGtgHaXa5nFK4F5BY5+zt7JCqykxbEDxJRRYwvb+lTaVDVCnB46bnzESFJ
	5WY3ts6nn/BTc7QcdY92pqEQBX61r/dNvxFJzXNZXvq5RSKkDga397YKOldAEle2
	gSEv68MFpRZI4LIS7ElHPV9yLT2qERdO2onPeTjBdwlU+F1pCdxAbSDHCX5A7lYY
	uMiw9cq2kg2YpbgewninrH8Puu+nKlzMRKzre89kXXe13zKdqlbozNCEO45B8HA8
	PPb0fxZh9BDLl45v3OY0WpTKatfhffWcV9R5imGt5zbkf2ZA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpga5ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:31:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fae584a130so10316366137.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518697; x=1772123497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPNrrdpFAF3GiC0Pp5ubRABSGdCCD0jkzyTmumsM1Zo=;
        b=A08lDLlJumdYK4CSGqh5d253lJeoNpRqfqs27XpAKpBC4advLAxtTLzsl+d+D0VJD2
         poL7r7sddRuf35jEqbNGURwPRfeLpQNxUp6A9+/TB9/yPkujoAQNkfxfWkBYhOmLTynh
         xDfxjLFhYEpvtP/KlJ6CIUoaA49/oDZJiVc7McRzd9ZKHN2AtsX/EJgE/V6iNSE6pR4o
         hqY4i1NwnXknzGaUaWtYcV9r7wnfr4D1UxU2vYrO/uhkem9OCLIWOC+0pE7MKTAivZPu
         0U4l2NrQT7F5CvFQRdwpKXlTitz6ImBXog6vW7yd1Jwhro7kF8/Pg8SHh2NUmYE0lG46
         /fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518697; x=1772123497;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPNrrdpFAF3GiC0Pp5ubRABSGdCCD0jkzyTmumsM1Zo=;
        b=CbGyx8gVOlJhugnQHhmU5JU5xVD85ic+0O/L30nzOBx5bANWrTX3Ym+WCgxIKoRdTs
         8q+rAoSPo44b5B/dMYPBUiEeGQVP9DGkxmNreo6hEd3DbIeS43tr5CUgeS8H9g+NDQs/
         gzAaYCSWKpDGqP+Dv+9D7ElzMLnj4WyVds0R7gV4c1NhFdtnJL3z+yqqL/ozqcD7IO/q
         Eq8JBSmgnrMo5I9FbJSKVmI02P/rzb8At6tfwD+TkN5079vXQ2Nx7hfcQIQI1fCpsZJ/
         H1yTx/fPAmMpdMGsGJU59+46A6YSvQz7ZjTPtnAK0hU4ZSuXH9NPB0bFmA50asoaVTsv
         rGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFsjnqi7Hu89lrQOO17mL6Bhv6wYWw0hu+mcICxna+9na93NLE8zBHy/ah6NtcG/DbxvcIRPybNQtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRoyOzIKLHc13TnT6PfkuOAbvmFspvKL9Ct1ZiGDBW6GN8CIA
	yJYDz37d3qLXnfuDtepObQsTbnifKax+f7Gcz5NB/zIhBxucl2+KMpV76lNZZCLONxO1FZRLLwd
	0vFNpnsmnAh8DPKke4ROAGv2LrRfBqwjVEnC/wLq/5sG0dgnww6YPC+aWwyYqP2MYrTApuHbu
X-Gm-Gg: AZuq6aLfYFEQV2tIvT2f9arHCokg1CanjF+jhbjrZdeFFtNzilZxyad2BeI9fMl+mG+
	BJ7wxiEzyHMCk69nuTo7hoPTtL/1GgkQAd2lUisLszfxGH+dCq1sjkZ/nkP2UVk+dciZK9MxheO
	1HhCEzcE6nQK+I7A3/+kBdN5Gw9BC0Nk3YbFBKQtlEE3EqfVSliqXegURKb+vMvSuIszn0zx0Hg
	6tEyvW1+J7hxAlpge4OJppNSOLETY4MxyoryGN0pNCL19rM/xE/vOn3oA5wPgwu//WGbCBUYT6C
	pCY89z8ia6qRO3EUAfm1uJfeuxrKotCcmDX9mAETjG2DIheNwObaEtk20lSuGWZ7FfzNNTSt1RB
	4tN9nGg60Wox0HoLOXRomO9/6qL7+APr1Qe/tX23C7SGPsgB3RYgn
X-Received: by 2002:a05:6102:441e:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5fe1ace6532mr9326480137.18.1771518695432;
        Thu, 19 Feb 2026 08:31:35 -0800 (PST)
X-Received: by 2002:a05:6102:441e:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5fe1ace6532mr9326215137.18.1771518693482;
        Thu, 19 Feb 2026 08:31:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] driver core: provide and use device_match_fwnode_ext()
Date: Thu, 19 Feb 2026 17:31:21 +0100
Message-Id: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANk6l2kC/x3MQQqDMBBG4avIrB0wUZT2KsVFmPzqLExKItoi3
 t3g8oPHOykjKTK9q5MSds0aQ4GpK5LFhRmsvphsY/vGmhf7Egl4dZssnCExeJf+PB0henAnYvo
 W0g0Alcc3YdLf8/+M13UDNGYHlW8AAAA=
X-Change-ID: 20260219-device-match-secondary-fwnode-4cc163ec47ee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXvGlh3LIuun63LtKHZFwnc5q1f3s01eombZh07coZQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzrb5/3UQHQWtf4+bzNfAFj0d/mKFKU4BTUjV
 EJHwqScdwaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc62wAKCRAFnS7L/zaE
 w5VJD/91vYWltp7GEUgBtfnS4DMibJQ2JOFQgrna0QYZIQB0saf0Y2N40Gepj7kUao4RskfiEFb
 1Kz4BRJ8RNK7j1o2G4Eo767ICJitUL7yhjnyaohf4y97KqhuFF5u4w06O4PPCWK2nK0ZsfxvFcT
 dYGUnJelX7IxCqc5cq8+AVf52GnCRQl1L81ZwzA9JTLFPV4VJ0kmhmZwwYGGAkfxjbs4vLml38c
 U3QhkY/Urm3LcQyd3QtbQIHXtYaWx8Mm05ZyVCd5XeanEAhr7DeY1Ao6lOglAFnfQEgxsIPoRBE
 CIaFo07gpnjYuihUvf2sDHvUyuQfJJGU3d3+nhS/b2djfPhkZXfRLc7jsEG24HODDtypW2wI6Gd
 iHjykuSwTDKG5d4vpZAbDJyiaHe8q+5XIsEug7QsZuWfxo/b0D+Jqq+hkaAdgm+yGENBbgT6+TQ
 XXvqNmPuDMAx+WMqJ7om5+RHWOmiXuNCgXF0O0AurZSeXkWm/Q1Dy5nSM5sPAD+TPBjD8lUZ5pL
 TgstbvM3OIt3vmOKWXloSi5LYKYECV1GvchpLLQjyXL/fWlMNzqoTo2XMSO0UEULb3j6P+/BScY
 art7CnKpuh45jvCYV+zFcJbgrdr4fgRpg3oQuRvR9RYr+5qHal/iEwTAhlcMV4a2UM0eEkhZ6y4
 3+pViHQXuaZOdyw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sDqURIUmG97qVEijIpJHUWzscq6cKfiU
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=69973ae9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=pifG940BjlHurnhQwJ8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX4dmccag/g2dS
 pHhUvgH3NEaEWGPNf3YlulScSO5e58U5mGuCIoQKA6xDQ3aUI81oHLPpmLzL3g90k0hBdmnoz8b
 CbV9zKgQDrFhZKitBsjPlNX/j+8cDyJWVMYvseHHrRsDtTptFLFDIhGRYItm3i86iJHV0hW91jh
 4DHPRBen9jBdRRZXTge8bKAhUHV2SKleeYd5E6+rjoEczd+oqzW3bdQ47agLZtdhuwUf/SwNySK
 MkwCD+IQls8erkvecmJPtIJfFZeb3/MGIJnNK5dbIn02PQqf7T7H+MQ4npBNHJyx2M/me1pbky7
 Fyy8MID3OZszb/htw4MEzJm5WSea0nzZRQg2mmiafPnwTvbrPpvi14ZbvafkdK3Za2KEL4RrhoR
 nkpIpOS41SMLsBsdKFaS8nvKP+0jNgVTAtO/HNIPhnHmmXIDcRRsptrVKPBT9bvkwBv4UUMED7E
 a1QjNgBkWWaN12y6K+A==
X-Proofpoint-ORIG-GUID: sDqURIUmG97qVEijIpJHUWzscq6cKfiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-31869-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0213160B1E
X-Rspamd-Action: no action

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
providing a new variant of device_match_fwnode() and using it in GPIO
core.

Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      driver core: provide device_match_fwnode_ext()
      gpiolib: use device_match_fwnode_ext()

 drivers/base/core.c        | 14 ++++++++++++++
 drivers/gpio/gpiolib.c     |  2 +-
 include/linux/device/bus.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


