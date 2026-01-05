Return-Path: <linux-gpio+bounces-30137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE232CF2A5A
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81D05300AFF9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F3932694E;
	Mon,  5 Jan 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs/NcNea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ27vU9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E7332B9AD
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604382; cv=none; b=nm+FXJByI70ot4kJF/qnntzQw1Lxea7nN6kfJvlF5iID1kgomfoCFLGtETzHg2EJAsdq5HChl7X3sokcDciu6yEMXsxdygrK2n9J490KkLd58WrOtNR6biIaPyXkNZ9isr32Eo1LA8wHsloSALVfTbH9nVLgKbwh/dZCWQTQFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604382; c=relaxed/simple;
	bh=z6M/9ExhRsYHOV70TB+lk6dUhmCWJWkbgw26w1R1fxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIz7QPrS3QQfgpBY7wufyqpmez6Pn8T/dO+N2S6srNDed3xqAFKRWdyEnnHD9HBS/oDatfjKzrsZzF2Bn72121o09J7dVpiY8jlc+HjWoEmfpvaSounUncG3rJ/2UXkKlc5MtanVqRdAmvRqY1UFWa8ELsrpK2WBCQh4eAVOGfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs/NcNea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ27vU9c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6055ZThC4031715
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoU2WQIgG+lJq3DWHyWlJC71sMlvAvzP2/Ym5ZSgCu4=; b=Xs/NcNeaIILU7qxt
	jYerQeM6uo9o4+2V1sE7zam57qhCAvxHXddxjzBEQCU2j9STJT+0qYfsrm3WQhb7
	YcuAWK2U5u5hOfyxZ9rVHLekicIa45laTWJWBp0mqflVjAYj5dxSbBOi+Au0VoRS
	dEsCEmMDwBKkcsTFrJgPj2By/fZ8UZvyU4isCtGeUuEum6b2zMDoN2AIpTmQZD+u
	0sn0/PDD3MgirvdakfJ8yRM8m6juWBuFXaMvLFZ8IZKqxjbV9F/shW6xCinJddKx
	ylBNHvp5txXK76b6QJ6NQmt9R642B/+K6Z+jUq5FcQZ7uC/WHA9RMSBPi7VYVwrC
	SRzh0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79ngmyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 09:12:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824d5b11easo284587806d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767604376; x=1768209176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoU2WQIgG+lJq3DWHyWlJC71sMlvAvzP2/Ym5ZSgCu4=;
        b=CJ27vU9cvcx8+T/l0cvpX0KMt8ZjiBcJVm53W1GII2/FTiM7g4Rst2BAEbtp/zAwdJ
         KomyPV1EjS9mgx+Dil/NU+qLtV9Uw0e//9KNIVlotoTVoNdhSs1EhRaVnU5PCFF6svvY
         vDh/R29+YvIPUtrO2QpmFRliTRLOW3c86WcX054eyY6nxo2fC0ZT8ERD9D4RkUX8YaJI
         40vwh2XQJ5vTMA9AvZ1s20/bqmXaMQeKn1lZC6cyJbGGy7kruGdgRC6+6nV5ktlziYSu
         EbL2zK1RJeWkIw0yVC4xWZferr/pUAMxZIs3IKxHibyOtZBFEEh+/mJBEYEUkIA7xO2m
         z0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604376; x=1768209176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xoU2WQIgG+lJq3DWHyWlJC71sMlvAvzP2/Ym5ZSgCu4=;
        b=Rht/jSz+L95ss+192PmKF5oGE7h0DxiidY7+yr6JyUuAp9ptcFEDyfXEOQiAu+7rQf
         opvztgVfRLSsjwTRGaduAoWCyK1QOK8HIESVuq5EUAekeKuGzO5xp3mTS3+B9ajZegHj
         SVij/clIdrPz6lg+5KVhJAtquNq0uCU5J1BGqX0OafuJXXdpmZBl1OahQKUkdJw5Lepf
         eibaG0PfRtVnDv9KoPLdKxu7y/WHYgYHgVDo5mGXeyf7Fv9o+kxNp6DcnVYgaVEQYPpB
         y3ZYiutBmWSVidINAOTlO52L4iWxfaXSbG9YZ1+75ObP2jY9FzHNa+5MrjDRfjGXae44
         A6PA==
