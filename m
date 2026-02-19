Return-Path: <linux-gpio+bounces-31875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v7ygNjM+l2lXwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:45:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28635160C5F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A294E3010512
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30486235071;
	Thu, 19 Feb 2026 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HHM4A7oW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987291D555
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519537; cv=none; b=qz1iGDiWCeP/90MGIlnGqG4oCfQEJ9w475vrLS+GuVZqaKJiIQS4Wk+Eme6YJdylJekZUAoP0ZvEvySwm3sQDcL8Gs6ahNZNVzhSeUcfCZ8oKOj+jTtsvX+6aIypmgrsscH2faNAjKNy/5LQ75DE0asWTRapDvHXotvz0CWmlUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519537; c=relaxed/simple;
	bh=eAU2uiQJCT6eX1B013IdoSn0jKWIs1jDU1Td0q/CSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgakXop43h3gj83T29+2M2cmeTjJbWCnzJ5f88aD1N4pTD7oZY5KTddTl+1VZ4jIEvmSjflmhYSVX2wzXU01uvEKLmlJbSFP6AHFsje5sUguoaKVVNDxtddh8w73ftts50eZLkLOToBFlXczGUqsgNrv59xZDNuxyhspJHq+77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HHM4A7oW; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-463960df4f9so686396b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771519533; x=1772124333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r11cTXeI478JqdZagL8TTEuFUSB4TUZFWka++A/hM4Y=;
        b=HHM4A7oWgBxEmqBxj9wo0Sv8ZaQZwZxHgq32aAfi2rShTcmtap5/CHeGRd4Rzh9krA
         GjgEQPwq2HJvBtcOpfvawb/r5gUSmfk7b4oJ7p1OoDi5asjhzFFN1aubn8sXx1UBRK8c
         blv0NkJO2yfPC8Aah5pznX5Pxk9m+hpAR+Zj56mF11RQXaxy7K4Zo4zsXzCjUKKPJz0p
         2sz3d+PhJ6PDG4WLp+ozjcztY3ci0nLxwRD4v+XfWzwt7emw607pz4MK5qY3+0m1IctO
         t2zh4qNbErAIBtDWDHiPf+hiCSnHT2o348K2wk6N/V+bc1OPmRvU91+YH9xdzam9bTxE
         QwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519533; x=1772124333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r11cTXeI478JqdZagL8TTEuFUSB4TUZFWka++A/hM4Y=;
        b=nSJOkkeOp/MxzVjq3IPjeTxnUjbW96S1MXOejNkI//wKJv0yBedtU1tg2MliqQVxeJ
         s4xDI2xns0luROFeKiA5pOxaryG1hGWXhNs7ZydRSxps9ugqV8yXH6z+2+eVNMfkNt7F
         zvFE8WuCbrhXSCA8n/FK5RrHLUN1eeC2lKyTM23oPXynDcRhdPzAxqO0la4XXbupxVkS
         064H9hfXW6gbtYoOJT5PmJfarCb/kOWyfaw4EhC66WqW5hJxV7pZc74VQJDWhRKVIezg
         vE+4lDVBhETiVdly64lWqz4i05Yry3Gqa1TVyeZnRxujj3qfg/jlfzHJOFKkFPSPuUrJ
         +lYg==
X-Forwarded-Encrypted: i=1; AJvYcCUshuk+g/YDiTnJy1gbrGimF+4BjH+o6hz5N6TQ7MXQJhibjw94iI9EhRrPGuk/V71iPaxK4XCDC4A7@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHv3k9fcLoPMKwYe5sarpKEy7vXIC8gN1QzvXbuJ9DRssqDpi
	OTdzLEwe918rMrXUdgI0331P85H2ZYQN+dMrZrXzmwEvv7UqXs7BSJssFTqF7436cQA=
X-Gm-Gg: AZuq6aI5UvXHaR0An58IeS9Lx7ic1+Y0Ie5bL4HWDpcGKkhYfjm2OyzJuqucDUQyNpL
	Kg//Seo5V9QOWdoVng5h0A2s+hAoTh8uOJnotuLRkhkDNmFZ0k0ZHszV9czMe1uk76qQs6+umAH
	crycqNN6cfpsVJtcWDtLCsHkIagIGne0hcbjq+vteOEKQ/G7VPpo5TikEQ+DJNLvV+zZGBYI3dQ
	paPt2XWspYy7gSXROj2makkK0nUYVEhvXUghHlvLRWCnuMjmjP8YAxYH4JX/phvf/mC+Ggrmg0n
	umM8GG7fyn086sywi2MWQ10AqqPh8f2GRkNYweNojPwhzCLuqR0lvnNwc7uqYJddmqxMQh5DtBO
	HZppnLM7ZQOE6bxaYudNQORdzwpMSZ639cWbUdcAPwMHzGSUpTNnNd3BHpBGmvzGTZnIMXnmCsc
	wDidGWxf34ZgG8NvDfsoGfXxuCSvZNMHVmSkfOBgL/oNNPG0n640XekZ12JTXexagt4O3D0Q==
X-Received: by 2002:a05:6808:15a0:b0:45f:12bc:4585 with SMTP id 5614622812f47-463b3f078bfmr10319922b6e.11.1771519532988;
        Thu, 19 Feb 2026 08:45:32 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b0cf66dsm16350200b6e.19.2026.02.19.08.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 08:45:32 -0800 (PST)
Message-ID: <1a575532-a46e-409a-9912-fb46e12a4da5@baylibre.com>
Date: Thu, 19 Feb 2026 10:45:31 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH libgpiod] dbus: daemon: watch for "add"/"remove" uevents
 instead of "bind"/"unbind"
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
References: <20260218-gpio-manager-bind-vs-add-v1-1-0fb22c448de3@oss.qualcomm.com>
 <d63e251e-03cb-4c76-aa96-f8550a43c7d8@baylibre.com>
 <CAMRc=Me6ULf+-nOKLXuj1966mW9uuiM5fq3twhC98TMbGjUs_g@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAMRc=Me6ULf+-nOKLXuj1966mW9uuiM5fq3twhC98TMbGjUs_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-31875-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28635160C5F
X-Rspamd-Action: no action

On 2/18/26 2:26 PM, Bartosz Golaszewski wrote:
> 

...

> I'm not sure we can make sure that the condition exists from
> user-space. Using "add" and "remove" uevents should be fine. I ran all
> my usual tests with no issues. Let me know if it works for you too and
> - preferably - leave your T-b.
Tried it out today and it is working as expected.

Tested-by: David Lechner <dlechner@baylibre.com>


