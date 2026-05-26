Return-Path: <linux-gpio+bounces-37492-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDLqH65UFWqmUQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37492-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:07:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C97BB5D2375
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86349301ECF1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790073CAA27;
	Tue, 26 May 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1H5R8va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6HP+nM9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9AD3A4523
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782591; cv=none; b=PAdXr4C8hfNLHV6zRmRFctog2Bk27OPFpObwOKAnm2FOyGzJhNk0jQH6bsG+2RC9lWPDSk4SiMTAWof7qY5cJcktqssw+JJB+x9RzYtQxuzg5KGHJls1GX+tsv7BbfybZBxwmdsLv545dURr230w1GR+DnbC/WAhgtWPJpvlxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782591; c=relaxed/simple;
	bh=EeTV5MP55cP6IXaC2UYKx8N8f9i0lWMjJmGo0nD/I24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFmkujUctKUk7R41RgFmJxOMcm+qx6Pg2CMXq8usV6l6d/2jt3+C3fxqqBUSDiqFItSPMHa957noGmYaa5GQJkkM69n3tJs6KSX9Xy7aOwtNrkLuPktiVuJYGvZ3CmVy8LGGDLMeijrrVz7V1fwoyyi+fDPiQHeDzPa/z29Pjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1H5R8va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6HP+nM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60fxH1763357
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=; b=I1H5R8vagIE08hmU
	WSBnon9XuFtaQzsMobF+kemk7ZiRMYGRyhoUM+rSxAj86VOCtLLyytCaia96G0Km
	DvYa5Ghg31UYqZEqnLjbzmfmQFQAhhuRccnGq7d+2Pn94cl0NQ5mzijIc5657sKX
	h5yjoDFL3ft+fasKKp7OI96ZI5ADqBr7qpjICfqyRxWwxttxecJ3DJ5uw+rkbF+H
	EDxzl6u2vk3N5Ex21ci6g3brVmScw5pchhBiv7RZ2R3netcrBbXA5rbl4xy8HOFe
	nF/W19AH7ZQk/ELScUQRF9/mU6y4/qgx3t6g0/f2y3fHjBGjzeuRgP4s/nzc4LVu
	BMsf9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggeqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:03:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cdd89225so95518451cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779782588; x=1780387388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=V6HP+nM9PfWU2s6zGq9Y+Fg9/bdNFyFkGEFso6KGS76iDKlvWci6mFWvYxXH82nooh
         HMtWpFJ+ZDhRBv6UwRxd/TqBrY7fxyG9x9Afej4sOxWWEVcg2ISDoZ/T06eyGOiEj3SF
         /ovVlOb40o8a6gwuSuAhiunYV7H5JT5w0COHTnvq4HCVUMUDpMgLWLJR8dB7sZTRvqV6
         3mTJUQGv55pdpRsIJ5/920OzRs7Y+KVCLW8xWkvIA6pMxvO5yb8Zo1DaG7O/IrgHb9/E
         jL0Qt+R7pEKkVoXcxIhFAjpcHRtxtoRYSdZ/lsZCDysJ2AeWfCgmSHdCesYOJFEfbU4/
         5vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782588; x=1780387388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=czZIG8X526lvgB4nZjG4xAElxhfmgska6T8ySSqSvJiTMaE8ibU/InIV4XAFBtfTEN
         D4rNio81c7MOb1/XAMxYSccpF3htAozUCwzh0MjUPk0iSXnVx7TVdNIAwUmnBYUm7q8n
         fnOb0zZ+uT6wj4WhrfwC0j2EKEuhU9L/uLg+Xuh9KaKAq34zmgugX0pl9+SmO7yfIVBA
         V2FejB1zs4EcmgVwz1J/dmTo/DpvquSbW0l+numLKP5p7CJL/GA32bvxpnv4V/LKb6MJ
         nf3PcEMGBMqVjeWmAL3NsLy/oYSh1VsdZ46cIj3HfJycdOkRLPik10FlLZ5QH0MFGf6a
         Q2hA==
