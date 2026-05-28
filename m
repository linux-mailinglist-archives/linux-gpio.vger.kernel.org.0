Return-Path: <linux-gpio+bounces-37631-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB93GBMOGGrMbAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37631-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:42:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEDE5EFCC6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8241D3033598
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 09:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC8838AC90;
	Thu, 28 May 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndYcLC2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkNdeios"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422A2FD7D3
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779960960; cv=none; b=SaPSwCDYVNQLqWNzN634zfMABblj4IGt3oNDnENU8pqeCaglAU8VGOyBnG2lCwP8V+D6n8DDVy2v7Gb3r+gktGo3P4Aw9XMcNQP8PkZ8YHBZvfL38AurfodGA1DZ4gqC1Y+ztGSvxLmbnO4l4tRv7GkMHa9c67J4UE2E17ZztKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779960960; c=relaxed/simple;
	bh=CKB2usGAmEnigWTsYJZt/jI/OTkdl2M9H+/4EN/cq+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eXu9gYu5Ke+rsu05HId4l1nlOCRFZCEL4UujD0Sz/miMQw4MPkkf7mNnvSDYsMHL731S5KjnAy7+BEjFDQPOngjw1gfgkGdKyldtoSWSRGulEObNadknbckHzXFKodBJFMYz9hQEhDw+g0dH8UMoqxfR+bj7cJioGeVtD8pNCEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndYcLC2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkNdeios; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vLxI1562612
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1dVQwh/gavJzLpqi50Zt6c
	SiDWkTppplj9HGo8qsCbo=; b=ndYcLC2ACpXQEpAnkk0yqS/Z1cgUFmNJiFiI3W
	FJKFMFO5gUcE5T5xr50qc71lbCWY+Zf8xLUdq/xyljczUidgPUi3jk2jkBac4L+c
	rQlASvATIN0o4IurE5SPLUeYMhaikgjxUhO4qHjYacADbqShHVwtEaIg8DIDa5hy
	pfRPpKHqL/o+kyj8rSJj6XTMoE4OghKUYPiVML4yZHHl41u8lVwuQD6jpGQfG/Qm
	1sG6KIzVAwKaSFJb7MH8gOshWJkXPz5BvwLoKnbKZb9Y8wbCp/W5uSd8NnqUfRKn
	0OB8S0Dl6rvWrWP5Y9KK2ROu+PTA5cZADZszg1sG7GWbvQ1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2t77u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:35:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516ccfa109dso132263501cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779960957; x=1780565757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dVQwh/gavJzLpqi50Zt6cSiDWkTppplj9HGo8qsCbo=;
        b=DkNdeiosPQDjKd/g0X+TK3IbI053vz/8T4iGsvoBjFc5UGSxsVL7GMiHgIwcU6uMXg
         d/L66XAunH0am6ofobCgZE793N90Hz3ivBQzAdXmPGaxFEGzWoPYaBDwJ5J3B4DBGmqH
         YVxYTCSAupHOWnfj7os9+eVoY8aTqm5qq+G66cG5iedcZ3irjPSQXC04ev12Ile1IAtq
         f/dwvE3SKN4fwTLLvaQkH4WDXhkECl2pOUiGq8YJOaPqyLYu8YkYx4IVNt7K8OZ+1Eud
         Llb7WVGHKDBxg48jWpm5cQywxAXVfXgieuI91KPdjCmY4wvPbnKdtNhcG7SbqjDtVJRj
         2Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779960957; x=1780565757;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dVQwh/gavJzLpqi50Zt6cSiDWkTppplj9HGo8qsCbo=;
        b=d3YRhHUHEVCGWoh8oxaCkw0SSXaZpHUMYtD3BsUSYXS6dszG6xbHnSjvFgaqV/kIUQ
         GXgLCkuL2GoytneMFQ/2U0ErDTFIUKSOsADGBX9I8DZC0YzQ/lkPZHd0ZWTIxluRYKvg
         y3x8MxLesKyOZJ30eglZXmWhHBX5qvau9cfh/I1w/D93Bn7JXQ6unpRFWxj35SSygRd5
         Qw8nEkJm/DxYRSrkS4Jm1jQWzAkfft1rRDr8k1qZaJ5VlNWpOYrKEPNwtYJFDtKP00cm
         isBCMn6iDFaqProxW4NNvXA2bpu+Wy2SFVN+dYydePyw336rcadNvscd2GtZ8FvOf/8r
         Uz/w==
