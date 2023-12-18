Return-Path: <linux-gpio+bounces-1635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C46817D5E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 23:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E011C21501
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 22:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B226E71470;
	Mon, 18 Dec 2023 22:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asn2pV0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CD1DA28
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 22:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5e248b40c97so31472927b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 14:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702939456; x=1703544256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu1hjbBv7ar5Bg489M7yruNXHV35/ORbDaqt3pOsBQ8=;
        b=asn2pV0Zkzy5M8zFVXBMQoEhMWD+qvIIgh8R+waeyYCOU7njai9wLLkEG5hulkIiNt
         4zRX2maRXbow28YyE+HneZh2HDM68TMfiHCPc8bzvMd9CmRuTRmiAMsAnXaNvbyPgZM/
         ZBh2bwolYkd3id9LLxLLfh/vRJhXOzC1a+/ZLUf3I3rh9YUkSIW6reQE3R9bfYH/BuiJ
         qkEaw1EIGyPPLBREAU2VIwLJuFPVtksAF0XikCNtwyE1vnei94oQsvN2JbbkfN1mgABI
         Px64O+504JhsAVT/QVbZplse05Xuo0HQ8LqDC9UNxDWgh0GmuZ6C9ddCFPGA2XL2sEMc
         sTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702939456; x=1703544256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nu1hjbBv7ar5Bg489M7yruNXHV35/ORbDaqt3pOsBQ8=;
        b=NXOF9dWp/cNEyWIt+/1qQnLeqhZEExtaO3irI5A+R3tbko/VtwzA+g/6s8MtjImRgy
         yrbAcTSbIODE2rb2Yf3SebrNrWUOxY/cj1hDC0f9e43bs4iELOWlZbsz4fFSD3gvm7c3
         YcDwBGBIne8NComOplgmGLvQmK62Um3VfWBIOwOhrPqJp0yJi7li69bVCUW+VVjZsh4Q
         OOW0X/QtS6yIn3CHoYB6EuS7hguzs9LuTM2N3p3RZZzpXVJt2XtuhvqQyg/DAv1ziAAS
         nPYdAVPsOEET5+FTPU8iEmVHdo8/IsqJOhczpKEKzfAR0y5Xsr2qDyF1p4dSnAKk7rjM
         yDaw==
X-Gm-Message-State: AOJu0YxEz6UGzFH9wsMShTDqIl9EJDXujW2MA5fUklyqpS1B4tLY9gVi
	8mkl3MkIFYhARm/kGzOInhC5eJwhezus1it0lgw0N0V5167a+bd6xf4bHA==
X-Google-Smtp-Source: AGHT+IHULMxzUK0viyhqUhs0Wnjp1Udfpsrs39gaoPqZzlhq5yqmb5MlGYShskzfEQmwvyDYJHIolMqfzWi2oyzHd7w=
X-Received: by 2002:a81:84c9:0:b0:5e4:b168:f4b5 with SMTP id
 u192-20020a8184c9000000b005e4b168f4b5mr4367593ywf.14.1702939455619; Mon, 18
 Dec 2023 14:44:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218145559.2209291-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231218145559.2209291-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Dec 2023 23:44:03 +0100
Message-ID: <CACRpkdbej2mwny4i44J+3yzCfvZo_=QQVSkJnxfqrMHtETmJ8g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.8-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 3:56=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Rather big (by amount of touched drivers and overall due to a couple of n=
ew
> ones) PR for Intel pin control drivers. Has been for a while in Linux Nex=
t
> without reported errors. Please, pull for v6.8-rc1.

Pulled in and resolved a minor merge conflict (which I guess was solved als=
o
in -next?)

diff --cc drivers/pinctrl/intel/pinctrl-baytrail.c
index 3c8c02043481,9b76819e606a..000000000000
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@@ -1173,7 -1136,7 +1136,11 @@@ static void byt_gpio_dbg_show(struct se
                void __iomem *conf_reg, *val_reg;
                const char *pull_str =3D NULL;
                const char *pull =3D NULL;
++<<<<<<< HEAD
 +              unsigned long flags;
++=3D=3D=3D=3D=3D=3D=3D
+               const char *label;
++>>>>>>> 85a7d543f2d4c4893914b46c9236f45b3ad87573
                unsigned int pin;

                pin =3D vg->soc->pins[i].number;


Deleted both since label is defined inline, and this is how
linux-next looks like as well.

I hope it's the right resolution!

The rest just applied cleanly.

Doing some test builds now before I push, thanks for all the nice
work!

Yours,
Linus Walleij

