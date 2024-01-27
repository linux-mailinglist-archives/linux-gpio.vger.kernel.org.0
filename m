Return-Path: <linux-gpio+bounces-2665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3683F254
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786B91F23121
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DB123757;
	Sat, 27 Jan 2024 23:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1U2udtf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9898E2E3E3
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706399646; cv=none; b=FHJ6QCYn+Nudgd7MuKnxxkVFSDKAmGFIARMTGd0+B64tP0XvHwR7Q05jEW2ZTAtbnffWZgSUnhCHUiXs5aT/x0kPh5YSkt2badHrYKsExtb9uq+wnAho9ehIpbNdLErXDB41xmEoT7W/BOz4n2H9C7zeI2jy6waNwjlYYIbmoyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706399646; c=relaxed/simple;
	bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcDw9y2fxvOte14OHIN0FsqHYFZXvwhXd0kKgtlQxaJTy9gwLeDkmTa0EKNDsG/cKzvznjhhNFR23htaYsanFaS5LI7F/vz2KwBzJeb0OMaU7iB1hmX2AyJ02lMrL6/IY9pYRF6ExXaRHZzybVYVyXcpPvpS8NtrLBLiX5peNDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1U2udtf; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc223f3dd5eso1594405276.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 15:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706399643; x=1707004443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=;
        b=q1U2udtft/s4Isz5Zn3g3IL9yfkWOAuflh2/73EjlHTTyihkaJ5uf5Hgw3yfIBhOMN
         SMOsmTCjjdouAmxjudOF649gVO2/mvSSJSiZDZvDdp/Sxcj8X3MbbvpwN+ooIU/8u16y
         xbHcKVm1mb+gHTBndu3wVd1LDnKVAxg/yLkuBkkp/NxyKCroNB/96MiT+GB0w5NkEd6/
         R4SlhnE76UfUlYes4gDBncUP7WdzQxklvNCvflhlxiLPaowrhh7v0VQC8HUl/jo9wdiq
         yT0VuAgj5L/p4VQ1rW7owto5LK63vUejR+Oigf6bbtw1rvHPQoj759sHEYo+qFBqMGfO
         V41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706399643; x=1707004443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=;
        b=kVv46rQB7FlQAeuLqNjrugC8bWtx+Jnz1DnBy1yj8w7iHpLYBSEJxZeYRX4tc86jKT
         KnakvI/cx2aJ7TE2icEDN8uY/HrU20OlyTnCLzORmymPUdFrHkuy16slEiRwSVj+Q1h4
         9wi9iTWBU6E/Dvgwm3Lvihr81GZ2e26tSzvXyzdlpmIYisN9cFJH/kAmD8zArWm5W1ix
         TgZoXbrs6XL7CSVMZjCMcJ00bxK11UOm9vg9APjPBGzoBLejYGwuB85Vfz0hl07boD9v
         YytGvm102X65V2FzK6GlgAQj00WlDj2soN4JNxH+E+WROqH/M8GFkhko2UweUihjRyGe
         Lukw==
X-Gm-Message-State: AOJu0YxVCqrRe0hWHIMe61BhUFFPmjAjhf9MlBWKOzP9/YYxdv2VCeGh
	XVn6OuhCeAzkWVK4LE5ipSIgAbQZ5ReMd59G3J1y7ijHIalJ+VEpD+7d4/hfgsIvmMPHrk1v8iR
	NaUlu01MfUGKawXapZqJ6pYNwP/tKxLUu8qbm5w==
X-Google-Smtp-Source: AGHT+IF0zXLfNk4PL6mSHQar9gAq8/O4dVlhQVJQf7PUlFg1dzZ2dcuXAao/29FrSqyCrxTjdNeAJDQy5A5s37XrG6E=
X-Received: by 2002:a81:ec01:0:b0:602:ab27:3752 with SMTP id
 j1-20020a81ec01000000b00602ab273752mr2698550ywm.33.1706399643680; Sat, 27 Jan
 2024 15:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
In-Reply-To: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:53:52 +0100
Message-ID: <CACRpkdbfeL4AG0EJXyh-Bkaji7=b7MLiH6htEecAwq17Yt7w=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: mt7981: add additional emmc groups
To: Jean Thomas <jean.thomas@wifirst.fr>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 3:56=E2=80=AFPM Jean Thomas <jean.thomas@wifirst.fr=
> wrote:

> Add new emmc groups in the pinctrl driver for the
> MediaTek MT7981 SoC:
> * emmc reset, with pin 15.
> * emmc 4-bit bus-width, with pins 16 to 19, and 24 to 25.
> * emmc 8-bit bus-width, with pins 16 to 25.
>
> The existing emmc_45 group is kept for legacy reasons, even
> if this is the union of emmc_reset and emmc_8 groups.
>
> Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

Only resent patch 2/2?

Anyway: patch applied.

Yours,
Linus Walleij

