Return-Path: <linux-gpio+bounces-6952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325468D4C54
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B58F4B22885
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD2318306E;
	Thu, 30 May 2024 13:13:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750017C9ED;
	Thu, 30 May 2024 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717074826; cv=none; b=sjOACGyaD61LkIlbDzPv8tc/79V2tu7yvhzshaxwart4iDEq8fdBHa7o8Doa66OC8UtQ1mabx9DqackLGquuetXAwCBsZDQvoTjqGiZQEsbU3EHTjR1h0DSZFhP+JxkqJyIu/Qyo0ElbYrXa0MQBKf2R6mJHYWH8QE3WOIiOdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717074826; c=relaxed/simple;
	bh=J0TnULNmCjGi0W3Tfv4zobeVNCY/UF/0qmAcf1XUOY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoHMJlDy65ZbhDYkzQ5dGeOKnQEsup58LQ1dHeeGCl88EWr72qqOMT19fx13RZDCckVJcW2N7MlUHcul+s7b9WdNAKvfvzMCuf2OE9l/O4+6R97N1vug8zOVr7kYKWEB3gVAONEG5BWQD9dSlgAHhaXRk0g/GKLMJNKP0ahs7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62c6dc63880so6221437b3.2;
        Thu, 30 May 2024 06:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074823; x=1717679623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsessgsG3LDyhnHOJmtjAcMau6j+AdsxfuHG+J8Bk10=;
        b=PuetMktEzuZmdKZhfz5YOikc8mKpeK5+ycV0foGOF6E99A1LbbMFd5tZdP4IEBLY5x
         fYRcemwXIOZbI/+r2naYlpa3ZBpggfFUNA5nHbJit14K+cShCVEWwFWzQ8uApQC4jcLG
         AyXDVtQrrjNG9zqoR4uV2XFGqlCUoVYGbwuPOs/r0FCZ1AZuGyumn5uWwFWGCBySJrQb
         rDzaoSXIsjVJ1RUvrxBnp1CmrJkE3NZvCOkKh4AwgxmJCdJbuLXc9pCNykvvsYA9J/Mh
         +UEB6XNygIWyEWfoTCnEJ5Yez4isqswYq+TuSz4uvD5vpw4GHuojwjzf7vOERBZ24ENT
         TXNA==
X-Forwarded-Encrypted: i=1; AJvYcCUxVZqLTFlg2oLlJEJfNWnigS2Grfs6v19vlKZDanCatiQz9RsZHNjZzXHARdsf2mU5Hw8U5weTGq3eToFUCE6FFEovDG1Pj+DsuqqUdbsw1dCpB9punIGXnfytdPhwTCXHe0PxJzHyQsJuvg9Lu59lZkCl4iwLN1Pm2kvwlGIb/3LqswfRvRKJduwxpuhaYjFBC9ZE5/0A0KXWrGPm8D5utBh+fMLEIA==
X-Gm-Message-State: AOJu0YzUMiYw46TK+ziTR0sdPdiQD2nCG6o02ITqykfRdiXAgiF1VQ5U
	kIa43AqStwyHBxHuQeOEWV+Ofmu7VtCsFCQ1fsS+U4OPU5mp/IkLlSfoKY6q
X-Google-Smtp-Source: AGHT+IFrqEpCXksjtGYB37b3rAABx4zaoHtQW3MsmUG8KDmNRgy8R2iw7EmFQjRAJ4TKRkZE2HGKxw==
X-Received: by 2002:a81:b1c9:0:b0:61d:fd3e:8e8f with SMTP id 00721157ae682-62c6bc1252fmr26955707b3.25.1717074822789;
        Thu, 30 May 2024 06:13:42 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56e0b3sm27642687b3.132.2024.05.30.06.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:13:42 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfa59545e0fso836965276.0;
        Thu, 30 May 2024 06:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmW3MDY+b7fzrcu0k9YlnlDjfvyVENpWmbjntusPN5mt1ldpowAXK9fYH0CcD1YNYwTusjKI+CnkTV5HuOBWV0j6yHwqTh+cK0zUq8NPu3zR5+9yqfU0BsZvTRYJsNSP+bZo6L5s/YX5PJ5YPUgUnai6OeJpyvj5xmG+MdVcPp8vIODmAQm1wp97pX/esyrWFbPzms3SC/nzlhnKYnH83nces9NgXA2w==
X-Received: by 2002:a5b:d0e:0:b0:de6:1a66:3e4d with SMTP id
 3f1490d57ef6-dfa5a7cd26amr2767861276.59.1717074821376; Thu, 30 May 2024
 06:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-4-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-4-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:13:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhag176AuWj5YvNjttniPGa_PhnTmkFPWT+o_F4uxMuA@mail.gmail.com>
Message-ID: <CAMuHMdXhag176AuWj5YvNjttniPGa_PhnTmkFPWT+o_F4uxMuA@mail.gmail.com>
Subject: Re: [PATCH 3/9] pinctrl: renesas: rzg2l: Support output enable on RZ/G2L
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:46=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> On the RZ/G2L SoC family, the direction of the Ethernet TXC/TX_CLK
> signal is selectable to support an Ethernet PHY operating in either MII
> or RGMII mode. By default, the signal is configured as an input and MII
> mode is supported. The ETH_MODE register can be modified to configure
> this signal as an output to support RGMII mode.
>
> As this signal is by default an input, and can optionally be switched to
> an output, it maps neatly onto an `output-enable` property in the device
> tree.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

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

