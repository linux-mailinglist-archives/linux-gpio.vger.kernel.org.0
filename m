Return-Path: <linux-gpio+bounces-37041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LRNArbaCmoz8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:24:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520F569A46
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 11:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 607D0301258A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7978E3E51E7;
	Mon, 18 May 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNDKB7Wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpGwd/ZZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B63E3C42
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095537; cv=none; b=VY0xKn0d/PcY4t1pSvauoV/TzLiE1O9HLRxy9qJRbnfCKzVzxkofWUoCgqrw62Aq/yNavJISZX8+kHYOxKqjSTbzlAvAF0LfXR3AAauZOmxeCQCGltTBc5DvFJ7sc8HC3m5Hg25h27QcmZ6opV1jmRm5qZmJ99niPL4AWMukaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095537; c=relaxed/simple;
	bh=im6BPezZ7Yn/GFfZKWjbcIi/nAVNL6dmm2zcgAQCWKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTHkrzPTE4AgJtR9M84PGryyesklQ4IcX2o6EnAmXtpleQP4FjMAJoPO6XuTSC0o3gWKbf+AbyDPxYTmRw7mxEaYOmCVPgvFotfM6eJgD4I40iDXw14M5MO1UHdtRxE01gom8X2oH7E5v+mrsmqFVuFTrx6Km9u156yYohYzImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNDKB7Wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpGwd/ZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8073W1697510
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=; b=HNDKB7WtZ76uz1+G
	A9kjxokdUC5pFowLDz5Y4VaXVftoHciN0W23ZA5zzR6YkTGwLWuQPi6LSOebGP64
	3Ofw/IzvnSaMh96hol7dqDjqrWx/J7W5mJJrsAjlzYW2+tySABtqKa72ml5gK1EC
	6XgZaLgoTcT3cwZzlQRjnZtI7/x0LdkWLiIh4qV6EIE4R1zcuyHYcTbScVevVjAq
	M62ZptzT9La+YC0uoKwqaQIJ0n5gMFessmHn1aboqOUKxC3Gxg/QQumgAtOww6Co
	JuchW/c22orQEh88++JcSoua20x41rNL//Ab+GjmxoW6qM3OnlcUPqjbnsQ2sbpk
	tjC4bg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5mm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 09:12:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5156c85538cso66935201cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 02:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779095534; x=1779700334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=;
        b=RpGwd/ZZ4Iq+BEvn+W9e8PeM8w6HbvvsUWYMmdp4/n51V7N9SouPLR5/lkcBSSPT0m
         R0fbe++BTH/9RkvFOK0wx0TxWPcuRZq4L24jX1mFXqgiOb+HM7esH9Ram1/jgYnDXD+4
         CUw5PGSoGBsJjH3BvUySduZ6pXk5LuL617qxC0w0wM1n1l7pXX1OpXBmN+EwYzN0h3ZK
         4RR1/djZHHJiarvuKU1oW4LWLJv/UpSECeNB04Ry5PjBE4s+ykGslgU59XgFgxQfBbCt
         xC2h8EUbRVAMijeqsFT1yg9GbvqRz2AA1vz1FgXjI6HScqMJEqyONEFEbeG0qYwsBk/n
         Y8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095534; x=1779700334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=;
        b=E1GCV789gl+vW5JPCxhhaRZjuOF5d73TtlzEWGnWjsT1mJJVOWRMoPO7VvfieQ0QtY
         OWZ72RjKJdNHHZkAbbtGz0qnk0l98Y1jn+m1Hc5aBUESS1j2Ct3iQPmNpEec2+3IJmTw
         uSz92eKkuid7hx1k9yHZTskrDRgl/i5igq0rJbtMGjjFBoDAz8WdHL0dcG/sJxoXnAD0
         gjge1cezFa44yVSix2pSe4fd3e3KZEI+RyIEs0gKlnsZzWAuMtWsNf3O7E+FHcHuW3H4
         MIF5Y2ebvtJEj9xr6uCD9DEZ/uH0xHaRiorBrou3PLhQRtwiPrfxk0z8R+muo5yEvXGz
         uK7w==
