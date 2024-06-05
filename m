Return-Path: <linux-gpio+bounces-7169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3FE8FCE44
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 031B71C24213
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1CB1B5812;
	Wed,  5 Jun 2024 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcql6x10"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7BE1990D3;
	Wed,  5 Jun 2024 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590044; cv=none; b=Vh8KgJYfwTy2jdJldNOnAKcp/PRorF9RSxBN9DQDvj+OLZGrOM+MjlwBD790BsR5HjPxBtPVR+WDDtlibsVltr1umJ59M9qusrUBjOvcC2c1D/83I5Vg5aix7oELT25jvbG8ys7M6kV7DSeK9PkAlTgLMYKHk4wtK3VUq7umT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590044; c=relaxed/simple;
	bh=i3VLYMzKIaICAGV7f8C0S0h6QHeKK4+fALp3AGcGmaA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VrF6v8CcJ14Z4ny3fb5Z/yXTA3MHPWaCiNmW04Isg+BYyPXNQnuNACxyVenytHl8Hz5VIXIMlIU1rq3NKnJkBnllVsLHhWRNiNwK4AeMkwB4z7+P4qXHqyAinN/NiZOxYpQtkijkpZZkn92vTTv8Rpum+4J3kDBwkNyNLFsu/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcql6x10; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso22430431fa.3;
        Wed, 05 Jun 2024 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717590041; x=1718194841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fzL5TdturJIplpKua1xxlH8v79ArVex/tipueVIZFrs=;
        b=dcql6x10Q5rir5YB/spHn/DztfGdGsLom3Wn7vNWGsmDM7RVBJzxfQLLzD9p2XGTxa
         ChaGzZ95Bff3vzjafVxJoN74uEEh8/KA6DQMUDXh59SEImMeD2lVWYydZjsouDzv1oqs
         JpvsnFptsLqX7kbZpA3gEOFq5rE6y/A6mTa0oVYAJJZnPt8h/mrvlLcamswYOBH7IXcS
         WRskHFf5I3jNdZl+ugaJTlmZq40HbFPbM6ryzz7JRRf9QwXq9z0ibtHYXrto3S++bXHK
         Ng5XTfcw/sVeS1kSpAvaxOIW3IXh7ImS47V1VgYL0iAq1fA4okKRhjvr06ZHPAS0rFL6
         qwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590041; x=1718194841;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzL5TdturJIplpKua1xxlH8v79ArVex/tipueVIZFrs=;
        b=ETHeog6XaZRzFROdEjlWO4MnMrGvjUOGnBabOKG/oGlP7F7Qt2qarsY+yAZDdZ6QIx
         0jeeU7DZ1EaVYzk1EcOGVsJea662RwzEYpedBqMwtGC8skKFOr5kxgZ9OfjVGlvCLjfn
         9j3eeMpTmpOznbdzHgj9ImvNI8kA7R8A6My0ZPXAWzeJzc4dQIY/A8g6JT0OqwuGaN7v
         3Nd1DuItpKiqACWBmYFN+Hsmw0Z2H0HJiraVpO89NDUK31h0VC+qATdlAX699r/vhhb0
         z5vWmKpsbT2fyeHsZhX2dS6xXWAFJhki7kh4uMr+jEP4CFv9OXCyk8hDhTZwOEKP4wMp
         N4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcFcWmvQZxTfXfKT03tMrCw7l7454Gv/2k/dkn/zJndn00Yui1ep0qOw+3oiAa8rIWiyHl9bOgrGKlMAJa346CRuVq+i70NYhCGmwbASsKeW7k+cv20PdCJYNzbP2hVSgIn/0nJLWg4LrLktQTHqn3ZCOVnW8jIqEMQrzek/YqoYza/2o=
X-Gm-Message-State: AOJu0Yx76RsojtS+ArDo+moesr+5ZuKxq/6okS+SavDUvS9zdEWqL3U2
	FRCTbhEyX0v+oNgbPdLvjzgExIcdzNo57Sh+tg/M3L2z48aRi4T6dmj56w==
X-Google-Smtp-Source: AGHT+IE4hji9mQWX96BplfNb7FUkKIGLYY97JNL2eWEW7amoMmibpGvRa7KTdcjWH1WS3/HP0hIS3A==
X-Received: by 2002:a2e:804b:0:b0:2e5:685a:cd24 with SMTP id 38308e7fff4ca-2eac798a96dmr13488171fa.6.1717590040880;
        Wed, 05 Jun 2024 05:20:40 -0700 (PDT)
Received: from [10.20.30.169] ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb4c07sm17493291fa.45.2024.06.05.05.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:20:40 -0700 (PDT)
Message-ID: <8b2f681c-444a-4201-9004-e12b9482d1a7@gmail.com>
Date: Wed, 5 Jun 2024 17:20:38 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: add rk3308b SoC support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dmitry Yashin <dmt.yashin@gmail.com>
References: <20240604141020.21725-1-dmt.yashin@gmail.com>
 <20240604141020.21725-3-dmt.yashin@gmail.com>
 <b5d2d914-0c2b-4cd1-b894-f894a93a54f9@moroto.mountain>
Content-Language: en-US
In-Reply-To: <b5d2d914-0c2b-4cd1-b894-f894a93a54f9@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 6/5/24 12:22 PM, Dan Carpenter wrote:
> On Tue, Jun 04, 2024 at 07:10:20PM +0500, Dmitry Yashin wrote:
> Why does this one have a Fixes tag?  Isn't this new hardware support?
> Possibly patch 1/2 was not actually a fix but just preparation for this
> patch?
>
> regards,
> dan carpenter


Initial pinctrl support for rk3308 included registers for rk3308b variant,
which didn't work well with some pins of the first SoC and these reg's
were fixed in the patch mentioned in the tag. So I added Fixes tag as this
patch brings back proper setup for rk3308b and 1/2 indeed
is the preparation.

Thank you for taking your time on it. Perhaps I should describe such
moments better next time.


(resend without broken new line sorry)

-- 
Thanks,
Dmitry


