Return-Path: <linux-gpio+bounces-13087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948E9D19F4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 21:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079D11F22362
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 20:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DEC1E6DFF;
	Mon, 18 Nov 2024 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0EgTl3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2191E5020
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731963384; cv=none; b=NL1XR7eKWdBj5ItltpGrQdzO6XOYBmeGePVL4fW+RTgE5sFCx1jG4VOqkFVpedCsAflvH05N94OSR5Vg7YuGbrDbBS0DVPVc4e0RsaaIZof460BbyzZALGClbgkwHYR+3yuFfQ6tLF4IE76Y72lU5DbIzLF6pD73hjyBsyNfwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731963384; c=relaxed/simple;
	bh=ungsn3f8/dGSKSyUBpjU3yOgOagSqTfbI/z8PJup3NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkE16J9TC24Qij1k2eYDf49s1n5+LZ4no5jjeu+tGcDviapacG/mJGWvQ43BJw3Mc9Ied2EzDYnszFboXdU3Z7w5i9ho3a5owZjcWtUjNgjJfAUYgqATql5rtdenspfiCjbxHaT8L9A4MrCHrfL48wJdZ6rKJJTl121jERTDymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0EgTl3q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f1292a9bso263219e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 12:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731963381; x=1732568181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ungsn3f8/dGSKSyUBpjU3yOgOagSqTfbI/z8PJup3NI=;
        b=B0EgTl3qbS7cuYWbgybOgxl1Rb2LJyAccQeryYHbjAtNHsr1UwdQUWQbVpONPmabN9
         Zn2S3vdFWP/jqjFCBJR7zhlyiVdz19q8CxzI6wcZ3o9H+vwXYPlBzdVMq1nlSIjw8iTw
         fjk9s7WbCMHfXif2Y63ejBWs0lFeeMcbs636uDqcddtcBbyK7vYwBMFKDiSCw7xn25ey
         7QUynhpx7060U5EguPdOw8SM80oin7bZNha3V88u+ZUe/w+JvXFOrARjZq84a4mLjVPx
         aqkqkyjEPlw92gCb1AFEdNFJkLhF9AVR1dxc2Mc+piBwvLWYrCRzaxKvx3CvRJ+vgdHv
         vqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731963381; x=1732568181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ungsn3f8/dGSKSyUBpjU3yOgOagSqTfbI/z8PJup3NI=;
        b=w4mX+D6I0FRd8fksjA494mFNzuTsYGXRdLduwidSyuxrfKP8wcIZQvowDiim1GJlb/
         j15hVo8TuYKPrMHL9RYKg4SzuyY97vIAJFSsacV33dbs9wfVWFsCEdle47+/Ze6jk0o6
         iXu5ffnu3n7v6NzzQytUhiJnkUIxnqILkNUhnyILsToK/+oa2XcX2ArSVcvMGKSxJnVJ
         o5FHL+5RZAs8puA6msyB3b0Iy3tKq55Iw8x8OWh+MfXwTLHfkSl69WFy5vW9/VtzXDxl
         yiRMnep9GpownSP0GddcmZlZ3GObIM/shDaBGI7Z0t2Hy8pULlf7ud5ZLFqrvxs5wB59
         utPA==
X-Gm-Message-State: AOJu0YxOaZ81YX9EuWVNJ5zPRF8ZqhLYza0K8dqk6WB9su9nU9OlOCs2
	xAQKwQKqjl16lcUSLklyPRWgq1OtHeRjcoBZkfu/Cl6Ed6Anqk0iomddZZtGOKQ+rlexBqXyXSW
	5aP+Et+T5kEZKzeDbmigvTL6lS+D0YjFjyKrSkNoJUS5WSck5
X-Google-Smtp-Source: AGHT+IE5OdhKXuCh58Mqv4p1qJzmEnzQXakg8UJU6KGo30C3j9D1Doc5fsgG1JzjlFj3maLKmuS7KbwwvmXI9w/Max8=
X-Received: by 2002:a05:651c:1543:b0:2fc:b10c:df4 with SMTP id
 38308e7fff4ca-2ff6093369fmr56865951fa.20.1731963381090; Mon, 18 Nov 2024
 12:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-ramble-blaspheme-b303dbf37271@spud> <20241113-jovial-atlantic-cd07f05eb2e5@spud>
In-Reply-To: <20241113-jovial-atlantic-cd07f05eb2e5@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 21:56:10 +0100
Message-ID: <CACRpkdbF0sqg1Q_qxFn5zz1rFn7VN9x_mmpMPt=YS81vazJe1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add CoreGPIO support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 1:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> coreGPIO, which the "hard" core in PolarFire SoC is based on, has
> different offsets for inp/outp. Add some match_data handling to account
> for the differences.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks like a solid patch to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

