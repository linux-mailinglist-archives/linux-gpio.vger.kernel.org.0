Return-Path: <linux-gpio+bounces-18003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1ABA7162A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 13:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FF93B7796
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 12:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA7B1DEFDB;
	Wed, 26 Mar 2025 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NsTqIyp1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF41A3A8A;
	Wed, 26 Mar 2025 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742990532; cv=none; b=TgSbuNm6O8WBuuWrxZXFmu7CBXHVRlAL5tFaJljD1yaDliGdR7sIjJES+o1PIhMIj0QaPxH3s7QX0Nw1DoQC4npSBWQdY1wWauX4wNmwzNIOlKtCH0/FfwZ/yhWp+geFO8PZmcuJXp9qmRbu3W1iHaufjy2NskUbMJ8ehrh+LIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742990532; c=relaxed/simple;
	bh=vviVK3d2BSu5qwujaWLoep4chvfa8uodmVKj2BRTnqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL5EGVRV7d0A333QjQfWlAB5gQO4ThA+ylcowGHwYpx8p9B3ogRqlQTDQeAF9SAT3wlDu7LTdN2omgmr4zmmrUK5G6L0+gUfHxHXpm4d16TcOKIY2AOOF37Pu8GsTXDa23VplSBF0aIJ7S6jX3FMrlxCL7ajfZqi55RF/M5CQTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=NsTqIyp1; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742990525; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dnTKE+3a0PHE8KyBH2PwboV///LuIr291dYXRKlIuSI=;
	b=NsTqIyp1XD/d6KuLBx8I+YCNOFNplu8eMq4qqae4jSYhtLNFcRLogo50s7DDz6rdznAbhibB3a/TApCWREs5CRnxf7KetEoBPn08svUYodVsUDDMne2uJELTi9ZEf07L69ph+0WAmyOR9WJxNPaGHZJeSk6zoWaOu0fEfxUhYCg=
Received: from 30.178.82.117(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WT4IC3Z_1742990524 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 26 Mar 2025 20:02:05 +0800
Message-ID: <a0df764a-943d-4ba5-aced-e8ceb58906d9@linux.alibaba.com>
Date: Wed, 26 Mar 2025 20:02:03 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH] gpio: tegra186: fix resource handling in ACPI probe path
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20250326063214.50577-1-kanie@linux.alibaba.com>
 <CAMRc=MfNhDLV4GSmA4gNZLv3Lu=Wjh_=J1L=DCo8FPUMDVz_JA@mail.gmail.com>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <CAMRc=MfNhDLV4GSmA4gNZLv3Lu=Wjh_=J1L=DCo8FPUMDVz_JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/3/26 17:08, Bartosz Golaszewski 写道:
> On Wed, Mar 26, 2025 at 7:32 AM Guixin Liu <kanie@linux.alibaba.com> wrote:
>> When the Tegra186 GPIO controller is probed through ACPI matching,
>> the driver emits two error messages during probing:
>>    "tegra186-gpio NVDA0508:00: invalid resource (null)"
>>    "tegra186-gpio NVDA0508:00: invalid resource (null)"
>>
>> Fix this by getting resource first and then do the ioremap.
>>
>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>> ---
> Please add Cc: stable and Fixes: tags.

Will be changed in v2, thanks.

Best Regards,

Guixin Liu

>
> Bart

