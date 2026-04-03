Return-Path: <linux-gpio+bounces-34644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBivJcnAz2kM0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:29:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E739478E
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1863B30844D7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8313BB9E3;
	Fri,  3 Apr 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTYXZm8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cteXBhcK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A783BADAA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222903; cv=none; b=lZBmiTk1XVLB3NnooFDj4l+JCPx/5/pIfvIdMfOxun0WfxfrrAw8CeyALNdYGW9ViPkrDSa3WuvkOwIbBG7MpP9D5NLARuNETb6gYTcvyhkcd7+zycSTc03Fsb9oYewnWuCYS5ib56xu1K8+yel7xELyeUTUzROiGrtzUEdBj8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222903; c=relaxed/simple;
	bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3lRj5rgO2I/uyl3BWAHv6pGT/sezO2BKVrkC2JW1NDK+UOLcFKffBkzmmMm7R1k/+RPebvjSzexUyCMVwSFK9b9OLUqEEV+AjtOVgiuuOdp8IlevlJAMp+rMway16moXAZAPD2lm4HWE6agdh5wZLOBnnGHZ5z3UawxEYEwgPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTYXZm8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cteXBhcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AZwhF1562155
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=; b=JTYXZm8VlV9xTZSb
	WieYYQPa4WXIOQ9pjQzncDBSOKJzZtRb022tnc9VRZssAqqotrIomwvqivT4s2Bs
	e6mr/NSpbAFa//fjqRZBTWzWFXRb0M6qtC+4EC/YnqL+NlKG7GyKP5kfJugtmwEU
	aenO78KYtXBSfyx4MF+wJbLtQPPCt8XElp5ZVjVm14N8mIe62i43Bdu3PIBMVqTT
	3T/pwNY/egoK1E5D4zHMGv7TNdy5fhTNpSJ7R7+CN3bHBDknpZtYY4EfDjdOmJLM
	/VV462n6VfHSilS5yFvINfKrU1iSfIVk5Alxpvt3g46PPZxwH7+MnLnTyhNN3jNN
	db5PWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um73hhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:28:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so53650911cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222901; x=1775827701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=cteXBhcKLoDAyZtRMSwSMDSLT8BWG878hpHk6cedb6kd3+5Noo+hjdFrJdAoLxqUZL
         3iUXP8FQRZ5eL64KUX+mLY0UIwL6EtcMG8rLSEJi1H9Jtzbj3kfI4fOifFB9L1qh7lOH
         0S2h2GWp8G9l+nVM09AS8ZTRecCKhrM3l6DwSGMC6qbhO0TChTtiJ7yN+Bd4nr8hYzpq
         4U0Y4F3oKfhzjRebUjGP6qxIb8X08aZRdUcW+TXHm8qLDrvvbzX4B2ME4Vze1WDwBAiO
         9cGzKBy9140/kQUu9xjqfNA5wJwQD9Ymy6TqfjUdaCE9IEIN3w8nOfluA54szdcmDeMy
         uBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222901; x=1775827701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=QrKXJsB4aH/I1xeET1WqqGDBmc871lBuyZS5SbeieDUFqTS291DOvuRlOONex72iWT
         vF+xxfUie8UfXzVIunEdVvZWtI5JWmF7NbUx+6An89kZlVYZ5mp6WGpYskrKfLVhQ2oT
         B46EDcSV7Y/SvuTd5Z1c6+zlOJQnARjAv78ltDCMVQk6IS/PLyR8cYM17IzKrmpvHvT4
         wucrOAMJaUWvwH9dEHS2bX0k20TQbztq9tWRBmorC/qXvNtjIkrX0KJ2GLRxVE3o5LH2
         U2uTmRKm5EvBZVPVZ7kdfVDMficBpXEdWkDGGO+D69EifN67M67hP4LhQ/y9P5wZNHUB
         xe6A==
X-Forwarded-Encrypted: i=1; AJvYcCXzaqhnT0gEetQDOY5pyxSDaFjS8G5pDlEe/q5gXPRyalZsBgoK+knPCFOCvdk9FMSvO604IL8j7P13@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhOgmc60WU8gHVUX0MlDAHJhcqbaPVfmHAaVIyjR4U1DAmyS/
	dknG/5DRu4LbL0xZg0F5Oy90/Woq71+azrnIKRwFUeeFV99nwA/c+IYwvVuNHwekXI1+QZOLkCr
	FOniuBaaCzB+n5TX9LSzt1ZwCfOz7R5zjWsu4diu5H97HZlon4+II844HuziIdBiA
