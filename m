Return-Path: <linux-gpio+bounces-8889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B8958F89
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 23:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7434F2856D6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 21:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4659A1C4621;
	Tue, 20 Aug 2024 21:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akbdgLux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741371C579D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188453; cv=none; b=EwKdj3e+h8YUyyUd4sUt5uXXOy60jcI6WIeVlrA5faB3BK75SagIbilMBCa0PTr0+575x0f9ox/gmRkGjrWgCnAK/tXINiCJ3jxn3Wg488bat5NDIUS3ARsNrQ/Bl4tqJFkHpOoB/3+qZUaZA0bhTasc9SgI9DJsGc4EmlZs/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188453; c=relaxed/simple;
	bh=ZwQt+rff1B5sI5B9eMQJbttgfA71oEimpv/iurMNl1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvyv6slUHND/ov+k1qwqc6PcKcTpsmX+dPd14UJ2i3JfEM0mJ2GYXKmwEqhoVMiTHnR2K3tPJ9uPpQ6KvZ0ug1bgo7alzWHGnzEOPCrZS2k2sAVSW55P1Sm+cvYP33ZizhzOMV92vcSd1VSK4FsWVoswxejP3J44XpsXNoKfURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akbdgLux; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efdf02d13so7909570e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724188449; x=1724793249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z27G+KZ1i6csWDLjej9MQz/SC3L2sZ8zDE2Y5uQJoKo=;
        b=akbdgLuxaMR8HFrDWVvBj3Y4g94LaTu31iPD4y7AfalERuPAIFBZR0AbQLhT0nWYVm
         HZbBzKc+mjjbrgOO8rGvs/zQhgVJZ77UAcXaEESQw/jgosuRYAHfLWTHRYSNHSVBlrTd
         AZ+qyYV21UO0KfAS8eNNYY/9V3Gn9Ja0Sw472VlQLkroLW4kaDjmgklwkiEnpOjZkPhp
         35ldZC7PQPvzdVXV+9AmCAmT7tGdvDZ8kIDZsAySz2htEDjh2lg0USbPC5JaqYzXDZvp
         R+16FvK/S+ycjxhH4GN4qQ+kSKs4t58W/yi3DAFrWYQMzdiHVwyWlXerG2MIMmbVsXWi
         CUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724188449; x=1724793249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z27G+KZ1i6csWDLjej9MQz/SC3L2sZ8zDE2Y5uQJoKo=;
        b=UZiExjk4B3HNJn8/VvRr2peju9xnplGrGyvRibfjy76GaQlgrifk6d7mrH17Ixu6Ms
         Z/W0JRYDJHJkGyTJ8f/sFe15MXPR1SuWng7bOuf9paP8qX1YB+nKg7IfauoQDH65gjxy
         aLfmOfzsChckOEGVxA1L1kgTJ+yJ03igusDGWDY0HDa6WQxJdFwo4Rr0HQtTQqBZ6waw
         h+zIgjnmsxTakXW/d+hwifxDPTPR69rFv6EzV+STHhe52cWVBDaO+mk8a+WwGjEfqW9i
         QwM1HDhRvw46VUVbdVUK2nceWB/1U81/sga/NyUqyIVBMZ3UOd8tKfJbGuYxZmIQnD/H
         W/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Jkej0v2HVoqtP0IwKvD7jcQ4Y9E7UD/tRYDD7nPM7U8s1WAby7ceMm1SANq/bLsjIL3hNbFl0lAy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6btZXEHIMZDeqYF3PuuK5Cdw9QTbSTdaKHDXKP8PM3fevlG2m
	0Uy/3wTArh9lLnWkHUFJ8zybt+Z0hXAaP3LWKKM2GD3d1U3C8wxZiHYr8DrlpomrIr5zaQN6fQH
	BdHUtzDKQK/lYmCXM/kvY2ceJsTSn3KPg
X-Google-Smtp-Source: AGHT+IF5fxjqQVY8jq13alEaHc6Dggvp0nXeEc+vPBO5OY1WoHB0rGDIxclqhzig0bUy4UUSJRhaHA9sg7yJNmCE5DY=
X-Received: by 2002:a05:6512:4026:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-533485eb474mr12866e87.52.1724188449021; Tue, 20 Aug 2024
 14:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810> <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
 <ZsUE3DXG9Ryo0ylT@lizhi-Precision-Tower-5810>
In-Reply-To: <ZsUE3DXG9Ryo0ylT@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 18:13:57 -0300
Message-ID: <CAOMZO5BtU4GEgWYsFKtZHmTLfUF85F5M1dVB=XVg3p1uq2HCig@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 6:04=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> I am not sure how this happen. i2c device should be probed by i2c bus
> driver. Only after i2c bus probe, which scan i2c device, then i2c device
> driver probe can be called.

Exactly. This is my understanding as well.

I don't understand how the PCA953X driver can probe before its I2C parent.

For now, I am registering imx-i2c like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1639,17 +1639,7 @@ static struct platform_driver i2c_imx_driver =3D {
        .id_table =3D imx_i2c_devtype,
 };

-static int __init i2c_adap_imx_init(void)
-{
-       return platform_driver_register(&i2c_imx_driver);
-}
-subsys_initcall(i2c_adap_imx_init);
-
-static void __exit i2c_adap_imx_exit(void)
-{
-       platform_driver_unregister(&i2c_imx_driver);
-}
-module_exit(i2c_adap_imx_exit);
+module_platform_driver(i2c_imx_driver);

No errors are seen so far.

What do you think?

