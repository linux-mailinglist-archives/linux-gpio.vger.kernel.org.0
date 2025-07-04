Return-Path: <linux-gpio+bounces-22789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A6AF8B7F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A38760CD5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7EC3074B3;
	Fri,  4 Jul 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZf+qC+t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239D3074A3
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616603; cv=none; b=WsdyMHDjJIojMXKLmsQ1SAbl8skFwloWSGBgY/5Rn2Ccjj88dfmDUqvRVNvXHoUQOcpwvZ7CeInQwyskaLdfFlY8wI1MxbPB/Uk9sMPObEcmDI3mFDhu1Cou9ujT7Ydbawn67HZU9sN2PMolQTgsnCfYieaSViFTCwBqUZTCB6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616603; c=relaxed/simple;
	bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TV5tub+dNufPxLeKm3hiHe3XXQYCZqoVtzklPLg3TDlUVYflefg89KCFJrvBlvmd1bXcLpb9aM2VabhkYD3GcKA3xf5hPwYAfjUiYVcwQYAI/EjOBySaRkOGvLp8TuH8YlzShQ2glCD1/kl0JI/8AzKO+elIQ8+n17pEEj2dM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZf+qC+t; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553d52cb80dso636886e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616600; x=1752221400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
        b=pZf+qC+tdfyz4RuuTVk4mOfcbG7+UO7k4PzwTkaepcRDG48lRpBelA/MMYpthiuuxK
         Po8uLmiOvFJ7HLXNNl/IlPe/ASrRQI7CgO09NpfyKsNTMoPKtoCJxb+STWdeIyPNQ8Mg
         1eln0KcoFh+3UgXWDd/41PitpKMcN0jpN0sIKLzB1aV8sRxcA3ok8msIkk378k9AfGcN
         1QvTpMPh6exKciHlzXlUIoT2zHdUoU+IvMLsRlatmt8PGETF2QyKOv+bn22hh6l0midw
         MD8e7aaiwDld3tfteC78FfkyL1KpEad18obZwB8YdVSU9wP1TKI1hwGLPTL3mNZYwuPZ
         wWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616600; x=1752221400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVTv3A04ZbfNzzCBC3M52V2FsbDet2cE5mKOx3BOEK8=;
        b=u1INeUFPuBtbZYbF0AqHWJNWCdM3aw9s+oaksAgWmXFYHELO7B6vvjrXcqXuDdWbU7
         53BW4eOv9WMvxlzoGgyeqsWcBpRGedUf+5S4pCyspWmXRjtTPHpHilDCMY+9iu0kUGEX
         Ey0KNp8Y0nxBeaIrQe/TID/4hiewXD/vPi872fdhtCKteWvOSoHz8Uzp4nsWaEI3BoEi
         o8YYyXcG2NYP9EjtyzpJ3FJZhjiCp4P36sos6sAUxAZZw5+Vzapicns0eYuoG1G4JTrZ
         XEAyf/u30OxSn3S3vcR3YRT1eiFGeclrzl7nSjUCq1k0ci9EsD4/1Jq0HGWPHuNptWuW
         saCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+OhRkCO8+ae41p3pnVDJNtW7zMLKotgBBfRJlh93ZSt+oEeoS1CwUhL0yE0S1XxdVWjViT+e7aEvs@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMszVuT0W3sGJoxe3loKUPcqCIff3y96Nprdp+3q4ncMMp8fm
	hTZa5i0bCJ9qgXh2JLmcT04OlokaBlDme2js5DhEtCBiZDjCax+ZLneriUWDWdDKQpEXHeHWIeg
	SR0VB//MkzSWpRP96CRIeYydxq5szURUSTx1LoBV/vA==
X-Gm-Gg: ASbGncurcwgy2VHchMjJsQlBqrdr64qBfrb9i1FZyC7j0WFS/37nPX50MLNxqs9i0Om
	TBJNaWxsiqXdToL7xJkKFT6gAz693T2UFJPdyOErs/2S4zO30Uf6ptvmdiUvc4GOA+1+bEqfL6f
	aDr+9BRvAowSEHSl3Rv8QSFihvV+a1Drm0GpRtj2k58js=
X-Google-Smtp-Source: AGHT+IGTpG/0eGIAKP8lBycN3vss409uW+QvILO2grjOoE21AbFlZrVluebK7kmCN2btM6bnR9uZ3ew02rKohEH+QB8=
X-Received: by 2002:a05:6512:3e12:b0:553:243c:c1d3 with SMTP id
 2adb3069b0e04-5564325acacmr726753e87.18.1751616600011; Fri, 04 Jul 2025
 01:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-10-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-10-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:09:49 +0200
X-Gm-Features: Ac12FXzMHgmvCuG-Y0llbY7URG0KwopPOgFzDKxtaQTHuGgn8hiqaDntdlZrfRc
Message-ID: <CACRpkdZTKBErpxwR8Bfz9Mu2osSaNyagVnCc-_e+BXGpayjHpw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] gpio: TODO: remove the task for the sysfs rework
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Remove the completed task tracking the rework of the sysfs interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Maye add a task to delete
default y if GPIO_SYSFS
for the legacy sysfs in a few kernel releases from now, or whatever is
required to
shift people toward the new ABI?

... and then a task to just delete the old sysfs some years after that.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

