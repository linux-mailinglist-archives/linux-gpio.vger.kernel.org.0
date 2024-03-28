Return-Path: <linux-gpio+bounces-4804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 367F0890C35
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 22:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96245B22F65
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 21:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E87E13B2AB;
	Thu, 28 Mar 2024 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEyYmbUE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40113AD34
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711660051; cv=none; b=LDEE1BvnxGArxrj6yeloJO+oCwK83iYNMhpUE3PuQBBT7tDxgxzqvx+E6TBM4SekCfb61airLdl8R/SLIx8zb7qThVNdiDXNNUjaHiXHmIrcZeSP5L9QizOfkfctKsZPq/5/lW1MReM9UTEP1601rhXboodGxRwEvTEk2c9xlsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711660051; c=relaxed/simple;
	bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk+3+ncorxGm/hCz1QpsQvnzhB+ZzEZ1UMhIXEWS9ni3BaBXhbH6E7iVyfzuUN0KBVMGjExTNJkCvy2mx9Rr58Q3Hal8KW5L+bhGVotcvsAnadh9I5aUXsP5YsQyFKgCyUrfrTnu5dnePPrl69pMGvQtS25ryaBfGSjhLDjUjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEyYmbUE; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc71031680so1399959276.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 14:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711660049; x=1712264849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
        b=iEyYmbUEKVoEMLSfm+1dgqqjW6ZSjsrKhnwEgQhuqVelEQdeGl+DinyIFq09FvZxsc
         icO69KX7mM0OQMgX+nUaflyBQNaEhqo4tIgCtqWh9nf0Z6M/a2GEuOOgtKDonzgxoDIt
         mK04J3Y/5BcUoV9owDicNq5Ty8wxETWzZNsz4USadunTA7W4uhginvNOklE9YF34bX/v
         HS3wUdPaMudoWNlzBrOv5AgAI//49/9nGrfOroUnKzEajzVfO4OeiXgLh7vb9zIvBAC8
         B6LunEHMRIMgVXBENEfOEncCnEIYXkkfpYu5fnNsLhCF/n8XwOthAQ/VUuCNIEU3pa86
         9mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711660049; x=1712264849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x20Z9wO4XWd6/hqsTvUJ9C5xuiCT/PGoUlQnMNRKhnA=;
        b=rS/xFA+BYOZ/feFNkzTPsTM1afIoa5hbBoV6YkDlmoFwmLYWzg7qhMaZOSiaB6NjBo
         w9vZa6BUy4dYpT5P3B7zu6ouOgrjfb5mxZrXhcfVd6zdcqZsPYRPboPx4QLa7Tkk8gj7
         JDyacefxZB6TBOuR9S9kvlTkty37Zqfjy4DXqd5XJTx8KO5qumgS8Qf3LC81spVK1CM5
         2/nJrbqzFPJuTCI6y75u1z38ictUkQPHY6uI/DdpcLYGMl1+xUACLOs3op4qF+8JUr5X
         I9V5hNQ2SnlqNQFPWWVySVRi2tmdb7UYDQ51w5oJt+QzT31niYUyKQXf9um81c6q4U3m
         6W7A==
X-Forwarded-Encrypted: i=1; AJvYcCVtgJkzWP0AxbLGEzd3iYbY5s1vHvqUuO7AXxITPWEPr5EEDGCJG0IbVClwILc2RenWda7Pn8NL+Z2TF1ZOrSsMhKCgZbE7mayoOA==
X-Gm-Message-State: AOJu0YzmtVxfDHnCZ/KqNf/9dWYncyhMW5gaAFZpMKPhV8K9Dfq7RG+c
	/QW/MynY1/7fPTKojf6Zt3lATnt6ggoYLez9svgoEb2d0TobpY4UoMI3rhld+GAJbgoJvWWby9o
	sSMXI7pbPFfNDOKUCmwgoRMI+Z62jBvoYXy+MTA==
X-Google-Smtp-Source: AGHT+IEZ00FIAL54100s1/gTVa8Y+4TfoCNoj6CJTr4a+YUNR3bthOuQhK7OnCvzxoRuhI+9C1J8CAiCPfUv2a7d2bw=
X-Received: by 2002:a25:9e83:0:b0:dc6:bbbd:d4f4 with SMTP id
 p3-20020a259e83000000b00dc6bbbdd4f4mr470298ybq.33.1711660049195; Thu, 28 Mar
 2024 14:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com> <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v4-2-6f1f53390c85@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 22:07:18 +0100
Message-ID: <CACRpkdYemzkVW4fjBtHtFPaa-Uy969j5Ti2zmRgjFiZK+jGS7g@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 4:36=E2=80=AFPM Thomas Richard
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
> No need to check the pointer returned by dev_get_drvdata(), as
> platform_set_drvdata() is called during the probe.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Since this patch looks independent from the rest I ripped it out of the
patch series and applied it to the pinctrl tree for kernel v6.10.

Yours,
Linus Walleij

