Return-Path: <linux-gpio+bounces-34412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP+KNi0+ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56918357E57
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E82E3014774
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFD335AC3E;
	Mon, 30 Mar 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8MyslPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+eTYyUT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AA3AEF4B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861502; cv=none; b=ixMDRoTz6YuwGJ5dqldPCH03OCZNYz6VqSlFBex4BM2ODTpNBFp2K+VyaxlJ7KOMV3UQ7veAut4WiGDDk6UoE2KrwwmBiZ/72DIs7yJTqa+4t4ENAgolDL5bMFernVZKN7jLT9Y3nBArSXpVUw8MRrUpoWmaGZ+YfoDzh1mUHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861502; c=relaxed/simple;
	bh=6FKYZMGQXX4HaU3oad39xyuElVcJj80v0KV1s5wb8bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAdLXf7qov3DffO7soDBklyFjW9SJCnyKk57z8Pj6h2HytduRWe759fKPjOJaO83t3OF5nVe+6ZLRPVioVEci48GwP2sjAL2eo7wYdIp2xsPYRcV5bQmht0Req2W5GXSfQ2eki/mYlORQtokWQvKlPaMzH854D1PYURyueV89dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8MyslPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+eTYyUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7eUkH1575802
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5mqS/hTFWFujTdJtlkWGSPaDq6LmB/4mWdP8lL0gdI=; b=c8MyslPnN0o22tIX
	vknmXF++VG+O+upwhhm6YxRblbddn7ddj3L5DPCtegQf14qIp1ati5P63DUgfkaT
	bTrAZ4zrzb+yd0PanfykH8T0dQpYvg/GGI0Ns+Ai4+axJGoYb9LpNBulV2zm+s5d
	4SAUadyWb6vB8/cLTf1tfHuGhFrq567/eogkbUCffkneGmGZCoLcoOnCLzX33o9i
	lkumX5aN3viDBMwN1I/072MsV5mt9jR+bOJnTyTPaK62b1VMhM7KKOxPyYvSoD6n
	3+uR+klrOOsT5wRpGyXfDqTDL0H/Ijgf9tBkjibSxRlbK9KT6qOJmZPmXjjVhmuC
	NYBflg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwnehr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:05:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so224342021cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861499; x=1775466299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5mqS/hTFWFujTdJtlkWGSPaDq6LmB/4mWdP8lL0gdI=;
        b=A+eTYyUTU9vbUjP7hXrITlCOCTb4QmqAnLwK5FKy5dQJ+NoP9/U9VytXfJEUN4BtD1
         +EkKUsb41X3gHXnQPfdVo5V30W0XRzFOTx6aWgwVbGTPnger6r0UnPkDmOTfvIlJzkKZ
         uYMdr5tTAMYmQDYqUxWtVISwIwxQ6Ub0S1SZ198YuUINQ0CdHxDtuDsF7aAui/s3MKJj
         o4ZE7YiUa4f+yXGkuaGim0daNwMqzT7Pzq5KrgiA7f9DNicv+gz9JlRoEonpksOHVPz+
         vUCwhZf48GAD9NUgmy56ArNW3M1ZHlVzbQ4j/3gdNTmjAXcvAbOKDBbWNVPe3CY9Qo0G
         hImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861499; x=1775466299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o5mqS/hTFWFujTdJtlkWGSPaDq6LmB/4mWdP8lL0gdI=;
        b=TfYlL+/mivMu6gnuwjKFAp8SVnd9TcV0GQicScoRyypxiYd8kEOkRFBRPiGJO65tWS
         pyfBFtJKEXyNVI1R6LWQehYrFqWcb6sk7q+sOYJJpthwrnpVAAUAHF7LovfOuia2Wmsa
         J4JLavTT6XSvrr10qoG6dgKj8Z3KXrj4DdUmY9XJp5EZ3Ut6HaA4Web7ujHhNajLuDGU
         HxDBJlFV2A3mqqYGFt6l2bQVllY9b3YdiGGReuVwEj1Lz3PmjA5VxHMVk9UhyYk0R+sU
         7uujXSrNss3yOVxGZ9wO5W+nmopWzMvSyiN62b1qskzKQdUwqGFHTdBsRjuulCiQt85O
         d89g==
