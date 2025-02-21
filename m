Return-Path: <linux-gpio+bounces-16416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B31A40124
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD39163168
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68237200114;
	Fri, 21 Feb 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5xrjWNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C931FBC90;
	Fri, 21 Feb 2025 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170274; cv=none; b=Yz6AzEliAtdyCzmYKOvjbLb2suf58aqG5prHGU9IrhSW0nwKRLzVaMYjm6GDfvBH4C7M6u1DrESGHzvVSN9Sgx8qguDsxWdg+dvX3HCVlRwN70aIFjsqMLM6Sr2AfAogSUSfFFbYK4YZjkJih5LTRoYb8aRB2tK4No2n+7cfgg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170274; c=relaxed/simple;
	bh=1sWzfVVwWqGxmQsySKJGu4Q+eDquGK0h8mTLTxNv7uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZ81EK4yanoQ841dlR/R0+OOU5wk3wM/00GiR6ib/iE8MVD0K5m45pVu2lJmLpETa0uyE71HxbCjh17oZIGBOim0VtXaQY9uzfh1MEEqqs/o37ZXsQtWr6anuSlju01M53gDs2J6cCYEEbLFZjOnYD+qxwtu4+oxLTvBNGmz5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5xrjWNe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so4634264a12.2;
        Fri, 21 Feb 2025 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170271; x=1740775071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=diKeoGKMvw67WD9nA8oQ19aH12u8E5Lnnh0I4jgDkeE=;
        b=c5xrjWNeT0wks7NC80PNAEpCqoCsV755+1MH4ZhturCemTbRoy/+x0AnrRchdd65AA
         HG4YPb+zAwGuII1bWTBMi29dAOfg02zDACO9ngo7rXAwLAO+BYMIcnu+mSH3QDB/q3GO
         R8gw3Hh+VyT5PCSoUQA9EQ9w58MS1NjSoX78Vs9d99MogpA016pP477SQUJiiG9HOz+D
         8zxMTfrq7Asb7UGPuJl6wybz1FykGDmyh6GJeFYJZDulDzPRfy4nrp2hKK3ZhcRcSWrz
         WJn1MryNysYubpjQqaAZui4jjJENKaID7BDBjWfNvAxROO4YvRALtp0GkvEqsvubxjq2
         Vb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170271; x=1740775071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diKeoGKMvw67WD9nA8oQ19aH12u8E5Lnnh0I4jgDkeE=;
        b=kM8hI/nT4wRo3XXWzV73VnKNXNAyJj0WJeH0rb1MoDr8+cusW8M5Fg3OS8aIfCUj5V
         EziuPlc7k506Yz6uYc2EzYhXM3fQnAk0v3RcXXfkSPVQ0K9libpHB0yRlvpf06MimOXi
         LJofc/Xewa0ZmPG/ArZwXot9l2koLdtyueDCpZV53j0ZJ3Vwp+6IjmWlrdVC24cAhNri
         oTjpXbTqmJxws4K1uFhmouLrW4st/llDH1gBzcXt822FVAkIejRmDzJF04g2cAtnvybl
         4bUf0jqAUaJN5hChepKHhp8bXDGEoaVmP71/oexKV0V72SgxKNvFvGjy6W8rpxeJXIcD
         BBsA==
X-Forwarded-Encrypted: i=1; AJvYcCX3EiSAbU5i61KceY0l6GwhM3dz//bMYpo6klpUAP3BXz8DbPSGBsfXOLTq0IdJuvi7S18pHHfjcnKTpoon@vger.kernel.org, AJvYcCX5sYZu2Jlb+OkSgNMs45YJNA1U+fTBb4Lqmsyr26Qoz4Js4nVVrxPxVHPHCQacgU3lGtKdfPPoMy/5@vger.kernel.org
X-Gm-Message-State: AOJu0YwxS3pmnSw2hOcSvI7E66g2Yf/dWZ0G2s6x9/Jh+/cCiTJX93yh
	vbMm+WKUxjl22KCDghc19+QisJKVY4F/zlBCkln+p+kSUqxWk+Bo
X-Gm-Gg: ASbGncsPme2s7RJ9GAWVCpO1l/cmtvTSD8lqT+TQRFsBJAjsjTCc9UFUhYmHNyAFrQH
	2okXXtFp05DS/ch9maBEux8h3vTYL/LPnmHTB07QSnGACpw3ymDJK/9uU7fkdboPbhPAVXmrQL8
	VJRXBtVIcHIEtRV8EJoyds7V0a3QbSl9uT+Q/2IpZl7HR+Eo0P+hXDGpgvL8JAGgkLm42M/Ca33
	xKI8FTgA1hXrcxozZBEFmXjMy59bGON4sAsjbZrIhDa2YmNMNU0edQSPuCyTZtL5RJoBMAGWobx
	wmUWzYOKdalzwq5aVOy352qgbGC8HXDKrcJg9l+KgmhOUzall0oI1XB7+fj0shUfBYWPVqD8ftb
	/
X-Google-Smtp-Source: AGHT+IGLQ5ULn22Qgfs/Frvb2e9mzlvzxoLU8GQj0WKPz5SnVgtK4bl1R8ZkkBRgfIHhhx0IA0rg0Q==
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-abc0de19516mr340926666b.40.1740170270560;
        Fri, 21 Feb 2025 12:37:50 -0800 (PST)
Received: from [192.168.50.244] (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba9cf8a262sm1417895166b.22.2025.02.21.12.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:37:50 -0800 (PST)
Message-ID: <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>
Date: Fri, 21 Feb 2025 21:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
 <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.02.2025 21:32, Artur Weber wrote:
> Add device tree bindings for the pin controller included in the
> BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> both chips use the same driver, but have different pins, and the
> BCM21664 has 6 alt modes instead of 4.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> (...)
> +examples:
> +  - |
> +    pinctrl@35004800 {
> +      compatible = "brcm,bcm21664-pinctrl";
> +      reg = <0x35004800 0x7f0>;
> +
> +      dev-a-active-pins {
> +        /* group node defining 1 standard pin */
> +        std-grp0 {
> +          pins = "gpio00";
> +          function = "alt1";
> +          input-schmitt-enable;
> +          bias-disable;
> +          slew-rate = <1>;
> +          drive-strength = <4>;
> +        };
> +
> +        /* group node defining 2 I2C pins */
> +        i2c-grp0 {
> +          pins = "bsc1clk", "bsc1dat";
> +          function = "alt2";
> +          bias-pull-up = <720>;
> +          input-enable;

bias-pull-up should not have a value (pull up strength is not
supported). Will fix this in the next version.

> +        };
> +      };
> +    };
> +...
> 

Best regards
Artur

