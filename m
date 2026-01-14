Return-Path: <linux-gpio+bounces-30569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C603D1FE2E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FCC8307D177
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B10E39E6D8;
	Wed, 14 Jan 2026 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CymxLC2N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMiRdVPb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAA3A1A54
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404646; cv=none; b=IYZHNmnc0UULOklN/ayKi83eKMyjT8ecMjcGKMeQiU5THsF+bocyWb8cyzjd1zkcH2z5t/Ei8lt2ztrU283na+LOMfjbkdH1/ChKT0hqPvQo004zixRodfsNDLKRSWMbSIOrfo/D+37MT4grw853PKNabGewcRjd3Q0DP4auR4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404646; c=relaxed/simple;
	bh=SjKuvqUidPJ5fm3b34nm9zaMItl1NLBQXfR5LWGDZIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTIjSfFM/4W8LTHnJTTuwEsxJh3USMxSzVG3lLnhXcxWS61FXB4O7mEZpyjsj2FTFoGMa0qf/GOai/HjppfLRjbPajI8Ajn10dZxzDSacHscq9+6zvR6yji1RC/xolksmmBVsrfFxQhphVaPPfIQAQrkgyvxvZBlUtP+Ih2IDAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CymxLC2N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMiRdVPb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChZp63925615
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=; b=CymxLC2Nh+Yhitd8
	i2VCkipA2Jvgf58dNARhSsT8C3NBVFuhB0in5/s3k2byqbKN2anrEGds2yvZ0cT3
	HsKWrN1azY5/EbZtPj1RgkYGi7uNgFYsmUNZvbzqrQF1UBcNuIOhSJoSKpPFum/u
	QjvnNThfwoYjH1wOtZj1emLDqD3KisvQGrK3TjABDHrH8oCkwD7M3Cq2ycUIUVLo
	EyImefGOULzlqVV38fX0afy7dTmZn9JKe32HxRjrZxhMeDK6l9+WPDORB5pf1SjK
	8mf1eqt4rMwywhewmr9BDmuYFEvSD8GHa8Z4iL0KPBcfA91OEd6GMxp5lCqwlV7t
	kPXvzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrha7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f07fbd0so439521885a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404643; x=1769009443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=;
        b=EMiRdVPbexrxe1BDkE31eiwI0DJf0hNBAPH7GRtJUsTtCz1bbeKcnuPK9+N3OVIvXF
         i8VQQEguu6p7EN5sxtAuv5bUE3d7rIMpF44Q5dydroHueQoJ1u15OolGzrlEeQyghFT7
         6sVPDTvp3wuqSb5sMuCA8DpLQDiqp87SF1vuXy2KDkSdaHJ4CsDFJDzNdF5Zf849bhKJ
         iQG2rix5FlFmtgQFfjkzkiWdopyTPSbN2Ri7HuDuJcnk0XOjeXy3XgtuNrhuZ4qkzak4
         B2DQlbPYd1QrJdgI8qUaStFH9swwjfYC24JWJ/EpdPdhHXDXaeUSyvZAUi/jWs0eKRGD
         26Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404643; x=1769009443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YA3VmuPxJ2L3DtrIn8wKabMcttC/MOL2mTB3zxLU6Gg=;
        b=XRZCU1ypadQFQRQ6YvxvI6tpkBgB6j1u9tDMphz8BUvl+WXM7idycLA0em1gtWC2t2
         lEf0RCkaBXV417YlYasb6eQiKAceL0555CsXp38D7+loTk1ro/PeODyjj+2i7W3AtRV/
         2cKmymHvlEubqAtlUH1N/4MXaRs7A8EpSVnfCl1o8qwQ4wEzqHdCE4XZKNAScYr93yBc
         9y/mu06eSe0aIEfHHA4Q/e/caBy2syhR9zoJnPb3zVfaXMnzozEBuSUpt7rPRrqh05TG
         yYUI4s6R4jf3umOJY1VFI8AX0hW1VLkPPSRVRJ4fwIds+i6BYv2+lySwpegXVPzZd0WW
         j5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbYONXXlX0WNaw42ZBKGRiuIIzhnw+fOIEpOQQb7veI6vUmW4PXz0MVxdwfeX382Pyxjf2tFM8kqmV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ggnNjVgkfabUbQivcI3qTrAYZHliMzbqyBMzVWzh2f7Ts6qm
	moXIkWU0pNnYVNu639rkx1zP/QR4RTRGWABrf7i1A1ndHUGfEdCkwKLUVxN87Rve/KQwN92jzE1
	omqNmH7w9ZlEqFE5bxKmA7ZR0ugQZ5KbbIe+ECWzbVVBDsoBTZ4HmxuQBmVjm7Ae8
