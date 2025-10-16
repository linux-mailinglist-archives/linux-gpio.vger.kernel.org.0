Return-Path: <linux-gpio+bounces-27189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48327BE1C5F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 08:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A443AC12F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 06:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117B22DECA5;
	Thu, 16 Oct 2025 06:38:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com [115.124.28.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F02DEA8C;
	Thu, 16 Oct 2025 06:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760596704; cv=none; b=KQVA1kn25ZltqJCtWiZyK6HobKPU+pxPgeaHC9KfZepz3SGHrstA0TKTsD3xxaYeRoG4r4RQdSydDH/rgOucd5hLtmDD/iKH3AZjWUh0KZQGh0d8IuLSVG/nL4HQm4VHHyc+cJGpLJhjQPtBQ8VI7diIYank23fx6ipEYOFYnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760596704; c=relaxed/simple;
	bh=jc/UgT3YrKZYyiCrVqeMb4ixb4gOXQipya5/mwh9zVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVJnVHvGxOVJeoDguS6s8STk7lV3uLzuIj8XCUROWMG7BAa8hxenEGbveWM/rR/brdgdqCjeQq7V6BMYGH2IAaQqWlPF5dRYh6Ce7m7L6Omdj7pLaw0oMgoy8kPXshKj/BZydT+ajr7Z+WgxSI/+DgEPxDr1m3rNSGDlEeQWx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com; spf=pass smtp.mailfrom=allwinnertech.com; arc=none smtp.client-ip=115.124.28.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allwinnertech.com
Received: from 192.168.208.184(mailfrom:michael@allwinnertech.com fp:SMTPD_---.f.sWu8f_1760596689 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 16 Oct 2025 14:38:10 +0800
Message-ID: <6ac35d5e-7d2f-9af6-d1c4-831725c33896@allwinnertech.com>
Date: Thu, 16 Oct 2025 14:38:09 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, avri.altman@wdc.com,
 wsa+renesas@sang-engineering.com, victor.shih@genesyslogic.com.tw,
 andy-ld.lu@mediatek.com
Cc: jason.lai@genesyslogic.com.tw, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20251015060714.67558-1-michael@allwinnertech.com>
 <9f666390-653d-4834-800d-8997665b6dac@intel.com>
From: Michael Wu <michael@allwinnertech.com>
In-Reply-To: <9f666390-653d-4834-800d-8997665b6dac@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The execution timing of this `host->detect` work actually depends on 
when the WiFi driver executes its unload procedure. This is something we 
cannot control and cannot handle using `reboot_notifier_list` and 
`register_reboot_notifier()` operations. Moreover, different WiFi 
drivers may have different handling sequences for this timing.

 From this perspective, we believe it's not convenient to address the 
issue in that way.

We noticed that the `mmc_bus_shutdown` function calling 
`cancel_delayed_work_sync` was newly added. Therefore, we suggest 
removing this part first.

On 10/15/2025 3:09 PM, Adrian Hunter wrote:
> reboot_notifier_list and
> register_reboot_notifier()

-- 
Regards,
Michael Wu

