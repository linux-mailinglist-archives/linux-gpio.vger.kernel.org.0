Return-Path: <linux-gpio+bounces-18372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC517A7E0A8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 16:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF1EC3A9995
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFA81B87E2;
	Mon,  7 Apr 2025 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTOGSyT/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141551C0DED;
	Mon,  7 Apr 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034621; cv=none; b=Ge1qygES9WyqyyDIjN9boa2+LNWr6rJsQIwp28Fl+YL1St0YMuE65fvkJ1zNDQ7Kp13cB9cv0pQ1xgO7yqUXiAe2yaxgIV4y+i8UfgII1EtuWHjrtZ8yn2lLQ0jHL42PPYzD7xx5dgRsmspotnlSDvSo4T05rwcxTgCBFIYPF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034621; c=relaxed/simple;
	bh=AVcNJrpPYIGA36U5G5+x66QY97yrjXIuXHF9RC3zkQU=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=UYxnvr8x4iB0aR+VXqbLscxvtWOCsNsNmvD9Zyq4fmHBb3W5iEl4htufSSQUaWrGv/z8Y6jrjOMntAf87S41RlSw56P/UVBjMLVEEEwbROY9tzQeIk+bxK8NhzKv9JfgFx0zRukiAb3OcPZ9AUzrfBRZUVqLRmwP7xhVm7bSlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTOGSyT/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso28997265e9.3;
        Mon, 07 Apr 2025 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744034617; x=1744639417; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=cTOGSyT//VtSI/F/VDzpu6k18jHZjzkq99gQqti0cNmF8k5YUdANodwdQNv+A3nkPN
         bwJ/9srMfXNouZ9RcyxH6Yx+cjlVvHcQLtIx/tXxPIhJH/zhNxFCgCAWBmfxfOLbEDjy
         Y6GUU5VI2RNfMB5ru6svXc/d6y/NS5oFRf5VXAWTq6tAc2EEYpLGoTHPJeico14kfmJy
         Vo1Wp5dIp0ySlMIOZSM7NlYoBHDxWPDAtZoWopiz0S/CBg+ihTmWbZDDSm2LWEE847ri
         doKn2ixjqDYA51eepLCq2iP0Z7pkVVvNPwgNIH9HoqY/WcF+L2dIyersUjzU+d9tQ8Ar
         Ea5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034617; x=1744639417;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIlvgpw9XtwUaSV8K9n4TGTxcXwBT3cWEpS99F1AqXk=;
        b=rKNC3Fr9ItIg9OYD42lZvniiZpZ4kf3wreoHJBCwD+b9/8R0FZIMIjYeIyOmPrhcj/
         U/ejyoo2b8e75huRESCNMmqtc2I79SDaHft7TKafzeUT6w0IwOFvtSmxEf37/tINFaGB
         MGi+pKbMB6ClYQY4QycllDlDkD7OWZzLYGuhsU07H2GMiqDZUmf/zoXFX9UaGGzkTZgC
         fVdfmSJbyg+xpA3bTAqttYePb0pc351BSNX/dQ9e5Oe1oxNnOc+hI1bIFbwVXM5IkvOG
         j30fIRs8zMXVOmBkqA7kJkjQpPfLJCGfhA/P4egiSIsDmTdn+LQpREA1DdbT/jpVo2Iw
         Ks7A==
X-Forwarded-Encrypted: i=1; AJvYcCUkGSkL5t1sYZCAMNdSWBhlSptL6ToPFy2+giBbkP5IhMP7FZ94irqT7Ibq3U8jY3pHTPvRC9VcI7EXiAhP@vger.kernel.org, AJvYcCV/SX/4k6dIdVVHn3zC+BJopba4hD4HrDdFkC4bsWWFAMg+AcOqgeJEQILkQyLAtOG/2QJyBSTi5sWb@vger.kernel.org
X-Gm-Message-State: AOJu0YzClPokvAhDXsuGAOdK4W1t2cwofzl1bVPLc0sAKd/cyBZQMtsM
	iz2FxRG9OZ2Fd0j+2cn1Uah+8ycBbhNRjztxxNIK06Fx71xtYQA7
