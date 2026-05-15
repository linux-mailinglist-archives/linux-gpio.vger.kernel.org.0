Return-Path: <linux-gpio+bounces-36920-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ArSNjkIB2qcqwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36920-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:49:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982654EC3A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB98030E4E78
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE1747AF60;
	Fri, 15 May 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nD5V6xuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEUfbfzC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8428478851
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844122; cv=none; b=Tb2IYe/x9E2NiEXSKcxxb15W3XiaPG/+so8wB1qSOSlhjZVrZW4B73mE2waHpr6xLTRzzlN8v8c8phG5F01WedBZYK/oX05lI8+rKZxMxMTjHMxp/3LVzd/3zm13X13HGVXXyJOFydZJPE2gwl5/Zo8BHy4pNYL1CfEucF7W9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844122; c=relaxed/simple;
	bh=Y+GxNHM4ORU46gp5uqhmSXX/Iw8YgfAryTP+Wi/6B2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BnWmY0EvoKJXJ8PmSDpke4X3TW8vTtUQYWTG89qjxzjihI4zZZaxLMv07lWXOqpkN15v47sShkqF43j3l1RtoeALxgC9RQxGGF1WCxoM1b+nMPGvn3eZFWeiIDaRosHi/+EMzjv/IYWNfFJag6jguW6/FkjEf317rmK/6wm5cKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nD5V6xuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEUfbfzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5V0At3670428
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/O/TUJtmfV+6o22+WX7HCV
	eaNQAlUTBh5SkWD2pkDGk=; b=nD5V6xuALr5HA/jBRiLs0sw7IkWO0KtyYoqPv/
	eZwl8lDcf9hIOOdkxkRftk8N0bAEx6pSva2bKO1rKqHdYAUqNSv/5ZCQgC8Hlkbw
	eQDNVlsTQP+B5/1nrAL+mOpL/jhWCZH3tGLKbsmJpqP02hxjxO7ylFm9LVaWL1I+
	stAVzRqYXVIDkAARnvO1YV0eskepM+v2eiJI5DNG0YzL7ThtpBJuucZIjw21Agpi
	JmMNs/ffwsrkAqexUqNLX+AIwW13iygt2S3Ks8FXQUlTUvgii9ksw1H5lLBjoL8k
	eFgOtPS8jVvOutsXC9C12adVQueonH+Am6gtuchcu70HG+zw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s32wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 11:22:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso61245751cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844119; x=1779448919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/O/TUJtmfV+6o22+WX7HCVeaNQAlUTBh5SkWD2pkDGk=;
        b=OEUfbfzCuNZ27251IzHW1gU6+DoOzyyre991YT+NfH2jbXvfNw6l3adrTJiOV0rK6M
         PJ+vB1zoQhzZiYnYofH677bdHEmBh9XDCuEd4fQCNazIWMNHX51sQ061UJtHeFoVYN6D
         7FL0iQ/Rq/cZkZqNIHiGBJtL+7F1uiS1o3Ghmev2oxMX4LvLdiExy2huDHO2JBcfYrEC
         3cVJ3OVBReWAuaSLfw2mnLqq3rnp1QQ/FUgwKSRBXmTcVYBers5aATKX7vHHvMTwfFmi
         UC7mIx4IpecQoPgTJS7rqj3bqJwl4IaFoXVoK9xGlnkJkbt+Uf8KmYzL3o821Pk6Gb6C
         j0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844119; x=1779448919;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O/TUJtmfV+6o22+WX7HCVeaNQAlUTBh5SkWD2pkDGk=;
        b=pgdua19czVemKRoKE79jA7XhJXf8lV4ksjCVRlmnKeyBl7pQxJmBD+QAglevD0OoNL
         LZIhYbrjlKfZjkWw770cebEYi5CCL8fVLVXpKEPObE2NbxSMwKc2tJ828Tm51GfStRHl
         R304YtGb78Co3YTv2/Y5/zE3vu1g6zPC91pWjJrj8WZzTf60GLO+kwQ5bRSEu43jqp9Y
         5zqnHQMmRPhKvZQf1kZ4t1cJtr9ELs23HFzNULVqNGbAYWIVS7JqWAN7kQEbA0fbkoI/
         qeFJYstpzVEeX8s9h6iscTvAY1AeWnmddlUML5wkWOflN88c9zez1SnQ1Vq1OOiPHSeo
         V7QA==
X-Forwarded-Encrypted: i=1; AFNElJ9hRY02BOHdr4laTwqHoCsLC0rhvcOzsZ9ZaD50FkfyRRb4XFGonhU7eLg8h/QkWVASH5fnX7j4Q410@vger.kernel.org
X-Gm-Message-State: AOJu0YwRC0IYn+PgnQHbXEU/E+cjKQGR5C1T64ppkekJLiKfhpl93gU4
	6gRRDK3HT23hKVENI+rkHDi/l38oGfuYGff9QeZYXVXwfyglE9UU7IErInUMhFc9yErjF/sjXRS
	6HLAb9AVVXmWsC1P8lFh1cnHhg2e3BNKRMJ18urQ0ISgSpaUgH/uiedsx2PVlgPu4
