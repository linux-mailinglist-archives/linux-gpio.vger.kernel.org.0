Return-Path: <linux-gpio+bounces-30711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40698D39B18
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ED1D30062FB
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 23:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5563312801;
	Sun, 18 Jan 2026 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLxSjRft"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EF3126B3
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768777937; cv=none; b=pfjXeFIfphtlPURTvXUX558y8sEq/m7DDXvIg/k8pQuRs4G7+VfX4uv6b/DOjsvpOdrflHBMr/YQEzXn/0NAaP5e4IsQILiYSLp895VqYjsX63d0qxOfwLqqfBLskfPPdZNa5wn912WbfQqWfC684B3CsMcDHQv2+Yl1dZUVThs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768777937; c=relaxed/simple;
	bh=645y+k1+EbNBg85ixPThkC5ORCws+1oNMdif98ljAm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0hiLNvhlDAAKV1ZEUqVRMaUNxh7V1wxpUl0yNa+xm7ygg3//bVi+N+QQ8f8O4GjVHfDfy702d6JgF/T2V572qC0ttU9dRGbTMWgfjk/X+AZzAWqCnd/DYgpzpBSUW5mOyHlW8zSyBn+jQlRAgMqNZ4aZK4UhnjAwvjm3hHl/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLxSjRft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661B7C2BC86
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768777937;
	bh=645y+k1+EbNBg85ixPThkC5ORCws+1oNMdif98ljAm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XLxSjRftmKFWYyl//lRw1vGcJvL9uDuYOAHuYw2GIwxcqkjt/rtQgtBwI6DCGiDKT
	 3Cdschm2yPFyhPd8ef4KVvinVPHi07zcuS6ggk5Kt0/6U7znRlbJkELD2EK8vDcQGk
	 oU/7zHvXtt6SGhMFjorLYLHCdttRWclKdT5b+N0964QWdCqo5xjnqosgYFkNLGQwn2
	 C18BWzYImITZg1iSN/PqGJENIp0xIgkuZxS7pPsnV/bWj6csYHN4+t6XPvw/BUnWhj
	 tsoT7FP5ypWYxKCbrliB/BUeDkf6oUYgxrgeTws5UT4ZUIG4xVxiTs2Cx9eF6rYyQu
	 oyIut7k0ly0Lg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-790b7b3e594so33603917b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 15:12:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzRjfXBQcxsqBMvjW/JSe2evfE7YCScn1fOaFBs6C/SDZELSCfHQDJYnsJWpGk3Yss5MSiAx+IT2I8@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeVnLEKPU1h+s+CBz3E1NT+16e8iO1tcvcUNDkPSZPeMYviC6
	OsGwLM/L1YvRB0KD9UUgGYQrf85L54CP4QuuDLnhA8o1BtQ0ac1W/b+Nab3YzmyLTxiBI8RuOkC
	fX/JdUIbduIKWqDQ8cuOdOHYI/4ywKeA=
X-Received: by 2002:a05:690c:892:b0:793:c81a:203 with SMTP id
 00721157ae682-793c81a0c7emr64354877b3.33.1768777936727; Sun, 18 Jan 2026
 15:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
 <CAD++jLmP13oeiZJx9_Y4oOCvFbJ=TaU_exHu9qqZjnCR9DGAbA@mail.gmail.com> <1987899.tdWV9SEqCh@jeanmichel-ms7b89>
In-Reply-To: <1987899.tdWV9SEqCh@jeanmichel-ms7b89>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 00:12:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBegkZyKoo2cgtgJt0-8Pn-H2XaAoqipgPp0hTmro+sQ@mail.gmail.com>
X-Gm-Features: AZwV_QhTwB1NZbZr_OKVyQG9DuV8p8qmlXlAJzV2GNwcfvN8PituiBY5wN99ecA
Message-ID: <CAD++jLmBegkZyKoo2cgtgJt0-8Pn-H2XaAoqipgPp0hTmro+sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 6:29=E2=80=AFPM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:

> > Make some fancy - if: clauses to decide the maxItems from the compatibl=
e.
> > Don't hesitate to ask for help if this gets complicated, I get a panic
> > every time I have to deal with it because of the whitespacing business.
>
> Indeed, I was probably a bit optimistic :-).
> What about this:
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mcp23s08
> +              - microchip,mcp23008
> +    then:
> +      properties:
> +        gpio-line-names:
> +          maxItems: 32
> +        pinmux:
> +          properties:
> +            pins:
> +              maxItems: 32
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,mcp23s17
> +              - microchip,mcp23s18
> +              - microchip,mcp23017
> +              - microchip,mcp23018
> +    then:
> +      properties:
> +        gpio-line-names:
> +          maxItems: 128
> +        pinmux:
> +          properties:
> +            pins:
> +              maxItems: 128
> +
>
> This would allow up to 4 chips to be on the same CS.

Hm I don't get it why everything is multiplied by 4 here?

Doesn't each chip have its own instance? And the instance is
limited to 8 or 16 lines/pins?

> But in the
> microchip,mcp23s17 datasheet, it says:
> "Three Hardware Address Pins to Allow Up to Eight Devices On the Bus"

Doesn't each device have its own entry?

Yours,
Linus Walleij

