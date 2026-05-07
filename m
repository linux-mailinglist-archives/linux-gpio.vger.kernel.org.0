Return-Path: <linux-gpio+bounces-36330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLORMOXW+2mzFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:03:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 291814E1A6B
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C9A3011C5B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 00:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01AB40DFC2;
	Thu,  7 May 2026 00:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJeOxaS3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD940DFA6
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778112224; cv=none; b=Tvq8BJ+F0KK37qmA+V3bfUGGjcrONUKO8riXc5+Nd47a3vzOvkYKFXUwFnfBySXbHFdWRmO4klTMhi/mszh8GfGLtSNvREbc7umG+XZJyMvThp3EA1ypbPBtC640ivt4gLJr+kvrUK8MVCUIWeQQATXnvjWn6i7MyQ5pLTKkFxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778112224; c=relaxed/simple;
	bh=DAwYPoPb67CSOWq2UFolX7DmvwzypuR6HTEal3r1eks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD6nMrLpVM7Kyo8k2tm/zNa9wM2lTtfHOyG3rLzyhwYW6f1NYLsZRKtJCRQMg3yVB4y4LwjTlbHiEXskW1JgfB09FnYUAPAcnjrMsxvXWdiEdgmZv/5uxoddUAVHgq4mGli09dvN1OnU7+DlGjNTiQOvoyJoPVGr7hsR0rJ0vYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJeOxaS3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c6e2355739dso69297a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 17:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778112223; x=1778717023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9c6CwSx8wVYRuhPAPIKpf8WPHzla6FT4sQrKqwwW1kU=;
        b=YJeOxaS3m0s6e/qIvUss92I8yphTppS683sUVR7+//hYxbabZjgrGFfL8g4WStqZF1
         8qqtnQn5XVys204dC2vojkgduhmGB23xmGffXgt4r5nJc7049m+0ek5tKRMpI2sF4/JK
         Qj/1pLzghXPiV0rkkNqKUUNYdJamDVzAtiKC3rgrvyOItGYyImsJkPynx7mig0+SudOb
         WD7DQDN5Anyzmdea8oMueOUWGYqDl4QFhfIryf/YgdEfilio2OVtP2s0Idsf/DDugiFp
         JGd5Gr5GaWphVMgB21LHgApY0LPb5UxX6+dzgcDSUQ8V6PymLFJpR2nY5wTr9c1wN7/C
         odtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778112223; x=1778717023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c6CwSx8wVYRuhPAPIKpf8WPHzla6FT4sQrKqwwW1kU=;
        b=JhURRZFvl9jEw2dDvg6aYaL6lDtB4ZtqgUaoNWt+2ohm0DHpFqclUw+h5v3UWfjvvt
         qmBM5/BWWx9OLTS2Jk7Vn/H67Z51z2mjFcyHRIo35YWjpPBwIaKM4RD4OKsSJpt/qNDZ
         58ox8uM/oKc9asGtxswdbvmsmEQdWlYj8xpC31G/cIGkmN6H/C2LA/ixWtfHeDw12JNi
         KJ/C0x/IMys4kagjLVaAQ5TDc/WK5wIBQQfwtrh3JNuVsghTLyzAJkM15KO13oX964C4
         leSMMmYsv7Ni9Oe5mfU/GwC8yPnKzARdHjyALM0uqLk7OYLxPd8SpTRd8GRP1B5QC5qh
         QgOw==
X-Gm-Message-State: AOJu0YyvqnpHlMxTubvzS2jeB/Q3DzSwklAjEw2SkEeqyPedkfqIbgFg
	W9LVxkc0Haunz0eqpraIC2APk/aZqR9k8VlGLnBrT2YTrP5DQnbxC3LO
X-Gm-Gg: AeBDieuA5KjILguv+vLgnooam2T8AGk/BhQB1Q/st7fusu25etvhDHzJFV/MgcSLRI0
	tko7ZvJpmO/OWGNyjX/c/bB2PKkRaAIcuIgo8L30KzhYForASdQSVM+hzBeUAsnhT3CSeZwT4Sy
	EZ8YbnJqTEuQDoz0dZnuuTKR10K/LGPMK+bv8sycK65e5b4grl2mYviZU7PGkOlvJhKZ9E29y7x
	J5uAgqv+FFGb0OMmdx/PLSCqNyK1g5YDbJ/uIEOI94nBDPcFnXraD+ROPCe1pbLVDxD6E/g4ts6
	dQkC3EpP5USHJt1F9BLdGrfkwRoHsmtrI/KSo5LTgFtpuixHoN+vzn0F9EAXSOAYbzw7Trehqf+
	jSVi6/ChS0GTACS5MY0w4SlmTXhtKgMuWGH2q7L0xUgBz+kbeMV2iekk+sESp2VcUvKO/2JgqKp
	b1dkwE98FOgDBxKcTyZOCmaw4d8oTQmO+hrCYpVOO8DXgnUnqD8+h08txwh1r3NR8GXzdA/Oi0R
	ykMMJE=
X-Received: by 2002:a17:903:22c9:b0:2ba:b5a3:187b with SMTP id d9443c01a7336-2bab5a31e16mr14034195ad.23.1778112222614;
        Wed, 06 May 2026 17:03:42 -0700 (PDT)
Received: from ?IPV6:2402:f000:3:1001:8803:d9da:dac1:4a73? ([2402:f000:3:1001:8803:d9da:dac1:4a73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadd1d93sm3471225ad.40.2026.05.06.17.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 17:03:42 -0700 (PDT)
Message-ID: <04281d11-18ee-47d7-b698-1d802716049d@gmail.com>
Date: Thu, 7 May 2026 08:03:39 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tools: gpio: fix ioctl name in error message
To: Maxwell Doose <m32285159@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com>
 <20260504075036.12190-3-zxl434815272@gmail.com>
 <CAKqfh0GznF_QDr4S0KKk3c6HVfFhgEQQPO2_W6T=eTYVXnJe9Q@mail.gmail.com>
Content-Language: en-US
From: 007 <zxl434815272@gmail.com>
In-Reply-To: <CAKqfh0GznF_QDr4S0KKk3c6HVfFhgEQQPO2_W6T=eTYVXnJe9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 291814E1A6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36330-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zxl434815272@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

Hi, bro, I will redo it, thanks for the reminder.

Best regards

Zhang Xiaolei

On 5/5/26 01:47, Maxwell Doose wrote:
> Hi Zhang,
>
> On Mon, May 4, 2026 at 2:56 AM Zhang Xiaolei <zxl434815272@gmail.com> wrote:
>> Use the correct ioctl name in the error message.
>>
>> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
>> ---
>>   tools/gpio/gpio-utils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> [snip]
>
> Patch looks technically good but when I meant split these patches I
> meant into entirely separate patches. Please split this away from the
> patch series.
>
> best regards,
> max