X-Gm-Gg: Acq92OH+MeYJeJGbM0OH+uXGbq35tEtisOl/sxay86CvtigZJZcw1EgV2lwBYPxTsE0
	z3IgtrVLnyRfepxxqi87xt6iZ9gETVP8D+JPHpdc8eGBMOyAw2Xsn5rHGwPt63uV8+GJjBvtzWO
	NSxzOUKhcENSl2KAxXdR/5gbBpVgQcacIVFHfjMepcy14vZn/TI+QVcHowgMvKFDcduUpEu+MZg
	YF5WyyT2v7qwUdTCVFaRWE9dp5/QxK3c6kUYUILeOIilH1I2Wb9NsUSrJRSmkgK3LS1V4gHvEOm
	e5NJTMA4TR+9vKOkeJerk+qpiuVA34+kq8DTvUbJyNJBjDYjlIDysf159dYNsma0aGJ2RfFPtu8
	QykRP2GF89NN9j1k15s+j0omnxCI+
X-Received: by 2002:a05:622a:1b90:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5165a05f733mr45220521cf.21.1778844119088;
        Fri, 15 May 2026 04:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5165a05f733mr45219921cf.21.1778844118474;
        Fri, 15 May 2026 04:21:58 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:21:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane functions
Date: Fri, 15 May 2026 14:21:50 +0300
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4BB2oC/42OQQ6CMBREr2K69hNapSmuvIdhUeoXagqFfkpUw
 t0teAE3M3nJZGYWRhgsErscFhZwtmR9n0AcD8y0um8Q7D0xE7mQecFPgM5+NEyu66AJPg4wxoE
 D4Rmc7pFAKMlRlslUwVLLEPBhX/vCrfoxxfqJZtpqt0RrafLhvV+Y+Zb7f23mkAOvdW0k50qJ8
 uqJsjFqZ3zXZUlYta7rF/8h2OznAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+GxNHM4ORU46gp5uqhmSXX/Iw8YgfAryTP+Wi/6B2c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHR8yQPGtTG9sRcdUSw9d7DwQ6nHZjTegv1W
 VvwSyztLNyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0QAKCRAbX0TJAJUV
 VrbQD/9KJkFIhb1R4Cv4ZbN0+/KY9EXXVlYK/ldSHj2SZ0XsSrjwATFGf+p3wMNXBSocOVn6B1r
 JRuDGa/2w7u19BG5lbvbvyQGJsT5sTiTOxs1upQVioXEmLefz9//cvLZWuKQelXxfNped05uD8Y
 V4TG5hVAA5Ank+h466MwrHTKXp98P1Khzw/MxJtIKZjrM3L0hgcWvg/eVO4a/YwnRYrC8QlC53J
 sukVpSgqBHocSDNWKBKpF6mVXgjzmJ99Uf/qCVSjxfD08TwwIKwgxUW1s7hBjtXejBH7GYGI5Y9
 PJVaZVkywB38t+t9avkUF+ouw/cWjAYOb2Fcgleppk9ZKL1XoZfkrDGMygebF+aalsFcV0Bk+0O
 ON547ZkZM+T2v0sLDVqtpPWTxkCXGa5pv7UCLq8zK8EG24MbwxJifm9kL1WX+l5CtUzpIONUn3F
 5KNNH4wDDviCxgGgcv3Dr9Msn6/tVA3OqMH5f7PZfSt7/bfU+3+r17XYJOPXrUOiWrHGYTQ95mA
 kSCDkF4C+qasc9/Ep60t4sW+7dvILz0IzKFQH8Sfc2ysercdscs4EJ7MrPraFMgJu82WpN7aGGf
 whlM5x8HOypFtv85bJ0uo28nQU44MQKv71rRWJpIheItgCHBs1ENf4NPU1iuNJB1OLErmc8uJcq
 pMrsm6XLoOW0CQQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/LQi9uD1rckf
 Enqq9MwvGI4sEROGy9SB26gpN6YQEazGtDLbWw4tqQR18rjvOFKv3BXVUAGTzyPCLgAIOLhK2Kl
 3Ns2mTW7fwPiuJU9/AFPlxKASkhl0v605H45nbK92xMiUITvsZHX1VwkVV4ApNyNiYcuhTsT2Km
 AyxB06D7IVk8e97aH8SOUKOFxqjqkhBEsp1bbfs2iCD5IsUzTZEQzPX16WQS6r3kn2sFSQjyip9
 hBQJGClWAlj0s1CWj/1B1YpomBHvuSgj/6XOzjWsrsVLycoGF8EIJyNOLj+WDyA/36Ju12rhTcD
 nfcxReen8QGYAB6fqLbjiNYSm5boMdfOQ0sZG3/tkPtkiV/9YBLT9u+QQoSNwnipGyIaQ0BHdxX
 FV+YR6ovK3a3XDRrLVfcIHR5rtqxIEbzLLsRmxU19pOdjdcBtzryfi0+TavNtpgTl2+wU+KG3Sm
 18aZNxPUUYVFL4nmN4Q==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a0701d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dcaIaZEKivGm10Cz5W0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 9xl9A8dlLhx6hs3iPFg4VhRizhto5Ewd
X-Proofpoint-ORIG-GUID: 9xl9A8dlLhx6hs3iPFg4VhRizhto5Ewd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: 4982654EC3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36920-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
Changes in v2:
- Explicitly mentioned "per-lane qup1_se4_l[0-3] names" in the
  bindings commit message, as Krzysztof suggested.
- Picked up Krzysztof's A-b tag for the bindings patch.
- Link to v1: https://patch.msgid.link/20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com

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