X-Forwarded-Encrypted: i=1; AFNElJ8qqv7smea1IaeOnX6EIM6EIbzC+QXWpYauatE8Mh0WtAf6/vf9wW27wdRS7qshQ5V38jx3f6ELD6Z0@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP1iTOns69XsQz6+dt7gb4ELCrKOHUsYIzVScCVBLIGeaxLef
	z2ElHxVKMgkOX+zMgraYnvHuOvQJJbYX2x0GOBFCkgtTnpb4QlyBnJHFPfe68Y2FfT+eTHzSmmO
	Uc8q7L3MXO2TMlD/2amzxJ+mVAx5kocYgE6MoX1HHXOjYY7cbE2xFHWdo5meKTA9c
X-Gm-Gg: Acq92OEQakp040sTRtSDYqYC7woICCwO/GcWKs/JvmzAnXy+TWskFP9S+LJ3xKMagMS
	etGMyBZUO762/SR0QxyOnH7LW2L69Jvo1h96WUE8BOR/PWvYgJXWHbhJ8mfZBZQt/720ERZOkic
	Jdxn/ltMhnhUjjhlsSVJHTQdbSydgi1mZ3vo3djU9/6UAqHmGt4n7eTWOE0KUqb3YjNbEl4+jUd
	W6xWCuF8KBdxTHkbemLCuckqjCW3et39fHnr5dvNCjiHFux2/Z5TpwgKsB1QPQx1/hZvBlCP6AJ
	r5rXLYsIGg0hCPF/VmMgJSOExQjFu2XN6yGFFGmq3/oGj+RXOvqMPO8f0Jj3D5Ste+ZeITV2/jY
	hX38K9NpiPDI6WStsWdmKU5qxhet9mkV/XbBaUiZ+tDo7IsNgXcLWfdTNERNzlfQRKoMbXvomQ1
	AiaSssUtpE
X-Received: by 2002:a05:622a:5c09:b0:517:146d:185b with SMTP id d75a77b69052e-517146d224cmr66219361cf.30.1779960957085;
        Thu, 28 May 2026 02:35:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5c09:b0:517:146d:185b with SMTP id d75a77b69052e-517146d224cmr66218821cf.30.1779960956547;
        Thu, 28 May 2026 02:35:56 -0700 (PDT)
