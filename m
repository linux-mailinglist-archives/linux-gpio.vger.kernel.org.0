Return-Path: <linux-gpio+bounces-32446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN7jNUv1p2mtmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:03:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684471FD130
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B816F3039682
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1958B3932FA;
	Wed,  4 Mar 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etSmu2rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guq42hNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53A39184B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614977; cv=none; b=Y82/+HDquJz9dV8Ip2tCMpjih+m8CxBBFhsbuOmg8zWB73moyHpOjNbIePCqDSaSwCH/0AausqtIzc/PA2iAxsZiVuInWEwmSccp3jBvQnwHWPpLJgwkR6WyTAgFLGIEnWD670TmrhTPOXo0eSF63v+b3lYCS/heuPzVFwWarwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614977; c=relaxed/simple;
	bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkoEqwug95z97DoOzcCNOrDJJtZqKdaxIp6vn9rpe0PoFV27JX9A5hDO7pv4moNY9ni1MzAsm8qveom4ZKAfASIEpgi+Tc8HE2E9jPT1Ri9WO7fYWBRh0gJkVLh9BxO0BnHmKABkgShwKnJsXwGvTR3oWNlEDG2lZIeeTQECS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etSmu2rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guq42hNp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Sjql946036
	for <linux-gpio@vger.kernel.org>; Wed, 4 Mar 2026 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=; b=etSmu2rrizN+QK3x
	oG7GvtW+6Qa6phJi8triQQ2AQrl/vKvaOX7QkhxjDj+PgYK76eLlK0O7E6S9MNks
	ocnckIef5kk0uikiMLB+SwSLDjUl7dN+lgIAdcG8UZqEjo+Wy2/70jXjOgh6nwdJ
	ntxj+1KIps6UyUJZ4VfLS7suCNmvUjjQlppHRsqKp9ImDshNr7MtQMDRg2dJDCw3
	eJt6pf7Co9aKbhjX9iho+fIKxMGZlr7H7upL2BqnlPqlkhdSs522mDtZbX18LyUk
	porvDeHZKJb/YKz9hTqiBP6bjambYy3iQ+L//r4c89tqHMdrYo9vXU4rUWbYYksi
	M6CNFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfccv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 09:02:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so4094708985a.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614975; x=1773219775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=guq42hNpaW2PfrSai84QQqqC6xQM1gBYWZOZzShwLotJM1eNC66CvwMyfi9ZskBu5U
         bYP9copINWJO5OmO9WaIwdtp1LQug81W92L+GllThd/5VU3m+WKBV8oCFQWNSHegE0zr
         NHsYff+7qVZS8woDSyT0/qyaO60DOLfiEQ+AmBvmVS2S8ifT4oAJODmVy0goXJgpxicf
         paRirw0tOunib5qmt3nqCLrkT0W5IavbwkyN/Q7bGAk18C6HuRuLjuk4/qYhgMl3l7Ah
         rgUgpByOB7ek0FEd+a97FXQSxxmXWK4PdT3n5tB8WQwgg+/YaGQ19nmgmpGt135bQs4Q
         lWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614975; x=1773219775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKMv0mITquv44pXV22U/DAysZwknoanpdVPJIYszFak=;
        b=kZ7haWz/P7ZSlU5QEbH1ftvHbFLFMfulvy2rZQ+lY5AuPrXYMDgw3D5xUMOkL3hOAQ
         Q9iQZt7Ye98bWrV2plF1oBCeVe6EZUHknVxcbpSmdteK00il3qvNVLTVsMpEtW0q07TG
         bONoBdrPNV7EUsXTJrN3aSnibrlcq0sVDIlhL+LdX1trO+U6YSdYQpbbGolpMdafSXti
         gk5e6WAPPv9NEmjVS98A9b5sLPxkpp8qmTMIEWCr7jkSC6U6ts6D5/1FD6YkZbzkrEAR
         Zm1/+vT1E6Qf2gX1u0EiX9jVNT3M73HsVVH5puMc7Oqoqb5ggYCL2YpawF3e5va5oknQ
         noKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsKBRK2nNTf7OCLeTF+YHEmTpZsZIzh4nrcXNwHPG9Fbo2tXnziVdTO5IOcAi64PItbbGB+O/+EHOU@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsRmQiWZSeJmgHN/7XFh8lnHIim8989HV0izMicdfcm1ssebQ
	XTbiKxwOowyElIqfLguMVdZ1+GWcz+OvghzZONeEQtAY3ee3qYJpTrAcmEbH2a4gamSWuholScd
	o6pNBsgiOKUnFNfK5DaSFjJvj9gGyHa7sFHqhobePI8FEmmTFuhnjGNgpSPR1Gwuk
