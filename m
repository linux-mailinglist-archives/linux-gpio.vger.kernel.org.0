Return-Path: <linux-gpio+bounces-23870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A3B1476C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 07:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7AAA7ACBF1
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 05:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AD0224AF2;
	Tue, 29 Jul 2025 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CBaYg12J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6892222BA
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753765543; cv=none; b=qVohUdVlCGppj6AI8w1f2ie7F4cdMOZMAoez/cpWtOg6iRLBp7INxo+lKgtDvO0fhtyXTbEUVdvlwDO3olUbkSiLvSkh3re+DIxF/Dh0/WuODmPx4++qNxL6QpBC3G54He7zdX3KzMt6mXxIjnT6WSFnXzpQdJ8fy4wuceUFGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753765543; c=relaxed/simple;
	bh=ZZiUe00X7zQSTf/5Mt2Oq7NNm1mBkUe68Jw7+1UdMBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKvDey0tnkrEXKA9oK8F50ucFzNvRrC5Idc4ywZD4rffMgokdBnjfQEmZX8KWuUxPZC9GjSWD5hC+HNF7375DDB/Vxfse+abtjA3n2ECkIFzo6X/M6Ee6csyp5oENRw+VgWbCd8DNRB845sLqeELS7+Oxj9koeTEO1+hXWBCKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CBaYg12J; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0e0271d82so973204266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753765539; x=1754370339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Md0VKAKCQGHOa5Dc6D/SdULDfFmlsD9zuh7egV7ZnFk=;
        b=CBaYg12JSOSQJItBtCwjdKyUOUBT6Xi63h/dSie2RlzebGGyu18WG2/FUgeQAOHloS
         duLeWJjPgKN/fKoSCZSeQqYrytPHdqhXA63Ig+rOJcd4DWLXK/x1EJ6m6jRcxSGHwMyv
         rGDdr5PqjVwMoGIgPrkCdQxQgyZU6nhqOAdvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753765539; x=1754370339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md0VKAKCQGHOa5Dc6D/SdULDfFmlsD9zuh7egV7ZnFk=;
        b=pgyrGR8tRELh7YTtitSvCyVKvLinEiGMHxVN27DCAGOFHObdCgakvyNBvlkMZHJ0bR
         /7UBRe32UWTMxAz1e9afSwMw0u0kfLTF48mH708/hIgso4ptqcBtA/uEZOSmBrsdVI9v
         IlIXFJ8k3GEmovGZXa2aQKhaoQA1mgivtfrXFIqWtKtznakIe3ZG1id9DEoVVd0ytnsO
         nS9KLeL1iipp1IA7y744QFCgvAdP5wc52r1XLjwBmMIDfarXl/DkOlhqhnWWs1nsXwW2
         qfyKmuw5vhnoXTw4V8aXBPYKe7O+v1s7HNYAX04ZbqQk4Fp/AV8XleBNdsiVEvbkmevw
         Kxfg==
X-Forwarded-Encrypted: i=1; AJvYcCUR8hICHMybRmAM4SycubvN2Zb+/Jd15NnBICMfhtaEPjUJkcNmo4kSiNDWKPqdG8ALEkcEWWqPumyp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzql5wH/rVH/dpW0EomlA4FU+x1r7aOZmdDncLY+ZYEf+sXuGOF
	Qz2BVh/zVI43ncnHmFYwO1G7ZmSYmEkbSwdtTKoxoQwuegrPj9D7Sye1G8Zu1y30Rw3ZCATvhsJ
	Mpj99Q60=
X-Gm-Gg: ASbGncuK9xYFqpCY6rFJDs/Au1bWpTSzZEyHbj1jwPVIiKxXqe2CwLugWEqd9TnhgQp
	vTy+EMkM0ce/AReg/n05Gb5Q4JmPj6jdRGlz5D7kqMxjuro2HIU/1p5eR6m38VyqXkRExUQg0tT
	IGjSHZOU2JBhd8E6oEuqQknt/Zsb9QtQUIa/w349pOcVi0vq7GbrtU+HaHxBh/36euEfpGs9hHE
	a8+ucFEcVKAz1kC6C3j7ChDk49WGvZIn3vkAsUJ3mCA4GrHzUkGENWMJ/ljFEVzl9cUEJoB5Ml+
	4plwO33aGVUiOAVv5D5cAtpNcYBhxfaqZfItchIeuJup/jPwP8R26rwUyd3okyQDitw7djVY3Xi
	r0grRg76TYdP9oocI8b2DBxa3da/6wOspR6G8xCbwaeVWG9Y20+h2trzEn6yA+hFfu/kc+5oZ
X-Google-Smtp-Source: AGHT+IHc6Xqlu5dKLzWmbCstK1cGnocEBHsqxPzyCg7sGazAIfMwt7R6kYDIAQUByGLd0Y8UqyoLDQ==
X-Received: by 2002:a17:907:c0a:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-af619606a62mr1465958566b.50.1753765539326;
        Mon, 28 Jul 2025 22:05:39 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63589cab0sm523447466b.38.2025.07.28.22.05.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 22:05:38 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dad3a179so852528366b.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 22:05:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf/5aZwGIwQHEMnDMn0dfKRSJtGK6DERnpPqQn7AGCKRNJeNYtIxKA8tS30AX4gTS4D/KRgQ/1osnW@vger.kernel.org
X-Received: by 2002:a17:907:c2a:b0:ad8:9e80:6bc3 with SMTP id
 a640c23a62f3a-af61710a468mr1620060066b.1.1753765538135; Mon, 28 Jul 2025
 22:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728101658.44311-1-brgl@bgdev.pl>
In-Reply-To: <20250728101658.44311-1-brgl@bgdev.pl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Jul 2025 22:05:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieQsg76--QpUw8M01t-EYzUifZ5SyOekS3Negd5sRO5A@mail.gmail.com>
X-Gm-Features: Ac12FXwf2tjFTlx_2VaNtkhhywBF4ljjq1iS3roEfzdtwYIwOWMaU7SkmEIMg4I
Message-ID: <CAHk-=wieQsg76--QpUw8M01t-EYzUifZ5SyOekS3Negd5sRO5A@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v6.17-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 03:17, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On that note: the commit I mentioned above is already on the list[1]. I
> have a second one that also renames the new callbacks back to their
> original name[2]. This is a result of a simple sed over all source files
> and a skim over the changes to make sure everything looks ok and to
> adjust the formatting. I don't think it makes sense to send 4300+ lines
> of diff to the mailing list, Cc'ing 200+ maintainers if all it does is
> a simple treewide rename, so would you be willing to accept this commit
> too as part of my second PR in order to avoid hundreds of small renaming
> patches over the course of the next releases?

Yes, that sounds sane.  We do those big renames every once in a while,
and while it can be a bit painful for silly conflicts, I assume this
one isn't likely to conflict with many other things.

                Linus

