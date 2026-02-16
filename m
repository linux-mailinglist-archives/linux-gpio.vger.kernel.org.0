Return-Path: <linux-gpio+bounces-31716-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLamKwEhk2kX1wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31716-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 14:52:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979B1442A6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 14:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 823B130DD160
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B57E3101BC;
	Mon, 16 Feb 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orDWyPrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlcIpVO+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F92EE607
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249452; cv=none; b=PlBjAdfWrch4QapBTDYY5UpN7rbZzXpCHRArexV4CXNPmoQu8RhSNT1AJfybax2texG8fkV92g+O5uCQuzeA98hM7M+5CtZROEfmke+qjp1/rbJPvpEfqALQxl0o0DGyKuiSFSfOoORgRlfYldh/EaFUQHM0RYQr93ilYH4MLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249452; c=relaxed/simple;
	bh=LHXejiw9nM8/bAfVKLaW9upd6YxeimoD3dgUvRqrd8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XD7yeXJtTeQtuzwDQhI+JMl9Q1TOBQQci4vanapkHd1mn6JKTCZ243maPOqhE88TGWcPdVjsl4cDqD+UMbTChDhFFbN0lofg6pCzmlnLf16KJQ3+hVY8O2c4ZDe8l6NBRnqknP9QnrRqwFifZz7CurisRUvmMYEnJYTeIVkDV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orDWyPrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlcIpVO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GA9DJn2970504
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PY7Qi8wmiAEqKk1E6dpN8j
	O8JjYeEu2MQe0uWjjQt3M=; b=orDWyPrxG7MZ7NojuPQKnbX6Muh7rdPDHqBAQv
	zjdnYlJ5V32W1C98awS0lxNt4P1d2pl4goaxuUTR2eu3qQTN9oeQTZciICk9J5Qi
	nJv/Y62lOs+ZEP0k3D924Aop1T5qUSsW2O/ea/5et1NpnDlYEFq5Zw1iO9jd35LG
	+HV4+92TpiguIFbOJ5SsfQTgCH9KKG+O77K9OV5PV5mXBvOZntL4Yg6gZgj3eM7/
	QzvXiyNXFSj+2JFE+u+oWw2NunMhHQOT0c4gXiZh27stKEFtAO7x3DjexiKuVmIz
	/fE/USPzM64FjaW2BOfhXihq/eQhWWIBrm8tE4urG57knrtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4smp18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso2446513685a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249449; x=1771854249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY7Qi8wmiAEqKk1E6dpN8jO8JjYeEu2MQe0uWjjQt3M=;
        b=OlcIpVO+Kf5AXzMdDC1+uCZqEMCV7MYZ1s9ECObC/gnW7Kdvkn6vfT6rWaqX3nyaGC
         bYF3nyy+AhJES1lpFE/54EkotBzTNlbwPZyPFU3nR+onFTTWy6SA0gJVLWPEvK2POU8D
         OADy+UYFU7QHNa6tSblA9VYQZO4q6aRu/moYP7JUUCztNng6TBiTtV92bIAt0l9juw+C
         ayPsK+ZIzNwbHxFgIdHDNkHmdvgynsZaYHstFn2n3361/LMeF4mSlh/mmiaXaUe3TkiA
         0Naeqd6FC0C3gfICUUCoJrCwiQxAD+iyczn8W+lpJSxgy9tMhjFgHuZyQ/lc/J8gwTOt
         MwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249449; x=1771854249;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY7Qi8wmiAEqKk1E6dpN8jO8JjYeEu2MQe0uWjjQt3M=;
        b=bMmyd2gMh/5/Al2u3GuT9nblu86y/A+ihpbSpe63yRIogDbgtgPdp1FTBDtf2+imO1
         pNjtKA0PHn+9yi4fz8xZL/+fsb9RpEbOahqDda9Y1C7nXY5t3XDXvOGvk9/sDuQOD9jn
         pdt1/01QqVf55uxiWVJG3IMteJBCeEx0VJOeLb/d/H9sf4qlPSXlbg+TTS7uYVkvcF9X
         LDerYpa4ffU+cAC703JHyi8f54mPMg/Ov2+4PevEpIiP7cfihs4bQ1PdxDOxCtZjPc7q
         4pnR4ZV27dSYibnCvKDkQpx8oMG7vSQqh5fk32yTPy/XJIeOzc5VSk31akBiSIs1u62O
         K0fg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+5j+uW9chYXnr41k29ScXdRhZErHYN4GWyJbvrqMElMZjDTWDfFZqqwMS0kHsm1Dp3Ly3dfVNkMN@vger.kernel.org
