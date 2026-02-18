Return-Path: <linux-gpio+bounces-31779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLNSE2J4lWmZRwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:29:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3572154101
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EE0A3062433
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B0D318EFE;
	Wed, 18 Feb 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWsjIeh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3V1MSi1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E8E30F813
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403160; cv=none; b=J1ck6+bemzi5UIWFcACESUc/+w+z2k4s/JdtNFcTeha/mp04G+SJmmFoIWOL+bhb/aj4di9F9kx/ezm4vfLd075+lCEePid44DMX7utiIBX/YJZVwYUbc9IHonaDSwGMUSWlaoc9ZnbbpWKxz3/IMkGjexiBzzbjWvkWxvnF/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403160; c=relaxed/simple;
	bh=IfANeevLWHa8MWE3At8kAHFJasWGnSmGhClSHvW5uks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9jW3HVHcYHolW1oeI5d5O4wKWyOpPb+1ot2jmKjlNOKQSvc2FJwnpi0TrA2C70wWEJVu7r4U9pKX70uWXYVCYhjMX5U735FZyvzWAFLx++wyFunqyHY7I89bGTMUA9sHhAfA8Im3SgyrJbVuriUWfvPPgqDDrUIORm38adsxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWsjIeh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3V1MSi1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HMOr6p1030280
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2p9SqZf87sLx6oeBUfWMIBJEKzfOBN92KIJu6zfR2E=; b=XWsjIeh8jr2wT8c0
	0Ne+nZZo7i53b01++VVSJWtRl9NvKhzAmJl10SfEPez4GS0cWcI+C+XfPH4HNLxK
	1CZ7+V2kRV1LJJtg+/IAcqSMo3vziiQH5D973xLmHTEKiEhQd0FG30FxZ4xIUliX
	V8UhsIH/b1da6v277UYy73iVryLiSDHIe3NKFAfUYDyZeMYinGW+f3ikVPH1eeAh
	MX96swCw2JH+3ywpLzXtF8T4/mmXVfvGz0mtFBK/uOzT1Qh0LbhX7T5E5U8OLIgX
	Gs7o70VGNejLJfMuttc+8tHmG3bHkjD3RXPt6AEWdEHYJezK9Ye9FqbsOvaqawqt
	QXofqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd13rs6bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:25:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a2eb984so5539486585a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771403157; x=1772007957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2p9SqZf87sLx6oeBUfWMIBJEKzfOBN92KIJu6zfR2E=;
        b=g3V1MSi1wm5FwrO6EG2cGz45VVxcYeU5zVK1gafYWEcshPyO6H+p5xKnUNVVia/xsM
         uAV9x5uxc6vEdPWqt42/8PHNJKIxMyUYzqJvmOcOuGWeiT+NbuiJk2+JVMQIuCPo1z9z
         b7H+X9RP5K1jsLWotH97CQ5VoYsSKp1mXhHkubirwykZYOZ/6h0nlC3mknqLOXTzEXbX
         7GlKxbF1O0D5UlUnUbqRlzqZJJ69MHhLGyScuBfxxgeE0Yp9YfYppbu4Nm1ViRrrgPpt
         N+p2RoLbVUbalsrXHCmZhlEO8NwnpfxKoCpg+To7QCH4s9KOnF90Dhh25hvxxPsvP1K6
         wG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403157; x=1772007957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2p9SqZf87sLx6oeBUfWMIBJEKzfOBN92KIJu6zfR2E=;
        b=LlvlEXkMj/KITcTs05d2BkdPC+1ad7JRzHm9kneHOCMAFLziO0MjbccQmShhnY/MwD
         3JVWghJGemPHGn6J04zysuAwi+PSRhoLyH/dFcf614JwO8DswTuXEG/0m71QYur+alp0
         TzXGJ8ZmKg5Tds29+VRNjmj3K/M83jtrDrTtDtDH+pQYWrRB78mflknuzwUEVfVDL2jG
         4nZlJFTX4RTzZoey3AbifFmgFCW03mXiR2nkSspirDBeRzIr+tBBxerKOpOTuN4HiqMN
         ZzfAql6tpACGvTm938AeIm0qqLs0SkwDAKUsj61V6M+BQXyp6s/rSNiDPaGbIST5jRFi
         HKOg==
