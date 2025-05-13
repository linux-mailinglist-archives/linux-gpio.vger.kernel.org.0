Return-Path: <linux-gpio+bounces-20055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA7AB558F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29DBB7AD99B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901FC28E591;
	Tue, 13 May 2025 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUsq8PJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5EF28E570
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141584; cv=none; b=YyscRV43z0CKaBHGRZWT+qC3aAXccfwvzPmHSa7EjQfn/M08KNMu1Gi+g9FAHNzM0b5kwLTStTzwWO5qsVmTAM4rxO64ME0vGrCx1r2cXjjvbHVzNX1c607gzbc+gFExvKX808mQHjbFVJSxL7ExrrcZzyBrdtQNmQp2Ulvl0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141584; c=relaxed/simple;
	bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyeNmVtIEF7duPrpF4zjq9lf7EgDvP/+FYtbwoL2pN76I89pVGbijPvAqIB7DU4kQMOjY3sI966VUf0kjb45vV29QFzMgzivSXAERy35ZJSpHaOYAWtMzNiHZ4nsvtaBNyTlIp67VQicvjSLc7quJzKISeC8MeI7j3rWN7IgpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUsq8PJQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso53660781fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141580; x=1747746380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
        b=yUsq8PJQJj/sgXO3P9eqyIza3hD4o4tyy/vonPiCuHAVop7T8sLy3GN+U2TS4QE9qg
         kX51GpOHDGRaoJ3Hi8o5I0zWkgDAiE6PhUc3cZh2nE66lvi7axv7cjRLDnSzuTf4QKmE
         IW/PQ6MUNVsacGqvgB0yESwGJ1PFF41NXUU+yYWR3h9Xbdo6B+4WlHXjgZGRfSo2Wae9
         uAvQIUgYHfm/RVrPXu7Vjd6iF1lm2A2FWVw6ytFZFLzbIdrfpHNs9AhUMQyEuzJKBOOI
         IcRPCvk5vZHajMWAO5bCTT9aoG1HmHYK4RoX6KyPAqaZN5F3rzERJ8YcIzMH9OVReI0G
         0q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141580; x=1747746380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
        b=NN4GFh9TFHKYrxhxd8tCAr2VzpTq+D7AeAOE7Wtv7YHsHfZzIMUjaiMdP/IsoTTsx9
         ZOxytIpl6s49ikLVusUCsT4fYId/n0DF6SsTFpzCvfY9CaY0cK6N3ba3LUhHnvig6iQS
         0o5v/tdaU4tyOR7n9gbaJleVtid2I/lhJYA34sHdwWVs05AsUvw57fz5HJxLDO/9hZpu
         b4MT7wrjZFiZE6EX3/QEEABo83D5sT3icaZv0+IspogVA4djykO4dpSjRedSlmmlPafc
         Jk3rQcADUAZ1Nr3lKdar1O8m2CFAbDZIU8S0zxYVT7C2hokLDKj8KnIJxxmXP3U3IULf
         pAeA==
X-Gm-Message-State: AOJu0YzqYD9zUJ5kfZ+vDIuElygss+UlyWUcERyrhN98x8wsJ3KlYgiJ
	+bIo8mYKRIKkU4D40Kba77fEdsHkb4ohehfi5IOfLbdHO+mx0BpU4urBaHhhfrz+Vu6df2ic6GW
	4lAOpl/IAtU1YVo1Oy5vHI/TIm9cq7KD3tnnWZQ==
X-Gm-Gg: ASbGncv4sZSbIDAbINXVtKwvbBn/iIeeiBrAKNnzNL0BdV2u6IhOyZcxWM9SfJkeBGE
	WrpPqsOEghT8o6EWeHMNLoNwt85oeE0ppzuYd6UIEkmHZ/Kx7g/bve7WEH0gH3zCGvhtL5Rd4Xt
	v7cNi+cS4TJ3aeMNlEHUYJ2MPosz7bsM15
X-Google-Smtp-Source: AGHT+IFgVxCDXAWbybreCxKR0Wftlb7giGFDaBFjG3lwzRxw7lyKYP8gOF0rnBb55gNe0R92SSktLH2rUh+tT2b0C6w=
X-Received: by 2002:a2e:b8c1:0:b0:31a:4906:fcf6 with SMTP id
 38308e7fff4ca-326c454575fmr70975041fa.6.1747141580265; Tue, 13 May 2025
 06:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507143551.47056-1-brgl@bgdev.pl>
In-Reply-To: <20250507143551.47056-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:06:08 +0200
X-Gm-Features: AX0GCFtfYDDV6M_mfaAuX98JCWZFJqSNYXOqleX0yy9Z5K5Dw1ID6H40dWPGXXo
Message-ID: <CACRpkdY+mnFxfW7zaEx8CAhuS8eaH8SS3N9bm90BUTqAbE5tXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add stubs for OF-specific pinconf functions
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Allow building drivers using these interfaces with COMPILE_TEST enabled
> and OF disabled by providing stub definitions.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072245.OgSXI1hh-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

