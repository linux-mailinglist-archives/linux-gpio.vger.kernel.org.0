Return-Path: <linux-gpio+bounces-36710-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NyhCj0rBGoDFAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36710-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:41:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2152ECF3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 749C2302861F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8904B3D6CAD;
	Wed, 13 May 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrNHGV7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4kxPv/q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90E3D5258
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658086; cv=none; b=gwufF7t+YCxy1hYy6PfVZGeoOaFNIzI5ocgaXvAREo6TbXsOT5tgiL3LZNEe69tJJd1ppHSd/cf9yEeKvKWG81QB4uX7CxQMHQyMSeuRGHZObns0NCNNV2Qdg2RxqrjP1xpt0r29dwvcc1h99OuEV2097z3t1A4PCjNA6bK0oaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658086; c=relaxed/simple;
	bh=oLOiJcuAPPxdCwCWeNt0isxb+Szf0jFt0y9LC5Kp+EA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eVzhirrI/iFv5wc1HFskND1Tb66V9eW8ghk4uAUF0ildWpOr/cPH3sGMjGlANZnZpgjRyUCsXmX1MgZ49D/HtXABpt7nVlRUfJLBMT6kv3cBRs5ykCbmT/FG6w6KqzSnZjRCg/J6JGaiyCEQM+9T+92nO1gUOnHdOTBgSCX1RW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrNHGV7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4kxPv/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FIVK3324667
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NvTJmxlb3dGbEh5MkGRYO0
	Otz0pNSAiCvFRhGWrGIL8=; b=ZrNHGV7S+hUegJSRpQUROq4KcOUVjxUHhRYQ4c
	b9uvx9pCfN4WWdxBsIi+bN5Ag6XUYNnWBLqvEqOndwoyc3KOj5YC6q1P/SYnVxhw
	2b2IV3fYqMvj3IslMIVNH6ai9B2dk8P01qAdPLtDB4XPYeWoMm10pMVu1O0VrWz3
	X4dWuklQ+xEsmrejEUUfjhdsSKKReWCCpLSzzD3wvlYlEYKl0oLRX2pIruEtW+Hb
	CG4zQBjJ6oMntt7Vnbnr/1IAxKjWHFQ/Ip5H30ryi54QYUIyCfNHJJxJl8uDIneK
	hDkRQupuRPh0WC34STxfw7XEhOXHV5Lx6IjsQFL0i1FbPmBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd8bnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:41:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so147570751cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778658083; x=1779262883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvTJmxlb3dGbEh5MkGRYO0Otz0pNSAiCvFRhGWrGIL8=;
        b=g4kxPv/q7tTrXo+CljWUsYZnvBT3bkkrocRFw1unL2Fn69WeTxQCRWERpzdGSEexKj
         Va1Bgmpu1mlr2KziJDcq968AZEJJrgcSHQSrtAz1Yd0mefU2bxxBBbCC98xjM5FOiEcW
         8oQ3zPomi1RCZK15H+dRxbHPb8yyWCxNMx06CW/HiplthcHOEmR9v9WaJwjpHvDfMXRm
         DHUD4tM2Co9EECB3whr9Bofo+ZUXRIX7LU97wS5ZATlgKMitOBMobEt+iUU6jRj4tDhp
         lJRdK7IBjl899W3f3ej6iVUCBduJw9EsP30u+FPuiAlaOGon6V5nl+uOrvFVO7kMTitP
         lfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658083; x=1779262883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvTJmxlb3dGbEh5MkGRYO0Otz0pNSAiCvFRhGWrGIL8=;
        b=D5DAZ7k8tACMKY6dMZwnJdcMtpXgxZ2hufvj0yOOwmCn/HXb+2j8ajWFbzynSq7Pze
         LZB+sq3vqV06LmQrq95Gn9NQoe46ZtsX4aKv3rYowN5dXrX6IVzTtu8z7lyvsZKO8LOE
         nAva9cvEx4ODZSv/+alhg3XPncTYdf0Zo8b37cFSQ/FIC11jBxFk1XuwSVdJHnvTKL+r
         S3AY9I5Df32CuDv03QBWQO/MhB9ppAX2vKIKiisTjsZIwjgOYMX6sKrR9efQpYNBx8o1
         zAU8+WGivlsT/1EkRoOaal0DVrFGCvAaWYj+3S557nHTboTOfgurBig1ZqV11bCr28st
         P5yQ==
X-Forwarded-Encrypted: i=1; AFNElJ9atBx+HMAlV0U0s5jgHtl1NqIFW9GdHSAq0X5y/SSfwSscQTQPCSpqVT8nbdK2AxldLdAHRNzMhvHV@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmZdhi7gT4TIhAWR+YYA6Ta3NKD5yHaPJM7H5mw2xRrooSNa3
	uU37Oi3TyISfEmr+PlRe0dhDADSEeUO4SEUCQwiaTJ7UVDOUUS2VpSFPsAQ0lwotBaf5IHFbR9+
	FN5udxQBmcKDWgRO+m+TZJZMgdLTSu0tbnyiO0XmIURzz5QCVdU8S8UkesXmTg2Zv
