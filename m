Return-Path: <linux-gpio+bounces-11048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4349994EAF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8C41F25B3B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBBC1DEFC8;
	Tue,  8 Oct 2024 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2b1n+AYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E06718C333
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393606; cv=none; b=n8t1QXXQalueopFCoijN7snkW1Ljjt7uRRAvvl4JkFWFzuVFCiY+uWct+Ax29KfRPd67Zny61NAQv0nXcR3gCb5byq7ocn9Nh9peztC8po6n5qsOh30ixTaqgcu+1ARtsDkIDt5bUKfpKK0Jc/WBiiv0U0YmqpCFMsRAEp4j81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393606; c=relaxed/simple;
	bh=eoNpStk7Ov080yk91F6V4hk3IJl16PHXgAMZbVEn0iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyhQMGJNfvZn3OG+wmYqneeQu4yNJD4NiJhnfu/s/pR87VOBTgfVapL56EfsYJBi3QNsE2UwSQukxfn4Ia92u+BR10GgXpBhcPH0/6HmARuJf/VNeostYIEG8uxBlsdV8BUOpi5Ir9LPaU2i9GS/V7t3xXEJDw5IRoB5y24v2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2b1n+AYg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac63abf63so54623401fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393603; x=1728998403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoNpStk7Ov080yk91F6V4hk3IJl16PHXgAMZbVEn0iM=;
        b=2b1n+AYgarXFNI154diOGhbungoVKNvTWNeknKx/+b23eghdjZW98RzoBP2cCu5r0r
         FmirdpPuJvtCshGKvkPRpmgrjCY1IU8/W/4fKJVp1KepRZQl2Segbo/PhQkb2KdhdiE0
         5sViho+TvZ139ZyldhoPz/rox9sT291XP9ghXtMBS8YLy96Pu3Q++e9zsoHG0VaMz3On
         KQMIv4EoWk+1RdeDDSG8am84vF/YNluwdRz/e23T03dFASQhtuNu5LpaSRXLn5yVP8U7
         Bf9rhff3Tvi9Jk6g4uAns15lt0EDQneUYYgcO+12cApqN9oqX+DG603Y+o7JM32jQiwO
         l51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393603; x=1728998403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoNpStk7Ov080yk91F6V4hk3IJl16PHXgAMZbVEn0iM=;
        b=onmPIbOJjOyLiffDBPcLdQU4eqpMcwGTGH/+wRkibWieZHYaq/siFlp6NFO8dattSc
         Hcx9uoK3szVOgJ6dNZ7aHxnw7RW1EpVK6P9sgG2wlRl1X4nZTrilM1975HfxJKra4IPP
         za7LQhSKHPV0XwlZ3bfvwdn3BbYn0/dIlqphlB4353XHrKjl2BPbiTTTesvCcepgzsGP
         JIVoB4YttJggsdLpbMxUvz/3WPXQRakedRyWpFSVUyFNRzDHARSAL0pifJaVVqZe7gQw
         t+2LtvsIQPogEdWC6tfXetvDxgmhPej7coqrG6YscxatCEY0QnY0mjxIzIobKn9KhqG0
         Jf7A==
X-Gm-Message-State: AOJu0Yw1kzVVouHoAs8+OCFFy7MpJszXtmCwarIQ4FkBoRMymQP2ICbJ
	IxxyNIydMPKxtXlCfpzadbCDeZkDH4npRojZze/XAiV3yei7/xKe9iEu1eNUZGtCHmcpc2ae7fU
	igAJSil4X+jTsF4OcsnhzVIJvStTOxT7wnG3DNwYF/jMaX47E
X-Google-Smtp-Source: AGHT+IFkrijWSKMWJMdrwQM+10EQEcCeT+xI5hU+vTWffRYNYMPLpHx/294r3ZYgu/gSM1YjKX8dVV8Ft1j7PPuP0jQ=
X-Received: by 2002:a05:651c:b22:b0:2fa:be5c:8ae8 with SMTP id
 38308e7fff4ca-2faf3d89badmr65395331fa.41.1728393603118; Tue, 08 Oct 2024
 06:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-10-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-10-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:19:52 +0200
Message-ID: <CAMRc=McsfXn2yoPoRdSOH_rFuZZ0LRZSuY8S55QfOM6nE2ZOmA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 10/22] bindings: python: convert lines to
 offsets in LineRequest
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Remove `_check_line_name` in favor of a new function, `_line_to_offset`,
> that converts a line reference to an offset.
>
> This new function helps narrow types and simplifies the iteration logic
> that is used to build objects to interface with `_ext.Request`.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

Looks good.

Bart