X-Gm-Gg: ATEYQzx9P7GUlMoD6ZZIEw8a2MWw1xONp2xQMqyuWFhy/rAcBrHf0czmUwi8wVKlVtm
	0DJikk8By6VbaqlPRBHGkNs3S7WCPq5MiRnkV2KO8RVKHlPz3+gzjPfpKKpHAN+TyqgKnGbvviN
	NuawcgbPa/GShpnLsbCJAGOnbqLvVSWESX9evY/s43vOTVMMztpRnQujx4RzfPXr4dykwFRIfuo
	QoJ2AB8aWY8ClBdA6HbPUD7tkbpGU3A55oRDdgM9vx4JzfazxEptV0g0RVubQZAS4mhJ/cIVthz
	yPhZnY0YYLmPDHR9swOiNPx9kqKNZnQ5oOf8JL+64LBLbQVbk/wepy6Ts0mxpkUR3hNpl7mZnMP
	1QSishxqZJKnkqV45lJMZgW9hJD45fg6q+EbNmg8+qg+UMQ2BGfiq
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34037921cf.46.1775222900759;
        Fri, 03 Apr 2026 06:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34034531cf.46.1775222895524;
        Fri, 03 Apr 2026 06:28:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:27:57 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BmDuIUv38Cns22bL23TDOblBcacfNXQSckj
 dqmMKbq4BGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AZgAKCRAFnS7L/zaE
 wxOyD/9G/LHLAEtZs3ibuVDoBSdnT9XkYYPrYW4IeEO/z2Nia8G/dznLrRzV1uFgEa8XS+1kvch
 pIwz7ha/n8qc2CK3NiV8zShLOOz3zvdNOII8KxJ5ORea9jK2jRF/YTh3gluG7So44iu8fosSShX
 +q4v6bTAY0NyHhM4yBbFdSJlz24nCPeDj/W818LUk5dvsG7mBPqEs7xy/GiNz6LcCqXF2z++i77
 18+14TTO5mM8ZK5gJyHfyPKhkoEd321lyQpZQ8xyTr/YXamtQQKlPlyfN7fucWDEoQsGZrCjbPg
 QS/3rFyGpvzhynv/N2dWQdayWbdRwcGKIk4t+HWEi6Taagy5PtQvLLLBY9uFoFr9+sR5IFjEnI7
 +MryWrAKeQtS0A32f1LG4ZgG51djJEVaCkX/6StdRLWTKsbu//2rf2pNvlfL1wqZMYypYtCWW0U
 BZJv4C0enapywhUxcsQuNM997aDvxyoSE+mCN3smfS66u3kryCr1F66HQFmVb7dEJ/pHnhJt8GS
 WtT3NDsQtbJv7/M7QpAatvnVQSvL4U3N49PxcnwCZHB8dI0oz41aDe6B3WbcsDZ4TlWlR/ACYMQ
 87JVZwVoh7Afk/rM2QzkL29Y8K+4l1z0lLvljQyue55xMbW8iSEg8rz43tkasFMRsv4bZiZt6da
 3iYak9iwthM25Bw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cfc075 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_9xgnikUNuCcFz_Jzt0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: O5zBQpe1S4Icv02maad4O6RbeBkmBkFS
X-Proofpoint-ORIG-GUID: O5zBQpe1S4Icv02maad4O6RbeBkmBkFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX1GmSweJHcG/O
 EPfOYD1wN29pYzCo7AYtDVeAN4DLdEcvefMoq2xh4yno2ifz01QxHleYulhOtFXopsHCT0ZU7yg
 ptp5T8A8dxy852yMRAYfXVxalc0nPy2NIdj2RvfrL/PKODmv+UpSQ+okfBZZst/P46XzkGJqRfI
 Hun59tRkqxNGvaDPwVfCPTOvNvC3lVsByx5tadYcNDm/n8vf5aOMIVgTOKezvZPnfGQSTYKjejB
 ZOlAhDyK0OdNcw+kEXWBKoBbJw9+uHvaFeFc8CwyxrWGvdzDInt+fqD1AIJz9P+/XCB0ZxNaRcQ
 0FFxq1oDAbF8NVlMvdp71DyBOjNedwBctqX0E4zl6aizlqvFAA4SW33pu7Y5ipwj6ml40y5GpBx
 zCrCV9jHSyYliNVJAOXf4NgAeFjLfbsSqFqtmwH2da5kZ6YB3TNDJCLZZK3RcQXZvwiOBDx9D7/
 xrJT5yy67Nt47RzAjyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34644-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B5E739478E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is required to boot linux on the Nord platforms from Qualcomm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..31f8cd7cde6fcc8c8da8e69950dd4976ae04cfc4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -675,6 +675,7 @@ CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
+CONFIG_PINCTRL_NORD=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y

-- 
2.47.3