Received: from brgl-qcom.local (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b19aasm13532945f8f.25.2026.05.28.02.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:35:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:35:45 +0200
Subject: [PATCH v2] gpio: shared: make the voting mechanism adaptable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-gpio-shared-dynamic-voting-v2-1-820837ce8cd2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHAMGGoC/33NQQ6CMBCF4auQrh1CKyB15T0Mi9IOMIm02GIjI
 dzdSuLWzST/LL63sYCeMLBrtjGPkQI5m0KcMqZHZQcEMqmZKERdVFzAMJODMCqPBsxq1UQaolv
 IDiCV6sq6kX2FkiVg9tjT+8DvbeqRwuL8emxF/v3+2PM/NnLg0CDXpZQ17y7m5kLIny/10G6a8
 nRYu+/7B3vOWWnLAAAA
X-Change-ID: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9
To: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6657;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CKB2usGAmEnigWTsYJZt/jI/OTkdl2M9H+/4EN/cq+s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqGAx2ZVNfmsKVK1jGq4E0T98iEyoXzAyI/L3or
 x3w2ZMd7OSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahgMdgAKCRAFnS7L/zaE
 wzJQD/0cnohUxQu6Y6ZlbDBgU+qmNCEjF+lRYDMGLYTw1qaO26T1owW1OHnu0RPg94DpRjaeCCv
 v1T0gX1Z+KHAjWg9byZpOUr9J3h4daJiVaxPDfqSoJHlu22zOkkmYfpXL6dM8Mq341cHR4lVFt1
 inJIzq3GTLlSwSIhcr/sXx9zfwhhgB6BYsM/IbPv7L4Lfo12bYdlh9BxZ3mZ4z6nwZCT0hb6Wo2
 iGXpiZg4A674tdikdVGE9KFrN6s1wuSnszwLLjjfRCq2gTJWaTCAj0jpjsC6WQcv16tCOFoYuBg
 Xuoc8xYaboVWWpBNCJ1BgIIz4kRoddunyaTFAXzvfw4TL29zPws72K0O8Oso1H4SJZ0dKDM5Jgx
 C0zt1GxgSrJaL024oTtT5M52/R9HR9/5iGQUfh/hXBTr9bHnVeV3m6iLZwY0d7KdSDfYnuL1Df7
 26Fwy9xJ6QOFN4E6bAspHIAaE1fqNCpV6r+EhCUMEt8Ml7tFpxfcujh9BSyEPsdQQWcJEGZvE19
 KG1rASRMC68EVSUwcSYHt5n7TwTxkqlJAs2MjeEHL5AAFtsdbITsoacQxffDustuLnonXjvhaGx
 ufwxZUxogwB5l6skbetODTpSMikArRXassP2bi1AnEn5Jml3XFp14GeaFZJ5bYqvCauHSti+9ig
 cx+gItHA8TOP4YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a180c7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=p-LfKV-GAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=xPBwYydNSgIom9yBtGsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=97BuGM4RKn6GwmfqMd6i:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA5NSBTYWx0ZWRfX0NrQvczd1Xlu
 yN4dIMbv9z4+Ba4kuOo312tdHr2Xa+7f35mYfUv2eyAGWNVeVkEvX6aZ8O8oKSOkeFw2BjgM6rC
 kQR5MDYZgoszT/rllCTSkN2h1yhGoTCx0vw90Pt0A3cMaAaB8CFqKfkdFpHrJtW3JNVelNq+Cc6
 smWhqNAMzPiH832RKuH2/LlZRLVUA8ZA52FEpRLf0p+JVT3I8b38IZlFycwxLozd6eGogf7brw9
 eHbLyut2hJjlx4lXkjHmLYdHEC16yCE9B2EtVJa6LZrdGK7/TxPl+t+gW891+bBuGcaVAi4vz99
 ILbkNJ6QmqXNMo5oqpK0dIhfFDahmVoW2oKmFxZkzEJYnRcnHPEQHGrka6IEqNltQBpjGTLLGuj
 jhlrPTP1RHJKq247SMHfCaG5Yb0iFxhubrZ9f8Q7/y2AtxrgNA11EA+4oBvR3/Somu9fmAWa+Uo
 qfHHyNit2eXJmmNl7Sw==
X-Proofpoint-GUID: bz3fcvbBBkVQc7naf1iDi3JOet5bCv9B
X-Proofpoint-ORIG-GUID: bz3fcvbBBkVQc7naf1iDi3JOet5bCv9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37631-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5AEDE5EFCC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current voting mechanism in GPIO shared proxy assumes that "low" is
always the default value and users can only vote for driving the GPIO
"high" in which case it will remain high as long as there's at least one
user voting.

This makes it impossible to use the automatic sharing management for
certain use-cases such as the write-protect GPIOs of EEPROMs which are
requested "high" and driven "low" to enable writing. In this case, if
the WP GPIO is shared by multiple EEPROMs, and at least one of them
wants to enable writing, the pin must be set to "low".

Modify the voting heuristic to assume the value set by the first user on
request to be the "default" and subseqent calls to gpiod_set_value()
will constitute votes for a change of the value to the opposite. In the
wp-gpios case it will mean that the nvmem core requests the GPIO as
"out-high" for all EEPROMs sharing the pin, and when one of them wants
to write, the pin will be driven low, enabling it.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi Marek!

Please see if you can make your setup work with shared GPIOs with this
patch. You need to enable CONFIG_HAVE_SHARED_GPIOS on your platform. I
indend to slowly enable it on all platforms and eventually make it
default to 'y'. Currently it's enabled in arm64 defconfig via the
Qualcomm platforms.

Thanks,
Bartosz
---
Changes in v2:
- Rebased on top of current linux-next which contains a fix for the
  shared GPIO proxy release path
- Link to v1: https://patch.msgid.link/20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com
---
 drivers/gpio/gpio-shared-proxy.c | 67 ++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h    |  3 +-
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 6941e4be6cf1871b134c55c05877c9793de52ac3..06593444d213d342df9a09e0cd514171ecc2cf0e 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -20,7 +20,7 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
-	bool voted_high;
+	bool voted_change;
 };
 
 static int
