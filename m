Return-Path: <linux-gpio+bounces-17606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F6A60F0B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE6C1B61A39
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F731F1312;
	Fri, 14 Mar 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+42rafU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F951DDA33
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948402; cv=none; b=lGNvnNFsO+jVLm7Xd1yvgRa35IXMEn59O9mtAr/dYBi4JEb+S7K8oewr0nhGSnDEE8SqOPYvBpA09VJdUGhIXsf9yUuFfJF+41k1XJw9lJDV/tNr386rG6VSmIjMYiB5W3gM6AP4PFvzYw+m5vqoDvjycWB9S7QdrT1rp9j1E3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948402; c=relaxed/simple;
	bh=8jDwQMECFixq9MaG68bBgH3KZBs3RcUZfE5f7etKyzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twk5YzEZUWAKhTeO/0VnbHEgXI5CIllByJOtrc2CWRIZuSgrqTJQSQoox3rvrueJ4QY0pdYG/oZehraiWB40XPMMRfwJls9zhOY0qpWOo6sZulDma//5pITvm6TSLlqoYK26za5/jXZCBgPei9eMLWN3NMFkMWhTa7HgAknoA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+42rafU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54998f865b8so1720470e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948398; x=1742553198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jDwQMECFixq9MaG68bBgH3KZBs3RcUZfE5f7etKyzw=;
        b=U+42rafUbi2dJhbHiZe+O3pvrYyoR7pKuvSZwkZNCyMP3u5E4zrxMJA+VFrmGaYV7f
         Fmham0BkBBD26A/f/LiTy/a+uD27W7HjEO9ok5yrT/FeQzY0wWczbNptSf+PL8XiGXqQ
         NUvgMKMm84q3fEEb5llBJZQA1GRcGhJ8G418umdPRozgbK/sR4Xf+5qjUIDtSPEgwVeY
         g/JG+iB0Q4RCXz1Rc/i2jv77jGDF53WTywriSxTAcjCxYb5Vz8TDqZiqNdvFiOJivVl4
         1R+2cPgZ8robNBOGfjqCiRxyP2Qulx5vEmWa0yqQ9bn18qFlJgzytvUJ303sajp6DvT9
         e5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948398; x=1742553198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jDwQMECFixq9MaG68bBgH3KZBs3RcUZfE5f7etKyzw=;
        b=Fc6XfECk2xsHZ+62dTgS7Lx6dPT/9ZCcClnrqnPsmrJQMb4C2xhgdNAIj3q+v0MGGs
         KYVmj23VFQs5MXbesZiCeRnLwrDNgmv2rj+fO/VqlyRqBFk+ZoPq+PMmbCIW3I8qfaVM
         BOqVI6+NT9UPJYZ/0xPiHYXAnWOcsrQ3NQ7mrHNF463Um71uTMJidnazipLDMpxyz627
         GB/yUz2CyK/rEKjRge+yyc99GfwS4n7QJM67x+t4heGLuw2/upNfUlZ610CuVRKXR5Ul
         SDBIu2yEF1fUK2u8V4WsFx4D/iPX7dVP8vJ8Pe8T+nfv/jPaPoLr5PllebLjDqT10nhI
         QnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvj7u+tlKAjtYIOpOPiqlztm5OvEFImlRIPggthc4ZRJrZqNQAfpCpSM0bsgg3VeeTCnzUxt0/WwcS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/32yqpKOYp8cxWR72dxFPFKi28nQ+pVw5Km9B9zR+ETCzMNZ+
	TCxwUOubS1yn/+9abts7zgGzrinzYs39IHlV2vSl3ugr/2OwqzL01jcDiAHQbvX04KindeTSQIr
	4trNX2QlHGLzUJuBBHSkd6G2p9aNnQDbZ3rEfQt7I+HArSrlbB6c=
X-Gm-Gg: ASbGncuX7Efzo2Rq455Toi3SJxp8LUBpEnuIdoOm//6cb8MWCFrSjHqUoKcgJM0dIsI
	jjHK282jkcPXLqjZcFu6rld+wfzKVyg+tmj+BMOTwRUT/L2sv8OxHTuEiX3oyoQpJFIOVBQxXqA
	iUTH1Mpp7qeAxxOBCInDedbIw=
X-Google-Smtp-Source: AGHT+IGtqk2ik/CPpDc90bj+smq95l82Bzc6EWenGi5B2VmayKFtrsLwXbMyd14GNPNzK/DKOBVpCH1Aaby9BEky7GA=
X-Received: by 2002:a05:6512:3b0a:b0:549:57ae:ab44 with SMTP id
 2adb3069b0e04-549c390adc7mr632860e87.26.1741948398166; Fri, 14 Mar 2025
 03:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
In-Reply-To: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:33:06 +0100
X-Gm-Features: AQ5f1JrKBbyLL78LSKIMxNtypSjTHWlWYVSHLg-a2lppZ0MT75HoAlTpAVlGExk
Message-ID: <CACRpkdYujYhF8VP-_6O4Bt2tWL-NO-GgQPr=DeqE9QwCq12gqg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some drivers as well as the character device and sysfs code check
> whether the line actually is in output mode before allowing the user to
> set a value.
>
> However, GPIO value setters now return integer values and can indicate
> failures. This allows us to move these checks into the core code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Makes sense, if there are regressions let's smoke them out
in linux-next.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

