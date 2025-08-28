Return-Path: <linux-gpio+bounces-25168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8260AB3AC9B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 23:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C16D6207E5A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC80329A322;
	Thu, 28 Aug 2025 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOPAAATb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60C2877D6
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756415690; cv=none; b=p5QFTYo1KS+Vpy0AmRUr232XpzKoH7NSeCrbyAJSaFe3xOG0lbIrMTU4RxX0Siw/Py4Atwh/slnKc3NImdwMWrFufc75FbsK62R/at0R/AwRjGGgzboDmHI2HoEg6T1nUPoLJj5jygF/J2X+oUeabKtgvUrGNOlqLLHEfAvrOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756415690; c=relaxed/simple;
	bh=OaBhTrkd6PegQRmhrQH9eXqW0rbCz4bUZXirlKFf4h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgZM5HqL3cBmVGPXhg+Otkgat1wjP65HEI0NlJ9Zf6DHqFaE/WY4GUa9ws2Es/x2S7Ub+DUjrAAW0j3x3fgg2+eAn8Rd3FEzYe4xc8MbSzqVCG2fcC6RZnFUrIbcAWYVhFuMRBCYRxRj7CpqzBta/eKbSST/Q0foMBFf+iJndSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOPAAATb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f5cd36347so1425468e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415687; x=1757020487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XEIlIk/bq6b/zmhQ7TTZFJvpGHTSwiqbqeiQPXe6GA=;
        b=ZOPAAATb81DyQN+PY3UHeWICXR/cXGLX5t3NY6QHiCc442MQHTrlTU1odEqVr/MlEC
         Jxn+lZnT1iaDFcVFo6TevbxmCP6AmnQ5XfQ6R/PXYp7mn9ij6FaxsOXNcqfaLTaHGvsb
         B5IfeIhzmSwrCE1jaZHWfsSDMqjC844PxBKWdg1Tz1PjEV2JPZiWXLUOYmt1EAjoQLJV
         6OJeaNcWBSSpiFS4UaKNcRSrwgXdtNvuc8dHp4wtreC1VlydhGRz68tSXinhkxUfC5ei
         nfgjzXFOsSaBIRImw7LNExV4+h2MjtYmvanej27G5pzactpoDOWMY01hX7A+8MgIUYCU
         A/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415687; x=1757020487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XEIlIk/bq6b/zmhQ7TTZFJvpGHTSwiqbqeiQPXe6GA=;
        b=Y+sfICpLwZkOgFGoXI8CxwiReo0l55UxbT4kuGvaL808qtUqvU9h/FZYK9mnViW1gX
         JGn7PNQ/SydSbyzjkgcyLfJ3U5W4HzZ6I5xO7GAovFycLpgVLCdm2AXnVe/Dk2JK1Tr1
         D74wKpDHrJOS/s6QX9np55ql2CXynb3DQwTLCI2zt1Sk9NrbncR47t53VBqx4VvzKcwJ
         UJ2YkWjKBxko6FewNTb886ruRVtj46+zC5kvQTxX+AKHnfKXKj0i2pbkUKmmcXPcjaMY
         cDoUiQ+zbwC9u+yC9V5dBT8KVK9Gs+qEFJeOO4KXljKhJV3NawNhFzfQ+Kdttd9cKWP2
         tbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKx+IPFC4gbO1+woGRo9fRixUnVUc0Vqgy8Wwv+jINcF1Gf3qM3NvVV8ux4r1Bvq+LoXJoOn7BDASm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIURM0d0eDSdtzYqx3EuoZZ07iu6+2k5oFSUWMiyRq1fmk4r0
	BQVotgX8bidGvVjK0CVE6lf5OPVPrMvfVMQWhKl56NM90cmVpHixqWnJXzDA/HeFRoa3n95qh1O
	7govDPcONRri7aeoRGngUuHavu7W5rRYt5XFpb0UpGw==
X-Gm-Gg: ASbGncunMxbdecJYB7Y/BtBJE6wbipszHibrsgTdabpj5KpO0WZT0/vT9CUjS4pVVGR
	YaJXtRACHd3O7dCDo4vGTmJx8A+mWl6eTQgZpSBUaSo7A3EeAnboLOc/uBNaOt7U3m8DKdBKlU6
	sdX770lyjEev239rIkejz7jDeBL7sMDwLQfBoShIev2peZ+KJewxHa+z2AOunrIger6MFL24jzI
	rgtB5U=
X-Google-Smtp-Source: AGHT+IHnq5j9y/e9zgOn/W95LXDrsMaMJHjfFJrVjLLZ4xyDUaX1ZKKyMsyBeP8R0VmL3N5ZRmoTyZaiETxJgA8aygo=
X-Received: by 2002:a05:6512:1409:b0:55b:8aa7:4c1e with SMTP id
 2adb3069b0e04-55f64e2a401mr574939e87.53.1756415686593; Thu, 28 Aug 2025
 14:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:14:35 +0200
X-Gm-Features: Ac12FXx3Zu25fmAofOtWqFPELRy7r2mWX-Zguu16p7nw27EDWZqR7HdQtxpXOKE
Message-ID: <CACRpkdYdzsVTtwsw813k0gbD-H7ue8iCNXOdWD8feJCSWZnSdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

(...)
> +static bool brcmstb_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
> +                                        unsigned int selector)
> +{
> +       struct brcmstb_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       return pc->func_gpio =3D=3D selector;
> +}
> +
> +static const struct pinmux_ops brcmstb_pmx_ops =3D {
> +       .free =3D brcmstb_pmx_free,
> +       .get_functions_count =3D brcmstb_pmx_get_functions_count,
> +       .get_function_name =3D brcmstb_pmx_get_function_name,
> +       .get_function_groups =3D brcmstb_pmx_get_function_groups,
> +       .set_mux =3D brcmstb_pmx_set,
> +       .gpio_request_enable =3D brcmstb_pmx_gpio_request_enable,
> +       .gpio_disable_free =3D brcmstb_pmx_gpio_disable_free,
> +       .function_is_gpio =3D brcmstb_pmx_function_is_gpio,
> +       .strict =3D true,

Oh! It's now using .function_is_gpio() and can be charmingly
strict!

Better let Bartosz have a look at this and ACK it, I will merge
his GPIO function awareness patches first.

Yours,
Linus Walleij

