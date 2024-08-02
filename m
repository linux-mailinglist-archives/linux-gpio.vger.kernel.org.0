Return-Path: <linux-gpio+bounces-8542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCF945E98
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 15:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E28C1C21601
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 13:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8281E3CCC;
	Fri,  2 Aug 2024 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="YW2Z3uJq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032811DAC4F;
	Fri,  2 Aug 2024 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722604979; cv=none; b=NfrIQHEt0UVIOYFBVlNXA7dY4U5QprA3ZJXp/UA9VrVJ+LWhUxpg/U5BhJGSTpXQjXe6jxImOcPEQxCyyLgFIbmUCgloxjZGAFUddFRg7g+8Li476LNuC15nJvQ7Unu6pXq6eAq0cZta3YA8PrgHT41jocnH3u7EzkU58GIkwIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722604979; c=relaxed/simple;
	bh=iF99Mx9vfjOeLSKRf1z3zC/U579GD3O17tu0LQls3hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAW4pd33SuUDlvpSIji3iSO/pOuVCeMYoF4uG8mRAS9BnN2+Rrc9vahn1YwBRk2AWBo/a3hyZ+ropo8op5XlOZHvVHioAffBUsaDudi1XjL8wRswhqDrWGBrGFDJEsC0u56cME9+RO1EY8k4sG3t42BNz+93ajJyl4g+md2i138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=YW2Z3uJq; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722604972; x=1723209772; i=wahrenst@gmx.net;
	bh=iF99Mx9vfjOeLSKRf1z3zC/U579GD3O17tu0LQls3hI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YW2Z3uJqvp6xuMK+YrsQk0WiJfyGTTX2H//PXOrbVvk8mBk8MfJHJbkJ9yo/DAh3
	 fPQP6PODYW0SlCO1/zG9lPxwoCRniTp81sPlJl3rk3KqjJxnC9d29uxjicuHPbA8B
	 v/IaS9qAiueP+9AICc0KoaR67Fvu/3WXZVd+TaEBUAlw8K8yasRkRNPSXmI/Kt+AM
	 zwUV/3GRuOp1CEzYkZhuvKZO0SzIPoe2MYGgPS7pzS7Skx97JHzQcysE9j61lgorw
	 ptvhmpz0LEAzASzz8lrNOaxlAq4wibZUr0tUS2hX+MIxqXOscEqbLw8gk+ily7XBZ
	 igV36+LROQHg/K0hvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1sQ0L22xcK-004Oqi; Fri, 02
 Aug 2024 15:22:52 +0200
Message-ID: <a211c017-be01-4689-b78a-cba0644b7984@gmx.net>
Date: Fri, 2 Aug 2024 15:22:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: gpio-vf610: use u32 mask to handle 32 number
 gpios
To: haibo.chen@nxp.com, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20240801093028.732338-1-haibo.chen@nxp.com>
 <20240801093028.732338-2-haibo.chen@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240801093028.732338-2-haibo.chen@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:v0T10rKYpYNc9oUuw1mTkH7cZmCszBxy0YDT74AHO0FDs3iff5R
 OFTNE7jQtSdo+xSNDHrO1SqVjW6rlxklDdkR0/monxY3g+M0AF8TgKOL2NK7fMqQ4flw9Jg
 +dqRtZE9nJVl+VlkS7Iq+lpGoAPQMCH6s4Fc1jwSPdJps4HdQs4i2QV6xhR7fLL5bgHVLBt
 v20BSew7S+cX4gOqIFSuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:idrP3R7J94M=;lprWANLSeB3pT7QBAfb1WmF1o8t
 2lO8Niq2Je+XdySiUgA5+C8m0V8TwVsvpyDojiXsbZNLw219+r+PQI485AaGmgLCyxYdAzLnq
 TPyA1UKRdy96VFOcMMDLMobwp+GqCesfSOcnZCAcGbglzDL4dKmjsaBEAaEy0K3NBADuKgxfW
 KN5eWZLrNdBwbT4ZO52NnSuT0Q/lY2/Hq3CzIaJ2QuaOPgZuelRaZJ1jNDePJpnpjAB94G/iY
 zQKE5OvuFhfcyCDi1C7V7ipZJ7/lFWGL0omzWpAFplEFxxJBvgk9OXp+VaHH8r/1WC7+D0uXh
 BINXKvFJu86fhNYZ7p3LX/RmfUL3h97KcIguvKmkyzwN71ibWVZS22G0hZ5kMAvgQJc9L1ofI
 IPH4oHu/AAZ4SfAexfEUrS2wfZP22DGrWmjJIS3ltoy2Q6cXskQeecS/xUEgtCyELjDbmkku3
 tOkrj/x0nxLH2j6uaqr0lS+dtQtk9l4YloGNL7c5jyrddWXhFPRSNMZsAiQYNZCDsx42dqo1Z
 yS2UEg8rNOgTiCLWpeTOqBC7ejG9cwicJo84KwU/Hg5FYjAT2ebjAaU0q/i1NFGbsnV3IWziU
 uefqwbS+vGh08gS08Gqhu35DbcJ7fv8jNFFZnVSyws5/9OGlsEJUvFZ9iGVxm8TPyrL6/tFMe
 F8U5kb32QG0ZarE9qQ/xSDw2rIoAx0oUBgM69Dtc3eK1bMu1eVPtJnQE4J9ojVRmNLvapU00E
 5MFqmNhFBLINv+TksABJsMfmxqEi5HueOjSjGPhUcPR3LO/Bpaa8a1+pmMNhz/vZIS5Y7rgd+
 SdduobbbpSJWQfCSya5pTasQ==

Am 01.08.24 um 11:30 schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> This gpio controller support up to 32 pins per port. And all the
> register width is 32 bit. So here use u32 to replace the original
> unsigned long.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

