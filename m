Return-Path: <linux-gpio+bounces-38859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v15KKN++O2qHcAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 13:26:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEEF6BDA29
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 13:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BsbNXGri;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RVFycnjY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38859-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38859-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA2E303FFC3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 11:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29F437BE71;
	Wed, 24 Jun 2026 11:26:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489722C21F4
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 11:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300363; cv=none; b=RWQmOSeF1r0Stedf5kAKmUlrfx7YbKTC7H/xg59JYtFZn/eH6K6of7liEF7V14fnLBbVyFiboEIW7UXHmiL3ieQZXFFCXK7jyrILB5neipjQkYJfdP3hDWaH9xQXZs/p1cWrVFyRRRZGxOj4m7j7RxWrCehQQ2NORnHVKMP2rNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300363; c=relaxed/simple;
	bh=UlqEJPDnLANpGaK/dBHE8jaHyoG1D+SwqpkXfmgtD/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gxrxezqTkiwsmucYhs5qyC1mdHEjZVvJgp7qOVdKrNtOneCAV9HA7w958oLV8wTZHMJ91+knuIFBrcaAyCYtlJV18p9OC91iG44MXAB9VUSp2LWE3x/8yEb10wDCirlDbLSj5iIsiZyGv2LzE5pJ+8CjHYQhe4MughsIIA9U2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsbNXGri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVFycnjY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANaKY2869057
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 11:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=90ylR7uLuQk3JCNdNWJu/F
	0ziqsUiDApUuvh6r7i4ho=; b=BsbNXGriNbXYvFXihowILrbpb9PohztNG5brKK
	06sAMARl7obJAblPvVBH3QYedMtEoPbA6fzuKIlBX2AdXjcUb35QWGtyCnRHQ7bg
	julHx5Vt56ntNr3S/MZNyAuJjItzpAwC3b2U0FdVMMRUAUF9L2uvjwxZJIxECMnd
	CVfBJCbh7RCOQL2Nv4Em7QPITRdOYXIbJmMwlNHor6S0gIQWU032xG3cnFTDTfna
	8ecC84yXN87iGOpu/4oLOvnVq3tfgKWQvcH8rYatfHY2nYBynTmT82NhiPD/S5Qw
	iN3uOXnF50/Rl4QhNAN9bXNE4/yTHpIpGQj/KA2Lt9B8AVEg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq0wx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 11:25:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84534f17866so931654b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782300359; x=1782905159; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90ylR7uLuQk3JCNdNWJu/F0ziqsUiDApUuvh6r7i4ho=;
        b=RVFycnjYmmAAWYx+kiRtV50quk100eR7yH4IY8GBDjiu4nldVDX2m1jw2Z7cpI+w4u
         aWDkdKQ/rzb34AGFgArWAh71HcqiFlBQmMaAMrMYWG0u++DiwEx5RBEuMnStfIj+G5mC
         8iaEuXhWFUMevkUiBpCGX3dhG3HJNdtrIhSc5GAjHHHA/sGAHfF6k+x0XmuYtrLMtRrC
         UMLuZFXHr1vqxlVQagl41djAwTbWiJNjpQH4xE/KMS9q8PWrrJBPfCjdfZD4NReIuy7L
         ulCcLjNIeSIkvZmJLVxSr3Un1hNGmLL9imY+S3Mo0ioonR+Qaa1THgabTLnGP5Feq6mg
         doBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782300359; x=1782905159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90ylR7uLuQk3JCNdNWJu/F0ziqsUiDApUuvh6r7i4ho=;
        b=SJ1j1/DVqqJI1GPEXAXmwAijxEe6Fs1uscC8pVpTEwEjeSaBU9EbiSU5TUpmkj9tt1
         U1PQ/jT9U3U0q+I2/A7JGllFEgmEhPcKXuoEdOWP73aa/KKrf18ifktssVznjnoCl/Mn
         +MlIR2+DtmdJ6VdciyPBZDJBvLy6b8+VaV01fcArNNEg5qn9rz+PAXkI+w8GxW2ohi87
         JDK2qXHqOzomTAESDZ4idKx1nObsQ8anQIbp9QJEZmDnK3R9BLm+We2/G7uhOVaxvmUv
         ZUy1+5YpEWlNpLAD84XKOtjhrCLd0nuAl6nBvsqvN1ho3PdS1XvwHnRWr08/43YvSRhd
         o0ig==
