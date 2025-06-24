Return-Path: <linux-gpio+bounces-22089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A293AE6F90
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC8727A9EA6
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726CE2E8887;
	Tue, 24 Jun 2025 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VaWXAwSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE61C84D0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793405; cv=none; b=mQU69xwjkoP1e6pDO3luWB8sKHdq20dZz8XGizFaP47pqdo+rgS0px+0D7jm0C/Xn8/ags3DbX9vVWQS85DZsYhdTkoJn1Zt4OYdB82UDhMsHrd+AGtCl0udtU3kgBwGmsxHAWCSfUgMm3+trGET+q0uUcowbDhimgdaVSeCmeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793405; c=relaxed/simple;
	bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFJlbrSmNdYhzrIXt0jHGrkMImg+SdsjoiZcMXURuJAwnF/r9M+MIUb1M0GbWgGXNHyjrplShKc/jzFK7bbnRqu65PWrz+/q6wEYKRxENIJoMGRyuB7HMd2Tc7VHuaECqoiqoqCEbedByNO6zooHIca6DJl4Pr209Soe0lskj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VaWXAwSH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so227264e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793401; x=1751398201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=VaWXAwSHMWTSB8iXs3tNBcPEkyg3Ut9qALJH/2Ic/D/VODoZh0rUy/q39YkyNh23mS
         iWl8+ylBoLSPPXoaIqH9b2oHLZHaNKKH/kw4URcfs9SjCXeRGacvzME7xsH/OvPNS6MN
         5JnMC3ceRISXtsjaCNt++OdGEK3dqRGYRSigNAcCME7fBT7qPaMh/pAZi+l9QWyK189O
         3F9+4w6uf0qIPfq9PfGq74bzOGfRKMhXi4Fvyc8A3dY49UWSil37lDTHdnDyIZpkJePX
         QThexcetNkhUg5z0wTSey5S/fERMP8phgVwL1McntJo+qhi0CKvzZxnhmwV+9mOlnPe8
         otsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793401; x=1751398201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=GgctLcJgIw9b79magsf5ip+A/bIUXzCwDxrGb/nasSujfHWlPI7hlVElVQPnWx5w3U
         U+MZTkLGkRLwzm0zlSNheqtW0Zxs+TdrxExaJaCnQ6dgfJRpyfNvezJ+3hmKvtwsV43Q
         zYXWWiOI8KZ4NdjwjUxXGM9M09L52K4InZ2C113R2+OcKhMC+nsAz6wneCuSbOnHXUSD
         sdkux6eE238njbflD5zJJ60ue/6m7BAV66kxhNMO1s2hhWXG/wGrfH9hoYeGATKBoIlh
         qHD9ere7yb4wmCT5+oOfwwQDqYjsWP8MmNcipeAyDYoBb++FbgXkrlIZnRnH3UtvY8hE
         MFnw==
X-Forwarded-Encrypted: i=1; AJvYcCVK2yXVofqiOP4edjPOrlTTudQ3TUlzocrp3sipwHmTki6gfwwb9lef51OgF5TjjY3nNQu0mqM1pw8Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23McR7PmV/cSJQ8Dtx/dDG/GD+ixlMM4olg3FIT/24wgokIbI
	fwfWGiCsMs5dzh0t08oLlZ0uEFGfvNiaG1kNg+l/JXFSYQB9AUOqjtTz7Th1TeGaJvFnXo6FMdZ
	uK+Z8taHQtRjEBBdkLRKwhw0N8TvleK03+g9MIEOssg==
X-Gm-Gg: ASbGncv1KnxllGoWPQT7tJ4wXBXijYn8XAU/rrt9AkDHOyAJT7KAQRcj/hM9xsVLCMI
	1POCsW9hKeJ2GDkn9UyJnjSNVV/o0DHsWBN23IApj/cW+UQi1Kz4n3dHDLwGuYQ3i2fy/r2pGja
	IjQTPZc3Pe9YTX1RNAHf0z/tDhCDNnfcKlYPIcm32RasI=
X-Google-Smtp-Source: AGHT+IF98ZSPZ/cGMxtHIlOFYXqQCIVwb3pGxoVI1+8dIHaRQQbONGD63qWy0teQhv/zjiwvc80I0VajZL9v8jDE+HY=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1536330e87.9.1750793401366; Tue, 24 Jun 2025
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619022337.43900-1-da@libre.computer>
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:29:49 +0200
X-Gm-Features: AX0GCFsG5W-9LgBD5SxFAUBKe02Az2IUJvG3jsvR1-qxVNZZOZnEgYf3pYYd0gE
Message-ID: <CACRpkdbxLVncSn_=030PiDnbtOc6aBz-Et+5WPSARHj2Gc5Q+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:24=E2=80=AFAM Da Xue <da@libre.computer> wrote:

> g12b and sm1 have additional pwm pinmuxes for b, c, and d
>
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied!

Yours,
Linus Walleij

