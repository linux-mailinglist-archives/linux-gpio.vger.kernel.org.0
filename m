Return-Path: <linux-gpio+bounces-14761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC484A1034F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E381888EDB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFA724635A;
	Tue, 14 Jan 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI5R0IG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE222DC29;
	Tue, 14 Jan 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848316; cv=none; b=YgEaALpY5HeCoz4ySJQz0gJzpLWiaZZCGjYwuojmyQcpFbLVCUHT7DTZXRtTpsHSvzSlLEFsdVmnP71ZDNN83qkxwOMr4fqFWKCIFGD62fFHtBxGRzAm463eo/5ANXlF0lanPZ1k8hANx7E5FJrbS2uVtec9z4dWg4kh/di/clM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848316; c=relaxed/simple;
	bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icT9dv4qCyLVm/D7gqDOsHHjubRLSHvarX/3MfnR1I+EsVhQsWGsxg/qgPOvvkcmTrucgZWVxZLGhJLnyGWUsor8MPU/IBnxTQf2GnxxHa3Cj3imk7KuHlygo4TsQrfL6f9JjK5Xw/zudi2d3iVySkyfwo7eVQx/CUky31Biwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI5R0IG3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso8794826a12.3;
        Tue, 14 Jan 2025 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848313; x=1737453113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=AI5R0IG3Wp56qDCPtHCxiz5c2BtXQjR+WK6AtGw/CNHOOiMqCqZ4AAtEt4BRQ/rO2p
         rNTFfF2Tf5+OE+gVCZ0nFtWZbleuOfh95a2RwTrQq2oV6XsLuizoQLhOu3piRgRQgYYJ
         wMq38uMneIUFZfm/OpU77TtGQ00m5BarMNv1rfvuKgJo2BZVqJMdxyyMo36UJLA15C/t
         T7hNzA43xymf+VNHu4lcRinuvdQPU+ftUYofV9d75xdEkXKOaSDq7dx9wTHTesqqGF9W
         o6Y4kCY0znSvQofSReXOut1CN56o834Tvn1/4fd46i9110v3oLUCwDzrQm4ysnmqB43J
         xRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848313; x=1737453113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=kOIZb95IvTAWm+W1TE1y1wc4w4ew7AlTvgVspuSRcHBVcD7UEhq2u6LaNzmDTElaeh
         DyiRHX05J7dhxvsbDrDJeY66COInwkiFoELgvk0A2e73wEEjOtoP+bu9SPbmyIxYodfm
         upXzZuGt/5JMIjNnhfgD4YWFpnxt1V/91y4Xc43BNXre5i6GeGyeNJ0EiQZ3/vkCfG3Z
         QrC2vUxubB6jnupulAQ1GDiHShzMiVnTCf0Y8+myQlDKaWejSI00xqSVhAN9bz0xOGri
         JFkOJGURgD/FEs5RiPzZqsuLOzvzHOKF0zUSPIUPoAb/gPL4sX8VUvH4Ty2U+UL1RGeX
         lSzA==
X-Forwarded-Encrypted: i=1; AJvYcCVIX4Q4VgDT1pF44t9pm4icsvOgtj2/uXt9JM4iEa2hG57Nza/TnPmYn65bVQe18WOnf2yNO0OY4Wt5@vger.kernel.org, AJvYcCVqEU+ghPnrsmb7Fg1JGh77XpuRngP/0rRcQfe6D/sz0PopajzVK06FC3XlICc4KTkw93EsbueMeTp1JQUd@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQ2WAWsmjnOkTPcS+Ex5M7LM79Wr5HqIwAOcy6HRPyFa4h+Hq
	H3kq1reBxFsN566+G40VufsBuNHueEs1zVonLwUXu0DqO/8E9hm+VoKgWL79OftMcXQSiP4CGt5
	fFRs5CUWTgPG5mpQmOyVU+qmUrY8=
X-Gm-Gg: ASbGncs33yrwSERVr3gAdkZgxW5YcpqTcy2URDAyY9tymcifPA3tyak1epL82O6ygZF
	XvNFXGcWYGkg3MamkkMK+p+yfqCup/l2lQOm9dw==
X-Google-Smtp-Source: AGHT+IErJxrzE/fPLNIE9OFTXNlcCjKKB7eMnozUt0cKWjd3vc1cA5OjHKMV2NdK/m8kjackNKlo5HDJSzrjCAOUsv4=
X-Received: by 2002:a05:6402:4415:b0:5d0:abb8:7a3 with SMTP id
 4fb4d7f45d1cf-5d972e000c5mr61231608a12.6.1736848313193; Tue, 14 Jan 2025
 01:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:51:17 +0200
X-Gm-Features: AbW1kvaodGOQwkiNEnvsBKGVicOgrqCop4aPxft-hJqem49G8vNcWLLBKL5YFKM
Message-ID: <CAHp75Vf9HyLioEe+tN4VPMCMNveS1KODZSS3E7pH9a7hPyDLdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.

This one is good,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

