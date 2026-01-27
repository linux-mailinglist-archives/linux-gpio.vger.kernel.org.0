Return-Path: <linux-gpio+bounces-31115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCYkJEWCeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:15:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366B9192D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901D4303CE3C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C250334C19;
	Tue, 27 Jan 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kl0PUzR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acXjqgor"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89F33291F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504974; cv=none; b=kkm6VhKxgzeGJxpX4l4Z2Rb0rMLzTXyaWkzJaivsMEgiFcet8XmiUgTDUiALPrQJ1D3H0ePGi80d1g2nKejeTDm2tiPrmDA+PZZ/ULSQc08D315ws9QvW8uDKGh/vn2UKz09499XX4APVn629sMh6jcLrkAPf5cKv8fv1F7BONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504974; c=relaxed/simple;
	bh=vnN0O0eU0AuFjM0YywaS3DqzyxHabTa+NNES+Pl8Mew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQYdxQOTdVnQc27zlLfkErGvNfIxTKntElgtoROPsie6Fh0Sz+rfrexl9BrBsAVghlLaHSXipjA1o1c0dOT1jFD0urEKOCqSeUSos45uhXhYluOEr6Mr3Pb5R/X70XCH1qiNyQXV5HTdCpNzUpmTVUjD2YLiQC6cnCWXg6qAKf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kl0PUzR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acXjqgor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Rswe112453
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4w/PEdt4yODMbk43Hg5rxTg9loVAATzSA7ihK8pVV1M=; b=Kl0PUzR0I13xywzI
	3TjMEe0XwaVO/fTt78j45zzKHIesVD8hkza7hNQocoeBFesYrjCLF+tPXS1W2w6o
	TNwnA9cCHLb6Ua77NWT7Gx1DE2WKjYvck9Vy1c8FAkl2WzHXpDgVhJzvl5BJDY4Y
	vEaCK3Z8xFiS8ksolesFtI8nrvOaGJwBIPUxCyh/kUC4JD5STyIVpFXlp0ZgvrF4
	cK+Z8w+O5Eh+ewG/GfTEBR3xsT8Bhr5Gs1sU8mnWF4cJz0ptkk62FrNJlZ6FSohs
	Pj8dOFJk8wu6x+33Rt2Xb+qnyWx1cAvRZFL2lNt0Fy86wWjf/FpN50hb7hxjYwcw
	6g+fNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0d0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:09:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so18455085a.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769504969; x=1770109769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w/PEdt4yODMbk43Hg5rxTg9loVAATzSA7ihK8pVV1M=;
        b=acXjqgor1vXQfJn577JpnEvbbhpfr0jRjvMevDHYSa1aoV3b6FakT//DjSNgd0cI8Q
         VstLSFyO7qdA7SWvElwJVAvbP5OUiEEe95RnubGeuOrASfdcq8CmkTOaT6K58K3pKOpL
         t1blhrW6q4GeUu0fVM0IJD1fBID1i5ZwEyzjVkAvkZh0bUYRZOvuwroCX8BeLv0tq/8V
         oRCXGOcprCatprK1M4DxvmNkyPRv17+BlqGEM4trhmEZkqFOK7FDTTwgGjkHh6LewyTN
         wGFDZ3jsdP1RlPOMel/IQSVBjBjI4298R7HNMvKuGQZlPLOlDjsWnRKOzyvYBven9QVw
         96dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504969; x=1770109769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w/PEdt4yODMbk43Hg5rxTg9loVAATzSA7ihK8pVV1M=;
        b=l1O1HNKGpcKvGn1zPLSopm2yQpRqJWcn2Ysse1ejM3s6CxIa67E3BlT9qERuFY2UUS
         re+mIDog9DZ9XVqIRy8jvn3p1mEkMkbxpjqjl2d2U1NiqXEhgBMmjjxHQmjuIVTFamtR
         7Dd5HdkaeBeqWilfh0IkyX/XK0Rh4DHvG/4s0uLVbjQ3v1nOhCdmwTvpOs7s4crWmy0R
         ZPGeHVQdPUpc1rDDRbWB7MkM2qeyeZrhy5COs4vvwkJygshTAs2IPUi9fJYpYUQ0HcB8
         qoJrHhbMXbSs1aiPVGa3FlT3Iktjk5wKn/pFGb9YklJptsaU7u0sgV4PTDsOFjRRH7tG
         SbwA==