X-Gm-Message-State: AOJu0YwjrtI1zYC8pe86g/tsBPSUQ/j/yqfYlgBOgrIzEU9jP6aOCcCZ
	aYtfvY7wIgB22F/tmBgRwybYUzaKQhV3Wo1em5JQ2OUpx9oA/LdgXOjzePl0wy7o2ZhRMOll/Di
	EPw7N4Hf0rCZCxCJeQoKJhABdMYQ1VYXd1w4WMLt5CjLbH6Cfm3P8bcWGFhCCT1ya
X-Gm-Gg: AZuq6aLKcIMcnjZI+UIt7ZQ8Ze77ChfSn7pHuyEaQTKk7C1kUhlMrwDj/HRtE/g8aSV
	yfljXcgrggqBhWmBuSRPMn2Vnrv2B2aPxtR4LT0eHsUzXn4f6bbCa3DlvcA5+KwCwvLYx4CZKQP
	TJyKEvbW5CUDgjrjOzpVvsQt42cEIGKww5pa6hTphI+otfI8nZnuD+XTvQiMF40KR80MpQFFBKn
	oA5kta0Hwlz9lOef7/IGzq5/NfB04r4o7ozYASoPhq7mrSgy2P3C8ZhywYtM2rJ3eT5UD/C/Hpr
	Far2bmafjODI3kioHriAxnmrhL85Q09UYN6XzFCcidsEeXkIPAuGt0v2+4buaRP19VXUvBlVLr6
	qv3cu2QWNiwFnIhnk7XIG/01TtoroGw==
X-Received: by 2002:a05:620a:1712:b0:8b2:e666:70d with SMTP id af79cd13be357-8cb4242a53emr1309196785a.43.1771249449430;
        Mon, 16 Feb 2026 05:44:09 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8b2:e666:70d with SMTP id af79cd13be357-8cb4242a53emr1309194185a.43.1771249448874;
        Mon, 16 Feb 2026 05:44:08 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48387ab1974sm74300465e9.3.2026.02.16.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:44:08 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Date: Mon, 16 Feb 2026 15:44:02 +0200
Message-Id: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIfk2kC/3XNTQ6CMBAF4KuQri2hbfjRlfcwLtoylTFAsYVGJ
 dzdghtjdDPJS958byYeHIInh2QmDgJ6tH0MYpcQ3cj+AhTrmAnPeJExnlFo8SnpgL0eXUtLpfI
 9l3UhDCPxZ3Bg8L55p/M7+0ldQY8rsjYa9KN1j20wsLX3zw6MZlQJpoWpcpnX+dF6n94m2Wrbd
 Wk8ZJ0I/BMpvxEeEWakKSswtebwA1mW5QVBY5ZFCAEAAA==
