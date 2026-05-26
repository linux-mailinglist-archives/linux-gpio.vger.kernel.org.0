Return-Path: <linux-gpio+bounces-37506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHxsNPplFWqCUwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:20:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2D5D32E2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA1F430344D8
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261E93D6CA6;
	Tue, 26 May 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0fsDNg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ugo5gAdH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F083B47EF
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787220; cv=none; b=TtpfjwkxqE6HpCYC0hQoZKEOUFzwXvZO1zbxU/fjCLtR/FFcGiJvfz27/9aCEKaEQwYlI3OS0Q1TafqHxNA3hh9+HOxxR+HTYVd8VYs/x1yENgjMwtMw+10/OQlD4TG/xKiPXVC4fn8i3nzaUaxG7Ky4ba27o0c5Hq1gzmqLrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787220; c=relaxed/simple;
	bh=4c8ObGZjepD1n8Jy7Xwq1DEYon7g8PLwrQ777IG2WR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJmehlokjEFqiguO7cw744ucKlvAsHaQin1CSwIYfqJdDJSv2YE5ggkFcq2jg3vfhdkMCqmBzcbQwCYWvmoWx28ixgZpnkF0LfWD6fT7RHghxESwrPvd7yFFeR988JExM5GqUclFOwgyBWGRQY6kZ9LPd9IcF7pskjJpAQnhW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0fsDNg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ugo5gAdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q7KkQY507064
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=; b=I0fsDNg2iWBV3ltn
	vEmYVGJh6X6PZVTMXQl0UKWmIrEGZU7Q3B4ZrmQm/O5au7O4UzI+qtIeIUdt0Uyp
	VBDiIIdvmR46BQGmqKd6dqFN4wSBUJ4n+4wpx/+iVVtsm+MVoAA5ddmUxGTKo1oN
	psnRZ+S5Sqipohf2hhuzV4zprqGeJWh+4IUDa+55/GCI8va8vBPiKvfr9w21MRwu
	u0/aCZwNN9U5w9HrUjDxKmqOkQ/LWZc6rla7jHmsNSYHAx+fa4Nr46DHsEOm1s7q
	Dkj6BrFbudfCwpg5Vt6a1gn2rIKykAo3bByW9eNbt6GR1d8V/akKUCPOvOermL4P
	WFLtAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqk9rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:20:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0e3ad6so262107021cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779787217; x=1780392017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=;
        b=Ugo5gAdHda1hKaPwd7KwOx18fCj7KIUpaymKFJX/Nlx3VVx1fU8IrhVGbIqq7lASQA
         aABC8Uw4/5gbZZRq2R1I6ls/yBTV6FsgHF2hexGGvA3aFYoZj+FXSlgcgJ1Nna+z0ugb
         DV6kLZU90MH/NG9pw7BycLP3Tm82TUgcBkvPSAWYVqqNnBxhwWj74asj9JYEfOZoDaN9
         Sb3DTQ02XLPJ/a/Nj6qhGEhf38p8OBiThkM4A1F4U/gBRAJQvFF4aDL84fTToerfiWru
         bhykgQjQ8IOSEdKAkSzCUJkgPsct09cF08IVamjcqK5Pjv/+xQJqf0idDXa3Ve2pobHm
         2u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779787217; x=1780392017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru/2uchGZWEYz4N19Mo1DK66FMzqS5iB+K/ItgMs5VQ=;
        b=llqpnnEUoczxRD7GopytXTwF2mPZ8SH+geVmhJBAjiYjQmsMBGTAnvgO1w6Km6TvEm
         DHS3uK8TG00nguvYaReHCFvwpOb7tmo5rHJL6SqxyEyyFWChQ/5pjV+FYG91qf9ANh1G
         93sy6LJTyXvfT0CItj1721fOh2SMWJRpBznIUlF0FgWkesawZi3++cZ8eh6eAcd2Wr0X
         5+6GA1LwxshgfW55OBS+dTtLBGdYPLicu7pPtsh8hhhuQ5tMlUr+TXunD6ouCRqHHl2c
         z3ZY/p93qAii9Oo6veZbCF7v8HDtQWa0exr4Qj/A9ZzEInyB0Z2Y7ybbvlJs/HzbumYD
         RDpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bgZHxjSrCrcn+mH1Q80kIFFexzdRKJ2OOGoBzd9a16W6papD4+BUetpmnHVLr9DbrI/1ELvL2Yjgu@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQzC6tDvu5KyGg2iOMEPJItGBnIE40oY37bOP++DxW8/cziil
	3+6bGdbp3+Xk7zqehU7mngYs8fUm+mo4l0H5AyXdiA2frXtNb+sOXIPIZTilLE85VVLbJeJXJi2
	jpLOuBRjolkuXftJYC4t75N9JwEabexCRDs2RXZVspRAjNMeZlsqfKQKd0L0mHEHo
