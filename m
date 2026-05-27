Return-Path: <linux-gpio+bounces-37565-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELekNIa5FmqLqAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37565-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:29:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377C5E1D39
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2E430315E9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2A737AA7A;
	Wed, 27 May 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGW6M3Iq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoStaqFw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1083E8C71
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873808; cv=none; b=OjirbbNx6t9lBilK9zoKXb7OllsLadrkWVOvVOC0GU9Fi1yf/WLrckt5IIeMjqBf/rwJGqQrMC9oXjAjEywOWmBxW9d+anb1FZO75/eTmxQA0bqnEXQup+gCmBfrYyVhNLa1lK1F9BexkIczz4teLyHv8DQ7cUZBgWZpN81k4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873808; c=relaxed/simple;
	bh=55zDl1RqEdf1LDqyjgSTUL88hcXhwARXJo2D7BdF7aw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kv+5FGlmtBPd2Vc27QCyHsBmYwdJUtHOQ1XFDGvW9fSzd54iFlwtr6eDk03cAIEDpSL2UVJum6dXTJEj8cLxZ2ukmU9vinrf3F1n6GLPjOjf22A29vWulXDYtL6f7FB0WE45sgnrvAFClfwAUfoBOxwhqw11ucxezThbGJE8ilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGW6M3Iq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoStaqFw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mXqm2282627
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KbsId46GxyFscdPMn9ZM7f
	s7JJ+p7BFjW4bO5GIjQcs=; b=pGW6M3IqJopjKZGnxydJzv/kFKXrvJrl9grW6Q
	UY/CBFhLWTWE223VTWSki/kdGs+ACKcBabzr2B3/j5Wz89iDA6W3KfDBpgUqXA5e
	Ner89c2g67wt8vJRYWDIPPtBJY7amSoZy+lgEiLZhbX3pcIZ0S3I3Qqmh16DSYEn
	+AG92PvohGBRCFbLWNl/TZDy61JJNxS+tGEEIPiGZnvofFUARpWaCLLMC88G44xm
	mtHn6A9tuMY6IENqvcsxs07xcHUZ7MdQ7OI85Hjy3Zj+tWsV/vrpxqp42nYVzbAa
	9qjxPy5riU2nhkiQphU1dUgsBYmP+WdgLUIwjzKpqWTAntcw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrs4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:23:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304c46babe7so856684eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873804; x=1780478604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbsId46GxyFscdPMn9ZM7fs7JJ+p7BFjW4bO5GIjQcs=;
        b=BoStaqFwt6EDDeS1E1LKuPcp66zLSsx2QkjfFOfdyJc4K2q4y5TbapknCB9XiAA7Mg
         GuHXfZ3zRU1e6yjBzfAp/kg7SOw3+fKURZcO727H8ShaSlbgnDBtRn4pUpYGBHm4uJO5
         8mJqMBH4YRcO7YO2kLEnwjesJNitrH6PRiHtT8wKnbR4zvVVmWlcFloMOXEv7F6DWJqN
         YFydYxA+S+deVCl19Bia8lgkk2SAyZX9pvLukqSp7h0c+atTudsjnNQpPauLAFsIvUDI
         aVc7oAfhWCzJyMtRq2nmoGIfqVGdzuUocNo9zPLopYFfLKWwc1IcbJQTVgXdtLidlIV7
         oiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873804; x=1780478604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbsId46GxyFscdPMn9ZM7fs7JJ+p7BFjW4bO5GIjQcs=;
        b=DYTU28Mobvx1GfsaEyos7pLCjzuJqxm7dgVbZkg/wN6RenT+gC4s77Qol2NaTvkeOb
         BaKgvqfJbiXYeQNQzWqLIbUITXoB6XrXwQLt+giVepoMimo6zUU1eiIIskeBesHaRUGR
         v6Fm2ZBP0WrZJImS6U6SgAamwE0U908ftEb98CPfdErUITRrKc9ugg1Juh2qPGPeMUr0
         BrnL2qdif8Ds8rFaJKt813kK2lAPKo+340zTGVehTSfXYM6PoUUBo/rZqUA3Aw4NIMEb
         ZEkJVyHAvNJpejzjBOvF2R8MMNEt6PTZbEL0r1KFE0cyINYKuAVF4yGKBgKQKr7auvAb
         fKcA==
X-Forwarded-Encrypted: i=1; AFNElJ/6IgvNL7xr3dmWmaIINUxy9rwtYn4M5w0l+L2RfmWaMG0rAVGirw6TRh24u91mYkXXWfoMmsIMMF7d@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSa68CmDVqhZQ7QzgUTGQq0nONawJmgm1Dm8pHJ0jqt98T2AO
	MxftE8kTJuZr8tNSfimexLe2Efhb+xfS7lC6DKm+6aNwzrCGNeti04trqhBlyjKq4JD6MPnZhQ5
	hPSan6mGjxkQMDc8ulxdRaKswLpr9l6CgcX360B/CVA9itgKpRA8CcgG9HxEEkaJS
