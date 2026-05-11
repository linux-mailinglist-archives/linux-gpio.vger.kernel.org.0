Return-Path: <linux-gpio+bounces-36508-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eERQDHyFAWoFcAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36508-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:30:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02150931F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 09:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEC37303102F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 07:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7E438228F;
	Mon, 11 May 2026 07:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxWnyf1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUn+jnpW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C81D3815CF
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484366; cv=none; b=U8zvZThz2BXG7DceSoM4+3fPQBy8t9Wxc8turlqlHVdFFWIqq7yqKo3xTgy6sn/YIrkYlrSVyvAZjY3qw17CAXTD0ps1ZRZ0TlxmJFxP2sg2Oh9RtxvLvpmb/maKizjbK5C9ccrE1YhtSWONpbAFhrTfIm4taz54gjyPURNB/dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484366; c=relaxed/simple;
	bh=hkS3MGd5vdH6MTFE3zmkhrklxC7+m7j4op2aa4ecEyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbWUIYdCeeWw9uxB6YAXbq0xlE7oykuVwyPorSI39xUrLz/ztn+z8xQAEzIDevS16D7xVoqJJJJ1tx5Kq79O1kVx3r504dnIcdfaisnxXgvNWgftsmst3qwxkkNeYW4Gmkauy5iiHRM5b1VEG3wU8a8JL8aIrnUnG9CXTMXPRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxWnyf1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUn+jnpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gdpP775058
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MlewpCeDeyZ4jxE5CUustr
	2f2yGW73aObsLOlDvSyN4=; b=HxWnyf1BEKSq+8HrMj5xMRPF2YecnOTWouRQjl
	oRKduwxBwtOmWIk8/Htlp14yHmUI9KKGMf5POXXp0G0Tif/mJU3JaSnHoQkeqceL
	uGSBCoynaOWwwxtZv8SpBhXzn5UMj5DWUKnZaJ9A3vx3zvbWP/uQ4r7iylS3K3Ws
	r962lz8mDkX4jbDfLBZKJ/bMLyG2PcObLond5Mx/l4BV33byx2F1mauwb+BlSaQG
	fpkBowMaj94WdTAW9r5IdLMzXj6PNyt6EMHyS0NOk/BRsp/kz0Df+oG/G08/ut82
	IY9Qo9+kaB5KbnuQbhxBXCBcsIc7QTXjtcsvQAkdC3N1Yp0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32g4pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 07:26:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365c5ca76fdso3083257a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 00:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778484363; x=1779089163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlewpCeDeyZ4jxE5CUustr2f2yGW73aObsLOlDvSyN4=;
        b=hUn+jnpW5GJtSZ89YvAOx+NazZ01u8PvQvR5IKoEdL4DQBtohGhtpzsJZ8B/uN3t1F
         +8eFskzPiUkIB7xGkT97VD/pGSLiU2xq0UpRZ5MNsUR9Z5BFtD3b0pv0aFqiIhsTHd1y
         EQf55x+TN7uMpKVmSaqb4XA+Q9ksRePqn7m0p0voh9peykeKATsC+uw9J7Gm5iiNYij3
         nDEpD87YDrv5TtV2b1V00C731tSgLc5Z/17V26sBUJ2P8CdJt0wMq3B5Vzae4mXjVuSP
         UO3XP7F6D3kRm+7Ke4o/8i8LL1o7CNwttITXbEZ7UcsEyXMeYtweZT4/TybYh671A8JI
         f4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484363; x=1779089163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlewpCeDeyZ4jxE5CUustr2f2yGW73aObsLOlDvSyN4=;
        b=dF/ie9GDrZ5mGWkxOCjBTjSugGpsbjprVOwppL2yrIVhIxtG6xa62nQDW+3VJ6YNpH
         Dk/ZFqcdLdhhTORb3bfLRWyldmAMo8QZl75u0167huyIqNV4tllLIn/ckpbpU5+HRtRm
         78zuwE4OHPqSYHsGhq+CGy1ED9BKXI1oEFljcs+VUBbo9aYQoXbq2QCy0G1NunqA8Jbc
         yxHEZKaCGerEpcN8OsKTHm/QTJEpEZPBkRGGIL5+k4dIeM79EDSyEcsgBV8EQkwLPQ1F
         qumRs/5KjyeiNSq/RWNKunTbS0DT/6EvqFw0wwh59jCRk+XoEUA+BB+SPZN0DiZM71g4
         +CVA==
