Return-Path: <linux-gpio+bounces-29220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74DC9E269
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 09:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D690D4E0507
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 08:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071582BE05E;
	Wed,  3 Dec 2025 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="JhJoX1pV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6B29C343
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749426; cv=none; b=QKPVbfr5q96SeTfbh0GvhDfAIqjM96qYj56A1KGlrdAzENEtjstj9UeCrwU1iy+rz9iiK6zeV3ZHIT1d1VdoP37f1TOgb36CQdJkeeH8uvlp0iJ+Urx+SXcGqmhhVQg/wbWA/UZkis9qOR2juPnscoPZUcmxBYmnniuEtlJl+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749426; c=relaxed/simple;
	bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUP6eG6xp2RwGrV1XCG0uGa03V9hBxlXcXNdM+tmeVNh3sHrzIGILlbfWAizN42RoAYBVONsYcK4p+RxjNzKg3w0Qj4on12NC/HMSibYEFuYcpQW8C8AYWd2vHz1Q1mVAzy8IF50+4CA1vTo+s72bFWy+STANuzRXEqYPCbT9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=JhJoX1pV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so6104957a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764749424; x=1765354224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=JhJoX1pVQxbugDb6MhZ63EuMMZr4WjoqIomlGylXmzpn/QX2/n8zu6DEH8r43sOySu
         8lSHfdj1yxcSENvuhvokZ8ej1ulyP4vjjmPggGAnpwbrB2VmwkFg6TqkwHh6PCHRUvBY
         iaAJy6o4WUdyzjpWQ7sFFO7QOlxjESD7BFjoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749424; x=1765354224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=fMEPVwsd4DSpZllNyqR/rNZyt2XiD3bLdpvLGMG2u9BeVAii1dcd04P95O4Vgg4KWP
         GEnDpv6A/hqv7i3SAPCsvQBMdkdKVVHyX9i6PG6iWC0ZtExDMONk4tXhvumN/pAe3igv
         QwSWT2P2f0qxcC7SGNkfsiBpHdLVuap1QRbwGVLKuDlPchmF7Hs7zRmhJwpzzNAmGZvV
         V05qgsz4AaOakt95ei5O+Rkv6Lz1JL51iLRiXHoKNd38mQp0Fl7NmRwmzf/R6DV2wOt2
         7VxYQowmkLlqUgOjMhip1C4pwwPt8a8NZsJUNZPa25jTZ9NAe0a7fojGvWXXJfo6NJ1j
         KayQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd3fWqCdPZQJ7iK7hKdvOuYmYJcAbGh+0tOn7mOvSzpTcR272M0RqdPxzmlbshVMC+CrxF055yWswA@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlPfu/UQTKKiaKPn+pcTQRuUPlX+xZJR+W28pAvzpL2+AbICv
	X8yfBMIOv0N5J4TM8Cg6OPfm40Yt32GILJC4svvr7i1bfjT1cFy6NPQjud44RXJ/ijvkfjFaO2J
	OWrnxctVqlPB/f80IRtrhWVfgIMxy6bYlcjF6CShaHQ==
X-Gm-Gg: ASbGncu9U2FDfQc3T1Ck9LBOb7rb+Y24PlL4qj01R5esGfVv1YT7P9FEAp13bIKoXnB
	RgF2Oj21xQO9zbymnN3w0Mj0I0aqbA2TRGDS18Wxxz1uMbAPnTS9v8vvwlYLIC1pXV3uuYqa97R
	0oiMY/isXcMP9frW+DB1Ag7cQ/ZRA8E8bQ+nYE5lUiOw7eCysSyr6Bl4Scv5IVStdJ8TuXQH+eM
	YomtP5l9vYnHEqTnTJ5NtDPec9f4J9Rs17FW3xjdZH71djMFIhW7VsTJBl17Ui4hnH/L8XP
X-Google-Smtp-Source: AGHT+IEq5y63hfjT8YHjilACNJqyKvg5j+0plLqT3wpsKD5Q7MH1znsyxIQRdeefXp8WZbUY/IfgJtcujn/JnV7uScQ=
X-Received: by 2002:a17:90b:17cc:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-3491284b4d8mr1814924a91.33.1764749424655; Wed, 03 Dec 2025
 00:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-8-jszhang@kernel.org>
In-Reply-To: <20251124002105.25429-8-jszhang@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 3 Dec 2025 17:10:12 +0900
X-Gm-Features: AWmQ_blMivOz7cN3cWbzITo5XCmwfcKVIQTdEzDBywa8v8-CY7hjUyWixRG6J94
Message-ID: <CAFr9PX=zXuaOBoEUGkYjrROK75e_xt6XZQu=mt0zQQNYWn_TYA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gpio: msc313: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jisheng,

Sorry I missed this. This looks fine to me.

On Mon, 24 Nov 2025 at 09:39, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

