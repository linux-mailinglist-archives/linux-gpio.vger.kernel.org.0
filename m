Return-Path: <linux-gpio+bounces-1816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372B81CB18
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 15:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410422849EA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91951A5B8;
	Fri, 22 Dec 2023 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CRxxr7Dx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737791A5A2
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6da4894a8d6so1167017a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 06:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703253952; x=1703858752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2AexlV3G7GLuTlAIigyiZXkG8ARUrxAREXhx19OIc=;
        b=CRxxr7Dx+KIuwH4p4SqMpnY/MmiidheA4ARwVZwM0GwJTXdErf0FyTXPZAa2gu9oCz
         Xde5WG5asDAu0+qrzElp2V3HSOwKYtkQZiaFm8HKox2tJsh8HaxTP2TbF6ljtTzoSocY
         V6zlxBYH0ZF2SQCcgb4Gh1EbaaHL+7zdzI1rFOCf+RK3cMfffNC6/KGqiPeaG4yOwdno
         9AiLvRrKyXJipiur3VKyxbpLREQij1S93xdlAykSpC4otsr/+qYqr/UriLlJvkxcHfF/
         DszXdNW4KBmfYwKLrq67IxrKNzhVT1xDp9YqyeObANbDeQmtrEE4nxfJc/BX4T5aW08C
         cfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253952; x=1703858752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP2AexlV3G7GLuTlAIigyiZXkG8ARUrxAREXhx19OIc=;
        b=DjwNoBbtKuG8cSah2L1BD3kqze7Wn/wtRaWXiNw8tiyxMwnImMNP3GomKunU4Byu3h
         1QJA0aR72KPzfoM/5ZFTieZ29hafuM65+CT6blVNyeYKe6axaiksYqWJ9Ikvm9RvbiTW
         V2ITbrl0gD4IWR1SHbf3QN9pmbJnj136xTe6JPX18YhxYxdLG5OdGOLp3qBdybJU84B0
         pLu4yUSB8xxS9NsVxZsuBW8mwP37L3vaDAd4QYmyah7rLupgH+Sa+Vo9mOqiX5reoFVJ
         HKQQRSODxkHGInDyR6j5YdNRSd7CiwfGXd4ldJKiJ5vi91xUc+xMOjFnGt6McDi/hK93
         WhSQ==
X-Gm-Message-State: AOJu0YwYHCT4JFJigkJpKgg8rdSaHcN8Si47sitDI8COPLyVP4bEOFJc
	l+q+uWXgZvqxWoBqzxn5Vx5zSYSDVBE6DRTJdXOoS/b1MiTIWlp9CNixM0m8
X-Google-Smtp-Source: AGHT+IHqomwhF8gp66qp6LpDykubtc33/bXLehHqj7Aazh00uMJhgj0smZ5DATitoAGazHvnGxUpfFbOmRT//5j9GVI=
X-Received: by 2002:a05:6358:4291:b0:173:262:60b1 with SMTP id
 s17-20020a056358429100b00173026260b1mr1377603rwc.63.1703253952327; Fri, 22
 Dec 2023 06:05:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221012040.17763-1-warthog618@gmail.com> <20231221012040.17763-6-warthog618@gmail.com>
 <ZYReZI_TnX1MyvP7@smile.fi.intel.com> <ZYTcn-UX0TUM5P9O@rigel>
In-Reply-To: <ZYTcn-UX0TUM5P9O@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Dec 2023 15:05:41 +0100
Message-ID: <CAMRc=MfNme1VavLNnX9whjgohNCs4Q5qADByX8c_tdw05UVYUA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] gpiolib: cdev: replace locking wrappers for
 gpio_device with guards
To: Kent Gibson <warthog618@gmail.com>
Cc: andy@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 1:47=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 21, 2023 at 05:48:52PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 21, 2023 at 09:20:40AM +0800, Kent Gibson wrote:
> > > Replace the wrapping functions that inhibit removal of the gpio chip
> >
> > GPIO
> >
>
> Bart, I don't care either way and not enough to respin a v3.
> If it bothers you could you fix it on the way in?
>

Sure!

> That is if you aren't too busy reversing xmas trees ;-).
>

Joke's on you, I actually do find them easier to read and try to use
them everywhere in new code I write. :)

Bart

> Thanks,
> Kent.
>

