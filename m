Return-Path: <linux-gpio+bounces-32093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKcVEh8KnWmlMgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 03:17:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99459180F2F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 03:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 312A33045A8C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 02:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C1B1E5B7B;
	Tue, 24 Feb 2026 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="S/MyPJvp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m93148.xmail.ntesmail.com (mail-m93148.xmail.ntesmail.com [103.126.93.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B913B584;
	Tue, 24 Feb 2026 02:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771899418; cv=none; b=Ujr+WIP3zGdYhMXsc3zPevyzErh424FTT+W+UgHGVSSWH/zzGyAsvQQD2TLUXX+vmSdXrEZZFdCn9zqyq8tHq+cARNntjg1ENjzS1bC4s1mFk63whm8VvOUu7NnwklkT2p5RvcfbG21mK2p7dVpvCSXoFopOQ8cw7yWvOEliVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771899418; c=relaxed/simple;
	bh=j+eGs2/YbUlRRs6rd1a2RALcRNh1TEYitoS740MEie0=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MWYl/L3WhH1ZuqtOcgIOayXQ/j3UdiVRyHmkGaxFfvqbFhelwINYftG6Yom/VjEV6QyYDz0OJB9eEMhy19vevVmmDx/Ia2AIUbiJEJsGEXn3qf9qmkbnZ6f5dhaHIZu+55T0QA2Vtb2/9gdAj9aq9e7B8KkPVVPpr+pswY1wI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=S/MyPJvp; arc=none smtp.client-ip=103.126.93.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34bdc373b;
	Tue, 24 Feb 2026 10:16:52 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH 04/37] gpio: merrifield: Replace pci_alloc_irq_vectors()
 with pcim_alloc_irq_vectors()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771861376-85311-1-git-send-email-shawn.lin@rock-chips.com>
 <aZyRhwEfAai2NuVX@smile.fi.intel.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <ad57cae0-d9dc-e46d-36a3-6d99ed094de6@rock-chips.com>
Date: Tue, 24 Feb 2026 10:16:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aZyRhwEfAai2NuVX@smile.fi.intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8d6f5fae09cckunmcfe8e92e9c009c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKGVZDTU9PThpDShlJHk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=S/MyPJvpInkWmIpdQZglVWF1TKPHuS8GbjvK+dSrQmS3LIIVH+obVJRmKqn0Owgp812KmTz9AEqNQ44icdldJoN64Fs+NehSFpNn+DA7jHos5qe6DZLllusiUW9tFXxkwIfetAXdPHtkch7l8zEs1EHiSMsM7ymrDY23idU5QaM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2yGaO0NwH8KaoIZUzn18zzXDpHIHYEUBwYlKeQUbjfQ=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32093-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email]
X-Rspamd-Queue-Id: 99459180F2F
X-Rspamd-Action: no action

在 2026/02/24 星期二 1:42, Andy Shevchenko 写道:
> On Mon, Feb 23, 2026 at 11:42:56PM +0800, Shawn Lin wrote:
>> pcim_enable_device() no longer automatically manages IRQ vectors via devres.
>> Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
>> pcim_alloc_irq_vectors() should be used.
> 
>> Cc: Andy Shevchenko <andy@kernel.org>
>> To: Linus Walleij <linusw@kernel.org>
>> To: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: linux-pci@vger.kernel.org
> 
> Please, move the Cc: list in all your patches...
> 
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
> 
> ...to be after the cutter '---' line.
> 
> To prevent some questions and doubts read this (patch 18 subthread):
> https://lore.kernel.org/all/20260123113708.416727-19-bigeasy@linutronix.de/

Ok, I was not aware of the doubts in the link you refer to. Will improve
my tool to let it help move the Cc list to be after the `---` line.

> 

