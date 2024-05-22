Return-Path: <linux-gpio+bounces-6570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE708CC199
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A321C21C22
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56152823B5;
	Wed, 22 May 2024 12:51:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B34EC7;
	Wed, 22 May 2024 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716382305; cv=none; b=hyB6U5tnTi9v0XFgRiTZLRO5WqscKCCm5q/LVlYXrvxdoTWKQ8aApc+E18Q8AGsoa6+Va1vyM7acMFejC7EgCynHRnEe+3Ws3atmk2Qwwm3yYmu6TFjOQ2+XnRbOJFpi2bl4ncT8meqWEyGNU3KxvVBM01s2LNeCmz8+/TvRPbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716382305; c=relaxed/simple;
	bh=xx7vlOS3eoQRwVtkzrylouSI4VFOYntzau4o1P2SHTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMC2DGNQfDe+Tlc0EFyn+WxPcDncKblQTyQZzR4Nd/PrRLkzL9lu6oW+mFyMaKUeNjzRtNWnYgN8HHkAyHE3ddokpB6PG2OOasUUhzQjeCAMqvVDq+ZCopvngg6UUZ40IlX8tyjPr79iM5i/fXAUs7W1Nos7gC3sBSvyarhi+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df4e40a3cb6so592668276.0;
        Wed, 22 May 2024 05:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382301; x=1716987101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6bXjieqcNyS0/OchHiuO2tjxnibClzMky7Vem1Q5JQ=;
        b=tTwWJP3JGO4jUpqdQ5FYJWnz0imDOsNcb3il/SB0x7eXMNgApWOoEPGEPrXfXhyNv4
         IUcnSDJY3v8KedBXa73lqyt0061FN6W6/zrSMBLhaC9bYdOWr96jPnupvbQF7CTDZTgc
         VBSJSKtRPxgHoNsRXGMLf+WqMjpwZ7hu3URuiIiPU+/Lj5NROlvcWpKE2BLQacaend7s
         Lgd/y7suDIXVdm3jaiVbvavIkXrWldq0220UTobm+yDOyFCZ5t1Q0dIHlyV+01j35p3e
         2h0gyrrV1jwgSEAvXPfqjmslfGm/s2d7Gvv9z8xSctowq7+eINgaBjkjEw7Ph8x8yQDg
         iISQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjlfj2U4idwYs6UXNuCrkoucb3wjS8B/LWUdVmT1b1jfei2Qlu12sTIprLUpAeDct6XX69mdp1ePjTUAPEwcPEjHLxU/yGmRwRyPlVpwYvctlRJzTAjAUtpb8aN4EOcBTFa2Uyrz/lJHKwVqHWm8fndkXc54+1ssYtA3fNUmxWtYRXic45amcYrp6mY1YQ0bSFQWvEjQpCEof4wQixgJ1b/XnOgsQkWQ==
X-Gm-Message-State: AOJu0YzXKwHV0rbwCqa/mHPlSI1WPLk6sytuvFXT2wdmDXSpaxn+GOON
	Dm8GUIk7UIHfty8vR8AWxT7eCINM4das7QQSdcpZ6Mlex1vGQNgmTQMZ7fdu
X-Google-Smtp-Source: AGHT+IG5Qt7KV619CeF21y3L6R4VynGqOpRJ5wx8Ef6AgNzS++rjDlpbioyIDTbDh7vQlSyI+Z69AQ==
X-Received: by 2002:a05:6902:4c4:b0:df4:b3ca:d322 with SMTP id 3f1490d57ef6-df4e0aae398mr1923995276.17.1716382301398;
        Wed, 22 May 2024 05:51:41 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df4ebc02362sm73032276.55.2024.05.22.05.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:51:40 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-622f5a0badcso53731937b3.2;
        Wed, 22 May 2024 05:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKOAuNz/K0oLhNukW7J27q64YWUg/5LekM+w37gCqEd27BX0/mFLOwu+vbkgMrSrcz9PGwYOf70Zi3wwvlRYGlxsRxxbWyTjpx+WtKbA24ovAbQ/SJZWork/LJcEcb0F55g22ADfV892O7IPnm+VBNyh8bAaXZfnMLrAFYyrBwPDuDda+qQJyBE/KEB0AtjPKvRAGAMYXF2QiyoCWy7iE6VRJ5uq+PqA==
X-Received: by 2002:a81:6c10:0:b0:61a:e48c:38b7 with SMTP id
 00721157ae682-627e486570dmr20655057b3.41.1716382300769; Wed, 22 May 2024
 05:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 14:51:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW-0+XbvUpCq_k7qevuDd9Jo46ngDJMMk+CFzw4DwSEA@mail.gmail.com>
Message-ID: <CAMuHMdVW-0+XbvUpCq_k7qevuDd9Jo46ngDJMMk+CFzw4DwSEA@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 configure the slew-rate
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support to configure slew-rate property of the pin.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

