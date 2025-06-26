Return-Path: <linux-gpio+bounces-22245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A29AE9569
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 07:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EACB3ADE4A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 05:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8338322154D;
	Thu, 26 Jun 2025 05:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvBrt1WI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68D1922FB;
	Thu, 26 Jun 2025 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917248; cv=none; b=DIIH3LGMgEGSdhemHrR12cGIzHz/yXPdba3BQq7LFoTZ5xQeFfD8xwPQlksoDiHocdG58OExG3GHf4KPUBXLZfxvoq34u5Tsv/rP6x86xj8n4Ok8VPL4sN7A7mkluMqTL0yBGL4P+TFZgCGtfuWmEOaGWV5TEnfKiGP8Js4p2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917248; c=relaxed/simple;
	bh=7iAoj+5d75O/2ZV1iyFRv33lFf7cZrBssGKedzlxRSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDn0YNqyI5MfoLT0tiZdNO0Tqa/qFmVbDgBWUsKNi51NGcaD1ECbhR2FaClAXhZc3f6GWZxX4G78zDk9oEg0DNF8FPc6APolVkeEUbGV1Icu34LEM5GuLkOkbGiwf5E7v2vMp4aQT4RRAEmoPsgoUxbHRoYCNHGyiP983wP6VZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvBrt1WI; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso814456b3a.0;
        Wed, 25 Jun 2025 22:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750917245; x=1751522045; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlTFuOtf9eiTk1gqLpmaBbwWezRUuOspH58n1Y2jEy0=;
        b=ZvBrt1WIeGWyn1/1W2+TRMq2pE0aj5VhLWVYwZjwZqv2+7NQ1zPHf9TpD/xwV63b4p
         fwQOJ4H0rCwfKk7Z/Q/CuIQ3nvCFz7QccggM+d613Gq+gUjC6tyhGb6/u9SjO88bPKhW
         4I5H1dbthTgk8qUwKNEMCphEzEMSucpUi0V6iqIHRKjHOOn/S8gPtSDoyFXiMkyoR/Ph
         HeSgvw3AN+VpjdFD95MMHGi9AojnHfXJPY4jXWZ4cz7wzY1M1lsRvTdfahsrid4PU+TQ
         qY2uKZq36m5roYuCKM5aX6gDGvHQl/7uV0uNjlpVXlpSN6l1khL64f399EqcYruH8oZe
         ZnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917245; x=1751522045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlTFuOtf9eiTk1gqLpmaBbwWezRUuOspH58n1Y2jEy0=;
        b=MkFLoYv4bY2cITIYYgigBk3dFxpWwK4tqm6s9L5EuD0wFoXBKNzwHgWwOIsECUGbkL
         Nj3ZF9Q1oeaDMFOIFXzIOcUK8dd0EVVVK89BDH0lMbUEeInzs3faEHAvhDBNBNCEvgOO
         R4dDjlDQPjeUNVBQUTrl835Jqb9wO0BFUntwNbvxqFuBOGT6Z6EPw7Czyq9Cag2DQ+6s
         U8NdUp0Bw5xlpA5ldXA9yCEa1h3/Cpi9yjIR7nJzgWb0hxPiIuGZa13ppl40rOf3tPYK
         cvww3zUVDdsgvnsV3GCqlYw+9GwNBRh7kNNV6hUeH+YfQSsoTHtpWq0N/AqCoY2Rky+I
         K4qw==
X-Forwarded-Encrypted: i=1; AJvYcCVcniZqGeo/QxNhJG37rswbEnl4SrqY0osiVjL2Em4AkSlPnOkWvCqZGBxb10nsC8UJTO6LmJl1Hmmr+qs+@vger.kernel.org, AJvYcCWL+pLZKWAzhEXyghVCJNCmX+/QpCjFgwSSRBwKgEO0IInfvqANUbBM1HnLD+w5qj3lU+QG2XNZIV0JQK0=@vger.kernel.org, AJvYcCWbIMvemj3vCjdiLvO4NP0OK5yAx6opI3d9WdozkyUO8gyz1unjAMCvSb2QwesaD7i8bR0Ibpk1dcqr@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgq2UQY8NHg9AIE9N/s6Nd4holmDvkobUTN3wSp55J6XurQTP
	G3xvKOSqhzh9D2wCimkbsHImT8WQmJiDh7jdCUj6/vvUqakTWM12XZkm
X-Gm-Gg: ASbGncuDF/6OXYl3ipJiksAzfzv+pqnRCXa0rCUVV8jqvA3BGGDPaDlpEdL24IyV42o
	lwiEHha0Rs6oboWsgdESTTAKLuaLipH7AyGD7SJlUazQhuPBAmKPPgJ4FhThUHQXPr8+idGsa1Q
	v15zO3j/UflAwQVk/Eu3lPQo08cOj4LGZmMlSvV4tV7m2dt5vjlT95EIkZG3uI3Zo/0lbo42BFH
	dESoueRl4NAQvpX6hLSGbxz/QCqre46h6tQNPNPWatTV8fmu5KZkEkXWSelUS9cwIKdxwcKv7aI
	8WHt0v2vj2SZYGBT1LMFBzF12tqaajl0kCn6PC4W7UVhoTe0qq92OM//Mk1GXRo=
X-Google-Smtp-Source: AGHT+IEurw66qXNiCyoLeHHrybHTmv4pUco1T0O25NcsaZh3Q0YdswiQtltepaoI2Ijcyc2ChYaiAg==
X-Received: by 2002:a05:6a21:680b:b0:220:4750:133a with SMTP id adf61e73a8af0-2207f2eb266mr8269591637.25.1750917245070;
        Wed, 25 Jun 2025 22:54:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c8f:acd3:efcb:bc3d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c430f72asm680464a12.19.2025.06.25.22.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:54:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:54:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value
 setters
Message-ID: <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>

Hi Bartosz,

On Mon, Jun 23, 2025 at 09:59:07AM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 10, 2025 at 11:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Never got any further feedback on this series last cycle. Resending for
> > v6.17.
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. We're in the process of
> > converting all GPIO drivers to using the new API. This series converts
> > all the GPIO controllers under drivers/input/.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Bartosz Golaszewski (3):
> >       Input: ad7879 - use new GPIO line value setter callbacks
> >       Input: adp5588 - use new GPIO line value setter callbacks
> >       Input: adp5589 - use new GPIO line value setter callbacks
> >
> >  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
> >  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
> >  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
> >  3 files changed, 18 insertions(+), 13 deletions(-)
> > ---
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> 
> Dmitry,
> 
> Could you please pick these patches up for v6.17? They already missed
> the last cycle and we're on track to complete the conversion in the
> next one so I'd really appreciate these going upstream in the next
> merge window.

My apologies, I was hoping Nuno's conversion of these drivers to MFD
would be accepted and these versions be simply removed...

I acked all 3.

Thanks.

-- 
Dmitry

