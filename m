Return-Path: <linux-gpio+bounces-39585-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 66PoBxjkTGqDrgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39585-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 13:33:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98871AF8D
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 13:33:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IWQbv/gb";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="M3RbKHk/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39585-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39585-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3304D3049237
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 11:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D388E3F888C;
	Tue,  7 Jul 2026 11:32:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CED3F871A
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 11:31:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423921; cv=none; b=pl2PK9q/3I3Nt8WGiajk8RhBJvAZO/J3gq6vZQUzrRKbVgELNJxsk5GQ0SsLaAK2tJ/YAHxSFxp59RZNvgKaAMFlYcwbkqiYebJarAG7AdB0ZkjLQAIy2Mtz86fYg2kaWWL+BR7aixUG4mNLkxWsKjToPmN3MMjnnZV5y+eogrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423921; c=relaxed/simple;
	bh=m/onrcO2JktgwIb8sRDnfeQXFjAPv93f8lW4aCB6WM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h5hfQG9cpeczbKJahilnbe2EmlK4NKZe3ElIv4UiNfW/JX7F9JqjpPf+yeSANtxR2c/TWP9zDygnU+Ax/n8JHtWjBCwM+Mtuv6qy5WRVaDbPLKgReuj9BVZl1M2X0FAiIzcOmJ7b4lvllAn3iuxMuknOjc4m/aktJQUhWz0ig2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWQbv/gb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3RbKHk/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DvFM3070204
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 11:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GIxhDTqzrhHQT3ofktLEnc
	eII+Wnr1xn2q83uEuwRtE=; b=IWQbv/gbe78Wz7AduDnCgz9EJg0jxv1Ixeacpl
	ccHI11MfEqZlg2tp03NK0Q+w12xB06QMUeMh5fH0j4dbxyUZO3MuhdxDrsQ/wkHy
	d9BbXVm8y8TTqJPcwM2+VHt/kBixFH2XrCK+sQlS2/5h1Hlk9SCC2bDYcZz/6LNj
	EE8Hewh+YRv4u/2gfgsN3wT+45m87KnqkbgQNaa/uZ772TP3JltoGH7Tncv5yvVf
	O11Hxw0VVWBI/ECQ64BcB5kbB8kbU5SfDNGZCJs8+ojsHomiQdCpGeaDZjD9N23y
	o2VlxqtvQmX7cDdQ3YssbrIwoyGy/znh1louck6Xkc8bKJZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hrna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 11:31:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so4161433a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 04:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783423918; x=1784028718; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GIxhDTqzrhHQT3ofktLEnceII+Wnr1xn2q83uEuwRtE=;
        b=M3RbKHk/dsp/84vblanCYcZD+gtjENVZZ7twhfOHHLjvhPNvpGputpI4fYegq/zhxM
         yI0Wf/F52qqotW6t40YXPxf2+EgFIm7RG4Fc0YAAWt41Nex1ZFImBnBhlcw5dyqsxggB
         TZWkxkV6f2+MdDhUTXzdfH1tr5vcvLcCrgIto2u8SbSv9gwpRHzh59yTTpZ2x/+lTXdZ
         LqoTDS2VKeJYHQhgrI7+UjIk7BD+EMBJnQZ/TwRcpDQpXaw37SjFJ0s3OiEUNsKvThg2
         +64OeqElbSd0j/U6r6QCri0/eVmdS8PYIG/u3Y6dolwT5aOH0EXlkV480TYjJe1u1uco
         5emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423918; x=1784028718;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GIxhDTqzrhHQT3ofktLEnceII+Wnr1xn2q83uEuwRtE=;
        b=KFqfSfxctgtwkvPC4KUlZXjJAEx1MnDPdoxEuLtHpNSoonD5RDlmR/qwJGIMF3rYhK
         mRbASTQgmdFL2BsdjPDW0Bc2dAHZ897JDIKS/Z1yhXCQ3OYACzD8X6lZxEMl+Q2mUWb/
         CqOKaTijW7XlK8WdqDWkZpdDtN6wXrZhyvTi4SAptEzqEbF8qfmuPBQzrz7XGbxWIRiG
         9kHk7Kv9PQLkXwzILS5gtOuk8q9Ta9LCtXpOVu8ugFZ2EB8luQfmVYcvA8wNNj98P9Fn
         5GlXCjKzaE8RblBrKGjxXDoYkp8mXIUlQAb6zC+/idvCOpK/IzwXGf0YokzXcdGvwpad
         eedQ==
