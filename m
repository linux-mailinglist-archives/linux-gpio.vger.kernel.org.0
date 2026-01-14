Return-Path: <linux-gpio+bounces-30558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0820D1FBF7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 731CE3003189
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13A139A7FF;
	Wed, 14 Jan 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGUJ1khm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1Mw9bPS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDCA2FF148
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404623; cv=none; b=CzPuMGviUtApRWKPktE25H/92gHtJmi7Cn4KdblSRqqwK8Qwub8Zy5+pXPDD4E0NCiD5zFF+NWUi2sQQ1TFvEFh0uNi0Itz/2UKRguDLfJcbOoJYNCbnAa10M8NlWcqJoGvvwKF+JarYd0gbtalgWgHl91xwYghGcu50JrfViZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404623; c=relaxed/simple;
	bh=tLBiCjBbWlHcgxWjXHX4vOwOt6z6xjKJRXQ7V1ntRq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMvbrQfpJ/XIrJSk848gaZ41aDH294zmxHlR73SgVR/mrnsFAQYl5andmcUtGhppeqxsrzDXoTQ9AXwlhJBG+kFWQtpsYgRVLMh7zt12b402AWeJZ79EOxRTdX2v77c02lnK72tgih/qwHknQWO83+sxLgMCNNdYp20q0r7OCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGUJ1khm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1Mw9bPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECrl8o2736145
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNI8uxvvQGPR7l+L6hMR3h
	W88fE85OfdP454JvvhgWA=; b=bGUJ1khmgcJ9EcQN5yorfHm9s+OEbsZju2rlty
	Lb3D9jAp+XKVslxi0DlfIDk6F/tNu9d+bxU3KglSgYVqy+OHWQ4ZRo6pzwz6flrW
	T8knj5aB5CmbHJ7YELKzsSBWgfyS+N/1LKOdgbo8ZtxnozWBYszthopWey030LcS
	8RY3mQpE+FWYZtJ+3l9uxAIkjSPFDe1Zxo6tr0l2ldB43dsFLw5wpZXhMB1fbn9w
	S3ZCpTYmIJlahpENM1qLKu/SfI2kNiB54lRWVtBzOcgkk73rTLxFz9a1QVuhm/Dl
	xkMMn/POsbeEhWbkLj8oHlHBQRv5tIzVgZna1ndw6CUOnbUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5ggn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so2333619285a.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404621; x=1769009421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNI8uxvvQGPR7l+L6hMR3hW88fE85OfdP454JvvhgWA=;
        b=C1Mw9bPSexmhghaOr1/OjPltpV0b2HK9Lpu16r7HmuxCRf77HHhl41bJtsgW7jFZly
         Dca7f7lWJJyQlSsYb2HuR7D7Q710Zh5h9723Zq5890VyrmGv6XbZjx2guELWSHCD2V2T
         yK7DSRYgfZdUYuYyeOZHrIoyQC8YWbpkC5Qy46gc2FPw2yYY85h0eJf756IcTt9VK55P
         X7lm8qJH04my29l+sJEbCSkePHcFKXv699wtSHqoc8ZavcvMY+QCZvYyYLYRuVkPsnG1
         fsvw9Ms9HvqU8YOHtpOUqzwBj4In1sg6ktjt9cW2JlnAkI7JSkNTjm5iLfoPUTH5fFNW
         ywRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404621; x=1769009421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNI8uxvvQGPR7l+L6hMR3hW88fE85OfdP454JvvhgWA=;
        b=qEkOmikra0POPC9bvjNb3KPgfrJp6le6YSLJQq2g6x02qE16wDDW7JrjomZ80ZGddA
         BKn7iBEqwueVNpwyXb1KYpknPXRAbusLB+HGw58SeGue4iyj2wkYS9rFrnn3JIRc8qEi
         vuya2vlbcSvTWzPiagRpU/zEkOl2OfRV7ejb92SXsUtN2G/tdWMiT51Z7T9SNlGTIGs5
         3cSvPnZKk7jAaHB4NLZykWJx2hUSwyZuW46SzQqudE8Id/+VFIu8tAR5ENBpo4h6eAVT
         G94U5JvXLXJdHB7q5ESoEUt8NCrtHtSlqE1QGsYx2w2DPl7XwmJz8oEo+GyNb865YrZX
         YrAw==