X-Gm-Gg: AY/fxX4+aM9G5mcG8YJV+9SkXRoJlvLnNTLgNxKT7JPlVRDBGWcqydYnv9jV/jmmW3h
	f23dXLiTb/RMA4Zcw1fT0RX8kQ8Cidn3F2y3AKNYm30CWY773lK6frMyMxErnrnVxA2q/6VRC7C
	Fgymfz/UBI61aLiEYE+EIzXKkxP0+0MvUCcjj1ASsX5zPCaHJuecTK1JO/WIjT3yreUa/tfhV6b
	YA61DXG+ns8L/mqvIX1kdNtQizS9787TjT4Zlz1rwYIhrmP0q0bdbDCjZu71SJUjYuT70Ge7xTL
	enYmL2MEffUIXfSvs0zlTqJI5d8WElZZRCqUKvF5HPp++sojIb/ZM8MfpOpITmtRZ+nlt0Pfaga
	UkpXMmxklt0bHXYzvkNwPqPZdoL6t9hJD9g==
X-Received: by 2002:a05:620a:489:b0:8c5:305e:e9f1 with SMTP id af79cd13be357-8c5305eed0fmr269948785a.35.1768404642838;
        Wed, 14 Jan 2026 07:30:42 -0800 (PST)
X-Received: by 2002:a05:620a:489:b0:8c5:305e:e9f1 with SMTP id af79cd13be357-8c5305eed0fmr269941485a.35.1768404641970;
        Wed, 14 Jan 2026 07:30:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:12 +0100
Subject: [PATCH 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-11-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SjKuvqUidPJ5fm3b34nm9zaMItl1NLBQXfR5LWGDZIg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aJM3IeY1gDdJ/me5IBtT+aPwzcq14pNkWtM
 OPOQAst1h+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iQAKCRDBN2bmhouD
 157+D/46tj+ZWnUE7RsMD2CztKOGVGuOYzCPiW602Pq4QhElA9PrVOh9VIyCLBB4SAqk59lZVYO
 MlOwyygoSEozBQN91oQ75iEXnJ2aFkB8b20ULI/EMUFnyX6NdIMSpVnIDtcXgX1RxtvmdcYlupv
 d08RjFjuwR7LM07n725h6qKS9ZYbGJXlWsH7hlmPWz9uaBnMvZzlvEiGRcxJvRoIWynscL9CB/e
 eFLs1++3wid48u19QEMpcRMV1MeZTv9QEZFnOFzKRAoK1CYtDEfXVYfNebfDK7IZVx8Zqe5vmF1
 thvHVTfdbWtXtejVJI80z4+iO3us+I+e5+NIqhB1sFl/hejmicbZHh7MTevMq6l7Dx61o72dT3b
 BhdNFYKwza+3RNldEDuAhvQRBjg2Osn6flZIO1CR3aOlo144cLI4IOzTKuAabhDB5TNFikqrvrL
 0xDWRzt5IGOfkrJc8g9H+D5W9i+gkNFuirIpoXQ5tVjSuxdX3YHfj3OMC8Y6n7eAVVx6cqYfgR6
 nkcpzSTEOenPtMlHZzvr6whjmpwnN8lLQtvA85ZpjgGBavOqUfo3Q+2StXsTFS59+ZZMsU481OL
 hkwcnNi21sXwyD/y/MMq0KvbGR+S3+SbDRux5b96048SW88pN3twiCfZ3TKPRiPTnwc8noN8qv/
 lE5bKl/wMPXzUNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967b6a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RIxbnQC35JVfspY8PfAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: T2ayL_L7cayRo10vhSFgFUBL9QtFhn87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXxvE/A/90iMur
 C9Y1ihEDiuTlRSvUABa+nxBjDiU5gcl7P5dpFAYoHcXr0jWlgPvMKEd7In6UK6/36VmGGdbgGOU
 mSqjL9AZ6Gp9O4I+GX0g+kn5LNZ8ScQyFJmvpbgsYYybkwxg8fW3IYVk6bSDEXsvCzXnmfCFmzM
 WDVFT1JO9kEbA0xhyDxkD7ieQRgrNdPa/6Q7H34dfy1lFF8dhYyqCXGllx5j39uHlqkvCySSp1D
 QDigTmvt+Po3eswoXvblmawq5+tfmpBmxNbHBBJ1eXSyfp15VV/jAzVaIWFSH1Px0wt44cCqhs1
 HB43u+ej194PCxY/roNcNbyUqR5aA9XOI/Ob8UgXaW/AJHQ6InP74RYglDD7AWpa/32hVKbkxQc
 0HEeYyYAtQo93tHJ+xTugrPqHl7goipQpab4CwAfNOsozsD/QMECyAk5uc3H2/z/DwhbkRdwr6f
 J0a0EkICILtYYwwYNFg==
X-Proofpoint-GUID: T2ayL_L7cayRo10vhSFgFUBL9QtFhn87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130

st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
must be called by the pinctrl core with the mutex hold.  Annotate the
function with sparse __must_hold, so any changes in pinctrl locking will
be statically detected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I think this is still useful, although maybe a bit pointless if core
explicitly always locks every pin_config_dbg_show() call? Anyway,
pattern of unlock+lock feels to me like something worth annotating.

I left the patch at the end of the set so it can be nicely discarded.
---
 drivers/pinctrl/pinctrl-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index d3cea3437d7f..8ce88e591f47 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
 
 static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
+	__must_hold(&pctldev->mutex)
 {
 	struct st_pio_control *pc;
 	unsigned long config;

-- 
2.51.0