X-Forwarded-Encrypted: i=1; AHgh+RodvlGAing6fPID/5bIaGGuiPdqCaZ7Xf2Ana8zzAMBFTPDEn9LVvsWKVzgbsNFOZ7+EHeYmkwvWy65@vger.kernel.org
X-Gm-Message-State: AOJu0YwD+j06JYy91qFbQFTS9GmTIYyBtBftepIKoR+2+JIcxU9UqKsa
	bcWnsamP0YVDHVddsmubiwchaFLJH/KHS3yyj0s2UBcdfiJx3yKw0Q4lsnoOi6KfyoWxqVSBGMg
	VUscAvJ1tGqv82OuwKNY1B5gyBrO4Ow4U1eBgyWPzH/D4jGLQHIhpHU/FDJnk67x1
X-Gm-Gg: AfdE7ckcIP+kxLJcz4DwjHmPmzPzrrOm9Jw6BIjBOzDVQyrZUzeUIQLQfZtHfPGRsub
	YjZ0dN7QroueNKrh0XWeLNH7aZB4EbrOJ7KJQ7XLLURVwPGa2VT+hBsVnlguYFR4JqU+aPJDFJt
	OtnMF13F+G9XiSVTWfq5JVUdB/NXXZnZdLD0INEfIA3o6UiOLw+fHr4joZfhYxqMO9J9h2vL6PW
	QP8J4NG7uf0OMXd33cA+bJI4Ov99YmS94MiNdrf0XARAxQH/OUp6jkU3nnnJcQX6lYm9Z8Jzewz
	gBwGTc0vT7Meqsv7OM8MjDw5ruBrz+oMtFR/OQuHvjgpBUz8ut1Y0V+E2oiCxzA2V80KsFKxOIP
	pNYmr3oGE6LsxiLM/2PuijisxeOWd3Wp5C9xdoTQlRQob0A==
X-Received: by 2002:a17:90a:e703:b0:387:e0db:bc2f with SMTP id 98e67ed59e1d1-387e0dbbd95mr2321722a91.37.1783423917547;
        Tue, 07 Jul 2026 04:31:57 -0700 (PDT)
X-Received: by 2002:a17:90a:e703:b0:387:e0db:bc2f with SMTP id 98e67ed59e1d1-387e0dbbd95mr2321683a91.37.1783423916916;
        Tue, 07 Jul 2026 04:31:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311748394acsm8035430eec.8.2026.07.07.04.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:31:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:01:43 +0530