X-Forwarded-Encrypted: i=1; AFNElJ8ZmuBp1N5gQY0m1k5uv53QckWsj7uZVMy6/fnDAPKI1YlrnKxXs58cVOhrzH76UFJH8EgCdH8CXYi6@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdnU9+KgpzGDOXMgOKbtuvTTNhM5X9k0UHNh3b6UQtBSjIK6O
	E0lUeLTWUenqVbEAhjaJ72U/XjQ5Pju1o4maPK5VeLRzCGfH0WUN4F6TRsDM11xjAUyr4+jKbMg
	LOwVl0SFsfHKRokfsHy59MXrLcTIdLQ6tePLwGr3+m6a7YnKpGdq7CBbakngcQuvI
X-Gm-Gg: AfdE7cmHpoWXRzMhpLPQ6FlTC8+L8JJ4gi9lC3QNO+BwboZGe0xBe18D+6JHkHs8Enk
	boZywZcqj2F571pqcNTwvWAbDFBEs3IlyWZhDLruqx6mNX7wi5xJ4fGsgnorQuzC03EQEBBvt20
	9AyclSBlXraVIZi01aLI0vt4jqrVlUzFs2qaQEhV3uP3JGUFqdXwsQf2JmQplUwq0+5MEJBQHIp
	JqDaiLv/HEyZuR6fCPXDiIhv5M5GmJJyNNI26u5VH9vbJs1kmudQuDRlcqOmgiYg6YfvUekVkwo
	HWG9C6wK7BQN43VlAZRqtncvwQu5wRTiyiQbs2z1bzLGdZJxxHSav0RWCXZU+ohGFdf+Tu1YyXj
	4U96KxYVg6wtjh5K68+XDAo5pyUydA8p19v4s2R2TMMrebA==
X-Received: by 2002:a05:6a00:a17:b0:842:614e:cc97 with SMTP id d2e1a72fcca58-84562535516mr24170702b3a.23.1782300358625;
        Wed, 24 Jun 2026 04:25:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:a17:b0:842:614e:cc97 with SMTP id d2e1a72fcca58-84562535516mr24170651b3a.23.1782300358097;
        Wed, 24 Jun 2026 04:25:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7casm2008122b3a.18.2026.06.24.04.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:25:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:55:49 +0530
Subject: [PATCH v11] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALy+O2oC/3XQ22rDMAwA0F8pfp6L5Pi6p/3HGMNx7NVsrVO7z
 TZK/n1OoWSQ5EUggY4uN1J8jr6Q592NZD/EEtOpJohPO+IO9vThaexqgTBgAhE4/bafPubze7n
 2fcoXGgR3vLUWtROkdvXZh/hzJ1/fan6I5ZLy733CIKbqw1ILaxAUKJfcowrMMXAvqZT9+Wq/X
 Doe9zWQiRzkP4atMLIyEoLQGAxnIDYY9WAkMNRLRlUGOi610Q0wUBuMnpkGmyWjp6O0BaumhbX
 dYMzMcFhhTGXQtd6FphW629oGYXbqe5YO1qOoQ7DBOONbvfbkcRz/AAW9U/QbAgAA
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782300351; l=14207;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UlqEJPDnLANpGaK/dBHE8jaHyoG1D+SwqpkXfmgtD/w=;
 b=a9DH3JxCM0QErgtZcdC8AxGVSeWrcPQNWV6jtzf19clxKUZIlLuq9SGcV4Ly2qXmyDHkWdrHu
 qhk0+gGRTmLAsCDOvbqm5d7Hb//yjQ+XwH/EP7g14nDGasoaYg4qwGx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: bZZk9eiLwHp-YcBdObGEa4SOT3USH75O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NSBTYWx0ZWRfX/AtG8WiePXTP
 TpNsUi09UBt9CAzo6D8D5KELo8QLr9Bx0YvqhPF6MsubzshYeUWxhumflAw85HhI74ZaUA8eM1t
 N0OXkcnn6y9Fy011Ecbh8B7QM8QPPCcIuugxDJ/ggl3kvpxE75K3kUphNQad0AaJ5+r+0G3pXAp
 z4H5aSsJ6hLVydvCSD3t/hCKeE0dvYjVaaQQTJ1Bu7QfV8KsMEUA6ijcvbJXRFJ/HZqx+imekmF
 KLneRnCVwVkg+DYIiD9iiAkfFJHjDxwThaCkO9cm4idOz2EZ9mRaLX/AXOXISUbp7B7WmN4+UZo
 PU55KD71ei7wrUfv/7uXSoShmKN1kCoIzAS/psX4JYgeORUT2kkBHO5NC+Bog7crNWGK0y5Z/3Y
 5MCEDeS+Dk5PoLgAigaWJIEw7uhh87aujqBYFUOa/NXxnHLDu88zPdAHDO/8sPedOUw6VEjlC//
 k8NAKSg8OrgGCytRb7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NSBTYWx0ZWRfX3kpFYFad3A3R
 4lJDBrrUTZrn5QK3TZW6yvjf+FrT+ylVR+vHXTrbLmZ6O1/nreW3N5WNzJn+N9EC85K8J4F1ry9
 W0r2y3KlOnsUtXV0zUwLy8/hHS70azI=
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bbec7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Ikd4Dj_1AAAA:8
 a=s8YR1HE3AAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8
 a=K-mQ55XP2AAS2IO8IhoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bZZk9eiLwHp-YcBdObGEa4SOT3USH75O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38859-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:brgl@bgdev.pl,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:quic_vbadigan@quicinc.com,m:sherry.sun@nxp.com,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:mani@kernel.org,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,linaro.org:email,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FEEF6BDA29

