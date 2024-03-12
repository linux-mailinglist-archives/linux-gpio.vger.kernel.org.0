Return-Path: <linux-gpio+bounces-4257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD3879356
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 12:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E7C1F21C17
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Mar 2024 11:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69E979DBB;
	Tue, 12 Mar 2024 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZENlQaD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C3C79DA6
	for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244377; cv=none; b=IWoteKvW+jJ+NjWPrYTlxJvPXuyDJezALkjagSQob4x/fImiOTJa5GT94Gn98hECxLWTOsGcBGtbpasZYYlQ3RWw+Tg51V4VF7Hxx6YFMRGTJ5Fqw5kiL8/d/PDG02ADyZLoaEQnVYuyYJjXcpY6y5Dphj0z80T/Uf63eAHguLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244377; c=relaxed/simple;
	bh=JWULMh7o9qtF+RsBiOf3B41hJfHZ1YtSIOHKt7eEqF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nX7CiAsEcoccgyNnZ5B6xBsFZt56xCKgGLmSQllGUzlb2muc/s7ztNGO02yJkMQVqIdIQ2WQd6faQPJD578ea7pmM/BnmIP8a718EIcbc0aeF4RqhD01cYcBMkliKkjVOCN31h6OEzuosGZAZaq7Vf2RscrBIGj1ddNR7HPu+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZENlQaD; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db3a09e96daso4607634276.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Mar 2024 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710244374; x=1710849174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYh9NgFiUlDSRFh0N6tnk2Yai7KZlV9KzVjtJmtqPwA=;
        b=yZENlQaDzlx/kvHDBhrtvkA4pnGAmJ+dTWbp/c6NJHi5zG5fb1aQWnofvuCtgwEoXx
         f526ph+FDmbKC6AiAadWwltrVIGGLNA5zMW9KJQM3nipF4ssFV2K2GGRwqPcouDt16Qu
         QLdkpSFfvRx52yqkWDMvfaaInDlwACBbbsu/4TEo7JLu1Ym2HruaiwAFw01S0KB9LQf5
         xZOGEgQB+VwyfwMzydkXkBQMaD2BkCMn9c1I8oMalsLNOh4F0u0dC/ONrWFX4HoGCqAx
         bn4Lx9X6HOiUiIJ2xUDI6yeLwR7YRPzRZd9WW9hsTWBofm6T+wU9qy7TUOP+JXfybLUe
         WkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244374; x=1710849174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYh9NgFiUlDSRFh0N6tnk2Yai7KZlV9KzVjtJmtqPwA=;
        b=CmRX2JdwnLl8liBUmtL4xZAkZSkjUNE8pFXOFw9X5thYHrZpBwzwSn1J6O11Ig5Xkf
         76+zvj6eKkstM2oyywc47wiHOqg/CHSYVYOM1n12VOtQ4Eqi1TPOby5KQ6qyubBLxFKV
         MfyIEJ5G5TS3QBfNEEezZP8M6Rs6xbOfYFfBfzLMQHtIwo1NKJGFvS7dsHRyALIzYjHf
         HgWaO1zZJ/61LFcZtRn+fniPObPSXRhJvhv2xF0FbJKq6r+OzzBLBCfVnLihfv295/aV
         /lC2bhXCVvlFrVgbdE3VsWa+EU+njtbvH+36fxXHHfcGPegAQcb+2VPgHzJJWPy9GEi7
         FZvw==
X-Forwarded-Encrypted: i=1; AJvYcCUptZOajzNJLOYCW3Y0Cri7PMoqMmCBHpQqMhjl8N6lr1r7xzUtM1GiOPhVsxQYcU1pvkvrTwxbjMv82E7ZXIC1bX4htnOEHOD7Bw==
X-Gm-Message-State: AOJu0Yw1LNwCiDSW/EZFKNMmMiQC6NF5szkFK4AZeg6RXKXGzlkljZ8/
	x57xFb9/Zgb4oF+WfnCDyAoUi+QuBf4nGG7gU/kna2tHxLXO1Wd7uZ4S93h7/tkkFq1FIHGo5Ti
	1bEg/WRwuFaCH7ZxBr5UOWwIqUbIZnjgR21SW3A==
X-Google-Smtp-Source: AGHT+IHM4+XkGrEr4TR1Ej4v7sv8rnNzednJ2Q7ydm5WMikNndCuOBWPz9jPurIvtRqHtOuQiNrGRxmNT6kHIFbRmWU=
X-Received: by 2002:a25:140b:0:b0:dbf:23cd:c05c with SMTP id
 11-20020a25140b000000b00dbf23cdc05cmr6527345ybu.13.1710244374125; Tue, 12 Mar
 2024 04:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
In-Reply-To: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Mar 2024 12:52:42 +0100
Message-ID: <CACRpkdYtiyHgvtPJYxq2BNb9UxthwPQPHyUddQ5Q1eat1NY4XQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: remove BUG_ON() in nmk_gpio_populate_chip()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 12:00=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> Using BUG_ON() is discouraged and also the check wasn't done early
> enough to prevent an out of bounds access.  Check earlier and return
> an error instead of calling BUG().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan, I applied the patch to the pin control tree since the
rest of the stuff is resting there and Bartosz already sent his pull
request.

Yours,
Linus Walleij

