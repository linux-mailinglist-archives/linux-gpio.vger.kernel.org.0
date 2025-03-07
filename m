Return-Path: <linux-gpio+bounces-17252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AAA56943
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 14:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F015C7AA2CB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BB621ABD8;
	Fri,  7 Mar 2025 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0cShVDer"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B16620DD79
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741355137; cv=none; b=Lq9bEIwCjN59RKiBiqEfRjfDR7sSJHksIM+zLrMhrKyykgZcq0jk7yHJ4eB+Z29/fIjCmWYztsU/R92JnSiROo4R7PX/8TNxoPA1GYt/rWFOPgCRouHDh0HcDdo8h8BOhYZVkAawUFN7JvF4jM0O52V8vTiYq8OILXi+uJnTl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741355137; c=relaxed/simple;
	bh=0TFrNUave7u0c/TFcLUTVj6EnbOoF9/okdBtc8ZpfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qi5WOje449UtDpS3YCp1MHw1xTfEQUTktC8dX0mQE0rjZrOS1Ilj2J9M/iKr3vUKeLi99UWiv3aKYvPU6wg3S1g7TWMdapH2WI4CWYKzRpYK7IwnfBgDGqgzcAn+Jd+wodqr0ls7ziyxEoTpZu5Fd+TVBOxicELlUz5t3zZhMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0cShVDer; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso8724621fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Mar 2025 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741355133; x=1741959933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TFrNUave7u0c/TFcLUTVj6EnbOoF9/okdBtc8ZpfRA=;
        b=0cShVDeriLRrwT4wUp+Mr7DxhRumgDMo3z5AUUN/isi08PFbQyVe6kyBpuw1YLA0Oh
         7IQ9T9xR+s+8gtIFA6hHBNJK4f2VBnMnC0248BRwyGv0tPp0Cefrk6x6mwgY9wS2LY7m
         MA7tOU9bPLClp2pYfd+0vP6u4IuS9aJZW9GhQ8FY4P3kC6W9UgVFUEBJFWC0BRi3VrU5
         2H83BfQNVlIZh464+AblSBgJrrmkB3rTDByU+WT02h//DN0DVWppHG/HR0t8U8ppC7sc
         VcbWgTe4RVPr4ghqckOsPA1XLShhPDa+Zvvav445cyerOOvNqrCBL2d3hguLCm8XbQiw
         odqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355133; x=1741959933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TFrNUave7u0c/TFcLUTVj6EnbOoF9/okdBtc8ZpfRA=;
        b=RjiMI7jg2Hv55BC4NRvA3milh2sXwWTVkWQ2cONpCZGGnFDiZrSj5VL4jrsqXVvVaa
         JUM/EQpmNjpp9LEMhREmypGZgxHQQ6J2L7HnoePsvNfrcypKN6Y+WvVdPrqXwQSowpZP
         7px38LCtbNejn8IYdBx6miyFNjsr65YoeaY9Q3WcKw42s68P/rU4wo9PfiaQlkAvqoAF
         j8CnUTRubmL2YfiRyltmBSCRxZLSJs5GB0pJovM+EzDD2Kf8DPIg4LdLDtfMMxMz4ell
         DA6HRL3PDba/LbXzG/+IqrvKvkyR/cs1tpcl668P5Ll5/JagNDbJz65t2RnvpRqQbAV7
         8oOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJk823MwpppZs4rpVKXP4zOrAJpJArRzWV4alZiHtViTxJt44Nh6xe3RWC6psls/Kmurvlpgotfxx+@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhkBY2j0qyuxUV1GBGrIvAKhhiHNW7XeoZK7lh7LHOcVkz6zz
	jQUncoUIv7YEkNiEvdNIYaRbwHJEiE4fFmo5G+pQ4J7OAsKVc8Vaey8fYEKKTCSSd4MEbu9N8ax
	U5CBGgqUUbPVQildhNpEuL7t/4Tr2DV0Y9sq+mA==
X-Gm-Gg: ASbGncsiuf8m8e94gaPFIrPdpK3QrunXg98emHuUZn7dqhJtmwL6DTo+8MDIa5jaZpc
	RSO31bt8hI1qyhBZIlQ+fVQF4WXUHCEifbGd/Vx4eEdAeSI24BRKv2Q3DGSddmZrsXXcwj5NT3e
	lL9pFodphFKCOdoIYvtHCuL8zU7T5WTi17cBNsHurJ08Czl4cZqQiJf13W
X-Google-Smtp-Source: AGHT+IHCHWdcrf+CS34Y1FeHjxgNuNdVmDEgpUXU6Qys+5+tGGxXxtTXUnsy+/28mQy/IygcRJFkYAAqwSVuG2rzZoE=
X-Received: by 2002:a2e:8819:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-30be73f011amr23073541fa.14.1741355133270; Fri, 07 Mar 2025
 05:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741268122.git.Jonathan.Santos@analog.com> <efdbddad734021f38a43cc9d101a22424e71dcef.1741268122.git.Jonathan.Santos@analog.com>
In-Reply-To: <efdbddad734021f38a43cc9d101a22424e71dcef.1741268122.git.Jonathan.Santos@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Mar 2025 14:45:21 +0100
X-Gm-Features: AQ5f1JoTCLJx2G8kFEf7gAq4XDizdZoV-M-jLWjt5ZT4aPIJLHyyF3f0r8-4KBQ
Message-ID: <CAMRc=McTdmgRhzN-tLdxvUXnxRVE7AiFDUJWPnnHC-pnfZc3uA@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] iio: adc: ad7768-1: Add GPIO controller support
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>, lars@metafoo.de, Michael.Hennerich@analog.com, 
	marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org, 
	lgirdwood@gmail.com, broonie@kernel.org, dlechner@baylibre.com, 
	marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:03=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:
>
> From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
>
> The AD7768-1 has the ability to control other local hardware (such as gai=
n
> stages),to power down other blocks in the signal chain, or read local
> status signals over the SPI interface.
>
> Add direct mode conditional locks in the gpio callbacks to prevent regist=
er
> access when the device is in buffered mode.
>
> This change exports the AD7768-1's four gpios and makes them accessible
> at an upper layer.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> Co-developed-by: Jonathan Santos <Jonathan.Santos@analog.com>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

