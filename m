Return-Path: <linux-gpio+bounces-10705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A898D78F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98564283282
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1515E1D043E;
	Wed,  2 Oct 2024 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpyHU7rP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B51D015C
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877047; cv=none; b=kvOpUVGXcFRamqIurL0TUDKeZH1XuMbMwBlI5txbPxJpLAQK9AA91RPK6tZdkwUInu8Z5gLoA5LVYodqsSAW2lkQHqmHEHzrOd5gVRL80dQ1MzhCO+DNHQgkFKxYZIii6Z8TFp4J83/D48V/DmHYR+GJZ/zLR+nXZGshKGfLHzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877047; c=relaxed/simple;
	bh=59H89yVeFtS6tWwbK/cDvB7vPxNqhqsoHH1PKVruKbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNrIyd1w9TdzBNVwYoxU50otEPKXQYkll1JzFEpoMxeleC/hT0f251VEIajgtiK0VFkleTS6NnwcC1Ivh4ljYQy+y1WNqkg44D9Ove4z2nP3JVCEyQu79eBPUJIxCZHdBKdttilom0wnDijJAfgFjqFXEYqxul2MwbTSv0HSlPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpyHU7rP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398a26b64fso5169323e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877044; x=1728481844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59H89yVeFtS6tWwbK/cDvB7vPxNqhqsoHH1PKVruKbE=;
        b=YpyHU7rPiCmw/oYH0aAJ7vraMN+4g0A238lPJi0K7GhJm9jt4/QEzsGUvdL3VNhY0N
         zpJbaPzpGXQX+qq/YZJvDQczrPlCzP17GBl1sq/YUZKmY0WI88/xIt2TH0EBeb5MJLcU
         jHTW64riDZ7kCVITN+GwMIQ0r79cZfX5ZisIVMHOKp3LLYVgpxBWtTy8RfFv5SXMSPAF
         YEQqIp5AK8GBU698WegU6UF9MAwhu8paOxzldduaGmH2OniW1F/oZUkwyPIQQPjDkRUo
         u9UuYzeDuYgwYAXIpM3z4v0hG25TfFL5Rz67NV1xJQrhIf6BrB6UVjmiD4LuQvQW0Tgs
         txeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877044; x=1728481844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59H89yVeFtS6tWwbK/cDvB7vPxNqhqsoHH1PKVruKbE=;
        b=Q7Xe6gn43tOlX7A8vFONKpvo2ZL7q9F9ObSDjw3acNObo5Bt7P5/HoCqCk+iKQHGAF
         hUB8J3OgJHwfNZ1s1ycKq3epMzC/LH2Y3E//RR7zpENQo/0bgV9tVSKhYXnHTidqR+Dy
         txKkbdcQg5zuSpdBs23RDFLkdrShtE001vkhqeYHZLFASai/mvdbFk/8x8AMv9yjllRb
         6/1BuK+ITnD/mwcwZvH5d5e79OOS8yG+eXO0vWg9kfkFpyCwMkciSu81tXyqgNlbDl22
         rzw8T1y5W9bKbABxI9CW61ozXMe8rx7pLXmCXYrxgwQ0J8+Y1BZJZGPAVNaIIFCFHDgn
         VoHA==
X-Gm-Message-State: AOJu0YznfbuTKSEQH8Pf/bkYWhpkZxOtaf9A3abRmol9Er0w+X9ts6R5
	sd2sHmJbigbbWXxesjgCxs2RClVpeCl3rCZasBU10Et2KpfMEHSvh4I6rfo7h4YESJJaT/bo+hT
	Wn5KUOT9nyMG9ezetF8R1KZMT37GO0JDeXacZkA==
X-Google-Smtp-Source: AGHT+IEZcOr6lq+jfK+97Wn6bGTvN/MsUAPJUFZ4JErHiWrxoOLFlE8IkjVw008JZwW/Hotqfl6Jx0DcSbp7Hutlr3g=
X-Received: by 2002:a05:6512:4023:b0:536:7b74:ef50 with SMTP id
 2adb3069b0e04-539a06638d4mr1949487e87.18.1727877044200; Wed, 02 Oct 2024
 06:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001212724.309320-1-rosenp@gmail.com> <20241001212724.309320-2-rosenp@gmail.com>
In-Reply-To: <20241001212724.309320-2-rosenp@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:50:31 +0200
Message-ID: <CACRpkdaQdNgm-ZfQPLOKsDby0K=y+QANQL6viN-XeAC4nokr+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: aw9523: use enable for regulator
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 11:27=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> devm_regulator_get_enable_optional can be used to simplify the logic
> here.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied for v6.13!

Thanks!
Linus Walleij

