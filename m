Return-Path: <linux-gpio+bounces-22375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04500AEC3C2
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 03:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559A317B8CE
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jun 2025 01:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8586954764;
	Sat, 28 Jun 2025 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtODcN+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC4F9CB;
	Sat, 28 Jun 2025 01:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751073652; cv=none; b=LuKkec/G7KNhR+Ug87fIgk0j+j1ep7zG5/HX2l9sQFGQH17OIrUHRAJiyHX9ACCfdfbTHjOK+nctI3uQa/nNUVKIjOSSc5BuuLDfyOTUnnx2pysywbkH3zaNP6esStR7Iw9GwevHD1esk67Pa4kdLzCeQ3lPRRj67I8keDtIw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751073652; c=relaxed/simple;
	bh=MpTa9TA9k3b2nQldr89Z/sMqdAW/z9ohFM1koyo5aIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTnPIIniKotrD8Ypnv+76P3bSVMOxhgr22nzLowKvldx4ImyMQ9iGWcMN2hSDAikSZVzXIhotNNyF5vZEKhAl6tHvk/VbtbzWHLl/nx6QYbwKIOhNWud9V/yRT2LRoGxumbPistIfRTftX3ZhHUj+jFueIZ0pAg9npkoI+jX8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtODcN+6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso743104b3a.3;
        Fri, 27 Jun 2025 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751073650; x=1751678450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wfd7qO4PTKRmcWvzovx+PZakUJ6qkobf0UAzYzLZ57Q=;
        b=XtODcN+6SUy1MXvcXzFpcmQuC0Zx5gL8KweY+DYsZPQ9Gzuioytew9bNd59W0gjS3j
         FnBzZcn8LXSnxYPSlr0RAj+jz1akV0WIJkIx5dPJgIp6GjNs3rdoq4Y318zCt6JLMpY8
         BVn5rAF1cGBdYR4pES4gecTZLgwzcS2MIIQIWsMSxVa7SXDWxzz4+lj410ZMIfj88gHp
         rFsuCchl2Yoq1F5QIna85jVStDHQETpnQil5yhvxQq6gBCHTeFWxKzKFMHkh98W4lV+K
         wjH6OmhTFgCMSF17OLMZQwYApumDE8co6THrkcRFBarY5PTbf7bl78LEJvOQVIqiIhmR
         5k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751073650; x=1751678450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfd7qO4PTKRmcWvzovx+PZakUJ6qkobf0UAzYzLZ57Q=;
        b=URXmowAVRsm39vzidNEPYVewPTcz+jAj6Alzw9R2BTilu6x/Ow2wowUNkmPG9IhUnz
         YkmeCr+A3nYEuDPu9RJjzk8mGyqSjB2nLqD25z2Osbk9jmvmzllClRwda60KF6mwZJYq
         1Rq8Yw4v6Lzy0c1KSzIQVhH2kwiEejTV9UWEgLU+8vvqGwr2ZX4eRnA32SJ5m1EsjU8g
         lEGJQzkqwhL1USAUbn1mptcDT89lur2PNrkdmKFGGmd3qIAxr2dTfsNpUtS3hnW1ueu7
         hlPzOHFhVpdIq6X+G+nBTmnP86MEJZ8o9gm/T3WsWxgZcQtUfm0XHhedspEO4Fc/zfRr
         slaA==
X-Forwarded-Encrypted: i=1; AJvYcCWvw9R63weT6CNTaLmuOr3R48tLG89X6sKHShVnUBzH8rU2cvUOXYguzBCRXLbMAEcXnr7aXh2fVnVv@vger.kernel.org, AJvYcCXNFVdRcLGc9CNA8jhuCA+WALz5/a2DUpnNfuLo4u/+mXKRvwlCZbJe5K8s7+cgaPo0lvPpmIWMKVifC2hy@vger.kernel.org, AJvYcCXTs40VSfIaX4YfrOamMtjTnPBZZ5t2TgjCjzRZhpfqbTMYdYIHTQKoFnUzb300qBHUCp0P7wKJCDbXP28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyfAojRc2aT5Qz7ayx9x0mPKPyQoV1Pk5qjUH7L5L/TafyPa5
	UE793Mu95GmyxTKfUFVQ3wsQTyTEkf+WjzsM3IOPYFN/0ljYj9J5/Q00