X-Forwarded-Encrypted: i=1; AFNElJ9MyLH6xZ9oWKq1THqsWipaKCH/GOKACxS3eCTQdvjfCQVu4XXeWzmRc5IA+4g483BFZuZ6/eY270R/@vger.kernel.org
X-Gm-Message-State: AOJu0YxelN5p1jcTxA3iIuepFNzRzUatiSg7oYhiqAY9aqdziPqal2DA
	tpkxy9Ry2XcaRWCZjgIQyzqyCH+ohZeu5oH0Gzy1AqgFHH91D4rWwdJtFQnS89pK9VO27zWUzJn
	XB+uYOp7hLseEKCMCMdUZ2tV+/067Mugqyg9jL09NhCRqDDpbZK94RKZu+RVaWuRc
X-Gm-Gg: Acq92OFlil5OdFQ1wDPWF5hIEX1kO6DxLI5pKvZj02fwfn5nUyQIRVxnN/SrqKncLLg
	/WXMpYy/r1EMIV0dx5Ayk9+nnYr3UVz2UAm4cienO0AjyrS4WQsMdixJN1iUtWU5Snzmt21gBu7
	Rke78s3mKFSR1QrTNt7c+JbyyF59XjK/r2qiHQzRPqovUenbboTgvFZLamthIkZ6cBCeNqwcEKi
	Oj2/53mehctlNZ+zbZ0exAbuZRI2pArt/26qzZOmpKupgmByQ0iAUSf98YTGR+kYLk3SpBiqrzm
	soD2MzQItcpVMP28wbclq8mVLlkOGG5OXypb0Jv5CZKMNZoDtcLALkiItvC6HlYsVLUuQz43DLE
	fA4bTjiFsiUy/GDA9+9P4jIYjgfrNcPWo4qaWFqVusWofNzyaJA==
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537741cf.13.1779782588343;
        Tue, 26 May 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537301cf.13.1779782587900;
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm176729165e9.0.2026.05.26.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jun Yan <jerrysteve1101@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Tue, 26 May 2026 10:03:05 +0200
Message-ID: <177978258287.4574.1235390656102820525.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a1553bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XSeIg-1IB2E2TqoohwUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KHV3XPYW6gMRJE4iLHpBSGkYMa8byZe6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2OSBTYWx0ZWRfXxnnVRCtndDS+
 1p9Z7U06hBm1G+G/97B14HP9midKz8D3EBRgTvXgWVm7YryO1ZWgruJEl2LdtWsOnprwykQyRvz
 o3BBLdxZDwPBXXHAyGhT7h/lIOIIFrQdb5GTd2pSPLz7tbnxKciL9s5Ojg8JFFk+TyANtZtdQxH
 mJgEEQnaPyU3E7ZCKD+DZTRpdho8AI8yM48L7/PvnkziSAjC8bbTC55b6O3qGWuw+cTl1PIt9mU
 R8IMXRe/6wrmNg7vVZtlHnItvKP80r/7FjiiR7nOghKUEtjNnIGPM4kImgaKU3ilhXbpo1Azb7t
 Itl8HdYS1/uLvxu60EJpqS0JtoFX4VBMkdFA8qNPSSaw/6W55OHHDN2y9WX7r4OrOK5gpsHPtqD
 Ht1PNiFnGSHqefDNV5JkBbbXjWKeIs/VS2iOabnaJG63wMMfEtVMHBzlv1ByFEAEiikrg6b11al
 33EuF0j1yYcSprRLX8Q==
X-Proofpoint-GUID: KHV3XPYW6gMRJE4iLHpBSGkYMa8byZe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37492-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C97BB5D2375
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 24 May 2026 23:49:53 +0800, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: meson-axg: Fix whitespace issue
      https://git.kernel.org/brgl/c/820017813b818a9b6411e481fcc98f5260b6e6c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