X-Gm-Gg: Acq92OHkqqcDgw9ORHenqtd466Xu8LP77eceRr0HQJDjlNjlKLO/SZKj2VHdA4NV/K3
	QZsbyCO2cETPetmvfBCKYRE8QyQSFup5P5fiabc1L98vuDitxGygmXmX/diemQb9BkJgGL0pbt0
	l3aOW+CktdvVCkssIz4Vc+cGUhOTSGR5ssmhhLqnJMCtOiHd7KRckDyjftNz62jdvgkB+/IA7xq
	jYtcDoip9/PzbSqWyhZPYLLTzMDyU3PeW97HZwFUPka24TTic+fc9Tveq5GrnJscpjQ0M6hydD4
	QJCEmAa18ZIt5n2sCPMbh6LoqS8oEFhin+yghbqPISb/uOe0jVqzrOWt8CK4OGOkCEmyPcXjOK4
	WYE6X9YVxSKw8KIm4G7ONXAfKIxlxqEEuzlCwsChnuPZnfHXGFw==
X-Received: by 2002:a05:622a:60f:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-516e0e77392mr148426651cf.13.1779787216753;
        Tue, 26 May 2026 02:20:16 -0700 (PDT)
X-Received: by 2002:a05:622a:60f:b0:516:e0e7:6e42 with SMTP id d75a77b69052e-516e0e77392mr148426431cf.13.1779787216361;
        Tue, 26 May 2026 02:20:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm32741008f8f.20.2026.05.26.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:20:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] gpio: add kunit tests for GPIO core
Date: Tue, 26 May 2026 11:20:13 +0200
Message-ID: <177978721098.28605.12536912087921643875.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a1565d1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RTO6nTXuTbuEUpUxxYsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: aHBBNSBCSW-oYqPhWBBkVHzbu2fpqtNb
X-Proofpoint-ORIG-GUID: aHBBNSBCSW-oYqPhWBBkVHzbu2fpqtNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4MSBTYWx0ZWRfXxkaq5UgZeXcq
 huD72917bPURbyVxvkda+vx53Ic+94T1Qd8IoO29BHfiYqo8Z25tFUIDFTXqa+1wUc6J8afE8Vr
 P/xLjnPtZEHJ8dwep2mMpZcWI7RZaqP5Uen4lVTzMLjY98vrcf1/01pK7SSEw2K2hZuCM1xwM7X
 vsHuDhNODsNg3oONTwC8QWOgZY47S2le8fAmXXOjihw5OBkpZ2OV52l/Ko/2/sf6VUaxFm4/29d
 0oIMV1iynaeOEyIbKRhuEOUZHip1BqMF+FgdvUjG8qFZi51DbUim8oy3p8SiWSPvr/DzbNlTmIb
 sRvspgJ/P0nDyRHtd4lg0p3J0mxSexjHCj7exB4LrJfxOio5H2D+72IY+8sMc16wTIism4gfudb
 nAxAULtPjMlyLFfLfBm4pIrE4y0CkG3MO/SUiS0sYY69ZnJSxD6/Ppv9wIfB55MdbvADYWVaZCy
 OUVcZTNbxAo5MnH1uzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37506-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,davidgow.net,gmail.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42B2D5D32E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 15:42:15 +0200, Bartosz Golaszewski wrote:
> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
> 
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
> 
> [...]

Applied, thanks!

[1/3] kunit: provide kunit_platform_device_register_full()
      https://git.kernel.org/brgl/c/4c237ab773c93959aa2a7750f9dba772b5f1baee
[2/3] kunit: provide kunit_platform_device_unregister()
      https://git.kernel.org/brgl/c/136569e6bc7b2d62e6777ef47caf0a417d70bf4a
[3/3] gpio: add kunit test cases for the GPIO subsystem
      https://git.kernel.org/brgl/c/a6d2a3b403cbcbcdb3ffdb63e52ac090c1003d05

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

