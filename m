Return-Path: <linux-gpio+bounces-34642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG9YFHLAz2kM0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:28:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C0394726
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C03DB30162BF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDDA3BBA05;
	Fri,  3 Apr 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="looJrWFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0Rxap3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033E13B95F0
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222894; cv=none; b=BV51rK2GOMEk7EIOuiC3VdVNJ9tfw6I8e1dFsoHqrN1C63uu+bZsMMNOdw6oBYkhgsPLelIzOE3dhMVGGNP/ivBxv8cjZwPLyfSRoMww2uj/+IgK3kMGz762lTpi7CVqi2HgabD+ybYo8VUbgU+3YKCcGuCGx+3Ef6c0Ej4V2Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222894; c=relaxed/simple;
	bh=UBafEfznQM5mDg8YHW0tfSRN1bbSrJak5bCUZmVa+EQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t1GsnE+ndgdZf5m2elptv5tEXHVb84biPmX5e7gJAvqv92tXmewMEAt1JO3VXaLkN8eTo23pVrqEC50VhPi9ToOcWSIleWKIgUI6sdilPa07ThcLHpq8FqTecx4ra97dltWONeY1G9PiPbjaaudvtyWbZeb5OdYAGhvLnIBeh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=looJrWFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0Rxap3f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336EujF140906
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sCO+QRLdmTxJaTywtHCHpI
	I0aQClSShCW/3fkjuOJ6s=; b=looJrWFScGFsAuJTzQiPBsyHGajTJQMPmn6zV3
	PMZcW0dOVc1Fj0YG679JcyCFlcjRKORCcvwd7Gz3A2/ni1gQ9sWEnNibcAAWOXwa
	B4qYaZPD08xBCpoOt2Iggf375oNTpnCm/W0g4t0AYPhWAhZfiXODcINy8KzL2jmB
	Ng6ySmVUtV4OwS1C0SbQPXf17OIAiLDKmkNx+7wfUqdZ2NSfHTXBeMx2bvlVTS05
	buz6EQagHEk9CmoW60ETnleyaJ362+EWb8+yde/9DfkAY5b21nLlw6MXmIQ8EAXk
	mIYyRawNXNlTQuNcHWliDx1Rhez4HqGps+nqgPinhtCcwoIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y15tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:28:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso61197531cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222890; x=1775827690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCO+QRLdmTxJaTywtHCHpII0aQClSShCW/3fkjuOJ6s=;
        b=W0Rxap3fRlA7lGQ4bmOVWWI7XhBnkXnV9llm+v/Uq/rQqW/2mNMWSknULZBigkFjKu
         PjdnFrJh3m6qCtS9qjBH9qItW9468+36+Ktx8lQVyRBoVC6r0LsAQ9s/DXmkzLMtC4RB
         +x1PpY5DUvMrAvote9KVR/vrh5p/ZWSvpyi2xb3PDR3mlp24rmmtUZRvW3Io+/2ROFgx
         B3D+x7+4bkYA5mC2K6ptSkESSxNLIWUePD2MDdNrw31lAB+vg7dYOB874ngTWKjxiULj
         48ACgC1GE36pfL/WELVVVYfDlRk/eqBwtfukPuiDdHpYqZQBoXQjPmGtbmaOZ+OfJbfX
         Z4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222890; x=1775827690;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCO+QRLdmTxJaTywtHCHpII0aQClSShCW/3fkjuOJ6s=;
        b=CFSGa7wq0Pif5Rlg8jmOapQt6kEEiBan3MgUkR8KforL/VY+bsH55f1Ea3tNqmYUrp
         U5Q5P5Pcye7L7UKrnI1U34usooEQHuPvcFYP11eCOawEPzqx1MjDSdiw88D8SKLVq314
         m+7vrUzLc8Sb3piLmsERLLHn6WbZEQfTPhAekiH81o8cPFQzgR6tHMMHUSiTRceJN/2r
         lXkgU+JCPO5Np56IpG7opco4wOi98Fl57MV4FUljQpku/J0Hx2RIjvp9dT0BDBrNIEFF
         5v8oDDwfkpciuT4ayi1jA2w7a88zbp7LRgrYydZCQ7kZCarziSyq1kEr44zoRFcgQGy3
         zgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE6h3eq9rqDdKod5GJc9lMOI8wdQ9FoZOb9bDYbGZfCfH+dh+I8rxPOpDokQdc1jdjzPmgwEZs7CVT@vger.kernel.org
X-Gm-Message-State: AOJu0YypoHAPDtbIBaDmp5NwlawD3X2/Oe2qNfetyPHQbDjjPHmN/Wpe
	Km6Cmq7bquEw0NNS8ZiApqxDL38/6AZhFqokm4iH8CK+VtMvGfG5IWYTG9L8bqlYjbRlqNec0Ce
	3LCcqxrc+A7Q9MRSAtYJTZoExlCYz7i7H4Cdl+D3xmx+oKj7BDg36V5bamFfSgHmp
