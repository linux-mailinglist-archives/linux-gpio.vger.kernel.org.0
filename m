Return-Path: <linux-gpio+bounces-17385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8002A597FF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 15:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6244B1887719
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C617C22D4C1;
	Mon, 10 Mar 2025 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv545fOY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D893522CBED;
	Mon, 10 Mar 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617876; cv=none; b=brD1uCb+CDT4hKcHDQmBDccw831HFssBC2/G7s0BcieQ0tf+Yyuf2tIq7vH/oHWKBQpDj4NCePKrK6SFsXjsKT0gT6e2sMkuiP58AqeZMb0FnnONHmBn//JHR8hiqfNdjBpf7Aj7QWW6uzSQe/u03QGyUH4q/jUM+Mcl59LABBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617876; c=relaxed/simple;
	bh=QRALNFtdN+eVm7tbZOOG157YtH485xLMQcdhF3aH1K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0e3iPRyRqPjR8iZmVPXZCpb53bLoBC6XKxCj0uksmXBgpTPBKcTUAkIf0pH/sEFJdp53NmtfVd87R4vaJTMCtJa7243C/vB2QxC1+zDNCki6K2srknKBq5vcJuxP2ru4iOEkQiQOW+N61KJ9Fmk00w5rK89JWpXumI1wYV8Zrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv545fOY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30795988ebeso46200411fa.3;
        Mon, 10 Mar 2025 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617873; x=1742222673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fErUntllWsLjAOuJrcnV9q/2Ltwr2+uinPcLby2r5I8=;
        b=dv545fOYr7ySHfc7iGwSY43TgFdGfoGs31Pu+feAE2q0mwWMD9/4nt7uJID3d7Dz8t
         MEnI1a2/eYJSp1UJeMeK8vZuDihSCXpZ3Egb5JoM/jMJLMZEsZHb5cXdd8b0zFXbrXGH
         6UwZUlDlbQpBMJAoFIXgmLL7qGvTrOxKg7YZVPJiLqlRK5UbZCbBlZy/SAda4/ug2KC7
         Ka0e2wgJZDIvWMRyKzJFNXCzFeHL2fPbOfrylApgznQ+RppuKtJTu4gAvbyaj5rat4fE
         M65+v/qeKLjlO3zMqD72/ywJNQKa5deZIhBoGgwrhwv6IGc4sV3vUL5d7jwy0z0qotrq
         leLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617873; x=1742222673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fErUntllWsLjAOuJrcnV9q/2Ltwr2+uinPcLby2r5I8=;
        b=CQ0dKq8ECA72StGU20urMiFhFoi73DYQ+LHrXcBzUkyL6hcq/Q244d8yOdcAxF2Irk
         YUW6g3B49VKO7wugfh1IQdCf6bO1Ap3yHGpZ1f4pBxKnl+ArWgOpf/z+Nz32YIM5fDd4
         p/OU+aekR4ORxVrp/fuE1qqmIVTvcOjOIps0ZtVxIxJWmkGAJJqZNsXFJ9x7177NobwE
         ow3XJsI/V7LNhngAFPxYbbDWDCMK+n0lEjPlQdMg9aS+R9Yeiehl9pbaurhym9ZF4Jso
         hsIDAWilGRb6DTrVaAnQxSU+sVaDRxrLe+lR9NDyGoaZpKDD4Aeyrh/J5932UeJNLayS
         vmdw==
X-Forwarded-Encrypted: i=1; AJvYcCUtG37CkWMN2Zt4MTQ9Mq7BTfC2E1XWLpSvac8nuL1D3wJT0FtJYEkjo+vlTwHlJs9VXISBJhrfeuHcqZy0uKUVVQ8=@vger.kernel.org, AJvYcCV+E2evBpzBDos48Ol/TotBe1JA46sV3op1AsdMBw4/vU4Ln8HZiupUUpjwia0Hl8sN5ThWxwP3Z/o4azjS@vger.kernel.org, AJvYcCWrzU4SejRnK0kS/F6pKYF8ggoq/SY6t+HTYq9RIBRPbYDdZE87eEs7L8zrmj+4C3HZYVG0ctRSOvDy@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPTSiNj1+bnBpmS4fMecj/12NeI6zWN6TETiauRL15p8eF1yJ
	65Di0jxxRbliasmI5RwGOveyD1dU3zOomrOxQP8qKesbbfx44T8l
X-Gm-Gg: ASbGnctwdXZGpUEFp9LdPVpY8RwUS3igFrcxNlJlY4DIP2y+tZTHJjd8e+a8vL7PPgi
	wrsz7VDlDHZxg4oPXx10T1Xlzud6IX+aC2dGA9xqCD/RJ/ZWctnUjlaMBLmsXXHGtt7R7nGiHZJ
	tgXG095Mk8HjJnk5GK9cqlGPDSNFQFR/guasX5vrg3bYX54yFHj3m9u/67mIYvYF6l1ZLhioKZV
	pNISq8YrljpDXwO1z1Wi5+DrAWLrYtDN4pkL8GBTm54fdaGtZzUeNo27GwJ9zQUwbnTdkbunlSM
	hk/b5x2z7RNQnw2Hsnbtrr+mtC9VpN5uPURUK326Op7lZwnaiCBF72DWEgQLJL8kWo5WShxAZRk
	jmZUGyEp1yKJDF5UWauKGc9bqPQ==
X-Google-Smtp-Source: AGHT+IH4FjRMCiAVJcOW54+yHBkZfOm6jFItnfmr9qhQZcQ7xY0zUfHMZWO62R1wiuF+voU7frBmdQ==
X-Received: by 2002:a2e:be11:0:b0:30c:d32:aba8 with SMTP id 38308e7fff4ca-30c0d32af78mr15711901fa.30.1741617872593;
        Mon, 10 Mar 2025 07:44:32 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99e81cbsm16554601fa.93.2025.03.10.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 07:44:32 -0700 (PDT)
Message-ID: <82383b62-0537-4d73-9495-8b880ef9dbb2@gmail.com>
Date: Mon, 10 Mar 2025 16:44:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
 <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
 <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/03/2025 15:22, Bartosz Golaszewski wrote:
> On Mon, Mar 10, 2025 at 2:20 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>>> @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
>>>         * we are dealing with - then we are done
>>>         */
>>>        if (offset == HALL_GPIO_OFFSET)
>>> -             return;
>>> +             return 0;
>>
>> Should this be -EINVAL (or, can this check be just dropped?) Value of an
>> input pin is tried to be set.
>>
> 
> I don't want to break existing users but I did notice that and figured
> that we should rather check this in core GPIO code not each individual
> driver.

Makes sense :) Thanks!

In that case,

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> 
> I put that on my TODO list.
> 
> Bart


