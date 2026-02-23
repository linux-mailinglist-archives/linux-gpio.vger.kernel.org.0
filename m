Return-Path: <linux-gpio+bounces-32028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF4VGI8lnGlHAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:01:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEB1746F4
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0092D301626E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C74334DB59;
	Mon, 23 Feb 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEUXoYMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvsyRK9l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3541E9B1A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840907; cv=none; b=NCrd2DDfePVtm+YVbbeqCDsUodPyJhny3bugouXTA5llaTSSmCl8SMABTWmNLyuf7Iv1lajykxZfI6EcZ/CdYwmPaM/pJkAVMxUyTGvT+tW4b7/qC84GYOcV2AuHrg8bNrqqlwT1lYy5CwMETog9JsGSwoimf8y9ff9Hi/aGKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840907; c=relaxed/simple;
	bh=dcePJWakgaEtvV/Ei7I6J7OndSFm+WL/5URnBqxSjXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ffog409FfEQ3mE3tKudo1s6KZAQKjgudLsNKWGz3ehrRb2GJEosuG9MyWrEPZWyiX5eCbkanCUSTO/5Obfz+23tYsDAozbUVTYjWPVzMqo56RcjkGg6pi3j/iJ57FVOhhjpD2duwa/s8u+qkmRufMeHnOBSUtWr7roMNEX67K3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEUXoYMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvsyRK9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7JFrN1189024
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAv5VEWAeQfGcAQPaLYCvWQ9GN56A1pZQu4gNB3k590=; b=pEUXoYMnV8BWtoYu
	eiVCqm4c7P+U786jrxo5ko2mW6qfzkokFQenJXII4nqKm4BG2/7JnmabJvxeYCYN
	CIVAlHXlQKHbSImZnIC785BtMvYf4D9yi0NtA2wTRVCfSLpckXJHA4RbGDNVJavm
	7ZrJfkUK2koVHBp0SWn5gCFsCBGWm2Gd0f2LNBIm4kFpGwNZDAl81KXWlzoId3cT
	1zKn97sL/wMA0xgaKQiTN+UHGUzX7kL2B81j5KXyevR3ybhfwoY2F5ajgyUXYWVM
	jKqI3iMu2D4JU0xBEDftC2ZzQT9er6T7NmshNs8HYrHV8nr9dRzzWpRfA8X6divm
	aBfvYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv9af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:01:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so3783865485a.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840904; x=1772445704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAv5VEWAeQfGcAQPaLYCvWQ9GN56A1pZQu4gNB3k590=;
        b=EvsyRK9l3W9Nct9mYyVNdL7UFSK9n++XfGvfz8jOLeOpMRbgX/9Lvigfyo0Ytai32n
         CwOx+B2RyZ2PtB8XxVFxo8HiQ23w+WkJQ+CFC708/+DF0ZsRSfHr4eHgZIhYh4vXootm
         NNU5VXpbORlfyVYuteCrWO9Z5WkjrhasjOBGTjh0tzS6wMT2OOdFfhKPAbJkG97GDzUJ
         KmYA2lIk09P51r61XuUR0ug1AeYh7/Zk4OKa2dvtND3xdkd381IY8Syppoq6kMT1gnUK
         wT+5Cbsx9sOWrhiy0RZemzXwxIX7fu8AyDvdVajKMymqzEqJQu5aaELry7RjPHjhCvLp
         yXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840904; x=1772445704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAv5VEWAeQfGcAQPaLYCvWQ9GN56A1pZQu4gNB3k590=;
        b=mgyDJSYp+BoYru5QhjpLo0iYpf9iqt598Pm9T10mJkKrV8nTHAgSy/97XvEsCF19+I
         eW/vAbOZ5YmVl1PumwitXK5ZIz/Pxgby1T9W3N5ntW1Mp8Lz6E7XqZk3iCPeVeBNh6M7
         GVei6VrwC/o3hs9LmOseE6nUcOQoGW2DgFX0CV+NaSGSZmtRRKbbLuhk5oZbkiDRhdrY
         sMwnFkmnGtrsr/FhuFYoqnpjUnjOsmsPPeYJTYiykzav5m11j/NLOHt5Gy6npQoQ2BNS
         Qs6ZujhnxV7boDOnZ75gzvyeaHn0+fQp7tBquSyAORtQ2qt4caYHyk1KFrW91jJvrXYD
         zAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgOqysBv5m+PGyEZObX48JjPOks1XpwbX4HIOEhwyDf0mRKG1OCCDdF4I3uiGPzv8isyHFnAouoGYr@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHmQdsK1UW1zRoLk6XYCLqkeOzXlHffcw/9ESJ+HbBTxKoeWC
	BN51/M3SA9aL3JEdFmqGH+0pfRHbpOuBDKolbwXxsE18aTDkUYvzwPgtVttc86NPsQZtcGZ7diO
	CrzhJCpJViH6uiu+SWPUs1CMd7cclQzjlpWSsh6+VfIzG9rcz1Nk8RJmC0Sgm3XA6YMw7GpJR
