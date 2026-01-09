Return-Path: <linux-gpio+bounces-30316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F85D08368
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 10:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 639F53024EF7
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C99233343F;
	Fri,  9 Jan 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VD2XVB8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D369333445
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951109; cv=none; b=RtLoMBInym+ZPOqfoYQCxhp5jW4b/B6V/Nj0IApUWXJMMqJPvFcFnvhnydodxi6WkCVMAE78ctlcyCcqQkY2APpdpVRyiq/Ag2rm0LmOJRRcCV292s9rpKAH/9GoeZVqSF3aL9IOwHo5i0HQRniR+m3LPXQGJ+MC9w6IbjkL3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951109; c=relaxed/simple;
	bh=i8VIBeC6YWBmPy5MPPpmcXKww7Ylkwuah6DNxd1sOv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTT0ipNtQHjM517bOFtHsm36pfPT22arEPueKKu0ngJzwMkj0nUv0LEngizGdjzyWfLmSK/jEuMQzX4ITRO3n0KIgeoftBSR5MaSuqZSePVHeW5Nv6cJytGPuSOI1V/zACWlFH30TS3j7qawJ3qHC6os1sr5QBeo3Tc3A1Pa9BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VD2XVB8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADB4C4AF09
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951108;
	bh=i8VIBeC6YWBmPy5MPPpmcXKww7Ylkwuah6DNxd1sOv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VD2XVB8gR77YjmtGc7SYxPku1BqTWNGM1CoCwkmQHN/NQy6b9hlPLQMJTswbWUCbj
	 rj4MKJVzlHyWB5HgZnVSYLZpzYJ6zTBDvgH9B4sV0xEVbsK9c74g76WdNb1yxdUgAO
	 JmFeKLIpTgIy579tAbdzHPSwIfIvy8mFxzqcKNmVotcGHUPF/Ffi/ZYO4CzLn+EjQw
	 Ka1uFED/cTCLrWqToD+WUhUsB3JeYogC9buAb1rtcWaeL8ymPrchihNIyQwpesk1/M
	 kZ2xdE+6/m1Da2Ok6l48fQYmT0k8eHIttIEdjLUeTfDyawtV+wCptR4BcKMA6849z0
	 tZXJBxDQzB6uA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78f89501423so31780357b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 01:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV99PrLASEqCBHiHwpswE8RfButh8NNZQS0UZPprQk6AymbsxjBvVfsnapPLk7AEWzwGFov7bwZjCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUcudFNYygqTQkmlmt5BHCbMQwYM/7UGGuWOtDsfld45u4E54H
	AMNzlV9/kRr9ra8iZ4UqSaA0RN3k8X4jhH1dW2Mo2M93aky8TXJ7IUj+D91wu4+YiV1/LXmv5iJ
	AOERG3Gbdh6eyWulpV/UrkeSHPC977u8=
X-Google-Smtp-Source: AGHT+IEVxRShfaHD0ACu5gHbuU5njT0IbHJwXmzpDS9YK4ozZXnCMvqtMD62DrL8ET32u79jZQhbNPBVY7hyz2kavQg=
X-Received: by 2002:a05:690e:130c:b0:646:5127:a024 with SMTP id
 956f58d0204a3-6470d24397bmr10185146d50.7.1767951108033; Fri, 09 Jan 2026
 01:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
X-Gm-Features: AZwV_QgAZ0_KDvNKwjEgDlRuSPhE9oJseVMZ4hVMx_2EzdTWDrNwZVkeejwtld8
Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 9:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> We currently only build these drivers on ARM but there's nothing that
> should stop us from building it with allmodconfig on other
> architectures. Extend the build coverage for all meson drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for Linux v7.0!

Yours,
Linus Walleij

