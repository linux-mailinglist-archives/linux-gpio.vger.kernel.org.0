Return-Path: <linux-gpio+bounces-21931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71709AE18D8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 12:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 075D74A5193
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 10:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B07B283C89;
	Fri, 20 Jun 2025 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQk4H/53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6E21D5BA
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415436; cv=none; b=uHFdT10q5yk7GXgVPug/RIhadIqmJmYx2lJ7wuz/RlGc/g4VJr9q8NeXbdiH8OaO6tmKKJQs3ebtZdzv1FjrX931UyezNU8NvePnh0hz1505vdmeqEDafpGl1IMZn4K+bkMcamFggxNQoRrkfCNPAURIkSGmbKWSiie8YoJCHlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415436; c=relaxed/simple;
	bh=sgC2Whj/3vbEMtngfmMQs476p3QnA1X+r6uPn3gJqi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dWCJMXzimE/03KMVQcOEwDwSh3nH3/lFtr49JwX1Qe5HXgm6LhkzE8SwL6FBT+QeM+xL3TuIzKTkRNWP9q6c9RHmjBYN9MwGEtNi8DoV4j2POsfAXVZvvfPb5/wWEeVRemSqkp1rnbGaSzlWIqtOMbQ+Pj7bhKTA2V33BnhcfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQk4H/53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7BB6e030619
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FbdfOeO0bVc+E5H6UtRtwG7+flUxUfZRFPi
	czgwcF5E=; b=AQk4H/53ukaLwBCaxJXHl4npS4D8ADrpNpOQP1P2Qa1DLDqW6/V
	dIt59WjYkF39/XIGD+zTUZ8gf3AY3Bf7UbQWhr0ndEEvmT4nGbz4dyvl3CmGOXKv
	H9cq5C2vLXUBLStG/Pa5OMyB8TbHmQBMOr9sDTYWzvROZo85jCu7wpuUq+eGU5M2
	I/05N2S9g9cdIo2NjqSa/VX25JEPZ/MYjDNNXHSPLyvBuQ/XVL4WTik4sUaw1O/4
	+NDP78Bq7vhE1QX2aUgajWDKdZEHrMQRbVpvECyIXZFiSRvh8p7PnCBAhzX87Ut9
	qSGqA/z88o5tIIU8g87hzPl6AGSoU1CPZkA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mtubm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 10:30:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1631600b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 03:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415433; x=1751020233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbdfOeO0bVc+E5H6UtRtwG7+flUxUfZRFPiczgwcF5E=;
        b=TMnlo6sWgCMvoP9L8UdQpvJDEoTMlyu1wArVBIrBTaEkPDuvoYct68nmYuH78BW0W0
         7E7x+is5jqR+UEpDnNUk+rV7Bh9PcQTHXh2BLWYFZTfYPemCY3HRDEeEX8UEy6xt7Ltq
         4pbebYu3Pgo1XlrNI49kThZxlB6bVRAg8fGxLaY6azQA9DBOV81LMaDm+THfm1bZN6D8
         D89lJUteZn057LkflhLn6CDhV0Xbdu334+HFFM3i8ZuocSfrdp5NNDYEMZQo5vv0Z5u0
         Z2Y6rehMPBR1HTMu31Q2jnYbelk3DeadVDWLnxhizr8vIDTPirvFB6ueZYXQMuY8l/3w
         vsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXznBdkqIzUI7LVPQGeBHqTkg8bW5+IPGc07dMbSaFeS56TOhcoPHc76DMFuDQLfBI4GDAZRpB1AUjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKlC4sDMI/PssHc8JbWaZ9jwcKukUdZ/gZ5EjrRtzk0YyUghma
	/NW4qGa7AYohgVchxeh3d7h0TkGV5ZLRGc8s8VjmY14LTFmGMrJmCLVCqO1Kd2ePZfnJzD9Z88H
	DdjXpOCz4PwlfjilvAPcoJ3lYG22sKPj6OYnkcE0nJ1lNCMUHw4eiy/7IeDGHyFqd
X-Gm-Gg: ASbGncuZuQnTaHM3U1EIr0/lcgcQ71T80GMMuJdkczrE7C9ySF4wr1PnJazN8pxv9ij
	tOh96/JjOgsKj1FQ72uIpIXiAttg83vVqIgiTauCsQBOYbNu3RJiez6/L2UbaT5mm3Pv5u80/RL
	KC3/Bntgq7h0IGI6deWIXTWoUosmHNRwfxefPnAsioqd+DKssEPxJgXVIzi1lfPJJ91L/eOMNEF
	jttT7TpC9abXwMnm6LhizEFPMAHXT9YBTAHzR9rQ6qPPSbH8vu8wjYGFOceh/jbZyZTwvySep8f
	GmoO6CWgLQO2Jloj4At+5YM5Dma34xfI3F941ljjRDppv+M6gyJX9cJMfuw=
X-Received: by 2002:a05:6a00:1903:b0:746:3025:6576 with SMTP id d2e1a72fcca58-7490d7603cemr3495653b3a.14.1750415433210;
        Fri, 20 Jun 2025 03:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ/+4QqsS22JhshP0B6PhCXUoUSpqou6/RFBXaJnb7XCQOCglCYDgi5mhrBQ2/geb1J7USsg==
X-Received: by 2002:a05:6a00:1903:b0:746:3025:6576 with SMTP id d2e1a72fcca58-7490d7603cemr3495595b3a.14.1750415432767;
        Fri, 20 Jun 2025 03:30:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a69f3e2sm1651347b3a.159.2025.06.20.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:30:32 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Handle shared reset GPIO for WSA883x speakers
Date: Fri, 20 Jun 2025 16:00:10 +0530
Message-Id: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3NiBTYWx0ZWRfXykHukMlBL+E1
 7FbusAOk34IOxYmhU7R0JC8NL/iVPczc8aGG70cRJDR+sw3vhHke19I5rYFFPp8HxaV3YLLZAOA
 osZhqSI3OXpixjjFCMj+GyoI33u1Mq0Rq+HCqPq9esSgQb93vovX1WWWm8YRXaoRk4qJcOmK1DH
 RigQPo6rrQoR3ByrxBUW1Tp9uEb2bHSbuIFWcut6Ym6NJeie2FZRaoS9dXnEphCD0DqPoGGBM5Q
 uOgGbeeWnA96+0UpTM9GV0bMw9aaohssbFayMqMBCuHOQ2B112jmJFGQyGp+1yk2/XFQUGUbK88
 Gqlyrz6DIKa8XP76ahU7XbpAuUkdnnasNEHznSXy4GeTgKrX0Bc/UbnH4xuFXp/FeTpL3jIM58d
 DbqORhunrBVY7nHvaG4qhVpIuZp/1VN64NRJT/BuNLpXS9YHW6SIDURQg+kFl/rBjL2GrhwC
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6855384a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6IFa9wvqVegA:10 a=_GLtVs1PZ0YSqw2nQxgA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Zj23HoXvhYij_ps7BO_3sdL7e3fMCETF
X-Proofpoint-ORIG-GUID: Zj23HoXvhYij_ps7BO_3sdL7e3fMCETF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=902 phishscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200076

On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along with the
"reset-gpio" driver.

Tested on:
	- QCS6490-RB3Gen2
	- QCM6490-IDP

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
  ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers

 .../bindings/sound/qcom,wsa883x.yaml          | 11 +++-
 sound/soc/codecs/wsa883x.c                    | 57 ++++++++++++++++---
 2 files changed, 58 insertions(+), 10 deletions(-)


base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
-- 
2.34.1


