Return-Path: <linux-gpio+bounces-17679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D143AA64EAE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 13:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF262188BB1E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 12:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ABF239099;
	Mon, 17 Mar 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="OsmWDs8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518923312E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742214251; cv=none; b=cfCMe7deo7tYlD2SOvD3qMwPzTjZ33cDCY4haPCvRDC5pVHxmjo/digpLUjAxds1HwbazF/xNG2l84zh/nj+iKbSs9qSc0NDLMCAXzfimyE2WY/bjxbVy9j35Hu4zbJKGmCPwcN5bc5uhNKnGFtw5KgMCIb1AyxzwCFyYcy1Bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742214251; c=relaxed/simple;
	bh=xyaqfwbTzpcdsojJjDbtOxYgNKN8wS+0MuBFz5lzo3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7r+klAkXOz/fu50itZ5HzRegBC1RmiDhCY9hWWsQV11BflMyW+GnUrp+jf0QxqIRpaOkQzP2m8VEACxCHA0MyXMfi8+pGaCXUY47JwWh7fmjz1g2pFvLQxqgXTMNWP070L3owH7Huksurz8V2bVLMPNLiqfFHuHRFPyg3v1yug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=OsmWDs8J; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d4436ba324so30996755ab.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742214248; x=1742819048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVqfhG4Tsr+0S9/jAXd11fujaL7v/Zv49Wi0Dvh6Q0I=;
        b=OsmWDs8J+z/3UgyqzimApFU91ToJSe16tuWb0TcQBnFsdeGbeVlYwLSCGDNU9IpV6W
         SiOx/wK0LvJKl77H2d5pnubjCOWx/peWVIcOOrFWnkKCnjCqQOOas8gDwPyNdTYXDihe
         2n7zqc+LepAAG7Jx3G4yZsJIH23eNeyEHBOmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214248; x=1742819048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVqfhG4Tsr+0S9/jAXd11fujaL7v/Zv49Wi0Dvh6Q0I=;
        b=bXqMJKyXpPQxIiNFptJXwEsCbzu6ZWJoagYBzR1Hll5vHsjd44rdIhO2QFWhQ2+Zst
         /uMP+6JsTZqq4JDYzk3PeEDByfsadT6TJJzRVu3K/oN91sHlvNOI1zpk3RqD8FGzjJE4
         6WuU9x231vNITFG2j4gS6PqD/6SSUlWOIYkU7VQMZ7o0W8cCk4BlpZ5TfNFCGbxyfrJA
         aevlK/F+zBz7Dz3m5B3kqxvp3A54rcTknpLK9RxecnU1c1DDeaAJZB5y9oH6OzgpbaO0
         lxhmNAWps+AqcUPxUdN4cbNleAjxibz+b6Jwb8xXL/2HIdukd6ImZn1ZZYIJMZPRhMaI
         Qqqw==
X-Gm-Message-State: AOJu0YzXY8xVXHEhHU5all++I9ZNOgvo6E+0fb+HjSPaY9pJFLqEtAlc
	sf02wtBXE9dEXu2ZBDcpkKCBfhnpZ+gn1OElSUTqsHoIJDqcF3UOxNavth75lA==
X-Gm-Gg: ASbGncsUPBCSESlUGeOnj0Da2OisUF0DKCO0rIlBcseErj81CQ4hEiJDdZCi7GMPWNA
	h5zUzK+K8UvvOEFZbQY/j4b3qqB7YqULQhdZssyEcFLFk7yVt1bBHSnguKCSrpJ54KOom+UxKGa
	fMuHobo8MvZwvVBwh8Ldm9xzscyK7ZVjI55N0C2JYIEXKVdF3uXHdsSHOWAIWhUQkAyrdUjIsLZ
	dcsgQJYTGIWPRHQTWskqREqSBeiN7cIKRlSgLyzhzYIKHqa9rgcHU1vQjIl1FrWES8Ol42T6hjY
	fqJqOpDwVXz5SpbeoKPxgfIu/fBDhd9Ix5Vj+Z/JAiv7rvDZBHiZp/b/rgpVnGSFSfujMgXGjzf
	M+Ao=
X-Google-Smtp-Source: AGHT+IEGGv1epbomaXX0zbh2byJd5cVeffbSyLLHslAOJ3Sd1NJhrsMaYbtUByrj99ocjeXVsSotaA==
X-Received: by 2002:a05:6e02:320f:b0:3cf:c9ad:46a1 with SMTP id e9e14a558f8ab-3d483a35280mr135008545ab.13.1742214248021;
        Mon, 17 Mar 2025 05:24:08 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d47a646abbsm26046345ab.11.2025.03.17.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:24:07 -0700 (PDT)
Message-ID: <4e4b85b1-bb4b-4de2-8780-a22fae6c1b8c@ieee.org>
Date: Mon, 17 Mar 2025 07:24:06 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default
 to y unconditionally
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/25 3:06 AM, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This (now) makes sense to me.  Looks good.  I'll look for other
cases like this from now on.

Tested-by: Alex Elder <elder@riscstar.com>

And if you like:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pinctrl/spacemit/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index a2f98b3f8a75580d..d6f6017fd097d326 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	bool "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> -	default y
> +	default ARCH_SPACEMIT
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF


