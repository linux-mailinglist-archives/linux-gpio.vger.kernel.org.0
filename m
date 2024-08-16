Return-Path: <linux-gpio+bounces-8766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81395461D
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 11:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 214881F21C5E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 09:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FCD16EB63;
	Fri, 16 Aug 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A3QExZz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C984A40
	for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801734; cv=none; b=WzPb5T0ttr/C4DtJYVEOjt9+fr6Y9AiSSaYMb9A0K6z5/U93KdU9/TDMPZLlpaByU9++UXBmKveQuGkXUp8aTArHumPXwjdD2iSRYVxJHl3ijtQIwDzpOqObdpiJ7K2oiWsUwGGOwoYZiCPtogdwVqUcWsGW23iIx99OMJkcUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801734; c=relaxed/simple;
	bh=YgticG9dxHj5aMeMFYXDjN5eoKKd0nnxiMOkIVpF/ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpGM64Svs0/zbiirkpvYiab3el89JkhTTNip734atOvbemZKa4/UD9Zga6n5xYTBN/ryraubrHgNHQcSZeP3ypyUQqslcDTzDF5MMF1d6nBrqI/vORElxDq0PTmcIR2jWvo5/9oVQcK95+4grkFAMv/bwJB0/pmMqenlVSnhB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3QExZz8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efd855adbso2300249e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2024 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723801731; x=1724406531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgticG9dxHj5aMeMFYXDjN5eoKKd0nnxiMOkIVpF/ZA=;
        b=A3QExZz8gQbxqpXVdT1qh678ZPFPsa7BLiyXU5pzKZ8g6IdmVQoTR8VJYoYuhPE0e7
         aDoc0pX6HuqXbNOscDbDXTz67Wn288m6dYzEMU7PvStuYh5bqYlgTFfYnEcClW6XTRc0
         NDgN+viehjG9vqssX3x0AF2kNusNkEmB7K3JLI4aQEsRwNozIprvKTbuwwVrvXmGgASJ
         /4NTpRtzDQa3uc+LwIajS2K3rTDrGVgqSmIkJ+H6yPabJEN7hWcIV1znDi2oZKtqcyxI
         55saH4ZXkoVHvV7Uqe/5wc13xJPJFThCQE+sAXSlDhTL78ig7gkAYCZRr7YgTNKGXOrQ
         GUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723801731; x=1724406531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgticG9dxHj5aMeMFYXDjN5eoKKd0nnxiMOkIVpF/ZA=;
        b=DC8BbxlCwfEsy0tkuiKfncOwWlheDvLOmkUBffom+wkVReCMx28fZ6i0YLc7mTlZV9
         TSyTQRWXPYOCnar6asy1pZ+mUNUu57tGQsttKjmWrhQRG4IuGEq81qvW1JgGV8+8ArDV
         56ojjzl5Kdch6o+R/wyspMpc40J/lbq44OS/PXYA8XxxNPt8V6zPem+iCERoTiXgu/A9
         t2I5fAmQu7Dzrd+0cmUgl4U2Kw6aG1KsnDJXRDNQqnSb+WoZ63UW9MX9LCx2t3Q42ra/
         vQYi3fv3JdKFN3kqXt/per0hC0etMpqGclqbq0bigmJ4H3aGtBE5UeeHXqeS6d7QoCTn
         k2WA==
X-Forwarded-Encrypted: i=1; AJvYcCUOcbdOI2eBP/XsLVfxHczhr61vJJyUpK6AdaBpRafqTLudzpLniYIhpU8JPsqgyGKQ3qNSasoecPJG72nu3TFa0PPTTw3Dq28okw==
X-Gm-Message-State: AOJu0Ywazg2I0cf+ygQgNf5o5Ih1vJvLi0mzvrZo7gAJe7/DB1cf4pZK
	t6iL8E9V5K5jsZPEUxND1UID+O9HaWFCeupfQJph4YcFLbdNcfkPksDFbCPtZl2xVn0PtokeAaN
	YNQH5DPa5cW4fUCJjPsWkGiXrf4lwAgwyZYoeFQ==
X-Google-Smtp-Source: AGHT+IFij/jJsP/niqDckTb0DeGvPRhcCSmaDzREmmynoAVx9zNL/PyJ/e5FT5YitoKM5rpx+usdhEOKsfU75w8yY/w=
X-Received: by 2002:a05:6512:1111:b0:52c:e01f:3665 with SMTP id
 2adb3069b0e04-5331c6b01aamr1377360e87.25.1723801730065; Fri, 16 Aug 2024
 02:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com> <20240815071651.3645949-2-ye.zhang@rock-chips.com>
In-Reply-To: <20240815071651.3645949-2-ye.zhang@rock-chips.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 11:48:38 +0200
Message-ID: <CAMRc=MfFJBTExgUah6tz8ceB-za=GcR6TxuXt0720ykBo8L8ww@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: rockchip: support acpi
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 9:17=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:
>
> 1. support ACPI
> 2. support 'clock-names' from dt nodes
> 3. driver works without pinctrl device

This is not how commit messages are written. Please take a look at
examples in kernel git history. Also: the three bullet points here
sound like they should be separate commits.

Bart

