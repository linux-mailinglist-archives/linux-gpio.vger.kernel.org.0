Return-Path: <linux-gpio+bounces-12235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789759B3142
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DBA52826C4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8A21DA0EB;
	Mon, 28 Oct 2024 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EgDsCNGp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B71D6DAA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120584; cv=none; b=pVJUOIqMzg7W/PD4AKGyweFfDFZLJebZoWqnTuo1MUiqVmfuHZ+BefLvK5LWlKPprn36jqcOLYl5b2znxp9J+Gm/gGXWbxKPTJomMP7S/G+swuNk0+UeuukLe1bE4/flFHtealtleO4LWTkVXXnvarrQ+2lil62vvZ8x/HgBmbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120584; c=relaxed/simple;
	bh=ES/3wWXe3XmsnopHzfvpLs3+vjaLgh8prmQvw49/8v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKFH1j3Y3eRefZpjdP/Ryiq+tTd5wurxpTfEhxnu6da9lJ5ujlH/rooYpfUHto0R702LGyWIXbr0MqkfkV88VdSBZh+5ohRzWjlLlgrmWePL64qQj3XSXMmTEK/2tlwf4PnttouIo+J1ZCla+sPHHfp0ycQ/NzwumyD8YIS0DqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EgDsCNGp; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so36714701fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120581; x=1730725381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES/3wWXe3XmsnopHzfvpLs3+vjaLgh8prmQvw49/8v0=;
        b=EgDsCNGpBjySucdhf6url5lcqY2VvsJ1tjrlcuF3ZHgV7J9DvH07ylSxxO7rt75I4x
         9u4WYPNT+DpIO2IEyieH1mfwH5zksYXtXuepLqr7/246enqv/DlsfZWl+2rU3zOSmtGZ
         ANppRYoyuJcvMM6AoDxNHOGLbJeH+9SMfTsQ1qCV6DJ9HQ6lFWrPI7pQ2DTZ8KoKrMVu
         KjaHteNmF5hB5KihUbMPegFB0vnOvnIyOMw87kVLFFLIJZzAPr2ci16I1W5cITZ+RDDk
         e4XZEbvr3HsjQTI80n9dBxNvC4Rj7WpSHkeeeBaKjniWJzutouvv0JY5upE/6vHQH5QF
         i3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120581; x=1730725381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES/3wWXe3XmsnopHzfvpLs3+vjaLgh8prmQvw49/8v0=;
        b=w/25Y1zTElaMSZs3/IMs5wKZjtt9ebG+av4N4VktoPhlO6FaxtA7cGUKAs2a9oNYfN
         6PejJtDqLyD9X+FzjJFbM9+m7/ozG40UJU+pV+bQsm08lFPcT3uEag3XifYBC2oGvPwO
         ctP1n8zmWAx1kO/7uRVv6H3sqnEIWXaV5xrvl84CRpddkLYSTZogWAZHksii9mPqLs3d
         J+PP/nm6lBwAgC8yJ3WIBaFCjgfizzMKNpCtzhMN3rqhZl6lBFoIAN1KhD1DHRLhpG7+
         NyqIj8Gsmu7FBhCrmy+nTqui+5v2xiV5SR/qhX0AzGRm9GQmLVqMNgyM1KZwFuBUR07c
         0fxg==
X-Forwarded-Encrypted: i=1; AJvYcCWXHqABaPMjpEbDSwpHKzeBopT3D9mwEYtKrXrSm4kAMSowvZ6et4QUIcsZhM2FQ6ffqBRreUjo8K2q@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1tmUn0r/4UkXx18GXOy/o5neYUmEQKyyfJ3qy+R+1lwr0Tam
	TnYFknnA6qPxWjUtfH991RoJp2JpliYhemEciKRNU1bc6+8GHEUBRo4EvgOy94hkDuL34XVzS2M
	6wJMuTapAMQZEELl5hv1sTJiceItAtj+lk8FKvQ==
X-Google-Smtp-Source: AGHT+IFQ2jWEabuLAHBA+snc2ktNpVjAxzzLMDX3og/hhpyaDNPJZ85//6hlPCUzYqpOHfjsDrUMI74wo85pww9rYsA=
X-Received: by 2002:a2e:381a:0:b0:2fb:3c16:a44a with SMTP id
 38308e7fff4ca-2fcbdfd85b8mr27232701fa.19.1730120580778; Mon, 28 Oct 2024
 06:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024064356.865055-1-inochiama@gmail.com> <20241024064356.865055-3-inochiama@gmail.com>
In-Reply-To: <20241024064356.865055-3-inochiama@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 14:02:49 +0100
Message-ID: <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 8:44=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:

> Add base driver for SG2042 SoC and pin definition.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

This driver is clearly duplicating a ton of code from pinctrl-cv18xx.c.

We have no interest in having to fix bugs in two places.

Please factor out the common code and use the same code
in the new driver if you can't make the new driver a simple
subdriver och pinctrl-cv18xx.c.

Yours,
Linus Walleij