X-Forwarded-Encrypted: i=1; AFNElJ8r7lygu4Rhdi60RZbJc2jVKYYvK8K5AXEB2EKoUZ1hntDCYwnfbYNyITaak5kjbAsDRssFvNZy9DDB@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5vnNhgPsCyxHX/UpCvAl0J7R3ego3rnyHFoUeiMxA62+NEId
	fOKXNviczAKoq0nzj+0WhIz0b1v2YWDXIKInBUYvSgceudLnAg9qsP+wgWJf2rrQ/gypKqljXAH
	6OFxn95Cj2L8wBabgsS0Xt79tQhGidxmsoACxaNyZ2F1BdQIEQrmAde0s57gg1P+B
X-Gm-Gg: Acq92OGot4HpvswMNGiOnX4KyAaQzAqSweB8JAQvfKMQlf88+mCK3kL+0csk9i+/E8f
	HTynRQH/kB4XKaxRurhF9KHjLOwyoWGrL+KtPzmstl/tQneNDeeZo4SkdGJNbqXzs1vBbQ75mSd
	KED7mgeAD38sHogFW+leQBZRgpAhurwBa5voob9wZnVRLj6UpFsS94D/mm1yN2It9D24l4i6lEe
	AqScxj5NuLdphwT/DIctEb9QoKuiStZA3V1jQt62xfeFOy9yEUikqhKMx+PIyrUvagfIqQLjBGQ
	ngiep9kPzCXopsMd8+IhUFP4B302utDtVUaApRnLBkvRy1HJQ3Y7mMgRrJnC1pw8W4EgYHxfHn5
	IeVkcWI64SF8VJ226s5wun1dAc8YLyTfGuhBRCdlnxNt4S1ENfeL8zziP
X-Received: by 2002:a17:90b:3a0f:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-365ac9913f3mr22736334a91.27.1778484363038;
        Mon, 11 May 2026 00:26:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-365ac9913f3mr22736304a91.27.1778484362279;
        Mon, 11 May 2026 00:26:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367beac2c7dsm3314306a91.5.2026.05.11.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:26:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
Date: Mon, 11 May 2026 12:55:36 +0530
Message-Id: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCEAWoC/3XP24rCMBAG4FeRXBuZpDlM92rfY1kkTZM1rJqaa
 FWk776pIC60vRmYgfnmnwfJLgWXycfqQZLrQw7xWBoG6xWxO3P8cTS0ZUA4cMkYCHo1vy6k0zZ
 fui6mM/VSWNEYw9BKUra65Hy4Pcmv79LvQj7HdH9e6OU4fVl6YvWSAhVKOKY9txzsZ8x5c7qYv
 Y2Hw6YUMpK9+sfwGUYVRoGXyHwtOMgFRr8YBZzhlNGFgVYorLECDnqBwTdTsWrK4PgUGjB6DIx
 mganfjIAZpi4Ms42zvmoktnNphmH4A5TFEF3SAQAA
X-Change-ID: 20251104-wakeirq_support-f54c4baa18c5
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778484355; l=5027;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=hkS3MGd5vdH6MTFE3zmkhrklxC7+m7j4op2aa4ecEyw=;
 b=WpbV6hfanGgjrUU4ds4cjqfOu67pGorwdJjQAGb2fQ0schkPvEwSFzrk45M421efyLP9Ok2bz
 uNnev+zSyzbBoyzXuxuSmeN3N6qN9tYC72LroRanV4EUob10cTu4Nvt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 7uIIvN1rAh-74gPWoUqrTqo-ZIknrl5h