X-Gm-Gg: ATEYQzzNkCbs/pNyzPgvUPXGc6dc6iCzzE9vFgsNP5k8Bx3mIHpwkstxs+VWzmjWjMw
	d/YFtNtuTGlUZhUbYVZh+VW1EjGOiOaPfgMrW558ZguBJ71P+UKACLPttHqE7PPWcpIffU+sWjO
	IQaltbelhNYiUudlr9MljDOtFHiPcRmW48R9Hs/qVsvPMvQaw4tpE0ewbl9gkbCzxS1ZUYlzY1g
	mTT1oWFTAUuo17kzLpbVbuiXkYhLZejCBUW9LuEzlfN6zFV7C+bb+dXidDeARRf0VhKxbqmUjnq
	b8MpR8OOZZgKNEnWNxpFjj1SMTgYWKE4Satt7G8wqTdmMnekWE/tnNk3Ge+nVbsIsl/ZlxAtCo7
	B9XcNdm0kTG3sm+LXyRhMQ3FAMInQ8B/BxZKa/ijgla2mG10QlNXj
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154595685a.38.1772614974711;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr154589485a.38.1772614974225;
        Wed, 04 Mar 2026 01:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:22 +0100
Subject: [PATCH 01/14] arm64: Kconfig: drop unneeded dependency on OF_GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-1-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Et22qRZo4fsW5XM2dyTAA1YIF7lG8E4lUkHkWMi4kdA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UqST44JLf/6SC8h3if++ARk5Zk1RSnf/wtu
 ShX2ySz2bGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1KgAKCRAFnS7L/zaE
 w04zEACcM3xXYrildZ9Wyvzi6zYaS/VDWOtU52ZMAJ4+Wh2B2hAS8Ih/mocnq33rCiXxhVnXn/3
 jnAWPg4G3R7DoGyEHeKDhMtmgbuf+jQVeAJqXqpmKhxp1YGO0zbO3obbcoiG5HbZFINoLT9orm9
 m2AhCFbVWQXR4UeFBxYhCgU5rVmawWHimujZPt1ZBuL1A15sbzij8JAQexq/MoxGo4aaPgAMDmY
 fw6cQs3xFFznZvVllt7nNUn2YxgcE3z78u9VVhIjIndc2R3WVBC6MuvUm32nZL5W9ClHj+Ex0K/
 UCWK2PKYjOpJUxgWz0CKq7UfXSpUtzkSEM+P/a2uVUbsRhCOhDeWpfbk9nG7SMDzJlB19hOVyc5
 Y8lZFm90Nm5za4kaqvWBqoJvNQe1rnfI+7adzD29qg1ZlSLV6UuR1A3hSVSisghrGZWDw5yPZ4P
 czcoRMGNqHkbYqZEOZIAvOOHwbxJPQYy458HZ1ql/esQ2Z0TQkznLVALIOmk93TkfN1QAOAkAgc
 ZBIdqoJF7fm6NacBK/5k4vBM1unmCOOYUr0KG4Jfz1FI5DaGBXyMhcJQhdPTUn82XhHarg1jcgd
 +KFeCTLnphuVcl6AsadJSAd7+sUhnviaLDXNK5MD3jGhJ6Wb1mvqIahEUMjDv/hPWDkvqwepwst
 CXWpZ6tcDATGOpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX75W5T8PYZwhY
 +M/2+rdGvyWhumaCXJEH+6OvrgrZAiVj0CwmDInrUf2FkI10s9ZJItmDtlWAFXnvV2aprhgl6ba
 CFVzRKMh5kQG06lNOwBg4hfk5TTrT2rSYaKipI1yTb5Zf073MOfRpLqJCFlPHgcaECrFhC8e7Zg
 wTiAsusLCeCzVX5SXXRtUNuQTTb6GoNV4LMenLPReEV3oAEGe+1G3f/3s2cxyZgZoJLYQFBQjbb
 13tbotBwsOiYp7gRHLxKua8rgUI6z7naX89xXbRqELWTSvBT0J1g8qrYGFcYA6fUZx3JQzLSCjw
 SdBgW2lZZo/fbhEoBGp57EnCzo429Fb6oU2QKG+Z6xW433usBCwXPNcYafPzcETSFZ1zUVJ0pbU
 7Rze3XZT7STgBlVhPLgbnh0d1bW8slk8VqNXKAktTQldglt74s1a+gUI8YP1KggMkigUSX2cx/D
 YL9Fob1h6WLejF0fYMA==
X-Proofpoint-ORIG-GUID: rYxqkAi2vW6oIAE1DffvV60guTFgg3QF
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f53f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nExzm2HfQztilrPChXAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rYxqkAi2vW6oIAE1DffvV60guTFgg3QF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: 684471FD130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32446-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 54eb1d7fd419b4249a6860357da8b3dce2e2146d..9441ea827524df368f5aa1304b0122bebac3d245 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -245,7 +245,6 @@ config ARCH_MVEBU
 	select MVEBU_ODMI
 	select MVEBU_PIC
 	select MVEBU_SEI
-	select OF_GPIO
 	select PINCTRL
 	select PINCTRL_ARMADA_37XX
 	select PINCTRL_ARMADA_AP806

-- 
2.47.3