Subject: [PATCH v12] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-wakeirq_support-v12-1-b4453f5bcc97@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ7jTGoC/3XQbWvDIBAA4L9S/DzLnfF1n/Y/xhhqdJWtTaptt
 lHy32cKJYMkHAh34HMvN1JCTqGQ592N5DCkkrpTTZA97Yg/2NNHoKmtBcKACUTg9Nt+hpTP7+X
 a912+0Ci4585a1F6Q+qvPIaafO/n6VvNDKpcu/947DGKqPiy1sAZBgXLJA6rIPAP/0pWyP1/tl
 ++Ox319yEQO8h/DVhhZGQlRaIyGMxAbjHowEhjqJaMqAy2X2ugGGKgNRs9Mg82S0dNS2oJV08D
 abjBmZjisMKYy6F3wsXFCt1vTIMxOPc/SwboU9Qg2Gm+C01tHRpwhyfgKhLQGg+iiDS4IswKN4
 /gHkke/hGQCAAA=
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783423909; l=14634;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=m/onrcO2JktgwIb8sRDnfeQXFjAPv93f8lW4aCB6WM8=;
 b=UNzRBDOKL2wQlCuf08MUirEYxl5WPXme8PjUe/P5v5nuFnrpF6GrKFCnbD/ozCYA0/8iuvlzL
 dgzk0KwpU00CJ1pFk2/gxIIZbeQwX0pxOBkbwt1Vp+8Hwf9v76xLaWV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDExMCBTYWx0ZWRfXzQ1MK+ktAWf/
 1GDFHd9iAwAxpFX/QfYtqTWF6IyzxzvKuXFlXdEa/yMwwhILTe7YFiH7Ri02d9XjvTw6giquWJO
 hlLC6heAxwre0hvZoBDSyMUdq2SAZoExbSl+jqVovrnJS366G1Y2lDlCMaLh6FlFpImWSZqIEV2
 X/hf+f/9g/x8ANNukEag412D7OX5IfIm89G0jHAwTaR9giSGb893dOSjl2ASOwlcxVA625ly2fv
 BNiMjSvDJemhJ+LWlN0myGJ+784HUjtXyaezpO3PIeHGaKnO2TpRh8s6eh4kQOZZc0rnmodbE83
 iTUqcOPslc8155b40OAoph3AcV3KPayvNl1ukiq+GbsPF0miq6uD9W1Qg7G/ohoSUEVlW78UUsX
 DMjjQ2RbvCRmWVy4rIZ/VFnc57XjEHsGEe7hxwMQk84zeyW/rxqgyZSmDQ245WiteQ6vd/hQ5tO
 7BzCSLI0bB6wmN6ILjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDExMCBTYWx0ZWRfX7OYaNHgFPCNV
 IOpu6PKKbHRsf/no+sXGgQpmBM3gzA2buzSsSUBpRVY7HuzsNGQD/pEqRWx92GtfC1Wo6yiZfIX
 kZMi6hOGvEF7BuCd2w+kqGbfVnEhiew=
X-Proofpoint-GUID: RVnC7NllLeayEqMhhCfMeYUtWq3_JY5s
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4ce3ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Ikd4Dj_1AAAA:8
 a=s8YR1HE3AAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=1XWaLZrsAAAA:8
 a=ovJVH9vcvDALE3_RPqAA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RVnC7NllLeayEqMhhCfMeYUtWq3_JY5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39585-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:brgl@bgdev.pl,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:quic_vbadigan@quicinc.com,m:sherry.sun@nxp.com,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:mani@kernel.org,m:krishna.chundru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB98871AF8D

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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
Changes in v12:
- move platform_pci_configure_wake() before device_add() (sashiko).
- set irq type based on the wake-gpios property (Sashiko).
- Link to v11: https://patch.msgid.link/20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com

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
 drivers/pci/of.c       | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c      | 11 +++++++
 drivers/pci/pci.h      |  2 ++
 drivers/pci/probe.c    |  2 ++
 drivers/pci/remove.c   |  1 +
 include/linux/of_pci.h |  6 ++++
 include/linux/pci.h    |  2 ++
 7 files changed, 102 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 8b18c4ba845c..5df6b11cdf9f 100644
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
@@ -586,6 +588,82 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq, irq_type;
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
+	irq_type = gpiod_is_active_low(wake) ? IRQ_TYPE_LEVEL_LOW :
+						IRQ_TYPE_LEVEL_HIGH;
+	ret = irq_set_irq_type(wake_irq, irq_type);
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
+	if (!dn && !dev->wake)
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
index 77b17b13ee61..14ec6c064cf1 100644
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
@@ -1114,6 +1115,16 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
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
index 4469e1a77f3c..17d392dfda51 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -285,6 +285,8 @@ void pci_msix_init(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
+void platform_pci_configure_wake(struct pci_dev *dev);
+void platform_pci_remove_wake(struct pci_dev *dev);
 
 static inline bool pci_bus_rrs_vendor_id(u32 l)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index dd0abbc63e18..27008e2ea5af 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2749,6 +2749,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 
 	pci_init_capabilities(dev);
 
+	platform_pci_configure_wake(dev);
+
 	/*
 	 * Add the device to our list of discovered devices
 	 * and the bus list for fixup functions, etc.
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index d8bffa21498a..e711ac1d4e38 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -34,6 +34,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
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
index 64b308b6e61c..09134d0a559f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -587,6 +587,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


