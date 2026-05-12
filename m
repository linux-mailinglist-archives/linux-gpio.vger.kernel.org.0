Return-Path: <linux-gpio+bounces-36661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPZ1GBr5AmokzQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:55:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD451E1D1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C0DF3023BBD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005354BC023;
	Tue, 12 May 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7vX5SnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHX5B1k5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC314A3402
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579697; cv=none; b=j2xoYQlDsJWcm/Uo2hPpC5SkXORC0DSUF62y2xXUW5l7YywlYruTFuL5OHDXddmyFE0AffJwdTe07xX/A5y8QkarEhqqSYuLOyoGbxMKu4Xbas6zfGASJ0Qvvi/2cax3+r/DvPl6HBMbnQ7Axb2PechBwZsyHdkUmsGm0Un59K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579697; c=relaxed/simple;
	bh=LP9lgz4Msj1CRsSqR8/ZLpED5ow9tqpuk9zH6kmpM5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYXe2mhsV4eZ11HNWqKp1gnKzilJ8of8BVPS82RWJnuJFUYWQm7yMU4DuF3kUPdiXC+nLeMOzuKpbCwh72Dgsnt6Tv6gBgbeHg/uCEIFkKR3V1pbNpqldp3uahQx5TtV4oaKTFtySIyzGoscZxjGBcw/LnFoXQbF55DK12HS+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7vX5SnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHX5B1k5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C54bj13385236
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkAt25Y1RcA2KMs/uWsnggIA6C1hoGm/5awuHmFfTaU=; b=U7vX5SnAp3RgS4LC
	dotB8bZ/QvvJVSAy36AxLgjELFEiyke4NUzCVqHOdv49c9s+FJIuBbFwf0P/xVhs
	z9ZrdMfN5Fl3HwsvfPZzsL9kh0fmXebrjsDdkogDfuvpNHdKN/9Nay3L6fdNBRbW
	TVFdQALeN1/XgHq7ReBozOaZ3YObsGivPh1d52EyGE7paneBtTeMPOkKVqyngxKl
	P3jHVmGW3r6dNQdfrd8CsuVoJ38dq1RSvNW+uazHroUJbeijMUoc7isR1DjGhAcc
	QdSrDUnoOif2GMhzxHctIuge/7wcp9CpD2axfq7SbAzNWn/Qfya35a/oK924SjrN
	QoH7qQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4jht5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 09:54:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so29757411cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778579695; x=1779184495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkAt25Y1RcA2KMs/uWsnggIA6C1hoGm/5awuHmFfTaU=;
        b=fHX5B1k5rUYpP8RvGxCjSoJrhR3S03Fvhj29/2i6wwFao0gYJQPNp0Dhwm8zFfi87M
         /UX+4EDemiMJ7EiHjf8VpIgkkrBBa+MOXoClkMmNbgos1v9/YZ4wzXXtF42IjcnavgYV
         3wsLDJqKqm489RedIWzMUSyu1+J6jNzouEF7eG0QSpilCEhgBwpNPbSGrcWnaOPLukZp
         AuOfziJntpClRDazs4bLG5Mccfg1n1djToW5PCoMHtJog240QZVi4KeHETjrWXjQbmnQ
         /htzI4W1HYVU0p8IrVa3vXdn37ZwnlYHn9f654/TuLuaVWp16YpTDftHg2Nq1OgkRVqi
         qjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579695; x=1779184495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JkAt25Y1RcA2KMs/uWsnggIA6C1hoGm/5awuHmFfTaU=;
        b=VghNkfUX0vxdmZ5VVHYBQNdcezmArEpFjP4/nBS0dCl2AGiPEU9/Icb+8v1Pp16CS6
         +XdGdOubKrkYLfX89vBtO8iwHCYOmnD4qbuszVx5EQVKN9efCFGOXuRKmqCvNyra62ar
         NFct1P3XXPiSf8W4iYBpcfQWtigIuAZjoDGSU2fpW62P6UKrymps17tDEKIfXvG7zyFk
         hg2h4F4v0GpzdOAJcz5Y2vuo4ElEGHDyD7f0wJeQXsh8WE5jbszAX/JMhKaQgIYqm17I
         +kr0rOWMjSAvRTEzBSMkmJWbE0YxY35cpDkIIQmbtXovxrMozkD4XiIgEeM90EJ1wjX7
         1zfA==