X-Proofpoint-GUID: 7uIIvN1rAh-74gPWoUqrTqo-ZIknrl5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4MSBTYWx0ZWRfXzUvgXC3XvxLN
 2ibldSz+9QsPMsEHwEBVHgxV5SCgWM6ij4oKY7mwsnYTGeMlDsKP3AMjnHcDX4PaWb+Vlyvy+aJ
 jdBZUJxvbPKGn8UhXIAeCtNkKec/pBBo3S9xVlJPVVohDo/NOpz8fHMUdlIrErXl8CI4f82EH4d
 bkcLahAmUMMRlRJWVZH/PqDpljC6fNngqVYIfkDcFdhNObJirYiXOVP8OnowTXt8zaRemVfwrKL
 S2hWucrXqgEhHFIC41uiSoL01W7MjZpMoWe0FKcNn2Ther56GBaHFS+jGTvb6zUIkGTCxUrF5jI
 Q8xGIidbLA2bUg1qZ9D2DibQXvsmemV4BxjdY47A14lELCG07tp2ZSr3jAtdq85kIv3V7xOKnXd
 2V+qn6sVkxlpHwjoqllj7K7d9fNj5rtRI9QDx9PtlJ59EdkZpHFEtl1nseeocb6ZvnZTfp1pZ4I
 YmK8pprdC8pOgeguUag==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01848c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=5_YdMucviHHNaXn7sfYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110081
X-Rspamd-Queue-Id: BD02150931F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-36508-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

PCIe WAKE# interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add WAKE# support[1], [2]. Those series tried to add support for legacy
interrupts along with WAKE#. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ.

Bjorn,
Can you take this series through PCI branch, once other subsystem
maintainers give us ACK. 

WAKE# is added in dts schema and merged based on this patch.
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v10:
- As sashiko pointed, shared irq has plenty of race conditions.
- So we are moving away from the shared IRQ patch and registering with
  dedicated wake irq only, as part of wake irq the link will come to D0
  as the parent controller driver will be runtime resume first and then
  pme service will kick in wake up correct endpoint driver.
- Removed device_init_wakeup() since it enabling wakeup explicitly,
  which is not intended as this should be set by endpoint driver only.
- Link to v9: https://lore.kernel.org/r/20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com

Changes in v9:
- Call device_init_wakeup() only if
  dev_pm_set_dedicated_shared_wake_irq() succeeds (Mani).
- Change the IRQ_TYPE from IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW (Mani).
- Link to v8: https://lore.kernel.org/r/20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com

Changes in v8:
- Moved the stub functions under CONFIG_OF_IRQ(mani).
- Added the description of how dev_pm_set_dedicated_shared_wake_irq()
  works.
- Link to v7: https://lore.kernel.org/r/20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com

Changes in v7:
- Updated the commit text (Mani).
- Couple of nits like using pci_err instead of dev_err,
  use platform_pci_configure_wake(), platform_pci_remove_wake() instead
  of calling directly calling pci_configure_of_wake_gpio() & pci_remove_of_wake_gpio() etc (Mani).
- Add a new fwnode_gpiod_get() API that wraps fwnode_gpiod_get_index(..0..), similar to
  devm_fwnode_gpiod_get() (Mani).
- Link to v6: https://lore.kernel.org/r/20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com

Changes in v6:
- Change the name to dev_pm_set_dedicated_shared_wake_irq() and make the
  changes pointed by (Rafael). 
- Link to v5: https://lore.kernel.org/r/20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com

Changes in v5:
- Enable WAKE# irq only when there is wake -gpios defined in its device
  tree node (Bjorn).
- For legacy bindings for direct atach check in root port if we haven't
  find the wake in the endpoint node.
- Instead of hooking wake in driver bound case, do it in the framework
  irrespective of the driver state (Bjorn).
- Link to v4: https://lore.kernel.org/r/20250801-wake_irq_support-v4-0-6b6639013a1a@oss.qualcomm.com

Changes in v4:
- Move wake from portdrv to core framework to endpoint (Bjorn).
- Added support for multiple WAKE# case (Bjorn). But traverse from
  endpoint upstream port to root port till you get WAKE#. And use
  IRQF_SHARED flag for requesting interrupts.
- Link to v3: https://lore.kernel.org/r/20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com

Changes in v3:
- Update the commit messages, function names etc as suggested by Mani.
- return wake_irq if returns error (Neil).
- Link to v2: https://lore.kernel.org/r/20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com

Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      gpio: Add fwnode_gpiod_get() helper
      PCI: Add support for PCIe WAKE# interrupt

 drivers/pci/of.c              | 72 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c             | 11 +++++++
 drivers/pci/pci.h             |  2 ++
 drivers/pci/probe.c           |  2 ++
 drivers/pci/remove.c          |  1 +
 include/linux/gpio/consumer.h |  9 ++++++
 include/linux/of_pci.h        |  6 ++++
 include/linux/pci.h           |  2 ++
 8 files changed, 105 insertions(+)
---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


