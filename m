Return-Path: <linux-gpio+bounces-27421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03652BFAB23
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B0D8502D4E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7082FDC5C;
	Wed, 22 Oct 2025 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABypplDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCE2FDC3D
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119560; cv=none; b=FhVxQcnVEWQQDjvZyBQ4z6W65vqMJMAFtwId8EvNIb4zlFinKC865kdseYA8Ud3k2k+N35Ef4iLbCcz65c/98rmB9lNPQdZJc6oP24Ongp0y3DqFqDA/NQjKeumFnag3nMMoZkiJc/o5bZ3DSWg5UEjOO+LL0Zt58Kx8DkT4ko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119560; c=relaxed/simple;
	bh=A854G8Q+az7SMF928a56CKf41JBBm3BPM7QWQ64soKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcAD/5CTtc/S8ZUaSlJ2QH99NZhp/c1iTkf6/gg1COpog7eZos+wCHSNxOtnSx1NuiShAi1baor5gMXTAAZJbN3nD+zk+GqAzupZ4cWbx6+jaipIrNoOHPbQImxVHgFDIjWr9TD7c9UZtgfVOSUBW77CuWCRVibavGFy10A3OAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABypplDr; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78487b0960bso43309077b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761119558; x=1761724358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SQfEz/e2hOwh+iWueKx4wWRyZ4LmWDiG7JhS1t4UW0=;
        b=ABypplDrXNLD4T/kKJ8lfRsP5bAAtauYUpcOOjCU4U3BaAiZ48Ob/t0wWVC7nYxEqn
         iO3duOiuHQEF319w8UeJEZq1xDYgqXT9br+tNIMGrE8Tga8g472DY7QJxLbRD7B4v1SU
         oQIaIAtfPyzCkFpqqg2iUvqNk/H8ul9rN8XyMG/C68CxTwiwpLnXxIsayJidKNrtEonr
         Zcgd6d8LiJGfXl4kcyDR6bup4+G2WIfhnOUaKzewBr2XXA+isVqLHN6aXbFtEaipwaGS
         fswA7EXWHRQm4e0MWaLN8oivQjea9CRMHOdz/AqyIxgEBpDj0gkQ2T11DjxEI3jGsm8O
         bqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761119558; x=1761724358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SQfEz/e2hOwh+iWueKx4wWRyZ4LmWDiG7JhS1t4UW0=;
        b=JcoCq4ImkACzVDyDCGb86bjPhTQ6xQjPYnExFGCiesGjnMu8otNbeeXGOY6Pd2E6wG
         PTsWq4gZ1yeMoqO5AhEJD+pxKuOhpUV84eYeilKORLwcKy0l5ZBnIp8r+SwJLlqvf6Hw
         ZQTH/hNkG1fYFXuRRAYZ5I9BxRYez6uXoR6ERqWPShed2uR32VANrMbBfROPfhBFvSHh
         j/ZbDm9KQah2UkDNwyFOeU43ETdaiBB1JgP5pYBd2xxHtaYH1dbwtJyTMg0SSTcV+QeN
         mqmOQs8qKEMRUkNax3l1fgo/6t9wx/Gr4mOcINlAER882S7Z+WYcXtwMqrEedWCWvFqy
         e2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCg9cG+pdL+KEPS5a4Xv3KMM1rUMiGqAAeyD5V/Ac8nX8jR3BPQoT1hBdFp7sarJJRtY75ePEvE3Z6@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwBD3XIbcLf/qiLSlTHz0mhob8O1htovjTJXvyDQoJPizYVAb
	wqfbWCylHEOSEVJGLU1pGH2X8QGFmjnxPNvrmtYz3u6kV33E/fDqziVf4xHBu6bdFlSmBLJSYT2
	OuBfS0I8rQIS7yCC8EsorKAwoduxmzyZ7zGa6oJFY7Q==
X-Gm-Gg: ASbGncsmWkwkV482Y22spHCyktHn8NNDdJcxBM7GSEtzflo43WpOxKRXR8tI3bmrPe+
	YirxMCeGiXVbMZV0HFACC2mVmBk6+/U1bOMRLbapy4w0Vxdnvn5xjMJy2Tz7y2iGMEKLtKfeqdO
	pAvlTY4l9DEx2YXsbvKoWSXkIN3BEEVxXBC5xeOtLQLgBe0klflaTkPARmRbqtHjVQSbzSffTlI
	KNNuwOgVn+qf5iPaDparfB4mxqxFWfPriSAymcIJrC7D5MCnsVnmDMm/6fdZ59KZ9+UK3w=
X-Google-Smtp-Source: AGHT+IGOnPQWJDBN6sjrOxFjPZZTij/Niq/8Rg21Q+EknYQnuJrFX6ATSFspu4lRM1YW7AwwhMSNREKhsGRl4TKmTgw=
X-Received: by 2002:a05:690e:4008:b0:63e:1ee2:eb0a with SMTP id
 956f58d0204a3-63e1ee2ecb5mr12241395d50.26.1761119557691; Wed, 22 Oct 2025
 00:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021142407.307753-1-sander@svanheule.net> <20251021142407.307753-7-sander@svanheule.net>
 <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
In-Reply-To: <CACRpkdYde+=85f6Zfz40bMwOxSE-bszHzvBhQwC+G-E2CZr3Lg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Oct 2025 09:52:25 +0200
X-Gm-Features: AS18NWChHJVKsQEprXAlHgw_Y74ygS-pAN-Cj80aJrWmlHy4f-JX2hUVSzNGAmI
Message-ID: <CACRpkdazC7KC7HUZTkN-QqjuWXaJKLQrXfC30=GKUOymfpVJTQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Replying to self:

On Wed, Oct 22, 2025 at 9:42=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> >  drivers/pinctrl/pinctrl-rtl8231.c | 538 ++++++++++++++++++++++++++++++
>
> Should we put the driver in
> drivers/pinctrl/realtek/*?

This is because these are SoC drivers and this is an MFD
expander, right. Keep it where it is!

Sorry for the noise.

This driver is finished.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