X-Forwarded-Encrypted: i=1; AJvYcCWrlgh/vTb8UcwmtiYTrKQOetCE6W5wKzrvdtg3any8SWiIhE3LGg2MOeHEq9p5dZUBLthqW5h6/1bu@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/PQO9n8Vepy1MQ1Y6qkxqYeeam6MImjddAarZd81mxgArqvE
	0YfYajtQGGEG1wdu7N7WC36YBdnkmQaYLwlVefskPz63mUgBA/6x9SraPyu/DdAjswrfMBMWnbv
	oTlsyQRlDaQukmrARCXYOxqt+kg/HtnfVI2qTn/d/EX2u/doDX4C3zVHPVnSEPjnT
X-Gm-Gg: AY/fxX497T7hnGlvcjMaxxe07oy2aUbWyo9Mhq/LMzCRJv2GzCbhjyk6OwkUq5l9iAl
	1XIiL/EbAHpGFhXjzF5DAxfaBqA/c3zvdUwwfdtWR+AG2uwNqOZljkTeAlar7rig5O3YkKUCpeU
	kevtPfsAYpCSv8p+mubnJS5OwlBIzAiEhyvZtemlNFL5u7FFJmPzvhfcitFkmD4rbxTj1iK9pNB
	O4QT9HoPXi0Q3QQcj76JAgHDsO7byGXZxJdO0/TN3CROeleDeLTQBiHwfEzMe4Mdb8QYCt5CPPC
	hJsFWoP1EclUkTOvaj8ZFAwYnK0WEaf815NIVNTVT4mRPyrxUfpt09w4yn+ZX5I3+V0KF2pkVLn
	rXF6MbeziSGh/QJMsihCOz2TRg36L3ZS7VQ==
X-Received: by 2002:a05:620a:3847:b0:8c5:391f:1db9 with SMTP id af79cd13be357-8c5391f20dcmr14317685a.23.1768404620666;
        Wed, 14 Jan 2026 07:30:20 -0800 (PST)
X-Received: by 2002:a05:620a:3847:b0:8c5:391f:1db9 with SMTP id af79cd13be357-8c5391f20dcmr14312485a.23.1768404620110;
        Wed, 14 Jan 2026 07:30:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/11] pinctrl: Some code cleanup including guards
Date: Wed, 14 Jan 2026 16:30:01 +0100
Message-Id: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHq2Z2kC/x3MQQqAIBBA0avErBtIi8iuEi1MpxoIk7EiiO6et
 HyL/x9IJEwJ+uIBoYsT7yFDlQW41YaFkH026Eq3lVINRg7ukA3dRjacEZfTikffGTM1pu4m3UJ
 uo9DM9/8dxvf9AADMOgVnAAAA
