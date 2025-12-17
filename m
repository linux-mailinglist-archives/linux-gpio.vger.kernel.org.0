Return-Path: <linux-gpio+bounces-29671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D9CC6BE1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DE853005020
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEA233A9C0;
	Wed, 17 Dec 2025 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCsp1n1i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAA31812F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962828; cv=none; b=eRIE3JhSDXBHvmUn06ca/G8rSTvq3h1679J0nNwZWWR/DM8O/bNzDSSoWiXgvjGX+0yotiEJUujno62qkO1mHaHyoR7HjW4ez6cNGnZs5mkIRQO18Qp0Etr4iXmWQdBExEHr3KD6e4cyT2FS1+o+DN9XU9xkS6snITCGbSBctK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962828; c=relaxed/simple;
	bh=Qi+wA2U5+ViOE1C0jIKH83tbJKpbcAkHo2i5drF4YV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqNVRon+q8mXWhd5ZgXtfc29VdUqzvrOkTlelNCEqIjup1yNzx6OTs8S23+/anZUejTgDBZqKlIr+wRSoV2RH3mcf+yxt40QdYnM1LBg1butc6SOXsoUNHhxRHnxUVJfSpRMmp50Z/gz43Q3zYboCQGGj+Esx1Wm6+G5E8RLN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCsp1n1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2A3C19421
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765962827;
	bh=Qi+wA2U5+ViOE1C0jIKH83tbJKpbcAkHo2i5drF4YV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZCsp1n1itdSE9e1dCSm/uemU8dPCqaeDwHo0vPmiPl+ltqVHr+vLhCbRkAONxC6Uv
	 YJ7LdH1QBz0KKlGgUaUvK3rOuT0K4wNVNy6d66Nseqbe+cRSfmsuUPYJqUfbuHaM8z
	 Ok44olRXfIWjRO6rylWsYx1014+iaOGO53VPY/GHCDKO+4ok5UGUmRbMW7Zi7RYAZl
	 CTI8qp9v1vS/Aqk/9BgS9+1aA+ZJYWo+ldH/ZZbX+GPIEGA+Z4+mczmbugBtH1zxOP
	 QO6UlzaZiZ7+8KVV8+XFWCJ2vs98aiMFXmSDYHyYe0MJI00diKZt/EwEyUUWTvsPxV
	 qLaBRHNJT/mZw==
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4515129b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:13:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVHQdcApPgFQ0LfLEHE6tJaOfM7bJJokDlD1ErLYvWIX8o8mnnKBpK/OCZR0vIWB7TFSIX0JLgros8@vger.kernel.org
X-Gm-Message-State: AOJu0YznC6Evci6DOa8BZibt7jaMZKdm1OZkH2bvpjEJAuVGy197iqj5
	mYTo+Z2mo9HvQPVAWb0ecv817+w49+d95ztyQcxQHpyPDdM7PMEuGM3GPNzimYiYzkFiMEgWINA
	ek2T/Me2/FY/HGg8pkKdu3y6/zRHD0gCCm+OCjQmk3A==
X-Google-Smtp-Source: AGHT+IG0Mw7xxsXgSUf+IV59o95ZmuW34B4U3eE/83AVII9OP5S5km8YkR3xrniF6HHM2hfk1AAOei+FRn/DPbovPwM=
X-Received: by 2002:a05:7022:b902:b0:11b:a36d:a7f7 with SMTP id
 a92af1059eb24-11f34bee7d9mr8255047c88.16.1765962827350; Wed, 17 Dec 2025
 01:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126122219.25729-1-brgl@bgdev.pl>
In-Reply-To: <20251126122219.25729-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 17 Dec 2025 10:13:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeKEHwxJATuqDtdi_yWe_z2es2PYopJEe2AQJ0+L_sq-A@mail.gmail.com>
X-Gm-Features: AQt7F2rH668SPucXCu0A1IPf2nFJh27WRRC_Wxt_SUNWgbX7khvQGJuPNhQBdT4
Message-ID: <CAMRc=MeKEHwxJATuqDtdi_yWe_z2es2PYopJEe2AQJ0+L_sq-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	stable@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 1:22=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The gpio_chip settings in this driver say the controller can't sleep
> but it actually uses a mutex for synchronization. This triggers the
> following BUG():
>

Hi Linus,

Gentle ping for this one.

Bart