X-Forwarded-Encrypted: i=1; AJvYcCVaBLrfRjh2WedMS4gI4Kvwb5fb0FEFWSGjlvyg7Re8RRAFdyWxonTvze3v624PZ/UWUAUsyVH51gtC@vger.kernel.org
X-Gm-Message-State: AOJu0YxTunVV0zyT13T4MquCBzMfvO7wb0a4P3MYrhJxg/rY8pf5BmtY
	tBmzFFhXwIWIDso0ceIXWelfym4RhKFovGyT/1+RzJ6aNWQiz/rW3jJeSUWOJ/7KBiPOdZa/P+X
	LaB6Q0uYCvuvnUQmF7DmH5wGunAEJK4wKKUhoonIDTD6CQGYSaZR7vRszsHKgiQDM
X-Gm-Gg: AZuq6aIuomIXfV4uT9Hixdr3zsrv5iXr0U/ZkA/W1KS+jC8bXJsieAKt1LIkon/LO5p
	N8Hd1xaWRtllTignwn7CgU8e+yWEsmWP2ni1lDV8Dr0kQXM+a7gqdrpYaqar6OznOoXaS35mp1S
	DeSg450JfbjsikmMGLaL9VS2z2KKYSaJzOGpHvo3ujSunL7a8xF7UudDU7Qt5biym3TvDXDTocI
	inxg8fHCe4qwA7poT8w+Uk+FXoT4AXDN29+RI/LD01gGiPSmQx4ZhlGDLuX85AkB72CrNPGjPmP
	SGDhBkgMa5Uyq8ycgUZ7GVGPCbfAMf8sLSFM0jODlXaO5xjhKYiJEivYntuoKGB2gL2H5FPfp3d
	hy8xHS0zvc2gxGPKU3ED+Y/0qLZToO7sa0DeS0w==
X-Received: by 2002:a05:620a:3198:b0:8c5:2eae:cec9 with SMTP id af79cd13be357-8c70b86176cmr103436485a.26.1769504969288;
        Tue, 27 Jan 2026 01:09:29 -0800 (PST)
X-Received: by 2002:a05:620a:3198:b0:8c5:2eae:cec9 with SMTP id af79cd13be357-8c70b86176cmr103434385a.26.1769504968871;
        Tue, 27 Jan 2026 01:09:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm128163345e9.4.2026.01.27.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:09:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, linusw@kernel.org, heiko@sntech.de,
        Robin Murphy <robin.murphy@arm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        sebastian.reichel@collabora.com, m.szyprowski@samsung.com,
        linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio/rockchip: Stop calling pinctrl for set_direction
Date: Tue, 27 Jan 2026 10:09:18 +0100
Message-ID: <176950495227.13307.15210197417772455639.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
References: <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NCBTYWx0ZWRfX1maYjB47jhCQ
 Uv3vK8wDynvo2LotLNOfli/dycR/AHBIcFZqdbMoz2C9+OsWR3udVyUyO48m6RUQBlf7jiUf8es
 dH+4IDmqFTs7i9GwpgauYrBV4zcwwlq3zY/tmcbU3RzHn/oSL3T8WuDBeazVc7G6mUcGZOfQcFG
 MEVzDMJjRyOV+kR72uczR90RfbeSPGskvQhWm+Rdee6IY0KvZE3uvezBlaQxNOejFm0TcegWqVI
 26Ayfa5g50tE/DDkvBK9MVrJhXWs96bZjyNtZtM0hdrXyUPoRAdDBhjTzTw4xi5AIledssURDQ/
 To8SWzQLp4Rfe5gUAs8BHvhGd0lj9JCVZuVTeyGCDfKy32dOtycKRGO00Bp5M59v/DETVXZ+1SX
 g/3I1Y2/9z1YPLoIuqmkwlwWWGbGtpmNgVLGP+cs0tTggmEfpv7ALJmGmry2TRLkkQEOWQlkWDg
 AI5LcFzoYYfT4JE5l9w==
X-Proofpoint-ORIG-GUID: 5FlLgR-20l43DDE_2Y7FBw5Oo63ic4KV
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=697880ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5POHT42K0a8s5Xt5xWMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5FlLgR-20l43DDE_2Y7FBw5Oo63ic4KV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31115-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3366B9192D
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 12:12:26 +0000, Robin Murphy wrote:
> Marking the whole controller as sleeping due to the pinctrl calls in the
> .direction_{input,output} callbacks has the unfortunate side effect that
> legitimate invocations of .get and .set, which cannot themselves sleep,
> in atomic context now spew WARN()s from gpiolib.
> 
> However, as Heiko points out, the driver doing this is a bit silly to
> begin with, as the pinctrl .gpio_set_direction hook doesn't even care
> about the direction, the hook is only used to claim the mux. And sure
> enough, the .gpio_request_enable hook exists to serve this very purpose,
> so switch to that and remove the problematic business entirely.
> 
> [...]

Applied, thanks!

[1/1] gpio/rockchip: Stop calling pinctrl for set_direction
      commit: 7ca497be00163610afb663867db24ac408752f13

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

