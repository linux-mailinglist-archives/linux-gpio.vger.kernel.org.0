Return-Path: <linux-gpio+bounces-11533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49299A2242
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703922833E0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286DB1DD54C;
	Thu, 17 Oct 2024 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="NCAFTPWt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA91DD0D6;
	Thu, 17 Oct 2024 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168280; cv=none; b=Au7cQ0WTIiF5DA5ib+2MJ5s+rTZgLUClB5fLE7xyLKbxdcguBxJH2sS3UjXbFAOtwq6tF2+vq05W8ZQG7xAOXz1WiznSxXjPfwzy3tkc+szsDx2WuF1FyLvN42x0f55S1qzAO/GF5gFmMVDVoG7rjyx3zZ1eEPicja4crMUJvQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168280; c=relaxed/simple;
	bh=/57acdPoEpZXJdQMF9i3UzB+6grWEfRN/wRs2Ia/OFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLBUcr2fSHA9AeUxfo//gN3Wnp50UKIu3Mi7lnUYpjPvcx8TLZhL1YBHvUHWM3HWALgCjXlaamqe0Azje2k8L7dGfFT1BT0lBkyVi9KSn9vr1/0+c3gSt58zvlR7XK5je8p43K0YXa5cVk5ORHwn0gp520CpGByB1A9sBRmLEjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=NCAFTPWt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2AD8988E81;
	Thu, 17 Oct 2024 14:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729168276;
	bh=D6Vp8u3BJkf9FLIsfC0I8feu67E4ryQKFtq/LVe3pN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NCAFTPWtOjcYW3lnae188mA0bbpx6EjcLJEsff5xj6qqmKJwaGwVRfIVdosySS8NK
	 nrOeqFOHivRmDB36AjbBsLpcdEQjgx6Z/+EIv0YXpSSup5fn3SrGgnsJMaoP/mZVU5
	 xG9i+YWFwAAJIiCWYH9u5oqm+6xzHbJueWquSEzZ3TRIlPbjbXooMJ+jWXNi7sKkYK
	 qLsFU+eS3qM0fv5HMyKaYt0k1jipn0LcZGX1oyu58xU70dy6/PRv/LzC7MNrjls6Gv
	 AXyuPQZ50y3g4GsjyNBINEzQUxJUvC6jUTGLqgmoOzJhIwvfAXyTbC5QYD4ZyTAA2k
	 ohzW7vnNfpI4A==
Message-ID: <a5026879-48d9-4557-85d9-038ab73deefb@denx.de>
Date: Thu, 17 Oct 2024 14:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] ARM: dts: imx6ul: Align pin config nodes with
 bindings
To: Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017000801.149276-1-marex@denx.de>
 <20241017000801.149276-12-marex@denx.de>
 <aa21db7a-5b05-4529-ba75-e2111e9e6362@gmx.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <aa21db7a-5b05-4529-ba75-e2111e9e6362@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/17/24 2:14 PM, Stefan Wahren wrote:
> Hi Marek,
> 
> Am 17.10.24 um 02:06 schrieb Marek Vasut:
>> Bindings expect pin configuration nodes in pinctrl to match certain
>> naming and not be part of another fake node:
>>
>> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 
>> 'pinctrl-[0-9]+'
>>
>> Drop the wrapping node and adjust the names to have "grp" prefix.
>> Diff looks big but this should have no functional impact, use e.g.
>> git show -w to view the diff.
> thanks for addressing the YAML conversion, but this specific commit
> message doesn't seems to match the change?
Uh, right, commit message replaced in V3 (or shall I send this patch 
separately?)

Thanks!

