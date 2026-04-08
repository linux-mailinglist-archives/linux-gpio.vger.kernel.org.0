Return-Path: <linux-gpio+bounces-34868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCFCM+4H1mnbAQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:46:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB13B8853
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2477300B3E3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 07:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BD0389108;
	Wed,  8 Apr 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag6U+jvI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52C35B65D
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634203; cv=none; b=RPnsIhySgc4AapFP/tuAfI3EIdcMKRANUcvSfO3QD4RItfHVtTfVSV6FGAqZMjVXHjKnwlBZXVQkZpISgx8cMSf50Y8G9ECm9bIQx/UJAW1zGvfBxiSzd2Kck+zibjjkgEkckXOdccRRghAHE6lOEqQWkZXnMZ2uiH9rAfeOzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634203; c=relaxed/simple;
	bh=FVrkQLqzRfTTn662gTwVRk7jP+2yxPo2jfqrboiVMBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fssUlikom+yXOSHf4pr9CSglXX/GhvCI0rXUEG81+QHw8QqDkoxgqv4s8+g68P9WqQWCi6znK7mxU0aocqE2o6FkpPe0bHEV9qBTLZlm/DT5+A9Vr/6sXC9Xz0drwColbKTuMlWh1ilP1Igt675mvfk08nP/5RBC+B90XyyuYMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag6U+jvI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso6437468e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775634200; x=1776239000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYr02N4sEgyPGrFLtqaQYZgzdhwTkxoIxQrvtNAx6aA=;
        b=Ag6U+jvIwQXdqaSgqtOm0tAGJ8OiQcx1i8lmrSTkYXBVnELN2NhW8aBFGRFHwes3jG
         H/0t81BrNxJGkt5UzsVagOhjleYBq7c/c4G6qzlxiFSs6TWeqQtgpLTxS+srsoqZFEgC
         c5xrfDFL/dlrsVwAPsl3nner7X9iTNal4rE1ZpvcaPmnqid3eC4rmzlAQB/pexHXNIOM
         HpdqLhMkRdSckwJr1lUCE0r6GZiLWYlpGAcvJCt/qROlqpe/ScyuqYN3rJJgrqL9DafO
         yijWF6+dE4eiEE0LocVxeKsq5R7NSCPO/TmYjH/RLI1I6g4nZWqcnZZ1AIoHB9xHGQtT
         /hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634200; x=1776239000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYr02N4sEgyPGrFLtqaQYZgzdhwTkxoIxQrvtNAx6aA=;
        b=pMY4XWgqr87JRlI/Vt9qcYm79i3rjcBI4tHg6ZBbp6a4+wkEI23oYKrPmOEQD937HH
         eKRuc+mk94uOVBm6CODKOeIigXrLCvyyTAblZ/s7nc3ajDX9JaUd35UKSjsOkG9+P0KH
         6W+WfnZSI0ibT87x3hoV1H5JK9AVN8qy48w4kP3yHWWGtxEU3FqWM0os9qDOrUBooNqQ
         RHxzxUXqMCsXSVWQvRniExiylt6XXOzG1PFAeAydSjFlnFpBiLmD21JjZ7AXV4Ik0Bf4
         Nt9a+CcSGc/C4y2tcvQuh3fYFaaSPwPrqLAy9eI+c5aenztY6edAnB+7LkuN34bwE8eI
         YPRA==
X-Forwarded-Encrypted: i=1; AJvYcCWsgrvWpAVforYtzRdXEaGfjsqolyjAoKBL30g7xXNiLiemmeg72kqLhqyMfOpIipNnmpwcfrrgdR+4@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjX+gk6plsPBIc8wJo9PbYYlMZXAwIstpjHDVhD0dC0ubKj9R
	+gqZrHxQJdGyGJn7AhLPKfARi4DTuga6xpoE5qfIixZf4iKrpOqg0Ihu
X-Gm-Gg: AeBDieucNoV2cgIww/JdDZFJeehjoJj37OgOGdXw3M1durD4kpdWOFyT2AunlP0XDpX
	wFl0cdSynIR0xwkHzVTnCLLB7zOILIuplAxVZpGRVUbfEr+pUVPRAk4JgDQHudPkHEpfT4TgSO+
	l3HWSJCm9lyjTeQDV4DMTsuaexYVYjo7PSNgs8O91OWXwYjfu2Wx/pfJnSzYbLaseRj8FyaKZEF
	ux+DAtjVv7gwKQpn0s59p6LzHeSIe6ii/9YAaeTT3hiEveJUxady7LB6W7Zw7XsUWeh+KSm6RrV
	GGbVxT8fXTOm2Dl6ChCbN7LrSPi4HSPId5i1KNvIj7/Yy392wPxtnrALh35+kGmUbsosX3EoTUX
	RdmjwguctGbZEv/05oDghqq4sTgwQj8aky2hM7SJo5xiOmp4Y6F8E/GBkB4ZWOv721ralRVIQUT
	NVBEk9aEZzDvlDU0yeDuVS1v1kKNrTeenW
X-Received: by 2002:a05:6512:3b0d:b0:5a2:c766:13ae with SMTP id 2adb3069b0e04-5a33755053dmr5751339e87.5.1775634200104;
        Wed, 08 Apr 2026 00:43:20 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95288sm4693429e87.14.2026.04.08.00.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:43:17 -0700 (PDT)
Message-ID: <4cea1226-dfef-4612-b744-10112fd869fa@gmail.com>
Date: Wed, 8 Apr 2026 10:43:15 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: handle missing regmap
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andreas Kemnade <andreas@kemnade.info>
References: <5bfffee380863bcf24f3062e48094c8eb7b1342f.1775565381.git.mazziesaccount@gmail.com>
 <177563264634.6152.117129686332918058.b4-ty@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <177563264634.6152.117129686332918058.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34868-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43EB13B8853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 10:18, Bartosz Golaszewski wrote:
> 
> On Tue, 07 Apr 2026 15:41:48 +0300, Matti Vaittinen wrote:
>> Currently the probe does not check whether getting the regmap succeeded.
>> This can cause crash when regmap is used, if it wasn't successfully
>> obtained. Failing to get the regmap is unlikely, especially since this
>> driver is expected to be kicked by the MFD driver only after registering
>> the regmap - but it is still better to handle this gracefully.
>>
>>
>> [...]
> 
> The subject should have been: "gpio: bd72720: handle missing regmap".

Indeed!

> I fixed it and queued the patch.

Thanks a bunch :)

Yours,
   -- Matti


---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

