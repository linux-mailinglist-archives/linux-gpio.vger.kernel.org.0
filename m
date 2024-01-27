Return-Path: <linux-gpio+bounces-2655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAA83F0B4
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29042B258B6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 22:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759401EA7B;
	Sat, 27 Jan 2024 22:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHleKZ0J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7361DFFA
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706394687; cv=none; b=S8Tf7aYfU89j20Aor/pl9ZQOIaiy+KOMnHW6cGzboknmiGKa0mFoVpZKOlH+3oM6BZyLrJHJBZyek/QkA3F2F9nvp5ylzkx3SVX642ol4IGwF6KP6aD6CEn8pZ74W8/rXh9Rx9BS7HJR8DRyrOM9yd/v8gFz2kfHB7TBCcjQrNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706394687; c=relaxed/simple;
	bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGtlxp0PF+Eodt4HAUd7wIyQfmqeBCrq1KWkSm26gCXDb01K+culOICr9RMhzCDu0NjxZIjtdez++tklBaID6L8TdLTjf56Lx8Xb8IV6KNXYswgM04VjvEjQUrT0GSWmJDfcs4rsJo/t/EuseQxUzOvE4V5yywtKZZFCXslGOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHleKZ0J; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ffcb478512so10965347b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 14:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706394683; x=1706999483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
        b=cHleKZ0JcJEZlpoUaX9P+Lv8Q1pdXZQBACsRpogl1frJ+eJ+RVKcyfv96ZaVksV7J7
         Kv5vjXHtp+Pe9uj+QBopb3KOXNGx9E0Z0pm3ozUx7Ui2CslZrePd0ZiZUK57Mma6Nzvx
         eHrpLpN/2y+1hNnJL4LMmjkd3mjpgBt30lm72g48mcCcKSpx0MLCadNnMW+G+4Wi36bE
         FEoGgo4+uDR2nSuetbQmPIAiEocp3YFKrZ5zHv0lXbrYJa2Z/xKCCgc/f9YfNtwOJ/g0
         TLoRLqLL4+p3OtromgncIXxLahR7FdlR1IMOMYpHOEUdyG1bZYKP4NCOSjxS6QOlgQlE
         w1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706394683; x=1706999483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dBUeUlto5pgjnZjs4MdTR5SQtmL2Ucvd23RmHx3BTY=;
        b=H5visiRaNDFdiSFq3WKm/ZziJI8F6x3ONBCNGfbdTi4DEMAgYMCMsZhHii5Y1GMNOb
         IfW6BmZ2TDcXiazkC4eoaT/1iQSIkDXFLHNpBjoxTql/hOiSPujuIDRUEvH5/iFZQWLa
         SZZuDRxPl7Tw8DTJgeNT0hQY2Ep0UDhtVy6bvJRHofh1JDaLZJAxJfsAa6CQVhThJQ0+
         XZjRR3KmWjD7GmODPTGudFnHEgYjQUW/51C/7au3v9AlqD+0B0nomBrfVNTD0mXHzf7Y
         sbrJ8entxqm8Ju3LZ+dERyxJ2IItnjeZ0qTi2kb7uchtRwLRI39pnY6+ItVSHC46OQZs
         mrhQ==
X-Gm-Message-State: AOJu0Yy/1RuGPx4fCv9NSeMOtUl6CucjhMQS9Xfh2Uznm2/n2MfbPuur
	m90AmMtnKDxwl1vLRNTZYPVHf8j9JnQ4jcsx1BKeGQj0vgOK7TqKIFKRed9ONRgDWHezOqV8RKh
	KGSPCD2yLL1dH8v3NtOJUjxCuAmP3WhR+zy2lhg==
X-Google-Smtp-Source: AGHT+IHztRxFG/ccy+YnFlBSRiS8OsDLI+aB8k67iKO1nxm2sl8UZpFQH9rExIgVxfgB6WROcfzh5M2ZahRGH+kk4fo=
X-Received: by 2002:a05:690c:809:b0:5ff:cb36:2219 with SMTP id
 bx9-20020a05690c080900b005ffcb362219mr1863709ywb.35.1706394683112; Sat, 27
 Jan 2024 14:31:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 23:31:11 +0100
Message-ID: <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 3:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> The goal is to extend the active period of pinctrl.
> Some devices may need active pinctrl after suspend() and/or before
> resume().
> So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
> have active pinctrl until suspend_noirq() (included), and from
> resume_noirq() (included).
>
> The deprecated API has been removed to use the new one (dev_pm_ops struct=
).
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Do you want to merge this as a series or is this something I
should just apply?

Yours,
Linus Walleij

