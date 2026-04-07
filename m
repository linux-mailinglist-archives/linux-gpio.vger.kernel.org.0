Return-Path: <linux-gpio+bounces-34784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EI3C6H61GmgzQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:37:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7613AE7FE
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDEBF300C039
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2291D3B38AF;
	Tue,  7 Apr 2026 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2pBuD/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5Lmz/p9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA67A3B388B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565469; cv=none; b=L5Jbix/STpuJpL/j/VgcBScFFHivPayvCShniKaj0AMQG2F/3mCY11v/BXF9bOgZ2avc7rg8HnkuIMJ+Lh+/4k6OnmQkK3Dd7NNcl5rF8QHmk4+msWQs6ZaALo3FY8Ytgs+dMTdqcX/kO9T+kVWV3wutn/8ShOybSShppcXbDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565469; c=relaxed/simple;
	bh=pPLwvKNeTnmdtgzxhw5QzhrBiBF1QRrgkjmX/4Fyfzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLzW1NKzHYYB6mq5abj36vTIGFHd89+fKUP4SUQ/QU4nYfB0Dclzum4eUcPI2pIKECx+APTl/U81ouhYATNUtULAyF/9L57PhaxtsjMbkbTGksRjZGyrkBQsfiSW/Y0MJtSq8aDKVCLaqUdX07Fa+i/SoTbgPLGCAfSySKitH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2pBuD/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5Lmz/p9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X4sv2327732
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 12:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxYnPuyjN4awts8OJPwe5t+UpRrz+FhwU6PelYayldQ=; b=m2pBuD/w2XG96ej4
	X0lHUY6FE1Wi/GOEWamt2z/BENqfwY1/Ou7KZmN8FDyEVQKD3kdQz4MQsGxzUCK1
	EwmwVuzeJoLq3Ge0XjTWRUUA+5W5OwCeEgys+hmwKohgisxLPVbgSJ3NgvO+V8YU
	8XxFvdxC3jXfwolle5kogSbqHOIFHSpIwJmPclIYrAErgcSxZX1x8PS9qGQpyvga
	6fE3Tr8IBYSOWR0spOuGETeO6r8i749DB9sXU/ZVEZGyV+0aF5cTIYwsbqeR0Kuk
	hPR9BwQtAwe8aIsndyRC8lBZNOTycH3hTZTQjb3MiEkwqiCEZWFgcheCZvco+imV
	DSj+IA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tpw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 12:37:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so47064221cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775565467; x=1776170267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxYnPuyjN4awts8OJPwe5t+UpRrz+FhwU6PelYayldQ=;
        b=Q5Lmz/p9ETWc+5Q9dxesx260JjuCh67ssBGRbF8nYbOera2vBKycJO6ZJpNzJoUBij
         2D2g1wpCMDf7SAegERk9x36qcVIjiXZB5jOathDtTOF5mNbQWUWevmOqBiit4hDRSY5s
         +Kvn4hwOfWj1ufsysuAXsev/xpThU2qOeO6IV0S0gCd6/OjRr7sv+WbHwjx+fIMAQWm8
         bHU/mngcSLvRNyAbt5vhb0k1141qfW3wlen9Ib0tzQDkg8Ape8uQE1PqeUbHB+EVL8s2
         26F8aloqGGwXV6n4plq07aIpI7r8Ab5dklW478eyvu9EfpiFaL2zy3uS3nXJoKb6Wgzh
         VP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775565467; x=1776170267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxYnPuyjN4awts8OJPwe5t+UpRrz+FhwU6PelYayldQ=;
        b=gaq3a7l0K5HgrD3DyFDYAZbCdApfKysomK6syLEgB+MUAq6QNosUjgHwrI+0aKaO1r
         hqX97ntecKUzrsrfesw7GRdb4kHF9XOGz0WKZvgaVFqFVAGpB5BJVIsmyY9e+Xy+yZEG
         qy+J76hOm36IYciizTcviewIS/4BhDde+2bEMArOba5jxaLHmkgXvCIADfr96RJL26q3
         lHGWWPzahlQ1bOzg1lLoNXH5EW5FEkcaMSh9d28JzH9/UOCAr0RrjIcbOEk8MZkSyXgA
         nRLoX517o2YaNRlhNFqi/+8nk7fObpB/0IId+cJa49DZah76gDg7r/IJsMgDuZqcKOA2
         R0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXB0bSURKrw/S5YtOdfcVaTyOFJszDTtPXm3zMaSqn1xRaZcOR3UIWPL5Yj6bytMBQ3Rm8BA8gWe9mW@vger.kernel.org