According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
hardware-only mechanism and is invisible to software (PCIe r7.0,
Section 4.2.7.8.1). This change adds support for the WAKE# mechanism
in the PCI core.

According to the PCIe specification, multiple WAKE# signals can exist in
a system or each component in the hierarchy could share a single WAKE#
signal. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. From figure 5.4 in sec
5.3.3.2, WAKE# can also be terminated at the switch itself. Such topologies
are typically not described in Device Tree, therefore it is out of scope
for this series.

To support this, the WAKE# should be described in the device tree node of
the endpoint/bridge. If all endpoints share a single WAKE# line, then each
endpoint node shall describe the same WAKE# signal or a single WAKE# in
the Root Port node.

In pci_device_add(), PCI framework will search for the WAKE# in device
node. Once found, register for the wake IRQ through
dev_pm_set_dedicated_wake_irq() associates a wakeup IRQ with a device
and requests it, but the PM core keeps the IRQ disabled by default. The
IRQ is enabled by the PM core, only when the device is permitted to wake
the system, i.e. during system suspend and after runtime suspend, and
only when device wakeup is enabled.

If the same WAKE# GPIO is described in multiple device tree nodes, only the
first device that successfully registers the wake IRQ will succeed, while
subsequent registrations may fail. This limitation does not affect
functional correctness, since WAKE# is only used to bring the link to D0,
and endpoint-specific wakeup handling is resolved later through
PME detection (PME_EN is set in suspend path by PCI core by default).

When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
bring the device back to an active power state, such as transitioning from
D3cold to D0. Once the device is active and the link is usable, the
endpoint may generate a PME, which is then handled by the PCI core through
PME polling or the PCIe PME service driver to complete the wakeup of the
endpoint.

WAKE# is added in dts schema and merged based on below links.

Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
Link: https://github.com/devicetree-org/dt-schema/pull/170
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
PCIe WAKE# interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add WAKE# support[1], [2]. Those series tried to add support for legacy
interrupts along with WAKE#. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

WAKE# is added in dts schema and merged based on this patch.
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/
---
Changes in v11:
- Add device_init_wakeup() as client driver is not expected to enable
  bridge dev wakeup capability.
- Link to v10: https://patch.msgid.link/20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com

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

To: Bjorn Helgaas <bhelgaas@google.com>
To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@kernel.org>
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/pci/of.c       | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c      | 11 ++++++++
 drivers/pci/pci.h      |  2 ++
 drivers/pci/probe.c    |  2 ++
 drivers/pci/remove.c   |  1 +
 include/linux/of_pci.h |  6 ++++
 include/linux/pci.h    |  2 ++
 7 files changed, 100 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 8b18c4ba845c..0f5effe1d702 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -586,6 +588,80 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
