Return-Path: <linux-gpio+bounces-3313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC6854F6B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 18:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 713FAB2B6D0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 17:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3156024D;
	Wed, 14 Feb 2024 17:04:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079356087B
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707930254; cv=none; b=GuAspZRaOCEGi+tQTo48Md7ITCMLopgKsWjmNeGVwe24gWU5Hz0R7XiFVOWe4MXSqOIS/wqLD9Dy9bkJLAjQuIRwC2y8wzKPQlvr64N5GH+3MxGrRqfM5aIpdw7CiE32ywDww7hpHOdBpziwG3D0YWJfKE+akyolN7bOzqEZvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707930254; c=relaxed/simple;
	bh=d+4di5zjnt67CQW+DmH0gAWSNPbmb8WmycElMAQJIW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nJWteegN+ZMDwusRS/OqB4UwBdVeq29N85WImKRWak8oViiO7nMv7NFHFEOgNmG4h8Yi4+aaqFekiA7a7WX/aPp8wiWQvJRiQ5SdS846Z5bya4kkFMbn9DvQ4j0IigOZVwIWTHbursT3ILF3mkgxJHrDisXtcbEvxhrQuidwuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso2038550b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 09:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707930252; x=1708535052;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rNhav+7L2/K8KIa8PybW7vaELkvxb4l6BfkxMKSsrw=;
        b=uJzTIRRETwQrP6MLI4zKrg5gYwMZfDh5vGLPKiSZ4weZdyaoMIN+0mx/Y0Ix9gqr7H
         dX8QoY+z6/q8bGC+s0ueTcEzWwzfOCjAd4ACxX+sAyap+WPgGbb7uNag6hFmsALnU52o
         uRabFCR/iuw6Sl11LqXht+3+g+BG1kMsBWzIfcQ8MrxW+5bSSsyLu1MGqupCG86F3x2z
         KBfz6RtblssmTrhjltF2MWYK00+jbBqn9a9iVBODrTkLU5XfnDsnjdlnQrVR9YZgSnDZ
         qXP5zJnJzB9nGC5G+BQWYgUyA+slA9pV4jxp9+XVcvsvAa3GKrwAcKyJz/O5Ik81RhqX
         Gh8g==
X-Forwarded-Encrypted: i=1; AJvYcCV7jAMFnrF9r7FuH456yHQLZ2bG4vyroCjrvLkvVqrypn+AIiJTotp1f7i5PBDhKHchqsyDFAXj4woCiHh18iRWQAbIXlyLVuYNhQ==
X-Gm-Message-State: AOJu0YwTRBzoLUfhF1EHiJBRacko4hgj1TnUPmYbKtYUxBjZxXAFYdNp
	pKkMJIqovzY9g61y+DpPunq7lpiRhz2XNMEEYdehodYzldxsLEvKCrdqoEf+bFM=
X-Google-Smtp-Source: AGHT+IFsv4N1m6Boc7Pwj7tvZOfnK773MPq2SjotlEj2cK62z5QH3wAcvbwi5jo/bYE2q6zQdf8oJA==
X-Received: by 2002:a05:6a00:2d88:b0:6de:209c:3228 with SMTP id fb8-20020a056a002d8800b006de209c3228mr3775946pfb.6.1707930252034;
        Wed, 14 Feb 2024 09:04:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJVqfd3ZBC3+g61zbA6HBTnD5Z9te/X4KeI6sQ3exqNSyqiArKAuV6RrMShSBtA7aE+oEE1FeJ8XFiq7yuOqrwNh80fODw/mufUf254/czZyN6qcrvx7uhUT1Lary/1zGH8Lm79yKixhIlavYRfe+oDsyc+lkvDu3vtlWJpM6xVdvX6QCw2ATiy0FG/0CcjhetkWPk5tRSlnlL3NqpWcJqbOE1sY4tgb5TUr5btH2/pGmbTwy/ogx3S9VsVZLJkrsMGur4v0HqIc55SETLCGuzL0Xd57gfO6hcdmVs6K+vw1kXkE/82qDaOSDx3yweNe8iL9zt/MUAhk2UMhMnEGBv9senfEpuq3PKl7imMLZLJ02u9KOMY3GcGsJxzVeyrqJfPML99O7gP0VfAp/dKj4ESnPNbT6F54FSF8Wdtt0EN4UzgI54T8QMEVol5fnDVxRw+PQL2C7ejrAaFXbQ+th792TGBxTsSX0Xszvj56mg0EfeB/uW9JrN+f4Ibc5q8mqGUCwFvzjP/YGcEghaQRPbp7pKmO++FrLs/AlM4PXSwMZJiyfgAxLW07kXbSMoWgkd6sZ5aqvq9g==
Received: from localhost (71-212-63-227.tukw.qwest.net. [71.212.63.227])
        by smtp.gmail.com with ESMTPSA id r19-20020aa78b93000000b006e02cdad499sm9842044pfd.99.2024.02.14.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:04:10 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jpanis@baylibre.com, devicetree@vger.kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: Re: [RESEND PATCH v1 04/13] mfd: tps6594-i2c: Add TI TPS65224 PMIC I2C
In-Reply-To: <20240208105343.1212902-5-bhargav.r@ltts.com>
References: <20240208105343.1212902-1-bhargav.r@ltts.com>
 <20240208105343.1212902-5-bhargav.r@ltts.com>
Date: Wed, 14 Feb 2024 09:04:10 -0800
Message-ID: <7hplwz565x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

Bhargav Raviprakash <bhargav.r@ltts.com> writes:

> Add support for TPS65224 PMIC in TPS6594's I2C driver which has
> significant functional overlap.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>

Thanks for the patch adding TPS65224 support

[...]

> @@ -216,15 +217,18 @@ static int tps6594_i2c_probe(struct i2c_client *client)
>  	tps->reg = client->addr;
>  	tps->irq = client->irq;
>  
> -	tps->regmap = devm_regmap_init(dev, NULL, client, &tps6594_i2c_regmap_config);
> -	if (IS_ERR(tps->regmap))
> -		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
> -
>  	match = of_match_device(tps6594_i2c_of_match_table, dev);
>  	if (!match)
>  		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
>  	tps->chip_id = (unsigned long)match->data;
>  
> +	if (tps->chip_id == TPS65224)
> +		tps6594_i2c_regmap_config.volatile_table = &tps65224_volatile_table;

minor nit: for chip-specific differnces like this, rather than do this
kind of "if" check here to update the regmap_config, instead use the
compatible match data have a separate i2c_regmap_config match table for
tps65224.

Kevin

