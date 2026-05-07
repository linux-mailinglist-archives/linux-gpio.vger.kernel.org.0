Return-Path: <linux-gpio+bounces-36331-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Mi0BSnX+2mzFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36331-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:04:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1E4E1A82
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08ADA300AB0B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 00:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545E2156CA;
	Thu,  7 May 2026 00:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY2JWpgT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD040DFA6
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778112294; cv=none; b=JthN03qx03ZdoYIKR2txN6p6M9F8dVAaH/6IENbGcrRFnp9edqmzypEgNVHtFQsAPZhZyyrb+I2DpB+YwzyIIgL/I+DqOFPdBcR2bHUs873W8tvaCqKiSm1mzqIJQsZxKRgqhI0nizU7aWHeuhq5xYpH8LCP2+wZVNjM8C4zgQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778112294; c=relaxed/simple;
	bh=16JQyE6Zi0Kp6GQ3lbRAjtd2h20JXLIwEYfU7LcZ6ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3ejIXUDT4YhTPo1K/GtyHZetUQw4imHZsOekl8Q4QCygYFqs59vFu1L8FZb+nvfC78gnpF1tr3ugbfbagrq/O+AvWms+yXeG6Edh0DmXBA1vxnnVtUK84hSWf33o+M+EyCQTa6PN9XsuoiAB0YRp59nMCEUsg0VMUgGLiBIJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY2JWpgT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so2204635ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 17:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778112291; x=1778717091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xA8C4MZYJtvM8pYVZlZQizvYlQAizDIxyROzXvXV/0M=;
        b=nY2JWpgTmLAHO94Bj7rzJB1WHQZCdT9W7zqupz+gILiyo6JOEwtZsvDoagybwUyMic
         NKmF2kZpsSIymJarZdVbE16h8rMb7Ys8yWJqhxWj2DTpLRrv/QTf5qVQMwLx7K5xcbGq
         JNUS7fjOA0gf8ZFaQLsx7SoZLjdJXGZK4+RdUIrv+AcbAWCjhNwd0/GBSjMQ7zOcLgeF
         CKNyercxx82nFIKLewav1ansdlzCzo9Fb+/yCbNFgdV8nrrMlvCMq4pFfbWf8/xQ3+du
         PRZrQ3x+xLT98+555Eovj7O3e1N2guJvlsXH/s+AL0o/QBqjRCF9wPyTvvZxNOV0hJW5
         pyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778112291; x=1778717091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xA8C4MZYJtvM8pYVZlZQizvYlQAizDIxyROzXvXV/0M=;
        b=rVCHiAscPp6QAKUMqOaKCL4Sfd/iVnMDnoWhNRY/GTGCPA8aRmmD7MevN4Byo3teZ5
         JuYKdmyQD2KVMS7i1v0pNX3gZA2dctv3W+HyhvPyF8m2nxtEnPgriOiDCfD82R19JCUV
         bBrOfqgL/Lq4Swyl825ByEEpkgIgSJi38TI2kyOrGJmubDGBbjKmzEDZ+t1HgnnxyZ+N
         TUX1w8nL+9muC8QkZ1MolKjp/6nJoh+K+Kjw7ez55O3gaEYa4HwxwBzSSpBZNsFN1rso
         pUB1GHEhvcmk3uGTEJVcYNIeSN7kTvaAvHYsPGiXmFJm5LrwBkeTyD/HzhVugyt1Nzev
         r6sQ==
X-Gm-Message-State: AOJu0YyetflPwXDt1LteleW5H09AHVSuSmNtD7Ysz88hb0Zs6xLjo9nX
	uZ2bcc7IeKLyrII5jYY/Qm1bo9t1sJb1+ozyZ8znuuju8t/uRW/cWxQpGkR0pw==
X-Gm-Gg: AeBDiev+X14psDbeNoccgg26jaqX8COx5/EBmnmgYRYfsPmnVsSnkF8Pz+AQtObSyZ4
	KQUK3TTiuiOkHWqOfjolptR7qdB04eThJ8vUB8wc29vxZbqOrvLYr+OdUNHYiX4ZUgFKkQ7rxrE
	F8Q9Y/8OSvnSVmziW11A5FBgQX5YEQU3hkuQyHImp4j8CtgCgeevRzU0KkYsj8P1QGm6ZRQFQbu
	KfAXsUzPWVgXSWLNVSXeo7PnYWHAb3rOLdMt90Z5FWQRgozrCep+TO0J/roVf51szeOrbZpFzEq
	7wtIrQCqt1gSxJ6kLsmbFPZvDmaBsS4HaPy8qYaSWUdvvPkkXv8sVSJxHDTEQgJabnV60JVKVt2
	s7lOMSDyHrWDUmIJc+Yk3B4To5fpQBkFZsp+ZCT4vT+Q3OLHjHufUABKLdDBn8j8cQ+30n7Deqb
	WYObn1ko4ALgfD2IHHwXiC137sNDsy25BIbYpa0PWXs+XTR+/OkZ1SVPSFm12yOI3nMQtNQO0jr
	sao+o8=
X-Received: by 2002:a17:903:428f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2ba798d5657mr39069615ad.25.1778112291000;
        Wed, 06 May 2026 17:04:51 -0700 (PDT)
Received: from ?IPV6:2402:f000:3:1001:8803:d9da:dac1:4a73? ([2402:f000:3:1001:8803:d9da:dac1:4a73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baba80ac1esm4058255ad.0.2026.05.06.17.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 17:04:50 -0700 (PDT)
Message-ID: <5ee7815e-a858-4359-881e-cf1b47242d0b@gmail.com>
Date: Thu, 7 May 2026 08:04:48 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tools: gpio: validate arguments in
 gpiotools_request_line
To: Maxwell Doose <m32285159@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com>
 <20260504075036.12190-2-zxl434815272@gmail.com>
 <CAKqfh0H7BzdxYJr3bQbymrh9ex4q7fLcCbGEkp3HPX++pJ-XMg@mail.gmail.com>
Content-Language: en-US
From: 007 <zxl434815272@gmail.com>
In-Reply-To: <CAKqfh0H7BzdxYJr3bQbymrh9ex4q7fLcCbGEkp3HPX++pJ-XMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B4A1E4E1A82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36331-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

OK, I will redo it, thanks.

Best regards,

Zhang Xiaolei

On 5/5/26 00:13, Maxwell Doose wrote:
> On Mon, May 4, 2026 at 2:56 AM Zhang Xiaolei <zxl434815272@gmail.com> wrote:
>> Add validation for input pointers and number of lines.
>>
> Perhaps make the commit message more descriptive?
>
>> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
>> ---
>>   tools/gpio/gpio-utils.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
>> index 176bccfcccb0..930a38fe7911 100644
>> --- a/tools/gpio/gpio-utils.c
>> +++ b/tools/gpio/gpio-utils.c
>> @@ -65,6 +65,12 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
>>          int i;
>>          int ret;
>>
>> +       if (!device_name || !lines || !config || !consumer || !num_lines)
>> +               return -EINVAL;
>> +
>> +       if (num_lines > GPIO_V2_LINES_MAX)
>> +               return -EINVAL;
>> +
> I'm wondering if we might want to use ERANGE here for the num_lines >
> GPIO_V2_LINES_MAX check instead of EINVAL.
>
> best regards,
> maxwell

