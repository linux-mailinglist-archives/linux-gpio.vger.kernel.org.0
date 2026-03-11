Return-Path: <linux-gpio+bounces-33114-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PSuHLY8sWmAswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33114-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:58:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE226181C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3A3F30BE01E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C20391E63;
	Wed, 11 Mar 2026 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LE0H3ja4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFcskoXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B43BF691
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222399; cv=none; b=UcOPK7rvu457zvy+ZRKb/KDGqotO+e8RhNq669zLuj5vWC9TTfa1beoNzMeiJVUmx/Qgivk74m8XqtgFjRySNM7R7YuZeRbA6lnCXkm45THINK8trwNy2SmUIKDIyIkGzwTaHRh+658PiylhvlqRgIZ/FzRzZzcw4lqb0tpYxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222399; c=relaxed/simple;
	bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hsctv7n9xOXxSQ+qaMBuvm5fMcm6Wg263QTeMYzGrVcjx2jvxrsG/3HqmXbaoq6Z3eVgvkmHB9MZ9OFtnR6+bu4rMYgDw+gOx5+lNLyE1SjvHA9CzR1Cad7/P4yUv81c9fAu1EcVQuSZe0x4wjwLGxw7DcvHznAjekrcFvI8EC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LE0H3ja4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFcskoXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9evoH249216
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=; b=LE0H3ja4bH0H7vP0
	r4EAfLW0IdOHoNjJ1P7XcijpEqt9reMhI+unoAXLpZ6rIvWAlDlSRBjBwBKcgKaP
	MPiJGzbXdiU6Xw8akUzRAtkMNAu6orcCop9zEp937juBCN2ziFbiEKWZDjmxe9vv
	KtnMu3T5xXbxmodeRMfZ3iajiK6lLEhqY0V6VOUweaD546MLjzWDZepcQ3wKHrRD
	BYKopEBYyxv6DrupXAwqSOZzVAS2TUXlL6KmXlyFDqLNmdGO8JCR8UQ37zA9HnX3
	Oq2LvTStn7NSC6/udCYRsZEEBF4230pPVj0LsMX9HEIOjDISFLhEmb1L35u84UF4
	O8Mvnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv12vvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b20cc6faso736000b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222394; x=1773827194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=SFcskoXQ5gQhG1wCAWLkQD5t7VDk1Nl2x73HpJwrFAl+aM4XfBTWDkIMTMh/cReyuY
         yGCNLFBT1CcrXuVthyxPsgS5AQGAVVX/+Wc0SUEMWauBWCsfb+wS79GEn4zjsF57TagU
         QEjFfyrgddC1ZyTG0ctQYRWesTVTiKKupv92BXpP0M6Gip+zBa8XVjgwX7zp4+hc8riG
         2Ahk3a7e5k2r3mdqGPU7t6sfQx3XqSuz61rykLbibVjfQmldxxT+zL8/Do8mnvjjdGIv
         c25+PO+AM8JdSZ0eD/hsCgvKXq+Rmlpbpbu4kVHsaboU7GSc4F5ss2PpSrb0Hjy3keDM
         DD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222394; x=1773827194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9S9Oesm5sQiwmkIMcRlV+iU3KxqxzSjhKdwL2L+zBI=;
        b=TNmDbQLzNKb6q46VZpr1N/gB/5Ifc9nUY1x8C2Pb1qU/XkxrkmzqvWVJ+RCiLhDsa9
         1Zk6XBAAknHJIX9KVDmk+XzCqRjd1H4e8yO3tO2+jwjfJKNgN30ePipe0Yg37qYZXSSI
         aidbrTS77E35dh5Bb+tw6RfVX9vpI/HRjUdaD11lIUbLHccRxd4ojt4V/ErGOvBodV8M
         GkqBKCpY2YJetOXw2C5dNOztdx1PrJBmbxy/4w+eZZPAzqPzrEeKS+X+rnnf4fTDpr/a
         rPg6srHusmVw2333HYI+je0VSpt/bZuf7eU2WBV3JzbHPP0iLnf7kcfhLUyXoVcAhaQo
         h39Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpYfK2Nkx0A6H8dY7u29CmZweuOmq/sxY/wBMioprcUcnJk00Mi+OxHFYm5l/UyI+JwIakLwkSXfQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nfluGu5Dbv7GxtEQfXNeaatz1a7KGECh57Ovy/edtpEGdyIv
	1Ha4vS0xQjqtJcRtmTL4Wct5RHrDIuSpixBt4Om4kY0CC0US83HeM7gfsRubegute+Xw6QrnJxe
	ZyHXBNwI5sGyvbpJbauljVBO9dgg/PwyAYx06m55xfT4wi3PHKpsApCi6Pql1fI5e