X-Forwarded-Encrypted: i=1; AFNElJ8DHc6aMPs/JTp2RQXSR3nvOjSiAe0I7yNn/E8ZRsNkHRNHHIl5MdDkHXs4b8pS8IssiNWQ5kSdJm1a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68MoRjDUNkl7O1DKWFhsQsQnyxez6ikQMK+E1Zax0cK+1XRNI
	1Q+qrhZZyNMeZzqBE2geKHS+igZ1jsuPEwONbzJc/GpEbU+aqUp8tb3NMTACFJ+UgC3AkgsS4tq
	BXtLskhPUJRw/pGwrnysRC4gmzBTm5zJZMv4ZvonFM8wecjhlwv9BZdoVOySFvBZJ
X-Gm-Gg: Acq92OHaflVZT3Ks+/x+nz+6TJVqa5oTN28vhZyejliiM6S562ElYn21k38hZogH/5U
	JNKhBC6i1KvlSq5lqJP5vsY/O0H7D46AID2T4P6z5xFSbPCiqKpoFAY0HfoPzWFA+x0qMLtMu1h
	Qxacn0i2V5+NMrRAbfyRnzLil2G1bm5WAztfhED6tSD6IRBNa4iMd6A29PRIcd2ps7OI0J5dNNV
	dx6sm534BNmYXUCvnDSEG3W4/+Vk471p1Y05W5bJo2JIoOuiKSWdM2N+yr06SvDPRItr++iJOOK
	CDsrxqandKlIG8E+QicmO2YLiAZosXNzk/McIe0wN9ziQCMDMMHAwd0WEO0Wy6qA4mbMB1PUhoE
	8Xs941B9ZGSAX2aG6V/Zn4u44LsjgpZ2oPFBo4HqyloXfJbNk
X-Received: by 2002:a05:622a:4a:b0:50d:7135:5631 with SMTP id d75a77b69052e-51659fbbf8emr214909541cf.6.1779095533552;
        Mon, 18 May 2026 02:12:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50d:7135:5631 with SMTP id d75a77b69052e-51659fbbf8emr214909171cf.6.1779095533031;
        Mon, 18 May 2026 02:12:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694f2csm243582145e9.4.2026.05.18.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:12:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra238 support
Date: Mon, 18 May 2026 11:12:10 +0200
Message-ID: <177909552746.28252.17989954889836549417.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514124835.108532-1-pshete@nvidia.com>
References: <20260514124835.108532-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4OCBTYWx0ZWRfX/4LvySSO7dwp
 F1LInahwIcp2gIEzH998ivfxJ3bRaPXhIE6WJB0iZ+XmyRCwMqXJukyOGjpRJOe+po+xY88NAsc
 484b4lvQg7axhPAK+pNhzChY7JID1JOqEtl/rE1GPd0zrMVvVvYGS+SwPEYuC7GSFZGyfbGQ8k6
 j0mQVHCtwT0CMDhOaxSh/P5rtA3U7t4N3UbPHABTI3j00ZlzupPF7GIYqH0TTey6Iiw0BE9MfPp
 ZhcjwhS+MXCZZLo5zQC9Fc73/KeQtp/IGwK1chbt0Dn8FimmhzEY+nz9JPI68QS3xmYWqbvpdlg
 kK84yUxBvEqz5vp8MBJaMagpKzMsaKnLXs6G2MNFcU2+wYmC+mccgXGca/X0viX4dMsnmZM6hoI
 tcUfR6scEL9ntw8fL+QmBrBFtLy4wlH2MddqZm0PW4kk8tTcvMH9ee2pWDlyuHmXVHmLf2oqiMs
 XmDAhltdzUJwRbb0FnQ==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ad7ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wlH-Nszz4JBIhd8tT-gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: oPzcZVx-ClNIuKmnJuApeECbfSUHQ51R
X-Proofpoint-ORIG-GUID: oPzcZVx-ClNIuKmnJuApeECbfSUHQ51R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180088
X-Rspamd-Queue-Id: 2520F569A46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37041-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 14 May 2026 12:48:34 +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controllers found on Tegra238. Tegra238 has two
> GPIO controllers: the main controller and always-on (AON) controller.
> The number of pins is slightly different, but the programming model
> remains the same.
> 
> Add a new header, include/dt-bindings/gpio/nvidia,tegra238-gpio.h,
> that defines port IDs as well as the TEGRA238_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Tegra238 support
      https://git.kernel.org/brgl/c/4002ccd266b665f1097e20addbe8f3baeb2136f9
[2/2] gpio: tegra186: Add support for Tegra238
      https://git.kernel.org/brgl/c/8ac12d8b7099cdebff19aed78a81f61d8042c6be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

