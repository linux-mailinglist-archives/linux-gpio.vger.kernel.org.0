Return-Path: <linux-gpio+bounces-10843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F299036D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 15:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF72E1C21057
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBC820FAB0;
	Fri,  4 Oct 2024 13:04:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCF157494;
	Fri,  4 Oct 2024 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728047089; cv=none; b=GBYcqgZetEBrdJG1LhXTDCYDHg4+h8G/vZ1If37aqH7wyJxKwvcBQYSnNMeFEyawroZjMtHyebRIkBuCJbZnnfksKaKM5hbMay1XCbH6DV2Lcq3/wxPqaD7/vq545Zjki9zALNfmhYN2W5udJieaEjDrJ3hgElgqRZW+Ycmd8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728047089; c=relaxed/simple;
	bh=QdQmrZm7ty9NtOo3apEXaRMY4IeNfNBJqs1EKlHsObM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNOugKUArHmjqFMwdILEeRIky41SIMwhfEV/hji6BzMesuSEQN5ee+WohHv6IMX2MbpvRSMcL4d0nbil9bihn+dv/bDF8cdPByvKIZDH6sgmwS+oAKZEofdbMNomBSu+qip5gPEzpk7HCw0J7vLf0ZMLLg992yDg9ODk7D01ais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2b9e945b9so15794817b3.0;
        Fri, 04 Oct 2024 06:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047086; x=1728651886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruv3nAghpejgQO903vPRqxuDL21r+6DHIyGybH2hS5Y=;
        b=OnHu/emV9lFMvzyXaXf982lhKHZNw1qvkeozTq7rJPW6e/Ro3O9W9i3dc+jN6OAVdI
         F9rPiYOv+GG8R7QjR8K7+KT0T9axQj3ZUwggGVqGQRD/x/Fyw8ATJX+XlbPm32MeRNif
         Rnlhe3MAHjtvHmEoKYoR8dB4aes3L3Qzgyj79lJYc1PUwwl9GotYuQJEZzC3qwoczJX+
         +h+ko/k7oy8GzLDHRYzjsT4Yt0pHsHwcAv49Ih5vGK04Fni4Endw04dqFPspBKQkBVUN
         p7j/9b3bF4ollAOJTZ7e8SLZb7rHzYyH6N9bZZjsAb5HKzb8is0COB7An3xHzTZfzyYU
         V3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV0rwhg4qtpY3oXiS2h8LmZqdJRZmYMQWTCSfFG99Vd6WvT6mnYfPYRpg3XUKcd9/caGqmmHmIkM3m4kZE6l15/LcI=@vger.kernel.org, AJvYcCVSpXIxxRRqwkPjN2qsZAEqRZL9rGNEjjw+5qqY+2jQXjEabz3BnIzj71tqYyfQC23fBunjt99+bwpZyQ==@vger.kernel.org, AJvYcCWmAZJ4sXN/XZLEhdaMSuGsFcpOaYYLjxoJVlS2YArcFph7CAd99NPtw8lhGysBxsSkw5eUTZ90LRWNylnK@vger.kernel.org, AJvYcCWt6zFUimwSd3h8tfA4YcthYpLUtdb9NlzG5R7xCz5RcIg2aqKiOSWlz04QZXrhSGR7wOOTs+DMU4bx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gnXD1KdwNqbfbwKRY1zES0G48x2um23RPm8XtSjZYJeJbBYu
	6bH0Cu3131tj7eVnELpx3ribyG9rXg6Imp2idsPcgUj9cHVWTkKgS44Mdp9u
X-Google-Smtp-Source: AGHT+IHeBegiMa3kc2BX0hxuJpZdwpgZ3fL2GPCvaRce1CTnp8xJB7w+v5P/xs8IIn43YCO07WIUoA==
X-Received: by 2002:a05:690c:6610:b0:6e2:a962:d80f with SMTP id 00721157ae682-6e2c6fcb63emr23079957b3.8.1728047085955;
        Fri, 04 Oct 2024 06:04:45 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcfb3683sm6212807b3.126.2024.10.04.06.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:04:45 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2772f7df9so17457017b3.2;
        Fri, 04 Oct 2024 06:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULl1kcEYAmGisXnUyjn9JAy8tMYFepPMFqymIcIutnmlAz1lIGbBvLsj8RvDtjmYptQuvbwhQFj3Pr3w==@vger.kernel.org, AJvYcCUWTXSH+SVMdcUQFcTh5CfQtnLHOsgKviPRavUoIHatzTKIbX8ryl8Qv3vXyutD1ncejJlhSTIZ2oO68MhlSDfW/rw=@vger.kernel.org, AJvYcCVz7EkrM1dOE3/IFBTqUoBBqsr2KrTtTGIadYoOTW34quzKdeke8nIaJPPU7GEyujqUdRlrnjDcZkMFp1kJ@vger.kernel.org, AJvYcCWFdsMg9332B3FQtfGTcWD1TZcGnLbwADjHhAe4n6rfXMKlj+jpaWuXKYvx3hmsvj37sYuYqoJZRZV7@vger.kernel.org
X-Received: by 2002:a05:690c:2a93:b0:6af:eaaf:2527 with SMTP id
 00721157ae682-6e2c7024d93mr17581667b3.18.1728047084814; Fri, 04 Oct 2024
 06:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241004123658.764557-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241004123658.764557-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2MXE3XhRQuSxX1Du0Tu4d2ucigfZopVBJZ7tJL8mcVQ@mail.gmail.com>
Message-ID: <CAMuHMdV2MXE3XhRQuSxX1Du0Tu4d2ucigfZopVBJZ7tJL8mcVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 schmitt and open drain properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}=
'
> , 'drive-open-drain' and 'drive-push-pull' of multiplexed pins. Update th=
e
> binding documentation to include these properties.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi Rob,
> I have dropped your Ack from v1 as I have updated the commit message and
> included `drive-push-pull` property in v2.
>
> Cheers, Prabhakar
>
> v1->v2
> - Added `drive-push-pull` property

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.13.

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

