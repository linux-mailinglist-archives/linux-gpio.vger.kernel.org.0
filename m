Return-Path: <linux-gpio+bounces-27341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01BBF4E1C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4223D1894996
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F34527466D;
	Tue, 21 Oct 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b8z9VVcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C2271441
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030831; cv=none; b=WkJ+qyFFWwNXPeFd/ePP3+KEwpgxts1c4P9sdf4sOOx/vdr8tjE1ySRB7SQUgYRe5Y8VYByED8nOdZyDfMLQlXPEa9f7X2XtTgOdHXl1YwW2vA3ZT7bhUJJiwNMOB9Br7hnTu9wwQGfyodJp2neQwanWoeVtqCyKZTkw1lnU7qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030831; c=relaxed/simple;
	bh=shnocEozDkLvjkbbYpfPCYmb3LZ8IOs5v0zgxrtXZUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRwp1ScNC52PE2LhKVG1qEuh8/KrKqfI5QFGM6eP1mOZvu/0XJow0+28cv74IbiV92cIVMimjcmXOKzy1aasbRvyFMNzLaU3xo4Bq6BkiyWH6soR/TWpmiZvYqfxwYXIAAn1WN7tvzF/wGg8b+DxVYqba8+ke8iz4K46m1hFpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b8z9VVcO; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3778144a440so61960301fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761030827; x=1761635627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuafyjGQlDm3fykSpNADHjSfG+tYdvPkfZzAXtiw/Co=;
        b=b8z9VVcOmmTUtezm8NH6uyAlUgkYd3nhzDiMQfBc/a998Q55CuP4YskghZ3rr4OyPp
         VvvPx+pfflk55QdmUM0iHBu3FCkLjWVluHP+tDFR9iJpGREP6ViN392s37StstEM2285
         aWbrzFcrCfPqB5peC7ChUkk5UkIgR1pfiAasAALOD571jgXg1THRB7ij65LHN8glO/Dp
         MIQQ3DIXB4onaD8yTFFNoaLaW2kReUXR/rDBqQ5ate2w7NQFDtfy//w2Icphk8eXkDtb
         iA1wla7kmHEZSEjcNzt/14DmXufVALtH4WUZ0gceiTCl7zwnWmL2sb9flC98dsNwsiqB
         x9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030827; x=1761635627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuafyjGQlDm3fykSpNADHjSfG+tYdvPkfZzAXtiw/Co=;
        b=T6af4muppR3l/tWvs8pudB63STOC2+G5Hdo+MpQYv2b9OqFe8pZVfCwlbTchAbWdc8
         6uWsAyU9iMDTuHJgxEUE4LloBVijXycaVxtCYlHC/yR4MIzsYU2jdOuG2Kogde4Zcu8v
         SP8dnOyaJZvtuF+X3j4C8Rdt4pdSGLI2smpPYOAXN4DUW1JRjrt45aXcmmmiuyfiFrET
         w1gsO1y0TV4ykXWC0jBrPiB8Ij14im85/A79kKlL4GSvVW1LeRQeH1K1iYajiHvxXuNE
         DU25Pgd6j1YWjyQOtXyqRIrX1fTJKxyp4G/laT4q460A84Ny1DPUNSSS8YebJa32YSeT
         aRIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7LkuMvO7l6ntTVsA8N8ER6iG3W5RoctyK8fC7efRbLm6D3LEXn6ws2PvrVtOTCX6Kj/e8vQKflHve@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjauKoLLeekiA1jlv+kwcuGkvRb8nWF1rG1F0eAAqwuYnGS3H
	qvUGpK3Nn9CKc8KaN7HnHWOnaCxlEq+R7qZZo7fK4vmjxkoQMkyE26Z4qT9YJYo0gK2mZBav3zk
	83S7oEHaUOr18oyd/dO+3sU2Rcb8jYz3TG35BpYPNrw==
X-Gm-Gg: ASbGncuOsF3SjUVZMq+nRertW4eXua8rcKzBO/tUumUMFgHFnepQZP/D0uR4hb/lQhC
	2zBuUwdHX9SiSwDRFiqKj4v0IAyLw4ydGckIl8B/BUVQe1fwxgNM1O9rrBCSGSE5B2/kDeuLFiz
	Sd92aAKCG1BpEdgOqAbnweirGrmVPjOQYfJCrG27qkrxGyHNTHC7lFDMzcWKBkyLZoT31ixIU35
	beCxGMnovMmnx+cHrI17NFPW96vPY3wTr9E1bQ7Cfg7PidFHTNUsg9BrfpRMw1UJdb4kcs=
X-Google-Smtp-Source: AGHT+IFXewE5inD7CgvvKJbWyXxMNEGciqb/dhdvor+BMXV8b4ojerJafcr1lFElVmRq6Yah9RSUyGHsXMPY7mK9Yhs=
X-Received: by 2002:a05:651c:1118:10b0:376:2802:84c2 with SMTP id
 38308e7fff4ca-377822498eemr50953931fa.23.1761030827133; Tue, 21 Oct 2025
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com>
In-Reply-To: <20251020080648.13452-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 09:13:36 +0200
X-Gm-Features: AS18NWCX83cFiM9B--nMGIfUIvsXguic5HJGZGgd7PDtP7ogZyhxvv6xui0ko10
Message-ID: <CACRpkdYwG_rQn7eF9QNfApo+h-BGuC8Q_nPyeAKvcuUh+Bf=Xg@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Mon, Oct 20, 2025 at 10:07=E2=80=AFAM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:

> The first patches in this series are related to a new helper introduced
> to parse an interrupt-map property.
>   - patch 1: Introduce the helper (for_each_of_imap_item)
>   - patch 2: Add a unittest for the new helper
>   - patch 3 and 4: convert existing drivers to use this new helper
>
> Patch 5 adds support for GPIO (device-tree description)
>
> The last patches (6, 7 and 8) of the series are related to GPIO
> interrupts and GPIO IRQ multiplexer.
>
> In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.
>
> This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
> available to wire them to the GIC input lines.

I had my worries about the multiplexer but seeing the whole picture
and the nice refactoring with for_each_of_imap_item() I have to
say the patch series looks very nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

