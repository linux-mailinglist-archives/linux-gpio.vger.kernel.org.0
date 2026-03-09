Return-Path: <linux-gpio+bounces-32827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCSjK6IPr2ldNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 19:21:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291923E8AB
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 19:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6386E30715DD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 18:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3909C28C2DD;
	Mon,  9 Mar 2026 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="O6MIOhTO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916452D8387
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080329; cv=none; b=Fq3kLfOJnSDYfSaZogEeRv1MkabUp25Idr2f0u+k+vlorbMjxhaikMu12RAqaYftRn3eMO3mUQHsmS4ods8wIPkKNDfYR2eVzqxkxhDMhUqt/YkBDB++e5++Ril4VkWYlBM5F0NMlZCS/9deEJ+R7EExOQV5+rkaEXpnOyeMufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080329; c=relaxed/simple;
	bh=2aMBWjpKHG4l6a39ZgwdL0cute2JFyOjPolxG7XWERc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAGxcjwSJXOkbwCTVXYJaN+2qOnnmnEBLdZHQVpzn8zFS8x6oHmnmUlyEyDJLDFmFJM7e0C+e2HY+N/WKn/DVkvOQL+LzprAb9xCH5r4T9QMeaYWOQgCxGh4VkOfgx+8sO2HIyavHZDoMhzGKNdew8VsCadgC/iTJV1gwVhgpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=O6MIOhTO; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id zd3dvxAoDVCBNzfBgvZpV6; Mon, 09 Mar 2026 18:18:41 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id zfBHvKpSMOs9RzfBIv8qhj; Mon, 09 Mar 2026 18:18:16 +0000
X-Authority-Analysis: v=2.4 cv=HPPDFptv c=1 sm=1 tr=0 ts=69af0f00
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=V5vwHjfW8xl6N5DwPO4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZqoQ9lkNkezuo7Panmj7PEOH/0BqG4BNzGHgiJvpZQg=; b=O6MIOhTOtWuHpbIUV7Upkm4xg4
	IxSawP73Ba3uRUo/hucIWnKb1m7V19GKWOv/RjsHxCDewtYancmIVQ3GInTbhJhcoYGJZdRTE7nCT
	AYYcN4wEn+YsDj1XXWoipZMFAYrBZUKn+J61SQvr8HVrPK+TD2ha2E5yVpr5oeqbGpLAVy9LD1Ncs
	KSaFWfG7yn7h7jmb93WoQph4UqTNO/ZCW41v4LGXc/uYAfYrxC3VUK3QbMq72QYV30aCjkEuIRAEb
	Errd3DS9OKG5o+hNdB6X3lSMw/y31OqCIS/3606QouEpSIUw0qZ6B+TrP/e0PI+J/FATulK/BOovE
	DgVSmxlw==;
Received: from [177.238.16.13] (port=39494 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vzfBG-00000001N0A-4Add;
	Mon, 09 Mar 2026 13:18:15 -0500
Message-ID: <7dac0a99-0883-4ec1-9bfd-49b659bd38e6@embeddedor.com>
Date: Mon, 9 Mar 2026 12:17:39 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
 linux-hardening@vger.kernel.org, gustavoars@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 "moderated list:ARM/MStar/Sigmastar Armv7 SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260308021535.48098-1-rosenp@gmail.com>
 <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vzfBG-00000001N0A-4Add
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.13]:39494
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPb0AFhKHRwSqADAucOtu/3kbn3IYi8hePP9lAc56PYLHXt2FjEtNdVTwaYiJPuc4sj3xNTYntyX+Dx+eZoxNKQ/n4/a6IT4kGAwQC4W3YvivOitMTgR
 G1jzUKplQB4zUEWNVFQ74+spr1AehJe79NO9OBgJv4lZB9WCNKsrxNjhbcvfcUIOe2mD6dbN8KpXFtNnFMFSF9pjKDii2xGOM4WfwBKWjBH589px/8zyDRGP
X-Rspamd-Queue-Id: 4291923E8AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32827-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[embeddedor.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,thingy.jp,kernel.org,gmail.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	HAS_X_SOURCE(0.00)[];
	NEURAL_SPAM(0.00)[0.633];
	HAS_X_ANTIABUSE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,embeddedor.com:mid]
X-Rspamd-Action: no action



On 3/9/26 10:27, Rosen Penev wrote:
> On Sun, Mar 8, 2026 at 5:06 PM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Sun, Mar 8, 2026 at 3:15 AM Rosen Penev <rosenp@gmail.com> wrote:
>>
>>> Use a flexible array member to combine kzalloc and kcalloc.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> (...)
>>>   struct msc313_gpio {
>>>          void __iomem *base;
>>>          const struct msc313_gpio_data *gpio_data;
>>
>> Do you wanna add:
>>
>> const unsigned int saved_size;
> So in the code there's
> 
> for (i = 0; i < gpio->gpio_data->num; i++)
> 
> which is equivalent to match->num.
> 
> __counted_by doesn't support pointers AFAIK.

We actually have __counted_by_ptr().

-Gustavo