X-Gm-Message-State: AOJu0YwSFq9JBfgSNzZdScjw4iFNwJ33LBUs0wBPm7Lai6egRqckTpq8
	aX2mOzT7KoZ0IdR48SUHUcmMg7NT0oIWsMnr1wRGh14GMnz7yGCX06iFTOwkRuzQAzUKl58Dlfv
	NQV++LYyzvS2ocPWx0oBHYs6aG0ZuPje/XaEn0uHF3hOSGxzgwJ3jILQ8TRfknXGaBr8H9DuA
X-Gm-Gg: AY/fxX6aCjaYXwfdIv0MKtFwmRSeXxT4h7XV0HfkUsv0XSfwyw1TpQ9Lnj9efceSjd8
	npLtav3UmaeDjjdfEY0qCWlFw7YC9rfR7I0QDXjJaUH9n2Rlu0jOBycX7tTQWkWtox02MoUOWi+
	qAJmG786rk4kJxviy6UpcT/C2DTj6/s7BrzJse+62jOqFCwbg757HSAfcevWizPx5fuHiNLw/lR
	SGrgIfeWR6+LtGqVwnRnsrZvbegRafxqy6R2uTPfnJgShGqojGmUv4NcuC5ABjqEDYvE1k2YQVr
	4XD90K7VuVmxaOnFJ8Wk/ismPH3R3Uqh3MM8TfVCHvqo0T1pdQPHEqIpLveLZYJ+uRobon+FEs0
	WmoygRncRetpoh8NLy+31Ruosm9E/M3G63+XrDg==
X-Received: by 2002:a05:622a:244a:b0:4ee:87a:4d0e with SMTP id d75a77b69052e-4f4abdb28bcmr710188351cf.69.1767604376290;
        Mon, 05 Jan 2026 01:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE90xaw3vce3XM6+T6cWa9Qvd+FNtYc/up4VqVxdjMJZYb5nuF9S6vFwNIzmaevpmNF6R5H7w==
X-Received: by 2002:a05:622a:244a:b0:4ee:87a:4d0e with SMTP id d75a77b69052e-4f4abdb28bcmr710188151cf.69.1767604375879;
        Mon, 05 Jan 2026 01:12:55 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e077:5982:a52a:d4c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba40b55sm56503655e9.3.2026.01.05.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:12:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: restore the name of the undefined software node
Date: Mon,  5 Jan 2026 10:12:53 +0100
Message-ID: <176760437120.6005.8883803232244856096.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102093349.17822-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260102093349.17822-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AjQ9FDQ-NMw-GVhha4E3VB9A1mF_yRs-
X-Proofpoint-ORIG-GUID: AjQ9FDQ-NMw-GVhha4E3VB9A1mF_yRs-
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695b8099 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JGiey6VHCIDbePtrti4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA4MSBTYWx0ZWRfX4LOLm6tPa3uG
 s0Nynwcagjs9WSX7YwoJRk25QLA/W3MUZmWQ0J1zHNGHJzaNT/d3QpOisAFOXpJAnmLuvnT1h9s
 +z/az69SF6bY0jLQhUeVPoHbqwbf0rezWTtlcODNW3z02Uzo2rQWwDij1e5MdMtShfyx+5n1wOD
 aJvxawtVZyl/9sOWw42nf/K4Pix++0ZXi5JYhJFZKgZXV1k2eQILPhg1ifGkDIckM79nOl8oDG5
 RNTdQvLn8ruIhjctClhFrdm79Pu9QytJzEQdmkXgMgRubUN3eh5bySka0uMq+sS4iV3mTmtQcAi
 N1oHPvPkhbtmgY+qLycBXaK30sneg/Wvl43k/FBlOAX5pt84Li3FG9xesa9GPD0KL1ENryDCTmB
 1na5PIbsa3eAA+vOlPzrEMxTBkxhdpm4tFvEOmHkYMh3yMQxy1CFBAj7HOolE51fX9eW1eAGwA6
 dSHP5vBO3ep6GWmrQGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050081


On Fri, 02 Jan 2026 10:33:49 +0100, Bartosz Golaszewski wrote:
> Commit 6774a66d0e10 ("gpio: swnode: compare the "undefined" swnode by
> its address, not name") switched to comparing the software nodes by
> address instead of names but it's still useful to keep the name of the
> node to expose the relevant information over sysfs. Restore the
> human-readable name.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: swnode: restore the name of the undefined software node
      commit: 98d78c06f54da101c1f2eb79af378cee9e07e102

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

