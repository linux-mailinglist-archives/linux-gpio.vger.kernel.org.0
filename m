Return-Path: <linux-gpio+bounces-16587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67921A44BDE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21AA19C58BF
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485142036FD;
	Tue, 25 Feb 2025 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGaVir9t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE533D984
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740513311; cv=none; b=AX1K1U3uB4BBQ1a4GlHsMRHw8sVQ1YCl+9WdBxKT04QzhMa6oDdvMoGC4B0annpTMUTLqj5VjF/+AB+FYqOACgAJznaTe2yKmS8Wt+Sfzldke3G64gnp8EiihOhG0DIhFgjahM0JXp7xDjvDXvvObxyfS/Mikjsxol4KiWvIY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740513311; c=relaxed/simple;
	bh=FyYKEcEymJY8mMJc8QyD6FpfpXzrx9eZQgCSCElPh3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiJyfrO6+nISw9IFHmheYzqUVU8wVSjpiDlzH9u0C/Mhu3fR4Wj7XwCyL2SQvzM+ZuFIX1UA4hsCVEvb94UxK2uwA2+TkfvTTixFJohjlGUaxjy7FAdP/BUT5ZX4a25qGfKhLdwcOTadyC97EKnevWp7Rzw1z/rkSn5f+a2+t6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGaVir9t; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5dd164f03fso5515212276.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740513308; x=1741118108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bbThIIBCt6PnX1RHrWXUkMNSWEfHmb56xB9odfhZuc=;
        b=SGaVir9tChO3WG+7jzthpwjX1ha5uUFunem0oYs9x9YmNGSBtRL7TX+v4Xp3x1qZ+N
         s4U3mumrDGisgVEmQ203KWWcPm+lyudq5qhwiknOi1pugSZrkdjxifI09upNHi2lySbv
         dZ0mwf5nOXsf16ym8upxlXlXkcpxA67pwUhadyWJsbD9mHXiz/iZPzMa4cGdfJqKfjjN
         zwUig74xGeNqszPO3uuUJdnSEPImEwl4Wi3Ko389T89lrW+RGRYZkEGtI0lb8BVUFojL
         M5teDcjxFQS0aJIxxcezjvcBCmWE0u4gdmXCGT5T8CHCHsAFUWf7W6m1e94Z8dy817tf
         QQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740513308; x=1741118108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bbThIIBCt6PnX1RHrWXUkMNSWEfHmb56xB9odfhZuc=;
        b=bikfLL6f51UvqkotMIKYWzmS4LBtcrIEZ/CyPwbyYXphzQaUDTzSVj05M7G2mqKqxi
         qdi/w51FWvmGLXGRT+bJ8htHSdPNt751tnMexAE0iH11Xlr4NGYCqRXBaPLYfPSp8jsN
         AWbmknGCOsgSkt5joVClUDEzgVdLf9XqqmPCG0lNukkjQfrNurjs8iFoosnfgxPitDLx
         /aRTINR4JG6KuSLiWL1dmlTKn+AgfznNYvtWtFz9HucGuTdzu/LCBUrove+Nhxss+mLh
         7l1/R+vXeSlxKRZuWuul94K02hyHiIMouuOfToT+9aHRH3rMw+bLGib9XMrvx8fppd1n
         RRig==
X-Forwarded-Encrypted: i=1; AJvYcCUJFCvMeXPpj3FD0Y9oKXfShphtME5StR+nTTcdZzTImKmzjwiHRUR6wOGNcMFgsde8wUzsgBZsyMgT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMad1tKFbbe/LSe7lPmXc8OleewM/5as4hWTjniXvt3AjuuFy
	kBiqgo6dB5IMVwDJrUhT4LTBVhafSgNJiBXrQhGUcE3SMrT6gHM8JcQEWoVxiXJMGNn3uvXgBnN
	NIaimcrdlaz46sd0g9NhTdALj0WJIBkrPyu7CqoT7egyThsU4Gx4=
X-Gm-Gg: ASbGncvhZU9w5YccAt9ks6x+VcdjJmfYrFH9fjQnK2d+9DSs2hT745LBMiYMnv84jjy
	tNEGx/Di8nRuZjWsxRO+95YhjwodB4PulKFTGAgCZAPTV7AdqYT5IeH1PxMvS7SoG6fnq194FJO
	WrqBRiU8I=
X-Google-Smtp-Source: AGHT+IH7CpJtKk5qeDcjI24RyPQ9idqc9oCeIHa2FVpGgphOghNlj76asA7iTDkEOezGwzGaYpKJ9XmZohf5ZlLru0E=
X-Received: by 2002:a05:6902:1581:b0:e5b:2a51:deb7 with SMTP id
 3f1490d57ef6-e607a4e3a35mr3767695276.14.1740513308381; Tue, 25 Feb 2025
 11:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com> <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de>
In-Reply-To: <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 20:54:56 +0100
X-Gm-Features: AQ5f1JoDZ2r3Nk1ocOs2bYKCB7sR5AObLdrWlgtL_EKRH7fT3S-CfZTbVuS0dgA
Message-ID: <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 8:41=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> I would very much like to avoid having to enable debugfs on production
> systems to access GPIOs in early userspace (e.g. initramfs).

I didn't understand that. It was because Bartosz used the word "play":

>> The gist of it is: some people need to play with GPIOs very early, for
>> example in an initramfs

So I took that word literal: explore, play around. Not develop
products.

> This was so
> far possible via the sysfs API without tools, currently it is becoming
> not easily possible. A sysfs API "v2" which makes that possible would be
> very much appreciated.

I understand, I'm fine with sysfs if it needs to be a "support forever"
ABI, as long as it's:

- Using the per-chip HW numberspace

- Doesn't need any echo NN > export to see the lines in
  sysfs.

Let's just show them all and introduce an ABI for grabbing one
line at a time and shake it.

/sys/bus/gpio/gpiochip0
/sys/bus/gpio/gpiochip0/gpio0
/sys/bus/gpio/gpiochip0/gpio0/userspace
/sys/bus/gpio/gpiochip0/gpio0/value
/sys/bus/gpio/gpiochip0/gpio1
/sys/bus/gpio/gpiochip0/gpio1/userspace
/sys/bus/gpio/gpiochip0/gpio1/value

Take a GPIO, shake it, give it back to the kernel:
echo 1 > /sys/bus/gpio/gpiochip0/gpio1/userspace
echo 0 > /sys/bus/gpio/gpiochip0/gpio1/value
sleep 1
echo 1 > /sys/bus/gpio/gpiochip0/gpio1/value
echo 0 > /sys/bus/gpio/gpiochip0/gpio1/userspace

 I think at this point all that is needed is a patch set.

Yours,
Linus Walleij

