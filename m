Return-Path: <linux-gpio+bounces-8729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9F9508A5
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743C41F21EFC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD65D19EEA7;
	Tue, 13 Aug 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noprivs.com header.i=@noprivs.com header.b="XKM3/98k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-108-mta12.mxroute.com (mail-108-mta12.mxroute.com [136.175.108.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25487198A05
	for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723561973; cv=none; b=iwZV8IwFsgxOGV/qgPUKSCIvjKjlCNzI/gUI5V5uxjPPkmct3oQZvkED5IdEhpYAZzJVobKZ3OV3Ft2zeMWAg5N1KzDH48UgF5A4YHYoCDoTi75cWsAw/h8BdGjpMCChXwX5ERcQHXyoDbGUY6C8BMbh/3W0iInk6/7YEGu6Bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723561973; c=relaxed/simple;
	bh=bf5v2dK2KexWtU7plmEYXqNCrq2veDOvRWJtAqy2azc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3pHhtwAg1GE5eRB0A225NWJj80X3Wdom5zv1sCmvPXhtFW4aqaJ5OLAlBNxAyFRL/N3nlWkiSDi5aNQA5Ke3ixsPm7ByA5E+Ilze/98aRLJGcD+k6bXzb9UtcBy3zPCqLSRzwZrr/6e3jMIbtGuFjNTK8CS/+NbK+uHIa4X8Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noprivs.com; spf=pass smtp.mailfrom=noprivs.com; dkim=pass (2048-bit key) header.d=noprivs.com header.i=@noprivs.com header.b=XKM3/98k; arc=none smtp.client-ip=136.175.108.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noprivs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noprivs.com
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta12.mxroute.com (ZoneMTA) with ESMTPSA id 1914c47cdc40000a78.004
 for <linux-gpio@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Aug 2024 15:07:39 +0000
X-Zone-Loop: a43d25287bb68bcb2c0808d9202a9e26aee9edc1e8a5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=noprivs.com
	; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Zq8BEQkvnMJy8TYT7dlaJEScwZy3VhWSdR3+M71ATgs=; b=XKM3/98k1qfGgfLmlfgNejHSTY
	llGeVh71hK3tlYVg+L198lxYe9pYndhCEZvda8z3lHkuu6oqM+khA97SzfGQnWXex5Sc+OPrxEo6p
	6yG+94T/KnxWAcMhQXrjX6bvwBldYYqa5ydB0QHd8eQwWHEn5xeJRnZjStz0LjCfUViv+vkmu6afR
	C6kyiWir4zb3mhckQDPTgXwDTGC2uWgO2i3EEX0a6fslR7rcXGfbs5F15U74U1Ns7AVOMvM3cOQQj
	7xbQHNYzwGQ1uwB3XXOyjHaZllFVzDHUPvprvUZxWe8iEH/ZdHBPku4QY1gUDDjeXARFCopQGjlGC
	Cp2UHoaQ==;
Message-ID: <00bc04c5-a424-4d68-b7cd-7ad9e586409a@noprivs.com>
Date: Tue, 13 Aug 2024 10:07:37 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: exar set value handling for hw with gpio pull-up or
 pull-down
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sai Kumar Cholleti <skmr537@gmail.com>
Cc: bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
References: <20240730134610.80986-1-skmr537@gmail.com>
 <ZrpE8RYLG0141_EB@smile.fi.intel.com>
Content-Language: en-US
From: Matthew McClain <mmcclain@noprivs.com>
In-Reply-To: <ZrpE8RYLG0141_EB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: catch@noprivs.com

On 8/12/24 12:22, Andy Shevchenko wrote:
 > On Tue, Jul 30, 2024 at 07:16:10PM +0530, Sai Kumar Cholleti wrote:
 >
 > Please, refer to the functions in the text as func(), e.g. 
exar_set_value().
 > Use proper acronym, i.e. GPIO (capitalised).

We will update the patch and send a new version out if the current
approach is acceptable.

 >> Before the gpio direction is changed from input to output,
 >> exar_set_value is set to 1, but since direction is input when
 >> exar_set_value is called, _regmap_update_bits reads a 1 due to an
 >> external pull-up.  When force_write is not set (regmap_set_bits has
 >> force_write = false), the value is not written.  When the direction is
 >> then changed, the gpio becomes an output with the value of 0 (the
 >> hardware default).
 >>
 >> regmap_write_bits sets force_write = true, so the value is always
 >> written by exar_set_value and an external pull-up doesn't affect the
 >> outcome of setting direction = high.

 > Okay, shouldn't you instead mark the respective registers as volatile 
or so?
 > I believe regmap has some settings for this case. But I haven't 
checked myself.

Unfortunately, in addition to marking the regmap volatile, we'd need to
define reg_update_bits which means we'd be partially undoing the work
from 36fb7218e87833b17e3042e77f3b102c75129e8f to reuse regmap locking
and update functions.

Below is the relevant section of _regmap_update_bits().

static int _regmap_update_bits(struct regmap *map, unsigned int reg,
                                unsigned int mask, unsigned int val,
                                bool *change, bool force_write)
...
         if (regmap_volatile(map, reg) && map->reg_update_bits) {
...
         } else {
...
                 if (force_write || (tmp != orig) || 
map->force_write_field) {
                         ret = _regmap_write(map, reg, tmp);
                         if (ret == 0 && change)
                                 *change = true;
...

I suspect this might be a common problem with other GPIO drivers as
well.

Thank you,
Matthew


