Return-Path: <linux-gpio+bounces-37649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IITTBW/mGGruoggAu9opvQ
	(envelope-from <linux-gpio+bounces-37649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:05:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A983B5FBCDC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A09A3012B35
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 01:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05053546F2;
	Fri, 29 May 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmWxMGA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLqSzWwL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE6352036
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016747; cv=none; b=GypS1bRyrh/N7Ueg1vmsanaIlCaDKeOxeK6+dab0Z7Kh5B3b2X+hUnn5zg61oGMY9QPkC0dIw5ut99AfkL/mT5lt/iYvpj4CeJv0DKveEg28WAi6/QA64hKo+mVHd3MSBnxp9DalQp5oqvy1ONu7i8qkb3zwV9CqxnC/8wnwXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016747; c=relaxed/simple;
	bh=3ESj/5SnvDlYmVUSeBbRulZwu/xrSL5Nfdz9nul+puM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bNBhi5DL3wNTf64oi0WD4kl82hQQv84OhoQXUeQWGJvZ+UvVyZJRLaXZERkUjLH65VPbOIXSZY2c8CXrJjQ+E3ub3fxKuZlNKS++zPjVcjmjlK1j4o0hjP8Yxd5fsRL+iSR/V7CZbMtWWHOQS18+GtV9hLW9I+SHdE1+tIDHeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmWxMGA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLqSzWwL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKlLEg3126016
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8ZCCjlhFkc75JmKiJofBGF
	JLFFcLRGf+rA6b4Ybf384=; b=ZmWxMGA6/AKbSzFAGIg4kGOuVAQdU1z7xwnIaF
	GLaaoyXXQ+zlYEf1WpJ1AOw3o07pql309cO4bGq9hPU8WBzCnNDK/TVdMnRh0IOn
	hXNbMMaDOIiRAiutjUoca+b2RmYPmcYojv7lcJmVC59Il5Oy34qqtuSvUbFCYYQY
	ALLwL9gwfjJmVxzzQ733RlyqvVP4I7XZ0qU+hqyQENiwpFzuN2/UaXMrNDUM4aEm
	49pFMi2g6fV9nu2qnoM554mIv7tVrP2fcjBvzGfAptVnDIBek1dWLt5N/ZoWMZdh
	TIRuEatq+VEngbebFx8ZoID2sbeKsyqJtY2sT/KRCIZpa6tw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2wpag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1353ac304f3so19110449c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 18:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016744; x=1780621544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZCCjlhFkc75JmKiJofBGFJLFFcLRGf+rA6b4Ybf384=;
        b=dLqSzWwLWpg2/7ysSZl04Pu2/ePOizFyKqcxdDbp9G0PTmB823L2wJe8G+OoGvbkBl
         RGmp6ckq6SISS/phpjWEDeja5l/K8WBfJHpafNQQ/C1kOngFbLGwnxhH/ASo86xvGzhg
         Zx+RdwfsNXwvgigYOIxDo7E6BhXIvv53E8lgX1cAQWKDqnf3/fLQtOPBGnzjxmYbIbmX
         cJ+wM5iFuPwaG/eFsubnqvypP0sJGG7v5dTyGQoIN2FQIYDp/IF8T+i9F2g6HicB7JjO
         iiZZ7MNymryMKb6ZHHOTWo/nV71nG6a724tredfxtUYrjFZbPNPV8xvmqEIv9aA5gNjV
         +PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016744; x=1780621544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZCCjlhFkc75JmKiJofBGFJLFFcLRGf+rA6b4Ybf384=;
        b=inDXBdgBIJbHLKUsvV9ksle98HlNWGbP89fGautWItWMrmjjRJAwDmmau25Qk3Rv4N
         UYC6p+GOTib+CyNx46RnPBvwRDQX9LeXj51ECExuH5YNXKm8jyRPQvEdzBTWCGFTp0Wh
         qgVOt+XI6wFq/fMARWi2ir87R4d2OUUMGuv/LW5tAt/34A/QQE/6KMi5rnq2dLlcTpoa
         9b+Sb/IPB9cJCl82VUTTuJDqZxxkWD0ZPjqQReGweOsuV7e77OL799u/asPTwVMHJLfc
         mFh3zBCXYAiescQBIXFKZqKUH6OfbJr+fx0oGDUDigw42+R87z+055nSFIODKJVUCrOX
         HemQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X/jlGmLDO0lIR9SxkTVEv4Bkbk5/IfU1Gp6iGz0mJNFjtemSsghjJ5ZQVpvIqXNaOl8zn+DmZWbbC@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0ILK+2iAy5pRSmAKgRj8o84+OGgW4A28rmhs4VG2xLfIaYM2
	RCzm5aVyYkQ/ekFit9+fZswlgXAfF3yHVPW1L43bEmOR62DyyxpmXQV6O5bwZTf9zE7gl4a0Uu9
	DzWahC8Kk1IJpKLj8EOnDgWa84TY4pj4st/ZPhMIgJ9jyacfK2tBASo6MSv2Ho0yBrIXegyAIgQ
	k=
X-Gm-Gg: Acq92OF+S6ui+8u5FfSOe8X7vFA1+5taJUeQJ1fWSuoHeMohjqBFYOAVWPiMZJp/+c8
	aTEEulTDXzmPnK2lqGHuBIbX7FybkbqhGpDlj6n0ce6dcARjbJ/Z71v0pDdFVQIxYSbAx86dqAK
	eGB1sJhc2TFwf1lA+j6+EQLRZgUsRfzKzuOQGkaU4n+I+CDVK/M+f2ZegGEOR62qdNsq5PH9FmD
	k5Zi+bWF6ywlFeNsAJuYcZn+XpXaIIQ11I06mQyJYylVtn23hqUw7snFbWIeHjWYRYR8Yva2L6e
	V7awETik7eaGBT5j5Bdl0OiHedAHitlfdi9yTM2tVmtUgkzhUczP1921JhQCVjU2KELa3ioeoJZ
	X/T1LvAI494fvUIRXwczKhVAONcqHNWkzXmguOgOkrAR6Wrt4S1MrnSxTjjeyDFuQTmsv3WZlya
	nBn7w2dJyf
X-Received: by 2002:a05:7022:48c:b0:137:9399:fc59 with SMTP id a92af1059eb24-137aeff92efmr257221c88.21.1780016743748;
        Thu, 28 May 2026 18:05:43 -0700 (PDT)
X-Received: by 2002:a05:7022:48c:b0:137:9399:fc59 with SMTP id a92af1059eb24-137aeff92efmr257200c88.21.1780016743105;
        Thu, 28 May 2026 18:05:43 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:42 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
Date: Thu, 28 May 2026 18:05:34 -0700
Message-Id: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF7mGGoC/4WNQQ6CMBREr0K6tqStUsCV9zAsoHzkG6DYXxoN4
 e4WPICbSV4yM29lBA6B2DVZmYOAhHaKoE4JM309PYBjG5kpobTIVM5nnIx3Ax8gwMCpx86D46U
 qG1XoLivOLYvb2UGH7+P3Xv2YluYJxu9ne6NH8tZ9DnGQe++fI0guuCx1dtGyFXVubpYofS31Y
 Ow4pjFYtW3bF4AxUFzTAAAA
X-Change-ID: 20260527-pinctrl-level-shifter-929b286f583d
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=6363;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=3ESj/5SnvDlYmVUSeBbRulZwu/xrSL5Nfdz9nul+puM=;
 b=hELj2pyvmwu7ZYnq9s5o4XDh0mJ+XOsdYKUqpdr8dZcCWDxgm2H/lPsTHQhqk0o5y7pwmyXKF
 amcXdxFQFp6DTfCWmfx3GUqT7lPmtNhTqqnoL/bXX0JcUOjHKR1QiEd
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a18e668 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jnkyZqLWQS9AGQwLeBEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfX2PlT134HUppl
 RLi+BXcUhFr5Svs2NNKV/bZllZzmiiekkuhhg0l9AqNsPT1k0s0LdC+pxYGYfjxzq35qzQIfXlh
 7Bo27VXDRIqMZ+bhCwBFEsKHck7UL6k7BlcxuR2AkX22DDs2WkcfItETVgsvPgB4BvRzjjC2FHD
 X01NE2WWbQM8LZtDPCp3Xqof61ppy3+WsAYD3edtVJ7iKUWrnHXnIZRw/ami3e6c+rWiQHcNWKT
 /+8u7HmvGGscUHFpohwy3ZbbjuzXg4W84KgP6mO0hOw7C+KS8x7kqP8d81X0sHqKdKY0og8Dp1q
 iAv0Ym86Eye4j9xXpjwTKPYYD1aX1c0EpSAcvoGdNln3hUA2/Hf23Rcg84z80KH2zExRLUxQQp6
 4lu3zzDOCHKsNW0hWZU6EPCKwW1uYA==
X-Proofpoint-GUID: ENa-ensYXw2XFvpf3Z66nZY8nZAHB4u7
X-Proofpoint-ORIG-GUID: ENa-ensYXw2XFvpf3Z66nZY8nZAHB4u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605290007
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37649-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A983B5FBCDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
bidirectional voltage translation between 1.2 V and 1.8 V power
domains, targeting open-drain signal buses such as I2C. Each level
shifter shares its two physical pins with a corresponding pair of GPIO
modules, and its enable state is centrally managed by AOP firmware as
a shared RPMh "XOB" resource.

This series adds kernel support for controlling these level shifters
through the pinctrl subsystem. Patches are ordered from infrastructure
to driver to bindings:

Patch 1 (soc: qcom: rpmh) extends the RPMh driver to accept write
commands from devices that are not children of the RPMh controller.
The existing write path assumes the caller is a child of the RSC device;
however, the SPMI GPIO driver sits under the SPMI controller bus. Two
new APIs are introduced — rpmh_get_ctrlr_dev() for resolving the
controller from a "qcom,rpmh" DT phandle, and rpmh_write_ctrlr() /
rpmh_write_async_ctrlr() which accept the controller device pointer
directly rather than deriving it through the device parent chain.

Patch 2 (dt-bindings) documents the new "level-shifter" function, the
qcom,1p2v-1p8v-ls-en property, the qcom,rpmh phandle, and the
qcom,pmic-id string required on pmh0101 nodes. The pmh0101 conditional
block is split out from pmih0108 and given its own required properties.

Patch 3 (pinctrl: qcom: spmi-gpio, rearchitect) refactors the driver's
group and function registration to use the generic pinctrl group and
function APIs (pinctrl_generic_add_group, pinmux_generic_add_function).
The previous design treated every pin as its own group with access to
all functions. The new design allows multi-pin groups with restricted
function sets, which is a prerequisite for exposing the level-shifter
function that is tied to specific GPIO pairs only.

Patch 4 (pinctrl: qcom: spmi-gpio, level-shifter) builds on the above
to introduce the "level-shifter" function. When selected, both GPIO
pads in the pair are disabled (high-impedance), and the RPMh XOB vote
for the level shifter is controlled separately via the new
qcom,1p2v-1p8v-ls-en pinconf parameter, allowing enable and disable
to be represented as distinct pinctrl states with the same function and
group.

With all these changes, the BIDIR_LVL_SHIFTER in PMH0101 could be
controlled with following settings:

    &pmh0101_gpios {
    	qcom,rpmh = <&apps_rsc>;
    	qcom,pmic-id = "B_E0";

    	pmh0101-ls1-en {
    	        groups = "gpio11, gpio12";
    	        function = "level-shifter";
    	        qcom,1p2v-1p8v-ls-en = <1>;
    	};

    	pmh0101-ls1-dis {
    	        groups = "gpio11, gpio12";
    	        function = "level-shifter";
    	        qcom,1p2v-1p8v-ls-en = <0>;
    	};
    };

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
Add following change to address review comments from Sashiko AI:

- PATCH 1, in drivers/soc/qcom/rpmh.c
  1. Add rpmh_put_device() wrapper to avoid casting put_device directly to
     void (*)(void *) in devm_add_action_or_reset(), which would trigger a
     CFI kernel panic on indirect call type mismatch.
  2. Add device_link_add() with DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME
     in rpmh_get_ctrlr_dev() to enforce probe/remove ordering and runtime PM
     suspend/resume ordering between the RPMH controller and non-child consumer
     devices, preventing use-after-free and hardware state machine violations on unbind.

- PATCH 2, in Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
  1. Make qcom,rpmh and qcom,pmic-id optional for qcom,pmh0101-gpio by removing
     them from the required list in the if/then conditional block. Update property
     descriptions to clarify they are only needed when the level-shifter function is used.

- PATCH 3, in drivers/pinctrl/qcom/Kconfig
  1. Add select GENERIC_PINCTRL_GROUPS and select GENERIC_PINMUX_FUNCTIONS to
     PINCTRL_QCOM_SPMI_PMIC to declare explicit dependencies on the generic pinctrl
     APIs (pinctrl_generic_add_group(), pinmux_generic_add_function(), etc.) used by the driver.

- PATCH 3, in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
  1. Switch from devm_pinctrl_register() to devm_pinctrl_register_and_init() + pinctrl_enable()
     to defer hog application until after all pin groups, functions, are fully registered,
     fixing a probe sequence bug where hogs would be applied against an incomplete pinctrl state.

- PATCH 4, in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
  1. Guard pad->is_enabled = true in pmic_gpio_pinconf_pin_set() to skip the assignment
     when pad->function == PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER, preventing pinconf
     application from re-enabling GPIO pads that were explicitly disabled by the
     level-shifter mux path.
  2. Call cmd_db_ready() before cmd_db_read_addr() in pmic_gpio_register_level_shifters()
     to propagate -EPROBE_DEFER when the command DB is not yet initialized, instead of
     incorrectly returning -ENODEV which causes a permanent probe failure.
  3. Add qcom,rpmh / qcom,pmic-id DT property check before calling pmic_gpio_register_level_shifters()
     add make the level shifter function registration optional to match with the DT binding change.

- Link to v1: https://patch.msgid.link/20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com

---
Fenglin Wu (4):
      soc: qcom: rpmh: Allow non-child devices to issue write commands
      dt-bindings: pinctrl: qcom,pmic-gpio: Add level-shifter function
      pinctrl: qcom: spmi-gpio: Rearchitect for flexible group support
      pinctrl: qcom: spmi-gpio: Add level-shifter function support

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  66 +-
 drivers/pinctrl/qcom/Kconfig                       |   2 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 796 ++++++++++++++++-----
 drivers/soc/qcom/rpmh.c                            | 173 ++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   1 +
 include/soc/qcom/rpmh.h                            |  21 +
 6 files changed, 845 insertions(+), 214 deletions(-)
---
base-commit: b8f192cec7dcb2e4f04ee57ab78d51777b0a5729
change-id: 20260527-pinctrl-level-shifter-929b286f583d

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


