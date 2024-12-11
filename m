Return-Path: <linux-gpio+bounces-13757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4289ECF70
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D09188647F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05C919DF9A;
	Wed, 11 Dec 2024 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H0eTi/Hh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362E139CFF
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929924; cv=none; b=OXRCP9XzFrGuN/dfC42RV3G5pDK0Imb/jNyy50VbrzWKYChqvs1lFyEE+vcIkp6sbOdqDg6u6ux4w3T9jyYuzKDU8oMxCHrArstEsnAL//EJRGXS/+FaDSFcCeBXKeZ/DnE5Yb3e82K+a4WCWy6hzPP747RD19FiprAqgFMqV14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929924; c=relaxed/simple;
	bh=/fbSKmNg2u+Y4UnSPAfvQRzSqmMlOyu+5kS5NYWq6hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OO/MUs9VWs4udpgNpdYJ5p3DVDHVY4csxHbzENH8lJmAg4vLtt+WX1vNBAOcXJ2VRLBjYNqMecUCZ6xf50fCjKxzGkXzYJDXpTUpJoJF4JEzQpeCp2p08zPS0v6ekAa4Zhw8FTf2D1EaDb5t99zkwihJmDxSxcrGuPI9DnhMCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H0eTi/Hh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003943288bso51769941fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 07:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733929920; x=1734534720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DkasB+WpYyiIPsHiP3HzywtShV9peIAKRCRE8C07g4=;
        b=H0eTi/HhWsapKLrCrEGK5R1yIKPYIrXkbSsxvVbHtmmTBd67nwXXeowtE6BroK2PyZ
         /N/XsNUc8VfixgINoda5KtLWpOp4MGi3tbDBDlgPtyFkG4vnUzBweVeKoD++tct1ilFr
         QknYgOZc13JfDhE10xPBREZsxa8MT3x9R9Ef0p0ZqEn1VEuQeqxnnyIwEyx+EcxyKxZR
         MrtGxuQTNXcAk9XvsUmuYSg+h3JDZOolJ5RsdV0y9YDiN/JWVS2/DMDvbztBrYVSHIS5
         MIz38b5ePchtXDwhDNBevDeNs7y8bXIRVQYZyJT9nxrGGJMkQwZp/rNwgsNv7Qar6NIG
         A7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733929920; x=1734534720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DkasB+WpYyiIPsHiP3HzywtShV9peIAKRCRE8C07g4=;
        b=cyojaYnzIhJ2S2DVqY4szZy2p1NwS85CuYD4ro/G+5qsj0VpYkyALRz9Lf6hN8tOul
         JvleL/qyrI5Y/zMOObifiXGGLG+WdAI7wySNX0opX7emGLhjofr6NUY02P1ZNveBWxzk
         Zi1e/GZDWGt5moKMjZ6FN1J+vRNZELOC6BzIJyRsw294WgSgvjyCQ12lRS8dXjzb8y4G
         3Z9F0Az802hcAg8AWOHC6HJpuHKNTtFjC2def3hts0DYZcu4vU7ZjGcpow2mb/bE5nWK
         ZKIICzAm2jwVPbX6lGfGHTiwzjWu+1CqAbQ+1wKVjryUo6oR3VvRLg1bRJgkrU3uXhr/
         H7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVMw/ZV4dZ0uQTGQ9iy1/6zKpzFhXRWIwnme1GR7DNMoXe+783kDZvw/eOLloaXzjtp/mKg2KGphXcl@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdPZjA5RVFx9E/RY8SIYKgnFOU1s5hYmiE71XErrF44DAYFaG
	jkJTZ+eyNAKNm8ogcA/oiLrpS5bHKTOYZu/WEustE4qLT00S/HVv1SD0aWgfGEOtSHyI7mO+RB8
	mzktbRCUV3Xior2IavhG8u5lG8yKA3Xk+YyCyUg==
X-Gm-Gg: ASbGncuUzHHsmuPXDojiD6Xoruc0bvVdT638FoV+8lg2xcjU/i2yOqfp8BQY75T4mVu
	VnNJ+h/vbosVcVDroaibaZmKArCGGyTXuUjAdYOkmVrDIh1dGu8juWU4fFbpygNTAUpU=
X-Google-Smtp-Source: AGHT+IGszQqaB3fBa9w6UmnSUZco72wFv/6k1127oe+o2ZL4zElM2PbP0pKWNsQUi3nGqynG26NjsN93L+GvnT+S6vY=
X-Received: by 2002:a2e:bc27:0:b0:300:34b2:f8a3 with SMTP id
 38308e7fff4ca-30240d088famr11276841fa.13.1733929920342; Wed, 11 Dec 2024
 07:12:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com> <fba6114b73634d0327d5d34a0634d3b500aab059.1733739697.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <fba6114b73634d0327d5d34a0634d3b500aab059.1733739697.git.matthias.schiffer@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 16:11:49 +0100
Message-ID: <CAMRc=MdDdkoMpd+pAJGTC1bMpNVb8D__5KGcxYK=OmOEP-C-Dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: tqmx86: add macros for interrupt configuration
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> We now consistently use TQMX86_INT_* flags for irq_type values. The
> TQMX86_GPII_CONFIG macro is used to convert from TQMX86_INT_TRIG_*
> flags to GPII register values. Bit patterns for TQMX86_INT_* are chosen
> to make this conversion as simple as possible.
>

Please use imperative clause in commit messages. Prefer "Consistently
use..." over "We now do this".

> No functional change intended.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/gpio/gpio-tqmx86.c | 43 ++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 5e26eb3adabbf..667cb34b882f0 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -29,18 +29,21 @@
>  #define TQMX86_GPIIC   3       /* GPI Interrupt Configuration Register *=
/
>  #define TQMX86_GPIIS   4       /* GPI Interrupt Status Register */
>
> -#define TQMX86_GPII_NONE       0
> -#define TQMX86_GPII_FALLING    BIT(0)
> -#define TQMX86_GPII_RISING     BIT(1)
> -/* Stored in irq_type as a trigger type, but not actually valid as a reg=
ister
> - * value, so the name doesn't use "GPII"
> +/* NONE, FALLING and RISING use the same bit patterns that can be progra=
mmed to
> + * the GPII register (after passing them to the TQMX86_GPII_ macros to s=
hift
> + * them to the right position)
>   */

If you're changing this, can you switch to using the preferred:

/*
 * foo
 */

pattern? Checkpatch should have warned you about this.

Looks good otherwise.

Bart

