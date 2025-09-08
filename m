Return-Path: <linux-gpio+bounces-25745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A75AFB48E85
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 15:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62A883405F6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7C43081B4;
	Mon,  8 Sep 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuIsOTaI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396853054ED
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336658; cv=none; b=pqTSd9Xv4Hq3rRrJInY1l3wvAZBpCdUhxisV+V0fQqYdVXrSBvQKTKZwYwuJla3/AIXtRc5rvEx3d9DdlJctwwCscW0RJ0jRMPe+u6qy1XbO4XwYL+N9NOM0jANW3oV+LGCIIZzxdHtldrv0hkOwvqnZeDb95oc/3DdFqRbqDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336658; c=relaxed/simple;
	bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQlJUX6NOdZIERhRBa/ptVrgJ5hPqaHJ/N3b8kkUA3nSYhonSHScFXj4ddAbBP5IK8IO4RKPBulivUCK/Hf1u9mSOuPpPJETL/3jCdQ8QDqAuo9t8jo0wM0akcRQlpIO2hh1eej6o10TfX8pCmeUEQmLVIc3G93d7lONhEvKF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MuIsOTaI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-56088927dcbso5455227e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336655; x=1757941455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=MuIsOTaIbDk/Ne+m0B/pMslwiNeAYtXtApwjwNMtoj7EeRIGhnv9kWDsPBtIALLZN3
         1U/spYWmvDSR+I0JF7ztWFbre74L11tS6ht7cPlKITrJgpYZ/MgQdA+SWUmlMPoQODMy
         i4WEzp2bWtdzNaH5TIuL6NgDEHNlFpjdvHEdji+PtwJaol+7LOexLI6zorNvwmV5YcnR
         B0z6T8sYtbOJy4MBe8VCOIy5xAZ82Vs1GU8B1g+j7nptIB39uzvBNpVYV9DTn71ZOZGh
         OtXzumWQ/sTKg8rfWCIdQHHvzIoMI9xjToxUx7WSJEHrtzim5425JTlxGAC3hZIELFyw
         NT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336655; x=1757941455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbZwiukwDnHDrFq3wQYLcIHXlTy3luajkiLNTJ9nWiM=;
        b=DHTvsf/PWwXBuH4sxyOVu1izOx1+uD/5R0v2TdOKM9jv8Gi/WrHvQ/nte3OdMxlRZz
         HoeqNnF8YJbxfh+EdEOGdIfvjM8vyqO7vD7sK1JDFlQPJn/sPPuYSeDKDi9yjsy02MFu
         7xJmI85SsGWwRB9bDzN5pgiwLlS7tzJVqwAWIk3z4lF1LKTtL4vsZvq9pxO1gphDsNhk
         GivebddAPSBRcNHjNQbFhFq69kWj5o1doTtDfw1g+pC66H73xCdrGv1Oxh/yWszKwkKA
         rhOtNqNg8AZ8r221I15L7+eojQeGlE0BIKzB0ZlF8f4in+sfAJ1qj22/rR+cIKyQx27f
         V69Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfF3Uc1QA6n/80O1bTFTFleWEZU423JmENk/SJS5rxNOTNSeE22R3CWwQgwd7k68YTA7lyuFJF3XCr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdae8GWVBrb/avvAcdIQt//ggNf6OCsw6gpzfed0TQH+OZS9lf
	1Cgu7xGxlqgvvkXK6JW9R5TgvC7iFyNVM7xD2dWMY9RQx4Gwx7/pKOR1mtjaxhv11WulHFgoYFz
	2kZqxAGtZtkRYgljMouUxYvwG/+b+42TRAMfirBa+vA==
X-Gm-Gg: ASbGncufEr2qbGzI8uwG/PIYptpHUY/LNEsa29Y5Hy9AXOdMIrpAZpX/L7jdNDgdvrE
	4SH0PqKBFNh2MQCml1ZKLPFWdrwCATcj2EEgDEHm947LBuW92NcXq5MzpRC4PGc9xxh3eeDxPBV
	/+uYxvIPHW2kf4CTtoTP/EC0opBTbNyVaT44iaInS6PTgzj3WbKB4ptOUNeImCIvPDe9qW5c/K3
	j4XT7U=
X-Google-Smtp-Source: AGHT+IGg4rogX0hb8M3wkRrCGyxcIS8n1x/nra5mMODdrlIDHhbHVFLHqNZGqHHGv1GU+9Sji/glMKNv4ydxz2WaN08=
X-Received: by 2002:a2e:a78a:0:b0:32c:a097:4140 with SMTP id
 38308e7fff4ca-33b485c2616mr21948241fa.0.1757336655209; Mon, 08 Sep 2025
 06:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 15:04:04 +0200
X-Gm-Features: Ac12FXyaXKE0nskg1RjYMc8Puf3_DYZA9QjaZBlexnTSmjTh-Rk2P6swvJ94zgM
Message-ID: <CACRpkdYYYAeqZZg58-2De-gfJkovYxABssuRk4xrS5SAC5=YQg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 1:37=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
>
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.
>
> Applying this configuration permits correct functionality of any
> externally attached PHY.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied, recorded Benjamins response as Acked-by.

Yours,
Linus Walleij

