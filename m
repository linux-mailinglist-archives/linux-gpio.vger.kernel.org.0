Return-Path: <linux-gpio+bounces-30710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8DD39A73
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 23:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79F553001FEB
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 22:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC9F2DA779;
	Sun, 18 Jan 2026 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+PbVGY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C727F736
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768774762; cv=none; b=mrbVGXTIZJkilPeWbLyXNXXqnNySTWOSGb30NVet9zELWMB5+QS6ZkO6q1DypraFxII3taKKalfnOJ0bnqcf80Zwlqor9A7YOg7f+6SoCQOM5bzSzKLwyeUUmPukY3z2zvaCAslcDwmU9Y3C2LVk8ymO7FX9kqoFCop7psPwrtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768774762; c=relaxed/simple;
	bh=GitHHN55bP3Z4V21wbsged0zJmuhu+nzwlOmja3RnZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTR6WPfxURZvCYmsfYWC2ePYzvtfuPzpcCRZhN0ThvPro5rynqJ4HxmDTLJAHHo8rxCXB7xXffdaMLKTbAlmpezM8l/Ci5cEiLQ7VWG6+EEfceRAABQ4Qkj3u2r5tfUFE1jrp+L0XAJZ096ATHyVzfCeGNd/Rid1W3cXbR6dw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+PbVGY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6852C2BCB3
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768774761;
	bh=GitHHN55bP3Z4V21wbsged0zJmuhu+nzwlOmja3RnZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P+PbVGY6wyQ+DXIVvI6TnoL2/Fg5DPML01L50fh/oVt62XxZyVY2bfGpVdJ0zZ7rH
	 fSP8gd0yNjZ5OD9ile+eKD+e32roRN8JwXDZ25d0Bwr3YgVgS4YRwm4dcZQtH5S8E7
	 fFwJ0maQDfFuuIYHnycbvfZKlQjqbkeZFnk20iozJy3Ce5U22yyv/chpdsT722NjsQ
	 ScZKB/Kkyr52Y+2QLHaHvELf0iDvEISiE0xN2aiUpSL3fTAecYngTD5kIITB0uL0BB
	 rkRuRncqJkbquctqy1qNh6BQy6X7/y5v+6gV8MKFYiwbanR1GZ6mQ0XgL8+uG4Cr6o
	 dTp2ibrkvdxow==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6446d7a8eadso3217322d50.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 14:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrX3Vc2TJfcBoJyqYqbmv3aAL6D3ZmtH60KmOA7SO6qg+RQtmsclMWuH1zdFo7+WMOrz7KdoZVQfbE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/wqm/w7cWWoM1IjOlZU6k9ruGQbo+E/aY+2EWDakLCVlEFTG
	qpfs2/ACfrhRf3lietu1tMPlcwcLQmWCicXNY9rbmbtQlsc/n/x/7/vQ+6k0zN6pJQduNQYVKEy
	+9DqgGEB8OhvjOV9dfH6PxcflVYYk/rw=
X-Received: by 2002:a05:690e:1349:b0:640:caa5:57be with SMTP id
 956f58d0204a3-64916499c54mr7608440d50.28.1768774761075; Sun, 18 Jan 2026
 14:19:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com> <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Jan 2026 23:19:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
X-Gm-Features: AZwV_QgYRBdpelcux3ZwYKaetoDVqJ1ncGRc8cQV81PLPvRQ_gfit3YePhm3xx0
Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] pinctrl: stm32: add firewall checks before
 probing the HDP driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	jens.wiklander@linaro.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gatien,

thanks for your patch!

On Wed, Jan 14, 2026 at 11:31=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Because the HDP peripheral both depends on debug and firewall
> configuration, when CONFIG_STM32_FIREWALL is present, use the
> stm32 firewall framework to be able to check these configuration against
> the relevant controllers.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
(...)
> +#include <linux/bus/stm32_firewall_device.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/generic.h>
> @@ -605,10 +606,50 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
>  static int stm32_hdp_probe(struct platform_device *pdev)
>  {
>         struct gpio_generic_chip_config config;
> +       struct stm32_firewall *firewall =3D NULL;
>         struct device *dev =3D &pdev->dev;
>         struct stm32_hdp *hdp;
> +       int nb_firewall;
>         u8 version;
>         int err;
> +       int i;
> +
> +       nb_firewall =3D of_count_phandle_with_args(pdev->dev.of_node, "ac=
cess-controllers",
> +                                                "#access-controller-cell=
s");
> +       if (IS_ENABLED(CONFIG_STM32_FIREWALL) && nb_firewall !=3D -ENOENT=
) {
> +               if (nb_firewall <=3D 0)
> +                       return -EINVAL;
> +
> +               firewall =3D devm_kcalloc(dev, nb_firewall, sizeof(*firew=
all), GFP_KERNEL);
> +               if (!firewall)
> +                       return -ENOMEM;
> +
> +               /* Get stm32 firewall information */
> +               err =3D stm32_firewall_get_firewall(dev->of_node, firewal=
l, nb_firewall);
> +               if (err)
> +                       return dev_err_probe(dev, err, "Failed to get fir=
ewall controller\n");
> +
> +               for (i =3D 0; i < nb_firewall; i++) {
> +                       err =3D stm32_firewall_grant_access_by_id(firewal=
l + i,
> +                                                               firewall[=
i].firewall_id);
> +                       if (err) {
> +                               while (i) {
> +                                       u32 id;
> +
> +                                       i--;
> +                                       id =3D firewall[i].firewall_id;
> +                                       stm32_firewall_release_access_by_=
id(firewall + i, id);
> +                               }
> +                               if (err =3D=3D -EACCES) {
> +                                       dev_info(dev, "No firewall access=
\n");
> +                                       return -ENODEV;
> +                               }
> +
> +                               return dev_err_probe(dev, err, "Error che=
cking firewall access\n");
> +                       }
> +               }
> +       }

Doesn't this whole piece of code look very generic?

Point out to me if something is pin control-specific about it?

Can't we just add a helper function such as

stm32_firewall_of_check_access(struct device *dev)
{
    struct stm32_firewall *firewall =3D NULL;
    int nb_firewall;

    nb_firewall =3D of_count_phandle_with_args(pdev->dev.of_node,
"access-controllers",
                                        "#access-controller-cells");
(...)
}

Then place the prototype for this in <linux/bus/stm32_firewall_device.h>.

I think this will be helpful for the next driver that needs to check
firewall access
before continuing.

Yours,
Linus Walleij

