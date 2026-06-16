Return-Path: <linux-gpio+bounces-38556-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bhLpJif6MGqbZwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38556-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:24:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E4F68CD3D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oDntlX0n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eGxnVpfk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38556-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38556-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B50A7319D565
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 07:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A47C393DDA;
	Tue, 16 Jun 2026 07:20:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97183955E5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:19:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594402; cv=none; b=SeJsH/FSGLk4GfaW6LaKXUBxzQNI21/Wm6uVug5jicON+b4WixKqZppnjhlZB0gZKW7qlIBcuo/hTMqlg4EYij9+7zRclkymAly7z4JmlFePjc1zM6nwUIDhBuOsOxEk+ol6PyO5O9hcNGdfyIO6Rvks5zOUWcQbgowolBVfDeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594402; c=relaxed/simple;
	bh=D09FVj//bXLTu7CdKC52j99axLyyBoKFfqC/RwSEUG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHgInHV1WwNPoydX4/m+WKTszpJBsCMgruv3/Ewef+G/FK4asaGb9EghpQ2yoda1Sh5PlVbRjQQk24kKqE3HJ9JW/qW6osY6Y05Rnj83AtpxNA3bnU4OROS+W1lOQ/fHrXv8E0N7u/Bxsyji1R+dTX4Z8wL0gawZ0NHtmTsKBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDntlX0n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGxnVpfk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G648TD2239690
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWfddFxTMvwl9I/culeyjEQFdLxSGP9hs50zxJ3740w=; b=oDntlX0nrINM5sKP
	ZmR+gnhTDvMcEi5jEbX4w01wzyKF8jbsmFzetf42k6vw7RsCJHUBfC/zAzj8iBHS
	zL5qKGlLPdrB5HpwLGAVK2Cf8xdFJ9itavdMziW+crvfWvH4Z5zny+wFbg5AGvMU
	FgLX3MQD0RQkvlOLrxvS/KHgc86MM8oRo1elOSKK7Zyu2OKPc9ugz30WaTfTwiVx
	9prbdXvhWRUf6Je92nygcIVQWPwM3hhZY1lDF9+Xy/gtLrmp3gzgHeHdzjl1bFmp
	8kif4iIO7TyfuQM8Qzl8k5Y6Wpjkw3FMGPpchzq8yAbO0RdcCmXeYFkAD9nJPK1m
	xfZNJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7rgct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 07:19:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so501388285a.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781594397; x=1782199197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWfddFxTMvwl9I/culeyjEQFdLxSGP9hs50zxJ3740w=;
        b=eGxnVpfkahb2f8YFhgag+eMWg1ZhtDSjtQJYrhfmr6Um1m6Ht5O7FBiOEGF8CpyzFC
         +E+Ip31j4x7Z2S/QvQkTOouS/47HBBxBLASGICnhkjSTadDMs/li4eKAhggh9JN88fCe
         ozCuGMa2LUfHdGYZnLsklPDjevAmHOWDuvoz1QB4emMiyHKbgO2QP9zd+CcbhTlI+Qwy
         yd4gfmOtCn0/Bs7UKc3Jgf8S5HrGBRXgrCc8NMGKT6m1P1ieSQBNJ8j+/2YfRqiRVG47
         wh2/tQYulLBvs7sApoUfKflD2Xi8ZCovuOkqqPd1MWqmkIXspmDnmFlL1usXZQLYVZGO
         6qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594397; x=1782199197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWfddFxTMvwl9I/culeyjEQFdLxSGP9hs50zxJ3740w=;
        b=Oia6OL4N7gtZTARX6k5ThGDtK1pgNvNVUpg2V/qpA+ElrjQYFveHiGS+2/lipBENlm
         uC3ke+kCoL7pf+spn+9tASpyvLy7wjp9ycI+rJJTrC2q1WTUao2yNde7EXxLAhbUfuyD
         gJI1/OKaevqtwVRb4B6fsErxDGfa1lLqZQHILXnp+4cpWHFHkwr/m+4dzLCjx3Gp2FgM
         9wwJn95OfPlTclz8ngORi41yu9CwGbUhqx1iMurqSIWk5MCPKdApN2GRmrTQojPxf9X+
         GWc0GwtHr2FC1qHA6eEu3BLmzm07JqbLLCRFfOhoDpucwtIarKGL07UetkTo6oRBH4DP
         8/HA==
