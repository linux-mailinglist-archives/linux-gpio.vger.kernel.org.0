Return-Path: <linux-gpio+bounces-27030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A551BD2F9E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 14:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF735189B87A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA4E288C13;
	Mon, 13 Oct 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBMizyL0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A226E715
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358687; cv=none; b=nwjumPZuOBUpCID09pKoguPAeWMN1/OBW1LNUjUgmL+WEt7qwpJ4L+ENzdkZMo8/xnFVi6J+ucRKDMukbKZx3Os+76nc9NeiaSirFB47A+W/Bpywj5sMjDaHavJDyEBTp6pte95QkMbyXVzPLCKjUTjQpj2J7Wobuw/t72vbW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358687; c=relaxed/simple;
	bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4KnD9DzUqZkyrhWTfZNxwScFCdufN6pMVLSiKZ7xyQRkusD1LCobeYklnz3WkDq5EdEauv11zmYMZBb7Y3Ve2005g1Gj+ATIXFbgbaCxj3cPr+IGmxPMQD+3/9q3HkRJLcBJ7YPgXh5xDE+nW2jDAyJfk9oulesIdZyfhYsNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBMizyL0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59054fc6a45so921150e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760358682; x=1760963482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
        b=xBMizyL0Yx4d+8V+t9wiLgRPf4qBDuLUoSk7nAy7nMVbSgvUM5u6sVw6tdW+UOA0uK
         WTIaGuK/YSQkX5xE1xkspf5Xa8gbM1P603nTohLUMWTaU0PMp/DgUZhus22CfaPt2+cq
         MaKmkZjnlRhLwtqsnNMi4HYh65DKMhL2kdvMkZWR5+8nM2R43uU4zYwwP7QDgPtgaCZt
         V4c37OkRydHs1F+K5HSRt+HJ1Vy+0DzwIHxwv52ibtuVYlnQYN/npAviapyFAIy9L5fO
         UUOcOoLkdBzTFAHTy41/cG6VBDJzAkrOAI3lAnyueZY64p90rNQa/8q80sH8i4GYdrWa
         CB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358682; x=1760963482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ym5gY9xA9byPvmYe/LAnl2zuqmEeBpK22V+iVpRSl8=;
        b=GDUe3srpomHH6rKOtO0IHl7oDPyZ2gYXc5kGaNy3z4UoSrNLsLBA0ivYzthQvmzFZv
         n5NukRR/wCfpby0i/uppItH5gOcp2IYqvcSSmjI/ZiAak/AutCkVlbAwWtg8QQOKYy/Z
         DJQLteKrUnPVtdvtsHtFfzNjwBVDd96CcsPJlIca7ATBa/NZwPBl647KB05mhieoAV21
         NvuEa2Zd0D4DHNoKnPEIxjHwUXEUYEyhktsZf3CASxFc0B4UIA9aSZP5h2ZAYj6xob6K
         6XPiX+pKoNh5vM6aL2HHY6I6ilj9hBTxGOL7EpXeb/+a/uyCM/sonwbGAnDAdoaclCca
         xgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNT1YDkGvpzr1+gXGWn7jwRGpKezQFSpG9ZQCCjSomUH+RzYx+Qbnm/6oE8z7VtQKX5uYuA/4616jQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlsg29kULPry5V3wZmiCb1egT/DvAbbqUaoUoOmZHJAuQCdfuo
	C/keXg8MMYjnDOJfIMw8jYIs62dJbZqk6JQZfAHS1AalIfKpq1Vcq8CHYnmcjGSXmzfp+HYZfba
	IbbC19ZZpjAvMR34kfIltrKgQxTWOpF0DivCLqUeLTQ==
X-Gm-Gg: ASbGncvH6NTNJR/FcRuQ5q3HCX0Qt/acE7gxCWQbBe5nDuB3CwvBj4uNdjl0MgTPa4Y
	PhDmU2v1EYX0L8RDo+qSKBOzv9LGw5RPh9tOdrEEqxMCE27i7aYpGOTVILTO8gCuZ8Ks5upe/dC
	zJnc7ROcvmifEAOb3Y0Mitv5ct+NxGaDk2RzctFhwv+ang9QzPaTZz8+FBTp0AM6GiP7oEWL34t
	Bbm01/a/tq8olE/OXSweZlykAMF5A==
X-Google-Smtp-Source: AGHT+IFhwWUPdXGLE0UdPh1E3Z3kooNDTKBbQ5Xa5NjbLWLHkeWPvOb7Esb2TwKqbW3L7KgA6OggyzZuCUYLfacZ1yE=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19358931fa.5.1760358681978; Mon, 13 Oct 2025
 05:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <072180743039027b8476525bfb3d04b3dd044be1.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <072180743039027b8476525bfb3d04b3dd044be1.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:31:10 +0200
X-Gm-Features: AS18NWDff60qRd91QHkSir_vcs0VB7YoMwPxzCmgcXZWdg7IkB5T6vF1_imU3OI
Message-ID: <CACRpkdYZ_jdKZWEBbb5muJZkUfd=nh=j4ffQQEoDJuEjoGzLgw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/13] dt-bindings: Add trickle-charge upper limit
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:33=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> Some of the chargers for lithium-ion batteries use a trickle-charging as
> a first charging phase for very empty batteries, to "wake-up" the battery=
.
> Trickle-charging is a low current, constant current phase. After the
> voltage of the very empty battery has reached an upper limit for
> trickle charging, the pre-charge phase is started with a higher current.
>
> Allow defining the upper limit for trickle charging voltage, after which
> the charging should be changed to the pre-charging.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

This is good stuff.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

