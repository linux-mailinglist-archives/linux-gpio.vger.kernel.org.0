Return-Path: <linux-gpio+bounces-39525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aR7cFkuyS2q+YgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:48:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9682711796
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 15:48:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KuQ6NhZn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FymfwYiX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39525-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39525-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89D8F3047F22
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 13:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4F141A769;
	Mon,  6 Jul 2026 13:25:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA0641A791
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 13:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344333; cv=none; b=qTnF5JOnsqqB5o0FLLO9uD3y92yBKXzcflRUOp4BEqWr8pPhdslaBRaxqXP4XImOD0oNuoAgyhRKbDRt0Ev73C6DzZR9zWsSBfm2OsQjXcdQ90sy9oDTqfCyIe+Tpd5C+BRdIMzzPzwneX6lh8UnqNk2ZlfXhpVpzoKeWbhnUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344333; c=relaxed/simple;
	bh=ktS4BY4QuOgEo1HBlasqQu8jTXCXU//S5yLE8Srd1YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpqn0MGfzGQmKLmlTxAHsKq0GX4wWczm8Ujn/dw+6TTNUYT4GHHGepD8RcPzpEpmZyz/eE3OaXL61vTFdIBgXnr7U22Y0ZfW7511F9T8hpOv0TvYtlh4Syo0qz/1FHpus3hujJ/OiPhHp6RHJIRRZ6MLtoY9sUjok3wLpmAOwx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuQ6NhZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FymfwYiX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax6Y6391042
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 13:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTaTQsKwdFOVotxGdIJVgrm6Q4cEQ0xpapyH3mBfVmw=; b=KuQ6NhZn1QvMbnYo
	1kqdiGS1jCuqPNZpfaX7z624Ah0ZBVpCFQ6Gy6yey+hyu/Y5SD31vHqL0Yx+rkVd
	2C7BEBypx/3nc0HRIvDeD0ED8FnAR6cCZnUxrFBOQ2fArtsrz/o7AtgPg5hZQdxL
	/c539g8jOi53UIeTv0t/1zXUzAA1EYdlPei3jQkH75k5qnle6vsTwcHrnb3FQohi
	Iu5kG2niH59s0bneQh9uq8IWfhqUPwbAlOD3014NFcgyDFRT6QBQQssaACERgSbn
	V7t6oMehp3k1bB80U1sfqrk5R8km0iCKsO4yWCAImODcEbyU2cXeQFPwhTiQoR/4
	G09MnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrxc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 13:25:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so217668485a.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344328; x=1783949128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTaTQsKwdFOVotxGdIJVgrm6Q4cEQ0xpapyH3mBfVmw=;
        b=FymfwYiXxWTJVL0T0ywD0lddFJVPYVco37i2sI73F+ZpktvcCP0/5IZ5JW+xYGSRSF
         NvWquLejZGC1IcG5h6X0FFo7vZjlvUCALpuBolHsgdDo2I99zXJeuWngyibng0L6ymXo
         CxyF3ISMstiY78pjri10FtsopxcEms11Tywtt8AB9foX4AVT+3BZ2FrYjI/HaTz6gfH9
         IenhhSQqReLwcV5l4lNwKXiDx74ms5rYwo0vqqGdj2JvN9Msz2Fwt3ZPKO4dHEAdc7tM
         Gs+XwGyv3gQQMhRa84gsNlV97R4XUBonjAPxZo08fbhtX+xb1KjiHHR6s0oy/9ilxyQK
         CR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344328; x=1783949128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTaTQsKwdFOVotxGdIJVgrm6Q4cEQ0xpapyH3mBfVmw=;
        b=q1DMWpVwvJ07MrXuRQX3kzm13ZLEJMREfp8lzPsm0dfkEtssdAM3g5jkXf3zHhNid6
         bNfgw0C8xgMwGrzP32VwPqgztJG4x+zfMd9ukR4vxSPTbj6CfC4VyZ53jgcVXY5bKGos
         VXZTsq6hHY35B9CLLBXpAvf3XjOkeOqdYNmqHRbe29kVWGutdEJh/nAUHR6GQQyYnDpZ
         sW65XrrKHN8AFmgjqspk+0sRaCNq7O9YEGCr30p9Sip2bj2T/3s4jRdHSMXtkTsDDA2F
         Bncxc927j+5v59s/WSq8xoNNBzuzboloQhYyq6A7enwUjVyDtkPQbTQTvv6PrgiubLcC
         UgFw==