X-Forwarded-Encrypted: i=1; AFNElJ+VnOcSkx+YwMyRPpO0/oq1e/Uh5nkmkwxnQPhUGeMZ56L0MKMTOjmBZ8VSvYZAdXXC/pjRYzmheBCs@vger.kernel.org
X-Gm-Message-State: AOJu0YxiC/9LTvE588vm/X9kDhXnMOSCav53HMm7DqFNCXGnAldwwFw7
	3XRVPfG7qRB8iUhwiwQ5viGfcEoJP8Ai7AcNdNx67e8qg5RnTTrjdZFiKWuvzSh36GubWCgJl8Q
	Bp35BySy86y1kxuJcsD7iuujC4cjHBlRbFBpGOUbTYg5IYuI65U1GiXCOfj6XUngG
X-Gm-Gg: Acq92OEC+6LHN/2mdIMb5ziUj0w+O9yLC76VYamcvt+imfdea3fGPc+cOM9G3P2nhLd
	VaPgbhhF1YVgULCZteqnZIesqsf4Dl1/wfIWq+LI5TZ8KSbD3KRhDuKyG/57OzEH+jzb6waQZts
	MfUO/30NM1AzAotMoD0ATBWIEZQP3zm4xxRxTcM6Bdh6RwoioBiMHPVw8HZonyFRM47/wMAOqXB
	ECjTt9UGkjTMksBDcopFALc2UXZIqzGthVh6IK1fILFwfX67EYi0KOt289PzGYhwf/hhDTexEw1
	Beuuc9TmUPG0V+482ZqgG8IXy8i8RmZp7+gh5w/3GtSL1NBFfF/MR+JNeyauVShQhrj055+bFJm
	zAjkJM/2QO8mGVb3qWkg9NnMjvVMrLffw9/XwMKQiThJa+1axcQ==
X-Received: by 2002:a05:620a:172a:b0:915:9125:e634 with SMTP id af79cd13be357-9161bd3bd92mr2582361085a.42.1781594397057;
        Tue, 16 Jun 2026 00:19:57 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:915:9125:e634 with SMTP id af79cd13be357-9161bd3bd92mr2582358485a.42.1781594396694;
        Tue, 16 Jun 2026 00:19:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cbbd:82b7:e325:35a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa891acsm56413945e9.9.2026.06.16.00.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:19:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pisosr: Read "ngpios" as u32
Date: Tue, 16 Jun 2026 09:19:52 +0200
Message-ID: <178159438830.4110.15768654133535216916.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612215216.1887485-1-robh@kernel.org>
References: <20260612215216.1887485-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA3MiBTYWx0ZWRfXxF/Gd7WeT0Ui
 qjO3Xx5OB4R5NucUbd8ljMLult7MD+Er11rXNIih/NQfW6XcuTleL3hD95DlnRSEOMzsPheE4Rn
 MEtJXz7lgMRkWT2vqoXx3EfHUpZu74WVbKsYCSUSVUjLTC5N72oY8xB4WFQu6kBiUejGEnsF3wF
 MeN6ckKxqkG9ftupWbI0pMtcnYYyBpf5FB+mOj4ses9duF7MhFG2B+dNXMzxbpInY8UR/tlbfPh
 TSV6LGGQz7ZNDjhTE45/JgfBDX7e/0d/k3FfsKgnASX9785szp/TNTbojQnJ/fKCakF2isrvJK3
 l+0UtAWc4qOCX1wyWPMhPrCkd9dtHxgWpCZRbdAU53lhmKBUCutzhVfnjbIhrDtoIGZKLNRACuv
 QswcMU2QvSBQgDVEg5BLiRip+itmixSb1C0FQNR3gXjxT7Xnv0d2jZc7vZAs57aatAMeReyr/CQ
 16gqEiV+vjHqUCy7DVw==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a30f91e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yprVbPf3HNYiYnaa7KgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KOY0bHDAyYPrkBSI0jsDLXMxngBDYOnt
X-Proofpoint-GUID: KOY0bHDAyYPrkBSI0jsDLXMxngBDYOnt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA3MiBTYWx0ZWRfXzcoOnjuuqxkM
 4H8EFIveah0vhYWwVvQAhswj8r+/b8P3CO19kup2Cywvhr4ccvi1yntvFSRlXVYW+2K+j9s5O62
 ra/Q96tivSApFDbymx6A3eT48RktP2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38556-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E4F68CD3D


On Fri, 12 Jun 2026 16:52:16 -0500, Rob Herring (Arm) wrote:
> The generic "ngpios" property is encoded as a normal uint32 cell. The
> pisosr driver stores it in the gpio_chip field, but reading it with a
> u16 helper does not match the DT property encoding.
> 
> Read "ngpios" as u32 and keep the existing assignment to the chip
> field.
> 
> [...]

Applied, thanks!

[1/1] gpio: pisosr: Read "ngpios" as u32
      https://git.kernel.org/brgl/c/4910aa198d25e5d1067236560ba34ab12bccc677

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

