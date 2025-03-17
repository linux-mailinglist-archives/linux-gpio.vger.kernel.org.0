Return-Path: <linux-gpio+bounces-17666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D4A6449C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E8C73AF3E5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 08:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5294D21ABB0;
	Mon, 17 Mar 2025 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="CcgMKcOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6371747
	for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198500; cv=none; b=rWtkDhWwdP/flBA1IDqVHAzdIfjFP5qWx98SgQtCFjHsdKuD/g5VlrgNq1n+s2OjoQ7c6ZoyETSYIpgSBBSogjppxo1XPpNDEAwCXP6DlwvG+h6uho+Xc2L+O/c0w27Kj18+xBILMjxgpl/5J7REf7/JLhc8axG/qRhQF5wIyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198500; c=relaxed/simple;
	bh=g1ZDFBHMJhbCn2huwa39URgbhTaTzoxEPanrgFu50HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMBgwS4/8WgQT7uDJgV8hxxrxSUjHylJ2ZONFktRYxXMmfbCtryxp2M7l7GCJblp/gexzOUDAH4wSHWfAtr5CXdvXcRXOoOktYzbCVgeIJBjw28S/BTooEG4AYCfSAntL1A10VYwriJ32WVRv21dA7BqzO5suCcOsdQgnkpl9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=CcgMKcOn; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742198497;
 bh=W5O/hxV8vbhDPZf+MT7E5Xer9GBrYGhbr052JbAP7DU=;
 b=CcgMKcOnI6CAd/y9S/E5uSf4PVF/kwMrF2q61dRknOyUGGSMy4ntLBJEvmBVLr8Wromm5Hj6b
 imAH8/zog+8UsHQ5Ew5haPdhAwf8WMIGUWZBqw4l1lp1igBEpF78UwjG2rJ3fAXTfbCh64genB2
 uhuY4/bZD5wXc+bNakhKHuA1u1e0r3UumIQKc7bXAFto1lsODlFTpc4k3AwPJU7o/s0C1+OpIcN
 sKKvkvxze1RAKJbHvnLZHJQpu55J2t2B9JD9c3237ClxF2fBNFTTmA8uBDNmkHivAaGRrlgF+PK
 7bc0mCrv/zOf/2KdsXVxK0wroCtUkm1YkuCVfpJEF20A==
X-Forward-Email-ID: 67d7d6dac3abe04af7200682
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <da550920-bb2e-4032-82a9-1bf02aae9e17@kwiboo.se>
Date: Mon, 17 Mar 2025 09:01:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "ziyao@disroot.org" <ziyao@disroot.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250228064024.3200000-4-jonas@kwiboo.se>
 <20250317070002.707674-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250317070002.707674-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chukun,

On 2025-03-17 08:00, Chukun Pan wrote:
> Hi,
> 
>> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.
> 
> https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/blob/rk3528/drivers/pinctrl/rockchip/pinctrl-rk3528.c#L204-L207
> 
> I noticed that there is a little difference between u-boot and kernel
> pinctrl driver. Does kernel need to sync this changes from u-boot?

RK3568_SCHMITT_BITS_PER_PIN is defined as 2 and RK3528_SMT_BITS_PER_PIN
as 1 so I think this code is correct, however I can probably update the
U-Boot code to use similar pattern as in Linux driver before sending a
new revision of the U-Boot series (probably after v6.15-rc1-dts).

Regards,
Jonas

> 
> ```
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 930c454e0cec..c77d9a6cd535 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3070,6 +3070,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
>  
>  	data >>= bit;
>  	switch (ctrl->type) {
> +	case RK3528:
>  	case RK3562:
>  	case RK3568:
>  		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
> @@ -3100,6 +3101,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
>  
>  	/* enable the write to the equivalent lower bits */
>  	switch (ctrl->type) {
> +	case RK3528:
>  	case RK3562:
>  	case RK3568:
>  		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
> ```
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


