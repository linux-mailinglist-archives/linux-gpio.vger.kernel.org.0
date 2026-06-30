Return-Path: <linux-gpio+bounces-39236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzWCEZjUQ2oYjwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:37:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD46E57EC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 16:37:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X3mayltk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JlTAL/aY";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39236-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39236-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E69C3075C18
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4903643CEEB;
	Tue, 30 Jun 2026 14:34:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BD43C07E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:34:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830094; cv=none; b=QjNO8sFit05fUlZWtu6EvSWpmIRopCVhvGQC/cWKdtKKrBX6/KMHS9DdLCDRQwHXpHiK1bLlze5rpSUbfw4luIOzga1Mh510BOY0Par3nzXNGKlxJ3jwnj7WmYEo3N1gnmRQ3APX3GbAbSTd1oOB7xiwN1j1R3pJzCgqWc3iFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830094; c=relaxed/simple;
	bh=lZM7oAAbV048Ywo8OjwAxBmcHqaUbKplwz6HjKvzIeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1zbaqoE0AsBu9SuSJGNdh1bOZgBJRY1QnHZ/Z1lbUL22d+SWCOKvAsOd3JpSL+mv4GpBAG2Fl8vkXOYdTOt9PHKqUfEoc/1rj7xGrhNHJaz02rvLVotWG6gmXJcEKdI5nf634A0vWKLw4YbcxE+vclAQSHfBsL/kSk7MKVLHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3mayltk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlTAL/aY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDWDw2116507
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=; b=X3mayltkFx8D+Dwx
	z7uT4zpKb+4gb1wM0sjCLE74OQrhiJt9A9nylkWrelzhD5VcoX5zRHusrTScIoWN
	pwmXErkpSbHApPytSYTGr8DakJsUbX7E80uo9bE1T2Up1YLdcjwGYQgKwlnRTSza
	95lOcP3GFmm0etpGuUknINbFjFsiozHS9VmnqhLt0OEcjz4+BitPLpmx2S+9Uciw
	TAF0NtjwTWN7TStOOShlKJe6uop/njWMRAG4IMZ2G/AHzAu2dsQy8t1Ega4Mbt1o
	vZhdc7jwGyCLfDNBRrgTvTP+sij2l1u7YRjGP7+aRdmcXfeb/mFYUKHXcTUteHKD
	JBrfFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j420g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 14:34:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so151985885a.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830091; x=1783434891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=;
        b=JlTAL/aYfslil68nUrUY6rFlKnarAT+RNVrRKQTwMS9JRk2JKGkLB9IG/P3EupAP9M
         veHsCLDwKgTHMFAJfoXm+yXemTe77qmujtMyllIAkU5D9dAQVfMjkpEEdy5CJ7/6uKxq
         C0Hd9+uo7eBj7hZOBiRm5/vwtZymYIm1tFc9JcdwAIRNTRFZAt/uHXwrOPxK0R7N3Frr
         JQGK19gV9bFQ7jrouF0CMctdrCvF/qzqSBcuwQCaaI+HK++m6uRuEtMkwTF0HdZglt47
         Z3vk4bDAuezbKc5dr9Oq+uBQH1B5X6ssLCaSKgDnNSl0GrA73YkQxlms/HwjS9VJ2C+x
         XCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830091; x=1783434891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=;
        b=G+XOC3Fju8qZk4uGr2bKOSW5l+qtG4Pn20TlRCTozThOpyn2ABUwzfzHG4Gsn/Ju72
         uTZjzSi12ABHpD/lJHWLUpGBfpUrpfTfnzdOmwVg4xP9AUQw/QpF8trAETSQXgLIxI2H
         O0N/s9tFCNnG5wtv8FR5zgeo/3uYW7C7C7in/chC/HiMB0X/Mm/Z1g9MbKpDN4wfYoOW
         cPJsH0/0kXRcKaREl699To3xW9Y5oF/9ANcTwUOkBq+qlsKLleuYaBmt1raMjBdR6yra
         hVKMEbBn15zMYM1iO2e4n2TlYVWERzOEcqPibQkcuvkp9om/6GZS84EPe3530zaTmrjg
         YBVg==
