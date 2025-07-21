Return-Path: <linux-gpio+bounces-23587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DDB0C576
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2CF17ECCC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88D728DEF8;
	Mon, 21 Jul 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RiOj11eO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0F223302
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105653; cv=none; b=WmThhPr+Yz8Bj0WfB4KZkXveZhigIWmyOl/yRpXScpPva+EJImJ8MESyt3ARARgTBqOwhD23K8+QZc7Su7Kd/S0qamVLaPHjfH03CSUnbtQMgCFuy+a3sAApgZ8p+LQdghIjaBI6TFuIIxSB18DsWOqk6v8qbEbFERNoz6E8LCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105653; c=relaxed/simple;
	bh=OxMAawqBaQCIZeXy7l3kRLuX9cZgEuweRCb/BTiS6gg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=BNOmYWmI1p6C6N+vvi27qH4K+kE08ODa0r30w+g6FUo9sQBdShGLXqSaq5F6mIj+chonnhylt9RzBdI2QMfXlr6w+0W+7l82s3PndxchMn6w0QkHf6JwfrerW2yko8q39S9GZalb9xBfZh5c0Fi6FRdqpk4rmqW2/z6Rqu7iTb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RiOj11eO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so7414691a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753105649; x=1753710449; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxMAawqBaQCIZeXy7l3kRLuX9cZgEuweRCb/BTiS6gg=;
        b=RiOj11eONZ/wrv6tCptmTnbOLvXeQKZ9Dy0sQIf2qqrd6YXyMgw5mMGU93ESmGQ9E8
         LAPu2yC3tnUWwacwb+e8x2eoJHgaIbHMz+CULmhsks6mkTa16Q+eR0aE8qk9pEKeRaad
         zdPd2FU9tkEmy0LGk7jOvW7oM9zk1pZBFQV6FZY+FOjxIDt/u78lKEQK1+D8V96/tl7i
         Sf+AhEQ4xP8WtKvtz33T/mhX+gaIjOAUc89uMpscLVh9Zzeg0RA6lGLWcn6LZ64U7Eih
         D1AhWvYZ2uBpUN4msFdHpTxDVasHiOVB5iB6nmxQt+J1FhHlIQgtQ61Xa/QWcZ47LfCB
         HL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105649; x=1753710449;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxMAawqBaQCIZeXy7l3kRLuX9cZgEuweRCb/BTiS6gg=;
        b=S3wfi6I6aUJClFYbJ/9GUHm0vnJBcT038hA3wMyrpEe4EkICvCo5g+jtfNzti4IbS+
         Pe8mOq0lilCiPYRY8sshG9m1hR4a1/aUcIOkjHR87uVxwLx2Nnztn4GtXB4E0MU6vwxL
         qzgV1DhjWQMkYK3jy4SGjin/1S1a1cER/5X7rgXpGEKo4wCxo+fViYTiSEQKnWv1lEJ8
         O9rVpBdn74rCbvFilUmBUhK0C/KxorIWefTgbny6J40XBCe6UX88GEd9a2ebEhPhKj5T
         7CuIcxWV0Hezw7BRu1WqxVKvYrteVaj5Xw+XRGHNWKfsmeg0tC2Jbcc1t2XqprsDlZjd
         2/3g==
X-Forwarded-Encrypted: i=1; AJvYcCXEhO8iD4GyGzhEHpSpJhYWM17+S8cIzc1VJ9oc3Xg0EXFjnRAem4xxTnAsheeKQOrT96m2zdEsVf1E@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4LKTEx+WteA6k/reZq4+yoYGfMIrqtBO1rvEcKL5hBauMWUs
	WF1rEoOEmM7DqnubWypAqfl0Ad36Jowa8tAW7FDF/6Lt+Q3752xdkWu4A2ZvSXh/rGU=
X-Gm-Gg: ASbGnct66CRCg+0Tt4tttcEfK6HRwOZCIHd/vWm0IG7frj5pHoVEx4mafjNy5LhNNFY
	Co+xusMIVriz//yCSk3HiwZLf+8PaZ4KEhVcN80r0PAMSOa3yhXVuwwzK8kcppGVhE2PJbTXa9K
	An6TRF0JtYLRt3H7ws6cGMh2WOnDkrR6IenWQ2MhemN5tOi4P7ohlNYgiT9BU4dUnBWKHxzCUnM
	KmVcTMQXBcU6NcybtSpp+lDyM41t4q7Si1+33Cd98EIS5tF5SZes+Bmq4vmVQ2QlHDlGZHFHt/d
	07Q0nQ+BSTJosPLI+6oXTsNRv1akzmweSV1xdqN7rJQlfudd/tuLV/B+mgTsF6n4oPFa6Jai+8s
	=
X-Google-Smtp-Source: AGHT+IFRvKb0nbgySkFUOSCTJVX3zHaKbQlNMuDHrOKJiszbYVoVtlex8VHXScHO+3m6mtC1Joc2ww==
X-Received: by 2002:a17:907:2d8c:b0:ad8:8efe:3205 with SMTP id a640c23a62f3a-ae9ce1a88f2mr2096586866b.55.1753105649395;
        Mon, 21 Jul 2025 06:47:29 -0700 (PDT)
Received: from localhost ([2001:9e8:d595:c800::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8fcasm685508166b.68.2025.07.21.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 06:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 15:47:28 +0200
Message-Id: <DBHS34OTX6PZ.18UJO5OLM72EY@riscstar.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Linux-GPIO"
 <linux-gpio@vger.kernel.org>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod] .mailmap: update Erik Wierich's name and
 address
X-Mailer: aerc 0.20.1
References: <20250721-mailmap-v1-1-ee45b82a01f7@riscstar.com>
 <175309950627.52365.7626415135686614244.b4-ty@linaro.org>
In-Reply-To: <175309950627.52365.7626415135686614244.b4-ty@linaro.org>

On Mon Jul 21, 2025 at 3:20 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Mon, 21 Jul 2025 10:04:10 +0200, Erik Wierich wrote:
>> I got married and carry a new name now. Also have a new mail. So this
>> hopefully makes it a little bit less confusing.
>>=20
>>=20
>
> Congratulations!

Thanks! :)

> I've sent the earlier rust patch for libgpiod because I finally forced my=
self
> to start learning rust and to that end wrote an actual rust program[1], w=
hich
> you may of course find silly but it allowed me to learn about traits,
> lifetimes, closures and borrowing and I really enjoy this language. The
> initial learning curve is very steep but it flattens out pretty quickly a=
nd
> after just a couple hours of coding in rust, all of a sudden the libgpiod
> bindings - which previously looked like Chinese to me - started to make s=
ense.

Yes. It starts steep but quickly flattens out once you comfortably beat
the compiler :->. Welcome to the party!

- Erik

