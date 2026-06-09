Return-Path: <linux-gpio+bounces-38164-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lrYVJPL2J2qy6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38164-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:20:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D697665F6D6
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SaD8J7J+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SfdfRVn6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38164-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38164-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47440303266F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A3C3FCB0B;
	Tue,  9 Jun 2026 11:19:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5498537A485
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:19:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003968; cv=none; b=PSPocK6zzr2T7DLW+J8g6bQJcbsxVSKPhYyd33QtKqcnwLircxK4upqkOrrq15zADoEFgHIxOWM6yF8p2ylJ5cxrfqbjs6xbf961pMDTNUdbp5d70GDRJvc+iYCZ7C7iC5WopmDHa8QrIfGlpQo031VGeN4PyhaBF2gb0uGg22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003968; c=relaxed/simple;
	bh=bIUAvihO4yxTqgHyIWGvmsEgHmGbxLSQ3maqefHhv/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fd/M389iwZTaVNtahtxdNC9zMKPapqgtjryNmC6XkLMcin7XMnRdQNKQExq9WCG2TVoIggWajMQFan5MEQR4rkTyF+jkc2SG0e8xHvJ4A1NCCUl4HtOXbBL7fh7koBpFVI2Z+Z5ctGgO+DnkQrnrEoWStFt1M9Hn2PHfkUMTCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaD8J7J+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfdfRVn6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xxxV2320926
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 11:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=; b=SaD8J7J+KoME1LFQ
	+jHB5AafuO6uZABZe7R3tIY0iyInJ2xkrUs3Xk28za1Vb6AAqD++64P+iLrc+GY+
	n2I53ZO9eXCjei89JhxNyGW5rh2vbIjdiiBLlLGZeJ54oN+AjRy2saZuZZoDv3rm
	Q91cJNcXzKcvdbmTWxE8nxgHOXkXHRKSkPnU0RTptUBFgMll+j/rdZsm3tknhQOt
	mwuBhr2XgCSMm7HNENnfKG1quJ42DyCI/CvFrPhH5A4QfGLYFKRLQtVfaAws206b
	ZbQuiup1FYwhVguGH5ymL6BDjWviDV5q4kQBA/v3C6WNcYInScfsubYo+WU2F0FR
	+r6qlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearwaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 11:19:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd77414afso72928936d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003965; x=1781608765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=;
        b=SfdfRVn6UhjY7TaGB78E5SW0Lqj92s6+z6cobNQLWusiIwfXNzCh6ux1aexbjjYTeS
         1Kzfw5nldnjUz73OCfxhk+FzFgDIhbraEvcYMkC/Es4Bugb1adChL2wbXAmd6QJQDJ9N
         hKkHNPVjmV6HBsbMPRSbDj7ra+ned/1aEErPEWrUY81B1QvwrZ6qsOiSbHWSzj1V0uY7
         P7+excwyRjJxzCh+Az/+3LYKTgX/2nXhDN/iB5KgEt6nzCM/Pv1jwjuD5IbPqRXgD0d8
         yws/z5MJvV/X3BfKbeRztTXWAILnvHqWitaKcQKs2bWraANpUkZWi4sNC4vFyfKuXTuK
         pGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003965; x=1781608765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5t1j9a/pp+ZDfRTNBw57j6xdYqCGUfbsbwQr6SBzrTg=;
        b=jcB8JM3pK68aZT9c2hrZQI6MfOy2d7x1IBw60daSOQcNF2ez6eU2Wn5E8a5l0RQ0NW
         zJo7uLMr9Evc1Uj18VVwOzk/BvHaYElJAbocP8fY0qNHihzvfR6UOWISE2yjVBCeVu6A
         adCt49bs9179qbri3v9sVjAPwsLVbGshXGPrRig09Vy9niInDmSNA+h0DFHMKuZfbuSe
         4xDJVV9K0VIcCdVJAFc4kXoyBv93MEuGelCPtb6B0a6XvySPi55DoD5c0vSsqTPXOE4F
         n7iSqHfKjHPoqodDXj1jgzoFVcwbhyCE5GS6VVl7fLUA1t7aHfGalH84ur8C4tg9TGB9
         u3mA==