X-Forwarded-Encrypted: i=1; AFNElJ8WlzspHjPWea/F3orWeCoI1MEf9n98T3ScCptNvkKJoL+48resvMe/gJOfT2INFXBOZbrshKd0Hnxa@vger.kernel.org
X-Gm-Message-State: AOJu0YyjU53D1XOvEiEhOro2tAIZa5MxGZkymjrIaxjs/utVStxwZDLT
	6vbUkl0EOEW+k95Hv5+BMQaZe6fCpLdbaEEE+EISRre8tBaB3HKM0uV2u2GQKUIXxahD3AWNQ2X
	GjNV1Se16RL4OLt7VnSMEaXT8DhC80RdH5qJE+bFScGL/NRLBu/FoDhuvYWlmU5Ej
X-Gm-Gg: AfdE7cnYR2Vtzj1HuRsu+wMGYKLUYANAOi7GmoW86LHoA1oJnlyFBRnzLB8UnZUMb0U
	IeADssiCr9MaZpctt1QfvObsuNp0baFSBRUhm675CMFH001y5Z2/H06KAk+LxhIt3jaht0Ztl8T
	8YPosF6cyuldZhoCMUGnLYi4JoFj1iF/IL3lXeBMXkndZLxvGbV9LLVldDCik1ui2GAG5XlRgXa
	OslYNN37SG76TjfNjBIi+3zDrzl00QfH2ncbOmXMHixND6IfBAT8gBxTyhijTfZXKy9zbPJI10y
	TTOiHzlYh1rkjfSh2vbPDQhVjn3G15V0HKReRs1YpjkjkhkkyXdMppwqJaREAksSQqYair/nliN
	1aynN4Q7UajAtOXbxu/LS4CM45mfXCqHt0hDDLKc=
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr260374885a.15.1782830091175;
        Tue, 30 Jun 2026 07:34:51 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr260369185a.15.1782830090635;
        Tue, 30 Jun 2026 07:34:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cde2sm8499097f8f.20.2026.06.30.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:34:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Date: Tue, 30 Jun 2026 16:34:47 +0200
Message-ID: <178283008339.36195.17218594271210377008.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HXhf4yCiiHaYjSBPRRsiBDcFnThHxRRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX6G+vlD+38uRu
 1S55b91ef+ro+stqA26HfWCvx9BNjMmMKHbdC2GZ3LCZ5XM14NTIXccErOUIdE9oM4m5N+BArvB
 SF5/Y//CKK2m5o9vjyJZnlihZA/0idYWON0TWyKEdCe/NzgRfwpal9ka7AxQ5e0gJ15Cw6GKPgm
 dAq81ilBZ1mtjIlacl5dMDOIjkzGdCsUo+IWc7pVLArTxooqYZqA0oXcyaJYmPT0OyA6eP3ntNL
 jCLf6WYTikiSKErAvwcCOKY6EKYF2YQJ3s4N3CTS7QZ54Y1bHTES8lq/+sqlvHInG4d3gTSE++e
 42IZ0XXfpD6mWPnyGfzCZ/P2fFakDqJpD+WukGsd390tt3q/uDxClGHJKQhzpY/8Kkk5DTn5ZSm
 695Mx4XNQglLJ+zNVgFcfJnnAqATubwa0xOWg0s5Oih9rLZsEn086pLQ4hCFeKJRUmEO99mD4Vr
 pvemHu8aoH+nWy9mLgQ==
X-Proofpoint-GUID: HXhf4yCiiHaYjSBPRRsiBDcFnThHxRRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX0vHr+wOBHZG2
 H/pmslLgvv8GeA+XrASHRmh7KghzSt4/V5MwRWJswUdmOdbSFxmgRmZKWpFedVDhrKaU7f8uEWF
 kVaxItSqZc/XOZf5gP6Ylm+Q5i9Vwec=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43d40c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39236-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:johannes.goede@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFCD46E57EC


On Tue, 23 Jun 2026 14:27:31 +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> 

Applied, thanks!

[1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
      https://git.kernel.org/brgl/c/72323d7dc5118f5c7c269ff67797d342ed9effc7
[2/2] pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()
      https://git.kernel.org/brgl/c/e417d51c7f2ee08361b57a97869a2870bb417782

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