X-Gm-Message-State: AOJu0Yx7cDelxAAwyRBdvkReW0YKNvSpz29TbggWBNMjMIZ1j6L9e2L2
	ioS1q1VqQ6naikUKrESZ+7CWr/bDwWCXGPStKd8aiWcGpS8CzC+v4xJyoOjRt+IcFGQuljqI8O0
	AEyB4baHuGHSYpwNDtE5GYGPZUcdrd/CoYLVX0XZB/kdwQ/KYDKA2KzYdHiqURjnmQShuKglg
X-Gm-Gg: ATEYQzy2Wod1tllka4SgT1AMP2JY3jmdIdeKQIcN/dA7uV0ZNO0Ajtu89V5TWOTy+k6
	WauwOAlVDTX3ijkC+6aUcjyWVXdsc66R7ncKzlQ0aNNPzCwf50K7jMw7tJ0xaMuMTrfjZTmwip1
	GQPtWKy/4uS1vmv11hSuE5cb2So3ZztXQidp8DKrKUTm/oeBBtFUCeAHiXFtpb4WvoEw3fxZJbM
	KmxlubcOiqonLNOyGToMPiI+sw1dIM9h53g12DKIlJC6NpLpOh1POu3Plu2r5eeswE4A46OQKy3
	i3Nkq/7LFyWoHZCs8iSpfUz7MZjVe/7gCQppNJjwy1bJEy135FD2jwssB7tYSi0F5BREQ25/9GA
	0nmMp4x3Kxf5c2f2rpz92vSpz/UJu3ErQ4TLoGa2YmnjZBQSTCWM=
X-Received: by 2002:a05:622a:259a:b0:50b:5335:25af with SMTP id d75a77b69052e-50ba38c9743mr163939321cf.40.1774861499650;
        Mon, 30 Mar 2026 02:04:59 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:50b:5335:25af with SMTP id d75a77b69052e-50ba38c9743mr163939091cf.40.1774861499261;
        Mon, 30 Mar 2026 02:04:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1143:869f:e06c:4587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm208018795e9.2.2026.03.30.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:04:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: remove wheel from build dependencies
Date: Mon, 30 Mar 2026 11:04:52 +0200
Message-ID: <177486148866.45175.9991482316510996288.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328153830.57177-1-vfazio@gmail.com>
References: <20260328153830.57177-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69ca3cbc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=dXvAoEkxAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MEBuLmmW-1MpCmUm1E4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=iJ39DRKJB4kz2P1Iyp3E:22
X-Proofpoint-GUID: gT7IeurUVjiuEewVnHqtWyN8oc1myNqm
X-Proofpoint-ORIG-GUID: gT7IeurUVjiuEewVnHqtWyN8oc1myNqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX1OYvwRBIIYfr
 In0Tq06JSyevXaN/Dn283RWBwPmSqdx0O6kdvrAdxSW3H/HbsqaIGAaT3SphfCbGef552t1lo5g
 muJ2OV5Fo3omHJ+4nkJkWMsZc2VikvhJA6zPqKL7rwgzKhG63m3YBDap6YPg9kj6YxEKEebOKjH
 QMIskyh+2BGkekwidORewc0O4Onx+W+juoA+2FC4mMuxHMPVqSr5pC81fru+xhLS0bcJdHg8jIZ
 n0b0jiU7uDwfwQb0fexmw2Q+bNwMVu/uOv+u+7d1JZjtEPpZGrnbMY5r33YWSU3PhOWiEt2r8w9
 nE7MQnX4T4ubDMtH8PGm9xt83sCxKnjToFNBRxVBO41M4GE0pFFKLDbnvajwH8wHsVLRW7nC43S
 V04/4eQkdYDFAqY4hC8IMgXok0wPwwPRB0pPQBKy4MKY0h9lPvrSWpkv3ivZ9m+v3jrGIWPJqpN
 OkvbiIH8eHdHbYYTSSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34412-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56918357E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 28 Mar 2026 10:38:30 -0500, Vincent Fazio wrote:
> The `wheel` package is not actually a build dependency for the project
> since it is not imported during setup.
> 
> The `setuptools` documentation [0] says it was documented as required at
> one point and that most packages have cargo culted the inclusion.
> 
> [0]: https://setuptools.pypa.io/en/latest/userguide/quickstart.html#basic-use
> 
> [...]

Applied, thanks!

[1/1] bindings: python: remove wheel from build dependencies
      https://git.kernel.org/brgl/c/42fcd4c08401f8f3ac5c7c8f8de5d53309edc76c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