X-Gm-Gg: ASbGncvd6jdUQuaKiWcU1Gt93vT25EwzAoPBYa68Nnrybix7QTKZ2tH+rvrhqRT/6eP
	xDveH0RRyXeOsCHl6zcdn86ljIygQLE7+I3uXCpySlppAOzvU9+PDh0fUcFeYx3NveNNlPv7Q0k
	gQAp3RJy+L5YfUt+520TLy+zD/mGO519LAGxY3ngLRwTffBdaE+iyv1TsaJ25IiMnf2VIi0p54s
	Y2OFDhWiEtsRP7lyoY5G4Gj2EIHFvI1J1LHvJSTHilC5a46+PKj3HqPufJd81vvMl05m/4QGvsV
	w0io0j1BXymoQYnEtyAtoEHtk7sbRwauWCSCA/iEs7O4T6puOvV0QSosuA16MvI4wIgbUg==
X-Google-Smtp-Source: AGHT+IEn+6ojavR6tMMafF+SmH0WwvgludvtbX1hi0lpL0Cl0TXhJ1J3Nf3kTI2WVfqKrE0IPj037Q==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr10795285f8f.34.1744034615187;
        Mon, 07 Apr 2025 07:03:35 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226b23sm12049412f8f.86.2025.04.07.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:03:34 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 15:03:33 +0100
Message-Id: <D90GO8QLAESS.PN6CB62OS6OY@linaro.com>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] staging: greybus: use new GPIO line value setter
 callbacks
To: "Alex Elder" <elder@riscstar.com>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Rui Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold"
 <johan@kernel.org>, "Alex Elder" <elder@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Linus Walleij" <linus.walleij@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
 <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
In-Reply-To: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>

Hi Bartosz,
Thanks for the patch.

On Mon Apr 7, 2025 at 2:49 PM WEST, Alex Elder wrote:

> On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>=20
>> struct gpio_chip now has callbacks for setting line values that return
>> an integer, allowing to indicate failures. Convert the driver to using
>> them.
>>=20
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Here is the commit that enabled these:
>    98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values
>
> This looks good.  Thank you.
>
> Reviewed-by: Alex Elder <elder@riscstar.com>

Agree with Alex.
LGTM.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
>
>> ---
>>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gp=
io.c
>> index 16bcf7fc8158..f81c34160f72 100644
>> --- a/drivers/staging/greybus/gpio.c
>> +++ b/drivers/staging/greybus/gpio.c
>> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpi=
o_controller *ggc,
>>   	return 0;
>>   }
>>  =20
>> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> -					u8 which, bool value_high)
>> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>> +				       u8 which, bool value_high)
>>   {
>>   	struct device *dev =3D &ggc->gbphy_dev->dev;
>>   	struct gb_gpio_set_value_request request;
>> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gp=
io_controller *ggc,
>>   	if (ggc->lines[which].direction =3D=3D 1) {
>>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>>   			 which);
>> -		return;
>> +		return -EPERM;
>>   	}
>>  =20
>>   	request.which =3D which;
>> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_=
gpio_controller *ggc,
>>   				&request, sizeof(request), NULL, 0);
>>   	if (ret) {
>>   		dev_err(dev, "failed to set value of gpio %u\n", which);
>> -		return;
>> +		return ret;
>>   	}
>>  =20
>>   	ggc->lines[which].value =3D request.value;
>> +
>> +	return 0;
>>   }
>>  =20
>>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *g=
gc,
>> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, uns=
igned int offset)
>>   	return ggc->lines[which].value;
>>   }
>>  =20
>> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, in=
t value)
>> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int=
 value)
>>   {
>>   	struct gb_gpio_controller *ggc =3D gpiochip_get_data(chip);
>>  =20
>> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>>   }
>>  =20
>>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int off=
set,
>> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_=
dev,
>>   	gpio->direction_input =3D gb_gpio_direction_input;
>>   	gpio->direction_output =3D gb_gpio_direction_output;
>>   	gpio->get =3D gb_gpio_get;
>> -	gpio->set =3D gb_gpio_set;
>> +	gpio->set_rv =3D gb_gpio_set;
>>   	gpio->set_config =3D gb_gpio_set_config;
>>   	gpio->base =3D -1;		/* Allocate base dynamically */
>>   	gpio->ngpio =3D ggc->line_max + 1;
>>=20
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
>>=20
>> Best regards,




