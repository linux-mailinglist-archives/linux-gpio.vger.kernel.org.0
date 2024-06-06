Return-Path: <linux-gpio+bounces-7228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222B8FE34E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 11:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E3A1B2FBC4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519DB13F436;
	Thu,  6 Jun 2024 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfpZeOT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7113E404
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665868; cv=none; b=cglu18rV7fm1aGLwwXt1/uI3rLYgr0ZGCNeB8qwS/0WWIuLox2uYasgPh/XQI6JVCRSA93vK1UeHenp1B6XT67ukw7f7Kd8IiSWpQZil64n7g5dx9liLr3vc/NunfpElfVxNUBfmd7C05xnjC+iEjgmo5o7Xp2ZFezsvuWxYzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665868; c=relaxed/simple;
	bh=udXsNUhcnZ8ynFTNJ+VRVp6bj42T4g0XRqCcuRb5JXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umvljUAhZ80iRoX4ABxKPT9R4+sJ2JxuKSX9yrHK5I49egrYYNDMXozPWyoa/cgxz98kLLiGO4imNgfyu5MxCdKZqd+xL1V8mas/RQJGAfqBGBPWz2csHUuKuXtRQcGyhCu/09F04YNCe1chh91Ujnc6cGsgBQ2twOh1tFKSp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfpZeOT2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bfffa3c748so603350a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2024 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665866; x=1718270666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=bfpZeOT2jsOO3ulGbxN5iU0WItcvHCC1Wn7N83jkTs0cI1lpe4yhWJzD2ssYEWJzi/
         0YT3EFkkfrqqgxKblh7U5CZMVkJZ+5Cc0DZm6fknSk8jtMGrOHNev83QLjft35fAeS7Z
         +WoslQTEVfQjvkQfwTc/PAawt3wWIWWNpdvOJt39kWGIp8LIqZVhnbc7e+IvYr3WvkHr
         lJ04buV0AbIEChXCvX/ISxcxdJftTVwtW0U2oFExRP3I7hgur46QN6MFnlWknLp0yr3V
         bWSgELUA3qy6CgcJ/UNDTB9R4rnyz8rrLDXZ7FLpfburz71zBFqV20TZEWSqvJ1Mq/EL
         9THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665866; x=1718270666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=IqquUHHCFc1cxXsjJNGXruhh/4l7pVlSCJ4m/X6mVKfpqsOovVDgaZc6ov+jldUrRP
         dZruLXk8ejdO5xCOgWRsUYIPXH1p8er4ZFkEntKiN27J/cUtfqN15izucOUDXqjfgd57
         EmcB36fZJ170MxIjorvx9kTIlmznj8BVkvsM1fnFVPZ8+hvJiWlE3jCNndARN3bCgE34
         WxSeh0xVD+U3A9wkD48nzpSwD/uTTEqCTYgkRi0KNA+GHP7t+/Rx7xeI4YrxxAXiVFL0
         MaVjwLdrg+kniII2YwjgCKDEC676QBfWwFvhaVx/Gvdbg7MizPb99j5CKQyktXG0ddNl
         /HJg==
X-Forwarded-Encrypted: i=1; AJvYcCWIbdvcLCWAN50bOULVKxA4AhvYRaqjRKGJZVtBcgCr0+DoXYnn6HBlt5Tukr1yHs/gbKvnretmkWOh56qeLbqX/naQTbkFuk0qVA==
X-Gm-Message-State: AOJu0YyAvIFpz7i0qZLiv5J6JXwnBGTONYuWy7zjvKRzQpfKiJY+I1M8
	9UrOQQysvABUlLwbzsAXA7JappODN/RYYcXGm/FmoyKZ9opYhd3anf1sB5E0NVQK4u4qVedQS4W
	i4axqPgrA7+Hyl5HP3CkQIA67P4rD3jtQ1/4F
X-Google-Smtp-Source: AGHT+IFO27fLQ60otnz+VPqegLb1l+ah/BSl+EBtF4Q1892OcY0hAdcmXoAoiATlOwzJL3jUrPraipj4bPnP8gdWMEU=
X-Received: by 2002:a17:90b:4ad0:b0:2c1:ad46:7133 with SMTP id
 98e67ed59e1d1-2c27dafd1d8mr5026032a91.8.1717665865426; Thu, 06 Jun 2024
 02:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-6-joychakr@google.com>
 <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
In-Reply-To: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:54:09 +0530
Message-ID: <CAOSNQF3Kes3MHWf3FMCCfNOCvymSZV8RS+UMM_oKjhBQzQz8Bg@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 2:48=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 6/5/24 10:59, Joy Chakraborty wrote:
> > Change nvmem read/write function definition return type to ssize_t.
> >
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
> >   drivers/misc/ds1682.c | 16 ++++++----------
> >   1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> > index 5f8dcd0e3848..953341666ddb 100644
> > --- a/drivers/misc/ds1682.c
> > +++ b/drivers/misc/ds1682.c
> > @@ -198,26 +198,22 @@ static const struct bin_attribute ds1682_eeprom_a=
ttr =3D {
> >       .write =3D ds1682_eeprom_write,
> >   };
> >
> > -static int ds1682_nvmem_read(void *priv, unsigned int offset, void *va=
l,
> > -                          size_t bytes)
> > +static ssize_t ds1682_nvmem_read(void *priv, unsigned int offset, void=
 *val,
> > +                              size_t bytes)
> >   {
> >       struct i2c_client *client =3D priv;
> > -     int ret;
> >
> > -     ret =3D i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM +=
 offset,
> > +     return i2c_smbus_read_i2c_block_data(client, DS1682_REG_EEPROM + =
offset,
> >                                           bytes, val);
> > -     return ret < 0 ? ret : 0;
> >   }
> >
> > -static int ds1682_nvmem_write(void *priv, unsigned int offset, void *v=
al,
> > -                           size_t bytes)
> > +static ssize_t ds1682_nvmem_write(void *priv, unsigned int offset, voi=
d *val,
> > +                               size_t bytes)
> >   {
> >       struct i2c_client *client =3D priv;
> > -     int ret;
> >
> > -     ret =3D i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM =
+ offset,
> > +     return i2c_smbus_write_i2c_block_data(client, DS1682_REG_EEPROM +=
 offset,
> >                                            bytes, val);
>
> i2c_smbus_write_i2c_block_data() does not return the number of bytes writ=
ten.
> It returns either 0 or an error code.
>
Ack, I see only i2c_smbus_read_i2c_block_data()  returns the number of
bytes read . Will fix it next revision.

> Guenter
>