X-Gm-Message-State: AOJu0Yz/W/sSFV9VgSPHGAknn6xydpFFTprIoReSyh6effd6focf3zAs
	qpH4aqxSGnWYjFNrc3nG0f590KVZ/zhAHCYU8iWl/m8HC63hoVbOxkUi64rvvmfYJK8mZ/JJcA2
	Sr4G77dTfREVtjfL+TgYCYyki4C0dW7KcDS3KLrV5EU82Ar0nbCWYVOZLKLA4RzPkJyE642i0
X-Gm-Gg: AZuq6aJL8JiGoYUb8eh0hzrkVKRdaDZDtefVrFGxS6zdGdMNg8r/t90IOicMwfWSvMI
	Wl9QrhBW9CMgFP0siZJD3hoLculxBbx5IMKm60DDo5Ofw3/OODKCiFz0IplHfKmDms+7zTlSu7i
	tOY7wabOkjd61+0JklZBzz30poGwPJbzXaOOtrhBQ9QXOpKUBOZgx4QV+0ikm4PD6t4r/b7ZIFP
	fA68xeMyms60GWLsmGA+AsAmKJ1OoBk3qxj+XqMX3HNI6H2tQTPiA97356XPN4L2yPt/4jVw+oK
	2VaOg+68taaOlZZBoI0ES+PIA8f2e4HUGT9WrGi3netKzRNpj0PKaXCunMPxYqfULu/QjxP5tb/
	tQgI1PSbhEM97yjwxt4Ahs62kx7bS8ypEkI4IsqQCr8sZD2KFxUY=
X-Received: by 2002:a05:620a:1131:b0:8cb:50d6:18c4 with SMTP id af79cd13be357-8cb50d61b30mr1166735785a.11.1771403157413;
        Wed, 18 Feb 2026 00:25:57 -0800 (PST)
X-Received: by 2002:a05:620a:1131:b0:8cb:50d6:18c4 with SMTP id af79cd13be357-8cb50d61b30mr1166734785a.11.1771403156912;
        Wed, 18 Feb 2026 00:25:56 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd259sm42254079f8f.24.2026.02.18.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:25:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: require newer setuptools
Date: Wed, 18 Feb 2026 09:25:54 +0100
Message-ID: <177140315114.4988.16885726288754187108.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217005314.31016-1-vfazio@gmail.com>
References: <20260217005314.31016-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kgxrYA5J0BRhxoKzhnhe3_iHXUaaWxbR
X-Proofpoint-ORIG-GUID: kgxrYA5J0BRhxoKzhnhe3_iHXUaaWxbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3MyBTYWx0ZWRfXzPxQ/t0lbn5U
 CgT5rQv9H19KQYCUr5+diegvGgcLrGXh2nixmost9YbbHCzTz/WTFKBbSUDBNmmJ7o/dehWSbPY
 OMjO6P8j8TiEhBO13zjMdKcdTUhclBwcCokezvTzhsVjy8cmoZH0fY5796s14ZvCXX84lPLVGLB
 yVeoVs12hvbxslKZOu8seFnbkkGwCNG/9u4z6pLB5h8Ja4wN2KK325ANWOHY6KZ/TL36CInA+AB
 ZUCXCgMOy0ZIx3g7RTeLXDg9MyycFnA0bhYisrk90toqkqgGfGFVP4TJwR8brcNaHZ1p7AJkJUU
 e2nwg1K3wop8k4stY7f+bui/Km0hgrZq4P/PUMdtc/uttmGtm6fVGVh3JfTndVZWTOGSmX6yXn6
 Dfmgo9Nk2L5SSUyTConBhe4J49z9BcPJPIbnXrDUS0lMZGW8rmskNJ8Zj/zEXU11unOzLFNZ1xf
 zNs212CnW/3DH6ZHSVg==
X-Authority-Analysis: v=2.4 cv=Q8rfIo2a c=1 sm=1 tr=0 ts=69957796 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GKz7lgruWIPEyJ6VVKkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31779-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3572154101
X-Rspamd-Action: no action


On Mon, 16 Feb 2026 18:53:14 -0600, Vincent Fazio wrote:
> When commit d9b156ecc2ec updated pyproject.toml to conform to PEP 639
> we failed to make sure the build dependencies were updated to support
> the new structure.
> 
> Support for PEP 639 was added to setuptools in v77.0.0 [0] so minimally
> require that version in `build-system.requires` to avoid failures.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: require newer setuptools
      https://git.kernel.org/brgl/c/ff267fb439b5c307fe75b47bed4db11148b29ff1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

