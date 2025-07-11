Return-Path: <linux-gpio+bounces-23170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FEB0231B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 19:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A00D3A6A4A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 17:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A42E2EF64B;
	Fri, 11 Jul 2025 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiPk5+Pn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8A155C97
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752256038; cv=none; b=qxqI9TOuSuxx4Z/9xmSdroVJGD3e5tnWVfOpij1zW24l6Cjhw89Y5VifIYQ/I65DMhb8ZfnQRCmtV/9+p0RB20/FU3MbPlg7sVBXXyRp4Ql26RVeCMHAZhhPcj1Ht/6AiQy2DS2MK2sED2ii9hSppFBjNJ4mIxZyn43GTkcjE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752256038; c=relaxed/simple;
	bh=Kbh5lzG1/MmpNMzFmA7c0uNWesP/syy+KMxcW9SydSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elEpTPgVWa30lRCLRc3JXA09PRraiyec6GvAFlTwSLLryul7nn3iV+vniURQHd36u3+yr/P4s5ZJWMO07J9gPdsN8pKwXxM4B9IppRaeFuJWMfiaMmcXoA59WMLLBKy43BTa+d6ODkV4B4+WD441BWfu29yyMuSiU7ndNEayXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiPk5+Pn; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so21201431fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752256033; x=1752860833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cOfUcs8bO2r/HGvePRD4ra10KW6myCvruW5dIJCDLE=;
        b=CiPk5+PngLXj2NBNsPwvQ9oTfTgBnGQ6kO3w9bWvVlcottVJUrB0GOg/wBAFkIynjz
         sJ4BJdstFjjFEXxjWZ9+PeN6Dk/Xzhpv7FVX/CyUNqR896dQFsvXOTzEmzf770IQtLWN
         5VuVtMxEtvK+KlXbHvtSpkk2MmZX52LYcAwKC3N03HuL3lx4jDd+744FgFLsAGzPcfkW
         rng63J6dJbiYxC+Ctwu0xyIXdO2bXPifH6RLwh8EcrSffTz3rLI73yAouPC59NTdlf68
         IAgGI44ZEzgF6LaURIoBZy8oBVstnzwWbmdiFR1Ou+aHnXwgagvIKQL4ry9Ixf5XAJej
         zwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752256033; x=1752860833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cOfUcs8bO2r/HGvePRD4ra10KW6myCvruW5dIJCDLE=;
        b=ZqBMv4ryRDTwgGVNLSCp866uWEcPGbiFCt8YGL+5lGk/idK6NPua9cYSDjanfsiZRy
         y1bRVE3U17yxEkvlCH4PDlulbbQ5Q51c+TGYvoztdquw+2EujhNQkt2yoYnzivp+h7LH
         Ix8u6KqbiU8SAdwlGZixD3oHCNRFDOX3TAEiSlsalKlKvFr2sVtrfKy0amR4PbzZ66P+
         3JWG6JS01UYXjrIwqYh/arHyxB9rfL6dpGPRSan9GauTmfhsWNiH1m0stDcOqPl24XyE
         kYutVC9Hrd9v5cUketh2juNs2knqZTDYtZ6HfQCqw2YmnzalwNE8zZWAsMwc4nJE1uvM
         j3hA==
X-Gm-Message-State: AOJu0YwN8bK1zNLa+To9ezNVRENwIAf8awc1RZRgdCxfMJi6WiXQVcxc
	3Fbqz2IHo9i9Jy4yKIc1aTOraZ4rkUaFMkvfK2EmPYDFLpv+Kcbwct6kesDn6rz1DZysVlTAB03
	eo/76CQDg0RJ0VVuJRMYvZlaMEg0A/iBZQ+bdZX2sXFOVcXoL52r4
X-Gm-Gg: ASbGnctgm64/cAAJzwfoXZJ3/mA4OOGkmdlDFd8wd7nN29LhN6h6ZE3SVzP1dD6/Qyk
	JlOMkWQF3Zcehfnr2IxlsHqQdYVea8dZwYTlH6q7dOhb+E6sTBbUcci3oao7c28c+cDxrT72lZp
	sBpSKe982rMZ3wULOV2pLnu8agnrQh25KOAd1TVc4FZUNsA1el5g1RUd62mqQPVMc0zjjORvN+j
	+lyWtg=
X-Google-Smtp-Source: AGHT+IE29/tPzCUZgOFnp3M5AVqflNjt3TR6DbBd8FFhQgMpt6TpX5xeioJd9itBxmX3C7MryhgeiBUJZrvf4/FB9ds=
X-Received: by 2002:a05:651c:2205:b0:32c:bc69:e940 with SMTP id
 38308e7fff4ca-33053499dfamr18435051fa.29.1752256033501; Fri, 11 Jul 2025
 10:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1752090472.git.geert+renesas@glider.be>
In-Reply-To: <cover.1752090472.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:47:01 +0200
X-Gm-Features: Ac12FXzXv7_pbXFvCvY5VMYSBH-pyPi7J1iDA0jUPQyzNP6Vv_OpEDAS7DBK7h0
Message-ID: <CACRpkda3kVfChCwzgEiPmA2dDomV3n4zpFPcTNr4Qr-meRdRsA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.17 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 10:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 52161035571cd62be9865039b4be65615860dc=
e0:
>
>   pinctrl: renesas: rzg2l: Validate pins before setting mux function (202=
5-06-19 19:25:20 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.17-tag2
>
> for you to fetch changes up to 7000167796a00d64322dc3ed0c0970e31d481ed6:
>
>   pinctrl: renesas: Simplify PINCTRL_RZV2M logic (2025-07-02 20:16:45 +02=
00)

Pulled in, thanks Geert!

Yours,
Linus Walleij