X-Gm-Gg: Acq92OEwGjhu2CgzDJL02lfG8nXpWS+KXkV0rKTqqxNS4IeiPa/lSFcqJSU0NWbRII+
	FUFvMDllRHF3suLIvQBf9mo+3qVxi4rh3Gtj78Yd3B35JEPvaSCxhvjkps72H/o2CZFEZi4yIHM
	vE3h9YGRmbfwATg7TykDhxM/j9o/KdY9KY5kcWgGLmTOnm4GTDClYHRDwxvr2mFy8KFVYr7f8bp
	ObBg+sLnwPSvEu0S43pzj23davigUXSJOJgFDKPenpH5ZHmbt8/BfFo5pEVSo509RV9EootQKzp
	l1Zj82sZSh+CQ+GKBZfVmXEq78oRkvQi+8EIrApkw1AoBUB3sUdi+fbnTz7cjHZMYfs1NigiMTL
	fk1RDjgOYkPk9Z2CQTEkFnc6lop8bJQ==
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr26225461cf.9.1778658083144;
        Wed, 13 May 2026 00:41:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr26225141cf.9.1778658082599;
        Wed, 13 May 2026 00:41:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm48999335e9.5.2026.05.13.00.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:41:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane functions
Date: Wed, 13 May 2026 10:41:06 +0300
Message-Id: <20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIrBGoC/yXNwQ6CMBCE4Vche3YTitKgr2I8VBxxTSm1S42R8
 O5WPU2+yz8LKZJA6VAtlPAUlSkUmE1F/c2FASyXYmrqxtat2TK8vB3Pfhx5SFOO/MjRsGLH3gU
 oN501sPsyXUulEhOu8vo9HE9/az7f0c/fLK3rBz3mXDeDAAAA
X-Change-ID: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oLOiJcuAPPxdCwCWeNt0isxb+Szf0jFt0y9LC5Kp+EA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBCscsQCWStxlbkGuDMjg6heKxOMi8c0mu8uap
 Rg0EIM2EXuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagQrHAAKCRAbX0TJAJUV
 VvNPD/9gZStAFxu3i4oFSy6c0i4FHfCQCdwOqlFt7mrGMyTqqdkXYpJf6GN8i4inRH6HqtHwmKB
 SFQRZll+rcg5nPjZM+L9eSO57azoqXxYOLE8k7igu+/87EPGzYZJyS8/h4nkyIc1uZnmPLV6Ub6
 xPQxfD94zMRvVQLZ14AaPVmH7Au/uLQmxD5PmMChTNDYL6RtX7fmYTh+vykdzg/WcUJDcBMNDtp
 NjkcjgcMYhzvMySnXGLk7t3LLFDvY5NtZzHfxgrudKilD/SWFletuKO2yH3obLQDhX8PnvH2jjc
 SKt+LbI5LoonqsMcjr1KsE2r4PO9UXs4fAT8yZpRHFQBSAlc6soe1nbQeoDEJQT8Z9eX0No007W
 UuJoxr3apG7UrgAEMcRYsLfq4BXJOOqZ+cALAsnXm0E9JTgJD3hQnoTVzvhIgyDuOzAtHGnbqP5
 Q1xhHC+sBpzXRKmJj3GH5r/1wp25oxOv3IDoN5WMIDQrGm1smA+l+U6vBqC3MHxNMVj0tiYZuMV
 OQLOBJ2+CApRKZAQHW1CbKnHq13zAH66rok2yA4/AeGuMVMddjBtOAL00wzMy2PwXGoyihf17A8
 bZyyGslgHXLusZXibYqgCKjY+OEh7gftdklu80gH31Mv1AnY6/OSrR1E2C5zeXcqtgE6O3xvDv6
 qz+Fr7XJQZHQKGg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: UK2TeYT7Q9fLR9cSCfCD1A67a0YuxXI2
X-Proofpoint-ORIG-GUID: UK2TeYT7Q9fLR9cSCfCD1A67a0YuxXI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NyBTYWx0ZWRfX42FcJ1mjk2wW
 E6s+WX6KtFSE7+B+brXnbj4COaQ13ZX5/AKwF4EtbRPtt+zKmcR7esCjSFtb3w8GW7pixy1CpJb
 s4+wZhzqO/Vh3ebR3dGJWybH0gh0jFBMA2Q7AqTQ1ewzDMP0bop7DhYYfxX3aDWwf5MKUoum8LE
 T0BRXnv3BmZCmBavbG5i5eoj86A7PzUWnyxTKN8LxPsMgMQVsQ76wMoeID9ljIE26O858JrJmI1
 3bCgJg/QssEVuoHrVfcPoHFAgZULT85ctZk9PLrIBvTQPpCYF2FzfY1j+Yw33CcEigWHS9PbzNV
 DMca2Y6CxsaQLcBX18xmr/nXjoYgsjMhMpOjEz3YirDMrqMcNWzTXbvNT8zVlsID/i91ExUcVw0
 zv9eglvqeN3dss47nRNiKTw1quEQh4Gop4kEQ29k2N74mHCOxRvyGEvTkCEU7MW9xsEbwuWPYZI
 /nkPuvXfrNXMNv6ws7Q==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a042b23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dcaIaZEKivGm10Cz5W0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130077
X-Rspamd-Queue-Id: B9D2152ECF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36710-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs.
Splitting into function per lane works, but it forces the devicetree to
describe a state per pin while these are usually configured in pairs.

Follow the pair-wise scheme used on Qualcomm Hawi platform and expose
the two selectable pairs as qup1_se4_01 and qup1_se4_23 in both the
binding and the driver.

This has been proposed here:
https://lore.kernel.org/all/agIZOAa6nYSb5PWX@baldur/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4 lane functions
      pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  4 +--
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 32 +++++++---------------
 2 files changed, 12 insertions(+), 24 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


