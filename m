Return-Path: <linux-gpio+bounces-12560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A79BC9D6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 11:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAA7D1C24247
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0C01CF7C9;
	Tue,  5 Nov 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0bTRGmC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45072155C8C
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800836; cv=none; b=AOQjKCXTrxc5XOo27KI47Blw8TiwSMZrr2qS8UlEovarMSJQwO3fO74E9gXsvwP/HqOiNuw/AM9PiUycrIkwqrME75lArMgoaaCfMjOgZCfpvqm1S9tBokg9fJmH4yTPrs3x3mN+KOBjrkEmGjs1q4yB9pvkwrlzDui569znm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800836; c=relaxed/simple;
	bh=RMw403BqOTM9Rf3pcvhpTgb40etG7wrpQJ1pbdssZvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjo6xM1pghBG8o4sK2wE8isJSAt/YKhZEmCaCCdLrT8e/kU2vafui594k/K7XFWbMkZNCL7Ct9xYOMJXNvzUPtRQDEtwZKCQJmA/I+Q8OE8+3RrmqQNFL36/1t/PpYd0JDf1G0m8N7IMdmB/B1ca7eqenFvFVZKHp5CZ+1s9VsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0bTRGmC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso55236961fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2024 02:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800833; x=1731405633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGPVEnrrevyH73c5Ea25XJGmrQoOshOvScKEINXEYu8=;
        b=K0bTRGmCYQGDVYXwunEL8IV8OJyyg2+ZSIhG0/arJI35wOJMqEqVzeEwdoQVJa7A6B
         Bwbuawp7l9GWGZPuE0MLcE7cXlwdb9BMH67pozELzQ6FDSVBs00Ee6PZsZNJzg0UW8AS
         nUp7vqUDHzERAfh19EyWf6QqCyzrK/LbIoieZ5tKdP3WsQJ29GEWE4Wv+5VJ8Gw8gdUy
         ha+3S9i/vAWVJhzKC0Uk0zrWx7ZYEJw4rTw2M2bxETfM+Q8s7aIr7b+NwimjaSiXotV/
         OrtAiGpEkXR042dS+fi6TtRq5k7PIJXl3iP0lyRAtjSA3NZmdNjqIOH7HLwdixwDJI8Q
         /oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800833; x=1731405633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGPVEnrrevyH73c5Ea25XJGmrQoOshOvScKEINXEYu8=;
        b=lgSvl3/ElVkBOVE2VmTfGIVtDDM7jRtr4XSkFqXNpu2PF+2JS5V57TyqvabWitpHa0
         hPeP9Zxi2y58AlxpfNcZ93nPUqAbtIle5rU+gT7Di2zAtDs/Ek1J9REfSV1Oysuj7Flv
         ocMrTVEpoDRfYY/sTaNIilFaRbjCD09zNXeQA6oK19MQqAKUv8930LIHRojKaYTu1DFu
         Ds7Z8VYxefQnHw6y5vsBmXp47UaiwguffZuSdfEln1VgqjwspSOxpVC2xjY9SAeF1goA
         n6Ns0pxQGLnZLR5CUtAsBCFGIXOQ9Nr0KSfv+/YNumRnM+ebjJqQ6QMZiXTm+1jbhRLV
         aqvA==
X-Forwarded-Encrypted: i=1; AJvYcCXSVoAzhmVPvUmBt8NTpZWyJm50M7A+EarcItt4lrp5jnectTIkxlrtTEOuJbJiYAL9FORJHD4IdVHa@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKGv8zharAv4cShK9ZnYUyEZMvIuC88TM6Gnv/Mvueeoq3zRg
	8+/rxXQ7HqmNUJLLjvA87qzAuNPpupjrJZxXG2Hp5B/B9tyi5xHFV2gVTBnqNpa6D+mpAPbGu94
	sITC8Jrrc58SCD4k+wmepnYUOgMb5ncZ8d9BvgZU43TxJ+YtA
X-Google-Smtp-Source: AGHT+IFTM7Y6UxsPfdTStk+ajCjHX8ROLyFGR5gKPIABI6Np8vO1VnZx3h7R2n9RYzbDHmB/TheIz4DfYNyAZPjQgls=
X-Received: by 2002:a2e:bc24:0:b0:2fb:46af:2b36 with SMTP id
 38308e7fff4ca-2fedb471a32mr41311811fa.14.1730800833434; Tue, 05 Nov 2024
 02:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <isb6f4jduu7utcs7a7hc6gw3ttk5ovxxz2domwjjx5zvhyrima@snw6jc2ghdlx>
In-Reply-To: <isb6f4jduu7utcs7a7hc6gw3ttk5ovxxz2domwjjx5zvhyrima@snw6jc2ghdlx>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2024 11:00:21 +0100
Message-ID: <CACRpkdaRpYDS9qj0K4hEM9VFfG1rxM+OSZZNiVjgdbHrxiFDRg@mail.gmail.com>
Subject: Re: GPIO forwarding question
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 4:17=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:

> We're working with some Analog Devices SerDes chips which provide "reliab=
le
> transport of high-resolution digital video for camera and display-based
> applications" over a GMSL link [1]. But, besides video data, they can als=
o
> transport audio data, control (I2C) and GPIO.
>
> We have some drivers downstream that I intend to upstream but there's one
> particular issue I don't know how to do it right: GPIO forwarding. Below =
are 2
> examples of how we use this feature. For the sake of not complicating the
> diagrams I only show the SoC on the left leaving out the I2C and other da=
ta
> connections.
>
> A)
>      |       +-----+            +-----+
>      |  (1) _|Rx   |            |   Tx|_ (1)
>      |       |     |            |     |
> SoC  |       | Ser |=3D=3D=3D GMSL =3D=3D=3D| Des |
>      |  (2) _|Tx   |            |   Rx|_ (2)
>      |       |     |            |     |
>      |       +-----+            +-----+
>
> So, in the first, simplified, scenario, any transitions on the Rx pin (1)=
 of
> Ser chip will be replicated on the Tx pin (1) of Des chip. And vice versa=
,
> anything happening on Rx pin (2) of Des chip will be replicated on the Tx=
 pin
> (2) of Ser chip. To make things more complicated, transitions on one GPIO=
 pin
> can even be sent to more pins on the other side...

This is just a big confusion for me because you are giving a UART
example and then saying this is a GPIO example.

I think it's a terminology problem:

What Linux mean with "GPIO" is
- A number of lines which are software-controlled
- May go into high or low state on request of a consumer (such as
  a driver)
- May be read by software to be high or low.
- Optionally supports interrupts triggered for input lines.
- Optionally supports biasing and other things.

I think you have confused terminology used by hardware designers.
What hardware designers mean with GPIO is "some wire we use for
different things". This is not the same as what Linux GPIO means.
Compare for example the pin control subsystem which is about
pin multiplexing, which is something that some hardware designers
unhelpfully call "GPIO".

For this specific usecase, however, I suggest you look into
drivers/mux which is the multiplexer subsystem, it looks closest
to what you want to do, though I don't know much about muxes
myself.

Yours,
Linus Walleij

