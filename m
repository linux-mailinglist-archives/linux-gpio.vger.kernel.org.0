Return-Path: <linux-gpio+bounces-30052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3CCEE223
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 11:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49E39300FF86
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B662D94A7;
	Fri,  2 Jan 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkZx0ReI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXxBLCNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B42D8DC2
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348619; cv=none; b=gFXgcW121R+b1ap3qW7NtgG+fLCqmqUBHdy0hp7wio9+dSHgoSU/glK/GnNouD1oDCF+rbTf8lEBgtoS39VHsIB8y3PKQXCGap1eo13xYtLozrjLDZahar4oWfatcA507wrs49ZtvRFpFZCGG+LYmXkewlLWi8UKLSn5UF3ufrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348619; c=relaxed/simple;
	bh=XpIJmQlL3Sl+tDUJPYtrVQmGgo3yMpSmB37yKyx5PLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dog/JhvffYGfv1mc2TkeglWHt55Y1EfP/NgGOK2KcI+B8pL7KRXeZ2Rh15xZgiGYABujRbxYQVnRE6rsoinTgatA9XOaAVYovFDXKsGR7C4RUmpNGNX3ETgCdAgtdj6Y7272zUGZJVISV9gU1OWSPw0RoyU9JdIlZ3RpK4x42fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkZx0ReI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXxBLCNV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WF2o784647
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 10:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgDNyMrC3qbrnIDYan9+7enA4wXRjwqQD/hV1SZupcI=; b=MkZx0ReIdz095PWd
	r9VIHp0hjdzXL5GcUg9J/ClMHR5xMf+hRLED4Ba1atm4w7tc39zpVQr7PuLsKVs0
	NvujxTUSWlLDAYV24TB/dENjAc11zfjTCSthDaup58VPpxeuvF5Vn6/1vimzq2/F
	BNJ0eRAC3b3ZOsb0uhGm/D8gC0Bx3TRODcFWZzZDQcGeBo1JryHPEKUvCzRBFCJp
	fJkirUYz5NyZTxAKZ+T7t31mlkdadEp5kIpn+8f9GpaXpEGPYoM2jm7Rlw1XAxCe
	oHBr/hkqz17w4p1Oca/mQHRu9yzQ/Chn6aZAZ8EAIO4vxd0fthKGpLRH60vV3g/p
	QMPNBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtk4vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 10:10:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso474172451cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767348617; x=1767953417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgDNyMrC3qbrnIDYan9+7enA4wXRjwqQD/hV1SZupcI=;
        b=HXxBLCNVuPbeH5XJ5IVqymK5b/0y76oXPJZiA5Lt/frI/KDbaBuNDP5qm6719lwZ6D
         DmhZEgxCywHF+AyE5ks6LrYIw3DPHlOC9JnWnvaXdmJolo3h/3Y8u/4hg+Gmo75nYk1L
         EKFktvvThlP1lMHiXe7XWc2A9orrkw0JZZZwbABqI14CLmg/bZC8oeNGrRqdZfIEeV/j
         IpjfRFZGWkozqsRIBsUh5xz/bsGyqCxKykHWz0dC8yD+SgF2i1OlmPg7x0gO1xfaM6dp
         Q7FaN4rdrZONvo37hkCuRNX9CU3LEUs8KL0piKpMfIGWTU6129R2OprlEM9so3gtdu9Z
         3wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767348617; x=1767953417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgDNyMrC3qbrnIDYan9+7enA4wXRjwqQD/hV1SZupcI=;
        b=SxGpx/o4LfBq8p/LVzdSxOq3P+bwtazmdMhNInWkDryKDDjJRQ9gq/9VQ8nX9BTvQ3
         EDGOE3qZbYkWV5y+d8D45y+Mtfk7qOkz2KLwjVw5H/7yDJyMPbfumZS6HdweA+x1sadM
         VInbG677t96BebL9ZnzYBc1VwyR0NTXyTCfyLrJA5HPi/M7jqHOwSXPP4au0b2Ifx13J
         zc2Ta4ET1vgwHu6jYXBOhx16qJADYlXEyePYB3HIMlWOTNy+OSSBr9yHGSeM3ONrvGeo
         CmXMu8Yfb7UiMsyoCS2T5VVeyam9u4vERhZ/uChnTv+/BRVlz9el3Y2/5377DuiVEPVr
         fekA==