X-Gm-Gg: Acq92OHyr9rsrJtX19T0CNYXuLSH26sIewZSdxjcUWDF67SvStzKUTo3cHAdKvm7UoC
	mRnZFcHKFOC8z6xrFAgjGMxPonNzLiIUkdGuUL1Qboj0qPmEJiaNTaYST5izVu2xx7uTmqS6kRp
	3GrAud+0DnXelEeOO2ms/8T9zprNWZoqcZySE0opb/HGm74tiehNvY+hSXlyLqncAh2CIzGp0O/
	rFjN4Z9CS2qpbmHPvGdZq7y40GEmwN8Q4zS4Hho2Pwd4JC0a+Cd+kLJoKnFfvV9ur12np+S0Udr
	uVW1UBacGNArw3RBg/ol+0Z7I3WStyi1DhZg+ezVimOFyXLFLZWihZtaaGaB/1DnA//7CNK1cd+
	0EDoRLm4kUVdsGQ2mOjmURH/LUwpwFwJ1aDAifCsLmQSnNFqQb2hcB39R984FVXUGcxkPtcU2fg
	==
X-Received: by 2002:a05:7300:e781:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-30448ffb8a1mr10150166eec.11.1779873804177;
        Wed, 27 May 2026 02:23:24 -0700 (PDT)
X-Received: by 2002:a05:7300:e781:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-30448ffb8a1mr10150139eec.11.1779873803608;
        Wed, 27 May 2026 02:23:23 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4afdsm12598732eec.5.2026.05.27.02.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:23:22 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
Date: Wed, 27 May 2026 02:22:43 -0700
Message-Id: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOO3FmoC/yXMTQ6CQAxA4auQrm2CNfx5FcMChg7UTEbSDsSEc
 HdHXX6L9w4wVmGDe3GA8i4mr5hxvRTgliHOjDJlA5VUlxU1uEp0SQMG3jmgLeITK3bUjdTWvmp
 vE+R2Vfby/n0f/d+2jU926TuD8/wAJzfHUnkAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779873801; l=3702;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=55zDl1RqEdf1LDqyjgSTUL88hcXhwARXJo2D7BdF7aw=;
 b=J+oFdg0TE/pZpbBm7+CJJiuwJi4MmArlTP/JNX6w5suMAbGT19VKvseczYgPEMEZn73Fix00e
 V7LXM4QXrQuC7Vwbk3lHAnuPUumYG92bILiEGcmv3mYxTx4z+EkuUjP
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: _rwI3AXVtb79gRqdA_q3VQXbQZfPSGlk
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16b80c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AixRjNP4famACS7lB1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX0j5waqesN/3o
 WByVicWciKhgeQwTk62HjNI8n9edl4YNJJzJDMVwHbTNq2FEKEZIF3f02dJgNS/gCyP40UPTSBI
 GvSxm4pV4fptPrYOtO7ibEE3Tw/falOxvbrTdKPY1URGUynwGZYFayWZpW0sy2NBlezMR/Wq1tG
 eSM9xNvPR4D2osCQ+5tYk8gcAZuIT/Rkn7WX7VQAjpBy9qj3gqs8o4YBEJ+ttLXKASPE3nlqvW8
 OWE4wwo7Flytf3Aag+yfjrnbZ7GYYenLzo4yi5sxz2GnoaKfTr9Hs1cqFGWLJnOO4r0tSw8l/vS
 O16eZpjvl8N8NlLKeybbGyZBRHtk7zEDZMMycFg1UcwoUNg35gX+9cDBI73X8xGXgKqlStI2O2v
 l7C7ZURsTfEnyUFY/Vk8ycrLh/eMXT0zkZuaegfo+tC66LWr9fmEO/xGpC61J8GctDa5xdgJnMb
 EoDRQVPMJfietUmnBrg==
X-Proofpoint-ORIG-GUID: _rwI3AXVtb79gRqdA_q3VQXbQZfPSGlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37565-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3377C5E1D39
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
Fenglin Wu (4):
      soc: qcom: rpmh: Allow non-child devices to issue write commands
      dt-bindings: pinctrl: qcom,pmic-gpio: Add level-shifter function
      pinctrl: qcom: spmi-gpio: Rearchitect for flexible group support
      pinctrl: qcom: spmi-gpio: Add level-shifter function support

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  69 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 755 ++++++++++++++++-----
 drivers/soc/qcom/rpmh.c                            | 161 ++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   1 +
 include/soc/qcom/rpmh.h                            |  21 +
 5 files changed, 807 insertions(+), 200 deletions(-)
---
base-commit: b8f192cec7dcb2e4f04ee57ab78d51777b0a5729
change-id: 20260527-pinctrl-level-shifter-929b286f583d

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


