Return-Path: <linux-gpio+bounces-7361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C41903CDB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 15:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D516286305
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 13:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9017C9F4;
	Tue, 11 Jun 2024 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIc0qDhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8D17D375
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111655; cv=none; b=M0LBNuGaPQsp10AfrGrJlQi9/+L1TcERoBtCa7+p89D+wvN/dwGjLfFrZcPHS5ieAbBzQmjAmX+VyIXH9nb0/MIQLRh7dwY6z8hSgmsxP0xT90aYzxKwmLv94UnbpAom98TYEvxDQGcNtyNaFrpdd0e+U92Csq2Y48qyuGqlams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111655; c=relaxed/simple;
	bh=S6N9yC288X6gryfChW2ktbFCp196YoFEzJpWyYA5Nyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fP0TzAxiQOz91LyYftv2xOJz6/t2Hs4BMcS3qU6VJ4eCzP1uP/Xozk0TGQldCxriVkU6Rb9/d1453t2KMbOH3q2RH4qSkAWjMDM17DqsCiGyAkDfowAlt2lDj9NHwR+uuN4FMo/PNZG9hyNkM97HMV7bbX90aB11v5kohHytiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIc0qDhp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bbf73f334so3938914e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718111652; x=1718716452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QV5K0Ro3eY4f2QViP69c0fhla1OvAvhf/tnKE0VUbIg=;
        b=RIc0qDhpnHtKZQP9/OLQwYa6G3ehQCNbQLTMyBJrKHprTgFu5wLy/GYsawk5hc8J0p
         a+YNGcNnm818eFB0IyJxelf5lInYbnFm+4oJe4JYiJbBzUyfCQdbInMKKIF4CGrfKiuY
         JNoos/5b9H9udKNp55VxyJYir3b48b9DQwNeu3l0jCYtGEtoKc0V/92Su/WFgAgr2T8Q
         wXxyhdq+Z3uaWqUYceQjXLkb8GRNXWLczVsE+yYx7jCAZQaDFKnlBZYZHG0aIW90D6Rz
         WlpXg4M6J2Ju8FbZGwVkD3QW1bBkqG+WsrJb7UoDdPXl4kPybYg4W7V+gQu3XDG+YlyS
         vK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111652; x=1718716452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QV5K0Ro3eY4f2QViP69c0fhla1OvAvhf/tnKE0VUbIg=;
        b=sXlJz4rHIxqIoLvHreCkjS/jld8Vr1dbyeTXIpC4hSZ0BU3x7g95JUbE48B7YMT6JR
         Y/gMAyeXwCXespynmiy5tRthI4WH+ZewKhL5c0j0rkRdWTo47Dwwc4OA2IO5cbjDE08X
         1Od0H9ZqNgH3prHc2lbbiNKPGbxBso/FclpNGLzEA7cq6YqWeaFWbTDEsaeekzFO2wbc
         0Rp0z+xl1Amm69Yvq6BKEtVl5NVS8mf/j763i6vBT2GyNscVt/5h+Io4rFUeZYlXxWGw
         SILFMlj530M5qMmOwl1iPiBQUrwvpTpT2w7TwjvNngPTuvZt9QM+hOyyK+3IR1gAzy+I
         hyyg==
X-Forwarded-Encrypted: i=1; AJvYcCX7mdlrdz9dsLRqXozQ4ueNqt8N2ktB/VWWwo29BAjjnpfGe49TnslrDMaV4EvS29bFlJFXwSVuYPgsO0s4BT77SflgcRJzPw4nlg==
X-Gm-Message-State: AOJu0YwDWekpxE2Q7shaHnGzwbGmk4T90H/Tkp0sy78uELxE0oc//iIb
	4jUdA2IDk9t4GWEPjRuBsP8QuolO4WUThAGloulCu019/a5aCcifjXD8AwtNv7LvfDL2heHitNa
	6UyWV/7C72jv5F0N+bdFdSlMI03KlhIHCWt7oow==
X-Google-Smtp-Source: AGHT+IF2Jwr6mle3VYNit5lXohZkzWkv9DlMg9O9TILeDdaKuQee+IU2Jv/y1ncE9tDVgUoKH69MUibYVhklRfOIPqo=
X-Received: by 2002:a05:6512:693:b0:52c:85aa:a597 with SMTP id
 2adb3069b0e04-52c85aaa64amr4870009e87.36.1718111652171; Tue, 11 Jun 2024
 06:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Jun 2024 15:14:00 +0200
Message-ID: <CACRpkda9q53s95K5egjvDii1VsEc2E=bJxbeij56RFZ5=cS4uA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Configure GbEth for RGMII on RZ/G2L family
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 1:32=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:

> For devices in the RZ/G2L family, we have so far relied on U-Boot
> correctly configuring the Ethernet interfaces in RGMII mode with
> PVDD=3D1.8V before the kernel is booted. Instead, the required
> configuration should be described in the device tree and activated
> within the pinctrl driver.
>
> Changes v1-v2:
>   * Rebased on next-20240611.
>   * Changed the approach taken in the pinctrl patches to be compatible
>     with changes made by Prabhakar for RZ/V2H support. I haven't picked
>     up Reviewed-by tags on these patches as they've changed a lot.
>   * Clarified that patch 6/9 also affects RZ/Five.
>   * No major changes to the dts patches so I've picked up Geert's
>     Reviewed-by tags for these.

LGTM
Acked-by: Linus Walleij <linus.walleij@linaro.org>

But I expect Geert to pick up the patches and send me a pull request when
he's pleased with this.

Yours,
Linus Walleij

