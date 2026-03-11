Return-Path: <linux-gpio+bounces-33051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG6lMC8FsWmypwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:01:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75825CA07
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 07:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 242E731715CE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 06:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B31F1932;
	Wed, 11 Mar 2026 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtPKDNWG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA520D4E9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208875; cv=none; b=OsaX/hJQZcoIWmDDHi+bW2fky35Hn0Abw/RSUxnYBJJrIIHbuQ48oKyGLu4ixC2iVi8G668iuL5OP3nS1PUeW9K52VUYFRFQLx7Dc0Qd4udiIIw3+RiMaaXgeKLgd0zQ7zCIFDQTDPDP3ixcppYSHxTCLrEyV0yY39nyvcqK8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208875; c=relaxed/simple;
	bh=FHv5CcvGElrMvmEHMUvhtPhr2308VdCmghoTlQx6D/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uqp32qIrahL3mGkNCWbLJuaUwcYUv0+SjXw1C4Vfy8Dh9Uyohnujm2zvj/IFQZ7yzabuBVMjTnab1pM5fXv7Yi4S+2ddp0+vHUsRX7FbUqZHvG18pkhG3il9xlXS1MYqz0pkb1vX1DbNzc10dXabU4Ap5y0QrxXp1Pyzzobj/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtPKDNWG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a46657a9fso38035981fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 23:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773208872; x=1773813672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aSaRj1cZBzRTfaPBYAkuYcLeDYu3NPNEr6xQzwupwK0=;
        b=DtPKDNWGX0Bb322tp5HVhPWjRvKV1Wxwdqlx98G48vjoGUoqBoz8VU+jcO1RsgJKIV
         ec2fR5hN9omThylma+kBz1x6gv+8UkNtRcanFGIzE7oiMyROOTbqL06JpqEzCSbVezqK
         E66pgicydG7bn+6xEg48PGh6SPLUPYY2n66qdqvPnGo3QAFzGq4lgQ6H1VX6F2BQV3Ji
         bbanp6fryW6wxO4vVR8MSWeF6wbHyLnHUxiPcGIoKJHVisRbP8nXK2mPKp+Jjl5sIyrH
         z+iqVtIdXKBKBWevfvI3a9E1rNb29GLaFu+1D+ppHQHQF+ZkKZClFyf3JxzgjjOaSKRk
         N9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208872; x=1773813672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSaRj1cZBzRTfaPBYAkuYcLeDYu3NPNEr6xQzwupwK0=;
        b=DOmN6gfKVH8v/6lZkLta8LJuVII3qHykjyGo5j342/rlNOQE1i4nSt/CSSPm22Lzgv
         am8wq9yXphhO1HmXc91fhzc9RGsLlVHA3bpFXOhrJzWO89DreF7Os5smeHUE2lXbZxpk
         UyhG1ssXwd+ZkJ2ekllEYRi3L55MBK06mm76wFp28+e0hAXR8yWiC3bo59vpMBo58k9e
         gf38u9dVPb5Mx6VT3aMyQKw9+HTFl9UBrCywnNOq92/41tv+hEP/y4Qa5yANxQ/M03iS
         mqk6imrxvtsNxFzwSi4GbTX9CZXX1dKb/yYwMtKIxXtgFjQPZlXe6auUl8bDLV7wZ565
         U1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCULuZCdEfLPZC47hIVAWGok9Q6yO7TkHcoGyVN4GkAHPDSk9agPd+evCswYfAnKTefD/yq3Xgx7eatR@vger.kernel.org
X-Gm-Message-State: AOJu0YxNyhtSstXoB8y5S/XpLvCr1kGaLmEpL6wrlcKbKMckcXabVKOJ
	6UhSNaZgDJ3P12+ixEmFu1bkjCjBSkBMHWkny2bdIiJOK35rtES7Zo7q
X-Gm-Gg: ATEYQzyV5eajc1rVnXif/vLOdjq37m5C5jygjUbnKD6nlfr2cQgu1XbFEZvH++s1IbP
	VmdSUkLMgTOjnNGhAYngE5VvzFZJGGRVoS1I50jwpnrfMI+3iZ2UzjuEDlaSHc7rIocDpGECCoJ
	o2i5cS+TJJ7Wf0rx2Tzl8FPK/kCS1PvmAci/i5hDXcBfCgLGLAFfIvVJd6W/79AR8vZwU8nMdZ2
	RZqloX9fE4saF80uqb7w86PFR80RgoU9fXTERIOhLQ2k03aK6OgjDEg8bhq+OS8yTQCx+4r1hJt
	uIuhA2sgRCkcM8eUTde4KUEJNE8C3q7Hu/ZhOxaG72gw7CMkqQPQkXq16bj1ZVj0WtsKH3AhdFx
	WWodhssBWSY2B6ZyBrzvTXpjwIepJx3VL1P/y8+zbtazamiSMDBW9jrGpjxxjdQ+Kku0yTRwKWo
	KKUuAenqPTTnYoO4pa6eqH+wAoa9Lrjk4ZcKYE9hDmaYalOFJob0I9NtdzG4eDLaCXZW+5KcIqn
	1A3TqRW
X-Received: by 2002:a05:651c:1544:b0:383:26ac:4fd8 with SMTP id 38308e7fff4ca-38a67ab7436mr4685301fa.0.1773208871805;
        Tue, 10 Mar 2026 23:01:11 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d5fab0sm2023341fa.8.2026.03.10.23.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 23:01:10 -0700 (PDT)
Message-ID: <38053082-5cbf-48fa-b724-cac822d1e5ec@gmail.com>
Date: Wed, 11 Mar 2026 08:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] gpiolib: clear requested flag if line is invalid
To: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20260310204359.1202451-1-pobrn@protonmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260310204359.1202451-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2A75825CA07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33051-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi!

Well spotted, thanks!

On 10/03/2026 22:44, Barnabás Pőcze wrote:
> If `gpiochip_line_is_valid()` fails, then `-EINVAL` is returned, but
> `desc->flags` will have `GPIOD_FLAG_REQUESTED` set, which will result
> in subsequent calls misleadingly returning `-EBUSY`.
> 
> Fix that by clearing the flag in case of failure.
> 
> Fixes: a501624864f3 ("gpio: Respect valid_mask when requesting GPIOs")
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