X-Gm-Message-State: AOJu0YxojLyXlHikE21KYc94C+q/+MGFglGjhtjVEC52mEQV29z9NKYc
	WAVEGJtAaYhJM6mQ2afBX7pWU8o+hmYcPYo0QHbF/IPAdUvyde/C/D5gHZqX1HdQOK8cTabtc2x
	o8xLJdKxqVQ/dd2nApkNSFx3nqx7dOMHPeBIsYajJOUOIcD2y3u6qLUDHTuVh/+s4
X-Gm-Gg: AeBDiesUAEN8u9RAM+uzsnh8Em40xXiUX6FkvI/GO3/7qdVtXO2BP3rxmafuUb+orJa
	o/RhpWELoUnDIVLqZKedZFUc0DDBGpsdgbUp4ODQmeAg0QJED7a8ZjOuagXRMpBBHgdDDANhAeR
	jYp7VTAiOh+oso5ODEKatGhyR2dl57kJA2n71lLZeQ3iGdnCXpwy7v9jgJgntOLvbanQRv5/Zay
	mwqycQUAGf7Xu509ez3kHr+wjXRdm0A098lvSYprGU0THmQzTqH6QYbvLcUX3V+9ycxyFUn+kdM
	rlnJveBCXjpGKWtd46F8dVfZ2NkLTCY1L+rHDSEMpJKJU4G/k+ib1Ae/pKpsnnaaUguHKFZSNKt
	LLl2uuM3V1Ggq/BpauHsdGPli6bstEudZMt7E7ArJ3zXP6xCrPA==
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr243916361cf.27.1775565467354;
        Tue, 07 Apr 2026 05:37:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr243916021cf.27.1775565466861;
        Tue, 07 Apr 2026 05:37:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm620845825e9.4.2026.04.07.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:37:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-by-pinctrl: s/used to do/is used to do/
Date: Tue,  7 Apr 2026 14:37:44 +0200
Message-ID: <177556542052.188270.2165356102933677077.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be>
References: <b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExOCBTYWx0ZWRfX89ksHLL36HIb
 5OM2bHAwD+hdm0daTQUp9vOnnnYisIBwGHKG3xy5RZ0tA3BL1n8KViPQBT48EJ8EPundG5746nM
 Al/nM3gv3trtbPk3qyc4xSLl+uRBDNysVayZPTmCdDMrQ9e+XwkgyxgrvNue9s/ympiu8eEsWKV
 BY6g7DVxE+85MRmN4fEbhnq4M+LOAhXwP1bxCHKhYQHETvvouPSCFak9pSmJWJTq4iw3fLhRhGW
 cspGIX8Uf+EGRfdOCFCbl7Ke7iGM926TIEN7xjli/ZwyMb7U/lIERf8hPXLE6osy1a4I19EjkXE
 B3N1oHXSTGKvCcZisH4fcqw7r/eGG5ZqGGdvCIlUXh0xbawunBRU9m4dHl09tf1sRsQZURgwkLa
 lZwD8K1MaPardTaqewBz1D2EWUeaeiihZ8jCpqz6tkRwuZWqvvHtRbb9i2Ay+za1YhabEgxDbCr
 AIW2I95XXG91ole6J0w==
X-Proofpoint-ORIG-GUID: 6X-eXYXsYvm7WgSBeqV1ynD3ydGDIlDM
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4fa9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TXhx9M9VDmonX0DNvcAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 6X-eXYXsYvm7WgSBeqV1ynD3ydGDIlDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34784-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF7613AE7FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 07 Apr 2026 12:11:01 +0200, Geert Uytterhoeven wrote:
> Add missing "is" to the driver's help text ("used to do" has a
> completely different meaning).
> 
> 

I've allowed myself to tweak the help text even more by replacing "to do
GPIO" with "to access GPIOs".

[1/1] gpio: gpio-by-pinctrl: s/used to do/is used to do/
      https://git.kernel.org/brgl/c/4a0fc189859bb564fddded12752e1893ad318263

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