X-Gm-Gg: AZuq6aJJiKeRdVWJgMqnn6tvMjvr7eWAdnsAb+2kpB5aWy8UnnfEy+WI3w5vWasGQLS
	eG7tFEMKPnkGIAm7JMCfliDPNJ0wrj68BUXIBCVQyVb7mVEo9y4Liwkmo0ECXmlrAhbjfZ3W13w
	w3vpMOJ8W9+GvpZjKozzC4rsK/oAD1aDpNJa47p4VWrwugnwVb+ZH3owmhBcisW029B8svjY3Ge
	9BZ3gra8uK2PeoXpn0QsYvDUpoN8Ovfa2CiA4cBKh/Xcfwe7wAqWK6cRnpZGuDezKH+ultoc9g3
	xcJ3DaYaordg6ZHS9TYpx6xtMMAQReQItp8KSA4JJK3htkoXt71eCMxJa39TuNQ/Mz20hzcKbVY
	kcKo034tnaZh83aIYE7gMRQqzc+rzBu8A2uircCZ/Ow6J98Dv0LI=
X-Received: by 2002:a05:620a:28d1:b0:8cb:1ddc:4300 with SMTP id af79cd13be357-8cb8c9f3cc5mr883434885a.20.1771840904385;
        Mon, 23 Feb 2026 02:01:44 -0800 (PST)
X-Received: by 2002:a05:620a:28d1:b0:8cb:1ddc:4300 with SMTP id af79cd13be357-8cb8c9f3cc5mr883431085a.20.1771840903939;
        Mon, 23 Feb 2026 02:01:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75b4dsm286920845e9.4.2026.02.23.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:01:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Daniel J Blueman <daniel@quora.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH] gpiolib: Fix shared GPIO memory leaks
Date: Mon, 23 Feb 2026 11:01:41 +0100
Message-ID: <177184089656.90626.902750387638923538.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220093452.101655-1-daniel@quora.org>
References: <20260220093452.101655-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfXzbTDGJKVlhwA
 EbqrhHCjL2yyBe42XNmGvmIs40cV4bt1sRTGgHnxmT2bNIG+ELN3/iQCavs74sY4+V/TyV2ZN/R
 HvwPTzCUOoW0Wc5E+wj3qVnTOnBnO2kgRAEemHUS8VpJF4PvlNfdxZOI0eEFrQb98ZOjLUBgR74
 BwD61u6RURwzxOmc753vtPHjcK7i/kk/EOWO2xZ4QEtjerT7uJbkz3UedZ+HmAcquGboYjpf4Pv
 8jZxnZzarhfR8vA+Oocy7i58ebSX8Ir1GfAgXzUanTZHwiN2XBqY3a0LL682E7l77Np2wrEfi4K
 KQIsC1OAGFCLGz3xxKfybXnT7G3Yw+s+u79MKzxucEKDiy6AgTTXx4JFjbJVVGLMG0c0JcjLOqX
 fD5mn6TmDS8OLJ6tXRqU2XGEKBQhofUcGki+dIDyVqnuPTL4F3G+Ib9GtQNLyb4T83cX29JcORH
 0/1DSQAtoCArzL9dZTQ==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c2589 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ayzshjV3o1hgqC5rpZYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tyUH8GNJ85DBvioyR7qLJqDMIdz1VKfd
X-Proofpoint-ORIG-GUID: tyUH8GNJ85DBvioyR7qLJqDMIdz1VKfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32028-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48BEB1746F4
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 17:34:51 +0800, Daniel J Blueman wrote:
> On a Snapdragon X1 Elite laptop (Lenovo Yoga Slim 7x), kmemleak reports
> three sets of:
> 
> unreferenced object 0xffff00080187f400 (size 1024):
>   comm "swapper/0", pid 1, jiffies 4294667327
>   hex dump (first 32 bytes):
>     58 bd 70 01 08 00 ff ff 58 bd 70 01 08 00 ff ff  X.p.....X.p.....
>     00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  ................
>   backtrace (crc 1665d1f8):
>     kmemleak_alloc+0xf4/0x12c
>     __kmalloc_cache_noprof+0x370/0x49c
>     gpio_shared_make_ref+0x70/0x16c
>     gpio_shared_of_traverse+0x4e8/0x5f4
>     gpio_shared_of_traverse+0x200/0x5f4
>     gpio_shared_of_traverse+0x200/0x5f4
>     gpio_shared_of_traverse+0x200/0x5f4
>     gpio_shared_of_traverse+0x200/0x5f4
>     gpio_shared_init+0x34/0x1c4
>     do_one_initcall+0x50/0x280
>     kernel_init_freeable+0x290/0x33c
>     kernel_init+0x28/0x14c
>     ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Fix shared GPIO memory leaks
      https://git.kernel.org/brgl/c/32e0a7ad9c841f46549ccac0f1cca347a40d8685

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

