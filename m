Return-Path: <linux-gpio+bounces-35793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJdvDTwF8mmsmgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 15:18:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B39494ADE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99A2930FC075
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 13:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B1A3FBEBD;
	Wed, 29 Apr 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYbvHdIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ei0n/wAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D03FCB12
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468329; cv=none; b=YqudBicAc2Tf4YILJU/mAfSIg8QKy0UpZvv4mwat8AT5OGRc0+qL8xljyPxQWnbFXxhjggYbXFsuW0qQ4FU2Px3EJkTvsAtX0j1BUKAoEDB7pwXzoYUXTKyJMpPLO5VW2f238/mnw5VoMKXE5Os8MRQ9uh13rQ6TsBCxzIUDKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468329; c=relaxed/simple;
	bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iYFaaUGrJlKhcvQau79YKCQ0DEFwrT3prHBRUYbvMPnBKeDhV77ksUT0NRZaovi+nQsKjlROxWDWEcNoYcQ/tlO2SnG3IZvffhMnA54sUM6fU6cfszpklQJrRb9GU5EHElgbfmYX2x9NmQ2BN1wc0gclG0+rF2itNrHVvvkFU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYbvHdIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ei0n/wAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7Tv1721243
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5tcVTdVxFKWbPOvQ327MhX
	Y5HFY4B6nwROt9RjHUiXU=; b=DYbvHdIJcGqExfaDDBYQUX7jX+Vir7hdxBd5p7
	7/pKhw2zw5n0m07CDrDmI6b0rwqlM42pJW8VWTW44DKp7cHsX5CG9VuITpw4PUqj
	nR821edgiZD+ERbiBdn+bA2KT74o1P2MHK4s/ryvtNUb++ONTOriqfpyYLUDeswO
	GWAzELzslsnAK6JcdOv1L7smgGX0Bi+JBb+0Y/t7pCWzJPSudQmaXHtkm+p6avCx
	OUxligeTEwh7hQrAd122QYz35Vxlh90yA4nzOacjCh7rKzpQiM0Gjv1rtfRCYwdm
	6fYtCxWuBoCDNhUwHAkxv7EGQlL+fKzj9BJQoTTAgbGzEdow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua732547-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 13:12:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so7787124a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777468327; x=1778073127; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=ei0n/wAFqVFlFXKZJQ2NXcWSxBKbLa2IXzZG07og+f1MqyX9AWkP+ptrt2TYf8bzGd
         MRQRl5N146VKOJjnn/ZJ7KnvMbjy6KNiWKwKEN95kFbv0LcAxfsRWXFQmrP8Fo44ckFm
         gIniL7h4jTsPmM5ICmBL26HzWq1MEDuVliKu0qR/UqjrcB2nNgXSQHtGZFCj9mhnRCBe
         bvrHKWh09DbbmonzgDQKJbI1zLuHULMzAl2x2Mz7509yOmK7vcReZ15ZAAayxDq8baRI
         6xylOdWVtNR/JQO3f9mzSi+rKowYQ3ujX9IjHvfSToN/hka0TamhOCY5Z1txeMHlafZk
         hEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468327; x=1778073127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=YyrfEC2D693eXjEKXF8y04bvTEXlJSdZ6TldTBcWuZCGQzIdmrk65MwzbSb+Im4Phz
         aT3fzX1subOgjKrbZyXxoZp8cQ6ikPoPU7QfavT0HW2IvQJFG7gcksDOaakjYOUtyn/w
         zKU6Mtct8mG1/yd+2ZI8BoPK4MQpomQxokCaOPlnCzgDQqc0EZuAENN2ZKe/n/S+PiUe
         qamolFTBvNO8Dz/OgexI6ibceQ4pY75dG/NecoVjahQRCYZHL/yhl8va+Ix8N4j3JxnT
         ncMunPWxfEoUcphEZoUeq0IYwijbdlJm8Fg7GzS1bmz4iwYAs7GaJRI2dtk9uLS/vaCD
         HUSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SiKOuMc0SeMrmAK+m+E6bqJJBe6x6EUoONsJNt4O+/iwj776nOySG0O+8eTNGNcDO92HY1dIR5vaj@vger.kernel.org