X-Gm-Gg: ATEYQzwqvKqnTFFAQhgSI+5M5iqZttXnPyworU4o197rH2cHUMAZzK1aREnHHfsSa86
	ELR2B6+GVHRWM+ZiqjbiySkbDMN1ik5aZNnMpFrCKiBjZ2tHjAP4nlSLGhquywVFCwXtotcO0GJ
	CvKNDdQjQYuVEUqoy5ahmvp70i61b1FZQHRn+v4nTMhbgL6Nk9jxrJe7BDThL6tp1hwqPxMe0Dt
	jZRkt06snATS+iAUYULvEEhQEstB17jqtUI7XTcFsWAOBN8bw+Wj4owhzd4mOvNhY0zq/NiYNvp
	YRqp8MfUbOFF0rg7Vg3PFqMz9nv2DUrR/AI9JAUdwCdRFlGQihppDxcJg/lJYB2xXuOfBZiR/Zu
	gRpQteBbfiXKZS1wVYGHMheJOZkHdH/H+19SrFQeGU384Q01swo1P
X-Received: by 2002:a05:622a:754a:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50d62a8f87fmr34798781cf.36.1775222890230;
        Fri, 03 Apr 2026 06:28:10 -0700 (PDT)
X-Received: by 2002:a05:622a:754a:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50d62a8f87fmr34798551cf.36.1775222889804;
        Fri, 03 Apr 2026 06:28:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: add support for the TLMM controller on
 Nord platforms
Date: Fri, 03 Apr 2026 15:27:54 +0200
Message-Id: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFvAz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3bz8ohTdkpzcXN0kUwtzC0szg+TUZDMloPqCotS0zAqwWdGxtbU
 ApC1VUVsAAAA=
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UBafEfznQM5mDg8YHW0tfSRN1bbSrJak5bCUZmVa+EQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BfS/DYYfctrxuaTshIm5u6wbUYKLAiwuExQ
 xXgu4gTfjCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AXwAKCRAFnS7L/zaE
 wzBOEACnqIKquNIdIsx8RhzicJcWcFZB1II0y0J9Z/xyQNaejIuv6ryXX7/EqwrPHoxfwOnCxYX
 ntAHK13c5bMI9cyf6h6AVmI/44lhxUZgViXvImPCYiUnUs47cXSJ8UUUo0z3dW32ozuA7+3/m/F
 yjuVhtwe+8yF7vI7196T0xGFWhRApML+TG4jH6awHXwoNPMxbH3afqiYilqak3fHy4GIQu2P/4D
 bpudo7nqbM6E2nPLuR9bnvoXubzncUGvNOGPeUeLkrdilXg9kYCmdg9VOnYNMAUr7+K5V6Hr+LW
 myxaMT3t/b6O1CmnT6xJ4bi2COqtWof9ouQbiDlR4lpfRlbsn08qknfA1bTqyff3BazrtML6izd
 eCCI0vvj4iVSA0a018d7M16P/VdRJgMViHEJV6oia8yO0ViguZH7y4w1cLUo9AgHaGFsuKMyp36
 +Rop/ZP3pychk5yKDTETfkuj3lj2ELvhnLU+m6PfMkcoTF5/CJWCxbXRp7T0/cuDBHRVYkSr27u
 ztl/luiHeBb+02sOiI/lDWvih+PoeMrkSDxLYVV7do7ODEqV0X/WnuoeCqdsVgc8e9kss+qPyM8
 vzofQvx52fgtvUaJtOVZnptdPtWnaoh1NxQ36D32z0ydXhLXTsrFiUJzAYwvv9+YGEAygiXNlCE
 u6zPzELMaHR+/CQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cfc06b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JAQA1SFX2CWciKQcUckA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OdqnYHo9sxMLYw4XwzhWS5cS8ot-YyOH
X-Proofpoint-GUID: OdqnYHo9sxMLYw4XwzhWS5cS8ot-YyOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX7NKgO0OBIJ+m
 eaRTtRuehCbT7RKZZ4A0S+o/elurWVrREQsAdY8DFsrhdnJiIP9/wZ80iEX6ZN7KmNVcs2nA5JG
 IhHoAN396GJjOa1R4LCaCDO5No7qkybUrP8+CCHLPHSUsehcpHjukxtgL1qoslXiZ/548068hdL
 F10jx/wmbWNAekgc7fi0R0x13DVuEuc1RZ90nbTUvGkO8I8AZh9+Ibg109fV/lXgVxzvUse2tF6
 R52PelSdlui6/QCpYTwVPecTb8K6MLE9gxaQXJEv8P5OuX32QvTfd1rLkPK1gQRcXGn/EOsydhH
 ERDnAXwIQ9evV3DDZ989ve3h7RxNKjdsLP/aiQbZj7meupSMVw4OW1+x8+2nw7wC6r7BOSqsmv0
 y7J7sdN7lBiE1Ck26gGkNnLfCpxYMfr5BjrabhORG6eGnx6hFYr9MBckAqIFoikrbWqt16LT/3H
 iZyuJ66RjdLnRUSBC5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34642-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 026C0394726
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms, the pinctrl driver and enables it in arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      dt-bindings: pinctrl: describe the TLMM controller on Qualcomm Nord platforms
      pinctrl: qcom: add the TLMM driver for the Nord platforms
      arm64: defconfig: enable the Qualcomm Nord TLMM driver

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  206 ++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 3297 ++++++++++++++++++++
 5 files changed, 3512 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


