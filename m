Return-Path: <linux-gpio+bounces-17736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E413CA67497
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 14:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A801890834
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 13:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC5A20C494;
	Tue, 18 Mar 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdkv8eDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0832080C8
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303553; cv=none; b=EE9p8b/1gX2gk7dq+7SMU6ZzfNBLXcXUU3cApYoaf/zE6R8u3zvHz8rppTG34992qA3GwVnufWHAs7FEKdxwSkhZkvMWz/sIXIqLNe5RnL+20j7iXpJRarwC6UY+f5oAu+Fw/NPOql8rMwbGuSJYRNPYtTG1Zerh1oJf+iILxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303553; c=relaxed/simple;
	bh=m+JW0GxcOfEbsGUMfY3A4UKcwqPXUPjKGZHsNwYr1cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq4oYuEQze2b3YRLvGDcoFbFiYWu6FszLlXV20lzudk4HSY6VxNxjVnPdsxaJPzl2HmnyQLSh8LfDZuIh7tuLM5A0AKUhLK2OQ85yAVnvDPDS61vfnEOVr9YwxoZGYuo7TwW0yDaoeL4M6mMC2V4CIWpl850Rp8vS5VYX2JRRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdkv8eDJ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-547bcef2f96so6247607e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742303549; x=1742908349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+JW0GxcOfEbsGUMfY3A4UKcwqPXUPjKGZHsNwYr1cc=;
        b=sdkv8eDJhwZeRpMV5aMTB94I8+zdACtCEeOGDTcPh4byCH+J1VNCso0V3HGRLGnTBw
         MBSiu1ICGRbJaMNKEeH2RUmqEgVzzrBhrpMI3R10RcFWv6J4yM5bGVD/pKQIJRRrdViZ
         FxgBcfhfEfIFpfWMuB5zlrVjURPChTBiJPZSqNskZcd7wOa9C5cSUy/6/3uvuR+bJ/As
         lFqC8Fxi4vKUSV2nF6mS6hyvdqY4tKWx1v4k6EkEARgITOktR79I5Yxya/wICtkZWXkl
         H7p/c4fmHEqYGRdqrG5boWEVosBAa+DvWwr2WD5x3ZpuZgJcxpyr7iynmUQWyOW8UKo0
         sxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303549; x=1742908349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+JW0GxcOfEbsGUMfY3A4UKcwqPXUPjKGZHsNwYr1cc=;
        b=VkXE8AO5IOV4nL0Xnf/fiCOuHAcdEZl/8bZxiCnzaQQncYqS1gI3bbB2tgLMU73UwO
         y0JIeErvFEbfNHJtNEkOLfQV9D9p9GYf+EesKE0gPb/oO3u9e8HFmVRX8Mima+aBIK8M
         sH42MoXWVKtbsBfvq5pfJ8YU9yQ8MtTBX9Za+HAXvzkoYizsmvxTeXN8nF2z0wNZlt88
         CACTIrkI/Kucy8GA+Yg6D0ETnWsr7FGYof3ldvR0pahbow7+JkJaC4tVRSPZxqHwI0rx
         Mm3GRGYrkchlRNwOS+g3V8wnb+zO2xX4sSHGWGKqeWXgWM0Bo4Nlx2Vch4oeTSAzcQYQ
         KVHw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHhdzcHL7/rXZY21kn0L7gh/gKZGh65OdQV+pmbrrxgsua6LVWNfA6wpv3gCKsLJ/K6O04sP28aVp@vger.kernel.org
X-Gm-Message-State: AOJu0YxcB3VES+ZvFkheKJ0p6wOMTfTEQlgCh2pYNWviDhDm+rKn2Z0e
	StqdbL7WSvmeRMfZXvxadmVb8TmQunSwaUhhUEpO7rWtkwzMqKXOHeyEgQkjYlIWSXcLSBYzCFj
	PPpIYOVqT/9lAaUrKB0viGOUkjYRGKcbasxXklBHilU41BJmmKfM=
X-Gm-Gg: ASbGncu/4SsP4bQLucz/ltFDqvpFKhUI5fxTyiR0hWnFE6vtjSmKnrIU0nqJaWzMlWO
	i/sv7HqxXaS4FHahZpgEYqJnsVz8WCsIA3CHinRdHAmCABkmEsC1Hqk9zT12KJorY9lz6siExa/
	Ets7K0KaPRe3z/PXJG6ljAOpaYYw==
X-Google-Smtp-Source: AGHT+IEIZJYLChZDkVJzp8GGSso6tmjT/EGUHPEz7J1GeVHCZp3JY3gZqnIFRPcKetE4CFJOoQCHjU6fqzqdaamtiwE=
X-Received: by 2002:a05:6512:158a:b0:549:4de9:c23 with SMTP id
 2adb3069b0e04-549c38f2271mr7000190e87.9.1742303549003; Tue, 18 Mar 2025
 06:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 14:12:17 +0100
X-Gm-Features: AQ5f1JpKtqBl6_xNyjaCM0IP-W12FrKeGTp428YKCDaSR8qMk0mTF6rf_odJg14
Message-ID: <CACRpkdaOv8u1yCLyZs+hKv9h3YDk5PMD=HVpgABMpm=kwO35Sg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default
 to y unconditionally
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 9:06=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Merely enabling compile-testing should not enable additional
> functionality.
>
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