@@ -34,52 +34,54 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
 
 	gpio_shared_lockdep_assert(shared_desc);
 
-	if (value) {
-	       /* User wants to set value to high. */
-		if (proxy->voted_high)
-			/* Already voted for high, nothing to do. */
+	if (value != shared_desc->def_val) {
+	       /* User wants to vote for a value change. */
+		if (proxy->voted_change)
+			/* Already voted for a change, nothing to do. */
 			goto out;
 
-		/* Haven't voted for high yet. */
-		if (!shared_desc->highcnt) {
+		/* Haven't voted for a value change yet. */
+		if (!shared_desc->votecnt) {
 			/*
-			 * Current value is low, need to actually set value
-			 * to high.
+			 * Current value is default, need to actually set value
+			 * to the opposite.
 			 */
-			ret = set_func(desc, 1);
+			ret = set_func(desc, value);
 			if (ret)
 				goto out;
 		}
 
-		shared_desc->highcnt++;
-		proxy->voted_high = true;
+		shared_desc->votecnt++;
+		proxy->voted_change = true;
 
 		goto out;
 	}
 
-	/* Desired value is low. */
-	if (!proxy->voted_high)
-		/* We didn't vote for high, nothing to do. */
+	/* Desired value is the default. */
+	if (!proxy->voted_change)
+		/* We didn't vote for change previously, nothing to do. */
 		goto out;
 
-	/* We previously voted for high. */
-	if (shared_desc->highcnt == 1) {
-		/* This is the last remaining vote for high, set value  to low. */
-		ret = set_func(desc, 0);
+	/* We previously voted for change. */
+	if (shared_desc->votecnt == 1) {
+		/* This is the last remaining vote for change, set value to default. */
+		ret = set_func(desc, shared_desc->def_val);
 		if (ret)
 			goto out;
 	}
 
-	shared_desc->highcnt--;
-	proxy->voted_high = false;
+	shared_desc->votecnt--;
+	proxy->voted_change = false;
 
 out:
-	if (shared_desc->highcnt)
+	if (shared_desc->votecnt)
 		dev_dbg(proxy->dev,
-			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
-			str_high_low(value), shared_desc->highcnt);
+			"Voted for value '%s', effective value is '%s', number of votes: %u\n",
+			str_high_low(value), str_high_low(!shared_desc->def_val),
+			shared_desc->votecnt);
 	else
-		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");
+		dev_dbg(proxy->dev, "Voted for value '%s', effective value is '%s'\n",
+			str_high_low(value), str_high_low(shared_desc->def_val));
 
 	return ret;
 }
@@ -107,9 +109,10 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	guard(gpio_shared_desc_lock)(shared_desc);
 
-	if (proxy->voted_high) {
+	if (proxy->voted_change) {
 		ret = gpio_shared_proxy_set_unlocked(proxy,
-			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
+			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value,
+			shared_desc->def_val);
 		if (ret)
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
@@ -198,13 +201,9 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
-		if (value) {
-			proxy->voted_high = true;
-			shared_desc->highcnt = 1;
-		} else {
-			proxy->voted_high = false;
-			shared_desc->highcnt = 0;
-		}
+		shared_desc->def_val = value;
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 
 		return 0;
 	}
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 15e72a8dcdb138f19ce000a33d3f53cb8f140bce..f6cbab85c65fc979e2891d19b799baaf91fd6dca 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -45,7 +45,8 @@ struct gpio_shared_desc {
 	bool can_sleep;
 	unsigned long cfg;
 	unsigned int usecnt;
-	unsigned int highcnt;
+	unsigned int votecnt;
+	int def_val;
 	union {
 		struct mutex mutex;
 		spinlock_t spinlock;

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260512-gpio-shared-dynamic-voting-9aab4689f5e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