X-Forwarded-Encrypted: i=1; AFNElJ9pU0cVMO5m/OSZYhlcMsYvL/b4nl7FxVJnMPyvlumPaTJlksW4iP2jKodPdn5il9IdoDG1vVYx+Aai@vger.kernel.org
X-Gm-Message-State: AOJu0Ywewh8Lrxzk0+oPbp4lcTj88EPdaAmNpyrf1TicQkiw28k51YPz
	O+UYyTWF66Hf2u780FOc7ZB7KRyVX42h/DSEuoWTZZZK5tbk016MefD6B+6m0voytXBjUvsCzMU
	s/lHb05+s5dUTeCnH/6WA8JJ/hL87L+9laencQlZHe2AYkQgRekGbHBpPx6WiQx9S7cHERFmPmD
	U=
X-Gm-Gg: Acq92OF0BdGSCqv5Jrk7vmJsF6SJrU8F8w2bYY0YkxHnJtnLXw/s89now4Xj6iOG11d
	ktIGZHiuinHN+4shA/dBYKu3lcvaH089RSQIjbs+uufMFSUCF+VhdrgJGaVQzas+45LQbLAN1pX
	Lx+Ph50lxt8vr1OFAv3XsYXAUXyqnc8TTv48aZ9wezeJfwwjoEmC/mnOD3GveziOg8It/R0uFl0
	yRcMfoM6BKlGVzZfbrk0GmjsAZPTwfW8hZJpOPtjBBUITlGRnilRzGicefQY8crnuKZdksQP60e
	9euVSsoFet1gvhFWcvByC+FqidFay8zsJS1UqAw/DHej/49KbPNzHZ5VGhmKpl454cyMxTuuZm8
	9EL8n6N1bMvicCfjcveOfPGmqKSlQkJCQlcCW3qyPFTbhrSXO6ZVFM0Y54QzJ
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr196423311cf.24.1781003965551;
        Tue, 09 Jun 2026 04:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:517:a9ef:ce3c with SMTP id d75a77b69052e-517a9efd0bemr196422841cf.24.1781003965040;
        Tue, 09 Jun 2026 04:19:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm564612145e9.9.2026.06.09.04.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:19:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 13:19:22 +0200
Message-ID: <178100395690.129636.15367322855327740442.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609073313.5-1-ruoyuw560@gmail.com>
References: <20260609073313.5-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WKPeCU5iRpkuX0mMevJjmY_Cx1xnpDWp
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27f6be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7uQiEZHuaxwACd3cpN8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNiBTYWx0ZWRfXyvw9eC5baebW
 XWIWuEKz155w2jOBIsKf6+VxBikh4lI0lLfFXhgJQ/nDIpgGg3hML/974KtSE9mJU901czAsZdA
 RomkLTyM1WusMHS+04B9IbH4Ts0JEQBc2ebGZbPYFUVM0MofqZwaRfP4D/rhsrPt4WRJsnhFoqz
 2IKlNwtkIJeaQajhIKUl6GnXwqoOtqMR8udTlrtpH0FO53gfuGL6ttH3b1b/hHE14j3vayFKBZc
 vNyJFddjrMJ2s8nddoZ0TDxAdBPA9eUzmap1hhOE3kb7Bfgccl5LgqlodJPd8GC/2qw+iILAwSW
 PYEX+7C8brvKa0THL7uor5ooDe4a+XJfSad3JpXy3+mV+s/3CYObIs8+lAkrdOLDtf6J+DDWvOm
 MVYgYG3B/NHmQHQjj7HdjMjlEQG6SPwzY+ouJOlAFQQaR/Om7ejhJyKqKpMgDyMDydAFOUoIUNV
 u/K8CSqCEPWhBfZuvNQ==
X-Proofpoint-GUID: WKPeCU5iRpkuX0mMevJjmY_Cx1xnpDWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38164-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shubhrajyoti.datta@amd.com,m:srinivas.neeli@amd.com,m:michal.simek@amd.com,m:linusw@kernel.org,m:brgl@kernel.org,m:ruoyuw560@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:harini.katakam@xilinx.com,m:soren.brinkmann@xilinx.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D697665F6D6


On Tue, 09 Jun 2026 15:33:13 +0800, Ruoyu Wang wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even when it
> returns an error. zynq_gpio_remove() uses it to keep the controller active
> while removing the GPIO chip, but never drops the usage counter again.
> 
> Balance the get with pm_runtime_put_noidle() after disabling runtime PM.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on remove
      https://git.kernel.org/brgl/c/6edb934de9bda3b7abcec856eaee6fc8b4278dd1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