X-Gm-Gg: ATEYQzxbdL/1Po8s13XWjSOP3Uh72sOgMlIz3o6gK1eotqlH0VltsMsTw1z6IwXUg4o
	/k4hwE991ijBm/Dd7acQ4/UmHVvudHWZYiQwbcxUij9W0/DM4f9RL6vts4vl0m18szSMRdtYYRc
	l43cZESz9wjBcKRrz35e1fwrCxcagH2mNmH9wDD3AzTGEyCikZRzZgtjJneHCu2afTApFmjqI28
	SwOCH7TXutPMDdvktNx/MHxWCzs2j8fthI2GJAEP8oFqT/iyfZU4vD6Is7xgnCWj6ayyeBZ1tNX
	wmV/tgXP+gwllcX1gUT8pF8gkqkq3DusOnmbs2Lj3EsQQF/SbcKUwgvzkisWvFglW/YnKErZJxB
	BDbS366OC4MXmbXABuY81mzwQSxrzvSI7S7yz4ZiDAQYP8oLbD5+JnKQ2tZ84FsovnlBWtYhDn2
	FEnfUxNbLZJEQj7gJF2jlPCFw6k5E+DiIuJYBH7RWApbdvwR/3hBEWAf7P
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595232b3a.9.1773222394452;
        Wed, 11 Mar 2026 02:46:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a90:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-829f79ae018mr1595212b3a.9.1773222393938;
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:49 +0530
Subject: [PATCH 7/9] dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-7-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=853;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=D4FTk1Dc6ZZyZyyYwyYFZQ/PqkaMYdH1kar/R97d2u4=;
 b=QebNZs3WsL0Br+pxni1jb4Njj6XELEcpcYhGX9Et/T0vK8D0o74pZoru2uSLhEMn4P/UNRjyH
 Tl5Cm9eQ2N6BlxfEbn/07H5Pgwe4vWrVxtfvJdL7WsgBmazFGCDi55Q
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX8i8tm6s0+c/X
 taWeriLreVRazkX25pQIxzNxPc81csF+Zbl6N2zBcle71pSdZY4LHe9HXAuYoD7r3IsWO5kDwZt
 Hn6IlMVwTaQnu7zLHPMTimxq0EWx9zhVkUdBV9FxxT9jXbpJr98EkpV8g8aVtMgb0FKS1TixatE
 9+24VmIYHB592y0DftDNzVWUjtgoSa2f3J3eVjW/cVQINuTkqLx+VbfDxOkcqCiHgKG3MRxPceE
 eDOhc7Tf3yI3VdqVKqRvkQh3S8fd4ZtlCV8QdJKLxtwlFGlj7CJO4GTBl1JVaQymxQ5m5IfgZp4
 ySPPFTmHe1EHXQecG+V2D+07wpV6HPV57PiByySpST0cOoDLcbth8JSDoqe1dEHMli7kE3FDsey
 Avtyw0OP5BBoutCwAj1tExG2fVcOlUAhW3yw7c925XSsHOPRxosVZCqZrnn7MkmMHLffCDKGaP1
 FhcM7zvaubBCuTzIRjQ==
X-Proofpoint-GUID: zI6I7AJJrZa2Bd-fa3n-oVX-ujge3d84
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b139fb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ND75c01xaBhBG1K22twA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: zI6I7AJJrZa2Bd-fa3n-oVX-ujge3d84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 1EFE226181C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33114-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the scm compatible for ipq5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index d66459f1d84e4d99c7f72415d08bfdaf1d701948..6d9b71a9b9b3fefd1951b963f34942243aa48ccb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
+          - qcom,scm-ipq5210
           - qcom,scm-ipq5332
           - qcom,scm-ipq5424
           - qcom,scm-ipq6018

-- 
2.34.1