X-Gm-Message-State: AOJu0YxSsDPFkusRpNx1ucPDstOkCP3U5mSxDpd2svxVEXQvQtKTbweS
	92/LowywdFfFb9prK8kccUuLf22K0mzBHsOtdWIhFOw/kfOZ0Z4zWrha5kNvVE7KpeFhBOr39eE
	AZZL5u/XlHGb9t15tUx/qsI1sXwaorECiIbkNf3fgjbuuDQnFuklcakDDVAD2H0rl
X-Gm-Gg: AeBDieshIB2BSRLLlhGoGUbCiX+1952+gvFg2/bO8C26foYqJV74Na8BvXWTt4IB8Z5
	BU9gtxye1j2O9/CvWtlA7H7diy2b1lfqkC1/BxhLxQk7+GFdFLREOFxD34mQVouCfjRUzUaJdgE
	t5mUirA5wc8DfhGsd18102tI/Yv3/pzBwoXaK3WZJUyxz4if3HbhdbHmMuyftW0ZKaTvmYy0+gr
	Z7c0NTKbK3mgJaP600qMY5THhPDEOl7fMo2O1C2fRuABM1FjvJG8mlJuoSKSnR3PiWuhSiobLDV
	ycJk2l3BolWdSLwLtmlGUd43wCcR/39Rbuu7orPnBooEWIGfJfMAJXoGL94v3TLg54Nuo4/zTR7
	1nhgXgbuwcxVg1xUcrieWusFJSfj2REQJZQOFnZQrJT6Nhfs=
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895800b3a.31.1777468326527;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895749b3a.31.1777468326058;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6decf3sm2063025b3a.31.2026.04.29.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:12:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Wed, 29 Apr 2026 18:41:55 +0530
Message-Id: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsD8mkC/0XM0Q6CIBTG8VdxXMeGQKK+SvPiAIc8q9TAXJvz3
 aOsdfn/tu+3soSRMLG2WFnEhRKNQ47yUDDXw3BGTj43k0JWQsuGp54uEfhEg5vjlQdvSrAVOl8
 Flk9TxEDPD3jq9o54f2R33sc/2xZftP6haXTkOUgDqGpnDap2Kd+qhYTcjbcbzW2hGiN0ECIYb
 cCCKnUmmtoIewy+BieVgAYgsG7bXjk/B/HgAAAA
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468321; l=981;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
 b=7suvmGo10znQ7hExo1MntSioSaikQqdZrIl8e00sFPl7ZeISuX5I8CZDGfMcHFtqL7p7E2xYc
 QQJdMSBePMuACWmZgCYMwlMcwyySOCTPJjyARq+m2RVKH6RsNa5tjcw
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f203a7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RKqVp3ilHWDC27yp5dYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNCBTYWx0ZWRfX59CtO3/dpwcJ
 yPqsQ+FXKo0FrpC2Vl3FZZVwDMpyk7t1ScfA509HbnaQWITWrDPm8zkAoRlRjxtK8HOmIXAM3SJ
 QXHRsf2bqEm+N0l1ZBiZzazpjQxZ/A3VIJIINqvb+xx0OBkS4IJGFE5EfuUSNLi4BIaS+A+4Qou
 ZrVHHJIfe0aWK2tx7eaqYE20Hp/jP5wJUwj7Drsw0LIAt9F/ZMKcRFL8lOc6fKBT6y5zo08pnGm
 AMSK89rvlMoKQKsZmNFLyAsIdWlaDloLmENjGUC4qQZ890xjK3/rULD1SMvxBSIZ2Fm0twYBL1i
 msFIy0qUgiZFhkSnt7flXjUFHVg3/ac/Y7SrujPavzp5em6zFpNqhznDYeiB6E8utbqEuI/dka5
 w1G5usN7hZ9cXaJLSfoTMPl2LTyMM5JsKuhPcs0o7YVkm+BYj+xYXGkVh1GkiAyZNRuNK3/qcbS
 8aj/o7jIEh4DzIWGg5g==
X-Proofpoint-GUID: MSmIhQrNoiKFlHANnOtQQxtgwZVpsSij
X-Proofpoint-ORIG-GUID: MSmIhQrNoiKFlHANnOtQQxtgwZVpsSij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290134
X-Rspamd-Queue-Id: 05B39494ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35793-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1280 ++++++++++++++++++++
 4 files changed, 1415 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