X-Forwarded-Encrypted: i=1; AFNElJ9lq1WF2bK51GQ99UCPFuj5p0bEfKx+aKaX7tuCgOnmD5HID65rPaIFs4neR2dkjDN91n2qWeTJ9Hv3@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuOsBvRrxVwctn7n4eHsHfmaHHsy4WMnNS5byAF73OJPJaUnZ
	1YPJF00y7EXgTUyJBL/02RKf4XnW7FNf8oP/IYojfZ3YO+UmxiNZBKX1+a+y2xRA4b7Mvmvup53
	SpVLFmqltQ9fHtYRyRpEPDtqNot+j5A4lIYynTZTyX3nxkDqY6oSXJizZNFAfNNHUzWt++kuZ
X-Gm-Gg: Acq92OEKSZk4O2FspLeQiXfduWi4N9Un85G45VwXLjOGMiJtzrgPGOcLzOIF8TYJsWU
	waGstWYWjAvYOG6Nx57OzcK6tuLau1Uri+X0kMmimXJsSjp2xuAML8GS8l1ioRth15HlGAm4vKG
	nz2C51rN0T1zc3KoMzQm7jz8DT1/+PLYwQJomPvpKoKpTUZPE+OuGZt9/CrWgNAo3xKXaZyBTaK
	fNsmK1Bc9+fukl0izOV9ZxbqA2Yip3U7EtJByP8w3oNH+0iac5pEmvtmnPDE4c1xsS0pyP6Y5w+
	J+gzZ23oR4d5opsH8pLpCissSQ6BCOnDvkQjKKLQtd/P+1iu6K7HG878oLunszeG+cM6K5nCk+7
	fHBjzlkI6+hX4JkECcRh3v2yCj/nWToD+9ZRf03n+M6C4MfjfAQ==
X-Received: by 2002:a05:622a:1b0a:b0:50d:b0f9:1a66 with SMTP id d75a77b69052e-5148e997928mr238527941cf.42.1778579694816;
        Tue, 12 May 2026 02:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1b0a:b0:50d:b0f9:1a66 with SMTP id d75a77b69052e-5148e997928mr238527691cf.42.1778579694374;
        Tue, 12 May 2026 02:54:54 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm31977751f8f.33.2026.05.12.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:54:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>, Michael Walle <mwalle@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 0/2] Support sparse unidirectional GPIO lines.
Date: Tue, 12 May 2026 11:54:52 +0200
Message-ID: <177857968790.14984.15569066020623977002.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02f8ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=l_-MQjcyye6h7M-lYboA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5OSBTYWx0ZWRfX/TP4NJqKEQ0B
 ws9DKoS2L5oQpqIT15vzaBTwliVugkTk0knfqfbP2lhz9H/tE6y0xdWgkcDM82uiMT1y9UEfwMr
 pEnQP74dQGG3+X6bYBnDdGYIyp2p1YFFyA+dUQwQJDp1WP7uidwWPYtFEyavUOzKFAqENhkA/qe
 HvnYSiRXIxzWsYJ/E0+bS6Y3FqfCIVmdJNQAOaLvhSW+RbLT8cRVGZbvncuneuyxwuINdMQvZcM
 aXxH0nTra27xIZoIFzoSQ8Cf3vCM6OuL68fQ3hl0fTYQdpQbEayEgm/XX0E/IEjvl4BEKaNemjY
 NvPXeP9BgR3+rpd6+95X1kbvPoz6e549Nb9/M5dwpMXT0txo5XUHyKRpcAGyFq+SJwVVHyE2Se8
 4aJTH2PvyxU/DUQjggu5ZCYoV1tGBEPYSErcV87+MxED71RJ8/IvU2bK04AIX4Qh4a3Wbp47A2N
 iU/z3zvBUZ30wEGwdFQ==
X-Proofpoint-ORIG-GUID: 9MM9WpUjjFCEPR5Sl6T67jPS-5Xh0bJR
X-Proofpoint-GUID: 9MM9WpUjjFCEPR5Sl6T67jPS-5Xh0bJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120099
X-Rspamd-Queue-Id: 0EAD451E1D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36661-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 11 May 2026 21:43:42 +0200, Linus Walleij wrote:
> This adds a fixed_direction_mask bitmap to the regmap GPIO
> config and state holder. This works the following way:
> 
> - If the bitmap is NULL all GPIOs are assumed to be fixed
>   direction and that is specified in fixed_direction_output.
>   This makes sure old drivers keep working as before.
> 
> [...]

Applied, thanks!

[1/2] gpio: regmap: Support sparsed fixed direction
      https://git.kernel.org/brgl/c/68d801eabda5219dcc25c9de98d3bbdb5b51b0a5
[2/2] gpio: regmap: Don't set a fixed direction line
      https://git.kernel.org/brgl/c/806e7acf7f331008637b4f8ecf211eb0a082e6eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