X-Change-ID: 20260120-eliza-pinctrl-7bb592ad63f1
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LHXejiw9nM8/bAfVKLaW9upd6YxeimoD3dgUvRqrd8o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx8kL6Vbpow6meTyTDtY5iHNyFDw2G9bJkqod
 Q1k9MrCX5aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMfJAAKCRAbX0TJAJUV
 VsTSD/9cjMt+BPVRbCGuje12CH7MwCfpgcOZUNJPWSuQe3IEeQZXpwbWHEK77p1sLKVltFgXaz5
 iAuMNrj4LpowhLyJwS5kidZ5vF2w6Z4HVQ+IESrKAyDcc4c+REP2mJeI21+ys2uThof9p6GnvzE
 TNL2O9ezy0xMoXfGF4+ACWSfgfh2MOSFA2LC3mrZIUnBAU0TyAlZN+bEWKzkXMPcglZWjCGei74
 jsa0Dfn4SThZTd2qatyKCBjR0pCf4m/YaAHkWU0vhovSYhFKsAsssqrecu9l/zsInR9NWkotk/Z
 IEPf9Q2CgDLClLvWhF1a4Gx8ymTxXWVWWxvkxuECi7iDom6MOTW/vVB042IwV42h7mVAk0EORqv
 ZftRxBJqO/sLs+5qN5YN5yo0yf3+9B/zTAcDfh6DYtorlVnnZriX2NOJU15IVkPR133Fl4UcMXZ
 Me1yM6rVWgeJnhRV4b60oul+NrrPDV2UmtOghXOr53FOkkIL3TiDqKqrxtNxcqG5GL9AbU6E9F7
 ZJFl48wB+L7EHKG2yXcDEX/+uohENU3lATSj2Cs69aEQZq4x78ExXWib5ynNKszqc2qj/VCytPn
 Jt6J/IrcCtN5OVQ1DsowIlDkY0kuRT9kALGUY0Y33dparwuCp/9BWaTh4uADWOZq39u7DHa5iQ7
 HbBJOYW/CTq2pjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfXzfvEfpNpaO9g
 ip+UgEsjHafjqvZ+FvG6ahWz6ky5X40KjCaurm9z8oyZsmkQffnHshmN4lgUZaeAUlDMaXyd0tH
 8NWcn5uRmfOfjhX5b+C85+8yN3l3LfcOYLT/UE2bqYCNGleVsOzhmcHsKZ1t0TZJtTpmi3uamwy
 NkWSlaKDA+DYvU5m+tyHWPWsBpR6o4tXb7GeYkzF+k4r38gLNCyGb5BzIRj5Mlhl/3rZ55Pj/T9
 N4clfGS/2M7w2z0zpg10kV/XniHTJyr3x9ni5WT72t1fdzRpmTP3Kpr/aLLs3XMJbQgecPQiwAK
 YXXOEdk1KwQmbc89ax4SY6yNW6b+Ht2P4PWmmWK4EUd8XBWhiD2CPvOLx47KLPNKHZKZ+2+kcvL
 cViHvdqNoWQivRtub9JsbRX51dYw+8UJA6UqQi3bwsIMd8OfBTZqoCbPkyTBguAbKF1zAHIfCVf
 AvasA3M/yh+yU2FBRKA==
X-Proofpoint-GUID: WtulwGPmrtdA-91q50n3dUrZYtMFIj1I
X-Proofpoint-ORIG-GUID: WtulwGPmrtdA-91q50n3dUrZYtMFIj1I
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69931f2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HbHxh8WMmCZXOywC3UYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31716-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4979B1442A6
X-Rspamd-Action: no action

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as built-in.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260213
- Picked up Bjorn's and Krzysztof's R-b tags for bindigns patch.
- Picked up Bjorn's R-b tag for the driver patch.
- Fixed pattern for pins property.
- Fixed gpio-reserved-ranges, as Krzysztof suggested.
- Link to v2: https://patch.msgid.link/20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126.
- Fixed the gpio related properties in the schema, as reported by Bjorn.
- Fixed the SoC name in the module description in the driver.
- Dropped the defconfig change patch. Will send one later that includes
  all basic provides.
- Link to v1: https://patch.msgid.link/20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
 4 files changed, 1697 insertions(+)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260120-eliza-pinctrl-7bb592ad63f1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