X-Gm-Message-State: AOJu0Yx2VI5aiMrBVkwhzTuftXqoC+IqUt+wDugBlJwGqZUApWsiJd6h
	2SHatnpAX15uSnLuKGqwRjagUl+9RXB2e/Fb88r3EFNVMr8HbGPxoOE1ur/74YmIfLTK+eOOOLT
	SFLq+gdAvl/ELZv01tUG2yqONMoZ9G0t5lD20//N7Xh/9QKqGKvrWRAfrnWtd1HxRV+8opkXT
X-Gm-Gg: AfdE7clH7zzdvPm1YXJ+OwMmtRIuYCJN/aZNcCzOW20IOQ02LXeonxzBa9WKQI9U1Jl
	Y8o3FJeOImKUTuzfCsX04J4kRX0Rc1Nc3Ed4QeImB1SwjtKJJzPiKSmjaZ+EWV8+TrakfHIy29X
	C56sdEEtAZJtwgDw9gEBR4/4SW1gIhICEmeCqVBQAqRjCIRT5UAk48jzbBmj7YXUDSzKpRx+wv5
	On6Alc7r8e/r8m8itwf59qro9Fg4GUU9KgzJDNdcJW7zdKB8kX7pzRZVVFGbwVkkzeQcXLP4jV5
	A5I+QSw2gBGx4/BmIROe7WR4S2HJo2Wsv4yhDjhlUDTmST5kg0dOW3ElTLAuHFo/7dsbxzXM0RX
	H8Gfmg/qwHvL6iQmMnBTnI98pTZqstQ/6V/gdQjk=
X-Received: by 2002:a05:620a:1981:b0:92b:67e6:4b71 with SMTP id af79cd13be357-92ebb5b4c0amr64323485a.72.1783344323147;
        Mon, 06 Jul 2026 06:25:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1981:b0:92b:67e6:4b71 with SMTP id af79cd13be357-92ebb5b4c0amr64318185a.72.1783344322598;
        Mon, 06 Jul 2026 06:25:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm665063235e9.7.2026.07.06.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:25:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2] gpio: swnode: remove deprecated lookup mechanism
Date: Mon,  6 Jul 2026 15:25:20 +0200
Message-ID: <178334431763.50714.2617085645165025917.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-gpio-swnode-drop-label-matching-v2-1-0838349eb644@oss.qualcomm.com>
References: <20260702-gpio-swnode-drop-label-matching-v2-1-0838349eb644@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VopaeK_dqYWHVkE-R5-qzGedJVtOyLqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX32B0I8/zL4nA
 pfHhPELU5lQcCUCf9OKqLscvfX3taWI7g5kg99aT5UYIHGj2tdlhCY1wSSLSbS9qsvTQc+9kU1D
 wvQoDurjdIC5iZ+nDdVhHDVEFL9Q4u3eDX2E6u4EzfI5nakSs+tGThqF6ymE9NnbLTJG0nEUdZM
 M/k0br7oxg7CJiYFONAcuM1/LlpNer4nkJBcleA9kBmc8LFsWpW76KD5zwEIGEWceSMhScTxh7u
 8xMNahTU8ITImCh4d6ZcMJt/zo5O3HK0rQm3PgWCSbQ54zpXH1KAmwPl+F+PFhuYXIeTILVv8nf
 0aLBp3e35UpSK2B9foSnzMbB5ZPfRNVZQsWDVpRkyGvJWrPuCpqeHSQNzySpJndOlIQoDzv+DzU
 9qslX6KTzBShKNzZOkuA3r97NyqmDpkDxTxM3BQb/KwuLYMKP7/uzb4QXIPEcnO0QhcK3o16xei
 WZrSIrN8msI2tNz7GAQ==
X-Proofpoint-ORIG-GUID: VopaeK_dqYWHVkE-R5-qzGedJVtOyLqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX2+SRwFFS4SOe
 xNnsc9YWBNUBlR/4vKldZ8laBESssjZho0i0kL0NYyXT9C7zwWt6USyc1bGbWpRMOW1RYoILz87
 huwj/Fwe3DGPFC2NQbZdyecjXaSTJYw=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bacc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qQVpV-hh4i1UkV8QBXQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39525-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@intel.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9682711796


On Thu, 02 Jul 2026 09:51:00 +0200, Bartosz Golaszewski wrote:
> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
> swnode: don't use the swnode's name as the key for GPIO lookup") tried to
> enforce this but had to be reverted: it broke existing users who abused
> the software node mechanism by creating "dummy" software nodes named
> after the device they want to get GPIOs from, without ever attaching them
> to the actual GPIO devices. Those users relied on GPIOLIB matching the
> label of the GPIO controller against the name of the software node rather
> than on a real firmware node link.
> 
> [...]

Applied, thanks!

[1/1] gpio: swnode: remove deprecated lookup mechanism
      https://git.kernel.org/brgl/c/611fd6cfe13997245f1f1b59b81e957163491773

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