+		return;
+	}
+
+	/*
+	 * dev_pm_set_dedicated_wake_irq() associates a wakeup IRQ with the
+	 * device and requests it, but the PM core keeps it disabled by default.
+	 * The IRQ is enabled only when the device is allowed to wake the system
+	 * (during system suspend and after runtime suspend), and only if device
+	 * wakeup is enabled.
+	 *
+	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
+	 * to bring the device back to an active power state (e.g. from D3cold to D0).
+	 * Once the device is active and the link is usable, the endpoint may signal
+	 * a PME, which is then handled by the PCI core (either via PME polling or the
+	 * PCIe PME service driver) to wakeup particular endpoint.
+	 */
+	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
+	if (ret < 0) {
+		pci_err(pdev, "Failed to set WAKE# IRQ: %d\n", ret);
+		return;
+	}
+
+	ret = irq_set_irq_type(wake_irq, IRQ_TYPE_LEVEL_LOW);
+	if (ret < 0) {
+		dev_pm_clear_wake_irq(&pdev->dev);
+		pci_err(pdev, "Failed to set irq_type: %d\n", ret);
+		return;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+}
+
+void pci_configure_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct gpio_desc *gpio;
+
+	if (!dn)
+		return;
+	/*
+	 * fwnode_gpiod_get() may fail with -EBUSY (e.g. shared WAKE#), but the
+	 * actual WAKE# trigger from the device would still work and the host
+	 * controller driver will enable power to the topology.
+	 *
+	 * -EPROBE_DEFER cannot be propagated here since pci_device_add() has no
+	 *  retry mechanism.
+	 */
+	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake", GPIOD_IN, NULL);
+	if (!IS_ERR(gpio)) {
+		dev->wake = gpio;
+		pci_configure_wake_irq(dev, gpio);
+	}
+}
+
+void pci_remove_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+
+	if (!dn)
+		return;
+
+	device_init_wakeup(&dev->dev, false);
+	dev_pm_clear_wake_irq(&dev->dev);
+	gpiod_put(dev->wake);
+	dev->wake = NULL;
+}
 #endif	/* CONFIG_OF_IRQ */
 
 static int pci_parse_request_of_pci_ranges(struct device *dev,
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d34266651ad0..9d9777fe099a 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/lockdep.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
@@ -1123,6 +1124,16 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	return acpi_pci_bridge_d3(dev);
 }
 
+void platform_pci_configure_wake(struct pci_dev *dev)
+{
+	pci_configure_of_wake_gpio(dev);
+}
+
+void platform_pci_remove_wake(struct pci_dev *dev)
+{
+	pci_remove_of_wake_gpio(dev);
+}
+
 /**
  * pci_update_current_state - Read power state of given device and cache it
  * @dev: PCI device to handle.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e8ad27abb1cf..8633c093385c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -284,6 +284,8 @@ void pci_msix_init(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
+void platform_pci_configure_wake(struct pci_dev *dev);
+void platform_pci_remove_wake(struct pci_dev *dev);
 
 static inline bool pci_bus_rrs_vendor_id(u32 l)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b63cd0c310bc..143b0bd35b3c 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2775,6 +2775,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
 	pci_tsm_init(dev);
 
+	platform_pci_configure_wake(dev);
+
 	pci_npem_create(dev);
 
 	pci_doe_sysfs_init(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index e9d519993853..d781b41e57c4 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (pci_dev_test_and_set_removed(dev))
 		return;
 
+	platform_pci_remove_wake(dev);
 	pci_doe_sysfs_teardown(dev);
 	pci_npem_remove(dev);
 
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 29658c0ee71f..649fe8eafcfa 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -30,12 +30,18 @@ static inline void of_pci_check_probe_only(void) { }
 
 #if IS_ENABLED(CONFIG_OF_IRQ)
 int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
+void pci_configure_of_wake_gpio(struct pci_dev *dev);
+void pci_remove_of_wake_gpio(struct pci_dev *dev);
 #else
 static inline int
 of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	return 0;
 }
+
+static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
+
+static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
 #endif
 
 #endif
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..4289b60dcc83 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -588,6 +588,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

---
base-commit: 840ef6c78e6a2f694b578ecb9063241c992aaa9e
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