X-Forwarded-Encrypted: i=1; AJvYcCXhHujIOLLfgGkcF2TkWTJIv/Q72DyLiIciMeHpNLnX4JoSBb3UWh/f42cf37BQdc8mSXuMWuMMbz7k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RjAxVusVpCfArlA8+yCQONxC9CPdH7O7Lg8JADaNyk4pHtwc
	lXuwP26BkcRRqwMIvxEJB5CstRjeIOTiVDlZSCO8R8aorMAyJvO6swQn7cC9cfcpYtiPrpZuMAf
	IEqaLqFp9IF54PYWv8pqygjhGdQDrubq/Nbbk3oxM+A0PZt/Qe9QJm1BGI9goSdem
X-Gm-Gg: AY/fxX7oX+04kmeNtlvj95t61beGTkPDxMiFQ1trGYRLxfTi54CrloS4FhL4i+IQWYz
	kQIoMuM6VukqGMt/qW4tQokvx2HD0LEpE/Vfx61DnsOR7EVSSKmfY3wvSJl6+1YNLy+ikwRU/WG
	MABNsT43/Hv9rOGZU7PpuapAiGhsJz+GActmrePWzFRnJJLCBwoRLwZFz+RUX7SIfeE+kZUh0NR
	Nxl8f4GcriZg1UKTA3fS+gBzWO3NrKlQFJo+4djl7DrQDFbPPW70WANAz8lsK7uk8VwPSi2rgs8
	Jrx6iQnfFz6qmvAnKB4T0bd8aoD2BEaJjhd/QurS/6AfLFs7/Akw15i2yHrYeDrId+i+acUEZkr
	Jsq+u5b2vWugk0UVo9AjjqG7Rk4KraAkvRLuarA==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr696442421cf.31.1767348616755;
        Fri, 02 Jan 2026 02:10:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFboxg4nUIeo7nSzU2md3vF7L6ovEkXsfN9BuHMELqsmLNGabAjVXHbJT2brB2i+k0o+mgwTA==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr696442261cf.31.1767348616405;
        Fri, 02 Jan 2026 02:10:16 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8630:1161:9594:98e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85248647f8f.10.2026.01.02.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 02:10:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Juan Yescas <jyescas@google.com>
Subject: Re: [PATCH] gpio: max77759: drop use of irqd_get_trigger_type
Date: Fri,  2 Jan 2026 11:10:12 +0100
Message-ID: <176734860607.22824.6542638957796375889.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217-max77759-gpio-irq-trigger-v1-1-5738953c1172@linaro.org>
References: <20251217-max77759-gpio-irq-trigger-v1-1-5738953c1172@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=69579989 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7zw8kN4A_IXOchaXtKwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RAZcbEUGNRPpxw3pkJ8mIFUw3-gda1kD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4OSBTYWx0ZWRfXzQ1k5Wmpzt0q
 cS0hG/zc9ZBGRARzfV0o2PtV5+0fpHeOroRAKFjzq2lV/qFX6X4b32PNFjd6BlBoLN2dQTHqHAv
 YBHfPDUgcqN8hs5Qi2z/azLyneI0+f1QHGh96nGd2JPXXOS15YU20gSn5XGRGL49P42HUQ+xN9o
 c1XO6zGr0arX3dX6HqASJxvvECNvAtDnYbCGRAAvKtqWWhu31d1ExB6X3FFdKWHSXtCuwaC5cjA
 21/ZTW0LYcU60vtAubuGZrOj0suKxNGzplGuRY+wVjrnMfCPhg3caTZ1nI2GWYXkcRsgX30yoCW
 qkY/Yq0Df5U8c5YJhDdHRDPSENMnqoeqfzUQoEFEhtFRjdHZp5dSbM/2sN4SCWQY390ikOKdA4C
 yZ+xjROW6ujTBzaBrIYBfLWLqdh5CQjcnEBpz4GGTMbPEVyMubIZi8Nsg6W4Btrjr72tNZpf1QI
 zLQwte44BkRCQO4vdag==
X-Proofpoint-GUID: RAZcbEUGNRPpxw3pkJ8mIFUw3-gda1kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020089


On Wed, 17 Dec 2025 11:45:06 +0000, André Draszik wrote:
> irqd_get_trigger_type() is meant for cases where the driver needs to
> know the configured IRQ trigger type and e.g. wants to change its
> behaviour accordingly. Furthermore, platform support code, e.g. DT
> handling, will configure the hardware based on that, and drivers don't
> need to pass the trigger type into request_irq() and friends.
> 
> Drop the use from this driver, as it doesn't need to know the trigger
> type.
> 
> [...]

Applied, thanks!

[1/1] gpio: max77759: drop use of irqd_get_trigger_type
      commit: 9d8107579ce4f2369ea3f670585710c30b14a4b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