X-Gm-Gg: ASbGncv+4ElpMA7qxFNxND8A+UfwSn9E+4G7zKJkwPf+ORplcA/XgFx68mY0jL8Mj9Q
	/M0JjCXoucrzxKd84DAdEdKgek8IteLaT9NFwP9cvSIOpugjGXiB3coAHhfKVENyiRWle8qMpZi
	vt6C1+T14r8QhXHRjvmNyx/7Mhtej1ymLh9Jbt6B8aC7MbtNcdn9wDjmBnIFX5iVj4OXFNKmICu
	KvYeUGoivyubmnyGwgF1ut3MQkQ0DeUdI7wSventlyOiEmDOjSmSXSH1lP/lOxU3139FWPKJXkX
	chINYAS8f0YFbm6xWCpMFgiY1bBTmWrStBLW/isb5GQ8Dpfpb4wIAlgdCYWXZg==
X-Google-Smtp-Source: AGHT+IEBGAYeUxblbSKmVSbC96IV2BhTEvSty/gbaSqEtqrJoK34EHqFxyQLUsjPWxfjvRrGdgsOVA==
X-Received: by 2002:a05:6a21:38d:b0:21f:4f34:6b1 with SMTP id adf61e73a8af0-220a127720cmr8399184637.14.1751073649993;
        Fri, 27 Jun 2025 18:20:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56d0cb1sm3156944b3a.134.2025.06.27.18.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:20:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:20:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value
 setters
Message-ID: <sxwvtpkdllm2dhb2qw55qgdmfvzhribdfs6bzj5555j23edy6j@tfxcdagawft3>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>
 <7pl4kxvzfo3nra5lubfb6tgmaqxex5oylw7coaadz6v7mnx6x3@cole43kvvmx5>
 <CAMRc=Me7dm7BmTSW1U758oCJ+4W4p6ixU30D5YStk3nyuu8rVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me7dm7BmTSW1U758oCJ+4W4p6ixU30D5YStk3nyuu8rVw@mail.gmail.com>

On Thu, Jun 26, 2025 at 09:37:08AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 26, 2025 at 7:54 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Bartosz,
> >
> > On Mon, Jun 23, 2025 at 09:59:07AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Jun 10, 2025 at 11:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > Never got any further feedback on this series last cycle. Resending for
> > > > v6.17.
> > > >
> > > > struct gpio_chip now has callbacks for setting line values that return
> > > > an integer, allowing to indicate failures. We're in the process of
> > > > converting all GPIO drivers to using the new API. This series converts
> > > > all the GPIO controllers under drivers/input/.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > > Bartosz Golaszewski (3):
> > > >       Input: ad7879 - use new GPIO line value setter callbacks
> > > >       Input: adp5588 - use new GPIO line value setter callbacks
> > > >       Input: adp5589 - use new GPIO line value setter callbacks
> > > >
> > > >  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
> > > >  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
> > > >  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
> > > >  3 files changed, 18 insertions(+), 13 deletions(-)
> > > > ---
> > > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > > change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
> > > >
> > > > Best regards,
> > > > --
> > > > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > >
> > > Dmitry,
> > >
> > > Could you please pick these patches up for v6.17? They already missed
> > > the last cycle and we're on track to complete the conversion in the
> > > next one so I'd really appreciate these going upstream in the next
> > > merge window.
> >
> > My apologies, I was hoping Nuno's conversion of these drivers to MFD
> > would be accepted and these versions be simply removed...
> >
> > I acked all 3.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Does this mean you prefer me to take them through the GPIO tree? Do
> you want an immutable branch?

Ah, my bad, I thought there was dependency on -next for these. I applied
them and sorry for the delay.

Thanks.

-- 
Dmitry

