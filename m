Return-Path: <linux-gpio+bounces-27198-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1FBE263B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 11:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13EB4821BA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64402317702;
	Thu, 16 Oct 2025 09:29:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616052D3A7B
	for <linux-gpio@vger.kernel.org>; Thu, 16 Oct 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606972; cv=none; b=crPdQNYWhjUyWulmPqXCKkZ69iLHIZL7KRPDnGGxAJd43JHAjYOrGYGH79Y96giumo7WHrNfIPS/hbOOYDLj2auxfdwgA1uL0c2jnzIViOKN/MxOFFLOJ7Xwy7h6VGA34fmMlsW9pCdG93cAQduNjRY30aaTFLh5tttfrw90CQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606972; c=relaxed/simple;
	bh=Ez7NT2vHc734831I0RchIRgOMqhlQSU8jAEHdZQpfHo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=OFufIADUZJ/hJBgr7VFODn+0MwXP1+9AAokdKi65QboARO8HVpkaVUxLikih3twjJG90+KVMyypL6nOxMqadadkZg6ARJL4+uHGyMdSGpsqwZq8bRGk0XR8mtmjoXWvQ7othbyn3iLrQrjjPHEtolH+HbmasEmGz/a9R/YAKyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.104] (213.87.135.100) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 16 Oct
 2025 12:29:05 +0300
Message-ID: <b0a06d38-74ea-4454-8b84-80f70442b8df@omp.ru>
Date: Thu, 16 Oct 2025 12:29:05 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: Linus Walleij <linus.walleij@linaro.org>
CC: Heiko Stuebner <heiko@sntech.de>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
 <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/16/2025 09:13:52
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 197127 [Oct 16 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 71 0.3.71
 ee78c3da48e828d2b9b16d6d0b31328b8b240a3c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.135.100 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.135.100 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: {Tracking_References_header_contains_several_msgids}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.135.100
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/16/2025 09:16:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/16/2025 4:29:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/8/25 3:59 PM, Linus Walleij wrote:
[...]

>> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
>> "rockchip,pins" property will always be present in the DT node it parses
>> and so doesn't check the result of of_get_property() for NULL. If the DT
>> passed to the kernel happens to have such property missing, then we will
>> get a kernel oops when the pointer is dereferenced in the *for* loop just
>> a few lines after the call.  I think it's better to play safe by checking
>> the list variable for NULL (and reporting error if so), like we check the
>> size variable for validity further down...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Patch applied!

   Where? I'm not seeing it in any Linus' tree... :-/

> Yours,
> Linus Walleij

MBR, Sergey


