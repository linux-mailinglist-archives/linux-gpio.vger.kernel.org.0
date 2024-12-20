Return-Path: <linux-gpio+bounces-14068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 100259F9255
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D3A1897FB5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DCB21570F;
	Fri, 20 Dec 2024 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGatS6/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE212153C1
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698243; cv=none; b=UL1VNl4U/dKq3rQsfG+s1NYP1jx6QQWD4eQ5r2f3oK+qTwGKpfeQsfm2w7izlzvEEdnTx3aMWrM/ZGVl6MOJwNR/iNJFRMOfZvt0xxox7pNyKMf3htsx6Oe75PaWb0mo1fDxZu1xKLqb7EWNIuhCsMV1VQPVPCutx4rZh0Bgr3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698243; c=relaxed/simple;
	bh=F56erWhyzemwHU8vw/akXQlfDRYduu5pGi0XwRecqdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mr6sSKd7gwAy4+ni5c2oWyHtcw5tglnJOD2PHUWf/tOww5ulGw+djQqXN6/uEZvPOx+3Yk3Sa9LYvUGhgy/deeW+YpaFGO/SMrLIkj4lczjuKSGV4iNqWEoyB943b51w1McBDFdd3KiqmF257dnh4AWXaTN6PNMBTku8JJrKVW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGatS6/z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f757134cdso1932391e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698240; x=1735303040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F56erWhyzemwHU8vw/akXQlfDRYduu5pGi0XwRecqdY=;
        b=kGatS6/zOixtfd5qVNYGqMomp/s9w/vp6YtYOfHP5BjYtUGJbhCAkWBX6wj+p6jAPk
         6rL/YKZHUsu5ApE5Nm0HOnmIi0gRdBlEyt3WZ8KT9Pl54f2n0GHWfIcfCI98vi2mcBe+
         nrXab17j/dGe/CkzHr+vPGsn1DBWbQXKn63+gTl3hvZbmSzFW4/I/fG4DsY4G3t1ITl8
         gjNCrKIbyjszx0QMoH8GYAJIfzFHF/u96x6SMTrvPRlpSswWu3Bis0wc4IA8ftYOJF6m
         dOkkZkkwyAV2R94HyGHEqY4+RcPBCstIz703fJA139dl6p30BDKYF8MmLmpqgK/7Nlft
         r4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698240; x=1735303040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F56erWhyzemwHU8vw/akXQlfDRYduu5pGi0XwRecqdY=;
        b=fgyilTooYAwOP9fnxgvw3tSF8x0N41au0RupSvdc8XD0p42kgbIntrQWcZ01If0Uml
         /DOtvfdwJ0h2af0y/wfc4FgnyQkIofSbbcOmvzfwKVuM4mv7Ir5Wr2P+PmLqgXqa8qyz
         c5Av7ut9LYSdirTwUYtcoPrp+1tkcR1axZGn6Hrkyi0UOp1JMbKuAN/3WsEIRPK1WGHj
         /LRt2PJSJ8hfetnt0E0Od0wTgaTxYMBJDhfsNJpPL7XS+NvIXAPdXGybDa86BV3Wl0Iy
         0IDqFGtnR+UexYegmuQwQELOjzvhlg1fTKfnr/e2fntLQq0RoZf1GQfaoL64V7WOXcCs
         xdtw==
X-Forwarded-Encrypted: i=1; AJvYcCXgEzPVevpkUCmhrmuIQTmgYux449H+7RQZqp1qfAvC6svAWO/FSHgMfforFZOsk+uRUyMr0hZo9iAf@vger.kernel.org
X-Gm-Message-State: AOJu0YxpI/wNG7mgeO/5iZG0GoQN2BlvYvC41d2nod2oXhTe6focUtzB
	MKPI5891vkC6soXowmZZqAytuPwDSAbUl2Nz90dx2Nt8uLr3ZgYqumA2bSnKBPehJqfaPAPifq3
	qWzxUMEhW1S1Pt8O+M179zqw2MGFizsi8V9F4Ag==
X-Gm-Gg: ASbGnctTVMqAlj4LZnsBYdJfVViEsUufiLnsFz7NngOQPF7j/GU/SusmG1Nlt0un2Zk
	RBJQ22ZgXS8gb/0XRxnwc5M6z/ZIsklavbhL/KA==
X-Google-Smtp-Source: AGHT+IHCp3W+M7sJT1L+srRuX0Kp4s+0LXjvWsOz+ghi2I0EQRAFYWZCvKRhKOOaG7HRie6PeLlFXjjEC+YmGTT3AxE=
X-Received: by 2002:a05:6512:2342:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-54229562ab7mr813268e87.35.1734698240348; Fri, 20 Dec 2024
 04:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com> <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
In-Reply-To: <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:37:09 +0100
Message-ID: <CACRpkdZjda+ox80cycj6XY385H3=LeWps_W4uMdfStnf9oRkfw@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
To: patchwork-bot+linux-riscv@kernel.org
Cc: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, linux-riscv@lists.infradead.org, 
	dlemoal@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:32=E2=80=AFPM <patchwork-bot+linux-riscv@kernel.=
org> wrote:

> This patch was applied to riscv/linux.git (fixes)
> by Linus Walleij <linus.walleij@linaro.org>:

No I did not.

I applied to to my own git.

Yours,
Linus Walleij

