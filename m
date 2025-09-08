Return-Path: <linux-gpio+bounces-25751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EAFB491CC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 16:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6566A3BDD8D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7943830F7F5;
	Mon,  8 Sep 2025 14:36:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2330F7FF
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342194; cv=none; b=jAYYsfJNmkUglqEsxKBUdoG7JMNQ+jQ6LQE80Uav+VZh0A9ouevd5CGW2KS6aq22Xg2wTKRsiMfK0PUo6LEzD4c2MSBFzoiHEYO76CQ8OxVNbrYnXUpTbdpduv7ar9WjROdr1VjJBWwSmdnusuXe7ignpa0CiN2ihzwR5Hr0HEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342194; c=relaxed/simple;
	bh=e/nz0jy6h5znE/o7OdEktvuOv4RMObbacAKkxqjNna4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HlmIzvLM2yRA8jVc+3/f7U0w0cbPihDE6o6grybed4r8o6D7DrnN3WRoDFrjs0clOsKIcxZ8jyYfk2y9avom4iImmjMN7GodQ1GdyEcl3NPK6Q6L6IgQn0nTmj52mU003LUdC45ZgcbR/mT5qKDOoR4kA+WBUvCzSI2YDOBQpXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.154.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 8 Sep
 2025 17:36:13 +0300
Message-ID: <6cb84280-9290-4cf1-91cf-ccece1a0bb27@omp.ru>
Date: Mon, 8 Sep 2025 17:36:12 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: <wens@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
 <6789547.RUnXabflUD@phil>
 <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/08/2025 14:22:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 196099 [Sep 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.154.55 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.154.55
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2025 14:26:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2025 12:29:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/8/25 8:53 AM, Chen-Yu Tsai wrote:
[...]

>> Am Mittwoch, 3. September 2025, 21:48:54 Mitteleuropäische Sommerzeit schrieb Sergey Shtylyov:
>>> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
>>> "rockchip,pins" property will always be present in the DT node it parses
>>> and so doesn't check the result of of_get_property() for NULL. If the DT
>>> passed to the kernel happens to have such property missing, then we will
>>> get a kernel oops when the pointer is dereferenced in the *for* loop just
>>> a few lines after the call.  I think it's better to play safe by checking
>>> the list variable for NULL (and reporting error if so), like we check the
>>> size variable for validity further down...
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>>> analysis tool.
>>>
>>> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> Assuming that the DT is our friend, really is a bad assumption :-) .
> 
> If this is invalid, perhaps you should make the "rockchip,pins" property
> required in the binding?

   Looking at Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
in 5.10.y, it was marked as required. The modern YAML bindings don't seem to
say that, at least explicitly...

[...]

MBR, Sergey