X-Change-ID: 20260114-pinctrl-cleanup-guard-d899b4938b26
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tLBiCjBbWlHcgxWjXHX4vOwOt6z6xjKJRXQ7V1ntRq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7Z8TMKf/lfFyeSTM/M1j6XDCA8Wp6BUF91D3
 zO2c6gUYs6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2fAAKCRDBN2bmhouD
 11rAD/9G7/7wEMdhg+g+wsJ1qK0dlmT47qpvnepNPGBn7ulx8w1XXqWYZeMcUV3FqYkM/unOBfa
 /j/f+2SCaYTpvr5OTtrEq7gvmvc4i+xIYBmtbmXv9H+iTOIdfcRsTdC+1Me3hO0FZbhSn+x78NX
 MA78rctIdTOmORwQNbwl7TJEJfBx+MOrkfqaWZp068wwqTLUMB54TjlYM6LVM/8Xt6QOfVuYNnH
 oJSuTXAIbagfach8zvzaZNHXnzMPpQ3bl5lWuvy5GdHMrGTDCcmqa4P21vttOAt3vBPCQbg+njL
 GNRtUdPsJRkYcxug4R5mgHlDzHIHA+mT7Q283mX/Mt0AEiHOCvXgBX+QuGDJoD8tUp6wZBP6SQX
 5oK/NrxrZwOMrkOA6bL6UBm+Qjwsgn6tI8SZMiRQTRqMqMs+mk8aUWl+8lxbZ5E/wfLRDted2Ne
 cUJuXFvtbSaeNk7uUIB1a4odcZbaJeGdUGrCH8Co7/oCNMC9peu+0mKGzSGhOELAFTmpyXIoJMD
 CeO74gOAXocQ06tFzgACu4A580TuPDmGDV1CmHZBWlmAqp9H/vU4TkCvu/+OYqnSEfjNDWE45BW
 FZHN7/Hj9kw8wuNGaSc72mGkc1TbSjsidesIUPZbPehH5Uvi4AFMTnO7fSdrwjzVtOk4cah5WMZ
 HA4140yD+lkhxJQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX/EwpKTDwlcRz
 Bo0pcg4H86JxSTA0yxGOFeSE/hScSBPL2wd/MLGN+nBkSNf1L/HJyOxDWuK5ARjm8cTybCBN95Q
 cDiQaovKQSPeogutj3TLba47Y4WFC83eso/Zi+fz2L4nkVwgKQtwRNEigA7kPNoAS4L7AnLmp4o
 RUIHGrvchWh2o/md5SRJZEntbsiyhpKzkkFYh7937wbqzVrVVZTxzfNEK6rENCY1CZiijMRirSv
 NsM+wUUNuu62NEGrmHLBQKDh6f3YdNsD3TyoNQJhXAjwdF/DxFw3dPXoPMAYp5DJ+16rn2ZDWB7
 nglTZ1dXkFH/sridYiOaz2wvSB7jggmX9bJRWgdZYMH7c4Wu9ft/BPodWUG1c9EpyTF37h/nqBa
 hpyBSgF2IuAsk4tYzOZS0Usj0XlkX3qGPk0Gpb0SEEWf0WLkklJ7bacwPrxdmy2AISAFA0rjduH
 OZhb6z5cZaf+wZ6RTlA==
X-Proofpoint-ORIG-GUID: 27TVntrtXFxEsB2IntmlXxK1voiMb6Qw
X-Proofpoint-GUID: 27TVntrtXFxEsB2IntmlXxK1voiMb6Qw
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967b68d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sUpYk6MsUIlSHpXyxe4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Few cleanups - from unused headers - or code simplifyings, including
usage of guards when beneficial.  I did not conver cases where guards
would be mixed with gotos, because this is discouraged practice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      pinctrl: aspeed: Cleanup header includes
      pinctrl: starfive: jh7110-sys: Cleanup header includes
      pinctrl: sophgo: Cleanup header includes
      pinctrl: amd: Cleanup header includes
      pinctrl: aw9523: Simplify locking with guard()
      pinctrl: microchip-sgpio: Simplify locking with guard()
      pinctrl: tb10x: Simplify locking with guard()
      pinctrl: tegra-xusb: Return void in padctl enable/disable functions
      pinctrl: tegra-xusb: Simplify locking with guard()
      pinctrl: rockchip: Simplify locking with scoped_guard()
      pinctrl: st: Annotate st_pinconf_dbg_show() as holding mutex

 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  5 +-
 drivers/pinctrl/pinctrl-amd.c                      |  2 -
 drivers/pinctrl/pinctrl-aw9523.c                   | 53 ++++++++++------------
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  6 +--
 drivers/pinctrl/pinctrl-rockchip.c                 | 19 ++++----
 drivers/pinctrl/pinctrl-st.c                       |  1 +
 drivers/pinctrl/pinctrl-tb10x.c                    | 17 ++-----
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |  4 --
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |  6 ---
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |  3 --
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         | 28 ++++++------
 13 files changed, 55 insertions(+), 96 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260114-pinctrl-cleanup-guard-d899b4938b26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


