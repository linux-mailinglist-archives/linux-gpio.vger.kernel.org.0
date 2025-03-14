Return-Path: <linux-gpio+bounces-17601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5AA60E47
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3743BB771
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F7C1F4168;
	Fri, 14 Mar 2025 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMvRlNSR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E51F236B
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947002; cv=none; b=s63bqEKHrknd2s3ikpq5XrXfL5WrV0dXZpIByXxEhsL0LeUNX/uAdxTpcxM1U/NhM9lC6C0SUBC9a2q5chqzm1ngFFYRk44KAbuaycdEn0D79fnFU4idKzJorj1f0OPZbZ+KEuYMbkKPIlHXUDgpsRueyXHgv+SBBzhNgyj17Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947002; c=relaxed/simple;
	bh=F3QwSaOPn4NwdpjOAOVwEiWSgBjE3j5kJgQ1IacYcXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrS8n8uwmKr1YMEdW71YLwgaGzzMwkkErk/TZ/Kkq0COr+RHlh6jmHsMFBozhpz4HW87zWD0hIOS28mMFwFQjvGe+3UFMZNgXDzp63e3E+HD/otAvdroRJ0QTKZjDVNrgoXCdbWIs6fnyJeeZGzUkL3AsMV3vGOxZTUoVr9SQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vMvRlNSR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1667075e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946998; x=1742551798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3QwSaOPn4NwdpjOAOVwEiWSgBjE3j5kJgQ1IacYcXQ=;
        b=vMvRlNSRybt06OEqO2onyHpbcReeoNwkoLuEKZpGLy4mjMscf5oSBND5xQBhBHbDNl
         vmheRhdmFSSG2teh3O5TV5pV8atwgWrT46KzM4YEx2X4SGrzPJ7qm+P4VDi3iTjbMPBU
         bV6hyIK+8DgNcvlokQWVlSd6xsi/AcEgh7AOpFB4mbO6IgkYRiJkXmXGG/b3OfpPn5EA
         HmL7JLcbKXOycwY9wPSEbKbanbHro10yE6WFRHTIN9eZsDr7AdcQMsskDkDJZXq1rguE
         HNgI3DYUp2dUzCwx9GpQNvfJGAxdBWdJz4jTUopQNjzJxK8Xez451dlvJ4fD+PZUJAFf
         ZUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946998; x=1742551798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3QwSaOPn4NwdpjOAOVwEiWSgBjE3j5kJgQ1IacYcXQ=;
        b=E3v9wz/qQ35pxIbCvLj0JF+z4IZWYWNQ2bFejFFszPKtz8QNdm0SWWVsAMD7JBTbVT
         C0xWrm5BmNpt3zoIA69Yx7/AD8QxZVOgC5lnuGJdXyQxoGjViLJDg/cHo14JBJQFehfo
         2PkmWVQeROKgiOHcARdZ7c4jIEmuMCWrYbS7n5vFG/CBWC7uC50qQe+UoVOVkLgE8qyi
         NqoMelktkB5OsCZilw3/IELW+XF6Z/c8HytwyDI7X6PK7Re+QG23AOPGPtMD/tCMGqSI
         FEH8QtTr2tLgNYmBcx2InpiT4wwcDsIbkEYqbSWfidgNmcU8eTLewDlOLNPy3dgKoVf/
         eHFg==
X-Gm-Message-State: AOJu0YyZDm0+6/HseOqS4dKEYHBFwTsb4tcXARdgi/x0DODyK8z869IG
	NxXzkoMkCF1e6zqAjmwwf+sSUD433eCIDGml98ZTdJmIdzstSHNx8e6armG3daEtlXsDQ4uBIyo
	Xmsm85xusG3LQ+Wh8qIsf1/+pLhy26bGO5/+Lkg==
X-Gm-Gg: ASbGncvxo69oomZjjZwEXPO+d89sbyIu2722FA5A6pz3a/zega81Ho/4sdjmvZ/c61m
	cgrIYgdFwWiTjGxLOL7UukrHZlZrm0vyTCHmcVjkss/LiKTPFBceGD+cz2GSPz0vmEqJ9iGXRix
	iu7VUpQ4JhfCUIt83ZPKm/2ic=
X-Google-Smtp-Source: AGHT+IHWZgatLb9be58bX1kAFaSMI3XCjBwP8ffBHWAjyjPzK2hyikNCVCKRoFCJ+xUKiT8q/BOt0J1QEJRYD+AZIzo=
X-Received: by 2002:a05:6512:2253:b0:549:66d8:a1cf with SMTP id
 2adb3069b0e04-549c391579fmr692987e87.26.1741946998470; Fri, 14 Mar 2025
 03:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org> <20250306-gpiochip-set-conversion-v2-2-a76e72e21425@linaro.org>
In-Reply-To: <20250306-gpiochip-set-conversion-v2-2-a76e72e21425@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:09:47 +0100
X-Gm-Features: AQ5f1JriqAfqOJFz5ou2RRXjd3t0u5tQymQhYlfYdiGbAICVLT-0grjJh4muUZo
Message-ID: <CACRpkdY5YopPADvf-s-7Ggh_pPbz-tKH+0w4-R-LQBt+h6Skjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: adnp: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 6:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

