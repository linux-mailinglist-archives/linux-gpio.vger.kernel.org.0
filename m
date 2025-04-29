Return-Path: <linux-gpio+bounces-19445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9EAA05DE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10FEC4A0372
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D375292922;
	Tue, 29 Apr 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y91tsDSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C51427B505
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915732; cv=none; b=p81xka3u5BiINK6Vk5ExMYR+eJY6jn187T0wiizXKDbO+83N0rIElwIPAPDS5IeqnB4Yjtdn5G3cEStImyl2MF+tLd/QF5znv/Z6XkZUZ1uaqkVERYRcrHVJUnW9P//Zvo5Nmpb+Jzi3mMbstqr96THxQOM6rVrBPJ6NgBaINHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915732; c=relaxed/simple;
	bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crsc9KKFPlLOP2XgwbX4XAgQGw2Y/8bwC36HdeFd9iKNuDrAg8kJWfJUfYzn0/7jfg6ukEzWG7wJcL8O5rS+GmLc32ITnDLhIAJG8luK5ewUj+TL6asSpClfB/RzG/YamxWzCxr2ir+0sK2ySS7rbohloJQeZf4KgBmrWoJ5GKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y91tsDSK; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-317f68d0dffso60742581fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915728; x=1746520528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=Y91tsDSKXNbUMxI6xm/s20eo7WOsAA8RXL4vNxAMz7frt90kBek7h/Rt5h4cqvxZOn
         TzvpyPsA/VjTr+A7J0JPaZ3bdahSZxMZnTPPTAUXSXRDVsy+R8UBjn4AL0kxkzWo4/j9
         +h7ohyMRYO3wWSLDexJCcDgBif8Bc8viAGJtZD8qisaIOVE1ehewiDfhgBznmPajzmFR
         Lxq6/+gk2oRojzZ1ckgPWF0jE/sb3+VNlM41cHQmsw7vvOWwhGEZTinXHovXO2FK3Wz0
         yNqM564AknHtSjn8Yi7owQehobKHjwl5jJQ8kEiwvi9FFBI1wbpxrzvTqsD4y1qDTVUq
         r9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915728; x=1746520528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=ebkAgoLhb9KCQ7MmnwTLPGYGeh2RsyEvyfmLfvBbLgwkl4MtfDTaXq5hUIG2rMwzij
         7rHdh2T/MGnWzIOWLWv1f5rC6xR1MbPFvbgW7CNc6GnQv/CQXi6UPKbrf92Pu/qQ5Az7
         5ohLJFCGwOR0z4zYNza7tG0lzUI9nxd1GS7zH21JDPRJOkTnccNDKuIt7JvxsprWycz+
         qoO8k4me1Q53FS9V/9TxhxsgmDMfW2OfJljfBlmMq8lkax6l2Pv0zvIntrFB2ck3EBPc
         /qLV/OuilMGTtin4xwa3EChnTZcTMQtvl5bPkl+P7wuxC4JZM6qStGzPgjnyqKDOg3FN
         78TA==
X-Forwarded-Encrypted: i=1; AJvYcCXRaazuN/hSGvreLbdTpBMcb1eFkxZu/H1YTm4rTPxpjXp7mYX74ZYTMAvJOaGOuoyHRqmRGZzipoUm@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxiKr9yvFio1vpVmh7TsEJkpSxYZ4m3kWnYXP9fsULqOLHTHO
	AjVsh1Vm18gwVNs8M2XDr9Swj9PYdoTzTZFoUBq5wDYP1pR6+waFAOfYfzzoY6RarrEFr7VavUx
	h1Ua5xfDn3HuMqjugYi0whZ8KIfpgg4dX6yYzaw==
X-Gm-Gg: ASbGncvrqQWtEoOwjxFNq76f6hO6Md29UBcHXmRJrgYfncSHHjGWRFd4VpqrRWdoOH8
	aqfqU5kVvz+q2/CElcZVLSjJXHHbDR2//6Ko/pZLqwB2wv6SqmoTbKPoXWtA9AOgQlt52P14p+9
	pFALm61jS28+3Y2yfwwlgiWA==
X-Google-Smtp-Source: AGHT+IEsezp5muMVAY/lE/H7DEdH8WV2VmTWB3mmT7yKNRZ/0B58jZOoyjXMik/+mxI9FIbD9XZIJdk/S7T9DrPLhZQ=
X-Received: by 2002:a05:651c:30cb:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-31d5b13bdb9mr4753431fa.18.1745915728423; Tue, 29 Apr 2025
 01:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
 <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com> <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
In-Reply-To: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:35:17 +0200
X-Gm-Features: ATxdqUFfjlFyz-8zlCBHswKX86tkhKgqvxLDp3L8XiORh1-aFhf72vJ7elWy1Tk
Message-ID: <CACRpkdYRCx8_zLa_OtcFwjmL6_pCsU0hcUe0_PP3=EbukbM7Jg@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: wens@csie.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:

> > I guess you could also drop the curly braces, but otherwise
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> Right. Linus: can you remove them while applying?

Fixed it!

Yours,
Linus Walleij

